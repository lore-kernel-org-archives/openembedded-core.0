Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31823CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19595.1779885869920407788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gxlzqpl8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ndMH2633662
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=; b=
	gxlzqpl8Sb+bVAspgETchzqPUSGlOHisstjgSbLajtiP09i8Y+v6UgpHzsd5uXN7
	6XDkjaLUseIkNVZptyiJZJ3lGMdyjpXQfnTG5VHYekwe4LDnbr/F7+C3hQpyDmks
	FHamr55eHX+8m8Oww9QJ7JPomQisRv4OVesLA2lK1u2vSJaQ/JNKMo6d0+U2uzLU
	w/0E9fc1gNXhlgySrbnlibNod5RogOTO5Y+ryb5DzJjyW+XGRQVNtsbb7bCZKtsd
	LdvWjw2uqHLjUqTKEMnKQ68qzwJ9/ZU1+XFU7VpWy6icV6P7kbDorSeyoL9OhcXx
	d7W0wMF+kRgWiiHlm2sS9Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dvx5-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeP8AOSDzV9s6NTJVcJs/FZReLYL0S0XUF3C3siI/eTTDDssO9cXYwj/QUHUaEc7IFvdOeKRosEUdeRPTQAFV2JUlIrXGG98bsuYEMfhEw4Ak3e6SOEt9haSZicaCoDp3bgK7rLYdoFgMEQHl3xIhul4GObT3SRrFdrN12Qgsq3tmmLCo5LEgJF52LMChsAL9bjodUrfhBRVHG59ARzjd8shRhX8TffkWIm72HkSndUPll/zGygbo1tWLuRFOrAgDu02KVu19nNyA0FrbfCxLB5eaD2C+0J7rz/X4LPPkKWVc0kqGyCcZYh+JLdcpZD0HSW/LBLUEVnliGUY2a/jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=;
 b=YFzzsq/bUPU8mubGMzft7lzkm3LDJYPAAf0sHUydNIQaXzFKbFY7e7IW29PNBQvlYQsGOnGx0cCdoO1UaWXzgBfiKEUDOXJmqCmfS7EtFxlHtcAm70V8cPWfAIuYJOZrXu8iVGiCz3qcb9cmshbRyxI+YLc5HvdKoXMlXyzykwbwuzPax5wHudSKNaXK+nUG+FR7BRWDGYKIIMQkXtNZAK3OHv00/I5LMDKzaSuq43+WducXJc7w1MJF464Jk0LptIbl4OCHnMYRbWWt4xm7+99FVHtby9RFZxCUzgp9NQTkFjo7WY4dul49/hVxHO/3g/Cd1zShQRFCh3exJQ5xMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH8PR11MB9973.namprd11.prod.outlook.com (2603:10b6:510:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 12:44:27 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:26 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 2/7] gcc-runtime: disable automatic libatomic linking during build
