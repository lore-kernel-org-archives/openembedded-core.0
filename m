Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75266EB8FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:52 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.7473.1694004526793048909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ermLrpR5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso2701337a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004526; x=1694609326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STEgofbZAG/ifb84uV+OUEzNkEcqDjiOyuy/e9qdUf8=;
        b=ermLrpR5UhTmamp/2Cqsus10p9rkXA6fdWtKlPIWG6yaMmqZNNBf2tbE0uFU+taG97
         i5ZWoUCS6ZuZxiyfHzTv3wF5F5PMJoQkPeg4+fz3LBTQvL6iAP7a3KhSrb6DH2Wr55/u
         9KoPM5BnRcPBBrBoqloIXPaY7Bqk90TaP5GhXtu/Gmnm5GGtRgqEEYQVlB/+qu2qcLI7
         obvttCkFaLSwnckrTezW5PYs0/J/oi334hiU/bEf/Duq/VTwguk1HVpQ0cyIIknygS4N
         OMq67X1beWJ59vH+lrUrhQ5t5aE/MC3c+3k6iTNUVeqDK2okHIgMAhONr/bltFe9+LnZ
         YIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004526; x=1694609326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STEgofbZAG/ifb84uV+OUEzNkEcqDjiOyuy/e9qdUf8=;
        b=OkGtz7v0ljenM9nwtOYODYSdPkDkqjhIX7nPd8ztqdiFKn1QwOvyxldY80RsQYwE15
         wr1aWjXAbAvMiGEuULkqxN2IfxS9w70d5U6h2Mp13vYII1shfhHwC+hwd1HMVEA6GsLX
         jrbpyKkDAa0lhyKiCuTnQW3mHlgefep9bThmKqSo3BymNtPqi+q/XlgGs7MqW3YEQoBI
         hkqWZuSZPCsNPIpv+pcyK6ElU0FR2Kv6TH7d9fd4p06Wv8/DZ7NXxOs9SvplqRlxb6Ai
         WvwlYJ1iGgQlMrFaafpW88lNRC2xW8/79+zF8dCSDm7m+1b1myALl6Xj7KaWZO+zqfBX
         HpMg==
X-Gm-Message-State: AOJu0YwSxsbeEvLwfkTeCVtVw6cw/rJ3gd5Vcf4niU2d/d38mIjDrTMt
	89qcoGjElSwCPkKg71TRJy8Z0O8OGpYmOGj1Uao=
X-Google-Smtp-Source: AGHT+IH9BIOKhWqD3kobbk3Bj/DOur/SrCyP0m+nFnBIOcoYaizW6dIN7vWoWKilrgyO6uMelBaWTw==
X-Received: by 2002:a17:90a:6e45:b0:263:2335:594e with SMTP id s5-20020a17090a6e4500b002632335594emr15481433pjm.38.1694004525893;
        Wed, 06 Sep 2023 05:48:45 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/14] file: fix CVE-2022-48554
Date: Wed,  6 Sep 2023 02:48:16 -1000
Message-Id: <20b5ead99d4904e70ea22f573bfefec8c6e862a2.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187305

From: Chee Yang Lee <chee.yang.lee@intel.com>

ignore changes to FILE_RCSID part.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../file/file/CVE-2022-48554.patch            | 35 +++++++++++++++++++
 meta/recipes-devtools/file/file_5.41.bb       |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2022-48554.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2022-48554.patch b/meta/recipes-devtools/file/file/CVE-2022-48554.patch
new file mode 100644
index 0000000000..c285bd2c23
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2022-48554.patch
@@ -0,0 +1,35 @@
+CVE:  CVE-2022-48554
+Upstream-Status: Backport [ https://github.com/file/file/commit/497aabb29cd08d2a5aeb63e45798d65fcbe03502 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 497aabb29cd08d2a5aeb63e45798d65fcbe03502 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 14 Feb 2022 16:26:10 +0000
+Subject: [PATCH] PR/310: p870613: Don't use strlcpy to copy the string, it
+ will try to scan the source string to find out how much space is needed the
+ source string might not be NUL terminated.
+
+---
+ src/funcs.c | 11 +++++++----
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/funcs.c b/src/funcs.c
+index 89e1da597..dcfd352d2 100644
+--- a/src/funcs.c
++++ b/src/funcs.c
+@@ -54,9 +54,12 @@ FILE_RCSID("@(#)$File: funcs.c,v 1.124 2022/01/10 14:15:08 christos Exp $")
+ protected char *
+ file_copystr(char *buf, size_t blen, size_t width, const char *str)
+ {
+-	if (++width > blen)
+-		width = blen;
+-	strlcpy(buf, str, width);
++	if (blen == 0)
++		return buf;
++	if (width >= blen)
++		width = blen - 1;
++	memcpy(buf, str, width);
++	buf[width] = '\0';
+ 	return buf;
+ }
+ 
diff --git a/meta/recipes-devtools/file/file_5.41.bb b/meta/recipes-devtools/file/file_5.41.bb
index 653887e97a..6fd4f2c746 100644
--- a/meta/recipes-devtools/file/file_5.41.bb
+++ b/meta/recipes-devtools/file/file_5.41.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
+           file://CVE-2022-48554.patch \
+"
 
 SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
 S = "${WORKDIR}/git"
-- 
2.34.1


