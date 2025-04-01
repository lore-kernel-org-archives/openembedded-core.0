Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607A3C36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 06:46:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13150.1743489998323721506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 23:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6186b31ba7=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5313o2SZ025761
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 06:46:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8tx2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 06:46:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASwEeIgSPwC1A0biQmW0TxYhlAqbV8z+QQ50lLaC2VD3WX+oGYYSHG3ovUj2hOgjdVPaTDl5dlfHKvS+nmw0mR6n5cvLHB7p1aL+PfJC9Nb3C0CAIun0gNljJAJErHXb6xswfD3784LWBm1vF8FNkyFef+xcCnZA8Msb0nfmBx3/vP2Uu0QJwkutz8GoR1/ZiV7SpM1v6wv24FG89hmr5DgrsL6eQRACK+JjzelKhw5Jb+TLczVdzOwpZNCUC1iAjIOSnn5hIYDeJPcFkLRgWCFqWxupal4QQM48GNAB4fJancKNgfjUX6by/kfwcy6ANoHLzJKzCFcsyxBzKyVnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7fTzTvhCR8Xx8/6AZKSQEgEpNEGrnW6TSGd7w6RLR8=;
 b=rOLj8tb8TIWUZ34ZhbVpg0ongq0/QPtyMaMUUEi0AhS0Zwx/Nbzwcu79+/R07rFgZx0ZswlgBMusB7t6pJ1h/G/kvU8aUFfVpEn7PJxCDgTw72qbIPR70ZxzaV+3K+zAc4VnYBqToEU6UT1jtUGyB1lpS3TCqRcehDJsCgVsYofajNmrqtPN7YooDqhd2ym0ZlVGynBXxm7kY0dhfEB1oPMUWHJdDldRdXBZkStk2PcIEePHtOgZPA4ffTei7Ni67lyKMbnTHXB+vUIve89MMlNa86HQW9p0joQpo8y1KekdG3dDCaVnFSw241qFNdrqcBGI2XHBNhKaFDpFWyhvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Tue, 1 Apr
 2025 06:46:35 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 06:46:35 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] glibc: Add single-threaded fast path to rand()
