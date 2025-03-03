Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6712CC282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:35:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.56344.1741016119143966991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 07:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51574f6b04=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AuqMu001627
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Mar 2025 15:35:18 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s78a90j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:35:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=famK5VzR4lwHU70W3BgnG0EgowoWAXZzz+saMVSv5QzJ39sLYDa1D9iGgy+Oyt25V6xPv92yZYsWLBNIeysYCDDfvynWM/2lkzNK7U737Hu5PZ5dLsYgd06rTghLrRXrfpQlfBUn8AnQwgiAK8sDUyykQXjMOZKVDyOK9K3ZIu0pALKt+0iAAqTursJSCJtn6z0a9/7Kn5ZCo+2aR9LhAd89XydzsqsI54QjcmvLQKZwLppZ/oAevonndAjwR3F3vTia+iVx25XBE3a/E0BnwLOa0tOdyTATNlm38bLuQ3V2cU5tcBaaTXjNPPjo2od4E8Czg2GQsV6/yd6WJXv8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJ6zI+OOihWfXk7mpnSxwF7W0xQFATtpDosYtUEJ418=;
 b=Q8lgd4dqtVy1Ma6gYiDwYgx4v9+Ao89W1IdB8dBZIaMeF7PDNI5u4DTwlXVLnO2gU+81+8335G6rx5SY7svlOtEX7l3sJ+OzIdoS6ES0Qhf/Xc1l5IeaVgRJEsjKPrEmqjR9aYRcj0AawhLmG3bhtZQvnA8C7bMRmXo0Cj9JmnoRbwklSdYBydEVf7XFoau+5JHytKtoG/4oDPl6P1Y6vLOTlMUVfGAa6KCcFdsOT5DCGoNbQ0rO2mNVsJq3RYB2us/AUBfO2H6sOBNmA60IsoJXGp+MIlxul2OjLofI5NVWgLGrf15rgIqQN+KqAowuTkNgI9AEl/MeZNAVwDpatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Mon, 3 Mar
 2025 15:35:16 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8489.028; Mon, 3 Mar 2025
 15:35:16 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        deepesh.varatharajan@windriver.com
