Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A749D3B7EA
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 08:02:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14428.1732521716376439123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 00:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1059382f76=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP5xhuj028711
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 00:01:56 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b799gh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 00:01:55 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AP81tBf012181
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 00:01:55 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b799ggy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 00:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7RcewKr6ltVvk1Ezbpfx4yGQfA7yGN/JewSavkb6zMXnxTHaYeLtlfvytx5Dn6CR/Xhx3sS9ZIuLd0EO5MrcnezD85XRUOBnmpAz98Vr7zj7+5wRbp7dJe6YLN2Prf6W3UHTVadWXpWsuY5LpSrb5WRzv/u51A43+4JKQ114GXNr09fenvsj5/daH6tqpRBJfNK8fuz880tkp7BtNnP9J3pr92FRIoqqE3DmGf33dVLiz2y2r8XxrL6HTUpPuFZOPyIBC+xspXGpMk7d8B3Km0mBdMh8tWsjJCa55YjnoSiGnMs6+TIPKcl0F9QcbvK1aToSF3yoUP7+ti19CjcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb3dr5udo+TeYSOV4zwcUY8qDe3xwFJrG9AUJsB5wh8=;
 b=yoAA6d24yTinETMbXMTcUvdh5m1XRS2WJNf788BzWxtbcjBImZiWSSsv3mHQq1CXc28/gDbPBijjw6DkHBl/QwOoBA7zAU2nEgsmCc43CU48tciSWyRyUeuljkumFVWvy/B9YX5LEnl4nY/eDA3SbwI/37fAM8LWC19FA7MhbsLIGaGP5kQSvh7AZ4hEucH3OONCVz3dGV7Flrty5/OAlfazkKjIHHi9l0Cm9ueCcJXCBPdtlOszCxaYUUMjl/ApxttS0xDMoAK9Ltm7q4Aaov8kA+d4BEfMuqCea3x3BWVRUHYlDcqWgnXx1Hg8mcveRJ/rCtzG1tFDlgEXmCmEhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 08:01:50 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 08:01:50 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com, raj.khem@gmail.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Mon, 25 Nov 2024 00:01:35 -0800
