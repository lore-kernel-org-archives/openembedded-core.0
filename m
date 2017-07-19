Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6552E78226
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:07:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 03:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,380,1496127600"; d="scan'208";a="994656331"
Received: from gsena-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.48.213])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 03:07:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 12:07:18 +0200
Message-Id: <41b36023d1b827c1a44d085d41b377eac20191bd.1500458777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500458777.git.paul.eggleton@linux.intel.com>
References: <cover.1500458777.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] recipetool: create: reimplement fetching with normal fetch/unpack tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jul 2017 10:07:33 -0000

Now that we have the ability to run the tasks in a more standard context
through tinfoil, change recipetool's fetching code to use that to fetch
files using it. This has the major advantage that any dependencies of
do_fetch and do_unpack (e.g. for subversion or npm) will be handled
automatically. This also has the beneficial side-effect of fixing a
recent regression that prevented this fetch operation from working with
memory resident bitbake.

Fixes [YOCTO #11710].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 171 +++++++++++++++++++++++++++++++++------
 1 file changed, 147 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4e965e4..b94b2cf 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -28,6 +28,11 @@ from urllib.parse import urlparse, urldefrag, urlsplit
 from recipetool.utils import ensure_npm
 import hashlib
 import bb.fetch2
+import random
+import string
+import tempfile
+import shutil
+
 logger = logging.getLogger('recipetool')
 
 tinfoil = None
@@ -407,10 +412,130 @@ def is_package(url):
         return True
     return False
 
+class FetchUrlFailure(Exception):
+    def __init__(self, url):
+        self.url = url
+    def __str__(self):
+        return "Failed to fetch URL %s" % self.url
+
+def get_temp_recipe_dir():
+    # This is a little bit hacky but we need to find a place where we can put
+    # the recipe so that bitbake can find it. We're going to delete it at the
+    # end so it doesn't really matter where we put it.
+    bbfiles = tinfoil.config_data.getVar('BBFILES').split()
+    fetchrecipedir = None
+    for pth in bbfiles:
+        if pth.endswith('.bb'):
+            pthdir = os.path.dirname(pth)
+            if os.access(os.path.dirname(os.path.dirname(pthdir)), os.W_OK):
+                fetchrecipedir = pthdir.replace('*', 'recipetool')
+                if pthdir.endswith('workspace/recipes/*'):
+                    # Prefer the workspace
+                    break
+    return fetchrecipedir
+
+def fetch_url(srcuri, srcrev, destdir, preserve_tmp=False):
+    """
+    Fetch the specified URL using normal do_fetch and do_unpack tasks, i.e.
+    any dependencies that need to be satisfied in order to support the fetch
+    operation will be taken care of
+    """
+    # FIXME find a better home for this
+
+    checksums = {}
+    fetchrecipepn = None
+
+    # We need to put our temp directory under ${BASE_WORKDIR} otherwise
+    # we may have problems with the recipe-specific sysroot population
+    tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
+    bb.utils.mkdirhier(tmpparent)
+    tmpdir = tempfile.mkdtemp(prefix='recipetool-', dir=tmpparent)
+    try:
+        tmpworkdir = os.path.join(tmpdir, 'work')
+        logger.debug('fetch_url: temp dir is %s' % tmpdir)
+
+        fetchrecipedir = get_temp_recipe_dir()
+        if not fetchrecipedir:
+            logger.error('Searched BBFILES but unable to find a writeable place to put temporary recipe')
+            sys.exit(1)
+        fetchrecipe = None
+        bb.utils.mkdirhier(fetchrecipedir)
+        try:
+            # Generate a dummy recipe so we can follow more or less normal paths
+            # for do_fetch and do_unpack
+            # I'd use tempfile functions here but underscores can be produced by that and those
+            # aren't allowed in recipe file names except to separate the version
+            rndstring = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))
+            fetchrecipe = os.path.join(fetchrecipedir, 'tmp-recipetool-%s.bb' % rndstring)
+            fetchrecipepn = os.path.splitext(os.path.basename(fetchrecipe))[0]
+            logger.debug('Generating initial recipe %s for fetching' % fetchrecipe)
+            with open(fetchrecipe, 'w') as f:
+                # We don't want to have to specify LIC_FILES_CHKSUM
+                f.write('LICENSE = "CLOSED"\n')
+                # We don't need the cross-compiler
+                f.write('INHIBIT_DEFAULT_DEPS = "1"\n')
+                # We don't have the checksums yet so we can't require them
+                f.write('BB_STRICT_CHECKSUM = "ignore"\n')
+                f.write('SRC_URI = "%s"\n' % srcuri)
+                f.write('SRCREV = "%s"\n' % srcrev)
+                f.write('WORKDIR = "%s"\n' % tmpworkdir)
+                # Set S out of the way so it doesn't get created under the workdir
+                f.write('S = "%s"\n' % os.path.join(tmpdir, 'emptysrc'))
+
+            logger.info('Fetching %s...' % srcuri)
+
+            # FIXME this is too noisy at the moment
+
+            # Parse recipes so our new recipe gets picked up
+            tinfoil.parse_recipes()
+
+            def eventhandler(event):
+                if isinstance(event, bb.fetch2.MissingChecksumEvent):
+                    checksums.update(event.checksums)
+                    return True
+                return False
+
+            # Run the fetch + unpack tasks
+            res = tinfoil.build_targets(fetchrecipepn,
+                                        'do_unpack',
+                                        handle_events=True,
+                                        extra_events=['bb.fetch2.MissingChecksumEvent'],
+                                        event_callback=eventhandler)
+            if not res:
+                raise FetchUrlFailure(srcuri)
+
+            # Remove unneeded directories
+            rd = tinfoil.parse_recipe(fetchrecipepn)
+            if rd:
+                pathvars = ['T', 'RECIPE_SYSROOT', 'RECIPE_SYSROOT_NATIVE']
+                for pathvar in pathvars:
+                    path = rd.getVar(pathvar)
+                    shutil.rmtree(path)
+        finally:
+            if fetchrecipe:
+                try:
+                    os.remove(fetchrecipe)
+                except FileNotFoundError:
+                    pass
+            try:
+                os.rmdir(fetchrecipedir)
+            except OSError as e:
+                import errno
+                if e.errno != errno.ENOTEMPTY:
+                    raise
+
+        shutil.move(tmpworkdir, destdir)
+
+    finally:
+        if not preserve_tmp:
+            shutil.rmtree(tmpdir)
+            tmpdir = None
+
+    return checksums, tmpdir
+
+
 def create_recipe(args):
     import bb.process
