Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0917773167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S8JfHP007018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 01:19:42 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:58 -0400
Message-ID: <bd83236f896bd417df66a73a8e5150c01c1dcd5d.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/17] python-pycairo: fix buildpath QA issue
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:42 -0000
Content-Type: text/plain

- Inherit waf.bbclass, remove duplicate tasks

- Get "--destdir" directory supplied to the "install" command,
  and use it as a prefix to strip off the purported filename
  encoded in bytecode files.

- Do not need to generate pycairo.pc manually

[YOCTO #8446]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...trip-off-build-path-in-purported-filename.patch | 62 ++++++++++++++++++++++
 .../python/python-pycairo_1.10.0.bb                | 25 +++------
 2 files changed, 68 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch

diff --git a/meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch b/meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
new file mode 100644
index 0000000..647c4be
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
@@ -0,0 +1,62 @@
+From 86faf604fc8a7f17320db48734cda464119da387 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 25 Feb 2016 04:22:07 -0500
+Subject: [PATCH] strip off build path in purported filename
+
+Get the "--destdir" directory supplied to the "install" command,
+and use it as a prefix to strip off the purported filename
+encoded in bytecode files.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+diff --git a/.waf-1.6.3-3c3129a3ec8fb4a5bbc7ba3161463b22/waflib/Tools/python.py b/.waf-1.6.3-3c3129a3ec8fb4a5bbc7ba3161463b22/waflib/Tools/python.py
+--- a/.waf-1.6.3-3c3129a3ec8fb4a5bbc7ba3161463b22/waflib/Tools/python.py
++++ b/.waf-1.6.3-3c3129a3ec8fb4a5bbc7ba3161463b22/waflib/Tools/python.py
+@@ -26,7 +26,7 @@ int main()
+ INST='''
+ import sys, py_compile
+ for pyfile in sys.argv[1:]:
+-	py_compile.compile(pyfile, pyfile + %r)
++	py_compile.compile(pyfile, pyfile + %r, %r)
+ '''
+ def process_py(self,node):
+ 	try:
+@@ -39,6 +39,16 @@ def process_py(self,node):
+ 	def inst_py(ctx):
+ 		install_pyfile(self,node)
+ 	self.bld.add_post_fun(inst_py)
++
++def get_dfile(dfile):
++	if getattr(Options.options,'destdir'):
++		destdir = Options.options.destdir
++		if dfile[:len(destdir)] != destdir:
++			raise Errors.WafError("invalid destdir: filename %r doesn't start with %r" % ((dfile, destdir)))
++		dfile = dfile[len(destdir):]
++
++	return dfile
++
+ def install_pyfile(self,node):
+ 	tsk=self.bld.install_files(self.install_path,[node],postpone=False)
+ 	path=os.path.join(tsk.get_install_path(),node.name)
+@@ -53,12 +63,14 @@ def install_pyfile(self,node):
+ 		if self.env['PYC']or self.env['PYO']:
+ 			info("+ byte compiling %r"%path)
+ 		if self.env['PYC']:
+-			argv=self.env['PYTHON']+['-c',INST%'c',path]
++			dfile = get_dfile(path+'c')
++			argv=self.env['PYTHON']+['-c',INST%('c',dfile),path]
+ 			ret=Utils.subprocess.Popen(argv).wait()
+ 			if ret:
+ 				raise Errors.WafError('pyc compilation failed %r'%path)
+ 		if self.env['PYO']:
+-			argv=self.env['PYTHON']+[self.env['PYFLAGS_OPT'],'-c',INST%'o',path]
++			dfile = get_dfile(path+'o')
++			argv=self.env['PYTHON']+[self.env['PYFLAGS_OPT'],'-c',INST%('o',dfile),path]
+ 			ret=Utils.subprocess.Popen(argv).wait()
+ 			if ret:
+ 				raise Errors.WafError('pyo compilation failed %r'%path)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
index 70fe25c..2fbd033 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -11,31 +11,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
 DEPENDS = "cairo"
 PR = "r2"
 
-SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.bz2"
+SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.bz2 \
+           file://strip-off-build-path-in-purported-filename.patch \
+"
 
 SRC_URI[md5sum] = "20337132c4ab06c1146ad384d55372c5"
 SRC_URI[sha256sum] = "d30439f06c2ec1a39e27464c6c828b6eface3b22ee17b2de05dc409e429a7431"
 
 S = "${WORKDIR}/py2cairo-${PV}"
 
-inherit distutils pkgconfig
+inherit distutils pkgconfig waf
 
 BBCLASSEXTEND = "native"
 
-do_configure() {
-	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
-}
-
-do_compile() {
-	./waf build ${PARALLEL_MAKE}
-}
-
-do_install() {
-	./waf install
-	sed \
-		-e 's:@prefix@:${prefix}:' \
-		-e 's:@VERSION@:${PV}:' \
-		-e 's:@includedir@:${includedir}:' \
-		pycairo.pc.in > pycairo.pc
-	install -m 0644 pycairo.pc ${D}${libdir}/pkgconfig/
-}
+CACHED_CONFIGUREVARS = "BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}"
+EXTRA_OECONF += "--libdir=${libdir}"
-- 
1.9.1


