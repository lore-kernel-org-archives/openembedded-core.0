Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F70C41535
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:23 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.13008.1703038693626881696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KRM72Egu;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-593fef9bb8cso273346eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038692; x=1703643492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0OQLZ3xUYK/Ru7uUJwIX2Ok4Kf1FNS+8djWJ0qwBWo=;
        b=KRM72EguTbTcVV5Wj0qVFDCTlObI2KdyLqVh7S/2C73Wf/NeCL0gk6+n8cVYCmotHU
         Y58yL3hfFwvgntIV96w/5wF3Ew9N5Fm4Q3iVN7aJnm3fbcd1BPi6PufFEy0wEITU5iMX
         MHj0xMdDwDBW03on3vBsKJBR55UGyz4YKHNxr0NyF+0Ew7aCbnNmXYX67lHgxcw3FJSe
         TG3GIHsYYKHvaHr0qVnqGy+AxQrfxRZS184CpaJpicRsyH+Sod7j/DpPTWNRWnQI9+LH
         p2ZIpKYwVsf6D8IaBLAHAcT83ZFeocKI0gKfHV/9m5YGj5RPf6mJ4FRSDc8f/XzN3E4m
         1scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038692; x=1703643492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0OQLZ3xUYK/Ru7uUJwIX2Ok4Kf1FNS+8djWJ0qwBWo=;
        b=OmzbQl29vM89cQjxduPBn7aS+5qjFsCZeh4hfjjPIaEaG0YobW4sLclrFXjKwZ6kMT
         dYkD5imMG49pioqzlOyErkTo7o13axDPsdBlFV6OXC2WOYwpZQW9+25uZzQZfOB3qksq
         OtSi0qJx2P2dvLtqnp63c+2R/RnKt8uX6bRU9+kp4ZPAeXqD9h1G+52DPk+E8px2VcSX
         aZYvaTrsUVSwMLoKgE4pEB+i9XFeXeg4e5F0cRiQ/7C/IZtm7d7NiCMgJ1s5ZYG68jWj
         jYvCiIOPjd+eXIxbrHgQ3ATjxERVlAWOh3OlX+UQjDAOBR9stfYS12rqC/o1YwRB1QyD
         S7TA==
X-Gm-Message-State: AOJu0Yz3/hLc94snjQo70IiwX5mlp6+Ksnz0Aza2IuvADGCT569JV1rQ
	5HLsr1WbDZKG6km6hhpyImBfnCvvJfzQ2QvNpIFlPA==
X-Google-Smtp-Source: AGHT+IFhuXkohSNtqOesE6udslh03iObU3c6EwyxncV3cqVTJ37RJUeM5VfJjq/FTfRP2m73VyE8iA==
X-Received: by 2002:a05:6358:9209:b0:170:1d30:56e0 with SMTP id d9-20020a056358920900b001701d3056e0mr21020567rwb.30.1703038692091;
        Tue, 19 Dec 2023 18:18:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 3/9] curl: fix CVE-2023-46218
Date: Tue, 19 Dec 2023 16:17:53 -1000
Message-Id: <000b2a380021f2c7fd102b6523a986c2e7ad20ae.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192762

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-46218.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.4.0.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46218.patch b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
new file mode 100644
index 0000000000..de2f095664
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2023-46218 
+Upstream-Status: Backport [ https://github.com/curl/curl/commit/2b0994c29a721c91c57 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 2b0994c29a721c91c572cff7808c572a24d251eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Nov 2023 08:15:47 +0100
+Subject: [PATCH] cookie: lowercase the domain names before PSL checks
+
+Reported-by: Harry Sintonen
+
+Closes #12387
+---
+ lib/cookie.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 568cf537ad1b1f..9095cea3e97f22 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1027,15 +1027,23 @@ Curl_cookie_add(struct Curl_easy *data,
+    * dereference it.
+    */
+   if(data && (domain && co->domain && !Curl_host_is_ipnum(co->domain))) {
+-    const psl_ctx_t *psl = Curl_psl_use(data);
+-    int acceptable;
+-
+-    if(psl) {
+-      acceptable = psl_is_cookie_domain_acceptable(psl, domain, co->domain);
+-      Curl_psl_release(data);
++    bool acceptable = FALSE;
++    char lcase[256];
++    char lcookie[256];
++    size_t dlen = strlen(domain);
++    size_t clen = strlen(co->domain);
++    if((dlen < sizeof(lcase)) && (clen < sizeof(lcookie))) {
++      const psl_ctx_t *psl = Curl_psl_use(data);
++      if(psl) {
++        /* the PSL check requires lowercase domain name and pattern */
++        Curl_strntolower(lcase, domain, dlen + 1);
++        Curl_strntolower(lcookie, co->domain, clen + 1);
++        acceptable = psl_is_cookie_domain_acceptable(psl, lcase, lcookie);
++        Curl_psl_release(data);
++      }
++      else
++        acceptable = !bad_domain(domain, strlen(domain));
+     }
+-    else
+-      acceptable = !bad_domain(domain, strlen(domain));
+ 
+     if(!acceptable) {
+       infof(data, "cookie '%s' dropped, domain '%s' must not "
diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-support/curl/curl_8.4.0.bb
index 5f97730bf4..8f1ba52692 100644
--- a/meta/recipes-support/curl/curl_8.4.0.bb
+++ b/meta/recipes-support/curl/curl_8.4.0.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
+    file://CVE-2023-46218.patch \
 "
 SRC_URI[sha256sum] = "16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d"
 
-- 
2.34.1


