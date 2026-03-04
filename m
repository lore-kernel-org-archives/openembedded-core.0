Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7571FEFCE37
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24358.1772646258879911613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qwk2AgoM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C95uK535758
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Xu8vJTLSy5rL3ICPVUleT460u0tP/o3rs48VuHP1IFk=; b=
	qwk2AgoMBmYOSgl4gsXQELb9uQe67siMsscZ3+9Ep1ZSRieEFCsj75ZYf4Dcv48S
	WVGS08Muma3UR5HtqznHYelXcNlsnAHX2NQN6It0ZJ4CkHnblJFv9M0ttNbp7KNC
	RZOz/9dDnCBzAuu7uo4KkEIRlKDZvpAwb7ymSLOJSf26IP49qvdm8nqN5SNnwMYL
	hss3VAK2Qr/OThUy9AhzwGpPlEQp9l5LRFjHsdBje8ShcR+RusMpwEV36qMVIYGP
	VCjbo6lVkyO/cFFfvh3TMEaQLm/wrx2/a9FWwZh/ekagFKvV8EKlPfG4Tqp/WGDI
	RWGPM202iW8JnbhpGmRd6Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4ne5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzBo/M694PyYaxmoBVnp9Rq+I13lxJGbJ1drABXMGRhhLyZfwtOwG+aEi7C+TZ2AIWz2y3TZgWLn2PJomvwH+tz1IIF8/Q8nqqSqH6qKPfyJpF0Ay+lzRULFaFRQdgv3A4pZ9pUI9evURVRZek0R6qiRnbWHRZ9KdGKwtyfZdI2jGTiILajSbQysWrNCx617VE49pFK91fEUVKRuyOXDRL4ImTBX6WEZIT6Pe4ph6wD0f46kBvbJBNJ7YQeHqU8ZFyCxp1vjEuUIZL9pstw9i2nO285oN7rZrY8seGIw/zQNpHEW/Ur0ef03y4OjdtOYsf5NDEIR9ru09lE9TxI0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xu8vJTLSy5rL3ICPVUleT460u0tP/o3rs48VuHP1IFk=;
 b=MAB4IrzchR/P3PfE/3SHZkW9ytdatL4roqR/TiHOyV5sZ4kqjMe6raqqNVtg4jjM30fvCRlD8w7H6DrwLPJFdSdnprH5y1VTia+3Y1XbkF6PqsnaqbPvcsb8jUC83grkh1VDOon2RNK8aj8V3qxbFn8EaL4H093Zedx0KvIa4OjqeRwPAyXIUlz8j+MYDjFDjqXmx6l2X1Jhcjf2Eff13dneJx0r4EpuYll3PbgkgyiUA9XBGLUIipa/9bNpLzIUD9CBjvZGvh6uitwr7gzTZcsN1jO1Qqfa/4TKDCV/HbpkYo1dU2GgAtkVhX6yGi0lwVLtmgoVawP/KkgJGATu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 08/14] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Wed,  4 Mar 2026 09:43:18 -0800