Subject: [PATCH V2 2/3] rust: Fix build break because of download-ci-llvm
Date: Mon,  3 Mar 2025 07:34:57 -0800
Message-ID: <20250303153458.2879205-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
References: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9ae9d4-0661-45b3-7662-08dd5a68ff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PQKOPodckQo299hiaVIpOQ9lB2aElFINOFjhOsqyPAwiXJDnAZehxJXahzW6?=
 =?us-ascii?Q?gaJkBbhTerYc4vKr4zTuNt+3cZYg9Ec8Hi7hEij8uWiew0wcrwCrMq2sQ2dT?=
 =?us-ascii?Q?CB/rzG2+jdO+WVoxXzDJ1XlAajtFEwaX9t9xg95sB2mBrgXImfZ9NeAuPWxa?=
 =?us-ascii?Q?l+OzQb418FWAjzc1SWk3p7/EG/TRLo5BsfZgXqpfML2zVG/bFlzlOUYu59bT?=
 =?us-ascii?Q?gT+xrhDyuUO0pd2ItIho+tFclb7fezNFpVZlnmw0e2/wrOW9sJLbQi2p4f0L?=
 =?us-ascii?Q?9hW4+bq6lqlw5MRBtp0AudfTp6SFhdEhj6px51qaMi4J79YTqGluwoSbZpo/?=
 =?us-ascii?Q?Xmacs8n6G/Q4Un48eqmdAKYZx6Wrs5GMp0L/IiYVTPN5aVr5tjsMfkVPCE3e?=
 =?us-ascii?Q?xyxYwch6Bnu5mMar5rskBWOCVSc8ePUAe+dW/B1mWMytkROKqhibV68l1eq7?=
 =?us-ascii?Q?dFuwA/uSJgW3gyNfxXF0Cyk0hgseYQ/wr+Q/YH+ZHoBcuAYmGXvIBKSQwHEp?=
 =?us-ascii?Q?ZTyraKDWAQFgxHJrcsUoyjVJ8UMSc5d5UjXrNlrxs5/mSRqiJlTPr/e2Hux4?=
 =?us-ascii?Q?SHSSKtT62Fg6qyWMUqCesIKoGI5J7pwMDPhST8y2MzhbZGwxHF3XwKu0QxU8?=
 =?us-ascii?Q?ILdgGbGUxbEf/TGxXUiZghSgg8kTr2YdorlgDo5crsGUnwNHo92KMwQFapty?=
 =?us-ascii?Q?4YVrAMxtPrr3YpYUdEYG6rss6R3xjVV3uAtx8u+AMLhCdXWEN7Sf6L2gEN6Y?=
 =?us-ascii?Q?JKfZqsWJ93qi1T9BMnss+c2nkkd7cp2a8WikkVz0BBJpwCq3rlEbeAKr7rsP?=
 =?us-ascii?Q?z5hhEsf31jLBOeOivGHNYJVoJirZAjM/Eq4FP3sMUmpcGSPGyVlv7ibgguYO?=
 =?us-ascii?Q?ZaXZNHwcPYs+bYf6LT5uJoijD+cyCdZljXUiHhif7lsUoETiPQB0kOijExGq?=
 =?us-ascii?Q?jMj3zw7Dm+KnExav9+nhYVaKP+gBq2SxpMM7JopLA6pI7O0dBmVZppXDDBWf?=
 =?us-ascii?Q?Gnmd0K07z8oNNmAzN3yrNSPGl4aKjLsPIKzNbbVHwHSSSuRXnxgu15zUOGWc?=
 =?us-ascii?Q?tDH0pxMsJK0ib/q5VrGlv9ghJuAwivzKIwdPhzUo1gQJOizj1IB395lO1dmo?=
 =?us-ascii?Q?O949Ee+yIxt4GvTYIOyw1AXwBwVfxbzegIft0o/b32xlPolVwHLNrJF96SNA?=
 =?us-ascii?Q?OSh28uNKvlZMO+1hO8QxeoUhEutpDvaPiTdgNu64tH+ES24KaWy/2S6iVwMt?=
 =?us-ascii?Q?szHrBGAcTBCcF2kykIMHGANwxhw7bdujQNt7m9b7JCB/GYN6zVc7BN+XWKlP?=
 =?us-ascii?Q?C6lCEPsSr18lNLHG2eCTSiTeHYxDX+SUO3aQi1iIVn+kHmF/3SUKZ5n+p8LA?=
 =?us-ascii?Q?3skh7axCTGtx4a7OiZq3pKb53ig+TKZeaW2m3Wk68zlyCO5x/L9qBDsf88sR?=
 =?us-ascii?Q?diaDboenYHR2xuK6ax03FTFDmQfWswhd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hmxf4/idKukWtueYP1mk/PoQ65pi0lisqbqDXqxdXwUNeerDOtK6sRmPGPGb?=
 =?us-ascii?Q?FsIC/2u+VYu2omuPGQH4+AD8hsi4stTNWtbicI5pv3Y0TW24Mx1PmrbDaRW5?=
 =?us-ascii?Q?9igw2yqjqeLjn8vQ+ta2gqkUpdUjYMo1+DzYUpYolCwSwwVSuxyvWjsopE8j?=
 =?us-ascii?Q?Xv++ZJOG13RNMlB31DLm2pEFePssrAYV8HhQvFqsyBE2uPooQMmzzQpJTq8Z?=
 =?us-ascii?Q?iQFA6YPLkWliy3cG8aez6NpCK2Ozz5kVGU2Jns55Zs6O3+UwmYA9Ow1IqIDY?=
 =?us-ascii?Q?oKVqH1PeB8m8im8I42k2WuJKtsAODUwDggGaFR2LV/UVcB76MSUh5rLNfVG2?=
 =?us-ascii?Q?pSSHg/WBRqJILgn3a2rA5PxU755ZeRl89G1HtzvpOFFErLdnqCOsbA0ZsADf?=
 =?us-ascii?Q?/qfJgMAzZAuHDTS8B/49tazoOJ6c+5Gp8KmmWOL020g56vwuUXLzCGZNGxDM?=
 =?us-ascii?Q?WdFrm+kyT2uQ5IwTY/RBoK9dBq98weTPDTPFS645A39U7ocRGTSzIoMo6Kim?=
 =?us-ascii?Q?4w+PNe9mi13ZbutCyT5UW54EISvldwZPx2FtoRUvVMGcqJaGPmiLSxMsrJ6+?=
 =?us-ascii?Q?zvwB587GTy5vvhAOUekmhrcqWIWwZqTkv/V6nE2E+0AP/7IrIGHCquTvo5kP?=
 =?us-ascii?Q?86rxWMyKINbBEiCelh5e6im2SNQjLYf7/FNe67HyGRzES8mPgtnOSwPUC7kG?=
 =?us-ascii?Q?goMvR72mvCv0mdRczOSknZLeFzFIRe28MEb3CLZ678yp2OBsMkcBcKU0f7lc?=
 =?us-ascii?Q?5SlEO4HVxWlC5b90hNKteTDcMsf2cZdYfiCRhAb9fnumr0WZQwcHZT8vwboW?=
 =?us-ascii?Q?n8waptfPlsSoVdIqWkgWxOfVoJq5qXwnBaIXMnzoFt4ptx1OM+iOySGW6i5V?=
 =?us-ascii?Q?WOm5ZK79J06fHVlOlB95+IpIaHVXDBLuHQ0GmXJEWZSUG/f0iGoCoS7UOkIV?=
 =?us-ascii?Q?nTMgnDsmjnGY1eD/XQKgqN6ggiy+8cSDFfuB4N8VenYCU5Equ136r2nD7aCf?=
 =?us-ascii?Q?72OwVrt6i5Ldk0yGEafQLewKVKzfYsdoowXoKyINcNOrb2yzYb8B1WrZlHic?=
 =?us-ascii?Q?xACNcL3rUKMLRCF5sBR0/USv548uK0jmNAUVgb2oQv4LCChKHDThkXlQixep?=
 =?us-ascii?Q?jPPGrzpjLnfmGLA/SwUvS4rpEY+Ec/7cQ1gaeF1JALBiJQWdq4PcWwuD4O0m?=
 =?us-ascii?Q?0YgVyquqvWpnBKDbSHCHkToiGXCIlA1aM3y099O+ajuptOA9lYiJTiZh1tp7?=
 =?us-ascii?Q?3hjQfNLYZscUCQaHMlctEB+KtZnYsXN+34QAlA1QY1fxaAmHlmJzJOMtzjDq?=
 =?us-ascii?Q?HHmOOxxtEwuODr3Arlu8ncvwT/MWmX44z23WXG5L/LrOZM49IwpPDGZd7Pj3?=
 =?us-ascii?Q?/Ce44Am2GTZvkiM3xLoWzFWH7fiAI93EYmpI/xD+tErTUaR20Y/6qye0R/pu?=
 =?us-ascii?Q?vzeel97JRqJUVJRZT254T547n05pbWRTtHdyfvbxQF2PkB9RQM8Xg5r11hat?=
 =?us-ascii?Q?PyPhfhsqjtuPkkps6+y00f1tibS39hRC1wWDugK7ccTOh8lQA0y37PdZvJFX?=
 =?us-ascii?Q?UUio91klOHkp+0lD/JkR5T+gSMo/RbfvD1mQmiZfLdOxV7+Zg6yGcCZnQ/DY?=
 =?us-ascii?Q?ah+lZfwF7h0DvfoMNOjrtL0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9ae9d4-0661-45b3-7662-08dd5a68ff81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 15:35:16.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfBICdcAloGpPyN5rP5LUCgNkchv6J9O5+cZCAkXfT9UrhZ4Yo4izwReEJmGj5l9Q48JK128GGTsx9w4frSI85aihQRyD6iR43yo3G2i+qMvojKxvPI/mLALi6gyyk9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-Proofpoint-GUID: EQpup2yJ2jS5QML4OgkdYE-mIg2J2xxj
X-Proofpoint-ORIG-GUID: EQpup2yJ2jS5QML4OgkdYE-mIg2J2xxj
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c5cc36 cx=c_pps a=7V8mf9/socFTThwl5N0qNQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=Mf4bPNXLvqR2lc0z37IA:9 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=997 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212212

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

-----------------------------------------------------------------------
| thread 'main' panicked at src/core/config/config.rs:2047:13:
| setting build-target.llvm-config is incompatible with download-ci-llvm.
-----------------------------------------------------------------------

Disable the automatic download of pre-built LLVM binaries, ensuring
compatibility with local LLVM builds and preventing conflicts with other
configuration settings.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
index 2bf87ba27e..ffbac267b6 100644
--- a/meta/recipes-devtools/rust/rust_1.83.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -129,6 +129,7 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))
 
-- 
2.43.0


