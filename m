Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C900DC25B07
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 14:12:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6309.1660140750062072225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GYOLr76k;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5221100a95=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACdJdJ006366
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=0w/1ZKpUk6AH/bixG5DAJGW9y8Ao5k4AbkqfhDFPZyg=;
 b=GYOLr76kPrmFxZl6e6g73cmmL04VkVW5XJE7X2FCf7ZYiAhlUeeZbvXljreNC+c62rTS
 RYM1ONvAsEWhA2OlTeOw0Ev+VhsUW9lZ4lZh/4O6oPnHOjj/IKqK82LYLAHZrcaGhpuP
 UdsmwAC5uSg+MIJWGq/QgxrO+0bO8esCW8DKNnFTtcqWUipvcUaptg7XLj8Hj9hrkiUs
 Pv8/XFQ2yRe6sIkfxoodQbFvr+ykttt2KFRsl5/LGlIy/2zmwngBM2NGLR18Chk4HiWf
 v0+kZuGbVNpHleoBPm6p8XQ4TeShnW6TNrW+Yd4d7wmSYSIOy1zzc4YoMM78ie0x7OF8 JQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7rkp5-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=augf/hzu0VQcb2E+leCLCloL60zQ7L/xzA2viq4cbZwNgpNWj38KZ8opl+4CJz8Tp3CLZPFcGyomjoBauwz8UWaPWM6c8zUX6zirwmGDIzpNMLVwMYgU7ZAThjsnJGDptJMBgimPoV4kY1sXPxpMICCoU1LWA/gHDD6w8pIryVPzf5GFylphQG0KJygUBKHl2/c5kao9OCpOUr/L/gcmppMGHjlyyl6Vw5/m//djLnBJwQExDcgMvSH2TMIaJhM7Im566SDRFPJUaffCJrJWiJR5KMGHxbr3XVwqohW75g3fQCuD5iTQgHH3YE9DMXk3AjeqeA/L0BIgVmwBDA5z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w/1ZKpUk6AH/bixG5DAJGW9y8Ao5k4AbkqfhDFPZyg=;
 b=SVVTnIvT58SYeBCTcWQOtUdmzmU8pbr4tuDJj9PcSy8GVX5p1DNQf8fFNLJmkiE5HyfDkdkARIpvOU5NsuPXGwoRH0WxQbu4jvOUhNlLCWM+beSh+jtJJZtga/clS6NOgHwrKoKfgpqVl/yYGnvA82F+vYuz7Y5zGt//PGAZbKpcdViGqMzbV0744kegpDBelrsmDMmkJtVz2wcaLak33efP/DJ8s0jokCVTs4NLCthxZAE8KKNTDe212DKOiYDqYeIzD4srUEWjXF7eM1XQrAVOUzJyMc6nifAir4SNvjcKn7cWr6usvFIQFWwo++bXU6opydMfxjUlupgnqaTYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB3646.namprd11.prod.outlook.com (2603:10b6:208:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 10 Aug 2022 14:12:26 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 14:12:26 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 5/5] qemu: fix CVE-2022-0216
