Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D5ECD4F5B
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5926.1779102231952178811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gMnRB1Ft;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7oNGE850114
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=; b=
	gMnRB1FtRuJGUBIBdjjjuFSSI+qlmet8oguWkH7aw/5IivLIciWSQ4426ZkpvwLH
	zi4OUp14n2YRGG5Uc+UJM16a9XI/9LZy0MMdC7nnkAGQTSLDaspbmElNTK2bdhIq
	WHsGsiy0jeAKrhrqqJIvwPZJI/a8cld3APrROrsXWloWYhv9nVMp+Nif9+XoBk+S
	nAgrWmXRQvrdBsD1ZtxHC1b65TnqtyveFBBkKv5/vnLxqUlwPKcP8BQ1VnuHXD16
	xlBv4IDZ84MFXn9cSQ2C7O90IKJPDkj/p1VK91/z6MyCUDf2MB3AGaIdHaA475Vh
	rGi9kqZMWK4xylZY5NAzdw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJxaDHHp+slU5+Z0RKWg/figxLF6bqVnhLrM8ZmbEU+eudpg3K5kYG56+4t0MeDCLWNz68U5B/FQ9WU1QoMLKLjw4w3grUzaHqAM8vpqreu7cfX2Bq8zB5Fs7cyvmnHMbxiE7zVAAB2D+pvnRI8VEU7+EfBVSprETJDEs+8OTUZIF4VapbHtsWUD3+bhAw8fAp2VcwgFPpSuh55B1lL56hjDwQce+BtoWn63rPgIlQMrE+5Z7Sm5C6XmCgiwG0NmmfSELrE4VQ2RkF9pv33IvMvbbFDL05XMaKClSOKMy8NG2ZGM2Y+BUoE6WUUJaA9Nq29H5sNWHh6mugVjMg6eeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=;
 b=PgOIdNM97BpZ4mnE8zyKj5AiC4G08xBkRgrntAdgqmwUfw+SKCbu5HpPZJw/5p5C1GXU43wl7wivTrs84F2WRsjgnd9RNXqHNcO+o5ya8X4q3Cgva/t/L894BV8IXjsntjVbvK6lREtNsV0qwJZce6uoc3Wri95uDiVJrEEjoNO7CrFCyzEIej5f/cBnqg5WiIrT/Mi0Zg7K9QtQD3dLom9wYuwVSHjIdpLtmNlZPSMW+mnRU4T0R678Aa8grgU7zW3OMTZqz2jUDqAoOhxNbpEmTL3tGKo1loI12ln7CRIusvTK9+KanRT6uamgYTMOVm+efrP+/0gpn8us2N+K9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:47 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:47 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 05/12] gcc-runtime: disable automatic libatomic linking during build
