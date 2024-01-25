Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B277C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17255.1706188628336864934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TmYIfesZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P9HLqH004362
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=d0dew0/BpFtVDWTHY1sgCp57aWOEKCOsUhk785QN+sQ=; b=
	TmYIfesZmczL/szEQAPM0eq8QQmtwIh5uE0NYm/8pIT3TOWJGJOfHx1DM9WQzX2I
	Cq7fnT6pJP8Zb33p0oEFXYj9GlQVS9xEvOzUymsOQ+b844CbR/guXYXoSBbt4NEh
	4th9u147pKjzuMEtLVDZfmNsHWNabmztmb7DIummvzO9FGZVRNpwnrYH4vJ8Scr1
	Wop5KOgRXAtYQ4AaJ3Yz7+rOY2bMXdnpJ7mu18XI+IPUU9m73yGplaj5Hg8U4shn
	8HrpNYEMCGYkVx7aGfNle7hW2laNxpOnJKhyMyyhFrEW0lEylaz5b8NTN99HbcXz
	Aw6ysI6FRtD5LFXKg6Pc9A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv20hmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llIPwcYiFl4z+scnlyWv7iBltQgTKEfqShuS/0BekQG5NoKD04l+fhp1oO97Np7YQ+JElCda3oIrAcc8DF+SP7xzy9FRJU7FrnfH/+i16gezsJHz/likjrD7dOuX728QWo4bhqiu92yZIaSZnNukZJ9LNnuKkEcqMCVPLULYw+ACGrH3aJAI3aIPgolqmmn30FK/8PE/7t8C1pEwjs3JWNvqW9jNXhbUt26vOU1mY1AmfyoLUmZvHb4s9Bdi2RkDN3yxzPxeVpHELn2B4yLAfbLkQZ5lY2OmylC1doUOZQndBPNhNC2X3vkLGcU9whJ5MfJ7mfYp5HXASaUpSjWkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0dew0/BpFtVDWTHY1sgCp57aWOEKCOsUhk785QN+sQ=;
 b=mKkYgnkScN91FBh5T+NIPRGWdPpZkFaAU+FZQNwjfuh68lwBGVPmOO2L8Phx0oy6eU8W9/lHVr29Tj6gNv7wQQ9GHh8smsYk+7E1f9S2n2LXd5BcyTsBEwLJs+wiq1QMeQI7hkw/kEXkJg1clqM4lEhIDcRMHh5/iv4erROgodjAHzPQ4ZDSSZZ/yH57fatS/xrutbNWQJLxCeIuZ08NvKRjRp5CUGzvlTLsdHIMZykHHSO57T/4PNlyy5dzu3DgqNb1LqPnLJRQjqtKm1BqydS8ULrYjpT3hI9kmshQLJ6mu3pftZezjTh69HF8YLqmGagLTLCCBvlPNAjFnrmiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 13:17:03 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:17:03 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 4/7] rust: Fix assertion failure error on oe-selftest
