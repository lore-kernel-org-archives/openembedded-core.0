Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6A1EB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 21:46:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4828.1687816006281395437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 14:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nydBPr11;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5541c98b54=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35QLTlRL004305
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=iidIinHjKHQZ3ERBde
	JV2FLjns8IjBPVrS1jdG5Hzig=; b=nydBPr11mwLAIB7XzO5FFjIWUPD3/AXd/E
	3JJBW4XWkg50HceKuquvzYlBFmrBC3fiVS6RqueVNlhPnZ/4uGD89JxjN2A/K+FK
	Fm1jD5P6W3W2a62ON8DNj4sMgGj577kYQxdcaNXLA5C9IUaemiePAmWyed0LCAMj
	+Pw7u6RqYPnvpwDIVspY1bKA2SjsyOpA0e9llThWitpgATLqpxoycBOHQRlkQeOQ
	+3Mu6c1ZZwTjeHv90kRDAYG8xdBmL1Y2acNe4C5cZTlTuWLXWPvNHFdC7jb9HqMH
	pI+Xtlgg6PJMO9bie/nhhQfj6eQZ5TnupmWrWNvUAXgWpp4K4Vtg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4a5et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:46:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8IWdxn9JxiGW59vkFT6uxIX8P4f17D/QAisdQbLgl1M2TmvBKTpLc4mYdXgy6mKMxNKzGrcPzyx3+SC3eCYhyt5dW+39x0uQK3X2tFLLnvKYfyjRMrTEadSTux4X3Ux8rnOIvjITlWnmg3IMDAUX5yyhafemap/2gj6I1t5dgJqboIcjLAW0LS3YhRss4qlRnXf/WjparwCwoiBHzrH/uNkcTHr8nilc5pRPK0jBVjfy4HWx7jN8avpQCqfOQsqBSIyRKOretQG9xEU60fpmD1K5CGRvwmm+W0DsXczMG8zlPd538fQxGVfqRD2lT6OUrK62ZH8fsCQ8piWzV0WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iidIinHjKHQZ3ERBdeJV2FLjns8IjBPVrS1jdG5Hzig=;
 b=cUOKZzr0N2bUlf3mmZ6Ux3Ngk3qgmj3UE1PSrl+K1p4Zb+70vtLvlYWiZsYI0y04ICIbIgXCFGW9rUOtNdcZaf5SvernbB5X/xZ0KuE14XmXVnCdW1HW1+3gAL0zlCcLvq1e9EOzeUVx+N7Y9YTmMR9DnYyLuOjSKplMdGz6rTHfot/+sRI0lY9Z93Tf1BgAFqYGhV3WTqDO49fu9j9k1cvLfq+Tw73VzCR8Mn10hhNVAz+dr2DD3aSfIIEVFJQ4ewxB4XgwrIVmrtEZOF0tyIdKxILeJnSpplqwjtwT1LQtvQF/FUGLOWLz8ii3M2JrxK1RIuCUZ30DWvsvA6n0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21; Mon, 26 Jun 2023 21:46:41 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 21:46:41 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
