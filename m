Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CF5C004C0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:51:47 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.57])
 by mx.groups.io with SMTP id smtpd.web10.81789.1697903506353010548
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=WTFlAWuy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.247.57, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLFpF8SIez9YSdarE2FJOSyC1xdQjQ9bBL1Z59BWw/7C2nWDjKaSm0J8gNzELIlMClPnZpQlZHSZTWzsAwENMgZb2TzMTmqEBjWGbSSCVPLohjhfk65Qs905fEdGdVVNETfeDEz+z1sp/53YCUunYTq4PJr69fNPRMbQRnE5IKn2TFXkYPgFMsKY/zcFopQfHSsaT+K7hNGNjAMUmSer4aa5Bh6N7VAlFBXw4dG+BmMWcs11bp6EQJ0DdS0pDHmAPnGyRKc29PZ1q0DbwFfGaG2p5FgLH404z4/yL/grUgMObg2t+yvRDqqN7seShZRo/RG1gaZOXRPSGf/0sroyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtnRDGHSe4vgTRrW7C2QFXpZVj2deGIJrYTYgiS+OnI=;
 b=Glj4rdgrgFYhvAZF4ao6+cm7or6RVHglGQn8+46ghX/DtFtH8Yey2IO0PqVmtoeTGAd5c0Z5DenMvZUDvCGCX/RRumOy/kQJX0ETPIHORPVzmsedYxpWnvn3PRDS6d65HHDrsZB/PIn+Mut21Ohmz/oYgkwzPHnFLyDfzKajnfOks4GFHIo7GZj69LPNcnxTDU7DRHNtQJ7FF33HoO0QHab+ED7M7qlVlwE7aw2KQx8346t6Rviut3Zbpj/6mrx0wRbllZwpFauEclmcKWHGrJrnezfjS6400jWAvX3Jj7fQM7oB8quG3/yTrJX4Y077tjwaXoVm4oiYakLpLUAYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtnRDGHSe4vgTRrW7C2QFXpZVj2deGIJrYTYgiS+OnI=;
 b=WTFlAWuywLAQKmO25FcgpatHk8fUt9jCBGuGeKELcRczvCtrMTohk7yWHISq6gwshJznRACcM7dAp5bBsra882XZfIq81GMONjtW2YNoQWpzfGvhzCQ0Yt1bjpsFCjQ4is3dsNlw4GbItDwr6v7dmZebR5Wsg6xR/ONiqIwqpS0NTH5Tm6qLGWkq2bCzdywynnwgKXUQJaWVaug99A7AlvmHVsR5g06mP0INNY8pLFg88s0ZXK98sgEhSGW1A2DwAbtvkI2E7WTfkJ+yLwjKByoBfBM2XFqiyxNFWybOCHziTDr5XfHOSaStzVe12cTVI3DKP2y7Srx+BCVDuV2wUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6892.eurprd06.prod.outlook.com (2603:10a6:102:8a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 15:51:44 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%4]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 15:51:44 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2 2/4] package_rpm.bbclass: Minor cosmetic and style fixes
