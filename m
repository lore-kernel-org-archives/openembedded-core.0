Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBACAEEB57D
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 10:02:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44344.1726135309966967638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 03:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9985bb68a1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C5fJDj018399
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 03:01:49 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44drqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 03:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDCHaKKvX6we37vJ5FdkNBHX/C2yrgf2ZOO7zAIdjCx49+UdGhuYdjRg+uGI16yDkJKMIOssy5SqSoD8oDncg9KTCE5Rd72W/oHzr1/z31khxWSnRkRvp8J5a9qSZFa8+rFJwy4j9EE6435zF3G+zdmxrCRWOxsh+hl8wAkx2P+vbAPR6cfyNZwbuEvHenpEuCAE7nPnMtImu7nJZeI/iSzcbSD9ozefOReRaDfeYPB6y+8LIs0wId5k53YQQo9nztoQs7zFRhQZ510uA3qBudPV/dMXAorQwJcQt5ggyRscYZ2HI9aezuwlfjKqiBU70vuG/6pHbgFQhbn7VZowAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gARhTAEG+8s9jlQhaUCCJMEKn+dB71LDZD6pqI23ZjQ=;
 b=sq9SQoT8cHh55c6YHHjz/oBEThnTgZq+mNZ5wsQ7gDC/preZUEiIBoypgzAMk6pqXa8Bws8vISzFmeCJ+Ko7VL6NcJEGyC52ibTxH1sZi8m1cywiSzjkwvHAQmuBoIP3Ke+S+7MfD2CBlhEP35Ly3R98RRw+HzzJ14o++w5/1Q9MvbMzN8IgY+jmn7RZfjJueth78A9XkF0+ugz78L3QkA8Q3MUJshGDPYDAYfHzQ1PSV3K2whQSr5gwFXPVME0PrDM+e3tGUZDAdy6r3S+RhDa8NVgB/8CbQY0QcrQsDkJS5BURngq1notOinx12Y5b6tr2OmcYY1NLTTukR4Hphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 10:01:44 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 10:01:44 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH] bpftool: Add support for riscv64
