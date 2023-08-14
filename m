Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD511C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 03:19:00 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.99752.1691983135776020552
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 20:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BBiNG79L;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-26b4cf4f77bso620014a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 20:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1691983135; x=1692587935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U02WWJNAM7qxa0+dpx4NVwm6vLhsjgGMLjLB+toqmT0=;
        b=BBiNG79LlwiuHKXyvGcnE/C0VdugRDCH+fM8VJ4Qwnd+9a5h1Moc6hcMn8LdXWr2kA
         +IcCEDFpMiycOYpHPYmvcjKBVu63dSuVgC/2QZJwWar/wRj8MGggfsK5BCQSERdTjvDq
         WVvaWXGQGYOouAx8SYljtB4uPxI/R8FDQTytc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691983135; x=1692587935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U02WWJNAM7qxa0+dpx4NVwm6vLhsjgGMLjLB+toqmT0=;
        b=CHlV9pVlWAWTkzkmyKMSB5kR+xkTPuxzOE49OKcw1lt/mUjCtchjDaV2k4YqPIEuBw
         2o/N4rDbT5+DismK8Af17dAxVKUwyVycjUe1QeESb0w7VW7eHfC+hb3+41AUZOuWXV64
         x5DsfaFnnF91lJkE9tJ4f8zWmieZy3EPErrukX1WyRzdP+INPhcd/BOGnu/LWWmFc1+1
         uweJDKrH42NK+siyJVvouUFUkJQp2w0coKm6VoHkbd3hj8+zBFv4PdB2yhesrEVftv+4
         JkaDPhN9Qhm3fe7Z0kX4pVLZdEP/XLjhIHpHIkT3TdYIvtfhcKG0KIxepokbdc7dQu3R
         dZTA==
X-Gm-Message-State: AOJu0Yx/YoYOpHE6NFgdIu6NEQI1oAo8vtq/2f7ABWHH0vdc0RQCKBcl
	mC9/vgf4JqQIeOCXQ1PqHIIaedUeXU9R/sxh+68=
X-Google-Smtp-Source: AGHT+IF3SyUkA3rBqhNbRU+iso8amm0GDdiOqLhcNtcL6udIzUdTm5XERvIw5tkuEzYPAPG5WYuhdQ==
X-Received: by 2002:a17:90a:f0d6:b0:268:1d1e:baaf with SMTP id fa22-20020a17090af0d600b002681d1ebaafmr7691941pjb.17.1691983134878;
        Sun, 13 Aug 2023 20:18:54 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.232])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a1a0600b00262eb0d141esm7539496pjk.28.2023.08.13.20.18.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Aug 2023 20:18:54 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 14 Aug 2023 08:46:39 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] curl: Backport fix CVE-2023-32001
Date: Mon, 14 Aug 2023 08:46:32 +0530
Message-Id: <20230814031632.10755-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 03:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185916

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 38 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
new file mode 100644
index 00000000000..f533992bcdc
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
index ce81df0f05c..2a52e8233ee 100644
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
2.24.4


