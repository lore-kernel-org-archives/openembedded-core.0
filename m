Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9799CC61DD5
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23521.1787780770119416450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FNWLJ2bw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKeb4O157156
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=; b=
	FNWLJ2bwOc1D1K8qG548HGtnwCz4LMZ0f/tvHl6JUrWVOgMShRsA3wKBhS/0N4LD
	0m5mNYNS0KjP6lWi+uYrsIvsAN+tqxBugP7W+eTfEVM0/NNYaxtTdZoGeGRRqaWc
	LbiHQvuQFlqxdk32pZnFDT7yJF+ohMDHtAa9SRgK5jSwBy4URuM/OXW4DNj9YcGd
	Jaz+Zgxrgso6mSIBIqjkJhBbGTSVLuCAYxwTFhMv9JILHmEgOMlyZo6sXuDh9AN0
	TNxqNIZtzAzGTFwh61vJrlikj3U7HsTmXznF/egOjSN6kwAjupnli9FGVXtCHqUm
	xXFVLtfD+PNTsw9cNT4qog==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021122.outbound.protection.outlook.com [52.101.52.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6yfhw-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 21:46:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9P14CYUuPMzx8FiTY2odD1ECf44VL/mSAQQVmTCA6dCwZ/YyNcwwVLV1aEjo6GSRGXj7VOnXrOX70385TmM3c2ZCrxAyayoQfy4XiZK+4jJsNgObnZiSHKSttJAAMO82e1IV9zzL1/lZzLmNKbpM6ZLIunq7JJ+gal30Z0BTp3t9V+nraBEyCyhwN+bzT58wP9I+cp6+HoSb1I5PlijHVzH+m432rMku/PK2JksO1/JyeKJrZe4Qtd7/nR3qUmfwM0nOZf0Sq1j1Ug3QNbUChMeZunP5pInuypam7fdzizQ9LTaXNkzL0BBKldTZP6eh8/OngePfabey6OdTFD7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=;
 b=hlDlsAQTTGlXIhHzczdwVVZnSRcFk+0IjmCD701sBLwqntV/d9/9/i3e6aeuWVKjzmGqtzEzLFRBEWLVTi0mouq31Boh+ZRll/5bDz6OrlW/BDWrIlcFTMDv0a8Vc6dt7TQhF22f9ZFqdLGNeqrzspjGCIbX7G6MSKmrjFdkbfqeN1XzP3ARYhvMEXkvDMZ1Z0O69t4a4tdPu5gH6jB5hqe9SKZ9T4npiy+jSk83SM7uVYCWaLdxP5k6lBL/4bwL+LTdUbDcuMI4Ju3ST7Xyq5HL2tfuvP0BEDOShXP+kr0BX7h48GqchCNUlBIIEB3zu4IaRUx9f9B/bGJyZiUS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:06 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:06 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 08/16] rpm: Fix pkgconfig() Provides missing in cross-built RPMs
