Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7574C76ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:42 +0000 (UTC)
Received: by igcse8 with SMTP id se8so56648551igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vorK6PAlvOwZDU/VTS6/GtVRnsQfMgdYXvDBhEtdsBg=;
	b=UUuKKRJ8tcld7XNp+jOV1hDw2WnuNL7blX2Y8cdb+RlV0W/fBUI3uqXnbVG2/4viXL
	0ZH8DKkT5bq0K4qZt1k8XGk+qvoc+Pg24/QKfeWwttrvQgigMYQe5HEq8ZIE827voOOv
	we+rL7AME29N9VYFM0uZgfX7M0pNffTkNcOoZv1OeNNQTFUFpHEeNG9nLGki44W3thY0
	C94dn7/ZGDxMqstoAXKQWbSU8H0SfFJaWrB9gpsO14/WULNqVNP44kN28AHtneJ3j6fR
	gpTRLYumDmqCrgcKkZ2dhAZBM60FdB/vA0NVvwNSqtRjBzJuBJDm/kZurl75CjDBQQHS
	cIOQ==
X-Received: by 10.50.128.169 with SMTP id np9mr17304836igb.37.1440446622635;
	Mon, 24 Aug 2015 13:03:42 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:22 -0700
Message-Id: <5c822d8a8e56a808a0a737d8785290c58d1385a7.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 04/17] kernel-arch: Force BFD kernel when using gcc for linking
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:42 -0000

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


