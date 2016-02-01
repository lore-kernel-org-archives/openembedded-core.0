Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0677719C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 22:01:29 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so88644705pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 14:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X8i09PV0Lq5jt8cEXKouY6nV63y5VzNobrDIk6FU+a4=;
	b=BMyRzPhBWCPsrDI2SJVwewOjlX0YSx4CJwdq8ke4XcLM9tK9Nqq7liSGo8ZHNfLWo7
	32MluNwUF8bwyZxOpDZdBMasgkWLpeYCoO41hswQwDaQcH4IP0wumm8IibZoxQW5xM8L
	LJP1YZWzDg04/gKqkk0Z50urEyZ+GqfuUoBZeJ5Uf2L9JIxRoYtpGQSls61bUr8dsFzZ
	Snbj99xh7yN1JgYCwTF46IlmRbsnk1Y3eiDwuA9NN/qY10uVmxSwZFF08jeSam6rS44e
	25g31oh33uDT1bZjPiWR+GZgI71iskNjR+BHYD0lC+7oyCtXkk1kJ6c2VoPYSBPvgdJC
	GhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X8i09PV0Lq5jt8cEXKouY6nV63y5VzNobrDIk6FU+a4=;
	b=VdR0mhqH4omraCe9QDqV+g8fmv6vSQCG6X0IqcRq+IOm1br0y9kxSYToeIwsEatq2m
	t2d4UDSKbQuJrS75Eh/OPOxqoJihTNs/RswhhcFH86fMdgbVx1oq0qAEsyhSQ3dMSCt+
	krIDFfGcxhfSGSPmPlZY0iKbvAlFYkO5YiD2exV2XryvdAMzUrZ+6nPA7rke6sX6nfrh
	zvIBdGME+VJuDLGLtIXmm27qvKCfYLr/kKC2YA9u4jrIknqLpgPoh54PId09F7Zn/0m/
	lFjTGCpnXWIuEy+U69/nbJL8olzftNc2PZ0+hjwgzFfalNga9so10r2XUxgv5UCYItfi
	3qIg==
X-Gm-Message-State: AG10YOS2IRA+/IsMAlTytdUol2Lyi+/zxEFgcC9/W2fX0qTK9XAfrGpb97QMKbo2CCcikg==
X-Received: by 10.66.151.198 with SMTP id us6mr6949812pab.79.1454364090680;
	Mon, 01 Feb 2016 14:01:30 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 3sm45428545pfb.64.2016.02.01.14.01.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 14:01:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 14:01:24 -0800
Message-Id: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc-configure-common.inc: drop --enable-target-optspace from configure
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
X-List-Received-Date: Mon, 01 Feb 2016 22:01:30 -0000

Configuring gcc with --enable-target-optspace (which causes gcc to
append "-g -Os" to the default CFLAGS_FOR_TARGET and so force libgcc
etc target libraries to always be optimised for size) dates back to
the very first commit in oe-core git in 2005 (for gcc 3.4.3).

Configuring gcc with --enable-target-optspace is not done widely
elsewhere (it's not used for Ubuntu or Fedora host gcc, the Linaro
binary toolchain or in Buildroot since early 2015). Sometime around
gcc 4.5.x it caused problems for powerpc and so was disabled for that
architecture:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810

This patch removes --enable-target-optspace completely (ie powerpc is
no longer a special case) and allows optimisation of libgcc etc to be
controlled directly by the flags present in TARGET_CFLAGS.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    | 1 -
 2 files changed, 9 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 85e69db..f4f76bd 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -14,13 +14,6 @@ JAVA_sh3 ?= ""
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
 LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
-# disable --enable-target-optspace for powerpc SPE
-# at -Os libgcc.so.1 creates references into
-# hidden symbols in libgcc.a which linker complains
-# when linking shared libraries further in the build like (gnutls)
-
-SPECIAL_ARCH_LIST = "powerpc"
-OPTSPACE = '${@bb.utils.contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}'
 
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
@@ -42,7 +35,6 @@ EXTRA_OECONF = "\
     --enable-libstdcxx-pch \
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
-    ${OPTSPACE} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 910f2ef..048b530 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -22,7 +22,6 @@ EXTRA_OECONF = "\
     --disable-multilib \
     --disable-__cxa_atexit \
     --enable-languages=c \
-    ${OPTSPACE} \
     --program-prefix=${TARGET_PREFIX} \
     --with-sysroot=/not/exist \
     --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
-- 
1.9.1