Message-ID: <20260304174324.1186644-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 20934aa5-5300-4e61-7897-08de7a15a77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	tkJUavdHkRUGPss5r5gpz+uO8lDelEbB8GYl5yte/4l842GPjENEPg3ycAbMhHsrFoACe2YOk+mOWf4n2UVcj6anyQg+MNqDIn+iDaE1Cw/jmpvgYORJi9JTCtFvkOc58OY05TI3GQkF75FNYARhzlNifLbRajLidVrJULOYBIvuD8uya+jNlJrMAOPjPNUjyGmu7A9YBqj1+gKqy5rU+RUqE9t5GDAgVG6R5g0+yxYG4sHElJwy5TQm9YN9E53ZeZNygcC9JDosZ3yMqJQRIExO3tRVu/D0zC5SGctiKvPJWjOpWB/4LOuRuIiBJMtznb+iNcuM6apeUtStDTSlKwlDHFdntOl+DUyjGB9RH5XsxW8xXaEm6C7p77Uwd760az39vUnWy2A8VisgkF1fh8lfFJ06c/fAmXGj4DJrn0RRx4kIcs/6qE04wxaqOVRNxp9Z3LQSsvssxir9h0s06ifYyDg4Ek1eY1jcl2dsJCvkbhPpABlWfz2hwGNmulPTwb89kT+6QwN0ADKIvwlv4Epsl1QZtOAhp42BaZQJigVZ//cp0/WIXX3Rbpz3xJj7tf+zKxtoYX3HzFO+PCL2vjQH2rlcsVusWe0EFnluXrKwnswQHqqlcRRotAJ7zO9Y5UQIAXqaAKS5vaQn6qqoilA0WuuiMqk2qEdAlRTGcb40RGAGEevzcDqG6/Qou6i7S6ivgs1kMykXzq4EJmqs5XuQpfdBvEK0+KjV4sAcNh5R9C7Xb0qXav5YNC6TurzA+s2AnCtM2piJWiPMVHWjDkGKDFKxi37L2JtENu6G474=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LpxsG01cTA3ygVcCGOiRYtZPysm7Rdgym+ZtkJjdV9JBOELLkQTgg7v/n+Ju?=
 =?us-ascii?Q?jg079aylvEOqvguD8fFMqZ/eM1nq0XuADrkhMIaJ8tMSOZrmFCDojnLWNoo7?=
 =?us-ascii?Q?KtAu59MNOIrO5Hol0jNkXdBCOlz3AR2QzmzK97oqub5fsKRq3XvbUtSb4/Uk?=
 =?us-ascii?Q?sOTX8Su653cIBhTqmTayAT2T7wNR93RbaLEwCC0BT//Hp034pl9Iq2dDumRt?=
 =?us-ascii?Q?T2hKHYeT8RC3BgX0eJqmYVHPol1ApE45I1c3npzRWY1BFhekO7h74TM3nPZO?=
 =?us-ascii?Q?rrPorATxZk4wlCDR5aRAB2MV/Nnv1uUJhpJZ5wA9wSlk7FO4xkV3W5GEnBgO?=
 =?us-ascii?Q?TzIyRPFwVpQZ/1saetl4KU83dfOhQ3L3ItKYTJMK1Zx6+kxWwYUsUqH5yvi4?=
 =?us-ascii?Q?j9cxhQ4lxseBHn2ZL0I80IQaXN0JsRkOvo5jMEE8USBsEIt3wnUPPaFvfGWA?=
 =?us-ascii?Q?ey+u64ZFB+0O2zpUPrUTGT1UTTrrtRLZPp09yzfqCKedg+LUURxj8tKwCI8d?=
 =?us-ascii?Q?zZcaJ+piHyeESQb+J/uqQnn8BVvPn2BUNiif0UeXrsVMH/ahhthFnGp9eKk9?=
 =?us-ascii?Q?jYUBntYvvuEOZmnVpRypXl29zF7QTr5UlpBuJNH82JwXNFGiu2eIQiDvK59Y?=
 =?us-ascii?Q?ufcZ3+CHZnu4EP19/woGAFzEF34DYsED8C5wZtu38wePJKXKghgw0Uyuw8z4?=
 =?us-ascii?Q?J/+h6Y9oVa8eWYo3Mx2V6DBWTtqwdk/96X3T+gikM465MiNryftT/YJUXYRx?=
 =?us-ascii?Q?1xpvh6hKCxp1PO3dwcI0rJl+uSJk2JUk58O1KRC/vRyPLmswSS8hoUkVukcz?=
 =?us-ascii?Q?/E4d7xGOfyXnLwGb24ZEXxBNebOIxtzl7m/pSX5MLR4eZWzeyt0Bpku3hHv2?=
 =?us-ascii?Q?gFRXbvfcZrPVO/rD1qOL7d1Hu0/iFIqQ3ega5Wh9vqy0aRNXSVFuyvhIuW31?=
 =?us-ascii?Q?SBdOGEOpg1/Namu5+GpyTIcH3ilZPnIy72kVqphKyebomGpi3GZ58IZYdgae?=
 =?us-ascii?Q?XVCn3C9gTU9LjKRkk23Ybs1I1b6kUmtTij+DatjL/CrUm/1pahEZu3ivrzf2?=
 =?us-ascii?Q?4QqHtZjQne+MKt3GeclzV7Oc+CLmQxv+ftgtm5kAN2nYy55rjP4NhkxhWhqM?=
 =?us-ascii?Q?U/irjs/sTpZ317442fZZqGsAy4T3eGXNhrHGl0sbLT95wPuwpC+51A359iVv?=
 =?us-ascii?Q?Rb/4+wBYDWWs4pQqOwBfAQvMUwVnUzh9vQwsZS0idaSEE7nyxPadxSMzR1Dn?=
 =?us-ascii?Q?NrR2giwrTa9Dv3a4bXFX+i+GC7LfalM3WNJpkGJjt4qArytCh0NBkUgNdRvO?=
 =?us-ascii?Q?Xlmhhxo0kQ5Px1Z6jf7Q3cMW9Pjotl1dIXjXk1jbNmgUoNWiQtOKaxvIOK0l?=
 =?us-ascii?Q?HeKNd1koYj8WDzBaPwg+WyynczGfn1HI0ySsMCRhX0ePFYrqpsxCkwWol4Xi?=
 =?us-ascii?Q?iVSe+eh6nZkTd6dZereTGY1WVsZV7TyJqFSufADVN8m+P2ffGiRxb9F7gL1M?=
 =?us-ascii?Q?Dx+GcdQT/VIhXGt3nfBv3gy5APAYVemba1QheFSvvkQJ7PJl53lC1SNMJoc1?=
 =?us-ascii?Q?WNNwmDybWwr2WmdsNbvFaiaJFsIqyyIAt8XnG7lWmnX8r0zzs7zvOr393iv2?=
 =?us-ascii?Q?9UC7GRiDUQURaGjcZV0TUs+RwmE4D0bgdLW2QOHI//YYPJLv2r8aKDeJlGsR?=
 =?us-ascii?Q?CKEy6HGsEaavSwSapOJiWd8113ZRNAwd3j9WSw/BJk4I+6FHnYuS13/EhVTB?=
 =?us-ascii?Q?DOLRpMdPVHBkeTbsDVk+GwyPknx64eo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20934aa5-5300-4e61-7897-08de7a15a77b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:15.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb78ne+BE8rsIOdG+wpYX35ECuL5cdKTMpZnwQsStJCXJkL2IvoatMM7xsCAbOmTUI5DbprmbqMQLVnU0tvqgijiVOY1f2sHbH5kZXVCHk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a86f71 cx=c_pps
 a=BlIXLFXQXelmgi4pYy3AOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=VuBSspvWkCZ0bjgt3uMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Cu2dNv6IY7VnE3GYKLJ5LhgoB3IcjX4-
