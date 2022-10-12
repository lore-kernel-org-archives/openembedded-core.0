Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8292CC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 02:26:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.16198.1665541585955174585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 19:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HSbCHxUH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7284d77dd1=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29C2JNIw020045
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 19:26:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=UMyhFL9RzSTgPRR2jGq+tlaYAoiN9AU6+znuz7rMjdY=;
 b=HSbCHxUHLvcYPwYfvFTN0un0ru45DnPPytTqurBckvbMgMgj6C03xM/lb7beP1+40GyJ
 QgG1gk3Z3B3Cwdpc9htmYSj1nLL3yR+7nFcB8c1510mmRTFoeN7PJjnM6QecaOzafL7c
 tSQOq8TKkt1EvwJs4MwUs5ncYbKWSyaswG3rKQDeW3z1A1csqdk/RP/jd/ysFzsbEevS
 R/2+eJ28LIBbQDRWQyjTG9jYhA5lAQ4Hw/HvZmtxde3uaZENq5ZM475z1wD6oesaLnmM
 18OifaNXO4/bEzP5M4mLQWfWbhJuzmbqQc3v1CXC06J4KRepDutDRhY97QER7kt+3s/X eA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k34g2aswf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 19:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClR8YgppOGmvmHng4WhDSsHeKHt6DXeDrIuW08ZTzqj9/96+Qppj1JqAhVgPsL8J7RfkAWvqktbQusaT9iTciYInQULFsRUwR4/iVXBs4zySg237+SOblcHTOi8ur3JI0JoU4xv4hSDWKDi3aYYWWdh3AipD4Iog5Lq4h/qW+G2iUaocz0g5ntKYyOznhdjt2mY7USLS6w2lKPd9rwaVIGQ6mJHszZ8rolmnAALGoBCftrPJfxR8oDlYnO39TAADEC7EIKeE5WCWgTmSj3eW0gfL0EDEC6Od1g2FKDceON+5J6fJO5bbpO4xTq8SDRiCW7ttm0vdfhTeY0iMECdGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMyhFL9RzSTgPRR2jGq+tlaYAoiN9AU6+znuz7rMjdY=;
 b=F/3b1xTmzzIWE3fev3OKQvU0ZGmkzJqU5ZDCRUC7aZedSvCUw/1BsgAp/uYxSlp6+0GnkhoSBwqcFQfyJFmXmitBeVwENpWjVtQVMt5AGfiWqFLIdnBWcuXg4PG6PidsyCYA27a92+BzLPeREYCgRpz3C3rP+lB4B0FWe2LSCry3ZeAKaifH+sUmDch8oyGGeTI7XL0SDkooOzcbEV5q9D9dIBoMOC/KOjsiOp7GVUPZQ/5SXC08I33tHR3Cx8EtMowEAtdC1Bm3GJl3i+DmMpHIOWNCT2E2mJXRX5fV3vPzeoYsReiwcH13UCReYLeeHyL1WgQv6N5m3v/nR/BDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 02:26:24 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%7]) with mapi id 15.20.5676.032; Wed, 12 Oct 2022
 02:26:24 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] linux-yocto-dev: add qemuarm64
