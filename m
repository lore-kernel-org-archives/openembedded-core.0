Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15D2C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:27 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38581.1782742826895807713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S/0fP2M0;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1414622f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742825; x=1783347625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImZMZhbeGjtAgc7ZwLbu+TFD8y4QHEAP5FYo4gO7RFU=;
        b=S/0fP2M0O3JhIAsqOtwHy7VqJNpSgGdn/7fRirqojaJsacruqxfBn0zfYch9zfhWIL
         U4nTbBngqzWQwJFI/DG6XNgJHGHzbwHERkHHuU16YT1kljW2mFta2ZcsDmba3LNOnYts
         eGBDEobiuzMtVbOj1SVZxaDEXrilIOx3ht/eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742825; x=1783347625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImZMZhbeGjtAgc7ZwLbu+TFD8y4QHEAP5FYo4gO7RFU=;
        b=Ye2tPEyEOH9FvnQ/+MFkV0KCUZBS9aNWDfTuq0j3PSXh6fm2Oj7oQtJ2fCuWtz4KkN
         0XFtDRaDl6UGUJnShCU2Lbwk0gOpRbkBYRkn+IS5HZb3cODg2l528joGD+IFc+GqClrl
         /0dwKqAKJV+wyQm8LbIX5E5I2ZgmVaq9I7AOvzrKP8UhR2OHYg8GcWJWunsCcNIKXndC
         /rqJHrFPynYh616DCUL7ZGS58e5hrVTWTsQmwnBEdTG0ZuDCKf2IdDPIO3TTtsNnWped
         1Mn/4qUdzjc8ECTPP9lELJ0E8iS7QKg3UrI3V/Bq5ZbgzBFrMWEJWP0Ftz8dsZFO6nbl
         3c/Q==
X-Gm-Message-State: AOJu0Yx1YI4Q6isEU0dh0WPpREyK5UYveML+42xXZYXG/bqTuhLF4QJ9
	MinOqc9YiKXs4LELKs4dd3EJ/1axJMxjGlT8To39jwquhb5L5lVkhc6Fc0j2QEdEcdsBmLLwpbA
	Aa++Szcw=
X-Gm-Gg: AfdE7ckZMU9BjM2GHZUE57tD11lutJjcz0OhFdmW5Pt/mQnWWlZ+DIvyfE6RuEz+rFn
	6Iv/TI4vatpBVEeR50f6YQ3s4A/bg4a3fsQpJMomw9gUb9UevFc4EZJNLmdpmgElwPZNaFvjg1t
	usAvQBGRPQEairFMa8wFwdMC6VAgDAdTbcOpfBs0xqS6FYKlPDhUrcHyEi3/Zy6JEYTkUAkUbLK
	d8P8oyqy0IT3BVsqcL/MDHIqbExR5ZuY19t7F8ejHRfmvZ38eoJJw0RwHx1JHUbVvr4nw8zHA5S
	Rh6b45vPYvoIi4VPeBaSlmiMORlMsdhJi7snZ2aTcxpuJM73h/B7qS2J0ywVNuMXW9CDuLeWlYU
	TFAX1ySpr0HIScXXK28LVcwAJbtvGBbI7JTPIYPGpkQudnXD8oNfQswh/J8zSefGo5Ox//EvJd5
	PAC1bsySk6EFTmBP9+uNxtF7MQ/JvcBesrx2qMcqu3ukeYYd6HXsWrc3QZnlngsWwrQsL2M4Pxo
	iJrlf0hpXCXNxRbH/Waz0w=
X-Received: by 2002:a05:6000:2087:b0:474:3b78:b229 with SMTP id ffacd0b85a97d-4743b78b4cbmr3869270f8f.11.1782742824995;
        Mon, 29 Jun 2026 07:20:24 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/19] gawk: use native gawk when building glibc and grub
Date: Mon, 29 Jun 2026 16:19:46 +0200
Message-ID: <288ecfd7d9cd24222cc0f1277105c15cf0889718.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239789

From: Alexander Kanavin <alex@linutronix.de>

Different versions of gawk can produce different output,
so depending on which version is installed on the build host,
reproducibility issues can occur:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16072

So far only glibc and grub have been identified to have
the issue; probably more fixes of similar nature will be
required going forward.

Adjust the gawk recipe to apply target-only tweaks
(particularly the removal of awk symlink to allow for alternatives)
to only target and nativesdk variants, so that native installs
both awk and gawk executables.

[YOCTO #16072]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5bbf0a60b1d63e68f849a63e5d3872954e7cd3f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/grub/grub2.inc          |  2 +-
 meta/recipes-core/glibc/glibc.inc        |  2 +-
 meta/recipes-extended/gawk/gawk_5.3.0.bb | 11 ++++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3160708113e..a2173bee04b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -51,7 +51,7 @@ CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedo
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 
-DEPENDS = "flex-native bison-native gettext-native"
+DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
 
 GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 225d0539a01..60e3daaf326 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,7 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils libgcc-initial linux-libc-headers gawk-replacement-native"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index ac9d8500d60..a05ec3b34bc 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -34,13 +34,21 @@ ALTERNATIVE:${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
 
-do_install:append() {
+target_tweaks() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
 	# Strip non-reproducible build flags (containing build paths)
 	sed -i -e 's|^CC.*|CC=""|g' -e 's|^CFLAGS.*|CFLAGS=""|g' ${D}${bindir}/gawkbug
 }
 
+do_install:append:class-target() {
+	target_tweaks
+}
+
+do_install:append:class-nativesdk() {
+	target_tweaks
+}
+
 inherit ptest
 
 do_install_ptest() {
@@ -87,4 +95,5 @@ RDEPENDS:${PN}-ptest += "make locale-base-en-us coreutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 
+PROVIDES:append:class-native = " gawk-replacement-native"
 BBCLASSEXTEND = "native nativesdk"

