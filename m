Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DEAE95A65
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 17:47:50 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.40])
 by mx.groups.io with SMTP id smtpd.web11.22606.1696700865347098451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 10:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=XFTMBbx1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.220.40, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btdPbPrUu6UR39omlEG2Q1L2hrI1e4F69HY2JKh9dZMjFLY+HNtPsqnsVu4ks1DTMyciFhKAJOReol8k9Tu1KEC0SEwSwS6kkbIxC0esXqWvDx/9uzbONlcCsJ2fr0R4vJIXbb1L+1cjFLlsOpXe2P5R5pGsjVTyrwzpnluDiEwvorXspbLFxDjhT5FJD7sHFJKNbEsW6kOz6nOgIjirbT9wiCOJxoPcsQQaTcuP+OOaANcfxTx7/vUG4uFfg6N5RwvJ5U3BTwqVVmd/mavFQLbqihBhqrMcz335z/UhFolxZOqdbiwG/C0dPiRSvYL2q0BAshtPRgaCfU2QOmtFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZglvSrvXb3iyTOIrA2jKc5fGIrtPO6HBjTmUywcx0c=;
 b=PIFYZ3qmYomAdHAed/03r4ts3NSxlAncP6oZN9dJ3btEMfpnMQoZF1wZpv6REruPPkXiswGxQ5r7DOtlwWR9XPckre72kqd5JUeo+vVEQlSHf+wu1IzSy5h5XZYBsBHhuFOJx1mdhPbv/o4+2M3I+cUlz2BYwCB9yURHJhSVeD3p39n+VHRSB9PIgeShDHA09KKtDoph3gnXKaBOT6V0Mf8e6K+JVUJR186KwvF7GHWLwAznmgFqHHDp4mNA4eWdifkTqFU/GqgwmbhkK1r+CnJCDBVOZ1exST65ohEOs+qlyeUF7tT+7ZxbI1N4Dm17VkmDlGc1YsvhAP+XNIPPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZglvSrvXb3iyTOIrA2jKc5fGIrtPO6HBjTmUywcx0c=;
 b=XFTMBbx1DOYyw3R4OvNZNEb9XE9I5wx/+40jEd7Pdmoda1BcOxHfkgef3Th+ggcveoH/A02et2LrcO44jIQi0YYpY68VLsq9lYPDLDapPugJWqu1h/jTT+fifWrnmhuZYBwT/Gxp0RHUUHH0k9SnOHKTpuZR6KU+CXpWdFmv4UVldjma0Or3eRbtUTwM19DXM52QbOSOOG1NPCeKh1JlbYrVj7Zt9z/dDtxB2jAJP08nzxBxr3MB7/GqqDSADsbomxjZHCKV7YF5ZmIxxMMNzm4+PEiCxs13Hl3XOEJrpJCTiBrgB4iGYqXqSipRKh68RghZRcrYEqAzZy1IO16vNQ==