Date: Mon, 18 May 2026 04:03:20 -0700
Message-ID: <20260518110327.2347543-6-Hemanth.KumarMD@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3dde0a8c-ab2f-451e-6add-08deb4cd22af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|3023799003|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2ZQKSEDn89MIeOkHyGdyHYG4D0lJorc98irxv8mYkiUffKdCXb1KKJa5EWFiV0KVTesbX7V5AAzS/CWpPzpk3y/yioFqjGrW3HiWb8HEr7vqab1e7nrhhvOO7DXnZGNjcDrCeh2secc8i0nIbbFZsOcVgcx1y/v8KdZQ/8/qNGi3uazpQt2YP4CvqIiob2t4aV6VZ2SAVUQHLrTtTlzHomSc77eCQ3Sc6ZTrZVF+ehnX77Nnrsh2ly1Mu8p3SdQTdJgY6JcJ5O8t/sbil+obpFWCzQqOft5pubiWWP5Qh5NZ25ViS4I6HCOi1hYkKozyGG/E88NwrGf2bEM1u520+bLKyPzcxq5HzWlO+Jl40LrWna0CxYK1kcro5egsqZUfsdbhKReJ+qbxvxBQR5uWzZh2kDdb/vn30bTWyHEjIfdHuvRMKByDM2PUvG+TpnjkYH/K2fyZ86Uha7xDZ2SYcgWOZL+5vz4N8IlDbkeMzpqVrwUCorgo+2jLhCfKy33dNRg7WXTG9SZxNUr7Ybs28ng732rJVX3L7SeC0jkMiYpTb5M7TVQ274XybtmtiWtKA9DK8+pFUrw8ZH6HwAE5CQlzcu+R6LujSfGNiaVreLmV4ksQ9UKErL9BuqGR5SLpecn0PtIvtawy2gDncvqrATTSMHbtv7bXx6YjQ8E49Dl54EuHI7lBP9bBFcTqtx4bhABgilZITGxZmGZTirBc9Apgbo1fstfDhXdAF3djmsNiO8HZckDgpCvIGXIH2YvV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(3023799003)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8cPBvKlTsL24baEqex4SLkWvdQPFq3yH1jmIqnMDU8XPbCWxQ+lwgCLuQhAJ?=
 =?us-ascii?Q?2DFEja9ptrh5Jyk0oz/Gm5yHYHJg7gbNjSRp3Tywo3CSdtbUdAE+XrJRuJPX?=
 =?us-ascii?Q?huIePrB7HgNCdN0ygcwSzRzyt4BRFwQ/+vovtxuJu9pVvZn6UM1ZeWfmdFSY?=
 =?us-ascii?Q?UVthTdqFMTdct892pUWNNluhqU5lVfKuq0JWBEphpY0iC+3tHw+JbqNsul/A?=
 =?us-ascii?Q?VdmPQkc3mqfJGiubUiHgKcXeMka2nNuwXgWIOSCS0Mw0FlY16ayq6pNsf3/R?=
 =?us-ascii?Q?CfkjJr4uP7McKaQSCANWXK6AagPcSPFitZKvdPPhBhuiaCsnBMmL46s3qeVP?=
 =?us-ascii?Q?U1WZXpEJuKRGAIrTLK/n2TagTJzi2jRcIZqbVRQTL0KXuB8ZpYmhXw7As8w9?=
 =?us-ascii?Q?RWDjGr/gizI1C9dC30ddSfu5xYnbKToYhSXl7s5AkKAUHbF4inAMxQHeb4jK?=
 =?us-ascii?Q?ChTl9hERk6wZ4viIdvYnzibptB1ixc0rGg+wS3XJOxPNF1U0Yw0V1GVw2JMz?=
 =?us-ascii?Q?/XSMcDNg4eavPajhQQoEEUDKMNh3Y2A0f4EscPE5KRE4m7JwNm4wLJbcOfkt?=
 =?us-ascii?Q?lRkYHnQ/XRqWM4M1X3mu4V0TxwqbsEqKgFvQiSb+ZV9RojxQRzccSOMz5EE2?=
 =?us-ascii?Q?KCR+4hNNEBetPwNZd6HDLZYlKjixjZP4hZFE6tDYHlY0UtXnykaW3V0JAytj?=
 =?us-ascii?Q?4JVt6mct3U1F2C8VpjXNUEvDNv0KrO6sCmqgqA6NKg16ZUhv0O3wCWL1jvgn?=
 =?us-ascii?Q?n1+DJeosBGpwhLadiPdpJPit84MZzz3lgLiBLycP9zPkxfzZW4ASxUYv+hxf?=
 =?us-ascii?Q?sbUouqsgIBiJcwiJtqZpk6GbXsRB7Wwe7exH6vJw5a+LfkCBMwo8AV7qfUjf?=
 =?us-ascii?Q?dFskM0dWK/jqqfCzCoCpYDepy6Jkkl2EdFKDk4OPmwnCL89afnrldCEdB54A?=
 =?us-ascii?Q?L1KgJoHq1UW2/+ECq4qYP5YuFyD3wJOxmkTtH9UbcdJTEfwmYnR/c8kGSbOL?=
 =?us-ascii?Q?Y3V6jK/Ly+NZDCC/Q6BnlKRwDumfbxesQZkeqQe045N6CPjcgr27t7fXtY9c?=
 =?us-ascii?Q?vsoojIYTnXRrm5isoCPLrLlIQqmcFQdpuQftW01jG7LWPNvriccgOIc2PAOA?=
 =?us-ascii?Q?LANT6nVUi9YSXuixTrWzpEzl9dqKlQJ51w5Lnu6vGAMzIPChg35x0vXclxKj?=
 =?us-ascii?Q?2ncVoeqYVxrhYh1Mj2D2Om9Ir301bTUnvQHxHRjo6Bn4BU4i8/g2000YH1Q+?=
 =?us-ascii?Q?JGIsTsCQ9yNSk4Bkvi/ntkhDCi7gnSg1oyspJYLKInj8eBrfsn1FvCO7Avf5?=
 =?us-ascii?Q?3/2cgleAMuCAH7adXOZCVlWzWnDctTtp0ce/GGao1B48cbmsbGdDd+qcOAAv?=
 =?us-ascii?Q?B5yDUpF9kcGyoM4nnas4p0+2k2gpSj/uqnvFJahq2Wuyblta3glhdgoQGavH?=
 =?us-ascii?Q?v0qAqF556eKJ/vnpDMzGv3nLT5/3VSeU7ZBzwd89HWWD2GUbSuZZyAuB4l7n?=
 =?us-ascii?Q?XtxkoXTmmQ0z/yuPgleaCRujWambsqDVY/baATyOCd/RnfWt401ChSESLI7t?=
 =?us-ascii?Q?Z85SlWDNFwQly4sves5TxAcnuZf44vjSZDfS3Kkfa59q/CjaGlZYCl3CCcmM?=
 =?us-ascii?Q?qtVImEF+Xk9vfvdiujZNEbJu358Y8nawmhTHMVzu4Hk2V8fqg3j0hHyQDsdA?=
 =?us-ascii?Q?SvMb07ZLpzFapE22syRJteUuqeATl5mhO2elxQss0NkyYCbPv7lKvrULej2y?=
 =?us-ascii?Q?47M/n1Lg+j87PrcVuNTEJjhqLVMucKA=3D?=
