Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56227C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 15:36:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.110550.1692027371382627022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 08:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F+MUn2pg;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bc3d94d40fso38654135ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692027370; x=1692632170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4BeZmGSUvhF7ug9lSEbPNuqBqmFp11W6RYMU44ijBg=;
        b=F+MUn2pgWOmp/aRzwfLAm8Gav7NZE9oLSpD55uhxI71DA63SCFwzEvEVzY5G1Rk+iD
         fd4hY7XRE3UM06uwO5opFgHBb4zRBM16AfIfo34QVtbRF+Jz7Wk1K3b8HWxnXpdMWNHb
         3U3sFCjIra/N5oyTMpOVhI7V5bc/yCNODoKW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692027370; x=1692632170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4BeZmGSUvhF7ug9lSEbPNuqBqmFp11W6RYMU44ijBg=;
        b=aD8Qc/xUrJOS7tk+JtCXDZ/mlKYyuwB5c2BgUcMrRpemniHhojwnAXjwVn0QTju+Ta
         4BNlWlcUD++f9KUjNrngz/tw/XIuZmyLGDiNEAivNWBHxDM+to6dSisbe46yHcY148mX
         SZPok2X619hdUoA4IP8LR1E2P0vXY+hUSjQqYGu/Dup+NK9jqUYra5nFbpi6iuuRmwBp
         YfPJeSLaFbweZRmZECq1HhlhrpaAtIbuQ3YmR2DuiR7jg+iAfA+EaP+lyWmD3G0IOWM1
         xfHtuYgNBqIoX+0K8SKOGjaaUn0IGw+DzoGQmbQaQPK6GgSEhzAINacSz0Hw+iKUnrWX
         U5hQ==
X-Gm-Message-State: AOJu0YwKzTyzwVH9vsFdcdm+MfJl0DRMm2F2AT2NmBC14t3mN9K3yTr0
	abkjBApaJmKaQ/AiKlUA460i8UFOL4SrkWA5C9s=
X-Google-Smtp-Source: AGHT+IFl6iXC+zNi0cJKwvpvEPEqErGPzDD/UqVWqny9BoVuGEhsotiNPyymLlZzXFPc4aS2LSSLSg==
X-Received: by 2002:a17:902:d490:b0:1bd:e64c:5c7e with SMTP id c16-20020a170902d49000b001bde64c5c7emr2925523plg.61.1692027370642;
        Mon, 14 Aug 2023 08:36:10 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.203])
        by smtp.gmail.com with ESMTPSA id jc3-20020a17090325c300b001b86492d724sm9632682plb.223.2023.08.14.08.36.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Aug 2023 08:36:10 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 14 Aug 2023 21:03:53 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] curl: Backport fix CVE-2023-32001
Date: Mon, 14 Aug 2023 21:03:51 +0530
Message-Id: <20230814153351.750-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 15:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185937

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
new file mode 100644
index 00000000000..7ea30737555
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
@@ -0,0 +1,39 @@
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
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 7f18ef7ee6a..af52ecad133 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
+           file://CVE-2023-32001.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.35.7