Date: Wed, 12 Oct 2022 10:35:19 +0800
Message-Id: <20221012023519.114997-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0184.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::8) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cf4cc4-45eb-4c2a-6725-08daabf92847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ybxkGt7I+9kRxPLuFlan+cD2Ey/TkDF13sOKCeEO9dkRDIkGfY3ivOHFT4YUj7h6Wre3fcAMoYm5lr3CJAIoJHiJfKkFewf2utPRpe5AbBlRcUldjY88QsKMpb7Pxp/ILhlIXIMTHaIJQhpfFRPeZk3iticPdoin0BV3A4qADRmyBb6KB6Ln8Jz6hQ5KhWAUjkuVdQTG2glrdP7d2LqeWjOx4psJRKXpRNbTUWWXDHBqXRjNLe0n7UOoHUUrmzI5HuzjZSR6hh16PNScmZzLLwaZ3JY7OHRP91vJ5S4hIIpHy6t2rD8Kor2LyuIZNgsdXlBrS+kXLVbNhGQpEjPLtvsx3Pkej0UFWEjQrkbuySiPe7oBgbUF5qPKaPLCVfepNbmKxcQc3+y0Y93eqcw7e1/4PhEF+y7kvhgKDgLCnh22ssXWDIlhTmESE6Bvpen7JLD20JJZ+uFmqIqKouqVwvRcmWds/KfqrRjN8TtJrhAI4u0FBxN3+crPaeQVfjoW4kSUcZmJMAFkZgo8wT3rihCVVyRSA38vh33Cvgyg3uN9BhXDnVbYrhZ7uOjlWRZa9NGin5hNnsokilG8Tib4QYMH32ArT0mf9pWnPXilCMbPJqnxEIg92C68kjTQxO4ROXT/wLD8UpC0qMpKdyIwVRk76P/18g7OLIjauSKzV0aL8rsDBiI9NZHIFp033affE0oWu8LsQIInqYQdzhQ6XsCdhjwxKxhx3v62qBV2R1lGLwuJASnDwYHbscK5ARzJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(451199015)(38100700002)(86362001)(36756003)(38350700002)(26005)(66556008)(6512007)(66946007)(8676002)(66476007)(1076003)(52116002)(41300700001)(6486002)(478600001)(6506007)(2616005)(5660300002)(8936002)(6666004)(316002)(83380400001)(186003)(6916009)(4744005)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5idZrdgYFomnowkbP098SyYIky0SFJLccOMqeXMyTsOt22io5C4gWjzChCzc?=
 =?us-ascii?Q?qnOWYvxVF90RhqARR658UfFZRGXKROq6GQanEONn60P1woL6rAQutydPQ7ko?=
 =?us-ascii?Q?YtQ73sLXA6pK0xV3mxcHd8PiG6cHg2yKOLbR78YjbGt+BQHBXbwVslhAjbP1?=
 =?us-ascii?Q?0Cb6tfA+N2oa/H7MNhALT6fw0i1hnYXTA09ZRoiOi59ElYgkNTbSfJVvo4L9?=
 =?us-ascii?Q?EW/KhrV+tiTGLMvG/ju3Q2yCyDwr7ZVq/l5f1b4cYWigYUSsMw228u7457go?=
 =?us-ascii?Q?pC6Y5Detl2Xzn5aGHBNR4UrVikBp36eD1UA9CTG6y27LOKgsvg/yGDILGRKz?=
 =?us-ascii?Q?IGF+TN76oNM1KkwkolcnElUSLkJD/48yF6YCSUlZWgONbR7lgFRpsMGYoWAi?=
 =?us-ascii?Q?K1Etu5Oe2DGErRdvX/TV/Hde/g0lchovc23HUMpWOoJrfT9c/C3dHT7j1OTs?=
 =?us-ascii?Q?N40OCTRF1RY1M7p3n5s8A3/PAjb96nhJCOI7OGsWrMAA3Yle6Dym2LuPXqla?=
 =?us-ascii?Q?dry7n5f+ikszhQV3S+rmwYTLjrUzGR838fnprKQGndBQSN19fm8c8CCm+nT9?=
 =?us-ascii?Q?xHodAFGE0yNcpdzzUbhqKCu5RZX5uJ6eFLPodMd2QCSHAt7ofMhQyUz04ixH?=
 =?us-ascii?Q?Wv2oWONDKRpJwaQhAfd0hz/37tuRHuO3pzofDQb613hxJGZUHH1NZ2CepsAa?=
 =?us-ascii?Q?FkrY9KbiTq3VPXDOjWiw9kYc8WJMxB3i2b4pEtbB2wdfyMteF6IvRAvreseV?=
 =?us-ascii?Q?AKyjtBFOdC+x7wTrIYoKtHDco8lN9g/neJCFUGBFluYUDgAOj03H8xnUsFFc?=
 =?us-ascii?Q?TZjw7pwRDtH4eYDlmLtk7FDsXO4r4TTz5cG70MLBrofBlYpizgU5n2Ozy+u7?=
 =?us-ascii?Q?+wn/nXBFGjtiVRXXfpys6mVxLps8aXoHv0DkAI7oy4zF2tpqMIggOkIQQz0L?=
 =?us-ascii?Q?uRJwbF8jADt46RD924RacDm+gm6c/MjHP5NpdBS5egYMzJM0YFmVcRV6RFqj?=
 =?us-ascii?Q?oQotF+5O9b4KPLd2pG1OIKty64c+C67HDTiM0soa+jNVcQcMWuK/ToXAvocC?=
 =?us-ascii?Q?BVkCOry5vqcRKj3lizbzIyGlOW1vomgg29qs1JPP0cfNOTSSqIxyvGfw9wNK?=
 =?us-ascii?Q?eRwqLhGdu8bP8rXJ7BeqMp7oPuJOh8K4mrWKCKHj/UnK5qDhpqOFaNyB9Jxj?=
 =?us-ascii?Q?pMzaS0IEPx90Ve5Jtl2v7nzodlcf/Sa7thLpTIAhy13YIuPP8rMeHYtHw7H7?=
 =?us-ascii?Q?9Kb/xs3+V0FU7V2uTsoCEP4PDEald2U0LPKWxC1OU8xZ8y0IuF7P92fknT1m?=
 =?us-ascii?Q?xvAq3eN0CVU52m+w+HdvhiKkXffo7qtYUQApz5oEwmM1kUJ5kvuhLtB3/qHh?=
 =?us-ascii?Q?V+fvCTERRVlB1B9lHb6jp0oE7uBJ/njVg78mOPNfcZCrbSPlBhgYARhXYWfK?=
 =?us-ascii?Q?KKA+yYmPss85EIAupPlTqyWw2tI/zv+q1c3fyJy213YrZ76vmjK+z8N8/El1?=
 =?us-ascii?Q?pa7WdbuoTU91CIU83S8f+mODw6e/P2sYQOv/nBufaqTlcISjhKKlTAHNO4pt?=
 =?us-ascii?Q?xOHNdQ1RIV4DLkvCIpo6chvvGDyqL57Yg8t2dGdx5/7MC71L6iK1426Kc4GI?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cf4cc4-45eb-4c2a-6725-08daabf92847
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 02:26:23.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6969pGyghiA4bAAD5qt3HedcWAm9zILPoNjAvaCoYuu97YDfn+YW2zUX/g0mJ8GkKySU58AE4AB4e+hF+tb0M7zLEVWco/iuWgz4ItLaQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-ORIG-GUID: k36zt5wqVJd3RfGDcJZG1tPnjI_jnz6Z
X-Proofpoint-GUID: k36zt5wqVJd3RfGDcJZG1tPnjI_jnz6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_01,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=604 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210120015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 02:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171645

Mark the qemuarm64 as compatible

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 75b1cb2a49..403993486b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.17.1


