Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A25ACD5BA1
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5925.1779102231569720614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r9YdSCQc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAvnx41174249
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=; b=
	r9YdSCQcy4DekLZN5PRee+GTOID80mqpajsH20J0ApZIl1aYOHklZXTy4eNy+fhy
	RnCzmIncYfhyYEsg3gDy6vG5JvKD0F8HiPkcH8vMgxlIQWL7OPnhgSU+wwdu+Yrt
	JKyTbAiQ0HS7TaodJYv+ivGokIH3Y6BAsUi8LhnTHtLXrJfBZggX6ECLqUMavXug
	kmAQDgS8NWrhqC9NHUy7AIIKN/u+bHzFKezr+P+Vaoa/SximBvqhTvEYo7yCGizm
	IFqspei7QVXahCbhGfO5/ogjND6/kSQMeWQIo3BCzxAHWrDjfmcpbbhzgcG/AQeM
	RrTu2FzLP0ruanaSUUuHcw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMSHl4JXY+23k0kccSwNc7/+ElvCd74KOg+KO56NEjCt40NUY3YFDe04v7INhnEXuBtgR58iH6C1nbfgm0SXrGNKHMdRqrn/6MYwuHXhkwRAo3AiXziFbHtBMg4Wc2diOlynebEhPpdhD+9j/x0xJzSJRytP68Cj7USN2JSNCqSNsUOM7AU+yTrLlrolwTs3p9M6s54Ui0Pvwo8qr6M89CKCp2vwtDUx38gme/J6kzEjYt7WnwghNnDaWCPlHicjtaDSfUHDtt6kT0WREZgcZWH5uG5r3Et4VXmecxjmvnUtgUa6lXnafKw8jsh4QRgoKM4fabg55X5zJ54Eg1z7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=;
 b=af4Cd6ldm5kRHsHe0BklSaSfa6xipr9iw4tbcQ69DJ+cXwZ06bhj8qMe3c9ox/NMOB1SMfRhPxZUMd7rZIGXHexRKMOe+xRJas5m42/rX0TLTzb5bsdFUsHMkbvhY6/BgwxdqmWlBEh20my5gb4uJOJJMIHEXaUJVVGAjVD/yZFoX+T3k7eoPkQSsnYCDqYteqOJyeVzFV3d2yyoZh2L7vr7MIxOzSBYGTP5ZNOLm090U3+8iK4aEQOcXbIzbJpV/qyLsF9cLIg+QWP0LyBV2SPKELsjTbhcCh1px9k2/eb+3F2GKr+rzinFmFjA1tWrzA0FCr7Bap83Q+EdQdSo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:48 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:48 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 06/12] gcc-runtime: package new libatomic_asneeded files
