Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B86D0EE31
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4192.1764104111562697860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MDhZKhrz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso121686a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104111; x=1764708911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M3UsA8fV6t0fyXbOlzZRsQ+AJdCgCOlRODCI+9eUyA=;
        b=MDhZKhrzP1JpQ1gG9rtw4LBPIBrxUtPeQuLIFvNt+e91Yn1uq9D22GX841whH2gdXD
         7zyohIM2nvFXnilDqZqr+63ex+KyIiKq/14KXTh0HNm2OohAAZVF8X6AytyfM9JbLPdF
         o86mR5iTKVMfzj7VsVvY9x9ydq4UFMQ36VKIXy+T+Tem7fPGeI4buoWOBY/BPKrBZ5c7
         a82Nxt8C2aSQ6Hy2tW9wkuUNB1SoG9d7EX9CDERs3tRKmYO5lf+QwFMnoKJJRXAW0uS0
         0zbnPjRS2ACh/cHzmpHvWHs+0B7MUCp5O45N4wDCa44Cj09eby6lWIOJ2/TtNMO8bERo
         ro7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104111; x=1764708911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/M3UsA8fV6t0fyXbOlzZRsQ+AJdCgCOlRODCI+9eUyA=;
        b=xM+WU+tf4kYuzDX1FTjP618/6ziy3uDe5lvvLNv3ZvoDI3GtJ/8QZWCEmGYTBAD0F7
         6oehQgs0jolvfufD1+OiooTMfsDWGgbHlrJsU2ySpAQJvnCd7sRjpAB0F2Kd3UYiPhjB
         ALGMSAwxLJSae2KnkIKA0qALNIErzFOhyc42y7PnMpZ7Vtknis4M0iLUWbROLrfwK3Es
         Sj65QSEEWtf0zRBXZoKlXsq/zuSeDDssqFk+3oEBdFVnxbq9VGySJlvqqigUgN+4yZt7
         pZUNFJ6n1poHxu+YYm8eoEuVXjVWRYlwr4Zg7DNWwj5v1tWuDEzP20VkdyuCpBrJ6nVc
         TuqA==
X-Gm-Message-State: AOJu0YzPH17dQYyDRx1TEiTkvbfDUrOQ4rot4Q4wIJzPEPEXdgMoVhvM
	niP7pjjfHq9TSkxhRTgBeu7vW5p1AvKQ6ZPyKEDl1EsnGgFUImTL3FVTtWWeY3u6J/fzc+fJFhZ
	S6LA2
X-Gm-Gg: ASbGncvZLXrgXvGo+oXPsM13TryUaXCJ9iqTQQvGzYY2AAcOAS9YkmgPVtwoBzbL04m
	ZV3447VZKmKm7v2qYLDqbYorUUCnqyhOAnB+C+9uYYBAtvVcM2wwLduJj4BQnkgfK4/kgjP5XTG
	an9HQGubQbWffdueCME/3QSufxLN8v9yrOyrJT8ll+ILWrwhOkbWOFgK5XyHnAiGmlyaIpOq9ES
	1LESlATtkYIH5NwUuRtRaGuBLX/cHZzAOFne4PMoMoEO7FX6tpAq7LdtxcpWjNKXtKWTC0O5lx4
	2dFkxxHC37v0dYETdBVVkcNy/ZxelfKZ44PSxlmZyHoApR8NLdr1TlSeZLxjh0Oxgja6oSzaZk4
	XLd8V8+JjrruriqThpTbMPQaY2fFmjRsm6pHP2IOrOqt+L5nh0+J3QVdJ4tTTWhZ11sp/iVEbd6
	fZBA==
X-Google-Smtp-Source: AGHT+IEgaInThm3wqufzopCdbNp0AXv1BEMbgsmw0N32Z6Qa325xHC3Mb8sUTn5CVqzWJBzLXoDc4g==
X-Received: by 2002:a17:90b:4d11:b0:340:bfcd:6af9 with SMTP id 98e67ed59e1d1-347331a7104mr15925040a91.3.1764104110675;
        Tue, 25 Nov 2025 12:55:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] libarchive: patch 3.8.3 security issue 2
Date: Tue, 25 Nov 2025 12:54:50 -0800
Message-ID: <332f07635ccb4965a001f6536620c9d0b1a9c056.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226782

From: Peter Marko <peter.marko@siemens.com>

Pick patch [2] as listed in [1].

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/pull/2768

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-request-2768-from-Commandoss-master.patch | 28 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
new file mode 100644
index 0000000000..66e88c91b4
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
@@ -0,0 +1,28 @@
+From 82b57a9740aa6d084edcf4592a3b8e49f63dec98 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Fri, 31 Oct 2025 22:07:19 -0700
+Subject: [PATCH] Merge pull request #2768 from Commandoss/master
+
+Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET]
+
+(cherry picked from commit ce614c65246158bcb0dc1f9c1dce5a5af65f9827)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/82b57a9740aa6d084edcf4592a3b8e49f63dec98]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_support_format_lha.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_lha.c b/libarchive/archive_read_support_format_lha.c
+index 2a84ad9d..abf8b879 100644
+--- a/libarchive/archive_read_support_format_lha.c
++++ b/libarchive/archive_read_support_format_lha.c
+@@ -690,7 +690,7 @@ archive_read_format_lha_read_header(struct archive_read *a,
+ 	 * a pathname and a symlink has '\' character, a directory
+ 	 * separator in DOS/Windows. So we should convert it to '/'.
+ 	 */
+-	if (p[H_LEVEL_OFFSET] == 0)
++	if (lha->level == 0)
+ 		lha_replace_path_separator(lha, entry);
+ 
+ 	archive_entry_set_mode(entry, lha->mode);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index e0b8b15df4..b834f2dbc3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
+           file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