Message-ID: <20241125080135.808368-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|PH7PR11MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0218b3f8-e376-411c-3a8e-08dd0d276ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n4baAXCAx366XOvEyiKiQDRQ+juOFtUOpE6MRQnvF/wjAz0kUy9TvvG8CLCQ?=
 =?us-ascii?Q?7pZA0XV7PFm9ud9IfyifVKKDbuNLLSlB4Mj+0exHfJfl1yapeuXcyqs2fZPY?=
 =?us-ascii?Q?qFeOtCzQlyvchi1RMK+O7Y2dtRtusbDtGC3MiRlQ2zqn92DLEO68072g29LQ?=
 =?us-ascii?Q?TFRfz+d73UkHRr6cC1yhpkSRR+D78tI8y7d4IqAXqNONjEKyx5OurVj5Jg2t?=
 =?us-ascii?Q?WZg9Sc24zHr0LZrR7fgRVIBsPLP+nYL3wIliwGtE7Y/cMj4t6YKEb5Sia+7Z?=
 =?us-ascii?Q?kjg98TVGUzrqjBD6uqRSeXwL7eb45zK3+kCd+jPK1Ni3b5hjfeGpiWzkMjZl?=
 =?us-ascii?Q?lznulx2GYG9VBEHL1L/dv2WzKEGLyndKNq5EK6K1e0ZSKXJlvNaX2a2JQ+g4?=
 =?us-ascii?Q?4gBm3iBgtnml6hc6oHFx7u2jwp2NoDj2nDkUknON7dnKyuSFO+wI+GQ3N4BP?=
 =?us-ascii?Q?nmpqFK3PhvjGtXapzhubgMQ5iGfzxUuyJP0+wuPWfktsASeA4N/cT7CrK6t1?=
 =?us-ascii?Q?GMoXgFG6S+2fLz/YgUEZvB9Ww3fZOh0V3Ak0YmNWthCvO1ZKIvAwf5rzLhws?=
 =?us-ascii?Q?TyqblEwWiH8nuk+VTsRDsS3xraZNayYI2XrqltAvw1trg7uLSKg9ECFO7UeU?=
 =?us-ascii?Q?V0bldyJ5GCDSpwjGDkCrK9StjNnQxB1VrD7HZpRyLro091j/Ao+nOpnQvFdt?=
 =?us-ascii?Q?69vculw9GchrpAPH87iQxvHoIa6tm+RLs4hMo1NEj4BQTMjc2ediJVlrTrhz?=
 =?us-ascii?Q?q0zebvh8Gotb0uBJjCvcoajHQME9vt7RZ1XNaAGns7NmWWEGxHcFR6cUxvra?=
 =?us-ascii?Q?GyRjMfafVGR8thEkHsOqWh29uUanS2S3ei7NTQHtvpSD3yk8mdTwnpQiWXMx?=
 =?us-ascii?Q?Y7FBJxoPUF6UhKpIVMaIWgx+Rx3Y9PCnpvMIkbLyAFJpbyMhi9GZt6OpYzsp?=
 =?us-ascii?Q?tqAAFnlXZoTLLYZI0TkiuafhUzCfvmjSpgAO3SBLQveM6Rb6b7GVNM2KQ4Qu?=
 =?us-ascii?Q?shtZzWoVJ1vlXokCnSlfNBdRONrA+I0nz0Th0gJNrOK7XIOwskkwywxZHqqO?=
 =?us-ascii?Q?SWiDu4I8hBXY4jB556BITqCGn4gslAeVIGLjOBvCdgyJkKAyRFOemA6qkVPx?=
 =?us-ascii?Q?fNheqwvoh5e9bbHOJy5HpBMR7gt4pshgLT1v6sennZV07jb6PPLF9VBr/eJa?=
 =?us-ascii?Q?vbHFrW94CMlX3a/up/WAqauBDEwfen6dMWsoTKUGe6q6FsSLVCWo1tLDRh90?=
 =?us-ascii?Q?Hdt3Vy64a5DjAOQeLvi3T6FKh6M0uHR2cFpbZrFTOS86JOt+YwxtpSrlSi1b?=
 =?us-ascii?Q?RxG9t5Ysa7/6+F2HPhANNLgmvKeGgT7acH02T7lh+650uCc3FtHq9X0Br1SG?=
 =?us-ascii?Q?KAwVhspbzyYxd0Bw9dcwmukiJiLJxKp503p55aJxMhQF26zgWw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zm7H9gC6wOc1oL07dYAKifmm94xBstSOB3/ezRxs5L2DKpnRetsBOVyzHkgq?=
 =?us-ascii?Q?vHSAnzU1yCjz8CNGEU3sZdRLO1i3KcPloQtzlB7WviwQDLFwtM4Uuk5lBN0a?=
 =?us-ascii?Q?sr1jmp/z8yZnwyIh9RLbQgtkKjp7ZVMpH9SG5Yfm/mIl+v7C9j9U4QZcYuQn?=
 =?us-ascii?Q?aPaofiEBwteZrQYQKeGIED5aB/2hQrdCyzI2omnlrjoNQEbwuMqE4on23mNx?=
 =?us-ascii?Q?D1XiE/55eS2Hib7kbdJfxi7iDNMt8bKeyMuUouCZrKqQDhJEMDM0lXdy5SFA?=
 =?us-ascii?Q?Rs/3PFYBxhB6PdhhnzWiqW4PKdeLrN0GWTtnn9zZgnTvTO8tRUcDe7YzHXts?=
 =?us-ascii?Q?jYM9szyaQoudwWqwV/TwrCsV/w0hPzPXmG0CEHRsHSpD90kGrAb3Q318RP4J?=
 =?us-ascii?Q?utgHM1gluTp47OgcJXNMW7q81HVkqAfxWNqARTgL5U425W2jB01nZ6kTKyCV?=
 =?us-ascii?Q?k0mX/6qxr7WJaF6Ud+Yutt68p1bJb2IQoA7OOB8R3TRMOHagPxsIBuKFeZE5?=
 =?us-ascii?Q?R/mHV9F1LyNpl1/flTmmtdQxf9Z23fLRoUHtCpLmNhhI8pt3PPQylXga2hrq?=
 =?us-ascii?Q?vR52pDa8Y0wSPQxio3bh10oRU5j/HdZVzYN8ZO7WAaSy2HmgS5FAxOq70ZJW?=
 =?us-ascii?Q?102rl9GOuY4lUZdDLgxVa+Si4yZ3wnxrZcYYMuH5IH8EIjN0Cpmua6zTwZi3?=
 =?us-ascii?Q?LgfimcpehBCDfcTRU3xhNBZc9NhS/o6r89DDMy7H2b4PEEaqoDODWWzihaR6?=
 =?us-ascii?Q?w6Jxt6uX0JXhCMom5PiuHW7nAF5FnQNSYOZ2WoT2axKBxS42us/fjG8oq4mP?=
 =?us-ascii?Q?ZzmeSRUFijKUZ3G4ILJuJKo0AWj5V1nxl3Og9KJjQL8wFn33DZsqZPd9c0H3?=
 =?us-ascii?Q?u1nszdKWFvg/ro83YEIEFb+hG4N504vPzBLlJhHyNjA3C9hlJlm3P8umFXvT?=
 =?us-ascii?Q?MxW5Z4hAKRiymjftKZwooQXqkwQCS2OaWtG4eGxShmIP+ucFVcMOIOt/RbAK?=
 =?us-ascii?Q?yX/7NX7SlPTXO5M/mpdOo+d7MGk47UpfwI2FXSHRKg3HirSMDuZabQdKFKlO?=
 =?us-ascii?Q?RhyvcLk3ckgGoHhYS8r+KaZTXO0Jt6Z2b0JJdzgX/23DRzNrg+spWCBmUa03?=
 =?us-ascii?Q?lDh7xFSdksdLDAC7JsCe7kQZtgYLhNayFesan49/xVlR7aeovvf7PBVZQam8?=
 =?us-ascii?Q?MZ04aUNuchNaLUA3Hekl143F8hRDbVBApodpvY/44EjOXxREf86FXT/KXca3?=
 =?us-ascii?Q?wrgKI4rJ9ti3hTJP+ZhFFlkYWRCjd//rZOZkbi1qCMDDI362bKCAihRkOhk3?=
 =?us-ascii?Q?51d0A0SGUGbt/zWQQg/tA5lpf/EwF6ZKOF4fYId8+w+Ej+cxIKG281H2Pn1a?=
 =?us-ascii?Q?QfJNofQfqZoyJUXciW5x3qq7oJnrkQFB3UXIK5msvIFvAIlxWAMx4Y4bPG0X?=
 =?us-ascii?Q?S2v1kWULCHGmdgA05OZP79ok0YDz5TLhkuY8X2WiGXeBZeufv4NkdlFGaBMV?=
 =?us-ascii?Q?wbLqG1xrlBGbdRrAaNNl5nxniHHg9/fmgiRybqzW1ibkDrREnFdbg7SX8mCT?=
 =?us-ascii?Q?aTiMhGNLFSYfV3mKMAZVQ8wBfxHxqavFQj9MAGJ8CFUTl9tP70IlzN99ZyBO?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0218b3f8-e376-411c-3a8e-08dd0d276ada
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 08:01:50.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZbESp02qZJwN+VWO5pgYr11xrNKnqM+51WsobesMWpgBXpXQXh3ShMRFurL0aTztdx74OTvCae50iy0G69evv2c3keS0xfLoYzc1SSLQFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=67442ef3 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=WUdzsKlff8mqfmIN9xkA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: s__bxg6DQQRmK_SbQLGgX0aoQvBI3EYj
X-Proofpoint-ORIG-GUID: VVTNmroSlW6uLnoiaavcGzvkvXlwX3C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-25_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=852 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411250068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 08:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207721

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
dcaf51b41e elf: Change ldconfig auxcache magic number (bug 32231)
b3c51635ef Make tst-strtod-underflow type-generic
b74be22f65 Add crt1-2.0.o for glibc 2.0 compatibility tests
fcdf98f38c Add tests of more strtod special cases
3edc0f22a6 Add more tests of strtod end pointer
988de94538 Make tst-strtod2 and tst-strtod5 type-generic
a2f7087237 powerpc64le: Build new strtod tests with long double ABI flags (bug 32145)
6624318c89 Do not set errno for overflowing NaN payload in strtod/nan (bug 32045)
63bcc01744 Improve NaN payload testing
86369c9ee4 Make __strtod_internal tests type-generic
a7be595c67 Fix strtod subnormal rounding (bug 30220)
9cfeccf65a More thoroughly test underflow / errno in tst-strtod-round
293e4e3c90 Test errno setting on strtod overflow in tst-strtod-round
d8b4fc3653 Add tests of fread
373aab3e52 stdio-common: Add new test for fdopen

Testresults:
After update	|Before update	 |Difference
PASS: 4889	|PASS: 4885	 |PASS: +4
FAIL: 229	|FAIL: 229	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 227|UNSUPPORTED: 227|UNSUPPORTED: 0

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index dc162b2946..b3b21bd07d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "84f6bfce2c37e32b9888321fc3131ffbbe6deeba"
+SRCREV_glibc ?= "dcaf51b41e259387602774829c45222d0507f90a"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


