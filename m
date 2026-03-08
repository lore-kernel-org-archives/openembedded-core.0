Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E68FCB63B
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38981.1772978659303511427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ruWSY3oo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DUo9h482562
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 07:04:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=l17F5fOV5KcEFxDmicT3lZxC9kc4Y8FOF0N0jdSfuqg=; b=
	ruWSY3ooxBWSfKHGzjEXSztLXpuhJpAMLI9UGar68ixqqZOPSNdema2VAvQWttd6
	aEsp4Nz9AUv07KWuc0l1OW+J/x4PpDZx4E1QwVi7NExKunli5JmS2i9+DkgyX5SM
	b0gKZo9lystXNMApCKK84h+Nj4JfVT2mb/Af51tkAafcXVRKL43YV2B3yaLpTI7H
	+D9Txcbm3AGC0hFRdVYWJ6cfPdyv1J6mcgv0QqMlf0iu82HYcfn6mINWwrHCIA+3
	JlarynPLKG5i0P9k4tP9TKcLPaA2tH8LDd5DjISyN02PnNW4k70B3XaVEArgGG+h
	YT6zDhirbRtr00CQq0b31w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62gu91-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpNpf/7CUh64+zeJBV5lw+Xe5RGfw/oA0rT8IwWRjZ1KWDjn5sUmg3xjPvYfjTjlDbaHDaxoF6KwCcXjQgiNvxh0YKF9rwh//0B6eO8HvjDaHpWKhXxWHvvi4RPcoMjU/tXd1HMNv7BYEGNVv19ivSA2V12QkSiGZ/7i1HOHqpsRATfDzhVbrVQY0u+YzPg/4IhRwJhfwKZwPMWm/vlAC7tQvvHOinZ8juav6JWbEP0WfR/+Nor/GXjC2dXVMMdLU5qxXbSMmc2FFg3hlzh4fDjF8/R/j+ZBhgjaMM0yPMfOO56dR3pFAdkFlNKj/TGvlSYeaorrvBtN7+3vXLgZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l17F5fOV5KcEFxDmicT3lZxC9kc4Y8FOF0N0jdSfuqg=;
 b=ExOYHjEdKsxik0UACpB7v3msigEt/IU16impSBqBgRC2NRQRv2foo2fPbmol9qf7X1tJWHF6tnpd9EFlPXwubRFt6ctE37GCPCuzowMv7G0bnzcUk15MdtAP5uk7htGz6Ljea7jtL0RBKd5EuNfVeV8mI9VQ7yt8DHaewPM3w33AtokHTziSCWlBwT9e4kCoxJzIhWxYaVJwyc+/lgMKz39iVDa1M2ox59pHIdoUAgV1LUMxBAkL4pGDvZV98kClyj5D5Z/3s4EEZuymDbADvFxPGGsesBRv0AnCmN9kTh4FPx4OQ3OOE3XVchadySUse32/Olsgtr6QZ16PzIaseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sun, 8 Mar
 2026 14:04:16 +0000