Date: Wed, 27 May 2026 05:44:09 -0700
Message-ID: <20260527124414.1728434-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH8PR11MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4efcc0-b743-4921-8a57-08debbedaff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|6133799003|38350700014|11063799006|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lv6COv2ND5KPUUSmL+pW3k8y+rO+J4vEjVI/epATur6Flj+y53tMN35jkX8pqcZcg6sJx28n1YJVXbKlw60eGdgdFGWooKRYfW7ERJoBKZ4JygPNNFfLcbk8QEQ8ba/C2MeTrP4+3l0VHU2gafoJLnwE93j3+oqL/rOPnkVtRLrvexETTYDxFGBX03Ghh+7c22QuQltYDJ72kSoWUoK21pRCI7rClo7kkNJBkUajaTvF48svqoap7R2BgR/CKicwi8oPkvmUjUs4DMP598pBcuikGPvw5KmK+FQ+MMZodGY6wRb9AcUbyz5Sas0BxuL5NHj53ZgGUvXT2sDpa6cjy1uAw/l+4YP7ZneebvzsfK+CmnzsI96KMG53qKfUYq76rh9DQ2GhsIMBuC/JyLbZZOIhJ6God7rnpTvdZINJCP4sf5mNjP+OXqwH5b3I2JTGq7YWY83D+pbD0sssUR01/QKPlXedphG6wdKMfP74o6ah+dghhS3EXkJYQvJJ5kSfzMcsmQ8zWFMp7d0zPPFF5YO+4l9LJftkYD0wTNwB3gWmtC4yE+Y2VWrufk96pdWyBmHvCbUf3bgws1AbJBZMEAm63vbBe3d6qgQlnh+0s5TLe4znZC3k6z+XriT5iRt0pxhSL3p+qpWTQlmWLSJsmLNLVyH4kl3BdRb4JWrVPWBn4hYdBbAraGoR24+Rp7EDX3NK1ikcBG8j8IaYEUZqGc2HQ/U3Ndt5UJqTDJ1jxH48Ct/q7bXlnm4qvqj02Lzk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(6133799003)(38350700014)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iIJjcdew/8aczsW+6U1pGq51tANRIvu8jdFeiHIqcXn94YcATe8jsHlIE1yY?=
 =?us-ascii?Q?o8QMg7fgYUPBDxjU5SLdOwOacz6j+MwVfn/qUKvCu96s0I9O1mqZWsatofFu?=
 =?us-ascii?Q?z4O4ycc6P7T1X6t3/0J3tDrknRHrVBYmELVHRnhIfK1camt2T3lihuNLJ7bp?=
 =?us-ascii?Q?5cra/yvXPEOR6sVxEPAAVm5PT3+tcMXng2JYoOzSRmnWCjZ1oZkk64wsbo+5?=
 =?us-ascii?Q?hY9PMtIVPrKvHbaSbYYCzUfMR3/5DS8qZmEJwgvelw+jSKcvUqbeKISRR6Zh?=
 =?us-ascii?Q?+hBPKZuPmlIiHXi6k0LTcAgsBgg5jcRjnw5cmc9iTqteT8eyR4EYdyt5D5l5?=
 =?us-ascii?Q?vski/+/6IbNE54AsKeI7qjZJUcMmW360Is/eKl8wzbFFbt5UndCds3uvfslB?=
 =?us-ascii?Q?EjqbYzpgDlzid1shvQ1vhR57s6ffQRnTyyxXy/wk4MEUZ/6Dr9ZTe1P1NLqU?=
 =?us-ascii?Q?haEGQG/Hw2C9rIZh977L1jrKinmWl9tZMvsb7IvH51moTBZO2u/3g3nyXxWF?=
 =?us-ascii?Q?EKyhyQIwKMydI4EJjgFU7D1hp/bBUAZsWEthYfCLc4RPEDmg5EXWmdY2YjHW?=
 =?us-ascii?Q?IQZXyXE5yWgidBfnyQLCr8mY+i76aKjSAH3fx3gIT2s28Nejv07e738vp/+v?=
 =?us-ascii?Q?JJq9PjFIFkdB7lkFiv3Zv2AbNVhkcqSQQonDxussUq1iMZZYzart3mQEyXfw?=
 =?us-ascii?Q?sqW8BSQ+fz3h2EcjyaJdge/VyXjFHwh7RrIMkRxw73Fqv0MyisfphfDm4Xz6?=
 =?us-ascii?Q?zlN+eLNSluSaoDIt3Uief1pr94kchDY5SD2NZnnkFAbR/v+s3tVcOei9Fjsi?=
 =?us-ascii?Q?Hx9B+J9huHyPMyp+gOIALzgtEMjWg5Rad2URn6VLlgEhP4OkO2nf3RizLyIZ?=
 =?us-ascii?Q?61k+X4JJwhYR96jmkGXByi+yG7unYoP8T5XsadvF6X7aG509lGygU3ygBYnT?=
 =?us-ascii?Q?OTs3ZX25UGiMiCu8QO9SAY2+GqNWcA2raKFup/ysOCgj7s9TiXsC9e9iC5DV?=
 =?us-ascii?Q?38ukb+udSdPFHyvNs6Lc1U4PTAice0Tm97otE4pVe4NaTeYsSSr0SuOYdXpJ?=
 =?us-ascii?Q?q/954bdI6I9a3e8ZuM//WDiGzSEaWPIl/HXDZQ8ASzUtrcFgPi182AIfbJxC?=
 =?us-ascii?Q?MuiYbWeKJNo49DKSE9QKY+Bj5+q8q1bVmHsBVPdTt79NsXJe9hwmNwwhrnyn?=
 =?us-ascii?Q?XNXFJJU9+OGSd85YZN/cP50S+EhCnF2EDcM8nmmajKdcO0nGYhZqoil6DKKG?=
 =?us-ascii?Q?NASQeKtK1kQVOCkixaYTGa2QU95y4bG2UGzhaqbzpkNEh6kHSyLzyBOnNp7Y?=
 =?us-ascii?Q?xX7dCV3HMODUkN/cITMl4umFcPhxF6k2tR40lI5wuU0NdURulOa+hoqZL1xQ?=
 =?us-ascii?Q?9bjmnsswC2A5Xit+gOhLK83KEdssUFSTpQqSwTmjvTmARtox1YqbDa9EAJV9?=
 =?us-ascii?Q?ZM3YQlD3treDjeWZl2xbKWvd3A99NIz9nOkapu1A2CNN64ztKulHGmdqGOjQ?=
 =?us-ascii?Q?8S1jLGKsHR0TSENw6N6oZTX/bFONxjmIs4LhTQauOKZu8IbpRl/BmlI3cnkn?=
 =?us-ascii?Q?rgMmqHuDqx2nLDf6pTprrPjFDH9b4G8C22F8ullmmJF3/qArkDjNabDMPPRQ?=
 =?us-ascii?Q?ebfrXs3dqiv9SLBjafF3lvm/kA3rPfwGfmXcslV4CQay1Ct4SG24/I1Bunsx?=
 =?us-ascii?Q?XU7pTRWmxUDr7WGCeGl7LBxHILwojITObuFjTrWcvUaiVW1oK205MOZVaRd3?=
 =?us-ascii?Q?h4G9xq+/V511B4qktSkLrgxbQQeIpBE=3D?=
