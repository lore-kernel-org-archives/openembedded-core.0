Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A90CA0FEB
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.64677.1756215890142346115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TFWTeLz+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24622df0d95so33209115ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215889; x=1756820689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSOWViRyMXu/JY96W72SlciQf1bQbDL1ZNyUmGM05Vo=;
        b=TFWTeLz++VssSCGpUZC4Xo3RmQtbZzaWQAfi7RKdWbxXFKtyGdPyuLInuWe4yjdkw5
         mxH/GTjRUFfL/i5VPuJTaiG2+Z6lUEZ8p/Mq/30izv/FWa0hplNAiEiC1Cpn0N1vj9qI
         13VNyPXq+oE7tdX/VUdVJMEnQhAK0N4oS+hr72lh0uhhcY9QXqQElOKEfAPTUc+ehWO9
         tFhCdb74UjdUtVw7c37kLVi264wpqDwVGPHKwduyqD6dirjqc8bl4809sk+TTJ0fjI82
         2ZxMUEIbM7ZyZXMekRMs7IyAqFvW/v9aTtg35PykhOFiAGuZNYEDnxt7Vbd3dF6/9OUT
         dfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215889; x=1756820689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSOWViRyMXu/JY96W72SlciQf1bQbDL1ZNyUmGM05Vo=;
        b=Kr5SgVrmqEXU2beHeymyiGzh2Uwpyfr3zEV7e9mbd+9tW+RQiu2+UsAojMDzFlpaaX
         +/NGii8A1Pgd5pkOFl3omFjJaaP+vRAF+HLXz/88cUWu6m+C9bGyrikr/60FY7aL4kRE
         O092cqbgInEzUZV2wb2Cp+8l7JWVQRhU/4fgEKSuuVc5bjs9Ka3avyS3dNt9udABb+g8
         Dk5QQzbImDHIFRkOtXj4Iffdk4yMJWA6rwFwZa08u2VOrq+Huc+aeZs04YmAp3jCokv9
         NeFbYopGg7CQLmxQ1IfReP3MaL1f4teD8puz1CjG6YhAhjaMYIxGtQr/oNET3Yc4N52d
         2FAA==
X-Gm-Message-State: AOJu0YwovOhLFCpjrytHUHWrIEcUOPMWe9mFduzQLg09XvDEJNbn43sn
	OlnOLES+TNDMF015r8PGzMh8CgAcf4cGUZIn6ZgQ0uxCFEEPiza8knsc5l9XafCE1r6PCMYz6Nk
	AVccD
X-Gm-Gg: ASbGnctIkPtIoRUbCpC8ltyAiNqjY6GR1ghqTCkcRrNsnuiInvvy3XQvcfjFB/IjU4I
	SmfPjhJqBF2pNvksWZIG1ktC5d2PkzwvlREShyD8gKB4ADcOpg/TZqVPo6MvpN6CARqA7wgRkLc
	cUG6Vg9nWx9AIWEM0n9xWAalpjoPlHK/6r5LyolavGkg5YJFoTg1WEtPKjQz+AsD5tX6pH0X8YO
	79455AeuFyFCpbC5MtavU0gwaSC2b4s6Hny080rdY51mynhTVZqAq/WemVvsvnYKFrJ+TT0XtwQ
	sswAsPnC3w1x3H+RP1nNtXS9dD3co6sg7II95ozKiuVCyfYabqWdZ6WwSyZRT8dpnQuE2zBf7x0
	YrHqypW2Vrybk/A==
X-Google-Smtp-Source: AGHT+IHAnhgsjEWcpYphxhBE8mvd9EglLh9HMfmPkZi2EJiaK7cbrsHmgi08vOfXQZre+FYRn1RhNQ==
X-Received: by 2002:a17:903:fa6:b0:248:7bf8:8db0 with SMTP id d9443c01a7336-2487bf89b3bmr11995065ad.52.1756215889115;
        Tue, 26 Aug 2025 06:44:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] glib-2.0: patch CVE-2025-7039
Date: Tue, 26 Aug 2025 06:44:29 -0700
Message-ID: <79355004da104587b2fb40dcb76053431c6a6182.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222468

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
Also pick commit which changed the same code before to apply it cleanly.

[1] https://security-tracker.debian.org/tracker/CVE-2025-7039

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-7039-01.patch  | 40 +++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-7039-02.patch  | 43 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  2 +
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
new file mode 100644
index 0000000000..cb096fca42
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
@@ -0,0 +1,40 @@
+From 285db475ecaa4d2cc39ce326b4c63aacb87ca6ad Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 22 Aug 2023 19:57:48 +0200
+Subject: [PATCH] glib/gfileutils.c: use 64 bits for value in get_tmp_file()
+
+On 32 bit systems 'long' value will overflow in 2038 and become negative.
+As it is used to index into letters array, and % operation preserves signs,
+data corruption will then occur.
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+CVE: CVE-2025-7039
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/285db475ecaa4d2cc39ce326b4c63aacb87ca6ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gfileutils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index 9646c696e..bd3cc179a 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1475,7 +1475,7 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  glong value;
++  gint64 value;
+   gint64 now_us;
+   static int counter = 0;
+ 
+@@ -1496,7 +1496,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      glong v = value;
++      gint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch
new file mode 100644
index 0000000000..37e32fefc3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch
@@ -0,0 +1,43 @@
+From 61e963284889ddb4544e6f1d5261c16120f6fcc3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Tue, 1 Jul 2025 10:58:07 -0500
+Subject: [PATCH] gfileutils: fix computation of temporary file name
+
+We need to ensure that the value we use to index into the letters array
+is always positive.
+
+Fixes #3716
+
+CVE: CVE-2025-7039
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/61e963284889ddb4544e6f1d5261c16120f6fcc3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gfileutils.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index c7d3339d1..286b1b154 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1475,9 +1475,9 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  gint64 value;
+-  gint64 now_us;
+-  static int counter = 0;
++  guint64 value;
++  guint64 now_us;
++  static guint counter = 0;
+ 
+   g_return_val_if_fail (tmpl != NULL, -1);
+ 
+@@ -1496,7 +1496,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      gint64 v = value;
++      guint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 31b6c1fe98..7ba52b5c79 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -62,6 +62,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-06.patch \
            file://CVE-2025-4373-01.patch \
            file://CVE-2025-4373-02.patch \
+           file://CVE-2025-7039-01.patch \
+           file://CVE-2025-7039-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.43.0


