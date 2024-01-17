Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38186C47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:59:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6548.1705507152622757008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LZpiy1lF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d5dfda4319so15948395ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507152; x=1706111952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1YP8gsdtm5jnx87xVz2ZIEzbGpZK7cvD76FFqdH02o=;
        b=LZpiy1lF4YXiR9TAoINtWc9+Ig/xvgvXxesR1pAEFkNTUBMtuvUXLaawjAjOyAL4S/
         fm0AalAuFqD60hRNnc6qG2oquBA+3FX1tmTvceEdy91jWW2BAKJWqjSTBah/yt02VlDr
         BNVhvN26V7kEgbohHXyc40jEmYXmfXJv6Jk0esreDhHY44um11F0b9daZZ+ZCqE+Gbp9
         iVOGFybgkQf7lNWP93bNkbychGBauf3rAYwxHVco7PcBefMk6SEqyrXZSofvJj1Ru6YQ
         VcL+8V41G159pdY2FIuTE/XCVhCSMlVaQMEWPpbY/EcJrwP+eB99fjpqCSpNiVMQ7+QK
         YM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507152; x=1706111952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1YP8gsdtm5jnx87xVz2ZIEzbGpZK7cvD76FFqdH02o=;
        b=chGMu4SAi/SqboaoGIsAiPbBoidzButLCxiUlFqRz4MfcXalxsMqDABa9KDvLFwM0G
         CvX3YqNC7Hw53B6xw0VEn/G+FnQiWvo4iiIITZk41/AbxqZQnnUVQJcCW57otOkIgJm8
         gPjOSWIiE6aPkjwgJntqDpwed2UtCwOjpVWHqBJpSVdj5DaU1YgIev4WeGfFNwzoxOFI
         3XfuBTLUftAWwxxC3PUnou+Zevw1/hXVGyVG6Obks/f0wHHIjxRJ+58yAL+Q1E/LXhkG
         WKBZO1CQTC/42yhgKdGx95Cku7RFDh9ZZmYuNCjTBzYDDwdHFHWPqXXiXTNe3QkEWbAp
         0Pcg==
X-Gm-Message-State: AOJu0YzZ/ysL/un5R02Q0rwLyQxrnXaGF1fgylYe0FwDaTnryRHdBkNN
	qgd6nhTAlZPSy21K7guOYxE7F4ZzVw0GiOLbgQcbDBuZekoYxw==
X-Google-Smtp-Source: AGHT+IEtHIbFpczESI2Eqcvm11sbnmCrkStb7rO1MIdhfihtBMFZpMT22Ob3Jn2LJXgFhqOV8713Jw==
X-Received: by 2002:a17:902:da81:b0:1d6:fbab:d40c with SMTP id j1-20020a170902da8100b001d6fbabd40cmr359810plx.34.1705507151624;
        Wed, 17 Jan 2024 07:59:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.07.59.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:59:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] Revert "curl: Backport fix CVE-2023-32001"
Date: Wed, 17 Jan 2024 05:58:55 -1000
Message-Id: <a3b6216bcb3425b6e30ca73488a5eb6ba58e4836.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193926

From: Poonam Jadhav <poonam.jadhav@kpit.com>

This reverts commit 5eab65275dc9faa0b9a4371d5bcb6e95cfda61cd.

CVE-2023-32001 has been marked "REJECT" in the NVD CVE List as
there is no safe measure against it.
These CVEs are stored in the NVD, but do not show up in search results.
Link: https://nvd.nist.gov/vuln/detail/CVE-2023-32001

Signed-off-by: Poonam Jadhav poonam.jadhav@kpit.com
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 39 -------------------
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
deleted file mode 100644
index 7ea3073755..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2023-32001.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
-From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
-Date: Mon, 10 Jul 2023 21:43:28 +0200
-Subject: [PATCH] fopen: optimize
-
-Closes #11419
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6cda615a036b8a2b4125f2c404dde]
-CVE: CVE-2023-32001
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
-
- lib/fopen.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/lib/fopen.c b/lib/fopen.c
-index c9c9e3d6e73a2..b6e3cadddef65 100644
---- a/lib/fopen.c
-+++ b/lib/fopen.c
-@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
-   int fd = -1;
-   *tempname = NULL;
- 
--  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
--    /* a non-regular file, fallback to direct fopen() */
--    *fh = fopen(filename, FOPEN_WRITETEXT);
--    if(*fh)
--      return CURLE_OK;
-+  *fh = fopen(filename, FOPEN_WRITETEXT);
-+  if(!*fh)
-     goto fail;
--  }
-+  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
-+    return CURLE_OK;
-+  fclose(*fh);
-+  *fh = NULL;
- 
-   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
-   if(result)
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index a36d03f668..9e9ff00bf7 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -51,7 +51,6 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
-           file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
            file://CVE-2023-46218.patch \
-- 
2.34.1