Received: from MW4PR04CA0055.namprd04.prod.outlook.com (2603:10b6:303:6a::30)
 by DM6PR12MB4516.namprd12.prod.outlook.com (2603:10b6:5:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Sat, 7 Oct
 2023 17:47:40 +0000
Received: from MW2NAM12FT093.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::e8) by MW4PR04CA0055.outlook.office365.com
 (2603:10b6:303:6a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.34 via Frontend
 Transport; Sat, 7 Oct 2023 17:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT093.mail.protection.outlook.com (10.13.181.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.9 via Frontend Transport; Sat, 7 Oct 2023 17:47:39 +0000
Received: from chris-virtual-machine.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 7 Oct 2023 11:48:28 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/2] recipetool: use context manager for tinfoil to avoid hang
Date: Sat, 7 Oct 2023 13:47:00 -0400
Message-ID: <20231007174701.1890063-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT093:EE_|DM6PR12MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: a33c5d21-0f20-46be-18c3-08dbc75d800f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	awhSjWh3RIejLBZDqJEn26Djx4RHM0b22m6o/I7cirLkzl3c/gKpQ2Kh2eTZ7Hex//Q5wGn9XTNZ6NEmXC+dlHWX86MeB+V4Qy5rVDVS50MLjkr+wpLz0lb0r+od6lPtuC/LDzvnJtjOZ2NeR7QNO87Pj8v4JAht/hsjwtb1bbdSePCIxwhJz00QIJqI/BhlpM9V3dxpq9JYWGFuIdj8PMKx5tmVptZhnsbZw9lRMuiOM6FgBho4ovxxo4zuUj62c/Dl2W/mo/3wOEUg7qMKkDsXXAFYdnjUndwaIYaN2ApJpC3bG3WDLqFwqo/j7kVJ4hD/ebJQzWRD10b9Upm9rFGclRwwLBYFlhWEXyZNe4VDih3ss7r77/DmFyOG917AbtUqRn4M+dF+WdaZBsgDV0gAX++jWpy4AecWPEbZVilzcd87VTh8QLEWrNu8MRrc7iVMXqr4wIm+nCSuVBdrHKloH4dCNq8uh0icGX+XFB8gP6U6wRXOU828uU4UKiTyW5zSLxRuZlbircfcg2sm153lAH8lXIrVllfGNjM9IbxCVCyliQYjh5GfL1TH5uIZIgIKdttfHycEOvODfRSRfbu3k1JnddU2EoDFG7l5iCv6U7uUgf+CUDuzFdNQ0paUQpI3qk2MTCzfiRww8FIutMIiprOKsWvZ9Ut0TpALkFZElTeb/fCtuycK3YNDqDaiXzlqBUurj72RpEIqpC/Cj/6xkEBy8m7wV62halhPDiy/U3kv2TidjqxEi9TYeKjg
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(83380400001)(107886003)(1076003)(956004)(2616005)(336012)(426003)(26005)(47076005)(36860700001)(70206006)(316002)(6916009)(8936002)(8676002)(4326008)(5660300002)(41300700001)(44832011)(6666004)(2906002)(82740400003)(478600001)(36756003)(356005)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 17:47:39.6322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33c5d21-0f20-46be-18c3-08dbc75d800f
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT093.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4516
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 17:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188797

If you individually run some of the devtool selftests, e.g. with:

    oe-selftest -r devtool.DevtoolAddTests.test_devtool_add

then you bypass the sanity check in test_create_workspace that checks
for an existing workspace layer. Eventually, recipetool will be called
in a test, and tinfoil.prepare will fail. But because tinfoil.shutdown
doesn't get called, the thread spawned by bb.server.process.BBUIEventQueue
spins forever and recipetool never exits, hanging the test.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/recipetool | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index e2d585d2c5..9eaecfbde6 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -22,13 +22,6 @@ logger =3D scriptutils.logger_create('recipetool')
=20
 plugins =3D []
=20
-def tinfoil_init(parserecipes):
-    import bb.tinfoil
-    import logging
-    tinfoil =3D bb.tinfoil.Tinfoil(tracking=3DTrue)
-    tinfoil.logger.setLevel(logger.getEffectiveLevel())
-    tinfoil.prepare(not parserecipes)
-    return tinfoil
=20
 def main():
=20
@@ -67,8 +60,11 @@ def main():
=20
     scriptutils.logger_setup_color(logger, global_args.color)
=20
-    tinfoil =3D tinfoil_init(False)
-    try:
+    import bb.tinfoil
+    with bb.tinfoil.Tinfoil(tracking=3DTrue) as tinfoil:
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        tinfoil.prepare(True)
+
         for path in (tinfoil.config_data.getVar('BBPATH').split(':')
                      + [scripts_path]):
             pluginpath =3D os.path.join(path, 'lib', 'recipetool')
@@ -100,8 +96,6 @@ def main():
             ret =3D args.func(args)
         except bb.BBHandledException:
             ret =3D 1
-    finally:
-        tinfoil.shutdown()
=20
     return ret
=20
--=20
2.34.1


