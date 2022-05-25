Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB72C4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 12:25:56 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.88])
 by mx.groups.io with SMTP id smtpd.web08.6056.1653481549608574140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 05:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=xsB5k83+;
 spf=pass (domain: siemens.com, ip: 40.107.2.88,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1QBv9uY70ITWYeNZJEDacwE/wjqbIicQ34V7CxxZrseJ04v06S4IKhAlraLW5jyTJUUUNpmYcj2R+5C/UcI9CTeVLgIr/Feo+5O69mCXLa61/EN9S6NplFp7+vZBRpzt30G8Si0Y4Wb7j51bGGlXFcTgsFn3iMrb0hqOGCIc0BXBh1rU2MCJS4X3+lmiQJ/fCiz5MdbGBLMVSRVOTfizsI63r8kp+myoJZCkztd3XJhdD0KW0ZqspGDaig6urpsgKbNkj1tbDRUxcy3iNkt50CHy0YkN0GTzG9Jz2wKHZcyRPZY130XXmwVRMuaPSQoihb5bfbK4t6kTUM4s52kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYzWEe8rnGBoGGCfrpjWx18XCaqTeagpvIqt51kvJBc=;
 b=USmYE5vNtsj+k4fh66xyHFCTehlrUobp32y2bKxfok0li2Zem5gHfJIOpP4tVCl4+5ZpI3ams8tuusiqyHfMJbugx8pZDACtuSz3TTNuKGJ5uvSrYb/ZO/IgHuzdsaG8Fcgli19q2qdU4+pwuAhiIgadr17YZRnNx2tlfGcLwv/bDcRVqKpq48IihxTBRTQx5hQ/OvC+qwsXktcW1p9xQA4zOHVpbhIKBPO12Forncxt6ztXPdn3qh5S8HNTlpYAdSZYcO4WPZo2RqUFsopezOTvCP9oIxfTIXld4XSzlGyUvlQc1mApOSCULb4OJzNn6uWnyJs3/ZgdTJWguD8Vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYzWEe8rnGBoGGCfrpjWx18XCaqTeagpvIqt51kvJBc=;
 b=xsB5k83+dlczmDb0NEdFDS1ISesWhfeXK1tx07NxeARe+ccQBztZOGlTBNcgwikIBZte067CAJYMWFlM/glqlyputJ6cVC+odjY0A+kag+VcOSMmh5N6ZsRt64BL8maUjqsoqRTAcDzNZHUsd5oWIz6c8G43vNqjCEVK3rt52IJ3TaDa2+FxZfgHCHZy1OUV2R1pOsdTn0QfTE6TDpsbe7I9c4v4Fa/aO1u2hXT+7Gx2XigjdSvlIJzTFH3Q1/ONN73VZj/0eD0FBjmuKr8RyqP1PyQERKUkHeGO7OWeEiW43p8TQlgVbT/r8Yyw86p3f3b9pSkFkfXiV2xyWblu9g==
Received: from AS9PR07CA0050.eurprd07.prod.outlook.com (2603:10a6:20b:46b::8)
 by DB7PR10MB1980.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:5:b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.16; Wed, 25 May 2022 12:25:45 +0000
Received: from VE1EUR01FT020.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::6) by AS9PR07CA0050.outlook.office365.com
 (2603:10a6:20b:46b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7 via Frontend
 Transport; Wed, 25 May 2022 12:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT020.mail.protection.outlook.com (10.152.2.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 12:25:44 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Wed, 25 May 2022 14:25:42 +0200
Received: from wonse.private.schmidl.cc (167.87.1.124) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Wed, 25 May 2022 14:25:42 +0200
From: Tobias Schmidl <tobiasschmidl@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tobias Schmidl <tobiasschmidl@siemens.com>
Subject: [PATCH v2 1/2] wic/plugins/images/direct: Allow changes in fstab on
 rootfs
Date: Wed, 25 May 2022 14:25:26 +0200
Message-ID: <20220525122527.765791-2-tobiasschmidl@siemens.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525122527.765791-1-tobiasschmidl@siemens.com>
References: <20220525122527.765791-1-tobiasschmidl@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.1.124]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.231300-8.000000
X-TMASE-MatchedRID: NvfHjCeRWomzqzU5o1VJijWdfsELVrJoJxdeG1t7y2YK4MBRf7I7pnFd
	5+Cf9M1Dlzy6qhJBbZZTHuQZZKa8u63aC25avUuaSwG3KDMI8e8/N5lw9tNRRGWnA2xO92UpQSV
	czYS7RvWbKItl61J/yZ+inTK0bC9eKrauXd3MZDWYKS7QCQ1q75VlR8JkTADwAYV6U9B0BsToyR
	6CMtbeTle8U46JybcG
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.231300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 43EC2EB0F8555BD7960C3919566ECD5DA5CF9F414446D988D5F99F5BB87D277C2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e579e6c-714b-43ce-c791-08da3e49b0c2
X-MS-TrafficTypeDiagnostic: DB7PR10MB1980:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR10MB1980C94DFA0847692751819EA9D69@DB7PR10MB1980.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9N4TM4mkCJlzatyjdCWtSP/fXNSIPcxeUB467PabMsn12kswkN4pz/WPOSXGg411LcI/cbIeAyb6tpkI102ChpiIelnhJaPM4pFqE8tz3m71Rro+gXxKYw4dpAs6m7bQZvU+h0rC94icEWjiLGrivjXLQ1thLJG+NM3sVYtvTr8mZb52H+/HoGYc+iuDPcCAVs60KgyW5YzIHJWBReIOi2HnX4uKdO2j4nElNy2XejY71cuki3cOaUgrC+/ReBuxo9wT7Zjkv0Bbb1+aL2X63s4XWNOWUORSvQB5w8iwMOqvNqje80R2W+xQoYCQRDKH+QRITLQ0HxnYgMCqUYBIWC/VMHvwwhss8hEdG2YHdK1ayChka+OpKfdEkFU6qsNT3QxNsl3woD4mmXLYB8UryDldL75qw9wFJVtDNv8/jpmmAJamldGjsCQEvP7wxBSnx5b4bSSD8GD18YOgxGsaPKCpuGnqcqxOAJX1BO2hAYm5drTPBGLiVkj8z36x3rSg7WBVt6woTf3xhmdfqIs07+DKNMlBtzdR8pk+om/sayjKK78nXgb8LdsJiB25Sp5hWciSgzmOJxQdq3Lvk5BQAIvAMrKJl2D4S/qZAFao+xVJT9vxMGsODoWUGOd3Q5KZUi8+Pk8FJurP29stSuo3T8WFaGw8ylu060iWtfxvEk+64Oc/lCLspfIY5ZFsQFnMaRYSWZesSsB8WEIKDWVj9Q==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(107886003)(2616005)(36860700001)(316002)(1076003)(6666004)(6916009)(956004)(26005)(36756003)(81166007)(82310400005)(4326008)(8676002)(86362001)(2906002)(4744005)(70206006)(82960400001)(70586007)(336012)(47076005)(8936002)(508600001)(83380400001)(186003)(16526019)(40460700003)(356005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 12:25:44.4912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e579e6c-714b-43ce-c791-08da3e49b0c2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT020.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB1980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 12:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166121

Allow wic to also manipulate the rootfs entry in fstab, which it
currently refuses to write. Reasons one might want to do that include
using systemd-growfs via --fsoptions on /
With this change / is now handled exactly the same as other
mountpoints, the former exception seemingly was not even documented.

Signed-off-by: Tobias Schmidl <tobiasschmidl@siemens.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index da483daed5..c44159b235 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint =3D=3D "/" or not part.mountpoint.starts=
with('/'):
+               or not part.mountpoint.startswith('/'):
                 continue
=20
             if part.use_uuid:
--=20
2.36.1