Received: from SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486]) by SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:04:16 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH 7/7] ltp: workaround openat2 build failure with glibc 2.43
Date: Sun,  8 Mar 2026 07:03:14 -0700
Message-ID: <20260308140337.2503858-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 386b7ed5-1510-4f04-a378-08de7d1b9583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Yuuw6Rw+1VJnJ3q8Gjvi7QSYKZAFoz695vRHPfOg7/0S+9oKjdOqraotOeIxhtZBZqzsxlmUoL069DiU5UAjamaWFArmv+jFpjIR6NUDuXq5o4/22e7vDH/aNzvLqppiJqvpqnxvny87lhQyaeh8dTZjT9oA6B6zH/SeTdnDM1Buc+od/70NlNPJ/JrzwNwIXSsPmKnXcCiIcHXTu6714/IrM87HiMGUCjtO0lQcvmL2YeVqNMKmAbRNnHGK8R2U6L5uV5UX7Huwi8lV0gF5ilHtiKmxQzch9adu69XmZIc0YWWLJBgfKtGVpfensGrhLDhxSmHMm6gANO7yqL+c+kEhZITHl7tEN9HUsy8pAkeWZQ17bzQMId1rvWvuewI+z/aJ94K22RtqRf0QaeYZPi3nA8jy6bE/dJ7wPn5ySeDi+YgO4pyFzENshZ0A2ZwTuH0UQfB7d681r8rvfj7/cJpcmoFOj4oHp5zRdAZkOle4jj6/9rPmIQE+EPmQCymbmWDtgQFHVwl4p3NlYpZOodZ3nt4dZwAEoXU7YxJYJxpV8xgfZhnEM0mh1KraPubpGp0kxDnqfy2wazfTbAbn0D/1mjt3U2bDrOOpYctc4bjj3zew15bwdU7Lauuxba6QRPkHa0LV2ydvKMADv9UTZECB1Ast0i2zOftYYZuhJwCYTcTukLKTsaQim9Y5x7pYYAd0XvovaPA99PWSpeu3TWYX3fAxWEM4LqHz4Bznn27FjvTU3Hi41qaktGJa+xIQeh/IEjHDzU6dBrTmmiUFXGI826/0g0Ph/tbV2z1fNIM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4574.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wby0yDmy4iaCy9+dQI8vw+Mg9vvXQly1U7ui72k8cnm++W2RvxyCrnGrn0D5?=
 =?us-ascii?Q?sB/JHgiXHh7+n5gUfAGOuje5ZEmZRC9dSwLHn0GaJDDmLI3nu9/kO+NpZgpS?=
 =?us-ascii?Q?qUY1Y4PbUM1j4iaeXqLM01taIZwM8QEWtNvl9Ti4IYKxNYsJGzS79FeBMVmW?=
 =?us-ascii?Q?8kJYkrfw7AdDkgkv6j115POUrUOS1W7vriHzLCHP3xRHg6Ib3NXowSe6y2fr?=
 =?us-ascii?Q?7tFgswN0I881WgBuaR4aBoZqa29cH3zjOBXoizUmm6aeaFP40RC+hud15id2?=
 =?us-ascii?Q?Y78fwMszmvWFsadjVR+nLaFLnvef26kKnFFhiQkwz/k1knKTLe8iatNDapI7?=
 =?us-ascii?Q?IV7nmPoawBKZ4lzBqMVDpR24km5YSWlKRWlS1CtDYKiepT5VXiZb6rDC2xIv?=
 =?us-ascii?Q?eCWaVeWhU+HSD6nQcji7Hrun9VndV3F7jvBIHQRFuuTLit2YPG+7doXxi/EH?=
 =?us-ascii?Q?/tSP/w6NfcySrGExAiGogigQQK2qjWoSGGIZLHKJDdloXEk3DAE/vEeskBWQ?=
 =?us-ascii?Q?5hdaLysQ9H+Wp/OPXEx5HI1O4MdiuIAxAgmTeCKrGzZOc6WfiW/mgFNX7OGk?=
 =?us-ascii?Q?7J3z6Darb2j8AWfE04/8B+x0lTcuGZ4QBo8eE2eaZbHuFXLlH6jn+VV24hWQ?=
 =?us-ascii?Q?1upsb9J+fkKOkmx6hjxOMqFaN7IcyHxKbfkhO3Ru8al9MC3+G5Hzc9KmGzcv?=
 =?us-ascii?Q?ll3UjD5Shjbrn/9ALHPX2Yt8x62yvzq4NThl2NIBW5fxgOSbZdofJTwhmqwo?=
 =?us-ascii?Q?BgaWxbSTr/e+/fGVetrWcNrLLPN14Ny85vtCRdi4sBVDuuQQYySXk3Msr6YC?=
 =?us-ascii?Q?oh/L8k0K8FCx09QwlbcfxyeKHEbnjvPPtwquEvnYJ+TohAqtR6Om+2rQKqUX?=
 =?us-ascii?Q?YooTrmU+16pXylxbKhXXzhE1ICPa32nGOAy59sV2nzIUooCX/cZUQIVcKIkX?=
 =?us-ascii?Q?yR3h9ya7YFunYx5mGJK6HOfxDWEZeFmLC6VAMHDM3xs7fbLuQ9PLHtf2N5Q8?=
 =?us-ascii?Q?cTBmh2KeoyIRPgnQaphtuLGM1GKhzX2jJR+A9U0ypumL9B8Xi00S/9HwoPva?=
 =?us-ascii?Q?VnDI/VBwiA4eM+CebvhrAlI4HeSnE0p2KdU/lqkSkLT1yEyYlsF+7bgVxQK2?=
 =?us-ascii?Q?ZvKzPkIQ+omeBl77MCR6z3b5bs5GTZrfD7fs4MYm1SH69/Rlh6l6JS/aZj1E?=
 =?us-ascii?Q?zOUojQ7uJSSKDKYgUH5J0Q/mIwnywgUvT+z6UpnyxqnKVo4Ct/gzscBe+aaH?=
 =?us-ascii?Q?GrQnQZ6g3XYi3jKfFFTyouEFYm0RG4lKewpAQUMFm2a3DkeJrBEkXuYgbMk0?=
 =?us-ascii?Q?MP/jKezrbFRjA+k0PC4nsIONCT9IDujiWouWF5U7erkCXlVYgqniAYX5YscP?=
 =?us-ascii?Q?h13NVJXRemtOwtKlhDtJnleTjC0qCsbcCn1hWXnI0zjjVPU5Blk2DJADUCDb?=
 =?us-ascii?Q?5rXqzBCH4d3ZLvy9eBqcG0tQqOmF/iaQTvZjSVM9jPupVtJYLou1MRf/T10h?=
 =?us-ascii?Q?aFKLJUs8TFgXJ4S2EhZ+eW1fAuZ7/klCwgadyMW27YtsmrGf6i4dCP/lMif/?=
 =?us-ascii?Q?2MufpWnxDunawGxsXYVRdCvYjgr8eFIW8ZDpSe2XLm8c0YuutfJpvJjj4Iqz?=
 =?us-ascii?Q?9Bh/vAm30CX0k0s74wDjshmiFIcUyB3F+Sn6I06HD/OVhZymdaP6Y/z7yJbX?=
 =?us-ascii?Q?LAYJtvVgObSW43me3f0BEd6LQ8gL4Z20jd9VlGFkOXlZ6bhlt1/ZdjCarUDh?=
 =?us-ascii?Q?Taq1uX5o4LJo+c5K5q2YGs/jORNEytA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386b7ed5-1510-4f04-a378-08de7d1b9583
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:04:16.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naZOgpRkt/dj5qyKZW2N2oCivnDDWu3z3U2yfbKJVwj7bN+acFImY1rBv8tfJOu7h6lpGdKqSQ+K66ooLByP7EcJ3/9im5ivDlR3SHKJjIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ad81e2 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=5uUD0Id6OvlxfbuOjvwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEyOSBTYWx0ZWRfXy012OqpVS+oW
 CAhqR/jNRDa7PunNgaZ0fsLkLWgC0uBRgG4JBT1CpkeamEWH9zyCK+qvec8wXSjA5PUwRTyjl+Q
 hWYIDvJ7YmoMmY+m/mqomvZSlWfCRq/Ks+1m7xBleslPtk4oUtMgFrJq+aVwA6IlIgmr6T7L3VA
 SsrgdZ3Br2Tte88OnVqgyuTcCJ8pr7t8KpG5yOSLO45Git5ahD5+WXfbBLZd5/UuYacKAQ+ysvj
 t5LevIYfgmapikH4ZVhr0CMdw67OoWxSyPQnUGXgT662o0uQTV8MYxjt3NVg0x73Pg7UvbMR2uQ
 t+72hUDTQS4c/mesGcL8p4M9j/Ul8NQODOAF24VfoWz/aJo7A/hNPTYVDsrt9+yG/Wi5LRS6Wgq
 uaaCAvPOtVDKrF4CtUQKUBzfkXvAyaB8+WgekihDblqiledO2eUKmX0vca8sTDFBoSXFai1/+8b
 j+xjKcHIzSRo2EFjlXw==