Date: Thu, 12 Sep 2024 03:01:30 -0700
Message-ID: <20240912100130.1620229-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 4118854e-2cc4-4f17-4f81-08dcd311e823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nJTkyrTc/nzx3jAc4Q8iYi/DPXOptluIDVk4rfjjSTIa1md/VuPk4SUNtk2j?=
 =?us-ascii?Q?4HYFH4OvYZnvuGHQsvG5Ympi7RfSdXMgybQMC3JfEV0QGTUVKHlrAvS8tm7y?=
 =?us-ascii?Q?yle00LBn9jTQXJ6KbrklVxCDXz3jlXba4KM/JO/FaogzWYNfT6bwsKeDwdYA?=
 =?us-ascii?Q?bxaL+y9XZ2ewqm6UUTT4mRCyPZCCja+GBFf3sL3TU6loa8YGLkYKx4ZSlEGS?=
 =?us-ascii?Q?9NugFkgx+g38vLEhTCoqw9/rdb7jSB0tYhHIb9XtfwYtxh4c4FEUy4+s9EiO?=
 =?us-ascii?Q?o2v9hMtXXUvqHnYxbMcADaV4UNUM8MwMlxuzr8r7xcIZeudHA/QYaVJjHxjB?=
 =?us-ascii?Q?IMuB8VYxGBx0L67dxdCnqt9rvHmH/Wgi7XrEqtd4Jz668tBy+A6HbHqaEZyn?=
 =?us-ascii?Q?nxsnbRwR3P3kDenBEM9Qmrn2EEFdd5XpN9KBuRe1XUkCPJAqKt6HBEFTvWB+?=
 =?us-ascii?Q?3CIFz+/dZwOi9hVBhWyjYd/G7CkSNtNpGpWT+poQMEREKvvDzrtFcnfyHEZG?=
 =?us-ascii?Q?0pVW8mtYxTKJlsNnnSWcshQZ/37ZvBQNMv3QWzR0QMvgneMwtXDyJ5+TnFXi?=
 =?us-ascii?Q?qxj+94TFL8yD7HzYtvJ2ue9sHavYmw9yC2NM3Iys3ku2EWztL9SD/tF+9F4w?=
 =?us-ascii?Q?+fIrfNLf9B95iaoE2O+GHMGb7Ek2sZqRMf4ptIEKlNDtMIR80kjlVmMadVnp?=
 =?us-ascii?Q?C0u8WcDSKJ+K9KzP5qydJgSyD8rz2a2twLEimnX9yH2tJt5f516pp5VhKuUH?=
 =?us-ascii?Q?IkzhKEw5aIEge4Vd+btOWU7YUkQ0WYv5ID7J3XEDCNlOvbkNmZoBx3miSjcg?=
 =?us-ascii?Q?Kc5RYhy3FgZSOFDFh42rSMUd8SRZr8GkytfoRuQjTAJ3GUOQUEzMffTjW4YG?=
 =?us-ascii?Q?NuwUBXJ38/TorJPU5l2QmgwGWu6e0GFZODuY20093Thf+mD+PoMfu7iIgv8J?=
 =?us-ascii?Q?BJUvK0jTw4icewROO5Ltt0aDE4XXbCdFBOJTtbHBezXgx12coc7vMoqd1oc/?=
 =?us-ascii?Q?DZ6TSXcbAOdLdlP6JK8EvanJDluOxQTthnjmJt/PlE2yOwhmOcDQg1o9Y2+9?=
 =?us-ascii?Q?S7BUmz18pTrPHLFGr2KlaakjvhIHpra/y7utITjs1f0rvnNBOBsmFb8IS7PY?=
 =?us-ascii?Q?1QocbWXhWnGqZn3BTtjbXZRDOVOg/QjgnR9QJbzc+RR1Gz/OMLJO8x2zLqRR?=
 =?us-ascii?Q?eu3KoD20FS/vhsEz5qdQyutlm3z52GvmQ/dkXvaNv7kmCU6e9xC7B+fS1Kdr?=
 =?us-ascii?Q?A9BxeDtowpdzilXtgPadNYBLiRyUJQB+tNWmj0tpEuJ2TcjCnUgBBNMHS/li?=
 =?us-ascii?Q?0SrZf3W7HDgJYddHnlZHIA6QYknBXyRy3cYKJt/1jVCRCQpxmL/E1MQuDWsW?=
 =?us-ascii?Q?Q1jBNoRd47bAO/Q4K267QJRAQlVOqzAY8FCPh2owj4wR7OTgwQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6ydMW/iQe9TLPAAY9RxEdmGq3muVwvhnk1Stz+32lOE0V8wLjaC7DZjYXABB?=
 =?us-ascii?Q?KLFDy0nCay+EKCvva6ffXYwFHePlhH0mG6KJpte0Jg3tXvt4dJvBS2ttc/cS?=
 =?us-ascii?Q?wIuFhCTvG0r5dgm7Z6b3bzoeaS81UUDRCTYmAxSQ8e+wzm/bySVfNj3bR0Z1?=
 =?us-ascii?Q?WYOhQgd692KK8S9THM5+RrfFh5001pFGF32Ys18JVjgpejercBo6Ig5DF/Gy?=
 =?us-ascii?Q?N+/NvXMTM4kbwBbognjQQTf4vpkk/712JckpkcCn/w5m0mUQqLuf2ugcDdUN?=
 =?us-ascii?Q?QL2P1ESLv7qZV/ToU8QuwDH9LK44Cql0Rs4hWNxhMdzim6TiTxxN6PUb0FdI?=
 =?us-ascii?Q?K7UHECwLNd/YkB4DvRPVq4Mh+vTBGXY+rRkMY/jYN+z/3dkMDpIgAkYUl42z?=
 =?us-ascii?Q?JVbG/QTkjjPoFCyol1kD0QWuJ13aP2H6Q9Ql5pgDJU9czDw0zxbifb4QR4/t?=
 =?us-ascii?Q?RFWzOvWXGMCEv27dGu2NI8N2/na9LkHKvSbTAhb4C48XwyeoPChjN879EWMk?=
 =?us-ascii?Q?p/m9+csk6gVXAjwmPZKWae7mdSDf0EfjytWFFvcWc16wOUE8CS0bsR/VCUXe?=
 =?us-ascii?Q?tY3hlZ1JLWdiCvqLgHwlhPwin4oePQvkCH5GaGtnmCqGH0KMPzAs+54UCMzw?=
 =?us-ascii?Q?VQN7iz7xQTGLI65aJpyA7m6oOtWMyfq15hLnEdqJITXiS3uCEXc47dU23C+i?=
 =?us-ascii?Q?DnfjplLAN5Ar7MADfP+TR6ScoxJ16oJJqsZs8o7EMjEtJG8CGTYN4Yf6Kw6j?=
 =?us-ascii?Q?Aonb1Ep3plwrArvzTO2fwGpgYDT17i6dwC7xu4JaPrXxTAlMBNk1ei0RR34E?=
 =?us-ascii?Q?M9Kpl8Mn9jIDwvj9iLQ96LT1inYKxRRBWxkziLP13xvSSuyV+R+TVVVQqMeb?=
 =?us-ascii?Q?94p/pEVr64IWHUpgMyir9MPKgX+7UxV9S6suDQIZws1kQOrtSvQfyuENwRd6?=
 =?us-ascii?Q?R3XOor/HU9Rqq0HtDju/1y+YZ7kuqyLMIY1gnRI26v+B9+6gQiZk+f6ULx5U?=
 =?us-ascii?Q?fV0XMm069bn075227AacIbDlb/L3IuFUK7+a5a7nmwSkUnmSKD0KxiyGfhOS?=
 =?us-ascii?Q?Z3GdKwTf8lo0IYiLHSn+aZsl+ytGKqVDJFBk7fFSaaazz4WH2icGGcJoZ8PX?=
 =?us-ascii?Q?eThqgJKlPJ5r/xdLsEOHlz8LDKcpSngQX9FE4IRVyPOGaNddmoqRCaeJatbN?=
 =?us-ascii?Q?RfTjioIisycIjFoCAe24rPSv6wzXiADTQZ+ydmtUL5Na7mGKsqp+fioNvj5d?=
 =?us-ascii?Q?X1yn8PDPeqhFTSErR7EO8RpC4BD0+IZcX9UHk/qaZtIP/Y+BekYXB58SDgkl?=
 =?us-ascii?Q?cvuT6ip9Y3sekFos4xFGW2+RkkimkRIyCeKRySoheSI8DDVUAMw2vTCEltnC?=
 =?us-ascii?Q?5wfiQ4R8pRbyCqiSJQaxnObDF1rV1+DRuNpZUKsIIa/NibGJ2D9+lO+zrVDI?=
 =?us-ascii?Q?iM/t7iNPNkGLIEXKWMlP8M89uuzgxT59r5S1zZQ/ivk2Djz0jqOw2OBcj/GX?=
 =?us-ascii?Q?gV8AF5O+lzfM0dk7ZeUxOot6F5StBsK0UiqlMZUiY0ZcVDqcCyKHU4avKZnf?=
 =?us-ascii?Q?EpNNnG0AoIJ3l2AsQ2L+JBfB6W4sQV0QcUkQtjHQB5w5tNrtFMMFZM5sw3qT?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4118854e-2cc4-4f17-4f81-08dcd311e823
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 10:01:44.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLNVQ7Xqe1KtJIVKJwI9gz36zfA9xKs/zOXkdqzWkXuoZkTRuDDcizvGlOp4H5HIcsUUsBCShuJxa3uo7ArvgvKb56wBAKHUENvT0+uCl9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
X-Proofpoint-GUID: 4tSNSTQ-jc7_l7WlUT59GcL4pe15G0o7
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e2bc0d cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=UTGy41UV_SZnT839eVoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4tSNSTQ-jc7_l7WlUT59GcL4pe15G0o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=823 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204439

From: Harish Sadineni <Harish.Sadineni@windriver.com>

bpftool is supported for riscv64 and tested on qemuriscv64.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index b22334fe9..8bddde945 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -26,7 +26,7 @@ SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
+COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"
 COMPATIBLE_HOST:libc-musl = 'null'
 
 do_compile() {
-- 
2.43.0


