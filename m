Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96242C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:47:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.5799.1692931669188571528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=CJPgSt0Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68a440a8a20so451585b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931668; x=1693536468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rr2XoKpvVp8lIuYbRa/4KxC6zSkY+v7JUD82PPJOd9Q=;
        b=CJPgSt0ZntBmqfPjTAc4ioUg9lODCXKcWySwLTjC9ySH+e98Qc0J35VF8HhsOTDocr
         9DFmsaCu0rDoVm3cRnPZINecqIZLmPrsGmhfq5kyG96eDHMAFi1Guapr7jOvY04tvJ+l
         fhO4A+dE+VmFUk1Z09oF3t1sevkWbJ2pdeyVvvFPbkR2HEWPQGE5S+Z38dF1O5pqGeCF
         bSnq8/pp7Jedy//yPAa/AY36VoS5bTaqzp3DorqJNIuFw+JdXRzCvS4YhuwssgeHeyBo
         g+VRI7lpHxeNMo53XGs0ugKvOlUw9OTiu+UdM5vSGOJquhuouQpyigkPOuV6fvBhFDRc
         9z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931668; x=1693536468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr2XoKpvVp8lIuYbRa/4KxC6zSkY+v7JUD82PPJOd9Q=;
        b=A5y5mpLMGtsZ7o96QvyA0sankjAS2sPVUFkJhr2Zv81KkJ1Dh/WpxRzv53kPtBZmC0
         y4Wj5eN36ixulM5378mkt/mWXOfIZUOcCC2Qe6ogLLcPqlwc7jJ0NqFJukNW/zaQeuS3
         dB1V7D4N1XIm6HzSRyOwGqd8DR1gWRxQhGIF4pfHrFCiIWnZtUHSGZobF5QXwxfcLgDV
         CH6ixYYuc/LCwvHgDOS3PLuWbk7GT+OhlD2lA52kSsZ9CBUET7FFx7IYxVZHXmgPs/s/
         QxHeMl9m9nsZw4Lm4jSsMhFBPsGYlmZntpXmgWT/PrnptLN+GcJn710o2SCTwWGGl2Ix
         zbpQ==
X-Gm-Message-State: AOJu0YwkQdzXgGbxl8MCtMS07YJopPGxCwGyWMYQ9CdADB3lh8Wb2+yN
	0ogPvywqacFYX7MKjYU+qX7s/9FmdHPNrJGbAl4=
X-Google-Smtp-Source: AGHT+IG0ITS0IvJrFzPon3cfLWdI96r7RR6cYt8f1fCBkSqWcDXhbelNr9Jz0xIuL1GVkoWHW/JQTw==
X-Received: by 2002:a05:6a20:1441:b0:148:656b:9a1f with SMTP id a1-20020a056a20144100b00148656b9a1fmr20981340pzi.20.1692931667920;
        Thu, 24 Aug 2023 19:47:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] curl: Backport fix CVE-2023-32001
Date: Thu, 24 Aug 2023 16:47:25 -1000
Message-Id: <71ed22673545fc2bca5ac599416ecb42eb2781f8.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186674

From: Ashish Sharma <asharma@mvista.com>

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 38 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
new file mode 100644
index 0000000000..f533992bcd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
@@ -0,0 +1,38 @@
+From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
+From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
+Date: Mon, 10 Jul 2023 21:43:28 +0200
+Subject: [PATCH] fopen: optimize
+
+Closes #11419
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6cda615a036b8a2b4125f2c404dde]
+CVE: CVE-2023-32001
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
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
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index ce81df0f05..2a52e8233e 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-27536.patch \
            file://CVE-2023-28320.patch \
            file://CVE-2023-28320-fol1.patch \
+           file://CVE-2023-32001.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


