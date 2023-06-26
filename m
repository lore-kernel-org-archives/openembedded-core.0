Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C15AEB64D9
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 22:01:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5220.1687816913540760779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 15:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LQhxwDUZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5541c98b54=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35QI0aNK002091
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 15:01:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=IcSD7E5AaY0092xS6E
	mJcvqtZR0C3lQj4QjeSWc9Bd8=; b=LQhxwDUZVT1kWCquRAF0Obz9hvPtrACF+i
	97aWemmzFX/p6DDBoDaxHI+8X4GYrL7Cr4eNdsduf6byDELJobxvPDmQSGb12Oyg
	4RjYNX4uCZAxY6UiDEUdrTfjH3zdoHhTq1/6qBGklGSdeL6a9jnuyt2yikEWRclB
	CGlRdymYNddEf+Ic5EJzEFEiwH1/BH+rmYfyq25uz30K/ZhsJ5w9jscZhgtonM7X
	0V+/WMXF306Vuj93XpW//XJ25iA0+B9Tyrkx1IO20ubAeFPw8DpArxeXJHEBX2sW
	GioQxqZcNgczEd3FUN42VqPTjcmRJIQORQERYnU3BDgAS1nXT0PA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb1cj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 15:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkZK8UiRv5OcIz5abwTjZag6wb7glVGcfDNDHgHRFACxz0eCuIfxJker+L0t4FgbFT8G5T3NOqEjsYdlK+2cDdrU0dzn4Z+Y5nnLrL0I4YiSPAcIY9F4LaOL4kiD3UUQ9sgnlR/toYrW6EPaXwXc8j2U0iUhMZlH5yLGYEUsMpc/oTQjukeaKbJnSC7P7R6J37/O8ME2turb/jxjOjb4fD+uc64E8Ayixn27Yy6emY7Ey4q8Tx7tDG8WjwRJZppefAwzSHxnZmW68CsjGHNVLh+XpenynNHDJc75URMsBR19s8JrT1fSOrAX9OPhAhGxxR+UtLZB4g8bDzMS0Mvx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcSD7E5AaY0092xS6EmJcvqtZR0C3lQj4QjeSWc9Bd8=;
 b=Fn8yeVR4JbDO/LV639jSJSF118rpf6Ps3tUM8hN5vSiJIQrTaVbL+3pEDYz8oGvCQxSAZ+d36e9R/LGfiEs6xPDi0SYwOjlfeeDMVs5xY84dZ9BtY95T9NOGbdbhAGM2njWyVECKQCgG8zGuolhGIKJ+tDergdAQANZTelauYP+ngLe8gxZnTqdP1xr5lxPHhWvINe0GyRomMYOS8xKKu1YWdu+ZYPQUF8SwH1zj7apE99QijdtEhSKLAtPSvPiT8A5GjlKckQLUzuGyITX/KdiohhnN9hx0vVSYe6RvTPVJyql+Je+cj+JoOkedzTYEBOOd9kRM1qBviuhCNaE0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 22:01:50 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 22:01:50 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] blktrace: ask for python3 specifically
