Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F250BC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:07:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1074.1721070460421918095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yxPlWl3L;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FJ7deT005346
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721070459;
	bh=wJDxMozUiL/uh8In/UdrLfhJoYLywxDF90GaogI1qKw=;
	h=From:To:Subject:Date;
	b=yxPlWl3LvsL0CT838Sy3nEadc8x5KB3+58Q8qctu3Z5RF99dqz1H3n+sHKRkzWet+
	 Cei+/4IyqvP2q4YO+yWOk1zyJ+e4hjEoL5DrbJ08CekG4+4vXI5H9gpIwueKc7hpa+
	 NqYLS1LAbs3NGIldH8R/P2KtSI5kVLekXwRrI6lY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FJ7dif043255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:07:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 14:07:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 14:07:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FJ7diF079013
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:07:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sTR2w-0008O9-Tf
	for openembedded-core@lists.openembedded.org; Mon, 15 Jul 2024 14:07:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] package: Add support for INSANE_SKIP for incompatible-license
Date: Mon, 15 Jul 2024 14:07:38 -0500
Message-ID: <20240715190738.32206-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201943

With the move to make more warnings into errors it is inevitable that we
will need more hooks to skip the errors on a recipe by recipe basis.
This patch just adds INSANE_SKIP support for the incompatible-license check.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/lib/oe/package.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index e6b46a0dc5..a2b9019db6 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1411,8 +1411,11 @@ def populate_packages(d):
     for pkg in packages:
         licenses = d.getVar('_exclude_incompatible-' + pkg)
         if licenses:
-            msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
-            oe.qa.handle_error("incompatible-license", msg, d)
+            if "incompatible-license" in (d.getVar('INSANE_SKIP:' + pn) or "").split():
+                bb.note("Package %s skipping QA tests: incompatible-license" % pn)
+            else:
+                msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
+                oe.qa.handle_error("incompatible-license", msg, d)
         else:
             package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
-- 
2.17.1