Date: Mon, 18 May 2026 04:03:21 -0700
Message-ID: <20260518110327.2347543-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 629384b1-cece-4099-2edd-08deb4cd2301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	02NyWpfH8JpUhH3wl2TJBUIofImEEDDrTDFTlGucXk+W2fTvALNM6CM1z1O0DZcTpdmLZPZM1d+VXFSvjdfQlYN1qNBSE+vTMgmk4dUvJ8jcdSmDfDjHnviTNCR+zO5VpoTR/iPZRLTPCtRY0nOUHf4xnq48hgQAKinMfBGvsHnZzrB2sdiE/Cy4g7oAJH2ojW5BckUstgk0P2Byrvdf5k3YcbAitOibCq8P9kdgGrMd1z4H+Gx98oYucQGM03vnUH3TmLUzjq0pRKlokG3WaK3FUM2TSaqJfEI6UnN0/dZBr+yVy4LWFIvDNcOzeCwRDeMNpUocxss1b3iaxZrvAZa/tjwt4Qt3L3OlG9gPu6OfxLmYxBM2+h960dvin4rBnuOiuXR+1j2s/qZL/cQ0yYCBFMbszCjRb1zhloYCH+V89QvoWs/WNh28I3OMkoLKMv+zWpmbT7W74dAogEZcqxttnSZPfTI9sC7X5VFaPy1+mT4jg39osp9ZAobt5w+0/8OCNOZo0T+qkJPbhP3YJwHiGyjIupYCMod7armEPUAK8TmfA5C6Z4R+W0SUvi8vZiRP7wM4Qmt+yrxwnA755LeFKl5+y8/TA963/Tf5zyA0+b1DmZ0+XPM6bZ/iYvixERldgXYPbbgFX+51zh7w9S7e0U8DxV78RnrXnVoHw59nOkZMVspskR4BvnjpVxO/wHStA3/USVmR3FKZvUtrHnnHUWRgb1WRLsTTVUy8X5hT3MbAloffXYPgMtMTCHQp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZPkOVNCdhdwQbJ+zfoMHe5586h+vGp9Bgj05C6j7zMDdXVGyB8LczB4rcrNN?=
 =?us-ascii?Q?JAShcmow/8tNUIHTxlrdA5XDiCpMU0aR6xTV2zdQBCtiB9J0RGH2YwPQUFdA?=
 =?us-ascii?Q?5kYgUjFfD5avtiDErEM3+3NS4K7U9y+TGij9blcIQ78bls+6vrNh83nMDMPB?=
 =?us-ascii?Q?4dcgsjzR51nZgjFW6ATQQfrMwCQjtFzQAXKaX/k8S231tNa+7Na3W97VrGbi?=
 =?us-ascii?Q?sAk0p8igYHMsc+dlVS6xLrIcb5hiNrW1X17M4UBZ6kANFHG6My/M+xwWRieu?=
 =?us-ascii?Q?awDvnWk9JOcp1WxYWRf+gn48t0qjKL2EzrMgAxCK9hj+WdqbkVSdDRcQuOBx?=
 =?us-ascii?Q?dga4mEwADitaUzvkUC2Z36Mi1uYXgT1Zq1fNsLkFtrVCTFIHx0K2qPP9UakZ?=
 =?us-ascii?Q?/HLDJ18t5sbEAguMFE0otBGJVIGGukibwjp/E4t8HWhMJBCWLXpM7hxOcoXm?=
 =?us-ascii?Q?0b97BI0CRZkc7xYvxI8bwRbXhKQkBc+LW4wBq1mnThUWyYuNzabgUoDuLwcw?=
 =?us-ascii?Q?IQVe01xk7cJOEvx/vQa5gTttjxCIp831U0+eK0EDd8vKQzOad4P9+njSkCvV?=
 =?us-ascii?Q?XYm/EkVoQMZsNvTTqgoqb/j1EU9sQIT+az47c8K0BCy8lPd5UlYDZnctkgSq?=
 =?us-ascii?Q?p6JTsXARc0LOPluN4/cDPm8cmIlg8p5BHCaroi9dJ6vhvAi/nTcpILmUww+a?=
 =?us-ascii?Q?uPOIp6qGfNGjT1KBsQ3ZkzQuI8f1pgN93JTgQau7BR+HjXx8vaCJWqyHu0df?=
 =?us-ascii?Q?16MLZwROeElkEQmXucDi0Qw9P5qzZxIm/NBgk3m1ekFxWZc3fvKAOM8XhJd0?=
 =?us-ascii?Q?2H9o6Gy1v3GIYyCjjbl9bCmhHjrFWT4NF4U+FXZbViWGUX8kNwFSZr2QM3Y0?=
 =?us-ascii?Q?n1HSVWyKu9RoR7dChJBFMTp69uhevX/5u1RbartsSLa4QURA4zLK1kWmX1fb?=
 =?us-ascii?Q?oqZfCSvjpm6lq5PcTPGp6eYCzC+3RCg+KF1uNJ+BHtScPlfmrzwmL/nj5iaK?=
 =?us-ascii?Q?xvQe+zzsEw5sXXjlqJGPGei6gip3Svp9KAfgkxl7qBCO7XBlh7KUgh2Jtc5w?=
 =?us-ascii?Q?6WpnLppu0wAkVaCIhYbJ1ELek7/O0ILYU/zwVv3abuWMYdKhjd1L+DQsp+4d?=
 =?us-ascii?Q?F1D1C94q0blpg+7uINsaq/E4gnItYYFFs7vGeuL4frwA+uHc9uiok7rmQozs?=
 =?us-ascii?Q?+1Ic1OJy0WZrL+7cAl8FVcC7xu5cL3/QpqG3z4ZsN7Kzh2dEQwOacRsf65Fo?=
 =?us-ascii?Q?o/tQv+O4T7My7bTy+b21Zw9EM+KbydtudVJkOTCIp1hPJFrNKLxjPllLkuPQ?=
 =?us-ascii?Q?hrj+7GHppnpFRaTRbFPlVqTUGZB1I7nOs2BVceTjEo6DhXr3R4Z1j2SuTgT+?=
 =?us-ascii?Q?yFJkdmPzGSZDOsIMTQp89xBbVgNzGLiC2HpL2nxLiVtUh4wtIe2AbTMIkHAc?=
 =?us-ascii?Q?xSc2D0qwqgGeBaodCRDlPCYUc5TJgLlzdjzmPDYHlCAFd40UM49eOAxYUBGH?=
 =?us-ascii?Q?7sMAWmJ0k/h4qKE7rZTsHWhAo2p6a4bXYeDopn6aSyGL/piJ7cd32N9DWR+z?=
 =?us-ascii?Q?mzKNhADHOaE4U5Xx/ckJ+j4rADjHCDbEflEJKGODJzCfcGlulIPge/HSxqpO?=
 =?us-ascii?Q?JW43S10eHqI7fPtSMspbKDFo3vqCW6Nxr6HjJuSRNzXunJO86Qcf/tBWAqbY?=
 =?us-ascii?Q?xfeyyZLBo7p7S6XbRAqycpEARy1QEMCIVz3e2AmKNruZbmP86Rx8EmBf92Os?=
 =?us-ascii?Q?LYvdsTvzfVpVbRlzVPIy9uyHwIqEizk=3D?=
