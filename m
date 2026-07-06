Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E80EC4450C
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156293.1783358235211341683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CpMQwPPz;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso33767945e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358233; x=1783963033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppAdtdGPiCXYGzXNKWTeZesFQb8hIg0oqxe5Wg0Ah4w=;
        b=CpMQwPPz7yEPtzfnDL/R0xJNqQ+uiX8eHkGBm3ht3dAIol7qGlRG86QnR4Bxxadv03
         hr9eTDF6e0lbQi5FDdMA29OT43DfNDi++RENLbWt2ZkNFc/nk9sSr/RyhdZ4EDiepHHT
         u11xjjiBJSS4b5tgDjQnZ4SlgAq5hipp16GkaEY6rv8Z/Pxh9fZ+dQMn4DcMw9qRrZLA
         sghXFA9Qyg6kd1/7FBAfnQQNfH18QI7aQ+HVavj3E5hr4zjg7TR6ud1MffHlqYjdbQGZ
         76ryuY+0nF7ti6wYpFpNSmoXjVfMXQFOZDVN3fl7Tnakljlg13+eyO9ieQBd6NvwMESf
         nElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358233; x=1783963033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ppAdtdGPiCXYGzXNKWTeZesFQb8hIg0oqxe5Wg0Ah4w=;
        b=R4wP8QaSBDtVdjxpmo/xKazJISNFn65L12DgQnpaKxPb1nautyoCCLo8eHvtJnwjmi
         pDr/4oQw44jFwj35EuHIXw5f+xaC/YjaEGrXRaJXhGI342lgmnhT/+uerA2CxNBOazd5
         4e5qFq2lNIyIhrfTfJj6bcMl0D41FndIDjrmFleIx7+CTt7ZHfEUhN6CJUFmhd7IoMDx
         DTdKCUpEMhGosNm54D7KypIvtvACEiCB2cQ1QyA6GMd7z0DSpb5c7VvyC2Uw/fZP87us
         2OgpTBGIMQCNGGey8B3kId3lWnDga/+xroJyt/VP/c1y+/h4D213MX25eP+HmiY+wnau
         lvpw==
X-Gm-Message-State: AOJu0YzUL1bqu4XYHnvYSssABytpSBoyXMQFRKHlUS+XCfn9uGDf2ISn
	obUxxFZEZ0+/ceB4G+JBiRCeKWxjkZOr6oAt8rei27WWF+uoyA8/2lvHm8O1tQ==
X-Gm-Gg: AfdE7cnwc4nXbWZB6u6YLCDIuehTtyW9CybWifia4TWMOXAdeEGpD04WCsaw9+cR5m5
	0piKXoYnYo9zN2aGPkfph1P9CjaqRqqc9MSrOSq6TJwSVBPvRUgCMbUsVNU7d05JvyKXfYEuQpi
	xfJ6wJnAhhpOFAX9y69PS9/5hmYYADlNocQURot649Gjn2+PKkZNNqlIIg4CyMBRJFElRElyv03
	UZTgBFKRPSEAUb3W/JyM/aTcn0CO5/mHpVhTv/YELZGofJeKeITVfLNxF2NxmAStAFcprhPM2e0
	J/a5fI2yKrkVuw0RRb8iD9xPLgGv33shECNNP3itY+8WvH8/r54vWPJb+D/WZjrjZaI0G6h6uyW
	9uhngZBcPm1VCxYPegJPVha5tFoILXRoH7ZcRP4+SpPRJlEik9But8B3CCqzBEXRrwYyElYJNYC
	MqaEx81DimInlNRo3LQ1gJ32GSJlQZOuFM/eJ2VcOUqHW3JS0z
X-Received: by 2002:a05:600c:3f14:b0:493:ad1b:b38d with SMTP id 5b1f17b1804b1-493df0a0891mr16123395e9.37.1783358233360;
        Mon, 06 Jul 2026 10:17:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/45] git: upgrade 2.54.0 -> 2.55.0
Date: Mon,  6 Jul 2026 19:16:25 +0200
Message-ID: <20260706171701.70536-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240297

From: Alexander Kanavin <alex@linutronix.de>

