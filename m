Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43101CD4F57
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6066.1779102232741859790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Apwj8oUi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7ob6v850289
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=; b=
	Apwj8oUi95vI9U3z5DeqjiOivRuqBQUvXTtxsTQf4qfltMu4pKHIjmD5nKMu2HQ8
	/OrmYS6qwHiGoxoVo3s0U1MguXghtrLUz5L7Ea4esixDyVI1EGq/ViKbqwdLEGMi
	vvW6f3e/AiWfSkLOXsIMxuGTQcqp7XwidE3/097MYEqohhXckaB7tY2LCVflgXh4
	ahLVZ6eKyFtRkn/uReY9E7poec8IhkZXmnmROUwaEvfGNx//vJpyGaPPm5OdFaug
	sXWJj28LxForgG3HwoI42hQCt8DJH7V6qG8QAeDLUn0jgjy8SjkwTHU6l5A//sqp
	zHIelZuNtFOHe7+4Ys2yaA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6My33oo6wu4JhThGgK+92PcMRPHvf5cXlt5oTWmMyWx79APpwAKivCIxT1GV4L6cE/Mi3w4l18Zo9t70VrD2vMUSnE2w9A3VNO9LlA7xA1OZuk+N+pHPZOs3lUz89ukjCrLHY3BySlkBDAyistz3NlKoJoxiE3Q0Mmzpo0SJzw1MLz2p9dnkO/tDa4aXN4ugtHdDLDuZTtwR5dnqTFLcfyB29U1lsCuq4fsyX7198EkEUVyI7hxEZRAk6097rO6RgwHjUdlVUaVPZ1vqLG8gf25L0rPqje1FKpPuqEaI7+8nPXd8lKoVxg6U3GkE1l75pfhNyOsKWzB+k+4pCeCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=;
 b=cqd9ScEWasNrRTT//MBtyY5H7ZbHfsmeoMQFtDQQ43ZdSTlZd8jURJtjvOPDKaWfqLBssGvEsfoZzAHHAvRSsqAlrjrKPiqUIJ7uZMAqkrSoxxNiyMNKWaOSlfBrwZokxRvIdpEsHDIdirNChjecqkwk3PM1mKv4qQQTsxWkyV1MZEAo5XdH0IUmPPRJTa9zyKJ6SavBtFLe79jtb7swd2XDfG5xO9w7RIP6zOEATsEA+zfgd3CQZfcXAH915g14QNvBVZpozLIwiebbvQj+yseHBEfJgNr/bmaOomYXc8wZfQKaLBxZd2Zs1aiQa+wOIjffhNQqTidzGu1hUny4Ew==
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
Subject: [PATCH v2 07/12] gcc-runtime: avoid passing MULTIBUILDTOP to libatomic
Date: Mon, 18 May 2026 04:03:22 -0700
Message-ID: <20260518110327.2347543-8-Hemanth.KumarMD@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c90dc6ca-3bbf-4070-0f93-08deb4cd2346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sKsW8/Uk9Y0htYIKedRIcdd7y8ebh8HUubExqUCqypQLYhV6N4l0xSdhugEaJLiyc6MNfoJ7rn4UTRnFCMheJmKEhfC2q7AL0sdvjo6tnKr7ps2oaKQNZ1VgRVRm15BxWNORq34KYHMX9ePqaTuAbRBmHVb/tBpyROZdq3Rw/YXZkjrq8x0KySwlRd4vrIKhpk+FyemVlTS+K8DQ6kxfy4hPPYQmuAOplYepKquyRso2Luy9aDexqZKCNCSqpuiUUOD+M3yyOu6woSq1Sb3d5ZWG38HTfxMU/QU7XsZ9MyZt2jjp0TvvTVx3h/8jc33NMoY5fADZIMGXeugjEMUmbkifWchP9ZoCohYzv7m7ZtQE/sMsaMM+Fx9t6sRbOS2rH8mtqLOcLlQiAUd8uRFTx5zI1JhoZBhWF0Q6rKGg7JQgSQy5D0blNfKsYE5zwgd+vMAg7EJFKbtzk8MWuvQIj5MXTlQu/rrD/W1yeodsbEZWoGhiR1FtBnofClfMbcn2faASraP93HZN3Tb7rfLsuPcLlT/yU4unjpqUUJZwQUqdwNP4L3TxNJxYbWnA4wQVYOjNJ2P5XUMnpqpQqKq/UYAZSfo2sbZqkpgYfkwMsXTHI7oJDTyF9XjdJAHwY5kXYAGJQf571FbDqsheUo1zR5Oc+NlT7aNTwkbs7j3dwdtyogwn7Or1ZzIWMkAA83w2AfkJtTuyI+/Vo9D3u/lKKzNZ7yyuH14y2tE4dg3p71Tv/fDMyf3Aqulzv24hb2TI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zjIX2h8uKbMYO0GFxvh8m/6hVfnDbxo6BLdDMX9fS/5LHLDUmPc0Hvg9SZe4?=
 =?us-ascii?Q?5G2qi8xHzsU5i5K/cuF1J4FqAFJY3A95KS4+cdJPWcYwbQTtmV+8HuUtD/aM?=
 =?us-ascii?Q?jjBt8faE3Wqwgj36QM6e1f9zLgJzWcdPSQPro7D1Hoc+7yQMlVDGMZCi/7kB?=
 =?us-ascii?Q?PJfRT4BAKFROHjwL5xglSrDPhFoEnXqFCrXvWX+Y7ezFqMJ3wnbGP4M17xKM?=
 =?us-ascii?Q?BaZSDAt8BZaJRM/WDn/uPDfkBCR7w8ZtkBTykpPjPv7ATGtGTjME7QFVlGuo?=
 =?us-ascii?Q?Kdub/ZnHGSBJ2XvYr2NeL9uUcTYUoAtkyBrCKhNsNj/2iVhCUFU3j5A0Qtb3?=
 =?us-ascii?Q?78MQubI4BDCsRGzl1Loijykc3tJpeLma2tg/qypH9Vl7+QR7FJr6KaHfs56U?=
 =?us-ascii?Q?PUjHIwT591K/YIJcaPkDQDlqsOvUGbAH5MnIIm5SmN5a5QMezPZAiSCt1Gmj?=
 =?us-ascii?Q?5ZSeBtLG28V4rvhNLzbuGfH2Mk+TtSNyOOcr60FcQHsAdAYdT7NglszyN72x?=
 =?us-ascii?Q?g6P491xbEuoAXvdwxzQi9h0beUqqfLc0QltD5sAPDR0AcLcJQd1/zA7+7LDq?=
 =?us-ascii?Q?brfey8Qot19BT8dEIb2bU2cqcYRRpeem//vtLhzbi95xp/wfKIUEQCvyMaPQ?=
 =?us-ascii?Q?uAF6+hGrpYuRpy5kx6YWrub2L88UWvBhjJiDRAC4d5+7SrqohCYIktKM+F4Y?=
 =?us-ascii?Q?WmJTIDnSE2VvdVSLg/Hwajg3+vL/EWIt+1dgsK2Rbb3k9oKVWj3LaB9iHxxb?=
 =?us-ascii?Q?K/OGuDY0tdYKZj3ernFNi50gZZEJweapoAl0217T76aWARoO2HNkWuBJv7dK?=
 =?us-ascii?Q?aIW2akWdWbKJl4F55xzWhW0s1oFg98eIsXHfXI2O8vWh2EMWIg/2mIUsRcG1?=
 =?us-ascii?Q?t2BZ25duu5ttQYIehCZP7nE57AY45hfRWGGgOF1c6I6z27lQpih6FqPbfMv5?=
 =?us-ascii?Q?aH7MMOcNnnYto+x1xUSwtMwRsVKppvDMevSakmY7SRAut5+dqe76q8jTdkgm?=
 =?us-ascii?Q?0SF0n9M7sQHoeZ4WLHUhh+eSTBnd2V/FsmliD1h02P/HmxS+nfpppvYoVaE+?=
 =?us-ascii?Q?TgcdC0hmN1Xcb5jmBgmQivb/Z522ZvmvAFSi16/9Nn8KCuVF8lbvGZ7bXKKm?=
 =?us-ascii?Q?ynPzESC0n9yGQC5Dc/MOwj4iJQpxMwTJb8baNHFV6qK+ogbL4lJfdbQ8K1Pn?=
 =?us-ascii?Q?Prker1aE4F7/HLCELmN+D4Z/KXOuJ+WGXbtsN3zEti1xOaF7XmfCszeq1QBl?=
 =?us-ascii?Q?hWGZfiSxk0xJN5ZoFWqD4hsDohZKxhg5/JK5ZHxM5jKKrnXqeI0mn8DYr97Q?=
 =?us-ascii?Q?x4gV32Lu6Flf6owVicFzmo/d+5vbUPdsm19mLsvI0iNCl62GBFQlQkHzok1q?=
 =?us-ascii?Q?jkHNZx0H4i73xVdX9PbRvf8PISsUomORib2ScgXXRPU7SXKxgfeW6mMO8Jek?=
 =?us-ascii?Q?aQE1RlQmCsSMuiMKhnwxQJMztiWp9iAmypZ208SPujSPZ6LX1EPSsixwP6bT?=
 =?us-ascii?Q?rXcCB+rR8pINgRd5EifXM0+jvi+qgF7GkjJfvbpaGj13ZyY1irgeo7FDfah/?=
 =?us-ascii?Q?813ndBia+LDG60zGxJ+5QLJRy7zakXszPnYTfevT3T7e2FaIo93qmMACd5Ao?=
 =?us-ascii?Q?ez7Co2sFDR4BHow5+72pkGTN4i9BZM/+ywLK1tCgZxbClOXI3UWA3SD4CqdO?=
 =?us-ascii?Q?dGtKXQARpJgfUM8m0DszY9R75Rurrns2uAtOfKvaIg65gNjQkrn6LZueV94w?=
 =?us-ascii?Q?OfDZCtDrCr+hm/cXTcFNnXs5dbzUz1M=3D?=
