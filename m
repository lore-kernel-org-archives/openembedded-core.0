Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA05BFCA16A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20813.1773078280998393271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=maU9Dr68;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629GfOoe1025889
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7rOd2uefJgf6l3e8Ojy6lnGTR9o6nrnoE4Uil4gfQeg=; b=
	maU9Dr68mrCWa4eVJYyuBeHDt7L+WHWcEBcnwDDVCt70sTNLABsEz9FUVtAUpK4U
	eMBNgyEAWr9N03qrvlnTb7SOgYjQ2p+zqGzL5hzJe6VhVONASa3x4WwWZpiALm0l
	5uNgLTt7gSY4HPLD85Ubo9CcgmDSpSLMDrz2MPF4en4mZbEwU+GNVD8M3F2ikpTd
	PzvOsJxYiRLITjYbCj1Z3JgxIODsF0Ga8DGkIJqfIr4G2q9uSAuWjBpRW8mGhLcb
	Rb9frh5MfbiCAxAA5q29GG2bDvEuat7Iwp95SZBWGYUKBycU1RRqRJhsIu9BxRgM
	d3AYadGPxj3Pj5eJaPU/fg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw0C8x3h7wUrCSsEVDltfaba056DvXJ1Px+dNF1WX5wKqj8Rvz+5dBqlsMFwQPqE6y2h9T1tOwHK6PeUfH8Ia6NHsRQNRLs6STvNcZWfipug2tlk8tRgmV4X2JK+l2nj8cvl5Gw0apNn84ed0nJ3AonGgMT/oK9uIY45gnC2dBsv6hHbGbv8ODJGr3WSiguoL73IeLI0yR/OYiuJfOBHvgetAZARgddS2wteY7usQno/jyAL+Pyk7PfgEY+jMCHcnI91OLZsQJE6G8Mts3XauHb2N1NoqLjSE83HCSe+Gi7aVqmAZIwcGUhTI4VZjcd693GjEuhPm4hYLyxXa0kI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rOd2uefJgf6l3e8Ojy6lnGTR9o6nrnoE4Uil4gfQeg=;
 b=DBcQs3zlaNGBSc1jqdZIR2qwi5Ey8a5FmtqKBdGhM8nkDH2Js7DM/cIbWEEkrSTAK3xnudvQea4Dl0SeT21DkqFB8W3JrHEXHocUr0sJ4d8VIH/cxccwzgheKB/7myov0Yi3v/uhUiCNORZ2ntOxAf5PQNLFIFgsXlWOJzZ7TmZ/0xm+NEPAUpjVNNUe1ALXxo2jwHv7pPv2k7155QpuEtiXY7NFGXOKQxbDR92qPpe7MgM6eZZelSGVHQiRugsRtURVEnLexEqW0BWBlByTXZeKd+LQrruZSkQWYuxMgUu097pUDixNPIl8OU4/yTRyqfajfaPX/j6itiA3pBHQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 08/14] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Mon,  9 Mar 2026 10:43:40 -0700
