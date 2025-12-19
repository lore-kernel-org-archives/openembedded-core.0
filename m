Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457D7D74953
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9347.1766114610831429193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+wDLJGx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so1418912b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114610; x=1766719410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI2U3HH0J64hah9ludIUnIWtdE3Gzia8yn4NeIWxt3o=;
        b=Z+wDLJGxNQjeH43Xyjwh5VCD9wwAvYsdSeNiFSkvFbvdGrGYBmbmnLlBNcKZGG068F
         JdCn0T+2GZpzzKfeSIM0+DiaAOM1m19TpPzcnB3D6PmvKOYyQp6gbb/jCiljY1Afa0y6
         mDfQ43qCrUw2TRYSqqE7B2s8yPR2x8uxHZLXiufwajIpcFPTPik3ns2Tyih2bS0bXfKw
         b42f8iKnXNHq5A0kf/2sj07IpGL49SOI9K41ixLbs8my9Xyg7qg0OdhwetHD8tgTxBdK
         H00atgPhDngaRDfADrAltC9JZ+FTm26/jNIg0yVqgWoBDCgt0osWF/wZ622IHKujQTns
         cJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114610; x=1766719410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KI2U3HH0J64hah9ludIUnIWtdE3Gzia8yn4NeIWxt3o=;
        b=mRZVGWIIoDLCucv3nxSFdqDQQ2Digrxwoecdxxl1NegwkRB3Q1k2mbuOc0BEr2Ikq9
         nKig7qWGfkB3Y9g1FvfzSaw6zWhc+JBqDghabqbClbMXWwbwSSkzmMq8W2kQD8sQTrKZ
         s/4vOr2wMMubHnsUIW221YUzFH82JYbx7TExdj4bz00VwUL5MZoXteSohBHI03OroUDg
         Y8UqXlxzPf4KgwKueRqc+oHZwh7pP6/wPk8ENbgcSHh6lF/wzXSllOLrIrj4gEH6rHFq
         Bud5DDRh/ZF4bS8wUdt0e17IAf6Pjs/WH0P3UqpHZHwxlpeWbf5kaKxAtUqzAT+CdpVq
         dzPg==
X-Gm-Message-State: AOJu0YwGi7+jdE6XbJwUnJZhBNO4zzH2K+OngH7MBa+Qhs6woCcogzan
	gvcrj8kndY2JnpDKbGWFnc4Ms3MSmLmsPiZb0EC3T7l87pot0nOgc0gqjptvng==
X-Gm-Gg: AY/fxX7Y0u1dZTfqbWpn+MPPd6ABQMBJI1tjwg0gy8CcA3AaMlldCbQ547tlGXdaPUt
	hfpINDg8s/baC3n/7yXcS7byTnHRQnGJ3EpJTUMnvoa5pC34kUIS+Tkg8dnmiLhhtQRWrsmKhyG
	Bsn+savbSl6w3VtPlgp8C8LN8pl7WMxEcgrE1G7iGyip/TuGjottn+P+k31jw2n5b5fuOBAEvcU
	TTYPTGCeN0G3ZKlY8JfaDd6N7uhibhtmIei3XUD3jfJov35SAY9mGwF8lMtaQNH0bAX3Iwr+bw7
	rnFM3t3sUPlYMPxSW7GTHwywqTsU7KVEwc/m+yY3cxI0f+4udaNeiiEohXud5sGSgqTZRVTOrOe
	EuokezPjQsrtSYBbyk5yHjEenaUlcEe13pUfEwQNqKET/qXSB0J1hMm3wc68vladrs7fVBi8Jpq
	AdKWIhJlhXJRkM668tRE7EHciz
X-Google-Smtp-Source: AGHT+IG+Wb7cG26WoaUWcRSGZp/7lbkeYclN1LqEA2LBQ43hrWHSbhdr0mWy2IVIaUWThfS3q33MkA==
X-Received: by 2002:a05:6a00:1d8a:b0:7e8:4433:8fa8 with SMTP id d2e1a72fcca58-7ff66677972mr1280975b3a.48.1766114610014;
        Thu, 18 Dec 2025 19:23:30 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 28/29] sqlite3: patch CVE-2025-3277
Date: Fri, 19 Dec 2025 08:52:07 +0530
Message-ID: <20251219032209.960840-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228196

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-3277

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sqlite/files/CVE-2025-3277.patch          | 29 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-3277.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-3277.patch b/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
new file mode 100644
index 0000000000..a3e28465f5
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
@@ -0,0 +1,29 @@
+From c4add21ff123bc01be51f6e7374a14c2106e3686 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Thu, 18 Dec 2025 23:28:45 +0530
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
+
+CVE: CVE-2025-3277
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f4fc2ee20311a0a5141726c71d318ab52001c974]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 80433f6c1f..8a43734131 100644
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
index bd2ac6614d..4988231a0c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -3,6 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://CVE-2025-3277.patch \
+"
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 

