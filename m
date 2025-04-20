Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879C3C369D6
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 04:05:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3043.1745121951529799547
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Apr 2025 21:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6205c0d41f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K45cBd012818
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rqsk-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISGCpl0tBc02Ximf/SSiSsGoBwfO08+y4qQ98xSzziGOpsu/TFrtUf3yvxW5bQLn708cFy/oLztIfX9Py177DGctE3T5+x9UBZzHg//sQaKTn/rDBlFBRybu9yttmzuukgKluoat5CEuxgacQWGenYm5cmATGp4AVRt+PNE0GZxSsZNQ+eyS5lMapTeks6D2zn1u8AkLh+nNcwNo7x9AsBJgqrEMiMIg7FZqJ2FPCpXPC3RsEb7YaKjsMzfoo0foi3EWuWx2FVIh3hohLtAq+zCzDELlBYJbnhtVfzPE32mQ2wmmIJh6UMxKVgGfXaTrz/lehUSlNpIwoXjzXhFiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHlrPOC6TyVCDsJD/oRWmlD4Z6SGM83uGkan/UyBgY0=;
 b=ovZJ3nHwBaLVLoqf3hmEaFlNpzxQEkI6DxpNqPCT/RoZOxfaPx155hrYJFEpq6Ed42JNkMX1RBTFI5/K0AJA8u1aG3zWmPmwASATBuHBcJIilE8wXberxnjI0S9FPU53Cf8IdpjQ2s6aCclMTA46IL/5UiZrN/YK02loY7oBcddZHSvmGDRqL8U8BK6zT75AMZcqRqUx5geNgG1gj1GF3F0sZwqiDt4J56C7UHirY0oI5IZRDjrJijmnW0Wt6pkBZapH+UUC9jYLieg55u6VQDvdZ+rKbn4tTuWkq+rB0WDsnZT+gkHOGCIq5N0BV3svIl6KkCtGk7WYGBBfBZIcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sun, 20 Apr
 2025 04:05:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 04:05:47 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 4/5] image/populate_sdk.bbclass: drop qemuwrapper-cross from DEPENDS