Date: Thu, 25 Jan 2024 05:16:00 -0800
Message-ID: <20240125131603.2769496-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
References: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2582e1-1078-4f6b-92c0-08dc1da7ebf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qvXfp/4mjgnoQWRqWDyT7kUp5pqQeXA7kaq0Shb1jGgTcNXR1tI6Lr4kh3kBQ/EHx0qvHD0/i50JTr+Z9kq1SQgUoAewWmnIttLWIhvpf/1vACobgTHywXqk+4Q6H3DuowyA98JAeZT+FIQT6lpdUVCKnydiiY9B3Ry/PxnSSP2vtl1GEd5ys7cp6ByiPVVX2VJ8uKya8QXa92HGdY+6l2iH287hUTK9dtPC9DmEmzaONJyR4jGDxX9PhQzSeAcPNiorHx8I4SaYiW3E0sW8S/aL4xO6yvW0Bd6rvCgDCbode4eTSYNR8G3e0FgH53J2VCU2Ee6Siu40j7MN7NOvKzhw0d7Ax0jRPgxvpqIdWhiHe9DwUx131Ud7tNB8wUpEcuR0cdgWR2e4YE4zYA+hQDhOgQfZzDOWSLo8QEIwP1vF/Rfct8Wdq/IZjkmGRfeGq0ejccPsVG9z6Pwc/TLwHuvRrM9RXHUIF665l7MiItPbQ/vQ+wnp49Hi6q9Tp60w0DS71fiBQPZR7/kaGlUDTTnCfSuLVg3e/yU6gEncdrAAB8lGtvEsXp9NJpkNbbf/VdZ/cp/HzQlmXU4PRSX23FKdMW03u8ucnfvpX9GB4Pc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(5660300002)(86362001)(6486002)(6916009)(66946007)(2906002)(66476007)(66556008)(316002)(38350700005)(36756003)(2616005)(478600001)(52116002)(38100700002)(6512007)(6506007)(9686003)(107886003)(41300700001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B52l49nerdGuPy7sIEijH1fHbUQLCzKUx/559vw5asRWfeheGmuvET8CSH/h?=
 =?us-ascii?Q?9fQPLw/qs8t2x8ogTTzbemfwmSze8XbKHbzjyy3TRFm2Xrm3Yf+zkLkdLD2i?=
 =?us-ascii?Q?Q/PYNr/Z7G1J5AcskJUDIt/D5FkjCFViQ3514tLCIECdbRClRaldmjW1zUCV?=
 =?us-ascii?Q?oGPG61+ngE2siqyrzEEPNWaIsir0FCtBIWZRY/P1Sk5w1R7iyyuYJ2aAP4O/?=
 =?us-ascii?Q?DxsEwD2SjEYeHaTbgO1yA5PCFE4QSmVWqvWwrRJxp5sfPD3/a9whIZ0diT4B?=
 =?us-ascii?Q?k/NYqDMwBdpBRPOUbe2JQvb7tIB6HX8HPr4tZzEEXG/W1/+FTRHpsbAQ7W2a?=
 =?us-ascii?Q?Pg1Jo9z56H37PT/erIfWAGA/sEHvEn6fg/Cf+lezFjASZKwVvh5snrW+9Emf?=
 =?us-ascii?Q?UINTokqo0Qd77/BVUrMTWTn6WrOicBgo6WbSuCJuDRGuPH9wUbRaqHwa3s1/?=
 =?us-ascii?Q?AY9L9B+ci9eg8bmvQNWXqc0KRCHnrUHl78eeBv0hqfvrtOWCIKYK+p4eh9t+?=
 =?us-ascii?Q?UlBOj1yacYas1kXmSs6aJG483BwsAPSlmMrD6ImyQlwSnhxuUpHlID0SlvM1?=
 =?us-ascii?Q?7zUQOOn2Qpn5V0hWZj1LsLJHQtOlHfMJWxsIZYWEwiOA9YbFAyd5LPlj5UVw?=
 =?us-ascii?Q?rs9B4/UrMboxBOztOEUla1snumFg9wbVzHwHxccUdNSpmKrXZIX078wvBMlw?=
 =?us-ascii?Q?j6K+ZtJca5kypJZWFEuRyzWGgFDZcum96AUnuGTLfAYWSDoFggv3oRhvY4Mz?=
 =?us-ascii?Q?YYgWC5wM+qCPetn2+zRARXzfvGJg36wzVvD0/F/ol2FCJ5AdsjjPReVbjRPf?=
 =?us-ascii?Q?t8SSuSjdyo3Qb6/Rl0lSSAM7cfsR6Py97wVc0Ew31IuDmijtgEE386B8rVJA?=
 =?us-ascii?Q?R+o5sTZA1VO1pieHNqwy/VlXBvHm6/fUSDoEXo23AZYWguIHOvRlglX7oKML?=
 =?us-ascii?Q?O0Q7+e8HaM+hXBUCp0CzMH81zfC3RCqATZDHz8U/X5yetbrv2bmFMu4jH8UP?=
 =?us-ascii?Q?++VHeJuNR5MgZvfDWviXdkX9z5F0cUMUECC+ahWaTGkuEy96pe050RgaGAiy?=
 =?us-ascii?Q?+pdL55IAOZKWLk2V7t6SWhtBYSfnUTyXSS2NWzN9IpnA8W4W90/dpdEDRFwY?=
 =?us-ascii?Q?LRLd3oSHMaAhxB3E4LAhfZhFGDaDb5sDoVqUzbCuEpKjPnrklSpG1IF9fxfP?=
 =?us-ascii?Q?PX1ITEeSI04fddbRhBFLEWh6aWE0jJNWnAiUZdtcSfworYb7s+slw7LA2AFd?=
 =?us-ascii?Q?F9wx12WdLx9KCIVpHSCT290vDGJbeUD20XeFtSELgauG/auCBaBKQdDsplvv?=
 =?us-ascii?Q?CUzm1E405cBjRUet5xrcmD0bzqNWWVa1Gw4RtjPi+MvcAPH4DxQuhT8mnXkH?=
 =?us-ascii?Q?DVWR1jpfEJUdgvjZO2gyH9Eg9i/BE3xphyw2OTxBMhDF2OdZm1UlHH1insmu?=
 =?us-ascii?Q?V8ZfZqqqB/6egr8PYytSY1JrggwSweZ+zja4lc73chcAU45SSlpGr2OcWMw5?=
 =?us-ascii?Q?8Bv0X74iMKTFNNRFZj95rPervzajyqMvpmIw7lc+z3KQwkXMEs4fSZahtQxA?=
 =?us-ascii?Q?tVsk6EfRPeGEl3XE6mRNj5QWpu0PeJody43WDKbbzbrzPLJLFCwQ3b7Hmg/g?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2582e1-1078-4f6b-92c0-08dc1da7ebf1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:17:03.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BfKL0EuoMOxR7A2T61qN2m/HXvGFlz25r7Qp1r/+Dx+gLFwRLd2TQi59eaknW4vHRuY9HdLu0kHl101gEqdXdVchtrNTFHvBFP5sRzVXKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
X-Proofpoint-GUID: mJYN0uffLFN1Mu0vx2uIm4lz7O79wNIe
X-Proofpoint-ORIG-GUID: mJYN0uffLFN1Mu0vx2uIm4lz7O79wNIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=814 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194323

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: thread 'main' panicked at 'assertion failed: `(left == right)`
       left: `x86_64-unknown-linux-gnu`,
       right: `x86_64-poky-linux-gnu`: Cannot obtain compiler for non-native build triple at stage 0', compile.rs:1474:13

Add correct target value for cross-compiled targets on stage1 during rust oe-selfest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/target-build-value.patch       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/target-build-value.patch

diff --git a/meta/recipes-devtools/rust/files/target-build-value.patch b/meta/recipes-devtools/rust/files/target-build-value.patch
new file mode 100644
index 0000000000..23e8c76801
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-build-value.patch
@@ -0,0 +1,26 @@
+Add correct build value for cross-compiled targets on stage1 when
+bootstapping rustc.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/b888e2f82b9dbe81875f50d13adbc0271a9401ff]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rustc_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id = if suite == "ui-fulldeps" && compiler.stage == 1 {
+-            compiler = builder.compiler(compiler.stage - 1, target);
+-            format!("stage{}-{}", compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. Using `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stage 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build = builder.build.build;
++            compiler = builder.compiler(compiler.stage - 1, build);
++            format!("stage{}-{}", compiler.stage + 1, build)
+         } else {
+             format!("stage{}-{}", compiler.stage, target)
+         };
-- 
2.43.0


