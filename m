Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCE0FF512F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85277.1775578586511826903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FMWXchdg;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so48574575e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578585; x=1776183385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=FMWXchdgsQdPGaqfOtl1t6KnpEZMn7qHpzXLC1L0NE+vsSFmieQ/aXFAK4bqUTtKpW
         BKLFoYBW2n+WtV7ZCa8Ax4VZaJEjmM0WAce8RJ4ovrRQmdltaS+0GNkb6hTcibLbjcQ4
         IgSpvjLXpXwEEnt79dSzNfw1NZUR5JR8JQlmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578585; x=1776183385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=R83pyzraSTZckS8G24zCI25UHr8ffAEj9WjCUSs7AOw8Dmv3uQ7mDERDN9D97wNPvp
         OjHFedJB1ny+d5ehmc4PPvTZp8QsqX4tcXjp2NxrNPNvjIqOORvyWKl0Mfwa1axe2Q0A
         41vjGPOIlwanam2YaUeWvXh99v8SufDtAd03YA59Al/AWi7RP9Aj1tXXQ1uDB/xFH22Z
         QYOh/SNVdEiz68tcdv8saDNttcP0laDXIEB8X69b48aqDFrnYugHCTnxTpGqPVJdKVEr
         wKS5Q6eHPRLzAcs5N+OhK3fZo1P1Zf6asn03xvJzK3wkKcbgyFvIuJxT2UXREuBB9vgq
         U/4Q==
X-Gm-Message-State: AOJu0Yy7E6aRqzvZqRiRT/wp74JS7WxlqfnrxSWXlJlIYgx45doaXGnL
	IdpvE9l+LYPTNVVkcXqwlNZf3CtyVwWnFAoZvj15FugPQZTIkhcG0bkX9qNOFd5tH73BUVMkiqC
	ooBguwLA=
X-Gm-Gg: AeBDietJXnoBc+8vuG8AxNeDbNFVb4nKPKeAKHeciocfaGAipm8dK9UgpUaNMlr5zMW
	BmCKIYlGNH8WZ4oi6rKRpBxltn6A6k9d5InTg3tq4SeZIIevS9B03zSFXfI2N4QGrkQyV9zcXDL
	/wT3TXeQh1UGpdiQSbvQP1jN32rXn6L1TjqQqcpJu4XhyhGB9XZtGkcSWxAAnqSYcblAmwE1cBA
	C/YZwW/zp1qLqFNN7JwNBSq3xZSw5AJNOo5hd24HTVk4emQB7JjeRhbQmgENQPKv9THQDkOvbVz
	W0qLwPwMkp4hZkWgoatPWTIXasGerzk7MhkuM9JDANMBDONT5VIB9el0rF6ZHqIXFtpQTekrljA
	XOsysY6INxDIaHW/vrdjAmWDnhGfmIUG11++PZoy+4iiptqOypK6qaoJY3mgXlhlhOMQiKb89gU
	Sg9zr798vXcm+RosZBCMWqpPxiiQbVMvirckvQIv3Igz4FNMoxytROa01zrCpJWqVAvmnytsc5u
	NgMsHaCbCosmFBx//WwJ0zsh1T8
X-Received: by 2002:a05:600c:3495:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488ab5bd9camr149839685e9.23.1775578584486;
        Tue, 07 Apr 2026 09:16:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 12/19] vim: Fix CVE-2026-33412
Date: Tue,  7 Apr 2026 18:15:49 +0200
Message-ID: <910667342b78fefa22214f6375b657e8b130a24a.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234764

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in NVD report with [2]
[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 00000000000..62daa308b58
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,61 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/os_unix.c | 2 +-
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ # define SEEK_END 2
+ #endif
+ 
+-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+diff --git a/src/version.c b/src/version.c
+index 4f3912aedd..712a3e637c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1684,
+ /**/
+     1683,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be707..fc9b4db055a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"