X-Proofpoint-ORIG-GUID: lovRhjwcjDu5K0eo4531ai1SipqzpaQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXyYOlrpkLh8qh
 tn3QFQT/s7S5M2IcyfW0gpQ8CLX5f5gk+KVaLpgxRrz7D83QzKAO8KRJTfYkU0oi9HUDDLnZAH9
 4+V0AcHwPDptOUyAVs8xWDXDORKSiV6RIeTkfsL7UH2Bp6VkbWRGA+anFxV/R8kC1A/Cx/GgAgX
 VRNEhlmywe0vD2Yad6LCFTXv8i2pHzW5vcso//8YQ22mERFw4GWqD86Tj/YE5ukvPRbqJ6qlFs2
 dwrp7PlEB6ruFSY5z1RGO9g3smXo6tDuHVjiNTaomaNlO3fp2Sq8NkYSg8Aschy93c7sbTMm9WP
 9433Fi2QOYH0VNyII5Plw0zO8F9TAhbMgtyR8w0RqJ0gUTK80MEnh2Kq+M5zR8W3iPTOVQz4oaf
 BJvZfDTRrCFeUH1zfmN40cSyOhYHqo+XaPiMA/eqLNofGVAn0XgOlIIox8XEmYZfdzPGZbyjh9n
 E0LYoRu6QEcvKvWzdqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232424

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..d9b09a3d9a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -140,6 +140,15 @@ do_install() {
 
         cp -a scripts $kerneldir/build
 
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
+
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
-- 
2.49.0


