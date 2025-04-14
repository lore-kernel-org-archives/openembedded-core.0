Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA34C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 07:19:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44322.1744615134530477007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 00:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61992b229a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E4UQNN014070
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 00:18:54 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkhdh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 00:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8yZ3ePVq2Rb0jSBqkyGazJWJF4CfGRLLHSMediOqUCTR+wRZWGVngZ1o6qqogL38/1/zaA315/kOhtxMUO8NUznfsQLsaK1DU578UP915AkiI44X3U6jey671hXlAM04aaNAd8SPVKQQ7EgbwQnONlDGB9QC35xX25swATxO4Ik+RjChSYS+88bgFS6Y1Kno4sQL1P0vzU5yMFOnaVW9noho25Xpt3gC16igEfXOqkEgWOnO0H4jcLU5pOwkYVolkWhJBYiHjiONtnCQeMiZqGs2qgiPTkYIvcVVrJSDtsBO9prhu/SZYqmEI1YwCdb33FTu2/8ddcg91ZPMHSe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5IxGK3E1UUSRIaD6VLB1s7hf45iDVvRrY4bxjC9Xts=;
 b=D1/kXSixPt8iHeEPedSqUnT/Ujws6LcI2ZYPeRYwoat5KeTdSanQaLlldwagq/HznMH+y1A3hGZ9Xv78HHayrdDLjsehb4m8rs6gWygFx5OF3YXWOYD4gwsjjniSWKa36JP5MvQ67iNYq4yWkIhGZuMedUZ23ub5owFQDX1OcOBNoItAhkg8dNdPFjNpjTGFtSiTdr4g3/cWDlMkUk5P2LdJgE+jtFbG/gxkpwKaClo0wrjnKzea2kYMWr0s0GyFnp4gwnS0WQQUCKHXsZ/ze7B8sEbS7fZfbpI2Q7LjB8zQi42yzlk1OH73eM3OIinfscxjgaQPPT6qlkWQ/oMg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BL1PR11MB5221.namprd11.prod.outlook.com (2603:10b6:208:310::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 07:18:50 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 07:18:49 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][scarthgap][PATCH] glibc: Add single-threaded fast path to rand()
