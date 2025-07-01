Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56960C83F09
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.526.1751384877774344747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5615S6If010135
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1b8te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGxveNsQ0Gy2evOgRJjeeW7owXiwr63/lUNIFShfxgW1OcRZM+z3zr27eBneei0dfqOY07NYSFKuJ31eAuPXmCMnq0/dkfxsgzGB1CyZAptWU3RzlsYbUG7nyNT8aZU7iPU8M0ffLg1R1BpDZM6rDFfd/Jzsn87IaoZTeWMafIdgX8Xt/d5tJJs7WSDxvV14+Ef+Ij6cyVwyRfAjUlESvh9WMzeuEwfkOQCxpaus54sKwsviTIuI3Z/nBp7bR+CNcoryoYCgZN0FXk9+uT/dh3z1+bKOCEAvpafl1QIsauzm3kfptgE+FLJj6MvHeN3+VGE/b3PweJg5Vhs0sHN7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTJsD0i7pAUyBgoj73+ku4QJjRqK2/sW1+APGPkpQ/o=;
 b=ZU1K6p3BQgAyCOfhIHrv3J+pZekgC+gvzDkfUlufR2/odU0U7HpEBW/n3aU8GDacJqUS/RSmWMv+xOX1Sr+ceKLPYTrCst8XIrZ9L4r2QTLW81TpO2GD2vYiumBI6Ks6SRmVookmRyQxllFRAjqNVX7qmiuZddYi40rfCYhV97bqZuUCM0BoV9s7RhHMRLADdpMbhGAtzGIXq8Ze2ml7Ps0hGOa8UXkRTsuNx/w1xeUs6qsBOXsAzQP9iJt3YpVvBAE1Opa8YdomIedJir5MzeEaBg4Pj56oT498j6Gxh6DJ9GbpUK/AU3lVJaqh5yuMP82avJkl3TJzcsA+mHWFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:55 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] libgcrypt: drop -unknown suffix from version number
