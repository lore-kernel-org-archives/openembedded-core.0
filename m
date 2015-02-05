Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id C76BB72DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:26 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so10738885pab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=N9SSIbwVE9Dk+VNSzViXfUVNNhS5qVwj8tto5muhltk=;
	b=Sp393xlidbH59xpmKLFvh37lJopJAmLcxBKj06l5CanfS9rxjV5j3ue5mUdzn5Nuea
	zedapJ/jLh9h6+5CZUUbGklt7BiQ8uQDS/rU0eK1xmrt3XNXkhdCQQSRlQs496JADyLu
	Hes/NfbYNIyFaoZMrCN3oJjo3ZAPwFMuMZgv8z4Tp/bqPvLq61/IAzLLQR57E0AmYq0A
	ZrnYzq+1V30X98+1DiWwqWLTyIr3c08QUVSmrHVhcL8/ZtisAJHLS6aexQ/Apz8q1JEH
	4hFBX1NowMijjWKrbxX3P+J/HmeUGHDTX3RH7f8nweZtCaWyMvDZNV7KZtaMRu/Dv21m
	fSfw==
X-Received: by 10.68.241.35 with SMTP id wf3mr7083358pbc.22.1423152267652;
	Thu, 05 Feb 2015 08:04:27 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:15 -0800
Message-Id: <9d49eac962ec7a7481148718b8f14ee3cc26504c.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 07/61] valgrind: build with altivec only if it supported
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:27 -0000

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
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
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index c415e77..eea81a2 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
            file://add-ptest.patch \
+           file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
           "
 
-- 
1.9.1