-    import tempfile
-    import shutil
     import oe.recipeutils
 
     pkgarch = ""
@@ -418,7 +543,7 @@ def create_recipe(args):
         pkgarch = "${MACHINE_ARCH}"
 
     extravalues = {}
-    checksums = (None, None)
+    checksums = {}
     tempsrc = ''
     source = args.source
     srcsubdir = ''
@@ -440,24 +565,25 @@ def create_recipe(args):
         if res:
             srcrev = res.group(1)
             srcuri = rev_re.sub('', srcuri)
-        tempsrc = tempfile.mkdtemp(prefix='recipetool-')
-        srctree = tempsrc
-        d = bb.data.createCopy(tinfoil.config_data)
-        if fetchuri.startswith('npm://'):
-            # Check if npm is available
-            npm_bindir = ensure_npm(tinfoil)
-            if not npm_bindir:
-                sys.exit(14)
-            d.prependVar('PATH', '%s:' % npm_bindir)
-        logger.info('Fetching %s...' % srcuri)
+
+        tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
+        bb.utils.mkdirhier(tmpparent)
+        tempsrc = tempfile.mkdtemp(prefix='recipetool-', dir=tmpparent)
+        srctree = os.path.join(tempsrc, 'source')
+
         try:
-            checksums = scriptutils.fetch_uri(d, fetchuri, srctree, srcrev)
-        except bb.fetch2.BBFetchException as e:
-            logger.error(str(e).rstrip())
+            checksums, ftmpdir = fetch_url(srcuri, srcrev, srctree, preserve_tmp=args.keep_temp)
+        except FetchUrlFailure as e:
+            logger.error(str(e))
             sys.exit(1)
+
+        if ftmpdir and args.keep_temp:
+            logger.info('Fetch temp directory is %s' % ftmpdir)
+
         dirlist = os.listdir(srctree)
-        if 'git.indirectionsymlink' in dirlist:
-            dirlist.remove('git.indirectionsymlink')
+        filterout = ['git.indirectionsymlink']
+        dirlist = [x for x in dirlist if x not in filterout]
+        logger.debug('Directory listing (excluding filtered out):\n  %s' % '\n  '.join(dirlist))
         if len(dirlist) == 1:
             singleitem = os.path.join(srctree, dirlist[0])
             if os.path.isdir(singleitem):
@@ -468,7 +594,7 @@ def create_recipe(args):
                 check_single_file(dirlist[0], fetchuri)
         elif len(dirlist) == 0:
             if '/' in fetchuri:
-                fn = os.path.join(d.getVar('DL_DIR'), fetchuri.split('/')[-1])
+                fn = os.path.join(tinfoil.config_data.getVar('DL_DIR'), fetchuri.split('/')[-1])
                 if os.path.isfile(fn):
                     check_single_file(fn, fetchuri)
             # If we've got to here then there's no source so we might as well give up
@@ -605,11 +731,8 @@ def create_recipe(args):
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
-    (md5value, sha256value) = checksums
-    if md5value:
-        lines_before.append('SRC_URI[md5sum] = "%s"' % md5value)
-    if sha256value:
-        lines_before.append('SRC_URI[sha256sum] = "%s"' % sha256value)
+    for key, value in sorted(checksums.items()):
+        lines_before.append('SRC_URI[%s] = "%s"' % (key, value))
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
-- 
2.9.4