X-Exchange-RoutingPolicyChecked: 
	dcDAVrXMUzNsxWzfm8wHHhb2Enm1GQyF5MA4ZBHlBeywQemT5xq/MUBY7Ki6K1kGhgshVa4FYlFm5f50hHCH3O0VqAyAmMl1cDETYG1qkHE+vlX5VGAeGz9aVTpFnJDcHOJnkIOQSPB7oTzmp50jmKr/MR9N8RYFv7FkXlfyI1S/lAcuUUcLoszNTcIv5jdVQMT746gKQwsqgdCYjchMnkwnvplQuDJv8UGwaNq6svu71T048Iy+NTcQv/O38MVkHUriA9MTZ3JKof1byLWgVNVXJWWQkIeedVVqPrYWkzPt6T5IzcsVbw50OSDwBHrQ2Buq2s2CqLUqIu/v0Njazw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dde0a8c-ab2f-451e-6add-08deb4cd22af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:47.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNQxqtD+CWNuUcpuXJPqMpViDQFLpSQR3Pagp4W+MfoqtHtQPoUNOd7zY0jcQSRdqJNGAiqc+xNFW1ARSHEUuP01UaOdcRjlkgnEAzyTBBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: WVceYYBX924WcG2Wf74dXPVnYTme7H3K
X-Proofpoint-ORIG-GUID: 3LcYwMGxSBejNccUmAZ8I6Hxq7JMCpZv
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af217 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=0SpPGjiuViyywlX_MzsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX+ubgs2nct9sH
 UF02nvLJSsm2604WJ3zZKeB3qgdAJ9vynIV2llPdZ7xbKVd/nuwwm1tD2mi5gAfKlOvlyUk6B2l
 CgicY4GSWLgB4BlG/SfAHGBZuCHFZEWfw+tCRuPSvS4c02kZbmi8w891v+ule1mJ1JBhOrITwgv
 sRwtw/oLdhH7z1aeWsbbd8Ellm8t6y+g8ZIT488PeurSaVQLTz3fMOiiIGEE7iahE8huO8+RlnL
 k9ySceFK6NXW0DJiDDueEHdwgSExJ6sPsmb2HXD+e25YMWUS5Y6ecYyPj7jZHAjbQ2xmoi7ceMF
 Tn/TOMjIh5KjLvQ/gbHTZ7v7R2fiGHVBs1eVf7UD0qzJSR9rnMAT1v22Y4Yc/k5FGsWuh3ycknH
 Zf5S8HllH3hcC9b/D444KjbVbPOw55RZfSgRXwSvnpWPOO4AcCy2nMKx6wmA0oyjPKPayEf3yS5
 L23RcJNGKtQhHKHtQbQ==
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
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237226

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
During gcc-runtime do_compile, OE uses a pre-built GCC 16
cross-compiler to build target runtime libraries before libatomic
itself is ready.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ef38cff58a..d975153bc2 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -15,6 +15,9 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 EXTRA_OECONF:append:linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF:append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF:append:libc-newlib = " --with-newlib --with-target-subdir"
-- 
2.49.0


