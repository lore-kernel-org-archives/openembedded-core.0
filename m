Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D61CC6B35
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32441.1792040636262941806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JAw3/y2M;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1af482519so20313095e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040634; x=1792645434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nh7UOtNWe5PyzALQ/UflpgcpJ7Ps7/WRN8jlHbzohwI=;
        b=JAw3/y2Mm/Qz6Uny2bA633WnoLSLvA4EKbyTFb1d8t8kqxpmznXx0NSii1rZ+C6xoR
         U6zxuqYiFYmoO1AOobhsknwUsICduRpb3CqaF94P+cQl0Y29tZIsSJ1goRCiGkswp3sq
         iNad6lTkBzmdDhF4ncQikgue0A5V/FC0Z74wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040634; x=1792645434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nh7UOtNWe5PyzALQ/UflpgcpJ7Ps7/WRN8jlHbzohwI=;
        b=RxJGgdH/37eQ0bBBacal2kjKaS2RdIN7wk+z5+tElMVQn7D5d9sLoOHg68EYDmURDx
         Mfe+BaU/hhAVTFVE9qrEx8+YelTH8/wCjLcRQNBDpmcX18nLnNs6jxuFdpfAWVhYqszy
         tWNqiXzgEBKFJjMuSWaqD2F1sJSBN7fNSpxgDFR0l/GJdkUowFeMMAGu2hUMGmrs3D7x
         Qvoi+LDUiIz7NZY20qiEdc0ZaTa2q5zga5/7x3RHANHXY4Ga/eS/20YubVYlgK/Nb9nG
         jxludXnPEeV5PC0SjXfs7Gt0S4lzn4s3s87sx/FDEUxOhM18ltSzc9nNV3rXxVi+LtHc
         APkA==
X-Gm-Message-State: AFq9FYJmAZ0nxNfi5DseVBMvJOkjDJssoCm7Vij9WcjjoWZEGlZHQz15
	gvcu/HQskIXIi7ikk0939mtchio25AnrCmiIf2qRtXvid6/CrABzohfvnZ+7vGnKf8B5q9Kvqbb
	at+nnyA4=
X-Gm-Gg: AYBFou2l2BXW5ue6Hm+/IcxbOLs14A862xkVsT3Gjgi4MJ3UON+bg4ezemQ5kGRUZVJ
	y4DdcXxtknGcxjwvHFjnP9GefWP4INv0Vhu+VhcJdcoikyu9o173KwEDAWFL602XWM3M/+oAImW
	toRodEy9kKuZl4e99H1wDDTw1eQZppZPsJAHUTJja2IfP080KPQnUI0mZU52qRMJcqA4MWpr5fo
	SGsfQP0FvUFMFC65LwYmp1sGsMUWTa9X2IiAVvIL/8RcRll+TeZ4QAi5Xhqc6ddkgB228Ariiv/
	gCEOttcj6+6Efm+wME9u0jezu8Vpe21uHsGejvjffJqyNEMYw0dQdDOelhk2jHbEkNyL+YkafCJ
	h+vBGEkogiC9bIOzQQrMKkSwZdUvA5cC4tiroOUzTln5CZHB3+LX+BqpX6Gl1fiUwW5h9AkaqS4
	oi0APJbQCHEXwiwbFhrYG3IAxtKGQRIuJs4KBzBsw664/xqQFBHBV06y5WHKZlzipovyH9IxK/I
	4WnZGqDP+lv42bH/i38cYjjxwGKxhl3Jx69RPgr6Ms09oqrD3MPqZQ7tWMvkZ5+hwXi64GQdA==
X-Received: by 2002:a05:600c:46ca:b0:4a1:7a1e:6910 with SMTP id 5b1f17b1804b1-4a18e48363amr359062665e9.4.1792040634290;
        Wed, 14 Oct 2026 22:03:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/55] expat: patch CVE-2026-76956
Date: Thu, 15 Oct 2026 07:02:47 +0200
Message-ID: <e87e00df931850adc20de85ce49c187a9d8aba3d.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247822

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-76956

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-76956.patch          | 26 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76956.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-76956.patch b/meta/recipes-core/expat/expat/CVE-2026-76956.patch
new file mode 100644
index 00000000000..96d9b68ee7c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-76956.patch
@@ -0,0 +1,26 @@
+From 40daa9996d616e66a75dea41ed2b18f2c3901b9f Mon Sep 17 00:00:00 2001
+From: Sorrachat <32319737+Sorrashut-K@users.noreply.github.com>
+Date: Fri, 14 Aug 2026 17:29:50 -0400
+Subject: [PATCH] lib: Fix inverted getentropy() return in
+ writeRandomBytes_getentropy
+
+CVE: CVE-2026-76956
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/40daa9996d616e66a75dea41ed2b18f2c3901b9f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/random_getentropy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/random_getentropy.c b/expat/lib/random_getentropy.c
+index d258df6a..ad8b1984 100644
+--- a/lib/random_getentropy.c
++++ b/lib/random_getentropy.c
+@@ -54,7 +54,7 @@
+ bool
+ writeRandomBytes_getentropy(void *target, size_t count) {
+   errno = 0;
+-  const bool success = getentropy(target, count);
++  const bool success = (getentropy(target, count) == 0);
+   // MSan does not understand `getentropy`, so explain its effects
+   if (success)
+     MSAN_UNPOISON(target, count);
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 5d30a844fa0..c3c9f738453 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-66046-01.patch \
            file://CVE-2026-66046-02.patch \
            file://CVE-2026-76641.patch \
+           file://CVE-2026-76956.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

