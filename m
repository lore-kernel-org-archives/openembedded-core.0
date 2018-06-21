Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8AD78411
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 01:26:04 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 30-v6so709319pld.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z3gRey1eL1RcwMNORcqB5bIxlGiz4dQlo1kvcR9OiRQ=;
	b=pLJlfG4Kq+zELRomJEUDQLSGSEi8nVfnKCIbGnmi+0AAokwXUf2xYs2HsYHV8g4EHH
	tN9TfZSulSgZpFikH2MuZvUF+h7KbklnnHxNQ7w0jDY9rqfl3N0JM1i5cvqJUwAaVME/
	I4Xp9Yao2obfac23dzhzfABfU4pDtXAn9Iw4zaSgUPjg0zl7v5XrzUE5yy7Fj4yeM+p3
	2xP4gE0QMa0uVoGuvN+9O0Yj+QJXttz/3TXYPglSyeWjjvmYmAh/YIfKGGUeJaNT74FO
	4Fs/00nGoD+irV3SXtO+t8z0pKSlmTVfRAm+pFVR2ckySByW1Mqio9sklV/s51sHaMxf
	4Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z3gRey1eL1RcwMNORcqB5bIxlGiz4dQlo1kvcR9OiRQ=;
	b=qxDqoar3TFIUstqOq4aOYQVwgMw1KzUtF9cix7SPX5H9XUoZ16NQNCk1ww1r3//pMw
	4EzAHNCvgqoLQ3REHgt5pDz9V/XKgMWzTsLmhHI7VNEEwmzFsN8iiZDLvFNRkErVjMmK
	GJFFEXw7xXCH/IqA81UBC0DactDqUQ4/WREJCWvilTXgVKh7Xd7iOSVV3j/V40QfwXm1
	FZOumHFP2NH9EYym3QKvyyUrnb5oxZ78aJEaP5xZk+QusIAU1Q2tCN7Df6twesa1rxtj
	ODM1DmpLYvvbm/XEhRVO3RXb2nbV8nLMntNcfx892ve/hUTTBoQQs61c9Ios3K+10QMQ
	0NQQ==
X-Gm-Message-State: APt69E0VFmF8oE4e9qs17tHGklOZrH8/EGywiWzP8LD2R5d8zAHvKJN2
	3VpX7Fr921h2j9IR2Ow3Jna3Ig==
X-Google-Smtp-Source: ADUXVKJ3/aKjF2Zmor6xkAylaMUaWIu/ymUWIlFXXfB0WLW55jZHuO5nfgVVl7KlJdtZh2icHRzQyA==
X-Received: by 2002:a17:902:a518:: with SMTP id
	s24-v6mr26484462plq.144.1529544365025; 
	Wed, 20 Jun 2018 18:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	z19-v6sm5151433pfe.163.2018.06.20.18.26.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 18:26:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 18:26:07 -0700
Message-Id: <20180621012607.32923-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V2] gcc-8: Enable fp arch extention when fpu is available
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
X-List-Received-Date: Thu, 21 Jun 2018 01:26:04 -0000

This is especially needed when defaulting to hard-float ABI
Fixes errors e.g.
cc1: error: -mfloat-abi=hard: selected processor lacks an FPU

Fixes [YOCTO #12795]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
---
V2:
- Limit the change to gcc8 since gcc7 does not have these extentions

 meta/recipes-devtools/gcc/gcc-target.inc | 9 ++++++---
 meta/recipes-devtools/gcc/gcc_8.1.bb     | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 56e4b95af4..bc2236fed0 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -14,9 +14,12 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 # specific). For example, for ARM, ARMv6+ adds atomic instructions that may
 # affect the ABI in the gcc-runtime libs. Since we can't rely on gcc on the
 # target to always be passed -march etc, its built-in default needs to be safe.
-EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
-EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
-EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
+
+ARMFPARCHEXT ?= ""
+
+EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
+EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
+EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
diff --git a/meta/recipes-devtools/gcc/gcc_8.1.bb b/meta/recipes-devtools/gcc/gcc_8.1.bb
index ab208e7026..7d93590588 100644
--- a/meta/recipes-devtools/gcc/gcc_8.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_8.1.bb
@@ -7,4 +7,8 @@ require gcc-target.inc
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
+ARMFPARCHEXT_armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT_armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT_armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.1