Date: Mon, 26 Jun 2023 18:01:34 -0400
Message-Id: <20230626220134.160682-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::25) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|SN7PR11MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afbf566-f1ca-4cf3-a7f1-08db7690f15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4DyRYaoKBTyD+OfrLbh1icUE9OUkbY6IXF11egthAB2ADVqLmANMRHryKxJbOBCeqHBFI5qaPle+MDY9opLqJvQHvTzETnijca7p6YxxfOCNgAoWcfuyusbrvVX8k/u4GomC01j8Vg1wgwsJF6+HC4kZct4fb6DoxvOn2nsusZJnAZZEzZUGFhHfE2qU6J/yASc46BUyChrBNpb1oijkIfNf+QHYLL/91BHlCwCxeC3vq0zZ6krTWrJEC2alx7gIb6FLNODb+1PMse24oCqeJheNFqNRg50XzrjbepGaEIQKFZ+3SZryJZI4STn7NkoCRrvHmJzIVnXUMTTNBidyOQqTmuAReoF/nH4ALAVRGmTS1lESLZ0VT+oWgn0fvfuru304BvMl5jDCuuTZUcoNJqRyChM20IGw72FCXbFu9ONT11lDtGcFwkxxlo8d3k2MqzShv2MB6ucl+XB8WX0ZVhfYLdA4NKGicXOA6qbhy41FmguhtqpMCgUCpipcv7/iAIAA1RnnFTLiub+HxZtV+kmvZ6x9voz/wx8axjshT/W8mUHsWZMs0guzaYQYhV8D33GMj6BjManQxhkITLuYsRSJDlz1Eyz0oRxdpKH5xVg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(451199021)(2906002)(6486002)(52116002)(6666004)(2616005)(38100700002)(38350700002)(83380400001)(6506007)(186003)(41300700001)(26005)(86362001)(478600001)(316002)(66556008)(8936002)(6916009)(66476007)(66946007)(36756003)(1076003)(6512007)(5660300002)(8676002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iYhhPMo+7347qPKOzNE4sMGCAG9K9er6dG+SBEosivPjOU0k8zefHPST8UN1?=
 =?us-ascii?Q?Ot3SKGvhi8yguB++4gnqHRR1893m6P0VNEEKjoNcT+pwth/i2U3X/2sCJ7L5?=
 =?us-ascii?Q?pgJW2ZKIDxzgWGHCQ/7JNlNhiayN0fw9roaoq98cM/RSt7HigEiMgP/6X5Uh?=
 =?us-ascii?Q?pm5BCrHIaJuGIMEW9e/546BNwQ+mOYe0Fxp/fTDanc/2HuERRxwjYJfbQkD+?=
 =?us-ascii?Q?qTXtGybUU2Jn9bKttiDIvkleOXG1o5YpeAs4WsDqSWFHFpW6OLKLUXVPOpX2?=
 =?us-ascii?Q?CKZnKq79GvUcgPuG4yGg7oihUkmsN/ZEs/7LMRVXq8ZyNO46hqagDCOFyLcr?=
 =?us-ascii?Q?WtQmdU9E7BcfgVHDo1iin4O+OiDbVcyt/5Qef/IKiY8uFGF7XsaG/gLEVwkG?=
 =?us-ascii?Q?Cll2M8vH8h2klCVvHK5G0L7aoFTjtAdlRkfxubmg9svLyGq50HCB1B6iYaCv?=
 =?us-ascii?Q?l1FRpP6PNHDRFxp0NGG5qm2Jm+zRhx9Hm/WKCOwWtXORGprvz2Ok3DcJJUE8?=
 =?us-ascii?Q?uB02D85ZvRcOZfZSBDr4p61OHftBJlw/aDoXiIfCUWw1hn86nlTFnaUfFHf2?=
 =?us-ascii?Q?r77TisIP2CdaHeEIQuKY2LLCgZrUa4f2UO/AElVFdRfveWii6rOSDvpAohYD?=
 =?us-ascii?Q?s9q8uYktdfNALKaVW+JsBWOJ6YDQpn1P7Qg6XeHWIMDQRGkA3zpBkpUmkxyQ?=
 =?us-ascii?Q?4wST01TX9hph4jHUNDiHCF2MHwq37z4+6B4zHUJ1Qd7bL4vEirn6xzipLSsh?=
 =?us-ascii?Q?j9qMA1pntkDK116A6qR3K5h+D5SO9spbuR23+0UXQ4chE0qDsigNoS3AUn3n?=
 =?us-ascii?Q?rqnyYRBd6d4WJLZodC9mLfmPj8XWuDG5JJs2GmsOcA7W2MzgR6lq77zzlIX8?=
 =?us-ascii?Q?An8HqorzIhATSMPcX19DRNryRehCMJ0UIIMx8/CGLiCH8TIiR27VUKvB3bjN?=
 =?us-ascii?Q?7adYOAEeZD9/+Fedbcg4144N9YzbP8ZDdrXEw67eVTC9m78y+e+DoWl1+09b?=
 =?us-ascii?Q?MomlVFI90z9iXd4/U2KuN2nmICCevTbClwQKlw+G+mwSiB7HVB4begWRrkcA?=
 =?us-ascii?Q?0x+/nb6tm18jdOjk44p8ar/sr4ceTFd8PMuw2t0I9lbDTjT9cow5IVCnS5em?=
 =?us-ascii?Q?VVUvqIHbiyeBTsYpuj2p67TZZVpm5SxW/EGd4fqbz7jYQloYH9xVpJV3lYSU?=
 =?us-ascii?Q?Q1cph8ZhQ+0/HsM/qHTsB50z8H1k2tCRXl5i4m8Y85QBtgNB+2n8PMkbQ/L8?=
 =?us-ascii?Q?6oTyiFNy4bkPFZ93TdeMZDYPtgXGLTYL1EUtIMWiwwH71ClzlJ2y3xOiFm2o?=
 =?us-ascii?Q?M6qwWrdkhcXm4clpY3T0YjvUq1Vmr3+PUrEhiQcP0/1beIS+WgCB/2iZ1paN?=
 =?us-ascii?Q?bNwtxHmW1UgDXeINuc1L2ZbOIPRYiCn5rGuMuS8GPUKtZzEvzVUhcxym4OJs?=
 =?us-ascii?Q?QbzE8IbSynLbfWyqHUuxLT4q6hnbyy/V6PiUPVHCXAGb7TIQmNTk2xg7cokD?=
 =?us-ascii?Q?PKFW5bBSjWLzFma+0j2Mmejy4LCEAZXIDkWiCWSaA+YAMF6Z7+Qc6FGviYWP?=
 =?us-ascii?Q?c/ziBLhOnVBETX+O4IN3CiVd39u3+Q8IRshMyXT9hF5Xu9zZKXPEpxpKxufR?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afbf566-f1ca-4cf3-a7f1-08db7690f15b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 22:01:50.1079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +15aUVOQO+BEv/MZi1V0Gj9EuoDiRadtJpRhoOBSnMEruvyI2zziQe+pouZclBPjd+JaAq9boBNbQvzfTqJa9+SRts72196Mj6rvwcH8ZY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
X-Proofpoint-GUID: RnnuVkfpJexoINey-MjFDSDAGQPrWgx1
X-Proofpoint-ORIG-GUID: RnnuVkfpJexoINey-MjFDSDAGQPrWgx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_18,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=449 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 22:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183433

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..e2305a1111
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From 6f4769e6e2c5cdc1262891470995e6dead937c7a Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 26 Jun 2023 17:57:36 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
+
+python2 is deprecated, use python3.
+
+Upstream-Status: Denied [https://www.spinics.net/lists/linux-btrace/msg01364.html]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ btt/bno_plot.py | 2 +-
+ btt/btt_plot.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index bba5e04504..1c0856be7b 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
+           file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


