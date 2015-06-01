Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A39FE755F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 08:02:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5182hTZ018532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 01:02:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 01:02:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jun 2015 01:02:42 -0700
Message-ID: <003c185314ba6424dfc6455c5148a63ff6daecc7.1433145739.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433145739.git.liezhi.yang@windriver.com>
References: <cover.1433145739.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] boost: fix build for mips
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
X-List-Received-Date: Mon, 01 Jun 2015 08:02:42 -0000
Content-Type: text/plain

Backport 2 patches to fix the build error on mips:
mips-poky-linux-g++: error: unrecognized command line option '-m32'

https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
https://github.com/boostorg/build/commit/9576ca216cae888d7efb5da97c009c245c5ba567

Apply the pacthes to both bjam-native and boost, so put the patches to
"files" dir.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/boost/boost-1.58.0.inc        |    5 ++-
 ...dded-gcc.jam-was-passing-the-options-m32-.patch |   33 ++++++++++++++++
 ...n-t-pass-m32-m64-where-it-s-not-supported.patch |   40 ++++++++++++++++++++
 3 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
 create mode 100644 meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch

diff --git a/meta/recipes-support/boost/boost-1.58.0.inc b/meta/recipes-support/boost/boost-1.58.0.inc
index 0bae81b..b47d091 100644
--- a/meta/recipes-support/boost/boost-1.58.0.inc
+++ b/meta/recipes-support/boost/boost-1.58.0.inc
@@ -11,7 +11,10 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
+           file://0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch \
+           file://0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch \
+"
 
 SRC_URI[md5sum] = "b8839650e61e9c1c0a89f371dd475546"
 SRC_URI[sha256sum] = "fdfc204fc33ec79c99b9a74944c3e54bd78be4f7f15e260c0e2700a36dc7d3e5"
diff --git a/meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch b/meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
new file mode 100644
index 0000000..329b4c3
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
@@ -0,0 +1,33 @@
+From 817aed0d755bf8c0ba4ef6a77d41538e50b571fd Mon Sep 17 00:00:00 2001
+From: claymore <carlosmf.pt@gmail.com>
+Date: Fri, 24 Apr 2015 02:28:47 +0100
+Subject: [PATCH 1/2] mips1 fix added gcc.jam was passing the options -m32 and
+ -m64 to mips cross-compilers, when those do not use
+ such options This modification solves it by adding mips
+ as an exception
+
+Signed-off-by: Carlos M. Ferreira carlosmf.pt@gmail.com
+
+Upstream-Status: Backport
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+---
+ tools/build/src/tools/gcc.jam |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index db04534..eff95ae 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
+         else
+         {
+             local arch = [ feature.get-values architecture : $(properties) ] ;
+-            if $(arch) != arm
++            if $(arch) != arm && $(arch) != mips1
+             {
+                 if $(model) = 32
+                 {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch b/meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch
new file mode 100644
index 0000000..ecf7e55
--- /dev/null
+++ b/meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch
@@ -0,0 +1,40 @@
+From f825634a56b119dfa9d712119a66279cc7635978 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 2 May 2015 14:24:02 +0200
+Subject: [PATCH 2/2] Don't pass -m32/-m64 where it's not supported.
+
+Only PowerPC, SPARC, and x86 do support the -m32 and -m64 compiler options [1].
+
+Rather then excluding all architectures not supporting these options as it is
+done in commit c0634341d9ee2c02d3a55c91dafb988afc066c49 [2], include all
+architectures that do support them.
+
+This will fix building Boost for the SuperH architecture with Buildroot [3].
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
+[2] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
+[3] http://autobuild.buildroot.net/results/ccd/ccd5c83963032ba49b1627b1dff39e34a9486943/build-end.log
+
+Upstream-Status: Backport
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+---
+ tools/build/src/tools/gcc.jam |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index eff95ae..2f6af93 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
+         else
+         {
+             local arch = [ feature.get-values architecture : $(properties) ] ;
+-            if $(arch) != arm && $(arch) != mips1
++            if $(arch) = power || $(arch) = sparc || $(arch) = x86
+             {
+                 if $(model) = 32
+                 {
+-- 
+1.7.9.5
+
-- 
1.7.9.5


