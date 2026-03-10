Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D968DFD4F13
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:45:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1319.1773164695520413919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U3ndSdwd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75297c066b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5NdaM375685
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cGDl2tW6ON+17/9Z2wgxFWKl/narSizemxsUHJiQjao=; b=
	U3ndSdwdZyxRm1dOtCcrbRZZq56YsAbrr9XBuxe0SglHHEiJtKDoNznfiFomRFIB
	ifpS40dH1eqcF9ND2Yzk84Ixm0nVnK+1wNbeP5GDoFus/dTtjHE1rqK1znSvoZji
	2U6+jdJWmos8X2eXkJPImPB2F5/foSrRtN8PJHPJgJXXAOrCO8UAnKe11fx6LB9q
	/OuS4+GN/I/nhNT5TJN4JduGeYMFwNIlXkv+Cd/Xf/ggvWOA1ohHDN4HuSDuLQUg
	9P00+R2KQfsNyD9jF6Ab5WLxqC5r3Cw4CUwFsL6P+84xV3G9s6JA2xt68cTuhY6s
	SUZF6dVMCimD47aRwV72lA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97vbser-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:44:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix+zijoV75+gCSJkqwVFCm6r8bOal85d0LgwcTVhta3KpKuUbdx+k21/eHaFU/8rvYzc9wR0HdSM8nBooKbcl0ey0eSqIGJPfNSPGt2Ml6q1tGFCAfTBcLM0MAJQngbIwuG9CdtlbUfylBv0L9TK/pWE26z49nUwGZQXn7955uZaQHFq4GhQBnniA+Ed+5vRXlLXkz2T6UL9LvOmzwqXFv1WQz1JRSMTpO/DLrzl1ahwRCvmhMj4MA5Ke21wveBCljPRRnG2ZEjJgiE+rD6mZk0proAGjGt2mrJ6otDrfBpxBe/KsCGAdhUXg9cnkv37Mb4AZzqKwHoX3HcGlg5Ciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGDl2tW6ON+17/9Z2wgxFWKl/narSizemxsUHJiQjao=;
 b=g8rz2Q8N1VK5sujfphmSK643d9vPYRoe/5JtLss40f89zuaBU9zN66gKimGzhiwZtu6BMCCX7KLKA2nBjt1OvsfPu5z6Cm+EtdI6IbFCFy1EyTLr7vgrMKqOCCaTZeepCR36QrD+g/aZwzsjL8Eeea+LFY5ORvnGtwbmKw7gOL2OeU5ewHCHtdxE1kF6kOnpJFh7ktRLR9K840sJra6iuuScQ/USzG1Dl0JU/pg4EB7Dg8OITfa4S4Fij89/4wNbbhFm5PDrxjCwoCNPS7ohVK1ig9L7yzGX0oO8pp/j1e/JcSq2WF2KslSPnMEv0n8jvrqnetZ4s/I15DkJQaJl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV2PR11MB9538.namprd11.prod.outlook.com (2603:10b6:408:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:44:52 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:44:52 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH v3 3/6] gcc-runtime: avoid discarded-qualifiers build failure with glibc 2.43
