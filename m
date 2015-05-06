Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB7473DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:05:09 +0000 (UTC)
Received: by iepj10 with SMTP id j10so4082661iep.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0GzblQV6gGApTATRJhz1hiPbPmrcRHJ3x5rPchdPDuI=;
	b=0iUj5r+D1GM7erDhS86NRPz0cbNw91ou7M7Xs6SUlQSw9OhKX4tyg4YvzaiVR7NarZ
	NmDWdhJfoO2XIh1f0L6jANXcfWYEv3UMbpbaYIBFN3xscVbj7fd6w1kS0dXadFSS1EVy
	FOf3pWNlFqAdc0+41rHxvM00+i4Ut4N1+SvT5Vy1ODo9T4fF2f2MdUAe7VsCYOpVpzqF
	KGW9VXEHNdtN/LNwco4PdYGg6E7YGDM4mH/JGgPmfb5V6coQ/EELC7bH+O1vHNVRLnSZ
	ImkfpQvtgIY97F+MUUtZclbY3Fuli3Z2uqCPh/yYYzFrbpXowIMt9s7FDch07yLqAwB5
	tuBA==
X-Received: by 10.42.129.73 with SMTP id p9mr1171338ics.48.1430895910428;
	Wed, 06 May 2015 00:05:10 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id m5sm622733ioi.4.2015.05.06.00.05.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 00:05:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 00:04:58 -0700
Message-Id: <4ffe99f25368e8b65df327fb9120ebca1c29e925.1430895556.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
In-Reply-To: <cover.1430895556.git.raj.khem@gmail.com>
References: <cover.1430895556.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] gcc-cross: Pass EXTRA_OECONF_GCC_FLOAT to configure
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
X-List-Received-Date: Wed, 06 May 2015 07:05:10 -0000

This helps in configuring the cross compiler to have sane defaults
in case of ARM e.g. it will do the right thing for selecting hardfloat
ABI when invoked without using TOOLCHAIN_OPTIONS on cmdline.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 9792950..3279efb 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -30,6 +30,8 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+EXTRA_OECONF_GCC_FLOAT = "${@get_gcc_float_setting(bb, d)}"
+
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
 do_compile () {
-- 
2.1.4


