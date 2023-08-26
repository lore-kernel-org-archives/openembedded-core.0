Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158B7C83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10475.1693064340023083477
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jZqrYtrY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68bed286169so1687757b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064339; x=1693669139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQImwiCCp0J1ZOL2acYOrJxo2KGqUMsozBMkqR3s8f0=;
        b=jZqrYtrYJm9sHRiuJWqIbqDwe+4IqDupyw00hgz5qePlMpmEU/PR3xLOGhOMmbYd+6
         T4LoNql0FdahP2DaW2uqkeOlkrAKzOIYTBPHwQxGcGzTDCNe32eagVMw4MOGAFvhljHs
         wQNGmVbHq2zAJGw/RAVinKjDSEcc4qT9fiPLv0gzpEV9czf8HVxYR27luGEsLV2cDNhO
         uA5ZB363cQ9VDAcU49NuwgPY2C4Z2YQUA+O4rqXrkvIcz0xoCJMrkDQQU7CW1By5hiDV
         /i3DSa6qrSDcO+8OAEkDZCx+kUoyB3UYwmCzJw418qv1xfqhF3BqKXL5Yg3r58UIc8Jg
         UMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064339; x=1693669139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQImwiCCp0J1ZOL2acYOrJxo2KGqUMsozBMkqR3s8f0=;
        b=KPCkckAVpMHQkdTTlQ3T3mNKRiIps+lz+a9hGu79m/yF5GT3Hyt9dFzM2xxZ8rjWfx
         HpaLAlvRdJSoGuzdQ8PjRDHdEQQ9Hag/9FHAMrb5vWvmrj7rzJGGZLUazCgVOwcvkPTv
         yv3yvQTNBuA4LHyHtC06GQ1x1u0Sr1kHxDUsO69wpU5LllKlPNns4TXLBIFWfjtfnhYV
         OmhD+4dUd0oYkU1WUt6RratjmNcqv5c0TnJj/r9XHrG1uMbXU2Irb/aclaMnGscD9qqC
         rOBKUZlA1/vZERiopT/ClTTxP4eLOgWxxwhxwcrn76jPzq/Oe1vQHcyVBOc6R2OQn4YB
         CeoQ==
X-Gm-Message-State: AOJu0YyYH8D7hQuq49zzHY0js9nFkSr5dWC7spb3nOiVApOBULor6Ph6
	1hLwD89Ttaj12P8V0IXzn6aSJxUSPbHQ0fAYMAQ=
X-Google-Smtp-Source: AGHT+IHTlOLlZEVzubLUJ4g7HP9y7c8rOlVFAaENUCSKyW+eWBNVjXwpYThC0i2jilrAhJcJr6ut5w==
X-Received: by 2002:a05:6a20:1441:b0:148:656b:9a1f with SMTP id a1-20020a056a20144100b00148656b9a1fmr26295375pzi.20.1693064338687;
        Sat, 26 Aug 2023 08:38:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.38.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:38:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/20] curl: fix CVE-2023-32001
Date: Sat, 26 Aug 2023 05:38:32 -1000
Message-Id: <f6ab54c91d18d5ebb0c7e27e41f49fc17c9d8c1c.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186745

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
new file mode 100644
index 0000000000..c9ca3ae514
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
@@ -0,0 +1,39 @@
+CVE: CVE-2023-32001
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6cda615a036b8a2b4125f2c404dde]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
+From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
+Date: Mon, 10 Jul 2023 21:43:28 +0200
+Subject: [PATCH] fopen: optimize
+
+Closes #11419
+---
+ lib/fopen.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index c9c9e3d6e73a2..b6e3cadddef65 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   int fd = -1;
+   *tempname = NULL;
+ 
+-  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
+-    /* a non-regular file, fallback to direct fopen() */
+-    *fh = fopen(filename, FOPEN_WRITETEXT);
+-    if(*fh)
+-      return CURLE_OK;
++  *fh = fopen(filename, FOPEN_WRITETEXT);
++  if(!*fh)
+     goto fail;
+-  }
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++    return CURLE_OK;
++  fclose(*fh);
++  *fh = NULL;
+ 
+   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
+   if(result)
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index ecef173df2..bcfe4a6088 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2023-28319.patch \
     file://CVE-2023-28320.patch \
     file://CVE-2023-28321.patch \
+    file://CVE-2023-32001.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.34.1


