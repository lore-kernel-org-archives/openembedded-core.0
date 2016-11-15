Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 74DB3605BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 02:27:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 14 Nov 2016 18:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="1059519954"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2016 18:27:29 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 18:26:33 -0800
Message-Id: <20161115022633.85609-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] recipetool: add postinst to .deb import
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
X-List-Received-Date: Tue, 15 Nov 2016 02:27:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The .deb import feature did not import postinst, postrm, preinst, or¬
prerm functions. This change checks to see if those files exist, and
if so, adds the appropriate functions adding correct path variables
if¬ required.¬

[ YOCTO #10421 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index cb1c804..8dc06ef 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -234,7 +234,8 @@ class RecipeHandler(object):
         if deps:
             values['DEPENDS'] = ' '.join(deps)
 
-    def genfunction(self, outlines, funcname, content, python=False, forcespace=False):
+    @staticmethod
+    def genfunction(outlines, funcname, content, python=False, forcespace=False):
         if python:
             prefix = 'python '
         else:
@@ -460,8 +461,8 @@ def create_recipe(args):
 
                 if pkgfile:
                     if pkgfile.endswith(('.deb', '.ipk')):
-                        stdout, _ = bb.process.run('ar x %s control.tar.gz' % pkgfile, cwd=tmpfdir)
-                        stdout, _ = bb.process.run('tar xf control.tar.gz ./control', cwd=tmpfdir)
+                        stdout, _ = bb.process.run('ar x %s' % pkgfile, cwd=tmpfdir)
+                        stdout, _ = bb.process.run('tar xf control.tar.gz', cwd=tmpfdir)
                         values = convert_debian(tmpfdir)
                         extravalues.update(values)
                     elif pkgfile.endswith(('.rpm', '.srpm')):
@@ -722,6 +723,15 @@ def create_recipe(args):
         if not bbclassextend:
             lines_after.append('BBCLASSEXTEND = "native"')
 
+    postinst = ("postinst", extravalues.pop('postinst', None))
+    postrm = ("postrm", extravalues.pop('postrm', None))
+    preinst = ("preinst", extravalues.pop('preinst', None))
+    prerm = ("prerm", extravalues.pop('prerm', None))
+    funcs = [postinst, postrm, preinst, prerm]
+    for func in funcs:
+        if func[1]:
+            RecipeHandler.genfunction(lines_after, 'pkg_%s_${PN}' % func[0], func[1])
+
     outlines = []
     outlines.extend(lines_before)
     if classes:
@@ -1058,6 +1068,26 @@ def convert_debian(debpath):
                     varname = value_map.get(key, None)
                     if varname:
                         values[varname] = value
+    postinst = os.path.join(debpath, 'postinst')
+    postrm = os.path.join(debpath, 'postrm')
+    preinst = os.path.join(debpath, 'preinst')
+    prerm = os.path.join(debpath, 'prerm')
+    sfiles = [postinst, postrm, preinst, prerm]
+    isPath = [" /", "'/", '"/']
+    for sfile in sfiles:
+        if os.path.isfile(sfile):
+            logger.info("Converting %s file to recipe function..." %
+                    os.path.basename(sfile).upper())
+            content = []
+            with open(sfile) as f:
+                for line in f:
+                    if "#!/" in line:
+                        continue
+                    line = line.rstrip("\n")
+                    if line.strip():
+                        content.append(line)
+                if content:
+                    values[os.path.basename(f.name)] = content
 
     #if depends:
     #    values['DEPENDS'] = ' '.join(depends)
-- 
2.10.2


