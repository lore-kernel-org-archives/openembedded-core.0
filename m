Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA09C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 15:18:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10294.1657639071684575788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lrcatx7b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41924d93c3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26CEhYXw000582
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 15:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=te/pEuNswZEIS0I2NXfOOiU0qX9pGZfbIcPVEMopG9c=;
 b=lrcatx7bpBYhysnfh6y9lNfMd1oKAqMeIb94ksG7y+8YjvwNk9F8/UOTTL9cP3pjMgbY
 l1K7LWpxVU2grry+kw680/8f5fOUcUK5r93/iBB0TR80jYHqKFQ9IF6AgjR96yVHA5F9
 +bzHWIyvu1TzzdmPObR0gSadF4qBU38qYhXgyJpaWU3oeRWc/ezYPKRaEhGo8OCq82/Q
 itYRlxinO4Gfj45MTYsC9B9USPlAOs/hRa2JWn+p7OzeVFGzJEzvJGTa/GOS4yferh1D
 YxgdX/3qm6WHpmnpmL8HoNQ3gZdO9rSk9uUT8auzMFloCXMlsW99cHwpDUmO/w7ZTLWE fw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h6xw5jjee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 15:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGCpd9uubrLWI6zXAY/hJr0zBGQTHloLgQSiqLa4qnWAHKLlqvAdB3MtNHzDeZ2QgtxPM2XUeTF1ByV9n8mB5uGhdPE2ug7F89yYjj/rQQlOEBeP4zQh5i3rIViNjvgIXwiDL8o1u+EVfKBGXO/gcVDZEjBGU0N9E6MbodO74VrXiHgOG3+84UPVY+XSVhFzz8r7VNUN+66Hx8icV1eEpFCzQIYDt6mFFYe8lGB5yv1+Du+cT8S7lAEX5ohpLQU5ay4jaV2vBn0CtsMnUiV9Pien8QfYrJ/RrJKkKhF3ynZITgXUaprnF0T/jmRxrny4tw29ExhqD+KhKpvWY9MArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te/pEuNswZEIS0I2NXfOOiU0qX9pGZfbIcPVEMopG9c=;
 b=Zc7VLQzHRQgzgKF12mQF6+dnNY9QURXfo19zgYWXptbX6L583yCc5eTAEHtb4wYG/ITQJZNyLtwnuf/ahhZeACtRonUHYYBaOf18BcSjjmdMmphNpULrVpqbVz3ZqzLPCeCCdCn+kg6mQTkMRyRHAPCP5R4mCNtNrso/DAd/re/MlFRdlszzWcLd8gBWYBWBzXZpzbDMPWUbrT06GJ+affGraHbQO9hJVaxD823D+lHEMrXchwCMxoGrYAQEA1tgY0Waof9uzwiaswR+Oee4ao7dDhMgLofFmnroiqHEsGrVeHGfBrb8qzWkZR3pNG/I3sa8xk+mtXjY34g+L7I9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 15:17:48 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:17:47 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][V2] u-boot: upgrade 2022.04 -> 2022.07