Date: Tue, 10 Mar 2026 10:44:00 -0700
Message-ID: <20260310174403.2309825-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0580.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::16) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a36b0fd-9ed2-4144-8752-08de7eccbb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	JCvjO9tBfVX16lhMuKUOP17Ten8+FVuzo0q8BDzOaMlAwyPY9Rf8Yya7O/rwNSffzqol9otmrC/jSH2Va/u5Qi/7N/ugk0aSIe0wnaes2Qsp4vFhvxWrmhSTYUPkFHAUhJEF/LeDaAmPQ9NZcPNblkCkCtNIph8stKZ0cIj7uRAJsNqrKSpGqlub9L7j1rLtpiA/5/Dj+mPH5hc3BlCaTKXME1HMBWluyjf4j0LK+Ruaad3x8eimLbynjOBYueGJ8APgfvuIdTAWg4UEEA+wjenNV4vayhqIhy6/viImCQov2dbVK6vX0tdp/LkHUKNn0yxYfHd2X9hcCbrRHdW4KmgwpxI7kMt6smueIDB7ZynCCsGtJRwHd73nSKfe0ylmkVyOzgBGt8UkXl4DzE6siZd9MqUdnriwJlDK1WGrRwt2tGXsrJSF9HuLGmNzR+2z2r1G/2byybFSWR2O5gJzT79uPBaUW3fMBpRhDKuKn6GEs/0Wsot65pD3nwKw50gEfoGuMuRYP9CMFlJ5c5craAGUDbVTyczt/L2Ai1lxwTWJKvstPCDqio0JSwDNszcN0LEkfWJBe0xtaogKBhJvBay6escsq5+Oq2voJvRBkgk3b9GvaY1B9XegdY76Qll7R2ZlU3RFEMM/8nFwpKC38audiEa7dIgXrOec7Yj4nRsB+zTVRP8Zqi5UVEtF/J+yEOsKWJ9vFTI10IQ6xOuC8dOUSHCRG84FWEJkJ+goy7RxFXZ0GR/RsHsDNw1laaZP18AB6nHHRTqoPix2DqqS3hv/yBm6WE7U2skCSyFLiMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RQCXbBZDXbM9Aby6vwTP9YfvO2NSwk3/x/AhL5M+cVNBOH0NB6YAlaHQE8AF?=
 =?us-ascii?Q?kjM1xkdthh4fbObDx1RC3OQMK22D0ThrhhcJqPTycpD8T5gRfTj1BcN5/LEy?=
 =?us-ascii?Q?R6vl3M36SdXg2qwOQOv+iZwvJa6aPmS7QLuX8ogt0QB4TVpX/xTSjPedYEhv?=
 =?us-ascii?Q?53F1ei/GF5yEwZvf47ei/jB7gFpunaZTYIFWURseFUq5T1ExbGh64z6nSk+l?=
 =?us-ascii?Q?JgXc8CM04JjWvSRkl7BLrtMBGKrexcpKlb2kzTaNtZaaKl19GmUXZBVsbqZs?=
 =?us-ascii?Q?kdSkDm1rxjdY2m1LPgE6ViBjEQmmdmUWnay8YNFdbdpc0Yi7besSCTsZwmMQ?=
 =?us-ascii?Q?hGcVAQ3vuloi5wPM8R3/lz9aQtgy8MoD6NJ/Bg0Pak7uoeE58BVP62MjEQGY?=
 =?us-ascii?Q?LvhEINT7LLUIOoQm/Ft844r8l+iwZj3YYm8VQHUIeX14v1TFuYV5Hc3TGtrF?=
 =?us-ascii?Q?UBd7EWtaFJq+gHjH0qcWhbSW8qJYrvZtSnNos70RlhXLNSB0crjW8KImamaC?=
 =?us-ascii?Q?Cr4TVMDC+WA0HQBvm19FojN2NkeRvdMwcKKlxZcT6ZjLC+3V0zYLtWbuFN88?=
 =?us-ascii?Q?bomBW9oLD+4cA1uzfzHxLBoHgFKGdxHMPtHfDwNnZfv6E/KpChzinTYTddTB?=
 =?us-ascii?Q?cSFIjddTx1OH+QjncPqf3ivIQa0mY8GI8zdXx40CtkjG5G8l7Y1HKo7cwqqb?=
 =?us-ascii?Q?M2coTgM01fySdllXWhQmtmSM4WvMuaPLofLXqGN5A+IyFkyCLbhDx4Ft+coP?=
 =?us-ascii?Q?DpC6x+yVhZR0+bBnjBdc0zkwWg8Ex/nrkpqT65Mmrg0ZGWK5GwzgY7hsGDVW?=
 =?us-ascii?Q?t0/RY8vJk428OEXgiP4DtyB8+OmdFb1UThTksYGCTJboy6lPk2UGXKbGLYFP?=
 =?us-ascii?Q?eVkwD3j1I/U/Bx9KQEB1GkUKCw4oIOPeqAz3nnrDWlxkHCr5Xg0D3+zffT9Z?=
 =?us-ascii?Q?1bJdhXScnrfyPfniMuZekJrl2Cq/PLGAwdGY4r9UNeCjRQTicXBxzKe490Sz?=
 =?us-ascii?Q?LTPs4NjG9UT6e8zW+XBalmq/DVRpwHZBw6ksNTvKcRaozNIAzC7FUbhdZ+Lu?=
 =?us-ascii?Q?MI0nTcI+eeg51UVKk1rgIXBjMHDk3PwjolCFaYm/y4lSCV5thBWAkud4EOTf?=
 =?us-ascii?Q?nEOa41Y3r8d2rn1zdaiE8vSNPPCGwMeVLsHsiaKHbeNukT5lI9Ad/lIlj3CV?=
 =?us-ascii?Q?ZkaHh2Xg62AUAmTylcXREDcmKtfaMbRwIqOVoPTZy37J9wZKNxr93ho96Tmn?=
 =?us-ascii?Q?av3IGElLzgVOoDa8xEbOeRFZ6mU9ME6+oZsh9b3zf15tJutsETvuz8N+PoCz?=
 =?us-ascii?Q?uY+Ajfnlft1wZ55sL8QckPd6zPO/GQJOLNETCkpmAA/P1IEdyY4I7yrXoQP/?=
 =?us-ascii?Q?nXdRLL6D0ye9UbqJSz9yHCtZfQwLfO3ih5y1JfdVTP1H2Vw2uE7cG6zm8CA+?=
 =?us-ascii?Q?VuacKv3UCw1ogkDhhdMDf1Uxzzq0h3D3bDkYrhW73pSnsWhltb1xNH0Tankt?=
 =?us-ascii?Q?I9qVNleAYgWKOFvFIHh1gHw1OslJLWjDfau8B0TVI4pxW4NJFJMwDj6CkzVw?=
 =?us-ascii?Q?olMY7pMyc7Rt1JCututwEvV7gshtVBl9mVXEbNjujGKZGLhvoNZC17YiZAXL?=
 =?us-ascii?Q?e9vr9WI59O9SJRMtA3QTxi6tUCmijLkv7yOW20qxyAvI5us0zpAS7L9Mq60+?=
 =?us-ascii?Q?+0PLchmEqO4W9FWKaYczGknaHm+S3ji+Qc/JBnYvmQxJt/HbZbOIbxw875sE?=
 =?us-ascii?Q?qrltb+Q6oj0l45MeGW/nmIV7Ic9dONw=3D?=
