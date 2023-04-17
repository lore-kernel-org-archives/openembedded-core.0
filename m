Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43369C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:05:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.49346.1681718699039659354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J5qoweCB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718697; i=@fujitsu.com;
	bh=zi/uI4GSUdGK3TQJzyh8xb/AtzK3TRcCjtmJUFGgcSE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J5qoweCBh9PgbEEvYPLsAxf2nSHxxHqQ2JKlTk8dCR0w5dUO1noxCili16a53TKw0
	 oem0KUFIk0nqcmeVBdf6ME3Mkp2fRAoD4fH8RaFWTbebILnw693wDVcHnKR3fRBFcZ
	 4ygfC9M7xGTz8q7n+c6+ldbqxNYUvj6TFG6GXUPlyCtr+YG7ia7HP4Wno5dRD0j1EN
	 eHEumj82hNAgGui2mWWwMK/o+ub4Fy7FX1KpJBlNnK61NAGI9fGbSJ64ocJ7I13Z7j
	 C5go6o/89+BFfN0exRSohQBxz8caeDZILKNs8M4jwu6GwYqrrjoTLI8KkW2Owd7gK+
	 oV8gXez8455FQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSXfFX5s
  Ug7MfNC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozPe+awFLzlrli77DxbA+MRri5GLg4hgceM
  Epu2/mbvYuQEcq4zSczrjYVI7GWU2HN+JliCTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  gErERawkbg97xMbiM0ioCpx+vEsMJtXwElid8dFJhBbQkBBYsrD98wgNqeAs8SJYzNZIPY6SS
  xddp8Zol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo3lxalFZapGuoaVeUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZg8KYUp33dwTi776/eIUZJDiYlUd4XqdYpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4X/60SRESLEpNT61Iy8wBRhJMWoKDR0mE1/gZUJq3uCAxtzgzHSJ1ilFRSpz39R+ghABIIq
  M0D64NFr2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzsgNTgRBPZl4J3PRXQIuZgBbLKYE
  tLklESEk1ME0RjDY3POSmVmXmfOnAlLUbJPI/Ohn8uu335AmPSfTpQ9Pk/x08XDWV2Y45gbV5
  D/Puq1Pb3FMV+j3/FlYdy2HsSDGcHzQxV072z32P1gkp+6Nr3pS+fsFSN9dy87r7T2cWu4kft
  Un6qW9wfsHc4weu9vd2hd3d7GO99/vhUE3us1OrWg5wBxlrf7zv4sXkz2hc1l2Z8HLlgyMBPn
  Z1UtGiwnZSjc3aOzz21XLFHdNvOa3d90S+6EZyL/cmuQkvrp59Wx4UYcjvekrv7obV/vvunkx
  m8Tq99H7L5grf06pflvR+ZDl/grHin/XEdpNHFn/8Z22W3Bc5x6Ty3JcX0d/dPp/VcF0qf6Ox
  19XaVomlOCPRUIu5qDgRAGILmlJZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1681718696!112108!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19133 invoked from network); 17 Apr 2023 08:04:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:04:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 18FE310032D
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:56 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0C54A1000FC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:04:54 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxml2: upgrade 2.10.3 -> 2.10.4
Date: Mon, 17 Apr 2023 16:04:29 +0800
Message-ID: <1681718671-19418-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
References: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180148

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Security

- [CVE-2023-29469] Hashing of empty dict strings isn't deterministic
- [CVE-2023-28484] Fix null deref in xmlSchemaFixupComplexType
- schemas: Fix null-pointer-deref in xmlSchemaCheckCOSSTDerivedOK

### Regressions

- SAX2: Ignore namespaces in HTML documents
- io: Fix "buffer full" error with certain buffer sizes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.3.bb b/meta/recipes-core/libxml/libxml2_2.10.4.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.10.3.bb
rename to meta/recipes-core/libxml/libxml2_2.10.4.bb
index 6b3dd3ec42..f01964bec8 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.4.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://libxml-m4-use-pkgconfig.patch \
            "
 
-SRC_URI[archive.sha256sum] = "5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c"
+SRC_URI[archive.sha256sum] = "ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.34.1