Date: Tue,  1 Jul 2025 23:47:27 +0800
Message-Id: <20250701154731.1465906-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2308dc7c-e3a2-48b2-e01b-08ddb8b6a4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AOMLRy4yf4c5vazYR/0xXLam/oLLxYa2PU/2eT9ul1wtgMBcv3zPkEdlFdG5?=
 =?us-ascii?Q?pUrCwm8iZvbcvlbgC7aZyWhBDiaXSDNcUbQd+l7bou///WGpTHIUeOHBoBfX?=
 =?us-ascii?Q?3+yKENwtIyHcVYScYZlWTN+8dgppSskxDBl5sWnusNkModK02CS58RmlO3J+?=
 =?us-ascii?Q?7lEpJEsSeCKNgSqMSfe5fSbImIocC7+hchxKNTxKIXZ/E/vwWESAd8Bd4dvH?=
 =?us-ascii?Q?4d+dX0/WpNepj+mW/2DpTE0tTJxGQAPNx6jKTYbWNqPArxbJ6MT4MY3+wiwo?=
 =?us-ascii?Q?lqvaICKY24hzvqMV2LpW3kUd+MdljMqxmlcysaYEKOVzFygwFhW8zMOnYZLV?=
 =?us-ascii?Q?7/WxjkTsW3pNz07KmEcswjgUTmONmIIiUTyEHsoO+7IRz0WTKeT0O8qbVCPY?=
 =?us-ascii?Q?BmXQZjlb2IBaGzNm84VwEchJBTTMsZF+lO2brr4Y7CjWg/GgP1q5gViYvoPM?=
 =?us-ascii?Q?SD/4/ZyP4jdHNwe5+M+MNbeQb47g+lHwdZDv04iT2vuUaN1Otdkiyb604ajF?=
 =?us-ascii?Q?EFbjbLx7In1BX/AdrYtxm9RfICIZQgepGSSqhEbgpMwL4OEx5H9wqAJ8lIzY?=
 =?us-ascii?Q?/N1t9zUa3Qfhi7uLbsOGq5akd9G4Ulqrt+wg2Bbml09PDwF0qk7as7dyeRVz?=
 =?us-ascii?Q?wFFRD1syMuHPj7rp/bgEPINduMYz718BH2r5JyCGxNwrJP/EUBLATZfJCfbK?=
 =?us-ascii?Q?6dZrCJRFrLwlUErN1gTmlqooR3VulNZFuQhi7O3C4QZPdqbtXew4wMZbZ2Qs?=
 =?us-ascii?Q?a6VxCCXZrnfgvh6oesJ17aGved/Z2qjF2rl6GPmlpQ4czxnSRyeCdaSK3nJp?=
 =?us-ascii?Q?HB9mvU0pN9y/I+BpLlHx+4qVYuDPh03mzzrUFkP5Z+yxoSh9MKw2JGLGgmmO?=
 =?us-ascii?Q?hX49B5FquhMoBnG+PlP2HLzINcBHB+XhdjIQyBN/L1qmXx4ZqqrzKyXhIZo1?=
 =?us-ascii?Q?nwb1SAbAjq7LaCuVc0y9FREjaJcCrYftlO5Ox/Yqbwv/jgqGhQDqhcUqBEqW?=
 =?us-ascii?Q?PLUA7l2KlV0eP6HffzViDPjLWieebbplZa4FQ3QLgeq62PfoEuv5Ya7WIPLg?=
 =?us-ascii?Q?3Yh3N8hNkR99KO8+43UQt6+U71zNhjfCKJH6DbiJbrKotT4yvjUFXRA2zghE?=
 =?us-ascii?Q?KzklWgj/YNZ4ta47YeVxraflgYzDz58C2kQBlXifl+sIYWIXFnljx+vNMvnk?=
 =?us-ascii?Q?pwhPJjD3yH5tZwhtSiF5Ywu7yK8lkhreQ4kmplh8EiL5Y1IMmw6JtzB/33Lg?=
 =?us-ascii?Q?XNjfMfk7Kxh76Hv0/OQPYcQ5Gc+1oleEz7acy+oRj9dSbpPdzHf/nMvXKFxh?=
 =?us-ascii?Q?O2dU+0lx6fhazKsxeeSF2H9lkfBL4Tbx8UvehqC5ENf98kCPNF3CtEQ4IOA4?=
 =?us-ascii?Q?82/rIY9Y7qcSQc1+M7XutCsxrhOupKPYQ3Gs+lOS1Te3UA9XlALFGynvGS/t?=
 =?us-ascii?Q?LBuYmoeBSfa3+KwxSxSs/yP5mJVZZ9VChcxhJo4wHK1dPvYZcv5mpA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jx2lT67OqGT6QqVy7UlXpejSLS8wHGqYQusrx5IUT7EV8Y+opzQH2rnfPufU?=
 =?us-ascii?Q?O0tA4xjFRLdeOWRiU6aF2kUaTaBLmEEINka4D0iuT6CTj0dv7tBiWld4T/3c?=
 =?us-ascii?Q?b/WT+OnRI4dbb6+0YE/IJapdMNN1mYOGgdrvOqIOmReQ5FUmVsn6dBPYmw2j?=
 =?us-ascii?Q?5nKFs85SdgDvv3gQNAwNSRK4BKMztfpsrMtOVswcJH8vmC4NYkHEPmfcmUxA?=
 =?us-ascii?Q?Iwq7dsNzUOi7Cf+oiW7IdQPfEDIzsnOO8zf/EhM6LfemkJO7BqWKw3dCOcw6?=
 =?us-ascii?Q?QPpw+VZfaupS1JjWZblKcdB7HP0/MDU1sYLGcnKgRS8+2FEplFVoNzvfbMF8?=
 =?us-ascii?Q?Y55y7263QfQc0jT+Pu9aElsyIENYDvXaam5vjCNAt9lgsY+nZuHb8aUy63rw?=
 =?us-ascii?Q?JqpfavqFC67rWmlwsiZVXN/oRq9af33r9CdMF72fyAOl+YHTZWMk8tLG7hGu?=
 =?us-ascii?Q?+aEKDVmj67c7H2u69kuyYLLVELBr+m01OlnOcGqt8+qH7HnO0HtiA6Du+jty?=
 =?us-ascii?Q?IGz/IAdomjdEshsnorZBOaRtSnStN2EhCRqzYj3Q5p3bLU/BStPo74+OGxrz?=
 =?us-ascii?Q?+Lq5959CHRGWvKxbSG0OQfb7rY78jeRcZArWIXSHlpR/VXoVvxCJbfSC6zGY?=
 =?us-ascii?Q?GChdrOv96ErsiWhOW/i5ELHyAvihaT4mcETBVZehm5O/wsuUWA3KvrUWDcCd?=
 =?us-ascii?Q?ATsUWXUZdKomnx3S6bSDQQbc2UObN2UeOqhB6SC5RNmtKJdtZDZyBVPNhynC?=
 =?us-ascii?Q?y0C/TZTR8WJby3hscaW8AB/VWh3WjbQbMTUD9Z4Alp99/VvnrSg8CO7ldiJH?=
 =?us-ascii?Q?8uUTuz/CFCm9WiJTAp1EjnGX76+uMo9CV1BdcOZtOrLCw1rTgqNU2lxBrAzR?=
 =?us-ascii?Q?1PhFb60F2gKdcTGO/2lUNcVSO9CXrD053JYslbY6MAfxpu4J/Vy030FDqjUs?=
 =?us-ascii?Q?02SuXhcvshwhzMMo0M7fOihMSurAKFZazYbR5gssje0PWlI5DaRol+MBJ7an?=
 =?us-ascii?Q?YOo6R3Ma6JaTAwSEbPTDNw4QXrN1dB0MU7mwveyJ7urKsqItAu/obekVR/ZG?=
 =?us-ascii?Q?/ue8DFRiFsJAcoZ1ORyRH82XWIUtDBZ5fVCzffNEJFvYVqb4sS5q4LZvTxNt?=
 =?us-ascii?Q?btHUUxHXl44cP8VxcijYtcRtWe4pfIDMXzOLAeiqoRl/jRJYeTx28VzAfAK3?=
 =?us-ascii?Q?i+V/o6olXGz7Ldgr62wNIjwwpmo319vyJWdwaP7sGR8OV6HGkTZwl6I0DeQd?=
 =?us-ascii?Q?Qdwx3buvK3ul3iVoOWZmIFNq6s4e0bVpNMPY5eDxf7YwwEvaGG9frEVFxcTZ?=
 =?us-ascii?Q?gO/WPElh0EeNhjHxI6aQCfqmyRSAjdDYlaAOp7o4yDmsrZ+HhnwYEPA6qGS6?=
 =?us-ascii?Q?MRZ95ZYKDnk8Ef5xsKeb+7ica3NMd77+B8XJhdOc02q1zgtEIkj6KdyZXk3x?=
 =?us-ascii?Q?lHU2odu6yvycaFjuacHE5WkwkATpJypoO4KZ1KrPPVkAM7Y0wDuLnPELI/pU?=
 =?us-ascii?Q?vGWqQOUeXiBcRkwZeOmyYcHhzx2aqmczUOh/Q974ZNvzFG2LUIjJ7rhZTXKK?=
 =?us-ascii?Q?m9gtSdaBZGhuJkFMPO7sjdxnSYSzf7jP1mZ+GgOE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2308dc7c-e3a2-48b2-e01b-08ddb8b6a4f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:55.0914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YavsS+C1FwLsO0KV2wPKjU1qupN+V/foD/wAL9n+t2wvNtBK8+6yOPfNtMkiHV7qORdT2s622bJYANN4jbUBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfX/G2/jN5adj5J Gmr7jC256bTjT4oIgzjyhcr27LxrayOVn3Bmhr32DdWBkg064VffIX8ya0h9Qk/NAPV4yyAOAu1 ljtHFMTTSIadtix2ATPexG5zFcL8uQTp732TUABPDnOlqB+B/u6ANRFJ9Jhab9Z2QpOJhMaRg/d
 pX2jHaE2TLVA7azanNuGrwpYAt3TsV6lPMg+lTsivKvIHhqKIlqrgajb9+7FBOJ/db7KaFKjFHd gjlblGj2gGltMcDruhnKDqCs+Du7Asv5HRobXJL2kkNrCh9aQhCdndpWrwdLDdY6ApF8sRSf/Mc sXRBE5aa2RcDCIyQKusCG6HD2XQNr7MKuUDVTawZH97wEXzW1dVcqpgOEXkDKfXi06W+F+RzEok
 sDwZU7Tc2HpT53gOBuWsd4mBQ/P0z3ns7a/JR6NEOaL5p/lfKOMlOd6E1+nwXjQWffa8kDWY
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6864032c cx=c_pps a=LDhhUp7+I2fSpfpYFg8AXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=KFRrjPam3wu1Wt-69aUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jaPjhSkGRtyi8dbdthkdbTQJG5pTK2HR
X-Proofpoint-ORIG-GUID: jaPjhSkGRtyi8dbdthkdbTQJG5pTK2HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=746 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219593

Inherit drop-unknown-suffix to remove unknown suffix in runtime version.

Befor the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0-unknown

After the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
index 5574e8c821..b1d8b3b426 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c214
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig ptest
+inherit autotools texinfo binconfig-disabled pkgconfig ptest drop-unknown-suffix
 
 EXTRA_OECONF = "--disable-asm"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
-- 
2.34.1