X-Exchange-RoutingPolicyChecked: 
	H4u3slfUv0XQfB+u7+xvPNWkWoWK6Q1MhnymgcitFe98UpEHAFlyC9hgeK/ltt2F9R2exjnJ4GhedTPE6zLvkPpzNZXPOhNoV4K00hohNV9eOQtoYC+6WZnzSfYzV1WuilbzvPm6HRArIJkMlLYj8C/N7bLDE37P73XrK4UMUKBxvrmnY/5j8ak+ZzoVG4D9ThJHi9pan1C9L++gExYBpA6p/xTwOi7OeXoMRQMIAUnbT52fQQ5Z+dJ/nW1rf2wRsxzw4OSuvvKha8ld2T2y35JV7a0KA7SRX1x3V0PiUWRvpKDERGO4Y6kyvbP3KtctgqUrTLfIO+SpuR5E2fNcKg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a36b0fd-9ed2-4144-8752-08de7eccbb88
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:44:52.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAL8pyQGbg0MxaA4NQgVIHzIgUTOJpBcgiDYTFGNcOm/sMGK4p02ZJH/m5l5PBcVBRPAuyjdWH5O+dKR22sHJja0nhPWesdSzWUfdX/3OhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
X-Proofpoint-ORIG-GUID: sxeWU1zAtBxEumN_SJF9OGb1X4GUetMv
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69b05896 cx=c_pps
 a=BmqlPTxv9Tigz04FbX2T4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=4E9vqyv0ZoUom73ud8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE1MyBTYWx0ZWRfX7UXRRheVSV2A
 dSMTawWxQxWrvsBbtli5dS4NGuLu2nDg9llahYIUgryzxZcL6kOMROtAGO2cC5aoYO6nJBGY7DB
 KZN9zOpdjwIGrYAMjexnjR6+sZUhPyCfgTKGYvtdg4yYhm2wgzpGPN4jYqPVwG2EBgFIGLljB4g
 ggfDpuB/9+gxOmjlORgCUIWy6F9F7KEAYpCvhje3inv94kHoQcvk8iMUuHxfPHpfKAspimv79kZ
 R3fWlpgYOz4hoWQCDT98uqVIexERujf0432NDRfed7pPmDKFfvmMQtZx0a0np6jHtKDDPs2TETs
 4vxYfMuIIFOwnTMhoHByKeDDgW8wlBlIZBeOgSO4QMu5C8qIZrRabQ/bQ1m5e+/FWRii4Ni/Jbe
 V9M/cDhSJwqNtFn6bSBh0h4yQqomv6hlRXotHIs7nZkF6g0d9fRvnk333U7qJ416s1R+5DMXjY6
 5keeeE4Dq4cRuuAGeQQ==
X-Proofpoint-GUID: sxeWU1zAtBxEumN_SJF9OGb1X4GUetMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232803

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building gcc-runtime triggers a
-Wdiscarded-qualifiers warning in libgomp/affinity-fmt.c which
becomes a build failure due to -Werror.

Add -Wno-error=discarded-qualifiers to CFLAGS as a workaround until
the upstream const-correctness issue in libgomp is resolved.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c4e1c5b9a5..ef38cff58a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -7,7 +7,8 @@ SUMMARY = "Runtime libraries from GCC"
 LICENSE = "GPL-3.0-with-GCC-exception"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
-
+CFLAGS:append = " -Wno-error=discarded-qualifiers"
+ 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
-- 
2.49.0