Date: Wed, 26 Aug 2026 14:45:40 -0700
Message-ID: <20260826214548.3002838-9-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c8f2d1-0cbc-4bc9-f676-08df03bb6e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	GPutgyeyyVoM6B7VDwrfXkD+t4vA6ugk7XSS+uzOo8Qf/xSEITwOdQNsyV4XW/KXn2dWeGv2BKPfbyEZOHDo8RAWTTaaWLjxk9cyiC69GCcz7NcJ0Y2EoknHTFySUW0PYdTvWtrtKSelOEIkvjlw2vWmsVo6woOzKfL4c5lp9JWgeyS9aJLWOS8c/fpSy6WGf6CL6ja+8FC9ZpZlPD+jf0Q+Z/ThrD2zCmWnp1djAFW3cFB+ghHiXbo2dM4fpOJNL8R4xW/ygKrdPMlRUYAgG42OqNIqoDBoW3N6SjG37sQrRJR19CGB/jUdfzOkreMQPqHoeJVfvTtC+I6QfKIkWvT320sSd9RB6TDfyD2Gcf3ngFr+dykkn02N+QszvULh6y9xn7qndYY/39OAfNbOS0GatSKIsjHPNQgmvL1JGPZvlOnb1yo7DTt9KBsMRI/L9YrJcqy8Cc1cXAGLaRSJ1oIfQ+fAX3jwyvLJ28dk4E/d4iIBPHIELgsn5mxNJa5R8vWWC0dYVffRR7MMTTu+SyuGnZJ0OXtGmwwcH77GEpBbfJXu22dZjtDVkIRVPrtV/Dhjvh8a/1syVk23pcqDKTj01D8nGS1D9ZYRc6lEwA5ztkdyI1N3BP/yTO/D5QUvOxK0j4h0xHKOY/AdjsORZSUkS27gAE5n5hODbuUFZtkvjNvGDCo/e71GXBhZKUXC/JRShx5wOS4THLRQcRtezCAaGa/whyBAijPXiQA3mlw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nWgYxlK9JPypCOCE0vnfMk0yg5AgFLlSYGvKjHTjukuM0ctuq+oU+me+PYny?=
 =?us-ascii?Q?ZBJ6zqcr4lk/rN+DjHz1v+cJR/GCrgm5XPgo1dKZFuZH+aw27cTIeCuAxPN1?=
 =?us-ascii?Q?4Y734qB4X7QEM3B6pnn7p7tAsjf+grpL0oJc7KfTFdUF1GHC2/bz7gA4Amnw?=
 =?us-ascii?Q?yNgFcB6rybhdcrYgUvlnvg/xSU768dN9CO3kOc4yx+tZr/uoVsMYQr6Mgsv6?=
 =?us-ascii?Q?ug8Xb+luV8RP9yfhF5Ad8x6LB2Z0/82Htjto+Bbllnl97wZ9PSZro97MT7VS?=
 =?us-ascii?Q?DURJtZilsxAJejVMXk8rLkJ34NZewcqME5XbTZeVXVkG+1PsupfsOILem4In?=
 =?us-ascii?Q?sxFau7/5a2oGyUz+VW84f5HcZeVSCic+pj6s8gnpVRQ1Z+gWsdFQ1tFAqXzk?=
 =?us-ascii?Q?upS1N77/Z5MWiNsPjC2dxUu1TieWtqNQJ3wH/4VVdPBJa9ZGpGo111P2oTNv?=
 =?us-ascii?Q?WdJrjMnkM8LSy4J6BLOj1KMY/YZA7YpcbMmNAxGRotwms73021qgWesE12Pv?=
 =?us-ascii?Q?RGYTg6SA2HOILJEl2ORsEKn9Qn5sqBETwMRs/S+zojOsAMJ8UKN2NDCF1x/5?=
 =?us-ascii?Q?FzL5Rjd7BZX6tdaMAlom0JD2HN4PrtgmwC2tYlhwon/4dbNEbaaeFH8yf2e6?=
 =?us-ascii?Q?nYIpoQsLPJqS7TeWz7CwDR0AQNmdF6cxVNsfKEQ8X2T3eRLWMzm8muW5O/uN?=
 =?us-ascii?Q?YQvbmeN5oXWKWTgLfaevBFjlPPJR6B5AmEOU0LwUa8mlJxvN0ErubyxgNJkg?=
 =?us-ascii?Q?a12x7vcNeCmgDgvhi093M0Qy9eiIlECrVqVDXrAaIkQTAQWvIpTqvzBe5vTD?=
 =?us-ascii?Q?PE0oyYIyST8PluHAU1EWK40koDNUtaNOV3aOfgy09KQSbP6r2QTOM7qRsWy8?=
 =?us-ascii?Q?ycZsxADVO3UhaH4aNH7FAGQp/7sqRiur0mgRThkcFUVieB8vamOGBOZSuZnq?=
 =?us-ascii?Q?yT6EfK7IMC7gIkCCTUB7BE2wBw6CCuKDUwJPtO6mZ5JSOKnb7x45cYZ91+lm?=
 =?us-ascii?Q?SFmLYKUO+SCxiitx7oUEf/1QBZTh8WIRwOr1LfHUhLmpnWYz4uwH3bECYDX7?=
 =?us-ascii?Q?51oS4SrLdw/sgWdSRYDoeUq4a2fBSHKOZijuMKCd1ykQtca0ft9DPTqeMoyJ?=
 =?us-ascii?Q?lCbAYDrAWfQJEMb0L+8/XrDzMK6fGZJDm2vT3/XPCPhkFZSivYU0FXEShcFl?=
 =?us-ascii?Q?jGuGXSnPgWEm59TQCB29cDFPYefanEZBgdnRFnw/ZCVjx/VapQX60E/ELivh?=
 =?us-ascii?Q?2ZdsoBNI8QDSSruXZcJW7u83B6VNhqxnscMrAS1d0I41FaMr2XZ+IU6swNCV?=
 =?us-ascii?Q?SY52IsRRO2YvVwFIhxph/6yOWDmF06TD1NXdV5Y0AHfIrKuP/Ni9ycRjIPRS?=
 =?us-ascii?Q?ib/1nk9AaWtxVKv33U1P+J3tmaPTQljoTQgu8IHau3KuE+KxVPQOlA7zbO1w?=
 =?us-ascii?Q?jR+v13OPtu6yVXaoUlz/aCVlqMBgMFt6an8NZ96pNaMnNbCGxG/DYZg53Kvd?=
 =?us-ascii?Q?qnS7lMiTF+79a/wrXN6Rfexhh0eBUTzb4YXxWK5YCUYUkJXzLlUhzCOU04Lo?=
 =?us-ascii?Q?b5rFuSUbmPxUQbWel8CF1fk9kK3syvZJhE9qAR0BuA8nCRHHrrtPtpBqDmYO?=
 =?us-ascii?Q?xSodi6jEprPC05dEcuzQYtOS7IDHC9D/tyIavljdc0QIkZx+rVUcKgvMzXVa?=
 =?us-ascii?Q?EuZx4lWljmPBbpJJqLwkrZ1P64eLQXoF0YEHeqaUd+utI9ka6Xoj9EwJNjQv?=
 =?us-ascii?Q?8tLtcSdsWbT3V+FwsVJR+1fzk85ibaU=3D?=
