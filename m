Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2468565CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 08:41:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t628fSWq014199
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Jul 2015 01:41:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 2 Jul 2015 01:41:28 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 16:40:51 +0800
Message-ID: <03f422716658fc4e0e1b6f9d103648cbb04b861d.1435825953.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435825953.git.kai.kang@windriver.com>
References: <cover.1435825953.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] valgrind: build with altivec only if it supported
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
X-List-Received-Date: Thu, 02 Jul 2015 08:41:38 -0000
Content-Type: text/plain

Signed-off-by: Ting Liu <ting.liu@freescale.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Cherry-pick from branch dizzy.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
new file mode 100644
index 0000000..12ad4c3
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
@@ -0,0 +1,68 @@
+Upstream-status: Backport
+
+r14566 | florian | 2014-09-24 17:02:54 -0500 (Wed, 24 Sep 2014) | 4 lines
+
+The testbuckets none/tests/ppc{32,64} did not build in case the
+toolchain did not support -maltivec -mabi=altivec.
+This should work now. Fixes BZ #338731
+
+Index: none/tests/ppc32/Makefile.am
+===================================================================
+--- a/none/tests/ppc32/Makefile.am	(revision 14565)
++++ b/none/tests/ppc32/Makefile.am	(revision 14566)
+@@ -72,8 +72,12 @@
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ 
+ if HAS_ALTIVEC
++BUILD_FLAG_ALTIVEC = -maltivec
++BUILD_FLAG_ABI_ALTIVEC = -mabi=altivec
+ ALTIVEC_FLAG = -DHAS_ALTIVEC
+ else
++BUILD_FLAG_ALTIVEC =
++BUILD_FLAG_ABI_ALTIVEC =
+ ALTIVEC_FLAG =
+ endif
+ 
+@@ -101,11 +105,12 @@
+ ISA_2_07_FLAG =
+ endif
+ 
+-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
+-			@FLAG_M32@ $(ALTIVEC_FLAG)
++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
++			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
+ 
+-testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -maltivec -mabi=altivec -DALTIVEC \
+-			-DGCC_COMPILER @FLAG_M32@
++testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -DALTIVEC \
++			-DGCC_COMPILER @FLAG_M32@  $(BUILD_FLAG_ALTIVEC) \
++			$(BUILD_FLAG_ABI_ALTIVEC)
+ 
+ test_isa_2_06_part1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
+ 			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
+Index: none/tests/ppc64/Makefile.am
+===================================================================
+--- a/none/tests/ppc64/Makefile.am	(revision 14565)
++++ b/none/tests/ppc64/Makefile.am	(revision 14566)
+@@ -50,8 +50,10 @@
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ 
+ if HAS_ALTIVEC
++BUILD_FLAG_ALTIVEC = -maltivec
+ ALTIVEC_FLAG = -DHAS_ALTIVEC
+ else
++BUILD_FLAG_ALTIVEC =
+ ALTIVEC_FLAG =
+ endif
+ 
+@@ -88,8 +90,8 @@
+ test_isa_2_06_part3_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
+ 			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
+ 
+-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
+-			@FLAG_M64@ $(ALTIVEC_FLAG)
++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
++			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
+ 
+ test_dfp1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(DFP_FLAG) \
+ 			@FLAG_M64@ $(BUILD_FLAGS_DFP)
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index ac50d2e..97d923d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://valgrind-remove-rpath.patch \
            file://enable.building.on.4.x.kernel.patch \
            file://add-ptest.patch \
+           file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
           "
 
-- 
1.9.1


