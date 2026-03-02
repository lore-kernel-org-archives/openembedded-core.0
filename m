Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D43E9B360
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:43:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157703.1772448214428902309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dC+sqEX9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225lKFe1568568
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 02:43:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=M/bIk6KOkE9tWZgXO3ksqdlj9GIllwM9+Va7XaUwqBo=; b=
	dC+sqEX9+DM4hx70Gpf7Dp/vsMEKd793RkNcTYBj/pIBwiRUEY1NDr+Kh6uDwwul
	3qSo+V5/uKGySTCcVcpA4T2Gx5hnQvlI4RFH7RuX/8KVeLEHrH7XxubBW8nuqaHh
	n4HgIARKpLHqWlAzhg5apZ9YK8apt3H8v6HisBuh5C92bsljfW0/Yrn+4O/GgmGS
	pFhIwKi+w1hVyA2xPIUboyOGHOEOj7Ic9OxMq5tt+r7fIWHjNTW/FG6sXQ9k6DHb
	VV541HmprdJXuwT6/UGCpTVSgWJNJuGejRORUJ2dMKGDpnwwxu5b5I4R+nhUG7AW
	guvOsFKIqIwnQXgk35P31Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rghqnd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 02:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVL0N3GfKcOfWVRHge6MsFK9Ou9aPBMNP1N0qt0QVW4M8Wd7AbKSrS7aOqdIPRCsieCizAIfqvVYI4T2ayOodQ1CNHbbE80wgAMrBz659g9Ec3sAGjWxBMnk0QCVBQdv/ED1iaH7eVzDTMF+06pXP9iHHVGOxf6Ea0RTeRVGSAGt0yiE8lhh7uYFWEJz1rvdn89U5m3+YB3Ho/Dv03dyIYPPOOtL5PaD9UXwewZD+kgQ13flPBgGOan8vpBnhg9YG8mOVArRptltJY0Z5Q/qCpm3S/lW8JBRl4gbmStibj3vz1d4JLQrQJqo+kj6KMd111tFQI0cn3VXyEjxaJBRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/bIk6KOkE9tWZgXO3ksqdlj9GIllwM9+Va7XaUwqBo=;
 b=yx/Io8KctPVKe05MJ7WNCf9JBoauQLn+c4jr9v6sfxGLMEBV+UY9acVZa3285mQdL3qJcJvxwniJoyLU92qN+fKi1TIrHnE0po5mN5S0sUBuvJ5T5/6Rs0lyzhRCvvjnzk2sHi82o4Y8I0GjznFlFQVsNtKCufUJWW4V84BXzZLfwEcYaFdB+zCmW38G9GI3kWAg/kIAc8IplAtn+9SU2DN9xgEU54eOs/MrjeXRnSwvCGU1xqhhyjxKsqQzUJSAFbR7WS4c2MMpqMNqPKRo1rCsEUkUzHjqjMOI/1sEUpEoXcE+sf1Ur0OhePAhQVkh1FSI0msGyuzQZ23p2yIlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:43:32 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:43:32 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 2/4] clang: Use CLANG_ENABLE_TESTSUITE to enable LLVM, Clang, and LLD tests
