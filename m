Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A78ED731D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886738"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:21:00 +1200
Message-Id: <3b33b810a8f9f2b0061341215848482ebff29ee9.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] recipetool: create: extract variable values from .deb/.ipk/.rpm
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
X-List-Received-Date: Sun, 29 May 2016 22:21:39 -0000

Extract the metadata from package files and use it to set variable
values in the recipe (including recipe name and version, LICENSE,
SUMMARY, DESCRIPTION, SECTION and HOMEPAGE). For LICENSE we take care
not to step on any value determined by our license file scan; if there
is one we simply add a comment above the LICENSE setting so the user can
resolve it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 105 +++++++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 66c881a..ad26189 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -261,7 +261,11 @@ def determine_from_filename(srcfile):
         namepart = srcfile.split('.tar.')[0].lower()
     else:
         namepart = os.path.splitext(srcfile)[0].lower()
-    splitval = namepart.rsplit('_', 1)
+    if is_package(srcfile):
+        # Force getting the value from the package metadata
+        return None, None
+    else:
+        splitval = namepart.rsplit('_', 1)
     if len(splitval) == 1:
         splitval = namepart.rsplit('-', 1)
     pn = splitval[0].replace('_', '-')
@@ -327,6 +331,13 @@ def reformat_git_uri(uri):
             return 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(4) or '')
     return uri
 
+def is_package(url):
+    '''Check if a URL points to a package'''
+    checkurl = url.split(';', 1)[0]
+    if checkurl.endswith(('.deb', '.ipk', '.rpm', '.srpm')):
+        return True
+    return False
+
 def create_recipe(args):
     import bb.process
     import tempfile
@@ -337,6 +348,7 @@ def create_recipe(args):
     if args.machine:
         pkgarch = "${MACHINE_ARCH}"
 
+    extravalues = {}
     checksums = (None, None)
     tempsrc = ''
     srcsubdir = ''
@@ -382,6 +394,33 @@ def create_recipe(args):
                     if '<html' in f.read(100).lower():
                         logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
                         sys.exit(1)
+
+        if is_package(fetchuri):
+            tmpfdir = tempfile.mkdtemp(prefix='recipetool-')
+            try:
+                pkgfile = None
+                try:
+                    fileuri = fetchuri + ';unpack=0'
+                    scriptutils.fetch_uri(tinfoil.config_data, fileuri, tmpfdir, srcrev)
+                    for root, _, files in os.walk(tmpfdir):
+                        for f in files:
+                            pkgfile = os.path.join(root, f)
+                            break
+                except bb.fetch2.BBFetchException as e:
+                    logger.warn('Second fetch to get metadata failed: %s' % str(e).rstrip())
+
+                if pkgfile:
+                    if pkgfile.endswith(('.deb', '.ipk')):
+                        stdout, _ = bb.process.run('ar x %s control.tar.gz' % pkgfile, cwd=tmpfdir)
+                        stdout, _ = bb.process.run('tar xf control.tar.gz ./control', cwd=tmpfdir)
+                        values = convert_debian(tmpfdir)
+                        extravalues.update(values)
+                    elif pkgfile.endswith(('.rpm', '.srpm')):
+                        stdout, _ = bb.process.run('rpm -qp --xml %s > pkginfo.xml' % pkgfile, cwd=tmpfdir)
+                        values = convert_rpm_xml(os.path.join(tmpfdir, 'pkginfo.xml'))
+                        extravalues.update(values)
+            finally:
+                shutil.rmtree(tmpfdir)
     else:
         # Assume we're pointing to an existing source tree
         if args.extract_to:
@@ -458,6 +497,13 @@ def create_recipe(args):
         lines_before.append('# will not be in most cases) you must specify the correct value before using this')
         lines_before.append('# recipe for anything other than initial testing/development!')
         licenses = ['CLOSED']
+    pkg_license = extravalues.pop('LICENSE', None)
+    if pkg_license:
+        if licenses == ['Unknown']:
+            lines_before.append('# NOTE: The following LICENSE value was determined from the original package metadata')
+            licenses = [pkg_license]
+        else:
+            lines_before.append('# NOTE: Original package metadata indicates license is: %s' % pkg_license)
     lines_before.append('LICENSE = "%s"' % ' '.join(licenses))
     lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
     lines_before.append('')
@@ -558,7 +604,6 @@ def create_recipe(args):
         classes.append('bin_package')
         handled.append('buildsystem')
 
-    extravalues = {}
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
@@ -665,6 +710,9 @@ def create_recipe(args):
     outlines.extend(lines_after)
 
     if extravalues:
+        if 'LICENSE' in extravalues and not licvalues:
+            # Don't blow away 'CLOSED' value that comments say we set
+            del extravalues['LICENSE']
         _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=False)
 
     if args.extract_to:
@@ -913,6 +961,12 @@ def convert_pkginfo(pkginfofile):
     return values
 
 def convert_debian(debpath):
+    value_map = {'Package': 'PN',
+                 'Version': 'PV',
+                 'Section': 'SECTION',
+                 'License': 'LICENSE',
+                 'Homepage': 'HOMEPAGE'}
+
     # FIXME extend this mapping - perhaps use distro_alias.inc?
     depmap = {'libz-dev': 'zlib'}
 
@@ -922,34 +976,63 @@ def convert_debian(debpath):
         indesc = False
         for line in f:
             if indesc:
-                if line.strip():
+                if line.startswith(' '):
                     if line.startswith(' This package contains'):
                         indesc = False
                     else:
-                        values['DESCRIPTION'] += ' ' + line.strip()
+                        if 'DESCRIPTION' in values:
+                            values['DESCRIPTION'] += ' ' + line.strip()
+                        else:
+                            values['DESCRIPTION'] = line.strip()
                 else:
                     indesc = False
-            else:
+            if not indesc:
                 splitline = line.split(':', 1)
-                key = line[0]
-                value = line[1]
+                if len(splitline) < 2:
+                    continue
+                key = splitline[0]
+                value = splitline[1].strip()
                 if key == 'Build-Depends':
                     for dep in value.split(','):
                         dep = dep.split()[0]
                         mapped = depmap.get(dep, '')
                         if mapped:
                             depends.append(mapped)
-                elif key == 'Section':
-                    values['SECTION'] = value
                 elif key == 'Description':
                     values['SUMMARY'] = value
                     indesc = True
+                else:
+                    varname = value_map.get(key, None)
+                    if varname:
+                        values[varname] = value
 
-    if depends:
-        values['DEPENDS'] = ' '.join(depends)
+    #if depends:
+    #    values['DEPENDS'] = ' '.join(depends)
 
     return values
 
+def convert_rpm_xml(xmlfile):
+    '''Converts the output from rpm -qp --xml to a set of variable values'''
+    import xml.etree.ElementTree as ElementTree
+    rpmtag_map = {'Name': 'PN',
+                  'Version': 'PV',
+                  'Summary': 'SUMMARY',
+                  'Description': 'DESCRIPTION',
+                  'License': 'LICENSE',
+                  'Url': 'HOMEPAGE'}
+
+    values = {}
+    tree = ElementTree.parse(xmlfile)
+    root = tree.getroot()
+    for child in root:
+        if child.tag == 'rpmTag':
+            name = child.attrib.get('name', None)
+            if name:
+                varname = rpmtag_map.get(name, None)
+                if varname:
+                    values[varname] = child[0].text
+    return values
+
 
 def register_commands(subparsers):
     parser_create = subparsers.add_parser('create',
-- 
2.5.5