Date: Tue, 12 Jul 2022 11:17:30 -0400
Message-Id: <20220712151730.10465-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0262.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::24) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b44c2d3f-0f09-4dce-1c19-08da6419ad76
X-MS-TrafficTypeDiagnostic: BL1PR11MB5413:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tZbLhJoX4HRjq0FgmsoOG0ILrqTfuN+T6zEIa+7m1ndIRwi8Kc1sMFspGuzXq7dksOP7cpQhQRHpaTg9A5/A0GDzmk6OJschPseickJGe87CnYg2MpJPGdCLfpBPnc+GlBVxb32Gp8WKsWu9WdowmWL3BP/T1kGNnuEm5I1++kkB+ywCEKwtgtOqlvG96zMdOAXPos9067vEJ2dqSwoWvT1lCVblO8CW/BdCGb2oC3oNYkoAempW2vNleHYp6wizV5hLxYxA2U8LfT7962Rj78olzpr0d9GmwUokpdwDE4ZOZ/8o1q0eIznbnaV5V3KeUQdfRnpbQTiy5ZyW2/trMvbT4TAVN1X4DFAZUjJER7vcjkXL8my4ZOvo8xJoliulzI7iXcValJdiJumBHLu1PGTQynXFoem+F74pwafmwrBz9BG2X/aBY/22SSIxEfB6BbRLjqU73/tW3cHS80oc+JvAds9YJ9Y2BReAbZXeG8p6JbVh/QFst2Fk5is73a++iNfACCQXeZnpFS1ogEzQO3JmWtXa2Q08g6iivtQCLymr+rfQbcSpNokdC5o57BdzbNKyF3zQhjG4PfC5YMMgjMdKvvuUHUYp5uuP6P2ygPoF6Y/L7Bme0vvX3R6d1xiui+DHSqgHaI0ynPH3Btc7JBBVar79Ca9WkrDZG0XHPLMohDa1mTcYKZxbkwQnVUEWkDTz9ITktzNZQByQw/fAA6Ep/QbZIGYTziMfzMx3bUFAsvVOBuN3fUFNvsszuw/F2HEZXZpx6JUQmDlmSPeDBfUsvxdO3+IDijdKS15dE3Rg1ZU1aUZ6BTX4cnNzZZSz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(8676002)(1076003)(66946007)(66476007)(66556008)(6486002)(6916009)(186003)(2616005)(478600001)(316002)(83380400001)(26005)(6666004)(41300700001)(38350700002)(38100700002)(6512007)(6506007)(2906002)(8936002)(44832011)(86362001)(36756003)(52116002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/6UOUPVv/bV+9aNAuuR3I8MSfuWy1lP8bIXsP/rEhFz1YRU4LgHkgqKk3hmj?=
 =?us-ascii?Q?fJVnJPObSOh8e/I8/BFNbbYadjh/ltr5kfHWDkvYnDeQ+qLNQCodwv03eVgi?=
 =?us-ascii?Q?KzmExhMI/eRbxkyPF4vXYeMcfjtWhEadzlYEn6EGU5RnZp6EBfrmO4lnM30l?=
 =?us-ascii?Q?p25RS68bNQNc4oV1sXiG/u69kkUebJWbSTpghf8xlUOICDxsYBBWUAOfhX6S?=
 =?us-ascii?Q?sDv9SbeDSmsE/I6jQfFdUhncfOc7awjk5FLFDZuv/dgaopoZTOu6AyggVoO+?=
 =?us-ascii?Q?LhMk2JiHwioXFChdHgtuTr6waRd/YyuIIk8CK95+vpSm3MBGBOrZEwh7pYnJ?=
 =?us-ascii?Q?WO+CetabT/+mgNc9Pe8t6LIxp5Ejc36GF60SW1Q6Iv0imOdZZL+CiWEKt78R?=
 =?us-ascii?Q?poDvzJ46P01208GUNzUXDKusDj+5U8lBm2h11/zwTD5/7BZGJN2k+nbBaW9d?=
 =?us-ascii?Q?hkuKrgS4xvkRAVlXsxnmkBIXKdKSWvQ34bwG19ShhX4F+1YBbd0WUHA/Rt4w?=
 =?us-ascii?Q?/LJ4JHk+r6mF+r5Hq0pJf5WxmS2hethX6d7vDG5ixKxrWlZ4ib6EkQmkBGkX?=
 =?us-ascii?Q?eqAZJuwJpqATMdmms0/lJv8/DBgVK7xu5Zwc5S6NE0iZO54cithUOVSDCJae?=
 =?us-ascii?Q?a2PQBCz2+MH45H4JH/VDtCMlcgu6bWKgv4qXZgQr4M5XJEM4rVXbDcRkXIHx?=
 =?us-ascii?Q?n5wEQEJAk/sYnfqmquonIsTC5Vk0AaeLguy3QQ/nQoxuay6yA/qq1BuY5LJh?=
 =?us-ascii?Q?o9hSdDrCX9XTnVvDI98wpRbfcOZTz1IUmLfSnTWjlm5tNL+eFyc6vl/9FlLE?=
 =?us-ascii?Q?EIweDtMdcdxFVWBHa5qxweZwUCRaI7hoG4hJQTWCOD4kSuTpKX/C99vt6XAq?=
 =?us-ascii?Q?A0lHh4Qbkp1iltUbYYzm3uVnkYeZCmdFTEiUUfb+jhov7GveF/65A/7lBBE9?=
 =?us-ascii?Q?BCzuQOZs1xfDqsFJD7GkYVFGo54RVinl25Q6Qr/zHkIRe/up2WMb4Ju6xz4o?=
 =?us-ascii?Q?JbAd8fmvEQgniu7G0ZdBOmq7AF90VkfjowiFeMRvszD1oGZLpqTY2ubOpYxp?=
 =?us-ascii?Q?bv3d/Mi7fAcgTwsGV/jtDXOnMkUOJcl4debEOJ2oo7GAKqE3PZz24UbkAmiR?=
 =?us-ascii?Q?BfrHWZdQ4PYDkDPK2AqkjHvQQyVzCYSvr/i1bQlZODOaIThYt2DzFocUI3QQ?=
 =?us-ascii?Q?7Ku6eJ3KjMTnSOuje/XnAqbOmaOaoveuVl/8oowz0SxCCEF7L4l3vY5pni+5?=
 =?us-ascii?Q?+3rqjF0gDkObsnVryKxgznPji/5KGkbD672gkFrHrLf2imulWk/akQBfRFY0?=
 =?us-ascii?Q?UHvY7DvW01KhwFxUkH6YyKxi2lqeCDXcV2KlSP0UKFlnsOFm5OOU7BnG+5j+?=
 =?us-ascii?Q?bwHb4iEXWOA55jIT+8IQQ7m9YYzboVJ2euLaBnRTX0P/hs0JQgQnOPVkb2CB?=
 =?us-ascii?Q?IMU1LTPxd+1ur0zpTmfct4o+MBc2SQh/BCw+vGE+nnOEB+Yb10AMhMhM08wH?=
 =?us-ascii?Q?UGEU13DrmIJEbDPJCd1nMNhfuQw3Bj5H/bsVSBsYCMto29S75omOZhM/PBSf?=
 =?us-ascii?Q?e/3FFzN6upjBrt9Cw/3+qASFkxfTg59Kg3Uf8wyYLM2jxtJC3BIuyLSnIf9n?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b44c2d3f-0f09-4dce-1c19-08da6419ad76
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:17:47.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NLtxNxXCqa/ASP8pSFJ7mZqNHkZeUoAI97duEAWxvGlQNJjTYH7vHWooDNXbYhQv43wMlSwWkQjs+QW71CipdfZ+pPLf85La5KSiIlQxg2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5413
X-Proofpoint-ORIG-GUID: 1i__5WRl3qpCujowCUX5mCpXuZm0YksL
X-Proofpoint-GUID: 1i__5WRl3qpCujowCUX5mCpXuZm0YksL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=967 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 15:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167935

License change came due to U-Boot commit:
    fba0882bcd Add valgrind headers to U-Boot

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
 .../{u-boot-tools_2022.04.bb => u-boot-tools_2022.07.bb}      | 0
 .../u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.04.bb => u-boot-tools_2022.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8fc33608d0..d7fd3c7227 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -7,12 +7,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
+SRCREV = "e092e3250270a1016c877da7bdd9384f14b1321e"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta/recipes-bsp/u-boot/u-boot_2022.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2022.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.07.bb
-- 
2.33.0


