Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9EFC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:54:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38751.1738842841991357097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41326f0d9a=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516AWXiG025996
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:54:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8dbjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:54:01 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516BoJWR009530
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:54:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8dbjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:54:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3sJ6ws3VQZEvvvfTZEBnYIz3O2ivBkyDy84NGzA832UFgWggdQnCEcKc/fdS58g/9eDfFPnq+Ymk90Rx5sFFEkNOqUCN0roszSj8zCLNUnOUy2ZcIodqYla5qWSzm3G7tWWRL6anOHDA13EUUAH3v02YYeO0nQch5jtycwu8KbWU0MkgyBOqG7oRAGnKcRN88RoHtl06m/vDAus235iGogWSFHRuZOi79T4uTEOqk6R5wDCfJc/lnaOD4hYD/qts4cWiPe3G8t/iAK6plQ0ZtbiTjQy5i7keWg0ZRR0++mmHw027CaEWRZQFd532USSppA4AYewxzfQjyUUy8hVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqZKiIljy5VKoWUic2oA8HnX8l7bOiKtEq7cfE5dP84=;
 b=joweohCJzNnJ66XXdlx3QuwEJMRgbUG2ANoXRED3tMhx10IC+VDxmn/F9Z4Rjod6/1xTRbzyCawS37YOnCT7EGxWTWTXq7dXicjqIkBqhxqy3FE+LNY3lQqOPTiA6wV+5jkL+T0BxyFXJMEIlukI/lPtoCPNV/E/HYu5qQE+/0AmcBgHJsqSfTs3olmgVscll8y9VpIyLwXqSvdph6juWQclXl4bVoHNnJXcJGxPvs8tqxlOlrBBkTfrkoywgb1dHuIc8PNspw71+FAf7v0wdzJ0rBFaRr3swk2iHDy3bZSpsYPctJWjMCNjTYCXy2hlUPGU5AfO81qcDUlXgRAp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 11:53:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:53:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [scarthgap][PATCH 3/3] oeqa/sdk/context: fix for gtk3 test failure during do_testsdk
