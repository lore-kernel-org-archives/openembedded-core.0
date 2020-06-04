Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.12118.1591272238715767146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/VygBHr;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id x6so5759597wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AdfY9Zqa+tHCYxZAmM9OsjSF+Px8k+RiB18X/VD4gKg=;
        b=l/VygBHrypW80mQhk1sKYZtt4bCrefeGoX6SO6SY4s36chnZmsu0fiFSDthwsWkcNv
         snMdlj6rp0ccpdVZDu1QuyuSkxNqlkfhqtOS3jr8KENiChDhDfBrCRTglPCrxvsdQnii
         qMSxPZJEQI3q3H+4y3YgOz6EY+4yScmcbNsc30yXtpM28dolBscuo2QkRufQ80znWkuD
         8vQ70+vnKJhINmZmY02uMHwBRMQhPNwsaG4vkpU+lEqI4APXpKD2gyRpW+J3ChZQMj+x
         8EkZkN/oTRRrbTavCdBWfJ/0WN87q8o+04d6xuGmxTDQEXPuocW2GkHA16zJr1g4zkcM
         0j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AdfY9Zqa+tHCYxZAmM9OsjSF+Px8k+RiB18X/VD4gKg=;
        b=cvagXj2q2tx04f8uXFGGJ16q62oyZUk5T40/xeIFzgIiOFTPkd8jBtGWjaeNDq5bRI
         uxGBW7sfDxoFYDzrsIdPZoEPWDMgbAKTNDgXtMIpqy1R3QNgBKzXqditNqC3J+pK0ydu
         ydm2JeLqy23NxxkipdnaDPfPiFtMfvoj4kc5G9OeyM6qSGhRvvlZu1P+cC+FDjYpIA3H
         qyUf+Yz6BEFHyPB61jwgRo+7m8sqELIxErkV48jOO/3RrvjdN8zkZNOarUBnRAsYy2s3
         TNnT3Hdi0CMv2D8mJtdn69iOGNvEm5lhCo9ak3i4UJKwLP708Rn3teL0RtnGeGpbFw4R
         1sww==
X-Gm-Message-State: AOAM531bvmNqNICv4rHzEHn38wOUOCcfUbbZCrAS2dDWFaASNpsKxBww
	EM7FXBHGXz1wxJsNIBll8N3FQ8yt
X-Google-Smtp-Source: ABdhPJxpPdAvHgg1sewAxegTNgcjUdCE9JqA22tQhwPPyd+SpZWz8PiK+eOaALMjd7T6Yfo4V4K21g==
X-Received: by 2002:adf:82c9:: with SMTP id 67mr4524364wrc.149.1591272236769;
        Thu, 04 Jun 2020 05:03:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from mueller-a-nb-linux.zera.local ([195.50.169.54])
        by smtp.gmail.com with ESMTPSA id c206sm7071002wmf.36.2020.06.04.05.03.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 05:03:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior] pseudo: Fix enum typedef
Date: Thu,  4 Jun 2020 14:03:49 +0200
Message-Id: <20200604120349.17455-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jacob Kroon <jacob.kroon@gmail.com>

'pseudo_access_t' is a type, so use typedef.

Fixes building pseudo with gcc 10 where -fno-common is the default.

(Backport of OE-Core rev: a7d519f742aadc9110c2401f359254210a784f6b)

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  | 31 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
new file mode 100644
index 00000000000..33d4ef3b2fa
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
@@ -0,0 +1,31 @@
+From a491aececfedf7313d29b80d626e0964fb533548 Mon Sep 17 00:00:00 2001
+From: Jacob Kroon <jacob.kroon@gmail.com>
+Date: Sun, 3 May 2020 06:24:03 +0200
+Subject: [PATCH] pseudo_ipc.h: Fix enum typedef
+
+'pseudo_access_t' is a type, so use typedef.
+
+Fixes building pseudo with gcc 10 where -fno-common is the default.
+
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/137758]
+---
+ pseudo_ipc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pseudo_ipc.h b/pseudo_ipc.h
+index caeae5c..d945257 100644
+--- a/pseudo_ipc.h
++++ b/pseudo_ipc.h
+@@ -29,7 +29,7 @@ typedef struct {
+ 	char path[];
+ } pseudo_msg_t;
+ 
+-enum {
++typedef enum {
+ 	PSA_EXEC = 1,
+ 	PSA_WRITE = (PSA_EXEC << 1),
+ 	PSA_READ = (PSA_WRITE << 1),
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7db5bafd174..8ff003d9024 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://moreretries.patch \
            file://toomanyfiles.patch \
            file://0001-Add-statx.patch \
+           file://0001-pseudo_ipc.h-Fix-enum-typedef.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.21.3