X-Exchange-RoutingPolicyChecked: 
	Af5rV8FyUXLB2i5BPIX6Le8BCf/VwUsM5uX2zPZkXCq+lAYDQ/d65O4GTR3RjvahGSVwHLoN47t0cb+EJ7xTk+mZckVy6w79t9csZ8jADKTRatT1P9eHdLgPf0rLHxT2owyCyMtOvB6w0YuOqZzozgk9Y5xknawvmokKy6ovEL5pxoHB66xQaro2FLfTQjKSsl2UaEhArkA69RP5shGSNas2x5RukMZWpmIhLuu0eQw0iOjergnIJLwcVYKsVcVbdNeT5NzhpOa4Xdv+terrbGhzJ4ZFoghNbjPoGi4BAR2K8g6e1O8j/BN/FXqoUSuMBf6YfoZmbLTXArGtSjNG0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629384b1-cece-4099-2edd-08deb4cd2301
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:48.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8F2s/mxtgp96Fv0Bz+PjMot3zzu4vSfbG/hI8YfeoeKi/x02/JRFOxLn1YKLb2EPO81qzTw/ad8ibh6+UdSDc+N5aUXVDqBH3zlVTTbP98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: L-unMqd3barGB4Cs_vmE4U_AyedRgPhb
X-Proofpoint-ORIG-GUID: VyXUyEcLZ6zsfNMvQbMsSQduEu1cJQLQ
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af217 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=f-1Ak3PPjXL7i1jfQukA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX+YHQSucWWrMU
 SipUKAZlfUv8J4P0t13aNeDHexPVQzGeIHAXwJl/zq/w939cW9tgR+LHjr1BJ4nXlTy+V8PDY+2
 1InQuS+uB40XzU4lJ80qZEuTyi/zVRPaTsx6mJMAIFImNfI0hOd5+X78d0bH2u/OKIzrsnq624g
 RD4mzqxIOCYu4/sqn4JPRYw5oDMu6O+G+djdQlBjXmvh+xvY/GJZ64/FK/oepuS9BD84kU+rotZ
 l2ydJX3/D8rpj8Omg/CM8duAoq4Q2vPyDAPhbsABiL3W/u/GjjmLct4QrN/pGAfJqVW87zKvk3K
 FPhpT5G/UFnrU2JTGVFfHm+PBHXWqT7U3EiW+7+KfPsUaDE2sT2CaPL9JhKB6jn2FIKCqII9wM9
 vQmwccCWBZcVIrqPSWX7DJWi6Fk7NbrIR2S6JtZenH38uLhdY1ssZ7bUX0EMUEO+NtQQvNExPSu
 axLHvp+7pvJykM3wMCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237225

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 generates libatomic_asneeded.so and libatomic_asneeded.a
during the build as part of the fix for unnecessary DT_NEEDED
entries on libatomic in GCC runtime libraries (PR libstdc++/123396).
Add them to avoid unpackaged files QA errors.

Link: https://github.com/gcc-mirror/gcc/commit/8a99fdb70493df1294b53406913e5ea1fc971c13
Link: https://github.com/gcc-mirror/gcc/commit/34039b22adea4d7809dae53f809177d6dd1155d9

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d975153bc2..30b2832c82 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -268,9 +268,10 @@ SUMMARY:libatomic = "GNU C++11 atomics support library"
 FILES:libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
+    ${libdir}/libatomic_asneeded.so \
 "
 SUMMARY:libatomic-dev = "GNU C++11 atomics support library - development files"
-FILES:libatomic-staticdev = "${libdir}/libatomic.a"
+FILES:libatomic-staticdev = "${libdir}/libatomic.a ${libdir}/libatomic_asneeded.a"
 SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library - static development files"
 
 FILES:libitm = "${libdir}/libitm.so.*"
-- 
2.49.0