License-Update: drop BSL-1.0 as sub-component that used it is no longer in source tree.

Disable building items written in rust (until now, git would quetly fall
back to C by default, as of this version it no longer does). At some point rust
code will have to be enabled; for now it's optional.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-do-not-force-RHEL-7-specific-build-.patch | 33 -------------------
 meta/recipes-devtools/git/git/fixsort.patch   |  2 +-
 .../git/{git_2.54.0.bb => git_2.55.0.bb}      |  8 ++---
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
 rename meta/recipes-devtools/git/{git_2.54.0.bb => git_2.55.0.bb} (94%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
deleted file mode 100644
index b0c8e652aa..0000000000
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d73b4c666aa12452a26c3fac83371a707e6f13c0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 7 Feb 2022 10:13:15 +0100
-Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
-
-This breaks reproducibility as git builds on centos 7 use
-different flags than git builds on other host distros.
-
-Upstream-Status: Inappropriate [upstream needs to check compiler and component versions properly]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
-Rebased for 2.45.1.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- config.mak.uname | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/config.mak.uname b/config.mak.uname
-index 5feb582..060cd29 100644
---- a/config.mak.uname
-+++ b/config.mak.uname
-@@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
- 	PROCFS_EXECUTABLE_PATH = /proc/self/exe
- 	HAVE_PLATFORM_PROCINFO = YesPlease
- 	COMPAT_OBJS += compat/linux/procinfo.o
--	# centos7/rhel7 provides gcc 4.8.5 and zlib 1.2.7.
--        ifneq ($(findstring .el7.,$(uname_R)),)
--		BASIC_CFLAGS += -std=c99
--        endif
- 	LINK_FUZZ_PROGRAMS = YesPlease
- endif
- ifeq ($(uname_S),GNU/kFreeBSD)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 046d09160a..86b41fd819 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From f928abf16841e42bfd49ccaabc164318f61e842a Mon Sep 17 00:00:00 2001
+From e3bdf5adc50b12d8625e70415c81402e0e938b68 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.54.0.bb b/meta/recipes-devtools/git/git_2.55.0.bb
similarity index 94%
rename from meta/recipes-devtools/git/git_2.54.0.bb
rename to meta/recipes-devtools/git/git_2.55.0.bb
index 80c535a726..9198bb06c9 100644
--- a/meta/recipes-devtools/git/git_2.54.0.bb
+++ b/meta/recipes-devtools/git/git_2.55.0.bb
@@ -2,14 +2,13 @@ SUMMARY = "Distributed version control system"
 HOMEPAGE = "http://git-scm.com"
 DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & LGPL-2.1-or-later"
 DEPENDS = "openssl zlib"
 
 PROVIDES:append:class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
-           file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -22,7 +21,6 @@ LIC_FILES_CHKSUM = "\
 	file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1 \
 	file://reftable/LICENSE;md5=1a6424cafc4c9c88c689848e165af33b \
 	file://sha1dc/LICENSE.txt;md5=9bbe4c990a9e98ea4b98ef5d3bcb8a7a \
-	file://compat/nedmalloc/License.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
 	file://compat/inet_ntop.c;md5=76593c6f74e8ced5b24520175688d59b;endline=16 \
 	file://compat/obstack.h;md5=08ad25fee5428cd879ceef451ce3a22e;endline=18 \
 	file://compat/poll/poll.h;md5=9fc00170a53b8e3e52157c91ac688dd1;endline=19 \
@@ -48,7 +46,7 @@ EXTRA_OECONF:append:class-native = " --with-gitconfig=/etc/gitconfig "
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion manpages
 
-EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "NO_RUST=1 NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
 EXTRA_OEMAKE += "COMPUTE_HEADER_DEPENDENCIES=no"
 EXTRA_OEMAKE:append:class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
@@ -170,7 +168,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "45e8107643a44e3ce46f5665beb35af3932fb0d70017687905ab5d4e3aafa8eb"
+SRC_URI[tarball.sha256sum] = "0842dc384a23ac33ba3e570c4f3a8ded85963ee4713b1cd21153c3db41813d1e"
 
 CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"
-- 
2.47.3