Date: Thu,  6 Feb 2025 03:53:19 -0800
Message-ID: <20250206115319.2604977-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206115319.2604977-1-Harish.Sadineni@windriver.com>
References: <20250206115319.2604977-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: e23371be-0491-40b7-51e3-08dd46a4f0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1V0x9GpkRLXws0ep4fDmVpsc2jC9sNDGh5EADg9/rwbnTaHH752otAETP6Tx?=
 =?us-ascii?Q?5qC7+0atVBSPaNdm+TzvgXHwskJ9SRcGYZnKUbNwCkPzFlNIRJKmQzvj3CjY?=
 =?us-ascii?Q?hMsNQnNKsNUHrHBQn05tHo3FB505uLJN/21CpMqRXCdMSiFQ22qiIDKk42B4?=
 =?us-ascii?Q?didmdGDgul8zZ1W+A5BKqKMgdOTP4WkE3Ty3dj2JdGc5RpUjug6+iGEnpA+o?=
 =?us-ascii?Q?fILyQ7xmmE4NAqOZT0DSCozkkoEjD9pFKDSvOml4kJPqYELulvIXKtiN3iV/?=
 =?us-ascii?Q?vX6EhTMJaOEUFdqRQbASFB7Jo1YYcIxuGax+K28MxsXEibwl5kGuxY5RTMBA?=
 =?us-ascii?Q?HjLM1zHi0hOFAofKAeFC6BwXsN6h4bvPVNaTbqFsaYtSoXcGR7Mgdh7YfK+V?=
 =?us-ascii?Q?wJUEdjHmWXCxtLbYU3eGadqh2gNgBV7JD/QuMJ9vtGNP9insIutRYJlve8ig?=
 =?us-ascii?Q?9AjIvNaPumkI5WoGng3gJJuxq/KIS8bi2FlbE1DrM3twMkY4dpwJ9mhB3i8V?=
 =?us-ascii?Q?Wvaal0dr8tR9+wkLbsFIE0Nj/pEONF/NdsdxrWhQ7kKmcCzgp+gB28Jwwk1s?=
 =?us-ascii?Q?QTzOCPhtyC2gkY0cDUsEXNrJK9QH/VaQiU2FS+iFEjw1njLYpgW/gjYMJniY?=
 =?us-ascii?Q?GIhoz0ZCoDktRSC4RQl0Ndm0hUy5lVDy3eZC/QnbGf3FCMaB1j83VnEHmA1o?=
 =?us-ascii?Q?DfbrCGLj/Ho6MxXT0uYY0oejlXO14PlO98FLBh7+980dsv8+m/uwDSjXdJYG?=
 =?us-ascii?Q?A1XSbsSvGxQ2gwOzmM+34bhVNsehuVf2WvUUuFoZ1Z843xIsjR0qZTIfLMpm?=
 =?us-ascii?Q?bLDhjiUSTL1T8QlJlMWflkhpyLi9eEYJlrHm10E2yGprIx1bNhx0wuFcQWba?=
 =?us-ascii?Q?Nur1qC+YmNJ2WB+tp2NTr/5KGir31vqnBCSgkypToc0BSX/uEMXKc83rEO+B?=
 =?us-ascii?Q?83tVAOOGcixVzmhNmLExb+pnXc2wSwRohSJRzmgP0fqQMeZHTZd31Laeu5+o?=
 =?us-ascii?Q?FdnPLSGvlIXE5VXVXf/W/nekgvVAI710eesz3uzhFPJL3UIXDCHDQmIXFmgS?=
 =?us-ascii?Q?TbEqjDaVua648puf6ZC08HjZx9mr1LtiZGBlc1xzfmAd7cv5msQVIONXh5C2?=
 =?us-ascii?Q?VLcOstkjyFfOCsxu4EwqjLbLiEy8Reg3a59vB094rvifMTmo70su75E+0gTs?=
 =?us-ascii?Q?Ui+vMiLKjwZ+XSo+phOODonsuS6ImMBxsRXiRAgC9VLroxDFnkxDEElmnuCB?=
 =?us-ascii?Q?QjpvXsOzWx0AQM8C9xoGCSulARB8ekeVU0C9AczrK5liwy2pprCMhyYxODPf?=
 =?us-ascii?Q?wqOJLXaisy3gST0qJt9qsMhddgSobQthZNuWDTEgfErRC5XQtP70krG62RvK?=
 =?us-ascii?Q?72CWckJkzSy6Yk0LalBajsCLt0nA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?75VK+VANwP2gESECUZ3RrMxrcn2e3BLZi4CJK0OeAHqt3kI9mLUynjW9+sSL?=
 =?us-ascii?Q?gcSdjdmrA7p5varIA1fQ+VIO8zZ+Wi019bliuIqh/iQPoPNX/JjqHMWDpr1+?=
 =?us-ascii?Q?xmMZtZ83y7Gwiru/kx9YMzyFpZFmZr95OGZx0jnz5uVYtmEqON+E7XMoilM+?=
 =?us-ascii?Q?XCHnE9JnCMRiKcA2DvL3mzEtm0b3xCePvYhW91umgGDs/6Rpdy4GwczY5fLM?=
 =?us-ascii?Q?o3tLvhRZsRqNsSPWFAR6V2E/vnmlwTwGvR/yrB9FB8DaIhU502BEQtDuozAT?=
 =?us-ascii?Q?Cs3PwuaO3UTevZuiHd+FPbRxOLsoq/iY6BtzMsoDQGZW7Crkvh4wwH19rnGw?=
 =?us-ascii?Q?0WM0brcyxgE50NM7AIGZQuBdv3FXoDn6NHG7n8YfjTu1/qILvROp3myCiMXy?=
 =?us-ascii?Q?B8h4Z5tZCsfw+GojVi0boWwJpVmdLauG5uY2Q+lFDESp02NGoMpFM5FL7K2i?=
 =?us-ascii?Q?0e5AivpmIzQDaeDiwYMPHQVz2BZLjLsAF4Wxb5IQ0D75aENgViXuopGNbLd7?=
 =?us-ascii?Q?Xj7TMuRA2sdjdEUgF5NaVTWv/pfxiBL29y/5l2rWk0ip8sDeppnxznZEcHes?=
 =?us-ascii?Q?ITi6Pl/gXI4uyqJczlYShTXM+5aCSddfG2Sho91YUl/BAUSt7PkTfobuseO9?=
 =?us-ascii?Q?Rr8meRDVqQ532IqruTM1MJFM9SKnx//SpLZ2CDGppS20OChrf4E4cmbh9G/t?=
 =?us-ascii?Q?+1Zy9+/RGkyKee6bKIf0NMPQGP8NaVGBFgiI19NA6ZjWWOPUvsVicOfh43Xj?=
 =?us-ascii?Q?XYVJmZmMjnNHBup2CRD/SwymQi0p6CqIk+c4JvF1UZoJF/06KkY5gYjxtW5O?=
 =?us-ascii?Q?O2DVDKcUctaWEVB+ydklSNJE5YBa6tWF+MkvK9cgzvuBb6kTjG6VqPm6mhv+?=
 =?us-ascii?Q?PBzr2baiRRDr3dlU5tJZe3YjVWRwg6Zlw5QWpTocD6gtwoALfH6p1/qU6xl0?=
 =?us-ascii?Q?fHyw0eXUeSfiK0F+ntdW2cepvD6/5Nnmx4i2MbZi/n/NDnWK6eT+6eWfqQr4?=
 =?us-ascii?Q?W4dU34OaHCNKoBXeWBwgn/QkTo8KKrDyX+DSP8zFh6t9OXd8bsAuDS2QURgy?=
 =?us-ascii?Q?1znoxoly+S/gaD8HW7PqcFXexiU6ePGfd9sNYv1KPA6rwCqZvyJ8Ke7yXhmn?=
 =?us-ascii?Q?pwODfucnLeaZRF44UHlToR5OEM5wo5YZLwCxhp17LihiJtb+tgK4fJCajCff?=
 =?us-ascii?Q?dVD3ZzbOnVwbjeGv+y9oa+SUIsrVl4PbB4qrUhLoMIg9UGlHs8tSaWyiU+EN?=
 =?us-ascii?Q?HFDOszLgy35Sn38OitA1E2qrlQjpuhiwdzhIA04lW1FeIrACMrC1kE1l30sr?=
 =?us-ascii?Q?62COvp7RmNo1JJxa1dY9KWAYLropNGOSpju6nrh78iQ8sXL6vyhIzpt7OPPi?=
 =?us-ascii?Q?qSM8fbU3fFApsFO0uYVLRNI6irpObMLZPev3TGwTFNnW6rzo8ng1lg0buZBo?=
 =?us-ascii?Q?qVJyvraPaIWIw8k1zuvU53IdpwhdsfNKi22THHt5p5Rgpv+79kPNbYGwuyWh?=
 =?us-ascii?Q?PK2OZ6nfNw0lSWGo7mAF4lzFToLzPDhJo9VOD0xUPlRaV5FWhy4GVNjXf2JB?=
 =?us-ascii?Q?W6y9mwy9zxmcUP5CFA2uotf3nJs3gkjCT+Pz3Nn7ZpK1Tsp0Z2OKJUdfjQD6?=
 =?us-ascii?Q?iO+H8H8HC1Shg9wLHKL+aKY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23371be-0491-40b7-51e3-08dd46a4f0cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:53:58.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIgRyL0qxAvkMipt8zNXXsYJzQk0bnqUHyEKHdJz9N8MA4qsBaFAd0h5h40o/Z4WL95+KDQd9eZ1ZnJaYvrPr5fZeObKwlXjfBS9v6sfUBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a4a2d9 cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=6Vxr1PFL7nVDcE-punIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CDYheGF3QZiCwTTm8gN1D9VDBcBMesOs
