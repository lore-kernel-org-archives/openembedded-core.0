Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE04EA4FDD
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:36 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37949.1771861175450789634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=BV7bzHfm;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.51, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65a3015c206so512405a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861174; x=1772465974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGwRXem5HXLAUKq99a+Vv/5j50/ia6ZLK5Kr/f+yvAw=;
        b=BV7bzHfm/MnLzavXgDi/8Je/wSn+53GIC8k9zCYxus2tDwwVPYXx6A+uwfB+4riK9x
         Y0Tn33dN1in4JRg7p/rP6hkw+Lir1qMxt1Lbt1tnF7stynP4FVxqpB0u5e1Lj+QvOvUT
         LNl9mOkblKYZSVfWrXHRlN77imovCjNvxTkAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861174; x=1772465974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGwRXem5HXLAUKq99a+Vv/5j50/ia6ZLK5Kr/f+yvAw=;
        b=DDwXN60LTwQADU/AP0REu1geEvqMGo1A6gYjMWh0AKSMMhVgU++terz+BKKDXUwENu
         Z99IidHzNjNYNJxcpinQoXp59ieIAyaDUvImSndaKG5SPZTdyKwMNT+4xtn1O9BGAf64
         Ca37jNUeYSKRA6AeqSLuq7Du7Na0tynj+iTqOYuSRCc2UtvEipYSF29+wTo/72EexGe0
         uvraMiZ55GTeqq3HH7mood+6MO7Qa+SlL0aPww7k0LLBwevaua1O+Q6aCQB7xisH5pgL
         biWu8mhDa6bhplRQ8FSuOuIsgo1GDrjekl4LEZQUnwZD2/ySgj8OmcuYTVBM9zt9X+K0
         gR1w==
X-Gm-Message-State: AOJu0YyIJVz2SnaFjQe6BRIxSrl/HdzfgvxvmHnqtx7AvIR4EHD12N5E
	ELim2uxY3CY+PSoKQz69huVmCIlf0dyjfcqFNSvsJCcdiwVGTAs4kfy5851yaDQiuHtL2UR3I13
	Q9D1TbDg=
X-Gm-Gg: AZuq6aIdqViDjdviXqC1SDU1We00IVs4rwldJmfbLWX1a+k8Y4jglDZxfAIwwtFPsSC
	9MRjc4Oqu1NCUxbvKfc7bJFNQT31J6jrjVR7UFR3KQfKw6YZE067d5MMAotg2CGAlZ3KVvXOZuP
	sEUag1N3SQdq9z5ib7hbNR8fr2KP/3KATIpM8vaHrKR3JJEcdBZz03/y/d53pitdixboIDChq1a
	8QQat1RI3llL0hxnomMuo6bo0K6jq3MuH4YkTAfUQZSY1jHP7Hv3XlP3V5hmh3cRoQD2EtnQr4K
	KhzE2OOVQCGeqjUIJ57qAN9EIoY5XRA5tBnMfjb/rvOrX8MArsl/KxBIBdNIont7V2N/0S64YHe
	+uM0b2PSGScJiJJ2ZX53x1ECpQOndTQvLKEm4oowOU2udO1Ta4geA+I7w9rc/NxQCclEm10lOnU
	xuDFvapHEQmaqJ6r5GtYpHisgaj/SHavKFrY6RqmdGZjr0/WejAhRuLFyUJjEdAxsBRtDFmCBTi
	rLvGaqGNh/ObWVEi6mXRjmowmdUIy8xHi7RfBeBRhgGZsH4xnOlZ9RQbcGP5k4AKDwQ/g==
X-Received: by 2002:a17:907:96a7:b0:b8d:fc50:c2f0 with SMTP id a640c23a62f3a-b908196a1ebmr252785866b.2.1771861173703;
        Mon, 23 Feb 2026 07:39:33 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 5/8] librepo: upgrade 1.20.0 -> 1.21.0
Date: Mon, 23 Feb 2026 16:39:26 +0100
Message-ID: <20260223153929.2641007-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231677

