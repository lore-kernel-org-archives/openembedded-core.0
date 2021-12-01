Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507A0C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 04:42:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.88082.1638333731375538949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 20:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n8j4gxxp;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79693712ef=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B14dgXB005361
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Dec 2021 04:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=LhAJGM1Vck1aDftSQ7yXaQr3OX/DazQSw+OtDC6fos0=;
 b=n8j4gxxpvi8DXSHzrjESWiMzvNwk5M4m/I5ApNgOEpuyuXWwj1D/Yd9d66UMy4eKi2WH
 9ezT3TjU94tIf+7AMRhYuEVmvc3sc1692Cc88tfogWedYgMRtPSPqHa+uZaSLUYzbzOK
 cetUDMTDTQHCAn8iVIh7b2T4K6MeOWUsI0My8i32P05kLcEOZPvU9kXo55Ot/fEk9Mo5
 3QUAyreJMHCIONU4I0qWULNOtKk36TkUUiKotAs/E9EowfkSM+hOvRvsoItlmsYJpmJL
 LZpgtTTbKQLs2JcYQ5By/rHTlaGN4B+XIS8hznf4Wf00m+TqWYGtLUglaPKpJaF7hgkH 4g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cnymg02qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 04:42:10 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1B14g9EZ013297
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Dec 2021 04:42:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cnymg02qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Dec 2021 04:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnEpzQX8GmezAAqH5hm1I5DJ03zxTLIPOFIoTCFhtHBm91aJ3ODMGodaCLEtRprqKg3a8hseTX/+eOSy54Anpyu82yzYS9MRts3XoaQp1B5avKEuJpJRip68NB7X7Cj+tVjSfb1erV/RM6bozTadFS3ymrO5FYbN3IO0qJFvAAezNYxjrqX2cGeuXe8EKjICv/75pAbbPEdsf1z4t8T5alqVhMJ9iAuqdmp+sEGbZo/e36rwW5Z5cpvv2guS8qih+69Pm2XvjGvyvwhL9I1xKCUoZoCPjDKaicWxtsWMBjVez64tTlK/ynemtzX76kCFcEXtRNBOxHQ9goerkX+tSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhAJGM1Vck1aDftSQ7yXaQr3OX/DazQSw+OtDC6fos0=;
 b=GYZutrlh8ujVc19eYzlC7xJsAsRPHDcyJlDGN9c28dEw66xrCo/Jaq9k8tOM8xaqSalfLfvLMkLJj0zJf20VTnJkOKie/lAJQsaOfrVzdgWIbC0ahb9t/hzp4+/QXhmc7jLoOx3oIr9kCa3pwEt0pKT7ImEiG4NYhUZ1mf522xfmYJ1CHOO5xHLPWP7BeHmJY3H2TUyIiAZFpBZVMSKn5xJ6To3ffRPX8iTvZFzJGDIsNRVp3wvGZnXbXbmIPm+QTdhS7EREXo/HXAyix3ixETgy3Or2f/uZynTOoOzllCO+Yx/JUOv+9nuuXycg6jYF1PuUQtXU3eagZHgvAXghEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 04:42:07 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::997d:91ed:f5d3:9293]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::997d:91ed:f5d3:9293%3]) with mapi id 15.20.4649.018; Wed, 1 Dec 2021
 04:42:07 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Linux Yocto <linux-yocto@lists.yoctoproject.org>
Subject: [PATCH] linux-yocto-dev: Make -dev kernel work for a fixed revision
Date: Wed,  1 Dec 2021 12:39:34 +0800
Message-Id: <20211201043934.3212357-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
Received: from pek-lpggp6.wrs.com (60.247.85.82) by
 HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 04:42:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dba0a6cf-6be6-4a07-01a6-08d9b484ee07