Message-ID: <20260309174346.3384212-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 07374ca3-7465-4679-6db7-08de7e038043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	pgivCAHl2VauZtvp54iRAbnOcknIZ9Wnp24kffyhMUp9Nx0I+jtogBma9bfvq/ylBVH3hRI2gt9O+17uziPdZ5YSjg8IflplYBiMLplm7TW/vn8yEhhFwVl83currFSG/aDTuLWoR4eGchmw5/XEv0Imo9R20sPhVDdmq4krFNVxyL1BLbZt19+EUs62rXdDYpbb/BCiTVLTvjRB706GTOPTpI4OoXfQNkzKaFIPOC8rm/11OW7A9x8yCsvpJm7cl6Kh/gV5KHHcEuaBKC0P3tf8JE9EuoBtDzZPGc3k1UZf4ZBgQu9JNcL9KOvuX7C/dL6jl35icQj46RtgQEXkV1PJJjeKXXky03qh0k2f93Yqy5fusFfSVYhIYgfWMd0APZWe19uQxP//g/h4SKSYwuCKH97MYKDleBKJM9tTqhiQXj/z0U9OdSkUIA4Yoo+Bu4f0VxAqOtFqyD7Cabpzhr2jqS35mQWNGFMglPCY3lUaXzAcvDUbG2kL2rGqOHxLHyCyvXsEytsdMuapSbi4zBS57QeLz/n4JPpYZmb6WmOFjdsAPjYYVa84156arY1kVmQ2HXaCiE2SnU+tVvIOvIA5hgkXNEzp9dMzVYMXQiFqs214l2avUZyjB9JOWzp35bbbIdG2qPMH0C08zZXn66lo5tlXxcFGOQLqcqt7zbytxU2BIyMIaGFnbQaY1hEw8Fc8/V7AXyo+bthdx90ePfI78d+bGjcCwhea1mv9PZlPy0wE9pLoP9jFo0xpELgFJIn9emdGwuCxpmmVVldpToSvGJO6mKXT18myKAEyAnE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PtSVB2/0ICqhY28wWtjpo14AP9vTUC8HmGh1kfegE2rZpTJIp7prah3KQJRE?=
 =?us-ascii?Q?KjQuBkk+O+YR+UyIURZuS2+aPqLRJU6sH08RjgHKP5kIxGaZ1bZ91h2zASOh?=
 =?us-ascii?Q?FATN+FGfDcctG5DNjOJBhlT1esiCjcHHTMumEHR0VwWhZO21ZL7H/FMzMVms?=
 =?us-ascii?Q?KsPvVeBnfCM0VaB4gDFJLn2UeY02B4hgarHVuygs83Hk6WvPSKX+TUR9+3eA?=
 =?us-ascii?Q?Yz7sD6CLYJKAtKLrHuBLBb4WpZQRBfL3xXQKdytao8mFrxymJOV/7RWgKH9b?=
 =?us-ascii?Q?WQNn8uNW3h/ErMjVJGehmsoweOSaz7zKhAHQGtzKA+2WdSsStt9D6tgLPdcz?=
 =?us-ascii?Q?KGfkt2/yPvsgx8n/VtQldAQd3ek44MiYWJGgsAnhuEtl0j5QUphpJHvozuvG?=
 =?us-ascii?Q?vTSDnf0nyi3OH954lW7+uAa3H0xG3DMTfSNsEcAJ2N/V63txi/hVlCzVyLDp?=
 =?us-ascii?Q?9T3wOwV/Gi2CISEk1XTSk722pfn3w526U98KYMFMLN9qk6HSgEKugK1p2OLs?=
 =?us-ascii?Q?TT6qvAxrFn7YpBRws89yGJI7yIjVFvYtUW920IgaCtExt7TAYih9UfcELf7e?=
 =?us-ascii?Q?RsfbAEQTXZqLKN9BvsUvyIE3KWyM15nzaa1Cj9tXSh3ZSBTun64NO78clm5u?=
 =?us-ascii?Q?vBOIdcjIHiXxbNnh5Gb/KRg7bpU3cS9cXohVrtnnZAa3+dohaFJLGouPU8wF?=
 =?us-ascii?Q?DWIAtuX8jiSZfeQUeo4WLB4DAV14/wgvsJfNb8rNAceMQysa0vuPjjgb3T7i?=
 =?us-ascii?Q?bhy+SUwRB0yCaUwWNLHFm+SA7RvTwDAZ5bO+YMhybapiMw0lFjuMq+uNhmL/?=
 =?us-ascii?Q?pi9O4D67i0gULQI9x+Ptce79nIuilGaTUzeuP7XmHPFc0kaA73C++1ajaD7t?=
 =?us-ascii?Q?EkZ9Z0KsZRerPrvyeM5Hi55y1a/GMkcv7r4vyNo5JZLZJ4NGvVD+4rVlbzZE?=
 =?us-ascii?Q?v3IIvs4yrxaetIIzv1lo8ubkoxQmGXVqmmOp7t3W6xZOAjL3KCYUIu01+4+0?=
 =?us-ascii?Q?Nc+z8oeuSaUOwXRCw5plZIe81xnzMaPJCDYC4i03ym+7T2uWfkj80hEWjCwJ?=
 =?us-ascii?Q?Mmu5Nh6kaGVNnwsh0tdUJibSWZoitVZSELSM11xseG+Jk9zDIodHQai0FQot?=
 =?us-ascii?Q?7xI+KVYuwTuEEyLBW7PpfC8zJWV9I3ce5jFdaGvzoORvJ2huv7EplXSylupl?=
 =?us-ascii?Q?tWs+oQ7WPKtHfTuGwqBGdi+KgtVqaQiZRJjDLxoBkAX3dGVJttJLRnwGZ0Lk?=
 =?us-ascii?Q?u1c9DjX1e9b94Rds2o3PgOi9BOHs3hawxRjd9S2f0bdSRQ5NnhRpjVopxcHo?=
 =?us-ascii?Q?9hrOk9HSm1LAeKAQ5DFU0KLdjKfaP9nyfM1dUPi7QnVqLMjPgd9w1S3RdAQs?=
 =?us-ascii?Q?TzBqALXz/9Q4mh0vlDxwqNTE0P9sEJ+HnvZ9ZwbqPCtHra0r40ELCl/oj0uB?=
 =?us-ascii?Q?GftnNz+5c+O8KiTYp0oRNdnkz/5kvkQmkXXNgWB4lmUok2xFXiFiMe//+95l?=
 =?us-ascii?Q?QaxFtkN53Ejwe8IkXTPYayzcNaDMTwYXLhVilMDBZnc4960J22+yowvJfeYg?=
 =?us-ascii?Q?J281R3XrOie6lQwgeXSk80rcQe9ugtZby5CHpBtyVSQIwGzfE++kn7hWwtIa?=
 =?us-ascii?Q?q4tWa0uWNPcODiZ6EnB41BhOZ6YBzudgBUFPXAF6jKUzka2hUKqcuI0naL+B?=
 =?us-ascii?Q?hPpZFcIa6zaxfHieeaah8qN1DymiItYJkwNHP12PvZpAbb3lgkiGLjVRY4P4?=
 =?us-ascii?Q?G3sa0bG0Zr8hAr/NmU0vl1N04MP7b8E=3D?=
