Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA00C00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:02 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.16746.1690487040865268672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vWr4/C2y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-55c85b4b06bso762978a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487040; x=1691091840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUvQEeTAs1RBVkXiHwWzOIyPNSkF+MHYrTUS2g1Uee0=;
        b=vWr4/C2yDdmCGA989j+YKO+DGx9m+hqn3BbdQRz0qGh0nOkiv+kTxnCLPoKSVuPjL6
         V95tfHtsU3DPzEPSai22KiqyoMTywyAx1S2MbDA6CGEj6zOLCWlHzaXYfKDHchsmrHt8
         SKbfhn/BD4/cmjhH/59KcCkbRWLP4wj+UGO0waeh2VON2n1gFcrE8h13SNr3UZJtvi+R
         vqlIJnZElS+3LqCncOcg0SI9jiwH1RHMDTuFpA+gTvNa1s/42FQDB+q8NAyl3vPGW+Ka
         tH+fcM9MhY3YoPJuR6sZt319SbJfYi4dhlzRzcobKe205jKnpSC421kbrXtX1Bubt7KA
         Dqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487040; x=1691091840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUvQEeTAs1RBVkXiHwWzOIyPNSkF+MHYrTUS2g1Uee0=;
        b=hGErogu2ifmS1t9SsufZSRXQJaXhXR4nzUNZCr33fjm7z8JT1RhnyYKqfRUbOgvd8M
         elGMI79yfDXlQRAqhw/cTIFGTKU/q8Vag80K3l/uUjwqwIy5OMnylGwlGlkQ1MVgAE0H
         P9AQX8vSho3gcvzxXEs8yX4BfOtd8OJo72mv4TlkJsGZ2ZuTlJRHZl9BhfOldW3gL8pT
         Xd3vWzftw3+dH77I29wapVgwRwHJOJExBaWg+H+S3dkbvThDStO3nrHgyaXnhrxlMCLM
         d8SkYuszPGmsLm3a8SJ9nVzIadU9sdrwv6NWPgiQ43JfkaTEe3SVlY9Q/sU79HZgKy/L
         BfNw==
X-Gm-Message-State: ABy/qLbhPIGcZpHHBLB7UjmEd16qj1nc1VudXC2EoxvXIlwiA/d+3rGI
	jDPa3bdfTGedPHNuCLmZqEIOdsJ/ezsbnIYNPmE=
X-Google-Smtp-Source: APBJJlFyrK/6smQP7+0ATJMAkP4CQG3J/FFeJMjtqQBopY+kl8CJNf/i09ZN8WqyN+UPmZYdkfj7WQ==
X-Received: by 2002:a17:90b:4f86:b0:268:1355:b03e with SMTP id qe6-20020a17090b4f8600b002681355b03emr260983pjb.38.1690487039939;
        Thu, 27 Jul 2023 12:43:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.43.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:43:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/27] cups: Fix CVE-2023-34241
Date: Thu, 27 Jul 2023 09:43:21 -1000
Message-Id: <0048a87ec9442f1f9480d57ccfeeaa79ec171f04.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184978

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-34241.

[1] https://github.com/OpenPrinting/cups/commit/9809947a959e18409dcf562a3466ef246cb90cb2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-34241.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index d77758fd3f..c6a676b747 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
+           file://CVE-2023-34241.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-34241.patch b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
new file mode 100644
index 0000000000..4950ca341d
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
@@ -0,0 +1,70 @@
+From ffd290b4ab247f82722927ba9b21358daa16dbf1 Mon Sep 17 00:00:00 2001
+From: Rose <83477269+AtariDreams@users.noreply.github.com>
+Date: Thu, 1 Jun 2023 11:33:39 -0400
+Subject: [PATCH] Log result of httpGetHostname BEFORE closing the connection
+
+httpClose frees the memory of con->http. This is problematic because httpGetHostname then tries to access the memory it points to.
+
+We have to log the hostname first.
+
+CVE: CVE-2023-34241
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/9809947a959e18409dcf562a3466ef246cb90cb2]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ scheduler/client.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 91e441188..327473a4d 100644
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
2.34.1