X-MS-TrafficTypeDiagnostic: SA0PR11MB4638:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB46389C7B5612B4E24EC0ECD1E2689@SA0PR11MB4638.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Ty9iNsk8kH4NKU/D4AgLKFNk93lYi7a3qCo6PlFCklDKmTvypZEKacn4a43R+TCVdE8RypAQnz04zL28BHZ6od78FdR0XtquPIGlx8LBjLJVJ00tt+XQQoA1aAgLXQqI1r6ztgNVz1O9kXBtHPKrKF9/3fi2ht3iS+1q9B5kKyRfZ6fw7Ob+TzBdkpQ+AsfQvyWk8NvOTLZ4wfnTbv4mc90nnbuByUv9ykTN7W713YtYJuJf/vcG2g684rkogERF156ao4Ua1FhmpWm8/UB1AYDEit1t2Zs+HzDFwf+Rxr+A0OQuZYo3GPV06FOv61MWjmKux7ZSp75bSUMaCAt6renlh+oCeT+CdsnXc9z9QYeOkhB8I0iDixowsQJGNKUYeL1ge30irBd0/+yR1LZ2YtfxYn9YQMU6/spHkWM/aUtOU7gKlmw7+HpsEzGTk/g2Ptwz7cyfeh4KUuHS0wa9Sii7Lh7pltaK4Luk+Ya5sOf9/asDl0srm14E/w5jklVA5U1DT49apbi3KtPldAip+U3qdxvIwXq+usDnzxQT3fftMI//HwSoFFeShHiMtCKcoSVhOtYMDSLhWB3LnmUZ9vmjiW3ZVbqyggt5gJmpD0M/mgrMfZsnxuTdKz3PqS6W7GLPQC+qGZxOVYvZGFVbAq7c1jms3VIuLbvLkcn+NokTtVza+QlpG6XLYl3FqqE1RZ0zYb2BXBKJneJ0JpOkA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(52116002)(8676002)(2906002)(6666004)(83380400001)(86362001)(1076003)(54906003)(316002)(2616005)(956004)(66946007)(186003)(66476007)(66556008)(38100700002)(6486002)(36756003)(6916009)(6512007)(8936002)(38350700002)(5660300002)(508600001)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jb1rEJUOW6d32LiHX2gC2MgUnrcN8bLjJNXP3ciGbPap6RTCt/+64f6rEv3G?=
 =?us-ascii?Q?5SlUSGt6cA4Op+ICr482sq3+z1vKcC36rHwI4JNRhNciATyuY82kOh3fGdm5?=
 =?us-ascii?Q?S33woIDKqJgZ4PEV5CAYdqUoouBZO+igwqAD2g9oveh4eYNyjJskKTRScZ2T?=
 =?us-ascii?Q?yhv8hA+SEW9HmfaOGIb6J5nRiQZDbZK0JpyobEcfqJTDQ2miinN5t8dI90eh?=
 =?us-ascii?Q?H7LbRrV9kU0P3BGCo+Xng6Um9dM6p4l1hNl0F9QXJ8ATYkkOXDUOW89ALUF1?=
 =?us-ascii?Q?t9jfIAXEAmndA3lczuNMLi3jkrhPZsLohcuMuhT8zzIdVMc80M2K2BZNKETx?=
 =?us-ascii?Q?7WWSEQ4IHvhzb91Bkwnkt2zBkFQ+7Y9daBU3vYcxxLIk59lkh21lKzgfVPR7?=
 =?us-ascii?Q?Mh8iCwSxCBtIY38GJpJDfMjxKnJT8HW2ct82iau8HUj+XxXhaX3WOl3KRPtS?=
 =?us-ascii?Q?zzPxR5tzOmQGdOm+qEeUypswuVgCmvoKkWNfzKbwXUVgwngg8OLgvjvJZ8Sh?=
 =?us-ascii?Q?miLRmrl6HIQ2vT5NHf52WvnYTMW2Ro/zDuWWiWLYCZ2nZRzKPC5sBrc1sajC?=
 =?us-ascii?Q?keuYXGbJEZ4GTENl809foBW+xgBU5RWAB2a85kGblUumgxZrImAUW1UaM1D3?=
 =?us-ascii?Q?RLxSRasmi1Lk9a4Zxav3FqBxEF/AFLsdKo0PljOIZFV70Syfg+466W1f2ui1?=
 =?us-ascii?Q?L/CWqcLSqKU4fX/cBcDoyiZP1Gyg+dndXyRQtopGXqbdszyhHvtrFesXO/9E?=
 =?us-ascii?Q?eCPNBymYmt5c/aB9ZWXjFgFmmYUM1CGJ6Febr2lnGtdGtwF6cO5xipOeRcyh?=
 =?us-ascii?Q?sU0orrAqDEkKgD2yChhUp3mPFS92n7UKDSHpfZN743G5Jxepn8NOZEJcD6t5?=
 =?us-ascii?Q?4uslp62q1HqI1hy+rptvtzvoajze5XuGwR1x5/3BtaACf/JWwmmfdXmYazHb?=
 =?us-ascii?Q?v1X+ZyrKIb3BBLwlub58620Vy9nWTsTWATDgRXH+v2mlbBzjobqoHB71/dqr?=
 =?us-ascii?Q?S0zcytDEvb49ahuT0TbsImn26JLpdp45Lu84N2Mws0qDneweHhz0J4WuWA7x?=
 =?us-ascii?Q?wJNv2H/x9CG43Vxl2aV/l97fJPgOnuTjwkSHR9Cv6W0OGoKFZmFZcPrbtiW0?=
 =?us-ascii?Q?xs+ognwT0PGd9FJY0+tB1sv2hNeTu29CksUDWSTrU5rVE5oIM8mWd5gEPh1n?=
 =?us-ascii?Q?IgfR1/ePpPuRHGl7GVLt04dCZt5mhw2GR3YA7jov6qxR2VYLCO7c3KSyOlpU?=
 =?us-ascii?Q?wyHn4iXNjSxGmlh6WJ6SMh2xtDwZAENKUOoZoyZeeoYIX9yPr3jyhVsDwAoe?=
 =?us-ascii?Q?eMyjxLoTcLh1DyiPkBmbskgaMeYLc1nEUTsS6kXaIo37g4pdP8ydIiLXCXiF?=
 =?us-ascii?Q?Prm5h79zXZJ07zUUATmDLl9I4+Wz6HEJvqryEzmI27RF0UEGGWcrXrn3sNXs?=
 =?us-ascii?Q?LjM4Uq+lMF/GGMGd+UAB3DzsmRoMCydMs7bhfiRz/UbBzbSLSdUiXvuCX71P?=
 =?us-ascii?Q?IayzvOAxKn3lld7juyXlDuGN47Sylx7ISBvOM6YlmI1CaAkRLAqKghQylPSy?=
 =?us-ascii?Q?JrPCFW7YwfovXpUlLXHaw9F/qzzACYu2oO3/Zv9ngeoLfeBIjFcsrBB6ptiE?=
 =?us-ascii?Q?wS6OINESNJBQ2YWAxdQ6Xf0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dba0a6cf-6be6-4a07-01a6-08d9b484ee07
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 04:42:07.4124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v1ya+mCY07MG+Fv46HTfkCaqdaV6iR7909K0qXtajLpGWQCBZMFq0cOHrQbVYaYklfn8N6MHW9a9+uFECYsylw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
X-Proofpoint-GUID: J4CMmCyO2-U9STuJGNXvKJFfLrwSndIU
X-Proofpoint-ORIG-GUID: c3dMk8ZKpK889eYpuko9jiYHc2iAGJP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112010025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 04:42:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159002

By default the -dev kernel uses the "AUTOREV" to pull in the branch
head as the revision. Some of our BSPs are based on the -dev kernel and
we choose to nail down the kernel to a specific revision when releasing
our product by using some setting like below:
  PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
  SRCREV_machine:pn-linux-yocto-dev = "6fb48ae18a10770702266dd1f1aa500149e361ec"
  KBRANCH:pn-linux-yocto-dev = "standard/x86"
  LINUX_VERSION = "5.15"

Since all the standard/* branches will be rebased after each kernel
version bump, we would get bitbake fetch failure due to that specific
commit is not reachable in the new version branch. This kind of issue
can be fixed by setting the "nobranch" parameter in the SRC_URI because
it will cause the fetcher to skip the SHA validation for the branch.
And this also won't cause other side effect because all the branches
will be created in the do_kernel_checkout() and the current branch will
be reset to the reversion we want in do_validate_branches().

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 6b6ea9a7e864..7204c3eddc11 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -19,7 +19,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 KBRANCH = "standard/base"
 KMETA = "kernel-meta"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
+# Set nobranch to skip the SHA validation for branch if a fixed revesion is used
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;nobranch=1 \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
-- 
2.31.1


