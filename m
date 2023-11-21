Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75275C61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:37:16 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web10.25153.1700530632511222299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qrAq6kZZ;
 spf=pass (domain: axis.com, ip: 40.107.249.62, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTvNfErvNgzppYchcInjEBLEMyOnOv7PWJYikaQt9jF7WGj1TFfMe9mjt/JUvn6T5omSBLNMld61Tnik+gLZhK0oZQXNR2Aobx5Mc+iLbmpsmWbzztmWWMluE+qD2TuaUBo1I53VsAjlSov2xW/csPvs2k1qswkgDfOVEeGfWbFV+tanI3b5O1/S9h5zIjnODIY0WLslTeChlI3y4mEd8lzkSqZycNlsknjv2CI4gbq9S1dcxjFRbOAJJFIfm4f79TdFj9H/Yl+8E9tqg4azTX7yVj9uMDjboX6bYsD6QSCYXRGAyylMN7gDgpKTpi2Jdp336JnrmGIgnCHqA9AY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPARauoM7zwFYwk5x/LEIwJYEr1u+He3WPTTrUHxrj4=;
 b=YaymeQsOnMfedJNLpo3/2SEBnVLnmJXpWJF4MrgQxZUWSyGDMY3KvMx62SwSEjkCFkjPI3eXoquQF7ewuSEcFyRg6/vQVDD1x4vuhJe8FM1lBCGyWsyKYP2r+G1DwYaqRPFglYB3iEX961Ko98CUlnq/TSToW3BoyCq34WGKr6y+qCKjVw2ouDJoHT9PMZNWhqbf1SuzQE7W5tM86EVgnv0cnzBUWsziz4V5cxwQmvBb7jffPufyOtrzJbdft5dOaljOGwcU5YG/IyWSZCP4Vnw2qOCHvKX+PTrPXO963yjRtcQO6AyrKzx/FCI53YgW4LEkwHZ7hMXi3se4rtceEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPARauoM7zwFYwk5x/LEIwJYEr1u+He3WPTTrUHxrj4=;
 b=qrAq6kZZSxC6QU4Q9fwGJloxU8sdzTd5CPjwAE46wV2dTBbc28APHgMqfFn2xJ/MC0mlgmAFv3sQfMIehn1sz2Xn2O7D6D/2FTY2zgAkKWUYmt5pspafAzNpFlB0ON9pVJzTrzZ0tGQNRZ5xMsMqBoT+733LfGbsQ+ZM/pN/PvY=
Received: from AM9P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::19)
 by VI1PR02MB5870.eurprd02.prod.outlook.com (2603:10a6:803:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 01:37:08 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21d:cafe::dc) by AM9P192CA0014.outlook.office365.com
 (2603:10a6:20b:21d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 01:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.3 via Frontend Transport; Tue, 21 Nov 2023 01:37:07 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Nov
 2023 02:37:07 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 21 Nov 2023 02:37:07 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6CA04E41C
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 02:37:07 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3AL1b79L1061260
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 02:37:07 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3AL1b72I1061259
	for openembedded-core@lists.openembedded.org; Tue, 21 Nov 2023 02:37:07 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oeqa/selftest/tinfoil: Add tests that parse virtual recipes
Date: Tue, 21 Nov 2023 02:37:04 +0100
Message-ID: <20231121013704.1061241-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|VI1PR02MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 004d3883-0988-45a5-5f6f-08dbea325fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SdwHJvQe10J1M3Slfbbz9oXKLaIU96knUOs42pGrOhCUpnNCgH2fGeX+3W0FP1tuoDNvB3mBYSAkxaNKhwdDTXktUbr+mKyfAnOYg2RzblY3Qa2lxoEYicmJF+21GtoXM1sxwr81m20hPdTeXon6QG6dCW6KyTMYx6xN6DSP8JAMkVhhPorz9KKh4LK1okxQS86OwTFUq5eXhGc/MvYwSefsR2+5glXE3jgaN0YqsLlw9BF+Id9ISKlhejs9y0TBH/NG9riRQEs6Jdxq3Xk0KlkoazwKmVqvKFUnDs4RLxfEmMcpGBaGI1mZSug7WMMHkZerym1H0O6VPUzjdOkvPD/lytaDADzmf3ez6RbfjUX+0lNRHGhRQhgdiYP7hdXtaHj7obg/8RFrG0A3k5NI0byzqi8DBkaeVm6QY9UhoooLUDYdoxkCw6/eBHXgdOmYFKgpoP50qY7J9tF30Pno2MCg0/FeCAG7WWAIoOjpTX18YXSSB9UFlBAQcu8VY0WgBzaUhZiJWRhUXh97GN9CMbC9hUcye4cXRwBbZ0kfNs/YBH0CTyTpqF+dFKWuBoXCy1bv5kEscGo9BgbOoE4PqC1S8IpuThLhmU4AYODOqM/pmaHbiKWNUSTCpOKlgnUzE5SBCM9VEDlBDXU+K34/7l0Czjxom2yGFZackHyKwryHz8R1T75DkTW0DTrY5+GqK0fVBaay/rL5GZvDjH3BsmlBIHxabmGMrMMmvtR8pHI=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(2616005)(82740400003)(356005)(40480700001)(40460700003)(6666004)(42186006)(6916009)(70206006)(70586007)(316002)(36756003)(81166007)(1076003)(26005)(83380400001)(336012)(426003)(2906002)(478600001)(5660300002)(36860700001)(47076005)(8936002)(41300700001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 01:37:07.9828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 004d3883-0988-45a5-5f6f-08dbea325fd5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5870
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190951

Running `devtool search gcc` would result in errors for virtual recipes.
The reason was the newly introduced :layer-<layername> override.

When tinfoil parsed the recipes using the parseRecipeFile() function, it
failed to properly identify the layername for virtual recipes, which
resulted in the errors.

Add tests that exercise these code paths through parseRecipeFile().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
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

