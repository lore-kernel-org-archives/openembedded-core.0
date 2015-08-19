Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 01F0E76A64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 17:45:02 +0000 (UTC)
Received: by iods203 with SMTP id s203so17806683iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vorK6PAlvOwZDU/VTS6/GtVRnsQfMgdYXvDBhEtdsBg=;
	b=mUlw98z0Bw51nmF7mO8ASM0VIkwycV7U8x1oLH5xrhDMPA8n8JYGFl9jEdheLRT1pa
	2XF9a+K1Ks1HRRQ75sZ6gtt2zogo0a1hGoHtfWzU0umcWA15mCzvTnCSNRkgCzV8T7n5
	PnoDs7I97+meR5RoD+JCtAKgDGLtnd3Ecr2gmjWHM21mSsGIA3Ry/Hx2yvo1fuzyDZbW
	Xlnx569RAlb7idP+pssRPbTn1eUzFYM2+kQU+QfmQa1MiQijwtJqij0C4xIT0aps4yJP
	0OINK+B7wo5LOEXVvA1tjEGGsw1hBrnVUEilDa/Ozp/RpFq1P5fZH/fMvf7zPyFaOomV
	oQXA==
X-Received: by 10.107.164.92 with SMTP id n89mr14406746ioe.91.1440006302708;
	Wed, 19 Aug 2015 10:45:02 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	bd7sm2633341igb.19.2015.08.19.10.45.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 10:45:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 10:44:56 -0700
Message-Id: <1440006296-15277-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] kernel-arch: Force BFD kernel when using gcc for linking
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
X-List-Received-Date: Wed, 19 Aug 2015 17:45:03 -0000

We redefine LD to point to ld.bfd when building kernel, which works in
most cases since kbuild system calls out for bare LD most of the time,
however some of newer kernels e.g. 4.1+ have some code added which can
call gcc directly to do the linking job e.g. arm vdso code

This causes build failures when we have configured the default cross
toolchain to use gold linker as default. Errors like

BFD: arch/arm/vdso/vdso.so: Not enough room for program headers, try
linking with -N
| arm-angstrom-linux-gnueabi-objcopy:arch/arm/vdso/vdso.so[.hash]: Bad
value

start happening.

With this patch we force gcc to choose bfd linker as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 6650870..211b72b 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -53,7 +53,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH}"
+KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 
-- 
2.1.4


