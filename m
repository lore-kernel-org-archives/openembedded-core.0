Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBDCC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:41:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27837.1748263283962113085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 05:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7241dca39d=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9eaLD027534
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 12:41:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5391mqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 12:41:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=albsyPgcvpSO4hrttoXWu4/9WoFTqyciBph9s+nT9NSk/8//RNZbw3oQvKn8yTzFCF3dDtCQAuCI9VG56Ed/3mpQIIUpOQqv+KltEyZ24RC8PUhm2To18bxMQur0OXteDszc5WNbbU6m3g1a4+B2uWX71+Asn6ho6BqGIAQslaJsiusxTkdrfta514SRz4qsLaYTbDcwySXgNvv5V6cZQP8V9r1RXKMSxEHc4J4jJxxrkXIgy3Do0FTLg/HRIIT8UKhsaweF5rWtuDoDw2plq2UFvugwwwnTSZqcngNXAvP3yyIxXrv1PBCXWz9niTS54KoRLxb3w7d0RAMilTjrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx+ZBDbk0HhYDGKXEJW5WyA9r725fauGiFq4vl+p9wk=;
 b=X13xH0ttc+2n7blHTGCeGpwjOqgh+MK2wIlcpNF8DSI4NOhoyveXm9orNj5iokI6ps8e8b7WBjIQIxU8K+bsQX1UGWBcMBacINaaPAxsX5Fz9Yg8PMf69FUqYl2vquwXeL1bmJr8X5YcDDbs79EUCnPeO+DqAbVL20wj55W79oSKFFdOOGhM2mcWxdFJ6pAiCJS4ob0zgs8adIykqw17nMc7XdgToBQHTfaRk9Qu5sb1PaVdW8jy98ESyE3u7rZdTCBU9BYDPEdrzqmILRa0dva7mWkQKwpc8TiZRrgZtDNeZ3Akr7MRcn+2TmcbFu3BMrJxQz0qWxjecJFB4ex9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 26 May
 2025 12:41:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 12:41:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-1180