Date: Mon, 26 Jun 2023 17:46:20 -0400
Message-Id: <20230626214620.121199-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0063.namprd19.prod.outlook.com
 (2603:10b6:208:19b::40) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebb6493-26d5-4389-b828-08db768ed375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a+KPdHBclqMPmFvAd9rnrQcHcOqZJV8a7Rh+tEI0lonXEfYJRCN0Qe2MoFpv0VIfyAOY6nQGArOfC740FvgCX5/Q0ZcjnOeVlSMKVZsvXanDJkcFeHXoC0ib6kWfU8fcTsW2Qe+6TFiQKyWDWjD2xLSd/zF8keaqe01ex52DPY9dD8In3vcNlVKzE6L1PW7KQV8CPXfCy0egn5JrbSFJQyhLykTq3dW1T24D6kAcXNuRtxXro+5DWY0FlRyHRfqW9wLfLrzteZ/GF/JNELww10cfPgWZal/A5ia2XZ48ItzZ2Rd83MObLkQYD6RsQFzIgZaydaAxHGPv5LnYCDjZ+cH3SIO00gXh26zysRQlY+jRZehn5ICcO5KizjkTBXthhhVaxsUDsOgHUkax4dv9nUlKGTQeX2gyw/UcMVquZFqGiTwt5CmxkcqHWzelALjq7DhwuPqEMcdVskymUJXqRWLfDCBQ56SG5wHS+Gfw1kt+0EjEAN1rbCEKZhb231SPznIzfdkgr3tbJp0dfz9MbBafNHmMRB53QpdIhp2TSn5IPUSPRUpeJbppFjEiDnSYJ2+jtmuQouRcAP+ku8tc9x9ZzU3HZSFUyN0LuUjrMAA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199021)(83380400001)(316002)(8936002)(6486002)(6666004)(52116002)(8676002)(41300700001)(36756003)(86362001)(38100700002)(38350700002)(44832011)(2616005)(5660300002)(66946007)(66556008)(66476007)(6916009)(2906002)(478600001)(26005)(6512007)(186003)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z3t5fNV3nG7STJ5RQn0q/sIPu/7hAzmKNGiSrYq4krJ3orCwx1XVLNjHn5If?=
 =?us-ascii?Q?H++CclD9xr2iGrRYG6Z5z6ArYyrbr0fAyowh8CTU1Hlp8xxgmj1C8wUgR54/?=
 =?us-ascii?Q?69PsPTPZkxTMCHj9mxZ5xmRLLvxW0GU6k/Yrfg205cwCWCr0sf1oJW049lYN?=
 =?us-ascii?Q?FH3K4Ec+XOvJX0TK7SS1MM5R1hzu35i0iptapRoQbKi8eoqKXV7GJg9sBWY5?=
 =?us-ascii?Q?zEbK+7GNpv1roUAcqXQ5i0/AvDyyetqEgWoR79peoZaCwJjHJxkqjQ3BI3PW?=
 =?us-ascii?Q?RbtjH4b//vWwpS+SRP0geCLSQCmBmBmqMsUCV1q762gRYi0t0yY7S60o5npg?=
 =?us-ascii?Q?UMhSvLr1OiFT3oS6aTkuhzmRA+p3clBWDyyLJiFxSnNRB9XO7qX6IyIpIXym?=
 =?us-ascii?Q?zlXMfmE2yuhVoK728dY0N4oxwjKeuJmFHWEC60W0A2KvTF/lPNnm8RIPHn02?=
 =?us-ascii?Q?WDsM9OLzhFiCYWA3yWMHDgjXNT144pxHHMc06nW/H1H2mQFpztI4weAc8uqd?=
 =?us-ascii?Q?VWge2+9eTp6q38AO51fAHtVMvS1HraHlMkrDIAPau5uOWS48NudPJn9kLcw3?=
 =?us-ascii?Q?yytmuujBmx+ytXg1Ui0EnMnDQBYHn+ivj52i26Zo2olBXqly/Pvm3ia2Qj4W?=
 =?us-ascii?Q?NrJbx1sgu7OIPi7DCER+yMcRjjVGSWxI1jaEAiteMcOqiIcnT/AAVSR/5K1X?=
 =?us-ascii?Q?xUiNCoI9jmPokXns+nLbSTzr3ps3kUylUxR7F7c16cwfVYmzKEdBYLlVtDxm?=
 =?us-ascii?Q?lcJDzhg91efs8UdtwYHafY3fZKOIZ9l5Bq7+BF+iw4dQtzrMCifcX00+W3ff?=
 =?us-ascii?Q?xHSOV7F9te7tzE7GCtRj6rKTo02MvBD7+CTwjivlhyxmGkHApgcZRMBuulAo?=
 =?us-ascii?Q?oOSwzxf4UqufZEb6KFtynD43elNjA1MWwGtPYFQY6meZV5P7ns0UvUufhpPN?=
 =?us-ascii?Q?QvqmS2bnbZLW8dBDNsIKtUZN/o5/9wQ0mGtoPxDiTT8AjCBtO9p9TAMBoUEM?=
 =?us-ascii?Q?vl8Uhppq3NyVj7nOe1mSQ2epvEblEUeKnti6jyvIgVgVdoHbfrqbD+1tQZVY?=
 =?us-ascii?Q?mb1Z19aY6Jn9ODyMklDILUkU14zM9kyrC+OerL0ADLZ2yqdx43aLEMtmhop9?=
 =?us-ascii?Q?r+ffBlrmXco7BRY65vYEzSKNNLL0DNqthb9Rfu3iVV/C/KUDXeR1tDZNj5lx?=
 =?us-ascii?Q?tylCVfr2BBRdDb0SXKtnlsM+DmIMtCn30xPnmjYG7SqkQCcJl/HZq5ApOPWF?=
 =?us-ascii?Q?oP5rIU3hhpxMHyaCMBBWemPSP6M9l6t9y4SIzwpP+LKdHezFNAq/7j8xhhrx?=
 =?us-ascii?Q?FqecNGSQ+cVrJE4CI1p6djl/rpLrWG+4qeBVJ/d8rM1tJAhSQK5fXS+CwjY4?=
 =?us-ascii?Q?WnXTgwYtJJ9QZaGl9Vw4Jpuf1x8bNQdzhe4GPZeXvmHCmGU+dcG1m2iBZjIG?=
 =?us-ascii?Q?HPiPPiBbrkoh6b6xMoK99aUvmBpHDYJuWjYJHWfhlD0yKFEce21K+L7erW7W?=
 =?us-ascii?Q?kha89gcAc0Em6QuBbOPPnJ7NDiofpNgdJhHs8hNvMbK4ot6vXHzcoCUDCDPL?=
 =?us-ascii?Q?qHloXMDekkSlPCCHWyNoMIhD80wzZuVTkG79KdPEAA6UhMge1lxHh3ENEmVE?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebb6493-26d5-4389-b828-08db768ed375
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 21:46:40.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mf3p9V3l5oW7KBnPcSe/D24Wr/Mg3HPkD6bEW0Wd3wgZkIIEPP3M/zL7RnoipaIzzl905UU14fSNLUciX97zEFhGm4GR51Cvd37Ou46qifY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-Proofpoint-ORIG-GUID: T-sDfk343YFAwr75wtc01aSVzs8ppElH
X-Proofpoint-GUID: T-sDfk343YFAwr75wtc01aSVzs8ppElH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_18,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1011 mlxlogscore=498 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183431

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..a3b8a98589
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From b8d9618cbbec5a04cf6dede0a6ceda41021b92ae Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 26 Jun 2023 17:34:01 -0400
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
index d0eeba3208..288784236a 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https \
+           file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


