Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEC4C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.917.1748446416137859191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KjvC33lp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so4070034b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446415; x=1749051215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GTU17lId6JRjfPgggQY7Va6v1g7/m6G4XZD4cFPAXo=;
        b=KjvC33lpseDiQ9ejGR6uaOxOikUJ/NkHAs6/Zj1fA5MUGitsY/CpFjyr8lpoPeJO7e
         CFjybfq01pQUzYuwu++JaOGDRbERlMDcKf8XwBB3sS24LLeYfESNm2lj+NnR6QtQbCG3
         PfWXgOJ0TlPUQQzw4hxdSiby8BRRUdjVqH+Xp8g1WrJ30YzFCwHEItZ/uv8K13t86NgF
         BcjiSpstn4+lMcD8eAg3gP8J0UoVAm5KpwbAtrtXtEVCGfvXFb5IesCzHpZ+LB++dtC2
         UrX1gfDj/kUj1kjgtKE4qoiwpA+xek5Vc6t5iaNAnHdkBE8VCdiyBKRX2rLeBkQ/g0Ue
         gjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446415; x=1749051215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GTU17lId6JRjfPgggQY7Va6v1g7/m6G4XZD4cFPAXo=;
        b=vpKdsBEgrpUC6f9Zm6n85dK1MdsmsQ64/Os+fny+I8fsDY7zcqK5PFrgxXQtQZ0i6d
         nbZD0EyzPQ0Fpfs/nffiY6CCKgDuoMewfl7NhVZVD2zi9Qea89C6P3MZlKlxr6Yathh9
         p2zPshZREJ/AV7FyDsHXBhqqkWDFPRjxDA8FgIQWbO2ZR7+KyLrIt5M7NSiXCHOwbgBz
         X5g9Y9r/tms50BNJfGARsFtERxTgIL0vp4yESRH/j1ADDc09ahqLOFobBFvM6156Lt8k
         dNBueNsZZRoIN0QMLthX+oNxcFw+PibJM0+2kYf2V1xmRSPDHh7WVpcgEpTTPoBQK5OS
         OARw==
X-Gm-Message-State: AOJu0YwQx8k14ohnqc4RJfw2/8TlBJumcGZlrKkjFp8R34UKmO0DbU3M
	zx2JQnd1j0gZV4PrOyngTfJ++jMtKCNqkfeZLwvI+ikmsQMUJMkcwZ0P6gE9WGtzTTG5Q0NYU3N
	k/bKI
X-Gm-Gg: ASbGncv8hmEtDFb57q9mEXhk82g9WwnI9/ah9r3Khj8K0Aac4BBPixMpIywa1QuWQIX
	RuRLc2YjConpB+Qj8TAp7Z/avXZVp7rTtgkYbnBGuUtNi77NNFlziVK8JGOhkwEtqz7ZD0CLn75
	SrtA6sRSErs7S+lCNkywU+X0p/wIeskClHTI8mpddzv8wHwfA1EsElZt5cVc+26hauvq4Ly/y1y
	W3r+pBRh15U8O8SjK1rY5dp9bNxlHip/8aFgfrpqUnJWhvNTog9HeJ/cKVtuGHsQ4M441/wWB1l
	JPEEgQMf+ydCmUAFcTDAFtMBUXLajYXwnSzXr31JhRY=
X-Google-Smtp-Source: AGHT+IFiQ64ht0Mv7B/pFa+8c1j5BhB1IcJuuB0+unFmeUE0DvE1/SMUSTz67WgviS/T6vioY6oqAw==
X-Received: by 2002:a05:6a00:4b55:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-745fdf34c71mr24536642b3a.6.1748446415281;
        Wed, 28 May 2025 08:33:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/14] sqlite3: patch CVE-2025-3277
Date: Wed, 28 May 2025 08:33:10 -0700
Message-ID: <341297828a5b7c77e6d9113d5abcd22c3a0c224a.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217365

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://sqlite.org/src/info/498e3f1cf57f164f
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/sqlite3/CVE-2025-3277.patch        | 28 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
new file mode 100644
index 0000000000..8264d4443a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -0,0 +1,28 @@
+From d7f45414935e4ef6e3361f02a22876f1ee7a04aa Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
+
+CVE: CVE-2025-3277
+Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 08c593e55c..24d0d954d9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -130954,7 +130954,7 @@ static void concatFuncCore(
+   for(i=0; i<argc; i++){
+     n += sqlite3_value_bytes(argv[i]);
+   }
+-  n += (argc-1)*nSep;
++  n += (argc-1)*(i64)nSep;
+   z = sqlite3_malloc64(n+1);
+   if( z==0 ){
+     sqlite3_result_error_nomem(context);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index bd2ac6614d..86983f21bd 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -3,6 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+    file://CVE-2025-3277.patch \
+"
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 
-- 
2.43.0