Date: Wed, 10 Aug 2022 10:11:59 -0400
Message-Id: <20220810141159.21182-5-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220810141159.21182-1-sakib.sajal@windriver.com>
References: <20220810141159.21182-1-sakib.sajal@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1e0e61e-c18b-4a94-5d10-08da7ada598c
X-MS-TrafficTypeDiagnostic: MN2PR11MB3646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xLZF/ZVUmPaxfiTyz/4d1pU84UFDpNlp4LRdttPVzhQ0fN3Nx2letgRCkDE0Gvetba/wStgXUIQovbPeBECLX1eYIZN8TLyiwpP5IZFvyXYJhELUCw5cxHWbn2NMs4NfqHvBHeD55qRYh3giNBQp2eIRyFaxs+4K7fRzQAWGZy/QG4y3ZqQJH64jNhOkHx5nLiwhbqdRJVOxH4+6onU3X1MeHY6bJ6mxhNbAQe87KC50kev260RQWgK5XOUz/7z8Jnys+Tz7qVWmmO7IyHffiqSH072VPDAkNN4bTJDNHQ+Y7FjlAAtRoWAPUh76yWgBYbezRlD/h+xZve6rp0FM4iozoUFscIGZu3FhuGURsCjICFbOnIU2TnJy/XykHWigNv58FGPDKx32BLybrMToSbGw4Glq+GQVfK/asr0cRsjJjSgRXyu3NIYsezh1hCk0cor6CYqrVGrCRxTCjvBMgsroVdXEwLf2P9+lnmDFYUm/Q37UUvudpABPrIr/uy6F8voKCoBU6FEE5jMmCb7lD4MkSVB4nWG5blVrYffsGgqIy4jQgZepRmTXzCZDM3MWv/lZxxh4Xd2NMkWYUZM/zDNZZh2cR7gAQIGujWQ9FjR83PTjuKgF87AUXhgCHSHHTV1sv3kaDWzuaX1CEyPMWR4vxgX/YLoV5fz+S+EUa4g7l68D0EvHIllmu2IXajnVmZ98P0LlHVbRQ1zYrK5kxhk0+xY/9rjKa3jYwAdRhG87D1sFZVSpKFkVJFwJGbnH3SDd2qbfWPjSwYp63XteATDOCyD24PQ/iUd14g6uP5POLWSuALO5Sug9yO3zOMBHtIlIQa/vHqdtGLzk6T7hAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(478600001)(6486002)(41300700001)(86362001)(966005)(6666004)(36756003)(6512007)(26005)(6506007)(186003)(2616005)(52116002)(83380400001)(316002)(6916009)(1076003)(8676002)(66946007)(44832011)(8936002)(66556008)(66476007)(38100700002)(38350700002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uSyBXbdhpY6wFowxuk2r2oQsY5jbhVkzVmEG2PK075beNrI866CgR4LB/2e6?=
 =?us-ascii?Q?BWJ6bCvm1RFt6nHFXI98jniVlGIhFG+UEpOo1i8GmmIILbZI9HpCwLTyXJ9s?=
 =?us-ascii?Q?ZZXMRrV9ZWdWmI5vTOx3d6Nd9S1UClCjuKRwD+N53EHmi9EEKyir9UadVt51?=
 =?us-ascii?Q?z91Bg/MtqJUN6NtNh+3fx0KWiSP7imJK3v4y00yIBnx4wt84vuDiFo/lAbs3?=
 =?us-ascii?Q?acm/XpMFeAFlmfisUhkhUICcXhGOC8H1UcXLoBCQvVJ6Vu5sQzRI7zt/I07e?=
 =?us-ascii?Q?Cy8/hNQfWTEID3TugpqrbCsgaWKFpXusHhMrpOCd475wo0Zcke/f+6bXA+8E?=
 =?us-ascii?Q?2t4YCZ4THHVoHfaLxQ+3Jo8o1nJFCkWLuW24YXretYOwmHhds4zSj4aWOx2t?=
 =?us-ascii?Q?eYMmgQrvsIso5yW0MI7HEh4XP89vyGiZp/9fxVp0v6zuclY1uqWPPFBpzH/j?=
 =?us-ascii?Q?U2Lh8TEZUl72fpYRB4rVc3P66DxCZumXb2GxDKY3Xf1XYjDnFMbwGWJP6esb?=
 =?us-ascii?Q?X8e9hfVn5rW2L1ylpABksOQBTB3k/KMqZTrHgpQk+8IpvrrpZ3Ifqu6znx56?=
 =?us-ascii?Q?2dH/zcYCFIiSDgqXzN2GuQ9VYL1xCeZ0tTwOLDfsPLAlOUUF2eCI9/1I9XIo?=
 =?us-ascii?Q?gFg7cSnN6vxTNjX1FBIXHNAGeZvIqgtjPw6KCKXlqqWllAkIvvHMxWjsKt9m?=
 =?us-ascii?Q?G+20mCUVxkfG98HbanqjSY6SmiyDkBqyGqTELtBhtuwj2/HveTbgDB72gsgL?=
 =?us-ascii?Q?YVtVKJpdbuvBYL8XPtXvDLkeD+wo/+ZdfhmzBCBTVo/RQbJN9/UEynz4VapV?=
 =?us-ascii?Q?LyLQxHuQcqhOl99owVDq34VN3x9NM7WIcD6fVJVF4kDTYfiuhdB+H2pXJ/IN?=
 =?us-ascii?Q?s50XEXLQczp/b/9FGkzBV555JVS2PhmFMRcxuYZeZZJiW/WfgGIMDs4LMNme?=
 =?us-ascii?Q?dZNmnXnQGp012Zidfl0srxCpg/j4tV+IaCqTYMdo7WMOKQS4OEinKQELGhTq?=
 =?us-ascii?Q?NN2W2MvoeA/EmhIV5sMUqiVsR3O9BoxVYZRPLmMy+tn39Sa7K0b78Fcp5tDH?=
 =?us-ascii?Q?PNZIYisqRpTK8PUZ5rkf2G0yFRm+ccw2twTn5ZeqDTWwDA95WXc6bLyczn+6?=
 =?us-ascii?Q?NGK7R9vc9eo0ZbZNsGJsNqPsa4xpQwyfOe0xZKXX9kGR/NcBI8Zr+8ta3Qpu?=
 =?us-ascii?Q?zRy727miHqi7qAd4rH0QwI+GncWbnGkarzRit3sRODCOppsRqjDN/ouGavHk?=
 =?us-ascii?Q?4HmAV/CxEj5WC79qEY3ebzUNHss4zCPup0HGGGGGygJD4g0J4OLMCysOyFF5?=
 =?us-ascii?Q?4LonbujK0I5aam5BWviPE4J8VnMs1jGsPlVR/maxBrCmukuoGQApLs96EHOO?=
 =?us-ascii?Q?RAILLSnyfW3/7xSw93IDhbZy7yrYNIsOgHCjhdx5gmg1zfjL2aeYKX8lgXyY?=
 =?us-ascii?Q?/HXzr18aMrsnqmQaWjcyot3SUvN1vm7nF/mb3/EONQIUGwEWGwQGtD+f5cjR?=
 =?us-ascii?Q?M8R5w3IPKMJc7jSER86hQFYK6ILkp5R2SildDmIBLTWKqsYKCOiECw/nsyn2?=
 =?us-ascii?Q?mGcCwg0EAAVId217FVKBZniAafxpSoOLdyxvVEplNEAAA+B6z05PVYRQA+tr?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1e0e61e-c18b-4a94-5d10-08da7ada598c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:12:25.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kj2XrkPRkLB+jRhhNxxeryuNHDUfL+XunWAvH/UwpWhAQRdr9qQCj1bbXuPNDTfW/xDZPIfzmpARx4paeLFb0OnuT8TtfF7OciHuYgO8EYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3646
X-Proofpoint-GUID: 3482RcW9vBFJkbTbmoeNJO8OgxSL2x2Z
X-Proofpoint-ORIG-GUID: 3482RcW9vBFJkbTbmoeNJO8OgxSL2x2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=898
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 14:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169196

Backport relevant patches to fix CVE-2022-0216.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2022-0216_1.patch           | 42 +++++++++++++++
 .../qemu/qemu/CVE-2022-0216_2.patch           | 52 +++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 44d4c9ca2f..a493ac8add 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3929.patch \
            file://CVE-2021-4158.patch \
            file://CVE-2022-0358.patch \
+           file://CVE-2022-0216_1.patch \
+           file://CVE-2022-0216_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
new file mode 100644
index 0000000000..de7458fc72
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
@@ -0,0 +1,42 @@
+From 1cedc914b2c4b4e0c9dfcd1b0e02917af35b5eb6 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Tue, 5 Jul 2022 22:05:43 +0200
+Subject: [PATCH 1/3] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
+ (CVE-2022-0216)
+
+Set current_req->req to NULL to prevent reusing a free'd buffer in case of
+repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
+
+Fixes: CVE-2022-0216
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [6c8fa961da5e60f574bb52fd3ad44b1e9e8ad4b8]
+CVE: CVE-2022-0216
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 85e907a78..8033cf050 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1029,8 +1029,9 @@ static void lsi_do_msgout(LSIState *s)
+         case 0x0d:
+             /* The ABORT TAG message clears the current I/O process only. */
+             trace_lsi_do_msgout_abort(current_tag);
+-            if (current_req) {
++            if (current_req && current_req->req) {
+                 scsi_req_cancel(current_req->req);
++                current_req->req = NULL;
+             }
+             lsi_disconnect(s);
+             break;
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
new file mode 100644
index 0000000000..12f5a602da
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
@@ -0,0 +1,52 @@
+From 8f2c2cb908758192d5ebc00605cbf0989b8a507c Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Mon, 11 Jul 2022 14:33:16 +0200
+Subject: [PATCH 3/3] scsi/lsi53c895a: really fix use-after-free in
+ lsi_do_msgout (CVE-2022-0216)
+
+Set current_req to NULL, not current_req->req, to prevent reusing a free'd
+buffer in case of repeated SCSI cancel requests.  Also apply the fix to
+CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
+the request.
+
+Thanks to Alexander Bulekov for providing a reproducer.
+
+Fixes: CVE-2022-0216
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [4367a20cc442c56b05611b4224de9a61908f9eac]
+CVE: CVE-2022-0216
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 8033cf050..fbe3fa3dd 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1031,7 +1031,7 @@ static void lsi_do_msgout(LSIState *s)
+             trace_lsi_do_msgout_abort(current_tag);
+             if (current_req && current_req->req) {
+                 scsi_req_cancel(current_req->req);
+-                current_req->req = NULL;
++                current_req = NULL;
+             }
+             lsi_disconnect(s);
+             break;
+@@ -1057,6 +1057,7 @@ static void lsi_do_msgout(LSIState *s)
+             /* clear the current I/O process */
+             if (s->current) {
+                 scsi_req_cancel(s->current->req);
++                current_req = NULL;
+             }
+ 
+             /* As the current implemented devices scsi_disk and scsi_generic
+-- 
+2.33.0
+
-- 
2.33.0