Date: Mon, 14 Apr 2025 15:18:33 +0800
Message-Id: <20250414071833.63063-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Type: text/plain; charset=y
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f57b9c-faec-4b12-54af-08dd7b249a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G48Q58qHzQRTLa5aes8/lI9nedeyuBkvuJ2UFs+D2bLRzkmThH2wEoRvvtch?=
 =?us-ascii?Q?2j9tNG6ZSkp0042ecWgsiQs5Uommmr+YWvMPah6j9Jf15ibxvrv//D8u1GBE?=
 =?us-ascii?Q?Q/6EsuDltF3tmAEivBwhcA7hs/qnYuNPFScXNjkKf3Nt21thAdYMSugqsLEm?=
 =?us-ascii?Q?Hd0pZBC2FwDTIG5FckYcrZ+CNuwoyUz7y2goQzJbL4h0EN3Cziu8z+E1BP6n?=
 =?us-ascii?Q?cCKaIBzD28+K8B8ituIcWhrsCWEUlxqKtcDpHr8PC/KzUF/VaNb4NWk3MK9j?=
 =?us-ascii?Q?+LXt10eAJK1gkWUV/oFxo+g/FFBcflmnw3sNcRJeX2lyaYVLGUpYRQFqCdFS?=
 =?us-ascii?Q?inb8QtvIq7DS+GmO9eS344rQybMVawbNSsfzArsH5qtooNQlAXuGZWpB9WXS?=
 =?us-ascii?Q?c65PtgQOgLvuKX3SRWBsvfXC+2ln2q8V3sT/h4/DoPBxXAtlpIu/jrdpYzzB?=
 =?us-ascii?Q?QodoH1OxlMvfJ7r6Gsg2WO4XUY4J3PKkNVsZ/BI4zj6AiZc/XLwAWikghYDd?=
 =?us-ascii?Q?KAI3LLsGhdjwBStwjeauVQKJpEGW9IaOzU3VTpWKRNuqtSNwxMlbf/qR+g89?=
 =?us-ascii?Q?JfwvpJZBCcXuedss48qvE8YCTjK2P8EUGix0A+U/YF/ocQZPIN+TB6bYGsFA?=
 =?us-ascii?Q?TgSPd4YhvMtFKrbSjs3apXC+6Wa4S96y+pyGKNo4I2LuehRXL+hw6wGg2SfI?=
 =?us-ascii?Q?WdWLAJ3ljaKrkrQSRrtSG6x4N6rbGDK1UHuzHrcuOkfq/vDIQEtMViZSIdpC?=
 =?us-ascii?Q?YkAmZdTBKVzGdDIyNeEGFss9l7r4hC4Xvaxwunu+n+q98PuKZDsxMTVYOr/H?=
 =?us-ascii?Q?l0/SdviBKiH9IFMJ6056TzY1p52MxKxM7/K6yWQMc+PGNrKuj0xXCrWUlJdM?=
 =?us-ascii?Q?dxQMGMHQFh9zEON8DzJjKC5Cooo+MgbyrRDGzP2O0fNLNIVaQK42tD0vWJdG?=
 =?us-ascii?Q?kjrOdhRnjj2gk/f3uyqdwd17LjyAI8iR0/Ia/IlnPbUwlLFa90FVWePyX4FZ?=
 =?us-ascii?Q?VD5wadSwZtqmphEtYzVZWQHgY8/hZM7LtRZNjL3jlhlATrRFXOKcIOnnEdow?=
 =?us-ascii?Q?2TpURuXUr5ttAL2ctFMLAATdmFwqwNYZ6CVtN+1raoGQtUZDdZwCY2C59nZ2?=
 =?us-ascii?Q?SkgNCExQdIjCC6fPJ7ChUZvlgg5kyB/GSiebStk4IdcnAK7xthFhIwd/mLXj?=
 =?us-ascii?Q?HgEvC2o4MJfcYSdL44id4MmlwPDcm8TgcPiM6y2WD5esOmprvtquWudKF2D1?=
 =?us-ascii?Q?55VFw1R2tmSl9UwxtLWfP5GG7XYdxyaEZZDBZRi9lxJnLivF4c9KI8XvwYsY?=
 =?us-ascii?Q?CL64gy4AhAvA80snqli2QSCFyr+f6PfxMcXcDuQ5n3jWDSgobMY2sXoIUPXz?=
 =?us-ascii?Q?yA+dfcHuPR2FB2T1PaSJE87Qdyu9kc5Dys2jJYlSeT7fIaOQh58rl5piqQ5t?=
 =?us-ascii?Q?o9qDFTCs1XWZbjyplUzkmaAfi09W8wWg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RQw90XHFFj4gza7knr0iaN/ItxOatzxPs/2g5Ay9l0Wxz4sDSC89Ou4m2bPW?=
 =?us-ascii?Q?p4obN30x9obUSJR091y/pTIcyxJqSyEXISnVDqz4t51TtDbTnR6sAe7iN/HW?=
 =?us-ascii?Q?wTnGDb3PLs5pf4rKgBkiUm/Md+ils6CR1UJ8BsGaO9C0BkDYolVw8hdnr1Hh?=
 =?us-ascii?Q?tdS+Kt0oAQW2m1AKK/fqICQu/mNJWp13QYMqSqMI2+AoOQOb253AILUo7LUw?=
 =?us-ascii?Q?yIZBTXcMhD1w56BEBq39c4d72zNyRYubPtWIjBeOjc+EMdKVdKCt+UpmtEvS?=
 =?us-ascii?Q?kyFaoNUWWSVdM29C1bL6jAPr4iwtRYq5Ef8WknQY8HV2dJ+ErRFqCk+VdtkM?=
 =?us-ascii?Q?W1lQUbWjBrU8JGUfvZLgKM2KSv108MiuNgohFKYxLnY4fHl4ep93mnD5QqbI?=
 =?us-ascii?Q?D2aiQV96FVK4J4wzwryBCquZVwnt9izDHnPYQbciKmTxHgy0lHkpvJ/2xMib?=
 =?us-ascii?Q?VjwlmDh3oRXSjtCeqkhHi19bmoClix8dR5IuxcyV+qDeekbjvOqIGJ0uTMSo?=
 =?us-ascii?Q?8JzEoFb2GKPBLA+8z+OVzkAQjz35iSr4dgSjrXEm87pkPIk6D+vbtHjyjWdK?=
 =?us-ascii?Q?rYoYJZKxHlqeCgVZuk+oYQsws50e7Wm1wKb5ES2PSLpaAhbDwi7oRJ3jdApt?=
 =?us-ascii?Q?VKlM/2VcuFe9zyOdJ7OxJi3zAsSHkD1DI8HAgCKEkSlqoqAWcZHYCiRnnMCZ?=
 =?us-ascii?Q?hoR/3ysSwKjWFWPxl9ZZ+eHbHlI+y8eFMfi0CnyrTo+SGP8UG8bYrvOjwfoE?=
 =?us-ascii?Q?n4N9kbNIJYNGAKUMb921V4Xb1FmIkDhQQJpbLE0UMzTs/OqQUH1L1Begvb+F?=
 =?us-ascii?Q?oTX9iTnZepbVAx7p3xuMRKhQm9R5o/QTPDaUokPjzlCL1p7S2vspRQ5iDarP?=
 =?us-ascii?Q?CXFl4I5xAgM7BqqYmggQ1UydKex0nRTQ+gKlduUPWRmLPq9ieHz2KxslkW7H?=
 =?us-ascii?Q?8+7LgLPMbGTNJ10rVxuxmUZI48sbP09XbK9UGntjVZ+v3hHChmIBvvhttPRn?=
 =?us-ascii?Q?FCV/GvCadHqCIRHXRWsLn6B1Nv557OSCjpGppWoCxDrcH1RGajT4NQZ+mFto?=
 =?us-ascii?Q?bqX3Vj/lNSD30jKUDBH0cqB4uWkEZHnE4etH0rxLGwvgjYbS/dgab/FX3yRo?=
 =?us-ascii?Q?tAwLxt8Mq64m/NsQcs0jJ8BLUfYRdbW+CdorKmKCFlKn+jK8mpkjAJhmAkMh?=
 =?us-ascii?Q?gLgMORDs9Yph/6ArCwd3ZEi5E9jFEulrzxXKdapIF9PSATuoYaZyVWV2ubGI?=
 =?us-ascii?Q?26kpDeMQNAz+78MjKCe7I7y/SW3G2wb2NhY4oAZLv4MkgxdKrHsEvy+cTZ2f?=
 =?us-ascii?Q?j/5LrEIGVrOIsSPojtpe/KOQOCP5aS77tLRcvuLm4b1tcGJBnC25mNmkxPHm?=
 =?us-ascii?Q?NL8oKNYuM3Xk3QSIFtbPU0tsmCC3v9Xsq8jqNqcvhQMb7724nULSuL/OvGAU?=
 =?us-ascii?Q?hs6EWvyA2t5ovpGz/eEYVKUWfFWgtDBS3J6wA3Q+oPy1LcKonw1nzv5qtl9i?=
 =?us-ascii?Q?5bSCcDQCveP4xKoeDz5vi7/G/aJsX2jTGJfA/72Ep57YIlthTOhchu12rswo?=
 =?us-ascii?Q?qU8sIctvccYddyP9UBQnGmro+2K4ydXEEzFsRxlxT8q6g+UIj1jLDkCeyAj9?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f57b9c-faec-4b12-54af-08dd7b249a1b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:18:49.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7vaOEzD5zTOdVgkRGImvpJucsKQwr/BIxOg2ivp1t+z1fw9MN40Jk21pLySLpq2Om5h9N+pKhzNV9XogsPjnXsRpjXbOAhH+EYurnAKBgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
