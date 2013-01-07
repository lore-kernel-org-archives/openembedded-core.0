Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Ts8IF-0006qz-V7
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 09:43:04 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4C787D22CD;
	Mon,  7 Jan 2013 09:27:45 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 09:27:35 +0100
Message-Id: <1357547255-2245-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] cmake: add AArch64 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 08:43:08 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/cmake/cmake.inc              |  7 ++--
 .../cmake/cmake/aarch64-cmake.patch                | 35 ++++++++++++++++++++
 .../cmake/cmake/aarch64-kwsys.patch                | 38 ++++++++++++++++++++++
 3 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 6dc319c..b2cba5e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,12 +9,15 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=bb2fa3a08736b842556f6171bb9e8ae1 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
-           file://support-oe-qt4-tools-names.patch"
+           file://support-oe-qt4-tools-names.patch \
+           file://aarch64-cmake.patch \
+           file://aarch64-kwsys.patch \
+           "
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch b/meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
new file mode 100644
index 0000000..d7fd241
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
@@ -0,0 +1,35 @@
+From: Riku Voipio <riku.voipio@linaro.org>
+Date: Fri, 21 Dec 2012 11:20:02 +0000 (+0200)
+Subject: KWIML: Teach ABI.h about Aarch64
+X-Git-Url: http://cmake.org/gitweb?p=cmake.git;a=commitdiff_plain;h=34916522
+
+KWIML: Teach ABI.h about Aarch64
+
+The __aarch64__ defines Aarch64, while __AARCH64EB__ defines bigendian
+and __AARCH64EL__ little endian.  Only little endian tested, no big
+endian toolchain exists yet.
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+Hand edited by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> to get it applied in OE
+---
+
+diff --git a/ABI.h.in b/ABI.h.in
+index f93ddba..7f4772a 100644
+--- a/Utilities/KWIML/ABI.h.in
++++ b/Utilities/KWIML/ABI.h.in
+@@ -418,6 +418,14 @@ suppression macro @KWIML@_ABI_NO_VERIFY was defined.
+ #elif defined(__vax__)
+ # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
+ 
++/* Aarch64 */
++#elif defined(__aarch64__)
++# if !defined(__AARCH64EB__)
++#  define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_LITTLE
++# else
++#  define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
++# endif
++
+ /* Unknown CPU */
+ #elif !defined(@KWIML@_ABI_NO_ERROR_ENDIAN)
+ # error "Byte order of target CPU unknown."
diff --git a/meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch b/meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch
new file mode 100644
index 0000000..ce49d30
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch
@@ -0,0 +1,38 @@
+From: KWSys Robot <kwrobot@kitware.com>
+Date: Fri, 21 Dec 2012 13:29:37 +0000 (-0500)
+Subject: KWSys 2012-12-21 (8ce09af5)
+X-Git-Url: http://cmake.org/gitweb?p=cmake.git;a=commitdiff_plain;h=567e7d94
+
+KWSys 2012-12-21 (8ce09af5)
+
+Extract upstream KWSys using the following shell commands.
+
+$ git archive --prefix=upstream-kwsys/ 8ce09af5 | tar x
+$ git shortlog --no-merges --abbrev=8 --format='%h %s' 933eb822..8ce09af5
+Riku Voipio (1):
+      8ce09af5 CPU: Add Aarch64 support
+
+Change-Id: I4bd0a97abaa0f958e2679afe2d4ad4bcc37434a0
+
+Hand edited by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> to get it applied in OE
+---
+
+diff --git a/CPU.h.in b/CPU.h.in
+index ecd29d1..2e1a584 100644
+--- a/Source/kwsys/CPU.h.in
++++ b/Source/kwsys/CPU.h.in
+@@ -98,6 +98,14 @@
+ #elif defined(__SYSC_ZARCH__)
+ # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
+ 
++/* Aarch64 */
++#elif defined(__aarch64__)
++# if !defined(__AARCH64EB__)
++#  define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_LITTLE
++# else
++#  define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
++# endif
++
+ /* Unknown CPU */
+ #else
+ # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID 0
-- 
1.8.0