Date: Mon, 26 May 2025 05:40:51 -0700
Message-ID: <20250526124051.874542-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0013.namprd18.prod.outlook.com
 (2603:10b6:208:23c::18) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CO1PR11MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 023e13e4-dcb4-4c55-4a06-08dd9c529cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PQ729tu+gVITJ4zGy/Efptohm7mp8vnUUhCwsotTDorJPLK09JVFYG2elKCM?=
 =?us-ascii?Q?NSh2dRpH/XHBEuz9NWUPcdLc3i+J11ngP+l2X/L1LoM5uOM59tB57+NZJDEY?=
 =?us-ascii?Q?oIjCjMJyTlQsc2nmgSGsKqyEGli6ePAGj3Q/rxWlTfd3bmS1rRIqvE2eynjk?=
 =?us-ascii?Q?pPWMYupSXr6VC2YcbEb2rkThZkp1k2lK6lA9YlTMUt/PrdXt2oDvz/fMZKku?=
 =?us-ascii?Q?dyXG9quJfo348g1obOojSSl1Eb2GVmuJAictwBuxuuU1je52BWOqPmGiA8nW?=
 =?us-ascii?Q?h9SpZVf5groCXzN+uq+B5g7UUaFMbr0fq1N3P/0JtYDRC3T5dp5gMH4J1/KA?=
 =?us-ascii?Q?dv3VYI/vog7XJwpoh1R7BVg3fhXaOqqmS8mJ1dQCC+RZZoHoFr2l/SAg0z38?=
 =?us-ascii?Q?DJq3lNE+JyHyc+R+PChLNpp67pnN4nGENKgfRvBGbSM4jZrmzK2M94F9DqEn?=
 =?us-ascii?Q?/XJHjj1hf+ZfLDSgyiQ57vmntYYym4ssjniLzQnZIyiwnnbCbTcIoKhbtg71?=
 =?us-ascii?Q?77YiXCNzheyd00YL/7tmPlfd2WoIAyjUSbbXcRVoIah0Jgql1kwvy2NYeNZ2?=
 =?us-ascii?Q?ySrxriHSkTVVK/QKKpZWDf400SxXhJB5PETTLvXiOeNVVAH+bBF20apVSQnF?=
 =?us-ascii?Q?vJN/pI0F/cldRfCJoK+vN9Pw1P9c7MHFGjZx7HKMd3JKTMHil+DWz9QliTlQ?=
 =?us-ascii?Q?DujaBGn0MkMU/joNNJBcyLkWZ2Wf3jG66LPjYqX9zQrHpIfdxXzdDOvy9cAc?=
 =?us-ascii?Q?LzP3Pz/aefU0K3y18A53MQrs89TJQuBWAPaaoFD78HTGPNYbFuJwWD5fugxI?=
 =?us-ascii?Q?HRdzyEUKtxbx5jhEpSTjmG26FQQGamSZXbw6a7GHVT/PmqVkEdmnMlYs1IYX?=
 =?us-ascii?Q?h2AlwgBNtR6geHPCQoq310M9zBr/8YIqa9Me44lnRQWS+CHDhqj7qMa/vXyM?=
 =?us-ascii?Q?UJuFlZg2GS/JcH3JDYj30wTq++nhaVS/AT46Hos8RJupIghZQOJzHz76FfBv?=
 =?us-ascii?Q?Z8ECKfI66wQcVv6Vj9Gui/rCBkgimKrE957YlhdEez4UmIgQMsJeoplYRvXi?=
 =?us-ascii?Q?aboK0WZAfbLUQrRdYovBaEdObuJxxEdjmf6ochYP2k6dWfYNKCmkF4AHng92?=
 =?us-ascii?Q?x7Db9LQpKFg02u+oXxtQKFLf7Mdwc4C/8YfzMN/xusBIBAZKWOaWnIobUA5M?=
 =?us-ascii?Q?83N4hbpQLb9o+JXTNWxxQtAamAMHCCjHIi9PGRvpL0/rK1IEq+fZKOkZnqRk?=
 =?us-ascii?Q?c6YFl5xr8EzPNdLFuIG5/Ji9g7UfDJoDdtkPJLbsNtazOdxLXho2+pUjbizo?=
 =?us-ascii?Q?vmhcGjM3XsgsCUb5vYUsqK6CAw3zGi4zxrHUnj34EBjzjswaPE70pywC1j+U?=
 =?us-ascii?Q?8wo7r+J0Vz1Ymx0RndqX9g45+xCg8RezpVog2sHCWwGyc7xVyiMJl9oDmF64?=
 =?us-ascii?Q?AdrQq4MaxbG9fC5e6ZXjyAo2BJ5r2qbE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vKXz5EmErwY/TbJ+g4/YbK/NYf+ybcuKlS3SrIYKAeL9IArZsU9FpBWhZ8AH?=
 =?us-ascii?Q?/TLBti3gwg06boFkzpb6qFIQFnCag2EhrbvzXdYsQiHAIY3lvJng1Fq9AAC2?=
 =?us-ascii?Q?wDoxqC/vKoke8k8XWhCm2kZlVwE7CPNik1jT91b5zePhJ6YUB+JW5lcNqIcf?=
 =?us-ascii?Q?fnnqKJAykVcKkef0VG+IzuMH8jN0+9PNsunRALYJjiwVBgeduy28Uty4WJEv?=
 =?us-ascii?Q?8T/JYsmfGLCHY1YJd6hCeQZ5IjC3ofMZYHjqf0cWTxZX3tImQnz+mLQTHUvp?=
 =?us-ascii?Q?AyN2kxN+vtllQy6K9pxoG6d0Rj+7qDRJBNO/G7XKclKaX8Bu2P3G318oAll4?=
 =?us-ascii?Q?CRyQEZJqZSwnr+2NkT+/70GXj4m14RpinIxq8zbngAISC8RoXeYMrGPJUHLC?=
 =?us-ascii?Q?TPrZ6u72xwmYVXlNPNhU+HCzkldZnocJTy5f8Gi8S+8RK2iU950iPfdnGnEa?=
 =?us-ascii?Q?fK5fGp2R9d+D4ECttOy2wPyHU4jDMEUoPSDUg+JOYCSGNLIYafryVVg3vvmE?=
 =?us-ascii?Q?lM4Qsw9uIzebAa8ZrVTqfiDZQfDAMSWHhcEELbkYy7txMcQmAofsKZ9Ql62T?=
 =?us-ascii?Q?DCoVmq+Wc2ONEWQlA/9GIuUXbncuIdmT/0GWhpX6wg8+bjzBG2mcUgvUXVqR?=
 =?us-ascii?Q?8tQ51/bsplBMhWJ+nqDn+yxHhy2HjuhkSrzC/icu4pYUHn2kfXQkO1G6f4Re?=
 =?us-ascii?Q?T3c9pTs+SIjxTYH0ST4c22Btv1VnQ1uALd4/RWRg9MyvW/+gMvwJx9ZMENr2?=
 =?us-ascii?Q?VV95sFGr2d9kDsLbEonu1pV2OlymrHL2SkjbfINncYztXorxXsNIyxzB7oEM?=
 =?us-ascii?Q?mFPIYQyFWGdRRwmuqLsbzDVYWSTiEmEDHIGPU7LbkE9YPVhr9WKIGICbQNzZ?=
 =?us-ascii?Q?5uX92B89p8Nyz9cAV9gJqS0oDz7+kUcGeRrVDGAYsxmQb/1d1OVWUEn1R9nm?=
 =?us-ascii?Q?OxUUjy6RUziRZOUgAe9WbFWvNEqyvvNcv2h/tFwXIXDf6Mqze++L6Qal41HA?=
 =?us-ascii?Q?aG8ZpKc67jXy6ALPnb8auf2XPNvOn4lYGfaQPWDqXQjVPj4VlE/G0HOSzA0m?=
 =?us-ascii?Q?b6JShUe6kyUiA0ZjqpTHdCO5aL4hvoNgx1Yh09xnVv/0v+uGMC59rrj6Qxay?=
 =?us-ascii?Q?hZ4esZHKsOqpW5HGQ3vx4uwtdNkrg55nbklRZ1ept3EytWZHwi7xCy2os+dm?=
 =?us-ascii?Q?viAQnlESQ9DUh0LYKZmmT7NlCkIFm6XquldKMfuSXg2RfbG7AN7S7fo7NGah?=
 =?us-ascii?Q?XsGptuQ4aSQu0/Hvg2+MvA5kb+0GvR964z/bYFT7Hv9fJHymIaRM+G05R2+Z?=
 =?us-ascii?Q?r2UYdG9DW+KTyGFH1q4SQD3sYtWKdigtbro6tCdEa8KeWnss8s9DbAFLD+BQ?=
 =?us-ascii?Q?BK1qu2k9zIIG2+4XFnMEqTw3snW3RLOrdO9PWAI3dTcDEH09zOkZvPg5i+Q1?=
 =?us-ascii?Q?5vuCfIQnPrc2NtFAwdcI8rzWwewWQRKaFPqaDfpWnN6E6fF9Z3PqHiYF/OYW?=
 =?us-ascii?Q?+EeT0heU/5kfQRPZk8/3iVnmsWMNUnTuWXOMHdSS4LxI6O3NifPqzVOtgUSL?=
 =?us-ascii?Q?ykL2L2EdWSh0rPha6dzl3LQ6HxXCdxNrm0Qs3y+NFFXW+N5L30YaHFqrZ9LX?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023e13e4-dcb4-4c55-4a06-08dd9c529cc7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:41:18.9789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8idqANIyvwt+RIhTyGHpXWxJuA2JWU4O18/DDMAqRx7aZ+TC0DcBdB2y77PrFR1QoDjElGzIfcu/nFl5IG+kqa/XDUVAIOqqqc2Av2/c5mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEwOCBTYWx0ZWRfX1uOyBCmec/CC bEO1TVOxnGH8tOihJk+bC8UwAU+7c+5FMmYJI1ec/81n8iQu2slVraRA+wQszVyE95crV2G0WT6 JTX4WL0sn4KI+zcFN22N8koTojyjV9KyKg/3dk8rAddecDqMi8+WDL7Qf/8fN0JrxiBcdXLw7Ve
 mStcOBwKm4er6Ly1Ys/JGbHBEBaz4EnO5BhwrjSqfwnY+1W33rACuZWhp84X6jv7A7SZOMm6dWR uDueBndvvon6Y/W8tlpvRyMBz8xuqRY/q8aQfLieTdSOK7np7eCPEK+mGmDgg791ICMhBpqtfht yARx0GrNk413gXmi+1Ue6MA6v3Hz/PSQ0vZorfy6Z3tG+vOkFIyyCGiAr6c6abLN9qqqV/1XHtV
 WfO1AAnRMx7um+TL7DSYKWuKhe7yehqvbzd06iDQB+fwlufSkrpxJbdeEvi2hm1Hh5ZybJ8H
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68346172 cx=c_pps a=qrXqrasEdc/lfzlssxSwCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=CCpqsmhAAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=H8h2X5dFQeY3KuWU6QgA:9 a=Nb4uE5ka7GsA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZwqHilL3_LisFWXjpTM8JwZmcxCD_UzJ
X-Proofpoint-GUID: ZwqHilL3_LisFWXjpTM8JwZmcxCD_UzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 12:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217269

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
CVE: CVE-2025-1180

