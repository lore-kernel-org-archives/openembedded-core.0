Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D6FEE49A5
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71729.1767125536938901964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=29U/JzsR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09757004cso131621325ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125536; x=1767730336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nw9FV6T8wnTaUrSPa8fZmAK525aQN8So/1FWiF+1yzU=;
        b=29U/JzsRn+og4tO534xD4HQRdoyhNZR02jQMkN7KNWNYUhsBzZtQVdGXJFfYpOK8ZH
         xnSM4/FOytRIgzV6/JDGRxl6Kqs34jgRxZ8UAHpNXp+uEten2BkKHUq58Ywud6MdjkAO
         F9z/H2KdfloubR8JvPRWJnpBwuO/+DxVJlYEYpZdhJTZZrG0LCGESAo+YguqwC6iuBf3
         sq3qBYtGt34UhrgQurTpNus2+P2TLHlb3iqrN5lcJREP4GwdHNoo66AjBYDTDxiPDKoI
         Iaag2Zp/hy8Mjw9bluD/jY1+OO7TUI0N3Wq0KaZt5D4poS4KAAzbkLWF75b/D03jx05i
         Uukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125536; x=1767730336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nw9FV6T8wnTaUrSPa8fZmAK525aQN8So/1FWiF+1yzU=;
        b=PvIgfi3G/IkjisQcAVBtvCHBsLAJo/BjdiEG7DrQFb9jXc1zs/XZrxo4NyZXD+g0sS
         tI1cFCfUml0wjVHiF5Y90S+eJIp1T0dHQJTOa8PTgz3DQsnD/SAHJ80ZUZBXoYFlGIrA
         Yd0OsoyKPuH9Rk7+sa6m6ktdrGA0dq0VaGNjOlQSWlqzm8DZELdWwybi8JSX+XbR9dMM
         dHmA/xMgLyJ+Q8NmeTMDEpQHu/5m1TaowfeE52cbUJ/KpgC7T3CxSrHz0uFq/djAc+Pb
         8gtikkF/zzH3Twa4684y0qxnfScqHixItIG/VyG45R8bq8TzlmFvTO6fqqZJkAECzmMr
         baTQ==
X-Gm-Message-State: AOJu0YzX2hFa6IRhF9LC216F+JRn/rwvjmo7l3hZht7o1h18tEVM3xae
	H6LQGTvQlNT7DI+5NulVSKuAGcMVYZHGru+bnZxhjniMo9SNkipvxYTSaT4OVtXYOaDp23xBwNB
	KLJgy
X-Gm-Gg: AY/fxX6ofMNgZQLz4FHNl49xCNwFsvq7ea3yrHkw/kIyNlmcFfeOJAxLEn+B8WrFLIe
	6CgeO0hw/qS3D5gppK+PqTnylqQ8BQTtgaqsDY6k1rkNkpUEQedRkg8f5Y4Dk+NVBT/zD6Pl88T
	VeWRpLEnVh04ua9RuxpReG3un0KuMRL6tmO7PmUrS/av9Dpf7taiGlmwsTpzwmZrOBVXYL0zpWk
	YTk1o8ZQNWXERsOrzm5NB6o+/BMkEY9cIPr78XIAxQmNGkpLXSXqLLz0KnGSZhnuggB8AKSe7zR
	2hsBvBTZMlGN84dYAjcSMMxQw01eez2l2aPhRCYbPkp+zs7IazibKevBieAfihL3HnN52KBsnSR
	NHFICAlx9K3/wiJHkwdJ+Ecwf7PW/bNJuvgYAsgRkrIKS+pYzNm8C/gLKe+d0e4A6v9UtsNcaN8
	b76w==
X-Google-Smtp-Source: AGHT+IFomlMzbXqgG184Fu9D+8CNt0pUPmNvVBXqByv/IBWUAp5KjIYw9Wm+Wx5z05qDSt8NYGLP4w==
X-Received: by 2002:a17:902:e950:b0:29e:a615:f509 with SMTP id d9443c01a7336-2a2f2426e77mr292961375ad.17.1767125536055;
        Tue, 30 Dec 2025 12:12:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/29] sqlite3: patch CVE-2025-3277
Date: Tue, 30 Dec 2025 12:11:34 -0800
Message-ID: <40eb5dd4c02f520b4f51797df5519842e0e8232f.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228696

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-3277

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