X-Proofpoint-ORIG-GUID: E4ZRcWqrpMpSiKQowdQrAAX6lOFb2oPu
X-Proofpoint-GUID: E4ZRcWqrpMpSiKQowdQrAAX6lOFb2oPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232650

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...tp-fix-build-failure-with-glibc-2.43.patch | 32 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20260130.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..82b4436779
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
@@ -0,0 +1,32 @@
+ltp: fix build failure with glibc 2.43
+
+glibc 2.43 added native openat2() support for the first time. This
+caused compatibility issues with LTP's internal openat2 definitions
+in lapi/openat2.h. LTP's configure detects glibc's openat2() and
+sets HAVE_OPENAT2=1, causing lapi/openat2.h to skip its own
+definitions of struct open_how, RESOLVE_* constants and the openat2()
+wrapper, resulting in a build failure.
+
+Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
+own internal definitions. The proper fix will be investigated and
+submitted upstream ASAP.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
+index 03327bdb7..bd44573c9 100644
+--- a/include/lapi/openat2.h
++++ b/include/lapi/openat2.h
+@@ -14,6 +14,11 @@
+
+ #include "config.h"
+
++/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
++#ifdef HAVE_OPENAT2
++#undef HAVE_OPENAT2
++#endif
++
+ #ifndef HAVE_OPENAT2
+ /*
+  * Arguments for how openat2(2) should open the target path. If only @flags and
+
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-extended/ltp/ltp_20260130.bb
index bb3b7e9ca3..57e3120839 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
+           file://0001-openat2-fix-glibc-2.43-build.patch \
           "
 
 inherit autotools-brokensep pkgconfig
-- 
2.49.0