X-Proofpoint-GUID: a509PiZPU3ME-goDYRbjEzBSrh2K3Xiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=997 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502060098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210926

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The do_testsdk for lib32-core-image-sato aborts with below error:
configure: error: Package requirements (gtk+-3.0) were not met:
No package 'gtk+-3.0' found
Consider adjusting the PKG_CONFIG_PATH environment variable if you installed software in a non-standard prefix.

This causes due to an absolute path name in 'sdk_env', which is now stripped to have only the environment name.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=386e4132a9ced75599d92610cf5c0e8fe907c3b6

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/context.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 01c38c24e6..77e6a98f39 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -41,11 +41,13 @@ class OESDKTestContext(OETestContext):
 
     def hasTargetPackage(self, pkg, multilib=False, regex=False):
         if multilib:
-            # match multilib according to sdk_env
-            mls = self.td.get('MULTILIB_VARIANTS', '').split()
-            for ml in mls:
-                if ('ml'+ml) in self.sdk_env:
-                    pkg = ml + '-' + pkg
+            stripped_sdk_env = os.path.basename(self.sdk_env)
+            if stripped_sdk_env.startswith('environment-setup-'):
+                # match multilib according to sdk_env
+                mls = self.td.get('MULTILIB_VARIANTS', '').split()
+                for ml in mls:
+                    if ('ml'+ml) in stripped_sdk_env:
+                        pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
 class OESDKTestContextExecutor(OETestContextExecutor):
-- 
2.43.0