Date: Sun, 20 Apr 2025 12:05:27 +0800
Message-Id: <20250420040528.4012613-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250420040528.4012613-1-Qi.Chen@windriver.com>
References: <20250420040528.4012613-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c532d1-baf8-43e3-1e76-08dd7fc0a14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QJFIEizs+RQb/zfKTUj1Xz59KhjZT9VavCRpbYhcqM61AB+3uQiIVbkF/+0k?=
 =?us-ascii?Q?gaDdonTMsP8m77zSWnsaWBeIUv1as3GMXiUsj5gxH3+VHzMMhkA6uw8B8u8u?=
 =?us-ascii?Q?XEGrztDh4ugz2FL3ryEBY/Cjzu94vcFFbQ03rr4tfEfHSHaJO1NkVq18irsm?=
 =?us-ascii?Q?60I9RixF6ZCTdgZhAFkcS2d06MXlh1FL/SeNmNLMinlGRu9YtLWjEg3P/Pmu?=
 =?us-ascii?Q?5gC4qlDgzKBNeAyC/H0ROzgKr1C2HeRkYxVh9a5puC4bc7OP1q3+Xi2R2SZu?=
 =?us-ascii?Q?n93W9vUfYuBm5PRV+l/xC1AyxUeEvgHp9YHarBTSCwkgyOiHPfehCjs8ztYq?=
 =?us-ascii?Q?IrK9jfgrK1uluJviKLJkdezHbb7c0j3nhYmB/Llt+QOnDtYbq5iMAxfP/8nh?=
 =?us-ascii?Q?OhF17IG2xw8cqXlPwEZ59JTQkms5HW4PZI6uJnRSmWrFuD/w0Ln+HwyWcgZ6?=
 =?us-ascii?Q?9Jm2IVW3Kzg6fDp2DRAMIVTRjWgHbBlUmUbzDPGVQMtPS2VSEyw2kQth/TKR?=
 =?us-ascii?Q?RTBFyVsVfHRfXGx3xnNM8EVd+Cc2A8Jvw3XE6pWXTMku5PBB1lEhhx3crMBw?=
 =?us-ascii?Q?IVPbfc7mLuBbr1uSHw7nj/sy/jS8+2bVMb+5VZuoow+Q8NGgeug8GLQR+BrW?=
 =?us-ascii?Q?QWoUE3k4DUZaGg3bi92KGQF0q4d0kWdeU82tIlV/guUH2mOolqqPMixJd5tj?=
 =?us-ascii?Q?WM7Cn3NxandC/MMminkW8jgB5i5Ov8kAj0ZcSD0bFpWt2VbtyArHsEPvUf3a?=
 =?us-ascii?Q?q961KojM2pd4wupI6VfrPv6BDD/3XJEC5Bd46I4tad4Dc093m4QCi00P79Ju?=
 =?us-ascii?Q?yoodPMaGhUSP6XBwFe80pCjzWVVK/UNp+H5bxlUSfGh0OG7N73d7dfIQoP4o?=
 =?us-ascii?Q?6uU8M5+oIRNh/UB6CU7qan4ttP4lHbyr7FQX8p68hO9IA8hAuMehrni2sU8C?=
 =?us-ascii?Q?L5Jqi6pBxa+3iFalbbk/2shUGVqvQziNVavqq/oguTU3UIeBF4O53pPTu3rF?=
 =?us-ascii?Q?aVLC34SsgT+E7hK+zEW6qkE5H6HupzJu255yKPUC1YsPgkA4mxJZYcpQoBdh?=
 =?us-ascii?Q?hSwC43ngewtHldUHy00GXq2oh3XJnmqgxnWDSm9qaxbc/JsHub4CeB6k714w?=
 =?us-ascii?Q?QcI3UuKwQtP5/SL//Tn0wXl9ixNUkS2htTLxsnH/86qqtc7agzr24kECqGqs?=
 =?us-ascii?Q?mGao7rkGuZLwhVz/q7kZdB4A1yDaf2A23pAW1UQ5rZemeKS/5CmzFot18Dsg?=
 =?us-ascii?Q?6C7auicvQln+SstCkTbwjtyOxddQMEhycadTPMw34AxJ75ES8DbQu/Atvu4z?=
 =?us-ascii?Q?LGk4A3DI4ftxsnFDTt6Ktun0uzm0pQkbe5jNHIa6sXGlleKBW9XO6gpUR77F?=
 =?us-ascii?Q?Ducts5rHFR1nqIU55DTn+6Qkqyd3GadBAE9/LkTObl0i+4D9HqocfIRieyDt?=
 =?us-ascii?Q?rew3DyXm2WK+R9x5e2dOuKWHVyQOytAQnsY29hRR0yYrvTDhekWK8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1TSiwaqXierrRGCyCFC0ccd9Jfjr/hZ9CBYFCgnHXLGA7kVEm3StOwi2cBkW?=
 =?us-ascii?Q?dsT+MGQzw7qRioEsBkyv37d+/cUsEzSGrZVenFd/ZAXBPntLF/NXkgMS/t0y?=
 =?us-ascii?Q?7MhIAXi08er3GCodzIQ1lfwOIVuZYrT2GSkZhRpUVscMcQ6VqmiFFAuLtTS/?=
 =?us-ascii?Q?JTY8oFkezxLcYyx36zdI0GY41W85gKLzgscyGBGQ9HSeptSvhgiIRgl9v3af?=
 =?us-ascii?Q?6ptdgAmUjgo503jACPgvNeVR8Pw3Q8hJcjsnAg9gkCMhl/MZyWov6IIH0w0i?=
 =?us-ascii?Q?Gky+ss0bIyFG7QfTAXtx5hVoVTzYbhTmj0YxhjLvtdq9zKR4OOAK4KlHd5VO?=
 =?us-ascii?Q?0D6TYSc7umBtLrvrYnYk4iPvWbVAizoyPL7YUzDTUIjUc3QXRkH85viFblWL?=
 =?us-ascii?Q?hwHcVz/TtLmV7TBQo99+Rj/fyhDD2tF1Gx2soQ2/Cz56mnKDRFlFoNNXQful?=
 =?us-ascii?Q?lVTpqhOzZBeXSuIfgskRe+cTY/3W5Dt+46zXB8RPAY1jIst0+B17Kk9+ve38?=
 =?us-ascii?Q?2GGO+qdV+j8xQx4wQMU7G+LQ6BYMRoGsrauBSNhOhBKHNoQ21grw10thiXUN?=
 =?us-ascii?Q?WK2mfk7BGTf479Qt+bu2Rc0VNs1yYfHLmwzsPQK1mHoSDxjjdVBAFcsZ36pM?=
 =?us-ascii?Q?VAnCVj3DXunkL60zwji6zxGUFNQyJ/NpTyNTNWcB4bKXKV90EIqwSuPOCMuD?=
 =?us-ascii?Q?1X/i8/Eibe8CB9+gNwvSaqyZco367Hy/G6qqniL+csczJoQgh3aFQ/Ekhz9d?=
 =?us-ascii?Q?xTy+PDKWqttylWdy3OFRQak84NcZN5iAVRWaB1DbO4WWqO7FhdKH4VD5LYeV?=
 =?us-ascii?Q?w4fdCWDzdzQRcoDJmJNjND8Z/DcXjWh13cOXE01Xl4C5i3fhe6/kG+l+p5X2?=
 =?us-ascii?Q?JwTWtMeoE/Sf9yNdm+9uRnYTini6w6CdvX2dTYRwwTFipSCjj0e0L8KCeMEm?=
 =?us-ascii?Q?sXRzUnLURBUXyrP93n/zc/WakNeuKZR4boUB/yoCxNgqxxcZBoqwntHzKMJx?=
 =?us-ascii?Q?jkOkPvk5Ah26AQ3viHLEiEOfwim/08syURWG7oBH3SxWqX/Z7QDD+aeFn5za?=
 =?us-ascii?Q?a8pqoTLtb91fS3BxwCx2crdk2RB0rXqlb6sFEwpv6OFtLmV2MKrQm9nrKOBl?=
 =?us-ascii?Q?uUkvz7wQypOlA19aNb1aW7NWmta0qfHOEB8JlpR+tbmVoqnHnqlYgmdVFtQI?=
 =?us-ascii?Q?bUpsAgbZcLM3zxU8K7Ndfune4qmEBBZgS7yCkRv3hDtO2SEgQxyIukBxICI3?=
 =?us-ascii?Q?MkQwobe6Iy59MFm1ZQzFQlA5zlpambIssW7Taw3QWjm8A1q/bk3xyAC4PngO?=
 =?us-ascii?Q?6Nn7wIIvhpW4GKbqS3l3HxGbgPzCWNkFuc4TE1rlLNeNkrC8u5Vk1jGlWJya?=
 =?us-ascii?Q?TbO7Zvop9Egxkg1IuD1Dm/jcSfD7DkptCfWKT0cI9wRMgNGfEKQm1ezOGIIQ?=
 =?us-ascii?Q?D89JC3KZ3VqwxUN6PLQ8DnxayHL8M6yh+KGjil0Lv2wumj31f6n7JbwkBq7k?=
 =?us-ascii?Q?Dsa+pYNykLZHvU0Po5UrC4tap96iCMHwUvpqFxpIlOBH8hC45hjClvhMehKy?=
 =?us-ascii?Q?GV3bPUosf/kxICbZ9xXl45BM7nQRLz2u8hfikMhj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c532d1-baf8-43e3-1e76-08dd7fc0a14e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 04:05:47.4883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unmJhMC3Amcs5QNTzcDxzzeJ3PE9Z21lB/xuT0p/5t39VD1N5DYH+PRbeykArUJsiVVhPe4d5lqY3icOGPd/Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-ORIG-GUID: CsdpapCOPFyero7tOGoTK2MsYJxhnnZl
X-Proofpoint-GUID: CsdpapCOPFyero7tOGoTK2MsYJxhnnZl
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6804729e cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=20Y_Kt9r-2Gad0TaIGMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215148

From: Chen Qi <Qi.Chen@windriver.com>

For packages that need qemuwrapper-cross, they should have it
in PAKAGE_WRITE_DEPS.

Now that we've used 'qemuwrapper-cross' to replace 'qemu-native'
for recipes that need qemu-native for their postinsts, and we've
now mapped PACKAGE_WRITE_DEPS for nativesdk recipes, these
qemuwrapper-cross dependencies can be dropped from image.bbclass
and populate_sdk.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/image.bbclass             | 2 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 378d3bd0d4..dc4ce5c0a9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -30,7 +30,7 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks"
 
 LICENSE ?= "MIT"
 PACKAGES = ""
-DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross cross-localedef-native"
+DEPENDS += "depmodwrapper-cross cross-localedef-native"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL} ${IMAGE_INSTALL_DEBUGFS}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 PATH:prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index f111466b4c..238cb1ee6e 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -109,7 +109,7 @@ python () {
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native"
 PATH:prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS += "nativesdk-glibc-locale"
 
-- 
2.34.1