X-Exchange-RoutingPolicyChecked: 
	u5+dYVTAZuUL9pYXV1JoXjjQ2XD2KYF4tJUPBV3oCl2LNekrNHpEtFKpkLjPthwpZm2xIfzo6xrwkKfar23XHJXLk7KzhXSIEzT18GGquL/rRaYRBPpeMIC2DMMbyDBCFOof+oB86eoUZRLosl6/8jPv8A7xHr5+bBT2XI1fTuSXihFx/L31jxfSPDWdF6W6CO/run6gxbTu0rVtA2r/leRn+JyRUJU1IWdnCHPT2aZ5m32bEY38815XsJ482WGTBFhC/KGIILFjAu7a0BT9l/NRdj3sFhtXqgMrtHpZKrkYOyxiOfDVsf4ac3BB0Qx2bo/MmKWcGYfY+I0FBe1JxA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07374ca3-7465-4679-6db7-08de7e038043
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:23.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYQzyhXBOmhoiLOKwrPTd4zx6/Ni5F9+OP73iG9OaOY9LlwAjuQkPg4Uhr3QdLOiDM6iTUBEnwgndSpJCXts+N2CRC8fr+pAz4KOdOucbHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: SZxPATJQhJ5Wp_ANxCjy2pi1XnQ-GyDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX93jNQCbDX7xb
 2NKBtMjQnBNiDKU0T47OzTItT2GIEAgDzk77+0JSZTlG0QcMlB9Em6SuBju4rJ0d14qDWMyK//r
 psuy+QjRRTtzQZIzYZ62trwCZvukmEH7/wrJBCNb+GNIGYTvmzHRKEygihIzwUJWXmjtwqzzSKZ
 gXIw9/rkcdkmPOydLpf28cDmUWAOT+NLaYR83qRgBLq4yiBR2WUcoTmtr/5JrfhcFQaOjUoh4LK
 /fk8IbnCFo6+0c/4KvHmQfdhk3KEAZtEm8C56AkyuBa7MBVkGvX/FEvJCcQ/qdKqil+FWBNJtaN
 zOTH1SNYXb+MCxbzxArq7n3J+YWqWKVtS/+vTB+d6JkVrBjgtYUgqYrMhI8PG65r5ra3lr4BmYd
 nSdSRnR0qetFtWNHwhNFYkiMk3H63EZy34uG18LkBIUlMZtV9PDis95bW9mKDuGbmJKh6r5c2vO
 ri7T4hjBuqYZZ1KbZBw==
X-Proofpoint-ORIG-GUID: YR2bQwgtwdAbXf-lqG-WqdiSTA2bxs7s
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0707 cx=c_pps
 a=gS8+cbQEeirDoRw2OPG9zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=VuBSspvWkCZ0bjgt3uMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232747

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..f8f04832f0 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -140,6 +140,15 @@ do_install() {
 
         cp -a scripts $kerneldir/build
 
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@'true' if bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')) else 'false'}; then
+            cp -a rust ${kerneldir}/build
+        fi
+
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
-- 
2.49.0


