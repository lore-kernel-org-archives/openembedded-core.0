Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D057CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 10:01:09 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web10.8329.1755252059860742024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 03:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=R1LXdBa5;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=315bbc237=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755252059; x=1786788059;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XdMgp9KmGdNZHKeyw2VMKZdfUygWT6ZoesSQeefR9ko=;
  b=R1LXdBa5P9o/JfaZN8UDTSRpgYVD4NYnPDvQIwHSf4UjA5DWGsnabeXN
   avZfwHtoB2OKf2fgjPSWamsUMqRhETYhNxhBnwopSAdRFD8/1Xx3xC7vc
   +pl5SG1sHQ1c2G5fQPKcFhPX/X/kebWH4mb60yMNBZMGmX+1VUWYYAVdy
   E=;
X-CSE-ConnectionGUID: QrMnCxf5QKisuHgDqPa3Og==
X-CSE-MsgGUID: BTDuP+hiTHyKc9O4UrJ8xg==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Aug 2025 12:00:57 +0200
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw6.muc with
 ESMTP/TLS; 15 Aug 2025 12:00:58 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb5.muc with ESMTP/TLS; 15 Aug 2025 12:00:58 +0200
Received: from marvin-ws (10.30.85.203) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 15 Aug 2025 12:00:57 +0200
X-CSE-ConnectionGUID: OIdrOjekTZmBC1ODSDVK7A==
X-CSE-MsgGUID: iLvv86gNTMGPvGpJ5pW7SA==
X-CSE-ConnectionGUID: OVAotCy6R/+pauD2x1Yqow==
X-CSE-MsgGUID: Cse7UdzpSeu1E+p3ABCXNA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Philip Lorenz <philip.lorenz@bmw.de>
Subject: [scarthgap][PATCH] cve-check: Add missing call to exit_if_errors
Date: Fri, 15 Aug 2025 11:53:06 +0200
Message-ID: <20250815095306.3034821-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP10H.europe.bmw.corp (2a03:1e80:a15:58f::2047) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 10:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221880

check_cves may raise the cve_status_not_in_db QA check. Call
exit_if_errors to make sure that the task is marked as failed when the
check is categorized as an error.

cve_status_not_in_db was in the meantime dropped in OE-Core
452e605b55ad61c08f4af7089a5a9c576ca28f7d so this change is only required
on scarthgap.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6b8376bf17e..d08c6ac670c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -196,6 +196,7 @@ python do_cve_check () {
         else:
             bb.note("No CVE database found, skipping CVE check")
 
+    oe.qa.exit_if_errors(d)
 }
 
 addtask cve_check before do_build

