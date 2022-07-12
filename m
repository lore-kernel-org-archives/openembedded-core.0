Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0864C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 02:37:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4501.1657593446075892790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 19:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UFUZ299m;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41924d93c3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26C2H8hl011549
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 02:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=AaOJF4MnE0CSnZ7eiT2HesbTMSKHWjj/5VzjVnNGSRU=;
 b=UFUZ299mHToRwAeuKNC6EyiFtMtqe5h98tsAMNd7iWp815SgSbK9N9VrcufOM0xKR1AS
 LefAPhVpPbNeyGXRMpVaFVU+0Lt+BeG6BG0biwA3JJdbV+hjTpPsyU245IGEhRwLJeN6
 rKV/g8XOX+DgCG9P2Pgwzmvl86FLvh9dMfYzcXcsnYKS3a2iG/j2b8I9U00TpTpgzBOp
 nRvwfdXRAZazKE2t84fLj1tLT+Zuh+AKiMa3UOu8FbKwuhoA9lLqS2zH0VvpOQeZZsy3
 2HWQlata3dz6JsNWsSTL9Fc6+lSEZ6Qq9BUBfDCC5KRFJbJrLB4XNSsI12/Ogw4L9goJ AA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h6xw5j2mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eq2rz/yQKwWibC0VR2NHXP0OJOwyLHQyQy7zYb7VFampgQ0Va7Bwvjka4BbHKGcg+jQ/fWsSCpsW5Viys3RhqOup3cxJZMdphD1emXgUA3afSyhE0AXtC9wBcprMbW6kI6vLaBZQogYUQ8n+XpkIeF6prhBvhtGJnwi8RdzUwrz55vvJyBXtDuAz6ypkoJ0aBV6Wh307cPmU6KpvBYxSQsID53D+RqEZYzh6Eeq1kKgem/O7BtuNx+yv1v0F0Hn9B7hHsyOTwAAv9FqG9tCA2AXuNUP63vJcXbqag9fC3HdWd9JMAdVpgXkiipu3hHZAUhx92HUSPhS0ktHaa4ZAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaOJF4MnE0CSnZ7eiT2HesbTMSKHWjj/5VzjVnNGSRU=;
 b=l2kdLZimzdnXUzj+rUgK4VLLd7NM/1mXM3SJbIPTs89XweDzvRkThiUJ8UDH1VJsSV2RG63tF8Hz5mRLuHsIcoyaVs81vmXb/TePszQEf4UwACLXZc0gSyWUq40JFisu8OrS97YBDY9TFPb2/Rt2BloHgFUqkCA+/3/Reep0bUpL4oo2a1SqZ4SIqrxYz0AVvr7LlUUw1nKzdQISTJEWhIwAsx94HsFKZg0mIbgvYUnfSkKKrJWndYdKgznAGqXoIW05ZtZUPxrxM94Z5LuPUnEhSWqqjfDR0gSGITSWNH9dohuGkFtX9nq0bFTJ1gmoX+HAQO4AQS7T5WxLpiDOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB4192.namprd11.prod.outlook.com (2603:10b6:208:13f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 02:37:23 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 02:37:23 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot: upgrade 2022.04 -> 2022.07
Date: Mon, 11 Jul 2022 22:37:08 -0400
Message-Id: <20220712023708.15346-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::27) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9295252c-8bee-4a8b-4dcd-08da63af7324
X-MS-TrafficTypeDiagnostic: MN2PR11MB4192:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YtUwHDAccSLB19yAD2GfTLpiMB/UQeGkxQ15MNyDMA7SxR8g2pM7gZdf2qviPqCUNQSqWNR0yFWUCtzV38IsOTIM3ycMA9OxlbSyFBTp2rLp0G2ynNsANThA3ZnBdvN8OH4JkoP7qFvYiBVosTjobpx8euQP/SPj8ZU1gjCl85m30SJB7djiVqfyBoNfdNIfesnG/kmWuNgyqyw48bKRxAXk8yCwvCSYRtwQSzUjqsMZ2tWGaIYgzWBW1sIFICy7BdHAbVQCs+2+JDGTe0b41J27ahbBD81JJUEZGEEnw/7hr4utt4esQnsy+woz8bfIWeE6G6td72+sHMODpkyP76d8qPro/fkZeRPJLaq6LXsSnItxQikCPtLLdmh5SNIlJ05EhcOc5SEl6OqXPbXlgWpxM/Jq5nIZgc05tcaTvXPMOxFAf3+iARQrVzzD6FC/GMBieLr8vngvNyb4HDtDl4XSRcUdOYN+dZpqcJMSsQh46yGAnFwTXULvENrKreIxW8NhyPws3V8NJ6OmM2JU18Rxk7nH+64sGdNby2p9x1vESAFtfQbsq3kquRbHCn5XxxYvIuocwkDuxggzsLHV9q642sz/y9zBxkKXeU/chjFX+EbJBoKkcG0zMbhRWHSqtDZf4gi6MHrMMyBiNzIeTtY13YXZ2Gr/khcp9th0LO8Iwr+Ij+H5zXuIZbhZtaP7fcz36LnYR4VHy50O/qq3FRaSOvIeGC/IMPAhmLfJcW1jY+IHFka/0zYSjvNX1K1k8Ox1nhu5aPwRaWFkLyPzzogidcDY7pS600Ej1qmwl7TATdLvJgu+6JDX8VQ5PwDl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(44832011)(186003)(478600001)(8936002)(26005)(6486002)(5660300002)(2616005)(52116002)(8676002)(1076003)(86362001)(6916009)(6506007)(2906002)(6666004)(38100700002)(41300700001)(66556008)(66476007)(83380400001)(66946007)(6512007)(36756003)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hCtBqgdOvRjBZT9fbQJPo1bIYypEMsUtfKWA09sdcVOINGi1P++FGMv+WOM3?=
 =?us-ascii?Q?YBNxwWjj1u0mpreyLJRtTl0jWVBKz1mGmXwM84veMJYWcDMamIh0CrFoheil?=
 =?us-ascii?Q?gij28dllnZTxU/WhWDU5PCz7RGkM4Whmia4C8WDC2Hv7goT7QGEIf2C8ljwh?=
 =?us-ascii?Q?97D/jjeB3cqIsT6Tg9LhTCazYHLIxU4X7aK1doMrC4IFqqS+FE4nzF8MdjIt?=
 =?us-ascii?Q?uiI0y1uFoFSKVXIaEYvILKAGT3XJNLLfA31WkUbzRu1DcjBKhLCwk0vaMyOP?=
 =?us-ascii?Q?lGsd9cFdiPAv9sAWCmXbrdWDl/iIGuaw01YpPGh2jYbqRtVVyAa/CTpjMGm/?=
 =?us-ascii?Q?0ptv8gFRSOcdfvpXRHJRQfW+Hp2+yBMQs/yQuxwyCUbG/MYrTWtDAzvqzqFt?=
 =?us-ascii?Q?HBrApAkC3s6v/3180ftKua4EsRm5juN8aZcfIFW+urYYUS8zjhllcDfo/fms?=
 =?us-ascii?Q?9tv0UWCgOrE2wstaTynLqsyms7DccsiIYZbqD/5OpHoaKWGaBq9ov/rHtVjl?=
 =?us-ascii?Q?1hwPup2RmMnfolAvJ5Zr4cdwJNvhFZ9/S+zisgjPbxAPi/ZHovDMK2xEO6+S?=
 =?us-ascii?Q?8eygEzqXBL/z1W05+XVvv8m8gupwXR3qUab71X7oauvzrZVurVBmO2JECl7A?=
 =?us-ascii?Q?99S4iqn2t36ODT3uwv/FEe4Vpq0mVNKUz6DrAUQ3nqsdSPTpWpagBFWr025y?=
 =?us-ascii?Q?n6Luas3+u4e5iB2xs6Tt1Ny49skuAp+EwCUvZ+tgKtj3ZOJ3Kz+aeUmipELm?=
 =?us-ascii?Q?3aGO4tnkkGISJ6FikTgYeSh9yralMrT5slMOADg7oJ3X0XXh4+rPW84jlnMr?=
 =?us-ascii?Q?mWMGqYgdIm4/NyP1Ve2ARRxMB50TgxfDeRDKG4lcFG1xnvYW1Vh1CPeGCk1H?=
 =?us-ascii?Q?3lponAZpriwBw+26Cw29zJ/ONgKNO4b024iHbnlssMlUVd5YQMHDuoIW38cS?=
 =?us-ascii?Q?nQHytczOulnoJtvYyw5NFTwK7OPHj9AUWFlIA54DR9pc5z2p+ya1V/sErTOV?=
 =?us-ascii?Q?KuqvypprXJA28AKXbqZQo8l2Gwqp/Hz8NntcfIcLft5ew78031IYL8YeuOwm?=
 =?us-ascii?Q?CNjI3gNpFNqLen0Op2otssXbKHxQ5js+HdJvsXnHyUSpA/xYc0zprhXyT0SP?=
 =?us-ascii?Q?AX2iklPEAaROFtJL2X1ISHkmV6cHThRC5ixjZBEFxL4wbYxegCsqCvBeGtkq?=
 =?us-ascii?Q?Fh0Y7zieAOK4Q1++soiJT7ophJticl/1XtiyWr8jr/xJkeVUsgn9OZ3qa6IG?=
 =?us-ascii?Q?prBphJBleGb1ytEpEkGcr2e9Cd6mS0TTE0ZU65YKw1eiUctV27D0kexlE/iq?=
 =?us-ascii?Q?nftC/eZ1gPNSZgolc1Pc02ZpDAAoVT1ZAv/w8GaayejBQSoBZj/Q1V7rPAv+?=
 =?us-ascii?Q?gCyxhgUx1U5TYP9wN/e+mx4L4nHI31YznG8WHyjzk6b7j5TvBn5QkRBees/U?=
 =?us-ascii?Q?3BeLmziopieZaJuinkfwsIvr9ze+ZwS/SacB6gmIsY+7xPbRCAqmI8rghphI?=
 =?us-ascii?Q?eeO8894FBAy8RDkRkmiWdfwx/qSTDvOvY2AjmJaja+K+zVpOQgFQKA0Z0jXR?=
 =?us-ascii?Q?6R0LBSTZoAcKIhnCoFREPp9EbVj5QmXTsB8diOF4DF3VdsPYMgwASA/Ykh0u?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9295252c-8bee-4a8b-4dcd-08da63af7324
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 02:37:22.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 myt6FWWjyGbsxPzG20mtqnApJ3sYxwer2ILC750OSpCcjTFztJVMvRQ7J/qhqoNjgZC00ZK2oNHsSv95DEc4gNEMc7T/TMMsIeq15cuz880=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4192
X-Proofpoint-ORIG-GUID: MyIBQ56Vn6r0kRcMtNiJE52PqBs3QUge
X-Proofpoint-GUID: MyIBQ56Vn6r0kRcMtNiJE52PqBs3QUge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_01,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=944 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 02:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167888

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