X-Exchange-RoutingPolicyChecked: 
	YsA3rdBJmLcy7dlBu3xoUxMqTIrbdDjxGwpVgo5rWydST1PL0pegpx+95Navelm4vekAECtZ7rxw/JOrfXHjC+Mj72LQmgIdBgxC7nqJe5a/x4HJWZGwdOzaNVP5kIQhpjfg8ISLeUJB8tijsycB4FSE23g2CMLoNtxk6JOHM7EUkDFSRnjH3iPk/cm7EnZxV8img3Rl8S87AW/dgvyVDlz3aqhXG6I4wvxA1FDkj3rDZSk9OOTuNuntUXFgccBtvxLvCy66zSgECAWTZuKfNYs1B/KczWKwWRM6mbrCzgjryzcWq0e41qFSzP5eGDE3j/zbcqKz13y3fBzVSXYnjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c8f2d1-0cbc-4bc9-f676-08df03bb6e8d
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:05.9442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DskHvgaod3rUM3wt1QH8WDGMSlwWfFW78rZdnHHPHLRHeDKCg5ZFmykxVcetJPBFryOb8saZgQFjit4p0l5+qfp8I7pUfd/bh6dMO61bbTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX+4q6XXW5JO0o
 BO6Re+KAnPdKWgRSwiNDalsx37e1xmv3nKCJ4mitVBFCPcty81DENKGWse10o30ilmDpk536rTD
 IjoqNoEhGKuMj4i6s62yux6aICN+DLO+V9MLk5WKzc9DmARtqeKy
X-Proofpoint-ORIG-GUID: P6gvBsGZfNKHFYvgy1-FZwGaxB1YCa2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX9hC5BPOCFR/f
 y0oSXuWBBozQiG2BTXmFGr2c20k0aXdRTVU8sZ9BvP9yaqQNDc584iXDcYBfyQiQxIbbLXGzW0y
 hvlTf13WryQwuQupJ/AknS1N1IdldjiYzeLTYjb5yox59n36CJHFpNcb98DqKn+HYtnj8cEIfyZ
 +Wd1tbU3TyZovVCzuMTADFngpMyz63pAadRnHDrXcjyc889UqnN6L1nvjSZKXCJrqjHOvUcfK75
 AzcAzx2BiO9lN/3wZTRvcczGfg4IvXYxFe3Z2z5aY1dkFUeebkEqG3vEaHycooxIONXz60EmxTu
 cxBVXzwK1iktJEYBr7Pc6+cAF8dzefjpZhoENei3C5je8EUmNUkfm7/FP2TU4b480zvYadR4XCx
 GF/0OFEMe2dcRgGKKW9hpXLwHkW+1CqvYGBA2d49Xspz6wUGLhw1AtQkjHcglI+LEFqg3oputGN
 CYQox69e2OJ+6qyMwsw==
