Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE8D72108
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 10:02:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2014 00:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="418556671"
Received: from gcwannia-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.103])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2014 00:44:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 08:53:21 +0000
Message-Id: <034623758759fa2111e55e19ec13b7eebf1ad970.1416386960.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416386960.git.paul.eggleton@linux.intel.com>
References: <cover.1416386960.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416386960.git.paul.eggleton@linux.intel.com>
References: <cover.1416386960.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] cmake: drop already applied patches
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
X-List-Received-Date: Wed, 19 Nov 2014 10:02:55 -0000

These patches were part of the 2.8.11 release.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/cmake/cmake.inc              |  2 --
 .../cmake/cmake/aarch64-cmake.patch                | 37 --------------------
 .../cmake/cmake/aarch64-kwsys.patch                | 40 ----------------------
 3 files changed, 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 8592a23..fb451fd 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -13,8 +13,6 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
-           file://aarch64-cmake.patch \
-           file://aarch64-kwsys.patch \
            file://qt4-fail-silent.patch \
            file://cmake-2.8.11.2-FindFreetype.patch \
            "
diff --git a/meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch b/meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
deleted file mode 100644
index 3e26d58..0000000
--- a/meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From: Riku Voipio <riku.voipio@linaro.org>
-Date: Fri, 21 Dec 2012 11:20:02 +0000 (+0200)
-Subject: KWIML: Teach ABI.h about Aarch64
-X-Git-Url: http://cmake.org/gitweb?p=cmake.git;a=commitdiff_plain;h=34916522
-
-KWIML: Teach ABI.h about Aarch64
-
-The __aarch64__ defines Aarch64, while __AARCH64EB__ defines bigendian
-and __AARCH64EL__ little endian.  Only little endian tested, no big
-endian toolchain exists yet.
-
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
-
-Hand edited by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> to get it applied in OE
-
-Upstream-Status: Backport
----
-
-diff --git a/ABI.h.in b/ABI.h.in
-index f93ddba..7f4772a 100644
---- a/Utilities/KWIML/ABI.h.in
-+++ b/Utilities/KWIML/ABI.h.in
-@@ -418,6 +418,14 @@ suppression macro @KWIML@_ABI_NO_VERIFY was defined.
- #elif defined(__vax__)
- # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
- 
-+/* Aarch64 */
-+#elif defined(__aarch64__)
-+# if !defined(__AARCH64EB__)
-+#  define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_LITTLE
-+# else
-+#  define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
-+# endif
-+
- /* Unknown CPU */
- #elif !defined(@KWIML@_ABI_NO_ERROR_ENDIAN)
- # error "Byte order of target CPU unknown."
diff --git a/meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch b/meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch
deleted file mode 100644
index 2b68eae..0000000
--- a/meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From: KWSys Robot <kwrobot@kitware.com>
-Date: Fri, 21 Dec 2012 13:29:37 +0000 (-0500)
-Subject: KWSys 2012-12-21 (8ce09af5)
-X-Git-Url: http://cmake.org/gitweb?p=cmake.git;a=commitdiff_plain;h=567e7d94
-
-KWSys 2012-12-21 (8ce09af5)
-
-Extract upstream KWSys using the following shell commands.
-
-$ git archive --prefix=upstream-kwsys/ 8ce09af5 | tar x
-$ git shortlog --no-merges --abbrev=8 --format='%h %s' 933eb822..8ce09af5
-Riku Voipio (1):
-      8ce09af5 CPU: Add Aarch64 support
-
-Change-Id: I4bd0a97abaa0f958e2679afe2d4ad4bcc37434a0
-
-Hand edited by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> to get it applied in OE
-
-Upstream-Status: Backport
----
-
-diff --git a/CPU.h.in b/CPU.h.in
-index ecd29d1..2e1a584 100644
---- a/Source/kwsys/CPU.h.in
-+++ b/Source/kwsys/CPU.h.in
-@@ -98,6 +98,14 @@
- #elif defined(__SYSC_ZARCH__)
- # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
- 
-+/* Aarch64 */
-+#elif defined(__aarch64__)
-+# if !defined(__AARCH64EB__)
-+#  define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_LITTLE
-+# else
-+#  define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
-+# endif
-+
- /* Unknown CPU */
- #else
- # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID 0
-- 
1.9.3