cherry picked from upstream commit:
https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |   1 +
 .../binutils/binutils/CVE-2025-1180.patch     | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7a19aa31d5..99b8dfac97 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://CVE-2025-1180.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
new file mode 100644
index 0000000000..073361cf19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
@@ -0,0 +1,165 @@
+From 509c5afcd71afd36cd6496f8c84733b11bd5e9e5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 22 May 2025 01:56:17 -0700
+Subject: [PATCH] Backport fix for PR 32642(CVE-2025-1180)
+
+Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
+in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
+ --gc-sections --gc-keep-exported option)
+
+https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
+PR32642 which will get fixed with commit from PR 32636.
+
+(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
+CVE: CVE-2025-1180
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 88 +++++++++++++++++++++++++--------------------------
+ 1 file changed, 44 insertions(+), 44 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..d765b688801 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,22 +96,37 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
+ 
+-asection *
+-_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+-			     unsigned long r_symndx,
+-			     bool discard)
++static struct elf_link_hash_entry *
++get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-    {
+-      struct elf_link_hash_entry *h;
++  struct elf_link_hash_entry *h = NULL;
+ 
++  if ((r_symndx >= cookie->locsymcount
++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      && r_symndx >= cookie->extsymoff)
++    {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
++    }
++
++  return h;
++}
+ 
++asection *
++_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
++			     unsigned long r_symndx,
++			     bool discard)
++{
++  struct elf_link_hash_entry *h;
++
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
++    {
+       if ((h->root.type == bfd_link_hash_defined
+ 	   || h->root.type == bfd_link_hash_defweak)
+ 	   && discarded_section (h->root.u.def.section))
+@@ -119,21 +134,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+       else
+ 	return NULL;
+     }
+-  else
+-    {
+-      /* It's not a relocation against a global symbol,
+-	 but it could be a relocation against a local
+-	 symbol for a discarded section.  */
+-      asection *isec;
+-      Elf_Internal_Sym *isym;
+ 
+-      /* Need to: get the symbol; get the section.  */
+-      isym = &cookie->locsyms[r_symndx];
+-      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
+-      if (isec != NULL
+-	  && discard ? discarded_section (isec) : 1)
+-	return isec;
+-     }
++  /* It's not a relocation against a global symbol,
++     but it could be a relocation against a local
++     symbol for a discarded section.  */
++  asection *isec;
++  Elf_Internal_Sym *isym;
++
++  /* Need to: get the symbol; get the section.  */
++  isym = &cookie->locsyms[r_symndx];
++  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
++  if (isec != NULL
++      && discard ? discarded_section (isec) : 1)
++    return isec;
++
+   return NULL;
+ }
+ 
+@@ -13994,22 +14008,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  h = get_ext_sym_hash (cookie, r_symndx);
++
++  if (h != NULL)
+     {
+       bool was_marked;
+ 
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+-      if (h == NULL)
+-	{
+-	  info->callbacks->fatal (_("%F%P: corrupt input: %pB\n"),
+-				  sec->owner);
+-	  return NULL;
+-	}
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+       was_marked = h->mark;
+       h->mark = 1;
+       /* Keep all aliases of the symbol too.  If an object symbol
+@@ -15064,17 +15068,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+       if (r_symndx == STN_UNDEF)
+ 	return true;
+ 
+-      if (r_symndx >= rcookie->locsymcount
+-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-	{
+-	  struct elf_link_hash_entry *h;
+-
+-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
++      struct elf_link_hash_entry *h;
+ 
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++      h = get_ext_sym_hash (rcookie, r_symndx);
+ 
++      if (h != NULL)
++	{
+ 	  if ((h->root.type == bfd_link_hash_defined
+ 	       || h->root.type == bfd_link_hash_defweak)
+ 	      && (h->root.u.def.section->owner != rcookie->abfd
+@@ -15098,6 +15097,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 		  || discarded_section (isec)))
+ 	    return true;
+ 	}
++      
+       return false;
+     }
+   return false;
+-- 
+2.49.0
+
-- 
2.49.0