X-Exchange-RoutingPolicyChecked: 
	FSMh8TrvfIdRA1wxVY7sjnXpJDoxlv3u3g3LUgLhIl+iucghSlVs1UZe2sQZohWIQYc7cYESiZWoJbBN7i8wAfXRDHfuVItkrTvmnbhyPR6cmEktegUkOK5gTR5duZ8OxUXfJJrtqY8y8L3c1w1OE92gna+LtxRP6dUOa9P7o2IrMqSzC+DmlyFfLgbRiNGxq9fmSMrj7cCa9BGNPY942PsygaaLRTaFc2aKlQbB1N5uHK4kqtbjgUs5bjopBUcvSEX/q9LUYKVIoKrucF6A/p9s6VMxE/wsat9osO2UHTCihiN7E4bpK4R9oNzVv9psdB8xeOUefwssy0c5ses6Sw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90dc6ca-3bbf-4070-0f93-08deb4cd2346
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:48.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9d1iQKvbUUAvz1yakpv9YomkiMKdeaBCXDqu1Po5ILWqsNLm/19aAU0jyIlzreD6EFhvAAQevIbJ+vrj8sFkqQNiJOAWnEpxl8V2t9LH9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Rcl3LMLSL_2VDhuPN7mStOtIW3EDChG6
X-Proofpoint-ORIG-GUID: 9mplj1W4BaUuRHp380tXhb49_78g5sYZ
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af218 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ggAbHpMFlleW2AOwp04A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX6mCUh9tFm+hb
 zXVluFCR5H/34IQUd6mBPSkwk35bRJr+2TNud4CMQbvfbPvOvFdoDUpUZNQRdRoIK4VXaBK/fOw
 zft/0YTwpVa4WaBfmmri3/pSRYqVwJwMJq4/hBsfjpY4o7OVDcoZDbeubIDE6YfpntqV90DrNfF
 v7qjS9cF5JKrtz/6Ij3ymM0muctJHiFvwPNkPhP3PdH04XD4i3XmlVgTzlCTK7xmnYAtK71beCd
 ewd7KrZlv4oDe01JCmvWr2ipt0h1/LUJ11mDxKYrKdeBeLhUGKEK5P6J+XCcFOY3Hag6YJb8ukF
 +gWV7bsUext3kV6JX2+yfs7/sCkVmlrouYYiPELp/3d5C6hf1vO4+KUQn+SrBrtIOI/objlkzhM
 Y+OyjpxStB8gpESNfNudW8jmHT0SlwSXMQaokutwjRVa8ozOb4/jraeFkzMTlnutploQuDFugQt
 ENVFrK6NkMXiLE9iByA==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237228

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

libatomic constructs gcc_objdir using `pwd` and assumes
MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
from OE results in malformed paths during libtool install
operations in both compile and install stages.

Avoid passing MULTIBUILDTOP for libatomic and use the upstream
default handling instead.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 30b2832c82..e305180c64 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -83,14 +83,22 @@ do_configure[depends] += "${COMPILERDEP}"
 do_compile () {
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake
+		else
+			oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		fi
 	done
 }
 
 do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake 'DESTDIR=${D}' install
+		else
+			oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		fi
 	done
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
 	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
-- 
2.49.0


