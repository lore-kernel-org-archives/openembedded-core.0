Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4CC78312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:49:06 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 07:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="129748646"
Received: from rpieper-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.39.83])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2017 07:48:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:48:10 +0200
Message-Id: <a7f4c6089dda6d837cf92946b02c8a3f7d5abd42.1500561823.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500561823.git.paul.eggleton@linux.intel.com>
References: <cover.1500561823.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 4/7] recipetool: create: eliminate second fetch for packages
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
X-List-Received-Date: Thu, 20 Jul 2017 14:49:06 -0000

When dealing with package files (.rpm, .ipk etc.) we need to unpack them
ourselves to get the metadata, which is thrown away when the fetcher
unpacks them. However, since we've already fetched the file once, I'm
not sure as to why I thought I needed to fetch it again - we can just
get the local path and then unpack it directly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 923c336..2b7cc76 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -478,20 +478,11 @@ def create_recipe(args):
             bb.process.run('git submodule update --init --recursive', cwd=srctree)
 
         if is_package(fetchuri):
-            tmpfdir = tempfile.mkdtemp(prefix='recipetool-')
-            try:
-                pkgfile = None
+            localdata = bb.data.createCopy(tinfoil.config_data)
+            pkgfile = bb.fetch2.localpath(fetchuri, localdata)
+            if pkgfile:
+                tmpfdir = tempfile.mkdtemp(prefix='recipetool-')
                 try:
-                    fileuri = fetchuri + ';unpack=0'
-                    scriptutils.fetch_uri(tinfoil.config_data, fileuri, tmpfdir, srcrev)
-                    for root, _, files in os.walk(tmpfdir):
-                        for f in files:
-                            pkgfile = os.path.join(root, f)
-                            break
-                except bb.fetch2.BBFetchException as e:
-                    logger.warn('Second fetch to get metadata failed: %s' % str(e).rstrip())
-
-                if pkgfile:
                     if pkgfile.endswith(('.deb', '.ipk')):
                         stdout, _ = bb.process.run('ar x %s' % pkgfile, cwd=tmpfdir)
                         stdout, _ = bb.process.run('tar xf control.tar.gz', cwd=tmpfdir)
@@ -501,8 +492,8 @@ def create_recipe(args):
                         stdout, _ = bb.process.run('rpm -qp --xml %s > pkginfo.xml' % pkgfile, cwd=tmpfdir)
                         values = convert_rpm_xml(os.path.join(tmpfdir, 'pkginfo.xml'))
                         extravalues.update(values)
-            finally:
-                shutil.rmtree(tmpfdir)
+                finally:
+                    shutil.rmtree(tmpfdir)
     else:
         # Assume we're pointing to an existing source tree
         if args.extract_to:
-- 
2.9.4


