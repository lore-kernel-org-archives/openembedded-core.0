Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8519C001DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:00 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.26459.1688656013397446534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mKlBhCDE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-55b1238cab4so455349a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656012; x=1691248012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgTfkpDAM29Vd0qO4yHDOBsnAaFTAeGXs3BkX6ilOkc=;
        b=mKlBhCDEtyw4Dtr1NRpaLddtRKxzESfbFoK28jqM01bjTS6INP/w7TenxYiD35OUWy
         fKlFbYoWoh2AeIUsAbvHZA1qd27Ovty3OkH/v1zkZQqI54LO8aiVjOnUFDmVNnLuBmcY
         rwgF21suIo4Gv23r1ifZ+zBpfWf5fdw8vp+8XCWWIp1WFuV1sZPvQI73zdRIA/q1cvt6
         SiHt6TvtTN4m7WeYXiee0+XA6TFZO+6T26Z1KKXgyZdqAa5JG1DS96hZlTQk40C279W8
         mi2zY6xTtwC6ctPNTLqMfjteOCdeN1CtrhJhHHNAHdRFsC04d6/fulTiD95/ZMOl95Uw
         y7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656012; x=1691248012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgTfkpDAM29Vd0qO4yHDOBsnAaFTAeGXs3BkX6ilOkc=;
        b=Zccke4hdWD6HBYlqwUSj3BQtJbCwN4k6XDjaykr8fAdOCsuDcrsQIaUqQtgncskDWU
         9Ou5RHhfzvQIwgkpG4BrNFTgLm3IOuJlv/haqkbe2Lewex7mgs8kp655VeEh9GqMnzb2
         fEAmGKi1BgjkE3rjeKR5UHFrmCEBym5adf/CHl1jnh1wiCDw8VrxgFMDOJ4NPx44Y++T
         9sf/pH90nTSgeOW3Dg+Od54Hx0T3TnQ8GIKn+tUzMRs0BZEsXfe1O5zML0/YhKS5IEGt
         8Dt4J5OKJGI0L/1GfxD+kuEIoJeXvpDpsmYkgXB5LXryszjMNQTScNLk8vRFLOIJJLAq
         T3DQ==
X-Gm-Message-State: ABy/qLZdIcYe26i6d56tl9JJlrDcCL+3KJGjZyldyFw0SrUYoIx+yPZO
	XvxK06nat4Zhi+jh2i3v2LzBwSsLiQRK2TtsFqg=
X-Google-Smtp-Source: APBJJlEOJWqY+UZTRiQ0TFucNn951bmOP+kd6J2zAVygm0TqKMTwZ0uizJO7jcjLxZdx+/cwyQ+bFA==
X-Received: by 2002:a05:6a20:4ce:b0:12c:9518:7899 with SMTP id 14-20020a056a2004ce00b0012c95187899mr1703386pzd.24.1688656012478;
        Thu, 06 Jul 2023 08:06:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/28] cups: fix CVE-2023-34241 use-after-free in cupsdAcceptClient() in scheduler/client.c
Date: Thu,  6 Jul 2023 05:06:09 -1000
Message-Id: <9a6c7442ac2fc2ce668d0c931696d39288ee3d4a.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183959

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