X-Proofpoint-ORIG-GUID: -wjI-7FrtGwZA-gDQWu1ei5vsb4DDPLL
X-Proofpoint-GUID: -wjI-7FrtGwZA-gDQWu1ei5vsb4DDPLL
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=67fcb6dd cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=XR8D0OoHHMoA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=RNnUd5T89QfoQ4j43GIA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=659 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53E4UQNN014070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 07:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214798

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777

(master rev: b0ded4df5f2d3bb3319978d1a549c72f5daf238e)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-=
threaded-fast-path-to-rand.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threade=
d-fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add=
-single-threaded-fast-path-to-rand.patch
new file mode 100644
index 000000000000..736fc51f3874
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-=
path-to-rand.patch
@@ -0,0 +1,47 @@
+From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
+From: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Date: Mon, 18 Mar 2024 15:18:20 +0000
+Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Improve performance of rand() and __random() by adding a single-threaded
+fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
+
+Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
+
+Reviewed-by: Adhemerval Zanella=C2=A0 <adhemerval.zanella@linaro.org>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ stdlib/random.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/stdlib/random.c b/stdlib/random.c
+index 17cc61ba8f55..5d482a857065 100644
+--- a/stdlib/random.c
++++ b/stdlib/random.c
+@@ -51,6 +51,7 @@
+    SUCH DAMAGE.*/
+=20
+ #include <libc-lock.h>
++#include <sys/single_threaded.h>
+ #include <limits.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+@@ -288,6 +289,12 @@ __random (void)
+ {
+   int32_t retval;
+=20
++  if (SINGLE_THREAD_P)
++    {
++      (void) __random_r (&unsafe_state, &retval);
++      return retval;
++    }
++
+   __libc_lock_lock (lock);
+=20
+   (void) __random_r (&unsafe_state, &retval);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
index 8373db2c4f41..e4e2a766d70d 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -53,6 +53,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
            file://0023-qemu-stale-process.patch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.35.5