X-Exchange-RoutingPolicyChecked: 
	UlZvb3q90GbCj2Fr6BE0rVJ/FkdgvvlkRTkxdhmwVZK4jdOJa5wHAFi/3TIiwG53C5S28HMIfTD32ntr2m+KmpYsewMp9wVtEm9yoiHte2J4fdF+NdDtZWmFcymoI1EAOrjyZleddaH5Y52kDqv3FvlDSMIXIylGOjj4ma4y/hrYT51BCnVjXSpFbwIzAvep25RxOwx7lXUNy7GabBWT5lC3dY+QAn/Ayki/ZN8gPnALxnSFKQsLMRbstXIzHvQLCWg/TneLfaFTyBM4bxCekRES+C2zHe4/7yCZ2VxvuZvOlLmkY0lNTkz2GMslYh1KiC3yPRKpvONC85XFAsydTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4efcc0-b743-4921-8a57-08debbedaff4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:26.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxmjbEYcpJtZWQe016Gz9lFcf8X9aScraK0PercHfamfcF4P/6nQeDwuH279MCQN/lXcMs14GtWIzjlZ5aaD9puaEamLOSK/faqfYda0bek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9973
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyMyBTYWx0ZWRfX+Q03farKfzHt
 lPWdL2Xsg3nd+TLwVl4wZ8XECrGUv8R5X+C+sDFpz6Y3k2nsL0F+XgruY1Dg4gcKiQ2l9EJgmFe
 kuLWDcEb8QLE4iNnwkul0G2povbY8uPH0CnILduiO02OJdCLySIPB8fWLqW5xETTaJSfF5BzwFJ
 fK7KFMzKGlIazO7LEoJoBI1iNKvr3r7vTfxNmmkjuPDGPzy9GYyaXt9VpOpbLm86JF3S+2jtGmZ
 9X64ltb+XD1n9XHo9Y2+dVlMbbFaZCoNorKLpvBFymJGrRbFmxEUVzdcqaJSL86aZi+AW1nLT/y
 RqxvhAjrIH8VkVB7Waou+lipNHr7T+JQ5D/GWiWPGpdNGgb20ALlJTFb++Z8am6N+da97/ztoO0
 QCNb0+f0a5Or1XutlOBZQi+jBEiu6jI5CdGZGaJhLNeJ560bDL9dnwe5+7uLvCA2RIflj9N6O2F
 17vpHk/cS4J9vnJ5tzA==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16e72c cx=c_pps
 a=4QVYENZnsEoURNel/cbnog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=0SpPGjiuViyywlX_MzsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KKelEXpIotSzmSDxUYdYU096tSNC4EZc
X-Proofpoint-ORIG-GUID: KKelEXpIotSzmSDxUYdYU096tSNC4EZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237650

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


