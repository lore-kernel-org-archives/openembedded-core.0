Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E36EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 14:48:16 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.19429.1688568489928503251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=MR+THowJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.48, mailfrom: vkumbhar@mvista.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b708b97418so5686298a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688568488; x=1691160488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JVB6xy/51m4V/YIEL5MdofPx1s21rmRCwENKfFKiAc=;
        b=MR+THowJZ+ZB0RIEmPHufa0GUD+1JSd0sRwOvLjsoW0TSuO6cF7dOjmhwvPT+yl/9D
         fgMAe+L/xAoMD74+mFFOJXZJlnxVSgPICGCB/qruFdULQOxd1Mrv/rQkUTor7cqSqRRS
         /RJRZiQYXrKjXp9x4TJAxsq+TCwQPPxFih6Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688568488; x=1691160488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JVB6xy/51m4V/YIEL5MdofPx1s21rmRCwENKfFKiAc=;
        b=NZfqGezAFhfQga4KMqbGgLI0kbqsPo26LMPCAx9QKiq6NMtmiSMXQfeEw9KUMAV0a/
         Wjrv7YA+GGwub1S9LWH3RPpPy4BZF+d7asYaEpfu1y/jUrAIciwBsoJ2luU303ilR6Ns
         0TK4AKfUfLSrIHB9ym3mN4matqJe5opaHeHLhN6M8sHjpZxX3Nha9Ve/G9SVmIFYK1Gc
         8LbBf1KF1C1Zh68boBNLmzlyMPLlfjShomJ7D9oDKDvDW5Eu0FP0fBd+1BqSKzQRWW5Z
         bWsMylKyPt3+4x/QTCLilL7it624AgZ7QjZ3NTiVsTPCcLKb6W6WZC3HzspraT5/L6tp
         Bihg==
X-Gm-Message-State: ABy/qLb/+bGfAWWTWYvf3nGrDBu9VkJiqVHUKMxTQjX8UkpGTL+4BOgf
	BoISyo3Keo3cZd8M3xA46qqU8IoJ5hoiYmm4a4w=
X-Google-Smtp-Source: APBJJlH5tuTgRsGWOIT1miTfI/wfLau7KbVdCOEZrk8lM8BcB5wjMPyjYTMYq93nXhaM+foMK6fgsQ==
X-Received: by 2002:a05:6871:4f18:b0:1b3:cee4:cac9 with SMTP id zu24-20020a0568714f1800b001b3cee4cac9mr4527670oab.33.1688568488358;
        Wed, 05 Jul 2023 07:48:08 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.188.151])
        by smtp.googlemail.com with ESMTPSA id 22-20020a17090a019600b00263f41a655esm1611815pjc.43.2023.07.05.07.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 07:48:07 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] cups: fix CVE-2023-34241 use-after-free in cupsdAcceptClient() in scheduler/client.c
Date: Wed,  5 Jul 2023 20:17:57 +0530
Message-Id: <20230705144757.2283794-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 14:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183888

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-34241.patch            | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1b87d47a49..87f220590f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
+           file://CVE-2023-34241.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-34241.patch b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
new file mode 100644
index 0000000000..95b3925b36
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
@@ -0,0 +1,68 @@
+From ffd290b4ab247f82722927ba9b21358daa16dbf1 Mon Sep 17 00:00:00 2001
+From: Rose <83477269+AtariDreams@users.noreply.github.com>
+Date: Thu, 1 Jun 2023 11:33:39 -0400
+Subject: [PATCH] Log result of httpGetHostname BEFORE closing the connection
+
+httpClose frees the memory of con->http. This is problematic because httpGetHostname then tries to access the memory it points to.
+
+We have to log the hostname first.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/9809947a959e18409dcf562a3466ef246cb90cb2]
+CVE: CVE-2023-34241
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ scheduler/client.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/scheduler/client.c b/scheduler/client.c
+index e7e419f..441c1d7 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -193,13 +193,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+    /*
+     * Can't have an unresolved IP address with double-lookups enabled...
+     */
+-
+-    httpClose(con->http);
+-
+     cupsdLogClient(con, CUPSD_LOG_WARN,
+-                    "Name lookup failed - connection from %s closed!",
++                    "Name lookup failed - closing connection from %s!",
+                     httpGetHostname(con->http, NULL, 0));
+ 
++    httpClose(con->http);
+     free(con);
+     return;
+   }
+@@ -235,11 +233,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+       * with double-lookups enabled...
+       */
+ 
+-      httpClose(con->http);
+-
+       cupsdLogClient(con, CUPSD_LOG_WARN,
+-                      "IP lookup failed - connection from %s closed!",
++                      "IP lookup failed - closing connection from %s!",
+                       httpGetHostname(con->http, NULL, 0));
++
++      httpClose(con->http);
+       free(con);
+       return;
+     }
+@@ -256,11 +254,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+ 
+   if (!hosts_access(&wrap_req))
+   {
+-    httpClose(con->http);
+-
+     cupsdLogClient(con, CUPSD_LOG_WARN,
+                     "Connection from %s refused by /etc/hosts.allow and "
+ 		    "/etc/hosts.deny rules.", httpGetHostname(con->http, NULL, 0));
++
++    httpClose(con->http);
+     free(con);
+     return;
+   }
+-- 
+2.25.1
+
-- 
2.25.1


