Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01FCC04AAB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.3131.1695249067302402077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iH+8vbao;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-690ce3c55f1so243003b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249066; x=1695853866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kQNcNYLc6QOlwNhtqAq3eY1+7HIbQ9q9li0hssIgE=;
        b=iH+8vbaoPmezjgJ98GdFNBarpmrmwWOtL75M0THYUSZekP1NdmmDVQgQk7ouNSOSAs
         WgAF2Guov/5kPxdmF9oP7DneW7l73iD17wd6C6D+xeCEw6plXysseOWYUzvVBCcxSPv4
         1bTnlBjvuQl1moiLHJuHgS2x2P02v1Ak3y3YogIwC7c4tgakRM4iLxB9PPe4P+Wur0NX
         F85MKXxTkPGFbFxxffPN7U5Zzd4gWxNDmRKS1YB7833r0k+zt9mLqGSvoqaSphpgB9C8
         RwRvJmOVDOAwLtzbpwdfGAUBwedWlDuLQNZ/wEUvhsflif9RepYgecmZmXa/tDkaAz6i
         kTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249066; x=1695853866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13kQNcNYLc6QOlwNhtqAq3eY1+7HIbQ9q9li0hssIgE=;
        b=Oc4ahlXzDxVlOFr1WOyEY6ouAiYfr3vv4X7QjfKG1iLPF6DEWS7lMLn34ATKba6+fi
         pHnbqy2zCnYMqEguwD4TPGZz7UqINjoxiA6lRk1oTICfQsBg0Jvlf010vHP/85RX8D/t
         RnNpbJfVXfXWicSHC9qAVXN7NLwzLLnFRrjLy7Sd5OHU/HZKN4Y5Av9RXlFR5fYNUvSr
         G4rvJqTMLXdWrQLdhjF0r9xLVBIfqQyqYrCTdl/xB51ddGhJX1zkBZf1tOuBv43BStU0
         R/6eSr3MfZY5Z8J+uP21+4BDmKNilZy9D1cPdpHFZJ+ukriwUzBwANHn5MNuPvQgrrmr
         dT4g==
X-Gm-Message-State: AOJu0YzBwJvv2IfTf4TrR+Bmi3sUf4Gj+lbnx0BwJgvEePggd6j6Zj3i
	5URONis6BHllkn9HOe7KBCbgbqYLaixbpPmx4ZA=
X-Google-Smtp-Source: AGHT+IGp4bq73HFRZek2un/ZiqDDxdinAZrGCX4aJtc2RpYy3FoiYzd2kp/vnhTFAW+KFsDEFWdgPw==
X-Received: by 2002:a05:6a00:a1b:b0:690:bc3f:4ffa with SMTP id p27-20020a056a000a1b00b00690bc3f4ffamr4271914pfh.14.1695249066422;
        Wed, 20 Sep 2023 15:31:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/20] cups: fix CVE-2023-32360
Date: Wed, 20 Sep 2023 12:30:39 -1000
Message-Id: <b04f40d7afba07ff602bffffc9a517ccfdd44850.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187950

From: Yogita Urade <yogita.urade@windriver.com>

An authentication issue was addressed with improved state management.
This issue is fixed in macOS Big Sur 11.7.7, macOS Monterey 12.6.6,
macOS Ventura 13.4. An unauthenticated user may be able to access
recently printed documents.

References:
https://ubuntu.com/security/CVE-2023-32360
https://security-tracker.debian.org/tracker/CVE-2023-32360

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32360.patch            | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32360.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 87f220590f..4d0c52eab8 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
+	   file://CVE-2023-32360.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
new file mode 100644
index 0000000000..f1b0f9f918
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -0,0 +1,35 @@
+From a0c8b9c9556882f00c68b9727a95a1b6d1452913 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <michael.r.sweet@gmail.com>
+Date: Thu, 14 Sep 2023 09:16:45 +0000
+Subject: [PATCH] Require authentication for CUPS-Get-Document.
+
+CVE: CVE-2023-32360
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c8b9c9556882f00c68b9727a95a1b6d1452913]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ conf/cupsd.conf.in | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/conf/cupsd.conf.in b/conf/cupsd.conf.in
+index b258849..08f5070 100644
+--- a/conf/cupsd.conf.in
++++ b/conf/cupsd.conf.in
+@@ -68,7 +68,13 @@ IdleExitTimeout @EXIT_TIMEOUT@
+     Order deny,allow
+   </Limit>
+
+-  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job CUPS-Get-Document>
++  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job>
++    Require user @OWNER @SYSTEM
++    Order deny,allow
++  </Limit>
++
++  <Limit CUPS-Get-Document>
++    AuthType Defaul
+     Require user @OWNER @SYSTEM
+     Order deny,allow
+   </Limit>
+--
+2.35.5
-- 
2.34.1


