Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D939CC54E5C
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.14873.1709739737653115955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiAq/zW3;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a44f2d894b7so557769166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739736; x=1710344536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnRxpXVe6UG/pA5flrRGSq9IbaDRRcRW8IihMqu27Rw=;
        b=TiAq/zW3M63Nt3nSBg8Ue/HMNWJSgME7lIbi458qKpa8efA+tSycnbu/Y17F69CrY4
         2ZzedpnA8uvzFaMGGJK6Uw9e4ABJ2HkbL1mwUQIVLLGUyrGGPwOk6tQJQKpRvXKrMnDz
         i89o519igQ+X3i8Zl1UKqCquk9Mv21vF1MZavJ6AaYVAOCdclj3JnfDnWL7uucEt/9A/
         H5Sz0ajPCwHi27HPm9yVhr3K5E6vHzHgvh+3vQmz+gWm4pjVGzMALzeCxLqNtFyVwZJY
         ZT5AEni7ir69ZhFaXw+bNej87oWIBP1M1vDJyUtkyNApoKVoFjTTOoI6Ry0Gwr+d9mFY
         OZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739736; x=1710344536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnRxpXVe6UG/pA5flrRGSq9IbaDRRcRW8IihMqu27Rw=;
        b=DCNOZ70ECH6UbpJcSPwkzsjhPFuT6iCrYqa0YSCCRVU5ZNbTP9E9uXsNdg58cI7wrL
         xYckRfMMVgYGmwJpM3BKMw5SmHHsokwdmjfPtcl1WnQpDbGqUIk0Dlg3TRlCfm6H2OLQ
         fmddWo2D80I5HS8yUoFIboouwjR5ua9ALenrbAkgZL415Ju6UrirbU27gaT3VW1kvdxl
         TFTsgHWVX3u0xrk9c63KMiHlHtXPFg0wlumCssid2Q5vSbZjIQwCWvKtph33LkcgToYB
         JnZ6sgVpqw1r11HvKZEBejmugxrEOLIrJ0HQ89EUWReMB+kHVIZPPf5Ey60uyYfnOYT9
         RfTQ==
X-Gm-Message-State: AOJu0Yx9Iocp5SKUNsSKTV1ucT4j0PtxPsFlGqnF9XzI0nohOi9B/vJf
	WQEx/p5HZRwwOH9irq3CHJFtMMq9y9ASrqNzNCEe3xCTeQxe3KHfJpCqWnEc
X-Google-Smtp-Source: AGHT+IFcDpJ8ASX5MrhH0EkpU/5dc5fBZCoacRCBLZD4tDsfXNGUSUZm9SS4eSYY8STCYWnCyO8Y8g==
X-Received: by 2002:a17:906:3505:b0:a45:200e:171a with SMTP id r5-20020a170906350500b00a45200e171amr7599028eja.33.1709739735944;
        Wed, 06 Mar 2024 07:42:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/47] minicom: upgrade 2.8 -> 2.9
Date: Wed,  6 Mar 2024 16:41:32 +0100
Message-Id: <20240306154151.3741709-28-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196711

Adjust selftest to git-add the directory with newly added patches,
as the new minicom recipe has no default patches, and thus no directory
with them (and the selftest assumed it does).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py       |  5 +--
 ...ix-minicom-h-v-return-value-is-not-0.patch | 33 -------------------
 .../minicom/allow.to.disable.lockdev.patch    | 30 -----------------
 .../{minicom_2.8.bb => minicom_2.9.bb}        |  7 ++--
 4 files changed, 5 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
 rename meta/recipes-extended/minicom/{minicom_2.8.bb => minicom_2.9.bb} (80%)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ecff3a9ebdf..a1cccc39ebc 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1165,9 +1165,10 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
         result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           ('??', '.*/0001-Change-the-README.patch$'),
-                           ('??', '.*/0002-Add-a-new-file.patch$')]
+                           ('A ', '.*/0001-Change-the-README.patch$'),
+                           ('A ', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
     def test_devtool_update_recipe_git(self):
diff --git a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
deleted file mode 100644
index 9e67126f3e1..00000000000
--- a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Exit normally for help/verison options
-
-If -v or -h is used for the help/version information, it is a normal exit situation,
-not an error condition. Sometimes these are used as a simple operation test of the
-resulting binary so the exit code does matter.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
----
- src/minicom.c |    6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-Index: minicom-2.8/src/minicom.c
-===================================================================
---- minicom-2.8.orig/src/minicom.c
-+++ minicom-2.8/src/minicom.c
-@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)
-                  "modify it under the terms of the GNU General Public License\n"
-                  "as published by the Free Software Foundation; either version\n"
-                  "2 of the License, or (at your option) any later version.\n\n"));
--          exit(1);
-+          exit(0);
-           break;
-         case 's': /* setup mode */
-           dosetup = 1;
-           break;
-         case 'h':
-           helpthem();
--          exit(1);
-+          exit(0);
-           break;
-         case 'p': /* Pseudo terminal to use. */
-           if (strncmp(optarg, "/dev/", 5) == 0)
diff --git a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
deleted file mode 100644
index 39dc5c04925..00000000000
--- a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure: Allow lockdev to be disabled
-
-When the pkgconfig dependencies may be present, it is useful to be
-able to explictly disable the lockdev dependency. This adds such an
-option.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
-
-Index: minicom-2.8/configure.ac
-===================================================================
---- minicom-2.8.orig/configure.ac
-+++ minicom-2.8/configure.ac
-@@ -43,7 +43,13 @@ if test "x$enable_socket" = xyes; then
- fi
- 
- PKG_PROG_PKG_CONFIG
--if test -n "$PKG_CONFIG"; then
-+
-+AC_ARG_ENABLE([lockdev],
-+        AS_HELP_STRING([--enable-lockdev],
-+                       [Enable lockdev support (def: enabled)]),
-+        [], [enable_lockdev="yes"])
-+
-+if test -n "$PKG_CONFIG" && test "x$enable_lockdev" = xyes; then
- 	PKG_CHECK_MODULES([LOCKDEV], [lockdev], AC_DEFINE([HAVE_LOCKDEV],[1],[Define if you have lockdev]),[:])
- fi
- 
diff --git a/meta/recipes-extended/minicom/minicom_2.8.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
similarity index 80%
rename from meta/recipes-extended/minicom/minicom_2.8.bb
rename to meta/recipes-extended/minicom/minicom_2.9.bb
index 2640c6b0574..907d5c79c9d 100644
--- a/meta/recipes-extended/minicom/minicom_2.8.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,12 +7,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
-           file://allow.to.disable.lockdev.patch \
-           file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
-"
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba"
+SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.39.2