Date: Sat, 21 Oct 2023 15:51:12 +0000
Message-ID: <20231021155114.3979864-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021155114.3979864-1-niko.mauno@vaisala.com>
References: <20231021155114.3979864-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5476a0-63d5-410b-e61d-08dbd24da00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dP7OzlMGKDPL+veKtkdEvmIrDCfDrno3da4yHS6AJczASaiH3SdV5lmJqR0zeIp/gr1vKsTdQ5NQFFHJzLxQPMqy7986ZYvui3rCiPCeJNsu57g2s7ISLNllQ+CwRl1QriJ9eESDLi8tCZtq+G5Zl5ZrKfy6l3sT9Swjravwx7KpeVyv55FRd93i0x9ej5KtbHCoY0Fjlw2KXjE2VjRtyCTAM4W63kHTlgCOLG3IRjdjpHDZDrnR5o+b6E7O2YDLl5xp/AXtWxAi703vsXESzjKdABWPvEfz37Q13KJXm5yd5sNYoDkpC2Z+vnhgG/8TXe3jbD0y8ILtiPHeUo+C37FqOmpUay8QUch1QnISySJ4eSfG6KYuc0Y796b4wPdWGjKqOoVc92swM0tZVEYynaY/pM6pdLWv+GhoTVlGRSSPmsgPAUwqwHbTLLVinQIzm0yFZtp9vz1OS0S9MYRXLtN6jLojqa4QDzci3mfbNX9dwCqlvRuXmMq6FHOvLeDN7qyUJmdlwc46z4Lg8ZmPEE6gi15BydKVhUAOqImI6hqEtY/FyDXaAeo4EdJShsS97vmqt4X/HPTgmesugP3g+t/VyZ/vH7A4JmYXvWDNZ1FDrhSfuIZg7QIRltuNsz5J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39850400004)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(1076003)(107886003)(9686003)(6506007)(6666004)(6512007)(52116002)(26005)(2616005)(83380400001)(8936002)(41300700001)(5660300002)(8676002)(4326008)(4744005)(2906002)(478600001)(6486002)(66946007)(6916009)(66556008)(316002)(66476007)(86362001)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NsOV5S3YkeBTRQnQ/QQV9plOKeHqRc0APFEBtA66cgQA6SXAT3WR9yiBHbpL?=
 =?us-ascii?Q?y1Zzuk+AFZcAKYTgoLobEk0Du+83iMB5gmPtWpFOar5eUOBriCcMdW+x2bUd?=
 =?us-ascii?Q?fqdEL1lSBqrOL8fBChAxwhAT2caaNg+m4LaAKZNheGw7TLl2gyzWyvTjZkUF?=
 =?us-ascii?Q?vC3LHkccZgiiwPKxrFypmxf/MBi9qXFtE/P9erS00MaUqgpO0kXwvmTmnr+y?=
 =?us-ascii?Q?Cjg0feZ1QT1JY1fxPO5ix0SQVY+yblwnKQXPDWHT8/4MeHu7IgGZItdyWOsR?=
 =?us-ascii?Q?8b8r+6J+f++eI/Cd/rg6gGnwwRBJBNal/dTNg+1HRG3eNjOVNUjr94uHS/rN?=
 =?us-ascii?Q?JikbfTCt3G3q745zG/XeFsaP97zoBm18aKPzai1GJ8aUcKWjPcSqnvcAxUlG?=
 =?us-ascii?Q?0J545mGCnZKQj1NsKRt12BSIPg5PrQw8/kxJ7SUk18/lQdYBdh7+7bIhqy7x?=
 =?us-ascii?Q?6SjqljuVyyDP9S0ZwkgaVRrnhrazZFg4Hv9c+gktbXzBG+YmkMdPa6YPwRS/?=
 =?us-ascii?Q?rRmaxBcZEnGiEcoQGVexA6Zcv78FMdtQ684c5yKUJcd5kBLjnx+xpKCEromY?=
 =?us-ascii?Q?YK1MSTkJdzv0aKNXSTY2RvBKPtwa7ZdSQqh3yvq5+ctu/TYNRzAhyUepD99z?=
 =?us-ascii?Q?6oEp8WkPpI4CuWY6BAfe+f3dHfjtrAdFnv3wpu13EGTeGb7mzcXWl4LYgIGT?=
 =?us-ascii?Q?fH+OvS7c5Ya3IduBezx4AB5fNUlU8iD3/NhlqwaODsnofTYg++/sbYE7AOhC?=
 =?us-ascii?Q?XKVkc0x/JuDh7okTjHG9hg0wzA+nh2AacrhFZ/7nLKcI0f+mOWgKz61huoyF?=
 =?us-ascii?Q?SWMP8NiNrCxS/+gxPK0/H7Qt5jNyWufjRLwbaMfjtVZ6mno0rg/cZ+idS3eO?=
 =?us-ascii?Q?UkiiD5IPvBTRpzTSruqeA9Bky/peRkZ22g5ODvN5cLuGHhO4KM3i3XlYUKUs?=
 =?us-ascii?Q?RNyYU8eypyT6Z5FIRs7XDEPAwJJE/+beiyIrZUx3JIql9xlRvUA2tDCV56W8?=
 =?us-ascii?Q?qT3ktf4WwHAg4QTQw+opkYqg3/1OWdC89tTvvwCVTjsuCb+3y48XvfzlCQeO?=
 =?us-ascii?Q?UEH3wzYSbZEg/YzinywFdsfOsYhAJchzmYf98y6mKS7Jx0LUSJwj13QsLh+V?=
 =?us-ascii?Q?C0v7XJFaZY2soPqUPW1EshLa0dsqtMpJr/g9ZKhX18doIQvrI8VA62zWvdGB?=
 =?us-ascii?Q?eWgrCyHdLZPk8YV+uGmAvfgG/oYbcosz02oMZr/0ZtIp4Zzcn4bf1dBofVKj?=
 =?us-ascii?Q?5VuQsJfGNSkjfMDxMizd9+uoaVxEMxMt3e6mDdySyZwVpzvWPzPLTPPii4o4?=
 =?us-ascii?Q?iFLU6MwO12hH3w6HnxBZqxFmgLKc+jh4G/9QtIZAhksJPn+9ra9apsOxE7aQ?=
 =?us-ascii?Q?OSFdKMJok896ppdmAP3xj3KRinG5t0f5hb+dIxNxgcIubaKixhX/1K6/aA/r?=
 =?us-ascii?Q?hKQi6DIASYjVsElExcRkKiNTlpYSxsaGy6C1gAVTNb7lr9tb1o8r3TLsx9ed?=
 =?us-ascii?Q?9cSnI5xgZHT4JTCUzNLRZufWfuKv+LeLB6unX+QNlaaw4TzaLt4xxP2KPqLa?=
 =?us-ascii?Q?Qbhjs0249zh0Y8gZqbWqvQp8Zx79A0RU7FVwsAGOEMbY3gGmVlsZXiKDeE4O?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5476a0-63d5-410b-e61d-08dbd24da00e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 15:51:44.4325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RhsriJLJUnxh3Q4LeKhCH9aLe1VqI4DxyL6No2ffQvW6LsRoM3QT5lHQOdGA18+H66UNsdOuQ8DyC38f5k8uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189595

From: Niko Mauno <niko.mauno@vaisala.com>

Add the missing conventional space characters around bitbake variable
assignment operators. Also fix a typo on a comment line.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 992446a033..402fa5c4e8 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -8,12 +8,12 @@ inherit package
=20
 IMAGE_PKGTYPE ?=3D "rpm"
=20
-RPM=3D"rpm"
-RPMBUILD=3D"rpmbuild"
+RPM =3D "rpm"
+RPMBUILD =3D "rpmbuild"
=20
 PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
=20
-# Maintaining the perfile dependencies has singificant overhead when writi=
ng the
+# Maintaining the perfile dependencies has significant overhead when writi=
ng the
 # packages. When set, this value merges them for efficiency.
 MERGEPERFILEDEPS =3D "1"
=20
--=20
2.39.2