Date: Mon,  2 Mar 2026 02:43:12 -0800
Message-ID: <20260302104314.301665-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
References: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ec1276-5aa1-42ca-e4e6-08de78488c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	EtBWrRnYtIuJzlLtBGQFRcosXa68LWQSzSJlxDB6YQzbAmbRbrxtyscIUz83Za4XXNlGmXUBLgflsuszrvOIAUSTrB+GBlGl7SHmvn6J21rf4WP+/kdXl98YTK72CZa1xL5fuqkzdvf7t/CkjkJRdLTJbOeRboZa81dgNcrMoKkhQnEJoh4Q7PXqNrnvzAbjVQdkwNaAxt9W8uWK4TKSs2krFopnlDSfAbpHeNMAJAX2vOAed+npia1/0fbw+Yn1fbucZUwIgow4CvzUldsB3PIXALuqDkNfUoZFqbIK/KcYdqtgup8dGDW8FDdqCrZsRlVrXchukjAqTkpkC0Ojz7xDpcCQoSkNHpHZG5oGlnFJDmaZ9bFkRvEiHSH8ZP4+3lzL9MnNx2vY8yytwD01KlmSj5TbsuEp2lVU8qeiAsdb+gczGdyEXsqynG4kvpzSZEVtiD7eungioqQFs9dnaiZAF25qM2CyI/OI3aTzRKP7SKz4XNdUUF9JtmuumOUeK+3eND1Fbd54e8NY1KKnGQEGR9JydanRvxVq9Cs50pb/zh+GJ67+fZfX197GqxT7x62un2fMTVyaWAgDyGbcuYtUzN0JNcMgeFX4VOVPS1LW4sT7U+uhIH59eyHVWOg2L6fkVJJg9uwpOQjkuMsXDlcnBfGYKnGacSMFmPS3E/vI9uN14WfZB37+p68JuM4361bWxO/V783dws3nYee04NM5nvbEZbepMKVlecEkP+rcG/H1GIsabY9Yp/v6eRoQyoxxtwA39Tl5DY/64GQppevOgPJX5PkY7GN5M6zeKPA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i3ZZXWbnWV6WnN8/m+3Bxbmudl0Ml8vlX9mtBeeaRIMatkY1DWCcgj0lxnJY?=
 =?us-ascii?Q?QFaNV5EY8j/V7v5qGrYf6JPEpdLOWgvdXrb6yOlVxX5jyFiH7lCfSrZhvHYy?=
 =?us-ascii?Q?L++ne+uR0E63smZmQTqY0iylyw87TCbXUkQpKQUjBDpacPGvg3A9HAx/8Kh6?=
 =?us-ascii?Q?p650CM6TD/bGzU3QKAFXVWA2tiqd+Ayto51WwqmyKYbtWz8ynmpyCw1KkjQa?=
 =?us-ascii?Q?DlThogFpok33S2GdmvpIodwKS+JVbCuRHvkEm2lVxL69cqvkZyxQPxf0TlpY?=
 =?us-ascii?Q?N7q4/O54fbzwh0u2ThrbmSFK7c/MQbOEPV/MkfDcodRHGwWKv0cTUYYXl0zi?=
 =?us-ascii?Q?jXGRcq54HIsjj2WrGAZM+cCBKTr+zASw3+x4C7ju7clrx4CLHWjOhZtE34Yr?=
 =?us-ascii?Q?MoOpatzxSshJ6aCD6zsPfAdtS0TMQmNC49N/2Q2fmv+mWc8uL5DUJYejpwFN?=
 =?us-ascii?Q?KwTCjNmjFnFfEvX9HRc2bs63JKnptFz93h3E0uNqas3QV+Akw2KzasEMb5xF?=
 =?us-ascii?Q?TETh12FOBoyRXpN1KkeAxvSacXwoPyNgLVpfatfM9aN5N/QB6Ua9Ucy0KA9g?=
 =?us-ascii?Q?ZQh++o1ZaEZ6EL67ba2Au77KjkNuMJDgug/sAUh8/QrMN+XbvAwUkpXSuCA6?=
 =?us-ascii?Q?4r1fMtaMbRA4ooEiKyJ5KjelQ+VDD5qiZ/jtkFbUn4b60DkcRAL/SZ70KS9/?=
 =?us-ascii?Q?0HTtRD1sHPUHjxnnLfDwl6jpX7Z+Plt1NQYxdaqx+GFxGR3tU3hxDwYMeRgS?=
 =?us-ascii?Q?vbCFQGWuhY+d6DFFBpfS6VgCpGMiilcmE5tPk9ZoVfgQ5FCk7kQmDCyTB/9p?=
 =?us-ascii?Q?5bXYB3yOt4Ng81InYYsHAvUkQ1AVGPJ5uLULp1RCbnXd6u4Fsi86mHI0E0K4?=
 =?us-ascii?Q?KwdJ9qubBILsg8sFOTvWhqDjkgE+dS6RZZu6kXHjNAfbmb3aXGL/2A6p3DFa?=
 =?us-ascii?Q?de1x44+rCCmW3w232QoA8u2WSbJzoctH3y6HcnQnLoo+YaS63RWE99LjBAUe?=
 =?us-ascii?Q?CY4Hc2YhajbSIyKG5XDw+48BdIiwQKGvk+qOEPW9AhKPS7ctjAE9+27KdvYm?=
 =?us-ascii?Q?S9+7YVUHNeeNoof4KE3wdlzYbgU63N1y4VdQZojsYJUlFqFAhbIVgqOD+qum?=
 =?us-ascii?Q?8s87H0mn7N7JmxGthEL39duBxFADokbOf///pVtoyflHml5Tq5B5j+YAhSPT?=
 =?us-ascii?Q?gK6HO24tjp7u1OyQVGBuGoXlmVe/sfNp+zhKMxFKyPljTx4bkTxYIhyAZhsv?=
 =?us-ascii?Q?tjLCcEamqRHoL3R2rgc/ZCCQnzXfd6uEl/lAUr9k17VLrQQRx1hab9/TwSQy?=
 =?us-ascii?Q?SK0YbjQt4CLBgHvTgxhwDF9aKz1cdBmD/K1UNyxtNYvrOKX064rSL5GDTiAB?=
 =?us-ascii?Q?1cbyLa+Am0g5Rcs6SmlX/+r41vskMGUHheE6cr60DmwIswAe+YXfgtqLvY+v?=
 =?us-ascii?Q?xf5RHii88h8A1bh/TvyT6+ZF5HJVdiYWbBVo6arGYiMhF6vuY3IOi02sY7/Y?=
 =?us-ascii?Q?7eLBtF+5GjvphjH+fl3pVEeg6CtO4PyQSZy0WDiZjxlyI+CnViYOkFc1+AgJ?=
 =?us-ascii?Q?mHAS1GJLFbYQcV8MUunmrclaTNJ4mZNGpkfYk87u4EATndj7KVUsLeoTd7OW?=
 =?us-ascii?Q?MQiuhummazRB+X2/5ph5zwn/pPbPThhSBq548B5cbu1Wts4W8PQg7FdZ5o6q?=
 =?us-ascii?Q?h054xcZm8i8sk5PIWW2GfxGMvYo7bA0KXB9C2RuZh6X5jKEvK4zTpHCx+L70?=
 =?us-ascii?Q?uRQ8BG4BCXGExhFNUUaOTI8M1z1NPIme/kw5uqyvHzxYvgpfHqCP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ec1276-5aa1-42ca-e4e6-08de78488c3e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:43:32.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 272/mfoD4IkWcx0Irry1Ccah2fbjuPx1W2I130J/+v66aFiZO7YRbXDMY1KYGxNBNpP82e3EOxhiwaUeRjW1eWULvVq6GjGVX8GJZNuSMfCa91CqDTuGzvBaMNvxWMUK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-GUID: Hhl4cZB9WLUm_1SbS1_IwnNCxZbTKwaQ
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a569d5 cx=c_pps
 a=n2iMVF0J/Egc90AivcUAPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=IfxdZDZ_SRiogsoW8RYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Hhl4cZB9WLUm_1SbS1_IwnNCxZbTKwaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX9cp2rQUFcEF2
 glhPqpB+bWUNRkKMmCsqUhWhWH/t0RRle8J6DlshBWndgw3oH8GGMtT33F4pRsL0GjFXCv/NV0o
 C6uqC/s/4QaCNUrjUBJRtPjAz//+BWKv3ZkLSG7FjlJ3mbGw9uKFpGI5qFYnd3q+UmjLwyN1p9x
 RjXaEiQ9uhjPi/1WhFnCQDnhCOjUVfx8ysR7CasKMEbjlEqs89uL3KgfP4ppVPWbDLj/ITsnoem
 rajLjwa9hKm2u2h4t3VdNidwObGfVFlaTocceGtGQJ6CJ/iRVtSTSFyPMFuRCnISh1g9fcmepEk
 kff37kUM4DsZ1SQ5A18Z/8hJrpldBorbd7qxHg/kUwY6qSZr4W8rozXjo8oZpU4sXq6AL4JvvpH
 eUk7HVSyPEN+vV6jlAMVYaDpM0Zr+JUTcOX+2LlPMHYGh3q7uD0uvE3gHKoEyk6Qb+I7kwghodz
 Cpah/8hzVgSRIRatNVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232190

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Introduce the CLANG_ENABLE_TESTSUITE variable to control building and
running tests for LLVM, Clang, and LLD. When enabled, the necessary
CMake flags are applied, and LLVM target tools required to run tests.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  8 ++++++++
 meta/recipes-devtools/clang/lld_git.bb   |  5 +++++
 meta/recipes-devtools/clang/llvm_git.bb  | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..c3eeb34159 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -77,6 +77,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+CLANG_TESTSUITE_FLAGS = "\
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('CLANG_TESTSUITE_FLAGS'), '', d)}"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..8960cac2d3 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,9 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLD_TESTSUITE_FLAGS = "-DLLVM_INCLUDE_TESTS=ON"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLD_TESTSUITE_FLAGS'), '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..e7823154b9 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -80,6 +80,18 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLVM_TESTSUITE_FLAGS = "\
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                 "
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLVM_TESTSUITE_FLAGS'), '', d) } "
+
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
 DEBUG_LEVELFLAG = "-g1"
@@ -118,7 +130,7 @@ do_install:append:class-native() {
     rm ${D}${bindir}/*-tblgen
 }
 
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', 'llvm_sysroot_preprocess_testsuite', '', d) }"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
@@ -126,6 +138,10 @@ llvm_sysroot_preprocess() {
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+llvm_sysroot_preprocess_testsuite() {
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
+}
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