X-Proofpoint-GUID: k_Ydw0lSKEqTl4To6lcND0sSe-OUwR1K
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8f5ea0 cx=c_pps
 a=83jsKCSeZiZisq1MDa3xoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=ojM18H5VpAenaKTG1r8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244425

* Added 0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
  - rpm 6's internal dependency generator runs pkgconfigdeps.sh during
    rpmbuild, but OE's cross-build environment exports PKG_CONFIG_SYSROOT_DIR
    which causes pkg-config --print-provides to silently fail on .pc files
    in the package buildroot.

    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh so
    that pkgconfig() Provides/Requires are correctly generated.

    Without this fix, do_rootfs fails with errors like:
    nothing provides pkgconfig(ogg) needed by flac-dev

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...Unset-cross-compilation-PKG_CONFIG-v.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch

diff --git a/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
new file mode 100644
index 0000000000..eccf708872
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
@@ -0,0 +1,71 @@
+From a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0 Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 04 Aug 2026 23:30:00 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Unset cross-compilation PKG_CONFIG variables
+
+In OpenEmbedded/Yocto cross-compilation environments, several
+PKG_CONFIG_* environment variables are set to point pkg-config at the
+target sysroot for recipe builds:
+
+  PKG_CONFIG_SYSROOT_DIR=".../recipe-sysroot"
+  PKG_CONFIG_LIBDIR=".../recipe-sysroot/usr/lib/pkgconfig:..."
+  PKG_CONFIG_SYSTEM_INCLUDE_PATH=".../recipe-sysroot/usr/include"
+  PKG_CONFIG_SYSTEM_LIBRARY_PATH=".../recipe-sysroot/lib:..."
+
+These variables persist into the do_package_write_rpm task environment.
+When rpmbuild's internal dependency generator invokes pkgconfigdeps.sh,
+the script calls pkg-config --print-provides and --print-requires on .pc
+files located in the package buildroot directory (e.g.,
+.../package/usr/lib/pkgconfig/ogg.pc).
+
+With PKG_CONFIG_SYSROOT_DIR set, pkg-config fails silently (exit 1, no
+output) when querying these .pc files because it attempts to validate
+paths with the sysroot prefix prepended, which doesn't match the
+buildroot location. This causes all pkgconfig(...) Provides and Requires
+to be missing from the generated RPMs.
+
+The result is do_rootfs failures like:
+  nothing provides pkgconfig(ogg) needed by flac-dev
+  nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev
+  nothing provides pkgconfig(ncurses) needed by libreadline-dev
+
+Fix this by unsetting the cross-compilation PKG_CONFIG variables at the
+top of pkgconfigdeps.sh. The script already sets PKG_CONFIG_PATH
+explicitly to the directory containing the .pc file being scanned, so
+these external variables are not needed and only cause interference.
+
+This was not an issue with rpm 4.x because OE-core disabled the
+internal dependency generator entirely via:
+  --define '_use_internal_dependency_generator 0'
+  --define '__find_provides %{nil}'
+  --define '__find_requires %{nil}'
+
+rpm 6 no longer supports disabling the internal dependency generator
+for v6 format packages, making pkgconfigdeps.sh active for the first
+time in the OE cross-build environment.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index 1cab58169..f9a3b7c21 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -1,5 +1,14 @@
+ #!/bin/bash
+ 
++# Clear cross-compilation PKG_CONFIG variables that interfere with querying
++# .pc files directly from the package buildroot. In cross-build environments
++# (e.g., OpenEmbedded/Yocto), these variables point at the target sysroot and
++# cause pkg-config to fail when processing buildroot-relative .pc files.
++unset PKG_CONFIG_SYSROOT_DIR
++unset PKG_CONFIG_LIBDIR
++unset PKG_CONFIG_SYSTEM_INCLUDE_PATH
++unset PKG_CONFIG_SYSTEM_LIBRARY_PATH
++
+ pkgconfig=/usr/bin/pkg-config
+ test -x $pkgconfig || {
+     cat > /dev/null
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index e8977aa31a..c0255941ea 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch \
            "
 
 PE = "1"

