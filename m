Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E25AC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 21:04:21 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.43])
 by mx.groups.io with SMTP id smtpd.web11.44954.1701896654825485977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 13:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=n4S9d3B/;
 spf=pass (domain: axis.com, ip: 40.107.241.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkjB6Saxu8bFEpyKVSn9xYMnLWAFulxSnaiYjInqFPr54AihtikOaFCihFQNnIrQvUzBG6wEqR9ffIf25MloQh0TMJW8OInVClCygWOM2j/gMYh4zLczzR4MIsfY2vBcR9YhEsd94Gu4iGtMJnjGivwt+JM4/0mHy9n/Y0wmE9FQU+c3pElpncz90XA097ULfnKKRczBk3hpdybUfW/kQYFGC7Dej0VHKchSvtRjtPbiOou75pqbN/9bLCA9ObUfiXGzR3dHax/SzHzf5p0E6c0f+4tn+dJIJsE0eSQpqubI9eg8srAJBl4tCfk7oFfDlVrQnbfwQlecRIngW5ebsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqqqYDOn9reVAsMhA4XrCHlV4QJN5//TykM5tz7S3rs=;
 b=cuHETGD1t2rDdWQ+XQtDIqRq5Sdle/YqmGWUFnFfyCyaDsAxWnInTPlUC8ajBxUI0uFbS5ARrxSJLbHQkqE/hfindvTqsB621rrhRcZl3uP0tkATg4arrdvCp7snNAbbu8ENtGcuIu7LvGq2vqXkz2vTiPNRYR6Pvj4L4UI/a6wCyLsPdQZNtcu+y+tXK5x/UFzK5/og0HPzpBUBUriWCbVootk/iO4awmsLNhPp4WL9zZ3+UcN8Vq8N02S/0IG49/I20CuBW90pQZbhvtPRbrRAkQQOO2yHLEPJR57bjxo/U08GornY/3fo+CJVCLHGW8lorBu27frZjpbGoNP9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqqqYDOn9reVAsMhA4XrCHlV4QJN5//TykM5tz7S3rs=;
 b=n4S9d3B/EqU4/2X3B6XKU2Lj1B/46PAIpO+ri0vJ0eXKl2dyPZqDwPnbsxL0jVb7znPsGFl0x4Wq5Y1m6QvlsXhGzWiXgiDvXkLXM6IDYuT/oCEgvK+i0AVj3FS4oz0z9PIa0MGd/rB9t+BD8/dvUVcH0/dHU1yaxF5vE2Ld2fY=
Received: from DU2PR04CA0346.eurprd04.prod.outlook.com (2603:10a6:10:2b4::33)
 by AS8PR02MB8416.eurprd02.prod.outlook.com (2603:10a6:20b:52e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 21:04:11 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::25) by DU2PR04CA0346.outlook.office365.com
 (2603:10a6:10:2b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:04:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 21:04:11 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 22:04:11 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 22:04:10 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 22:04:10 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id BAC40F675
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 22:04:10 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6L4Ain4038780
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 22:04:10 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6L4APL4038779
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 22:04:10 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [nanbield][PATCH] oeqa/selftest/tinfoil: Add tests that parse virtual recipes
Date: Wed, 6 Dec 2023 22:04:02 +0100
Message-ID: <20231206210402.4038750-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|AS8PR02MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abd4402-95b3-4726-3ed1-08dbf69ee550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rBjDdotXRVJnnGhG1/vtyj/3TzNG6tIYjt1pFWBvRANOKEk1umxkV6zie66qqmoDWaMRMHcZrVgS9cGULLZmKAzdn2ARGByvH7vkceezIDqn20SHJAbjIpCwne6m8jVvR1a20ua77wOA6HmkjNTjYVfJuh2jJ+EtPG5FzxExG7+BLbgObepoqv2ssHH98kVkotNB/f79ssxJQFKR6rBx7DgCnxOZi4X3NPTnI3fCJyMrl+7UKCphfgmsY7lXIzpvZLgsE6ewTXJKqCOVR41aFLYM9jaAiK+CoET9jxhTTz5DFYn4YGONn2ObmDlrXJzdUJrCTypVCdEByASUapsHYu3OVpFjzYwlvgxvVf4b8b28B5L/RgkNXfuQaP5KG6Nly/5AL1OPGFLE+rccRSFzkZ15NEuvHdP0cxvpZg2Vv4tzVCnTYuqF8rOy/blf7in+lHxmq2yr+l+1jpicAh7//rJ9MjzDWr49YjQyYNXJ5UXuJ0KEzl1vubw3twzStgYt+v8sBXaY936gwgOAalIf4XTiqkEKXHL0aUCnvCchd3yT1+K41XfMf6dfA+u96w9AeXmSwF47AM/UF0FowFsfpufcuiHuWElCUibJcGHG1Ilsz+gr3980S7Hss+9NVOncajcI091XE/Dc48/btLn7j0C4dkI2932wCVrGbOVDMrwl+8t7Z1LbEIfLs9AutLnkFvau8oV8xSuyZcLYjAvvilu9WwHR4+ROGCIC/vnqyScNvkyaZB3SrFTsCdwNBwZVEyH5xjO7k0YScP5al6fcqw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(26005)(83380400001)(426003)(336012)(356005)(82740400003)(81166007)(40480700001)(47076005)(40460700003)(36756003)(6666004)(5660300002)(2616005)(1076003)(8676002)(8936002)(316002)(41300700001)(478600001)(42186006)(70206006)(70586007)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 21:04:11.4939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abd4402-95b3-4726-3ed1-08dbf69ee550
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 21:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191933

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Running `devtool search gcc` would result in errors for virtual recipes.
The reason was the newly introduced :layer-<layername> override.

When tinfoil parsed the recipes using the parseRecipeFile() function, it
failed to properly identify the layername for virtual recipes, which
resulted in the errors.

Add tests that exercise these code paths through parseRecipeFile().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

This depends on the corresponding patch sent to the bitbake-devel
list.

 meta/lib/oeqa/selftest/cases/tinfoil.py | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selfte=
st/cases/tinfoil.py
index dd13c20402..21c8686b2a 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -48,6 +48,17 @@ class TinfoilTests(OESelftestTestCase):
             rd =3D tinfoil.parse_recipe_file(best[3])
             self.assertEqual(testrecipe, rd.getVar('PN'))
=20
+    def test_parse_virtual_recipe(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=3DFalse, quiet=3D2)
+            testrecipe =3D 'nativesdk-gcc'
+            best =3D tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecip=
e)
+            rd =3D tinfoil.parse_recipe_file(best[3])
+            self.assertEqual(testrecipe, rd.getVar('PN'))
+            self.assertIsNotNone(rd.getVar('FILE_LAYERNAME'))
+
     def test_parse_recipe_copy_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=3DFalse, quiet=3D2)
@@ -66,7 +77,7 @@ class TinfoilTests(OESelftestTestCase):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
=20
-    # The config_data API tp parse_recipe_file is used by:
+    # The config_data API to parse_recipe_file is used by:
     # layerindex-web layerindex/update_layer.py
     def test_parse_recipe_custom_data(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
@@ -80,6 +91,18 @@ class TinfoilTests(OESelftestTestCase):
             rd =3D tinfoil.parse_recipe_file(best[3], config_data=3Dlocald=
ata)
             self.assertEqual("testval", rd.getVar('TESTVAR'))
=20
+    def test_parse_virtual_recipe_custom_data(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=3DFalse, quiet=3D2)
+            localdata =3D bb.data.createCopy(tinfoil.config_data)
+            localdata.setVar("TESTVAR", "testval")
+            testrecipe =3D 'nativesdk-gcc'
+            best =3D tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecip=
e)
+            rd =3D tinfoil.parse_recipe_file(best[3], config_data=3Dlocald=
ata)
+            self.assertEqual("testval", rd.getVar('TESTVAR'))
+
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=3DFalse, quiet=3D2)