Date: Tue,  1 Apr 2025 14:46:19 +0800
Message-Id: <20250401064619.3285556-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SG2PR01CA0159.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS0PR11MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da35cf2-8da0-4de4-d991-08dd70e8f223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VTxm+Ju+cFUbXl61//8BqCZoye3mXDPqmfPVGZ6H7J5plrXIdRarItViZtHV?=
 =?us-ascii?Q?j4KdiKAaEznf806bDhP5ERQ3LilSHraf/MAmLIyOJxujnQLAQtZ4A+vEFyqz?=
 =?us-ascii?Q?F9MxtNt+VIeC1kLvUXzwhUlblEMfEqjD5vSDVak8DFHtFCLBZFu0jxJPtzwR?=
 =?us-ascii?Q?w5cl8DtL2oCozc2N60DzwFxKpUu5XNBUAFAEMym+SA6QEIWQEY1lObUyRL+Z?=
 =?us-ascii?Q?n4u0y3/4R0eiI9f+1Zv9R2IsWcLP3VHy5qiUAhGcR0E6vftpSj0bi+oYAQcP?=
 =?us-ascii?Q?MKMgtxv4vIXMgx/AHindwcXfpBhAFg6a+dq8UMEdeTxM+xYdx5UzQiC/vjlK?=
 =?us-ascii?Q?AWpwfKeaE0edb3JfDaonZlNGs62YnF7x0b4KqXYEpbHAaU3Wo5GBJ+tb3ZDQ?=
 =?us-ascii?Q?eVP4hCruEjEZTyBLBmMoBoPNaDTMH8zwbxxj4l6H30UtpQAYuJoDftv41Wg6?=
 =?us-ascii?Q?ha95e901XeGI4EzQvk2pGW6Sr9dzWRg4XeBz53cJb3PvwzQsPDGihiIIAUPA?=
 =?us-ascii?Q?dy/UK7BTp2GKyO3p4uVGD9I/TQLXOW0CqNyTDEiCQWADRqbVN9DoQimdz0DL?=
 =?us-ascii?Q?xJx/vBPcTx+LdrNxFSGDq77e+2p6P8lyLLP6qNCBQa9/UYryTxpw6xSmmPMx?=
 =?us-ascii?Q?75JmKD7TjGxFSyJvgOzzp41zPTLQ9nZPSAYFCs938SSkdqQv++38OrTGIPIM?=
 =?us-ascii?Q?0lxnVIMyGG6QWkc24m29X3gfI/HNpiYHpo8K4nzFzLkgpb+E7gRTHaAdAkvv?=
 =?us-ascii?Q?Lxr1PM4s96F1r268z6cAgTfv7ZI0U1LSA5RpfiUfJGs/aIInKdpJ28i4m0MI?=
 =?us-ascii?Q?ozjMzl0xzLAYSBt72CcBY1RkFFLQMC6Sf0NaqOMdoyh9pY7y1cHtxde6DU7E?=
 =?us-ascii?Q?a7Q93WS/KC+LtgGUZhu2LrKzHYHudTjtFCxyqK2BB4+UWdYolRsFgwAMEC0K?=
 =?us-ascii?Q?3mENawLZvRbN8Vyyruv3sYXbUdKBq1RzAIfRROZ2mFMmw4Xtwg4W07ROsPZt?=
 =?us-ascii?Q?eanrheECEl16gnpcIpQYl8QXNGmFCy5Z2Bc9aegF0Uwczyr1eln7OMDqAne/?=
 =?us-ascii?Q?VPAb5w+K/vfzTKL2k4gBf47vR2055KidkIsw1CXGl4aWwxXtfM5Bre/CsP2s?=
 =?us-ascii?Q?PzwHTMdB1aKBm+rwOzXEjELYEf1ZGReVealrT5DMXRbHuY2DKpbtELQTzT8v?=
 =?us-ascii?Q?FSvIRxBAwR+0anrMXgjKI5TZupv0mdPFzVF+czY/CIGJJr0X6Z7t4JFDRK75?=
 =?us-ascii?Q?3PxDzZoInMCYvE1af6O5QfJfUF3UmloVe68DS8FjtSyL67qGwiWMQCX9eBAQ?=
 =?us-ascii?Q?TZgyKUK8yXu2BpKoA3ZQn5pPMwp6MrWXx9jWKxbVHwju/hTzHgfBv6pUZVf1?=
 =?us-ascii?Q?A+f+K8imR1BIEE/5/pbUicFswenGNDQ9xFHcqjPvaFcbWGC/JFFnxhZlWtKm?=
 =?us-ascii?Q?FwtfRaFxPk9iU34hcHkyyKS5o0xvvlJR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ROn7HcNcjQkcOw3zJaqFkvhyg/mXkwISWDBuKaH2TTEepRLVDlYtGiLQD4E?=
 =?us-ascii?Q?KWKBVIipBJm7vaGnHjocRv3A7fn3iALSVaXZ+9DtmOWsBK2djodj/17JsWES?=
 =?us-ascii?Q?sUDfJg4xtTTURNNBNz6/KPzhgGX1/pyNUnBl8NS6L8pdPDMWnp/uA2dQ3UZX?=
 =?us-ascii?Q?bYAfFMS8h/I2BAe2Zc+ZnD3qwJu5k1/ghyR+to66WVPR/eTXZRTPGwVVzDob?=
 =?us-ascii?Q?AgoDd4cJjQeo2i5ZU60gEmNg2a5MUh/Gji+bLvSLK+YEV0Vjox7cLiYAxjXO?=
 =?us-ascii?Q?hJqMNLAcsvR9yvmgO2jzpGrSjtPvKYVxPWjdEuL9/bCGK6OC4VXskkLysQHR?=
 =?us-ascii?Q?TpFiC0FzIpndgSJ+6tM87IveGbnfg254QScAnQdyLGKrzsZLy8kI4xr5Ikl3?=
 =?us-ascii?Q?aPMcxRhFVBtUJ46dZFYffZcaYVxbDzuiED5i56uA7WCPQCeh2jpnEp52x74h?=
 =?us-ascii?Q?AhHkr3Oqm9WgVLthQN8gW4hM4uTWC/gEDlzxowSX5YIpkagBE+mZr1jLgU8x?=
 =?us-ascii?Q?RmaIa6pExHhHz03FhBOlMcIctFPWTPRMqOHoKLGY2nVqZvcYtq0MTnjTVHjb?=
 =?us-ascii?Q?5T+IQBMPpWfd5HtbO/O+pd0OeFuuD/8HtBSjPpJzDUcJ4o7apDTFYj/KWGhd?=
 =?us-ascii?Q?YpxCVh48T+p4rxqhFgp6WUve2iLV+vse6gCElwgyG2ut64O95xcbSB+z6GOP?=
 =?us-ascii?Q?yjY8wez5MOCjRGNuzI/8rw10COex2aYeAuahX69v6evKQ73fVECpVJcnRKs0?=
 =?us-ascii?Q?eVVWbUZFir/Te7SkRj5a5dDdO7tCFaDK5+FBv1x8kVmkb6cihNq5MEUF0FNf?=
 =?us-ascii?Q?nO1JVZ9O+wrNB5F84sPSYpBJQTl1n8QkDMNB6BjKiLZpnikBgJxwSRhd8c64?=
 =?us-ascii?Q?L/PRpTFUeKIpmXEBq1jdE4fyFZNLYN7MlR3r7NblXKy3V3PSmAARGvFxtBiQ?=
 =?us-ascii?Q?KjS1H3SJdLofqrDEOhfJoOXSPeI/9+hqZjF7NGepcbAzVwM7PeIe0Kc98XYy?=
 =?us-ascii?Q?bBiDcu9HM/C59C11Os4Kp9WVr3zZHlbx23MEBLAYj8TA5V85kpP4pWn3eZk/?=
 =?us-ascii?Q?xdnfde+J6u1zO5ovzTV9OEwCOORe1hUFyxJcsVSN2PEN3rpXWXalOyXI5XLk?=
 =?us-ascii?Q?Z+xpKaIFKkg1EmcourgR9qLBRJtw/rUuA/Jv904zxeiuexShcAtsOuAm6ZXG?=
 =?us-ascii?Q?SC4tWVLgq80PX45ejKt+4DZA8kv0dcqsO+PEcOCfqNQlev0t7i8Yid3/WZMh?=
 =?us-ascii?Q?GRfO6HtFUvnPh58PwRTOQvAktDjK7/MgTMbUXL4B5T0Pv/Ql3S6ROgT3RJ0F?=
 =?us-ascii?Q?ohk40cQSorKKbQzkrCp9PsRklkDUxHZTir0Cnqcrgi1Ztr5ivPSUj5AmJtDP?=
 =?us-ascii?Q?Tl5cVAWV/eoy6LX8rdE+Vdu1bEbdrPHPoJt0KvMG/Al5/tlATBfZwH2HubeF?=
 =?us-ascii?Q?2DPMHUaydhsUO70rLuXPKoHFEBBdcRB63J1Zxu5tL9HgJeDf7SDWn2LNnK1Z?=
 =?us-ascii?Q?8m++xjwEw9uIUfPiE6n4LIqAeanKXv+EGf3SPawaiiAXIYU0aTbw8syFIMRp?=
 =?us-ascii?Q?7oGZhWG9Q57pgoMbqN/z/2U+kyaqA9fHFXOfhKRTJCKgOOhbeDEqnGerTdB2?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da35cf2-8da0-4de4-d991-08dd70e8f223
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:46:35.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2nsve1uydOP9kFhr82sMfQemBDA6Fa4Z9FxUMgRZDNANyIbFINFkYhuXlVcuCBEEkIQJF+RWxeQULa3sGPL8zkM1/PEFwdwZX1t+dLaEyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
X-Proofpoint-GUID: zXOT-j5gWehygKrIehSGP-kXJqy58nUp
X-Proofpoint-ORIG-GUID: zXOT-j5gWehygKrIehSGP-kXJqy58nUp
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67eb8bcd cx=c_pps a=tpf30LWoD3GURU9dwhXxZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=XR8D0OoHHMoA:10 a=H5OGdu5hBBwA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=RNnUd5T89QfoQ4j43GIA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504010045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5313o2SZ025761
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 06:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214002

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
index d9cae79ac2f3..9073e04537b5 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_start=
up_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.p=
atch \
            file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.pa=
tch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.34.1