While librepo does not have a 1.21.0 tag, commit
be788e8bb0c1dc53167e9e0fbe465ec14dac3eb1 bumps 1.20.0 to 1.21.0 in both the
VERSION.cmake and librepo.spec files. An issue is raised here to officially
tag the release: https://github.com/rpm-software-management/librepo/issues/368

Other changes:
  - Rename patches to be in the order they are applied
  - Add backported 0002-Fix-creating-run-gnupg-user.patch

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...ain-PYTHON_INSTALL_DIR-by-running-p.patch} |  0
 .../0002-Fix-creating-run-gnupg-user.patch    | 44 +++++++++++++++++++
 .../{librepo_1.20.0.bb => librepo_1.21.0.bb}  |  7 +--
 3 files changed, 48 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/librepo/librepo/{0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch => 0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch} (100%)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch
 rename meta/recipes-devtools/librepo/{librepo_1.20.0.bb => librepo_1.21.0.bb} (78%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
similarity index 100%
rename from meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
rename to meta/recipes-devtools/librepo/librepo/0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
diff --git a/meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch b/meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch
new file mode 100644
index 0000000000..03d3032678
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch
@@ -0,0 +1,44 @@
+From 9eff2fc7097bb2de44c258e8ce82f81cbab7f23c Mon Sep 17 00:00:00 2001
+From: Petr Pisar <ppisar@redhat.com>
+Date: Thu, 27 Nov 2025 17:31:25 +0100
+Subject: [PATCH] PGP: Fix creating /run/gnupg/user
+
+e206603a18a6ca8eaa82caedf02004ea3cca2969 commit ("PGP: Enable creating
+a UID directory for GnuGP agent socket in /run/gnupg/user") added
+a non-default -DUSE_RUN_GNUPG_USER_SOCKET=ON CMake option to create
+GnuPG agent socket in /run/gnupg/user directory.
+
+However, because of a typo in preprocessor condition, the the option
+had no effect and librepo always created /run/user/$UID.
+
+This patch fixes it.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/librepo/commit/9eff2fc7097bb2de44c258e8ce82f81cbab7f23c]
+Signed-off-by: Petr Pisar <ppisar@redhat.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ librepo/gpg_gpgme.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c
+index 136f25e5..89b1b98a 100644
+--- a/librepo/gpg_gpgme.c
++++ b/librepo/gpg_gpgme.c
+@@ -57,7 +57,7 @@
+  *
+  * We remedy it by choosing the label according to a default file context
+  * policy (ENABLE_SELINUX macro) or by using a different path supported by
+- * some GnuPG configurations (DUSE_RUN_GNUPG_USER_SOCKET macro).
++ * some GnuPG configurations (USE_RUN_GNUPG_USER_SOCKET macro).
+  *
+  * Since the agent doesn't clean up its sockets properly, by creating this
+  * directory we make sure they are in a place that is not causing trouble with
+@@ -71,7 +71,7 @@
+ static void
+ lr_gpg_ensure_socket_dir_exists()
+ {
+-#ifdef DUSE_RUN_GNUPG_USER_SOCKET
++#ifdef USE_RUN_GNUPG_USER_SOCKET
+     const char *templates[] = { "/run/gnupg", "/run/gnupg/user", "/run/gnupg/user/%ju", NULL };
+     const mode_t modes[] = { 0755, 0755, 0700, 0 };
+ #else
diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
similarity index 78%
rename from meta/recipes-devtools/librepo/librepo_1.20.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.0.bb
index 6557dda43a..d65567c14b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
@@ -5,11 +5,12 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=${PV} \
-           file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
+           file://0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
+           file://0002-Fix-creating-run-gnupg-user.patch \
            "
 
-SRCREV = "363cb70c6548be900832bc9b18ced3e7569da15a"
+SRCREV = "be788e8bb0c1dc53167e9e0fbe465ec14dac3eb1"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.53.0


