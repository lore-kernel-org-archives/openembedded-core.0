Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36361D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 04:50:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.44516.1730091022175318870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 21:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0031a08bcd=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4e4GI023464
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 21:50:21 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gyxjsc5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 21:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQe5QN+Inp3dtUEpqmbvp5Khtl2N4HQtDYs6CV3IlRznF5deTO8UxDGxmztgOhs6V3+LUq7oGq3/SOzooJgW03MP13h8dbrsd5MwWzdZL1xUALwrRa355AUX7jVe7bvzZ/bdTBfZisipMhhRYk+kFawgUnZo7AJFe4FVw4fJ6l2urdcJ6wpaCs/88eMS3bm/s5iWMiGDHcJrF4wEKY9KxWhRjSxEjnIoe6vdb+BD7nTz+RLdKNErssVQiHauwXKHyy1PP62V548fGgA51XIGfZtEMDprZEDek3LdwiFokgQ06uW6zmOeF1U++QA6WH3P1jp6Cy/qr1K0qAx+89yS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nxZdoDZaISoR5ESNyBLFgYkdqqmqA587FuomNWqA3s=;
 b=C+ycfy5cgsGHiaoPBYoXNwvd7UimLZJeCanRRKdMnkqe8YoSL//rhXwXyCdDQM4USoNPDQNs/ShM0wksHJsBNyp/Lj3DIlUmH+NBFDElQvvJu3vXwHRwd5NLwM3ResbP96OAINDuVYRe5fxdhOoXE9cAGkqzXasjMPBPEnpD+kbPcquId8WnWMgInONGfO1K+0XhyFYb6J6Vc1gFK/FXhKKcZS5Jm53F0uijiXkd0Sca/Kf8nhSGiwk6M4NKD0zDnM2X5cLvxCTM8zkDauK9cTcLyqCt4r88jxWB8ALtWRTiDHTiin8cvB6mDp8f0fULcKb+lvVK57JBoX0H84PGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 04:50:18 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 04:50:18 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust: Remove passing test cases from the exclude list in the Rust OE self-test.
Date: Sun, 27 Oct 2024 21:50:02 -0700
Message-ID: <20241028045002.2636967-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3d47f2-f4a6-43b2-44ca-08dcf70c053e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6K/OlTMVOwV68bOC8aIJo5iZGTkagC3c7qavlHB3PQMKJvNux1/pl6Gm0ZLO?=
 =?us-ascii?Q?l/g3QCBU5KVBG30rBXq8fCH8R7MBi7YERXgXUtiyLcO6mNc8SdfwN70SdqC8?=
 =?us-ascii?Q?qXmRCrzf7H+0wtpWTHAZuxFelXYl61/3jpzkbNIgtPxq19cY2wQzUxIHXUfO?=
 =?us-ascii?Q?dD4Nbn8G/7i83BTLjpKAEV0Tszs4JQnWnELrYSZ/0e3IUX/uWFLw8Rl1hpQj?=
 =?us-ascii?Q?5xOZZ0E2C8vasztqbwczrTijXzprnY0PQLi9k0d7ickKPdpjNxCpSMCvyg6t?=
 =?us-ascii?Q?m6p+stKSOC2rr3s7/i1uM9v6I1/fI1LxCXm4s/thesjRhwCLJPaGHxXqb2yo?=
 =?us-ascii?Q?EQF64GeuJ1N9cv45XOxOSBZemiFf1+PMFszqPe1K/SjbMgZS/KWByJ1NHOJD?=
 =?us-ascii?Q?THtHzghgAOxvu27YY3p9tAfKEgv0HFDZ2NpyZe8TYL71lwjXHb2OnQGN+g5l?=
 =?us-ascii?Q?wYuOSfjLntWcC1/x887kRcqjmXp87WH1RPYtT35pePkuJz2unGfgeIEOko0R?=
 =?us-ascii?Q?7q8s4D6o2VeOENn3vx1s9i7YoN/No4hPHiCOKgd/RVuf8B7f7knLLpj9AYVI?=
 =?us-ascii?Q?h1R+SY4ISvh8XGd6evjRRnr6scUUJ6g62oEicMt0ixrcoUl+Cm8+XmoMtBkt?=
 =?us-ascii?Q?yb6N2z+y5sB3EefVkB/6wvWOeIPXOlWDwfeRtG6DJ0WoJqUS9496jmcfmNIx?=
 =?us-ascii?Q?PQS38pbLLpvwOwZk5sUBZs8/mg1FksIENeo16z935Tgw4UHnn9OYDY5HPXyt?=
 =?us-ascii?Q?Xz/ZCjy3QRT+xIEc4kpuJE8UKe9g5oJpyBpSDZt3LaConKsKPQ17TWtFx9i8?=
 =?us-ascii?Q?G1tpTp4nTtqpQNEIlTDK7lRrESXFWUmGLFasVPmhzeJFEfqitrmc+cFXg9sn?=
 =?us-ascii?Q?sZAnclRZwxD7v/Vg0Cf9mmtI7XAFabAUSiSI+UxijYH4EBoG+eD4lI9B3El+?=
 =?us-ascii?Q?E64tHxbv6wznnC+7fL/l0fgpY/BVMVlUhrLtx51erI9FPVR43LWqX193iMBF?=
 =?us-ascii?Q?jrqnvuaFI4EL25f/Hxvz/hAxFiYeNzJvwj+FTI0AoDMlrx4694NP7RpNQZcr?=
 =?us-ascii?Q?nKq5I7hVjbZJxKxH9yc+JqnHmDh7ECVusdjBo7+AVl5AbWvfo9lQb/RWVNFg?=
 =?us-ascii?Q?zXoVZ4ejFxUWCUr8Dcx0N+sN8IYX+9vfH2Os3bav0ZEzi3w9wwPBectPbdE9?=
 =?us-ascii?Q?h/zQcH283vW0KIn2NJOLIJ/3HRlHaZKnN/tT5WGSf56Ozbd8BuKxBI3apLPZ?=
 =?us-ascii?Q?+Ju8eKmYfK9Tp+LVtdUF49FLgkck2aluHVQJFRNwzhaLDEjwjYJh/Ge7geWw?=
 =?us-ascii?Q?zpCUqXl94LOmBagn/4Zsq2jm3pGPo1Frb0U/wbB56YC7VEU6MFhe2Jok3kql?=
 =?us-ascii?Q?vca/bMg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UWnzgF32KfpURS4XqsG+YAEHCzYxEJiJu5hiCRJZpeuNKp+oCXYwuGJWoUnQ?=
 =?us-ascii?Q?6In4kwJc46wKHDdGXibdu80rgR7gty1fvcOX+B3gKcJ32Do52iZv4hY7RMHr?=
 =?us-ascii?Q?B53Mg/vKkj8/frw6GchGlO1ECmjG+ZRj16CxFrcfduIxnrgC6v7L/F0srxQm?=
 =?us-ascii?Q?by7NOeI1i5SDO9J/ivietHThIl/E1dfQGRUALXj1cs1igrpG9bEDd+Ug7BlC?=
 =?us-ascii?Q?0rioZUCW0r/x7ip9GZy5FuosuHIQQgKP4Zhbc45CVdLZ/MYfMHYLZh/36Zvr?=
 =?us-ascii?Q?FaMtHwh5hELPry55m5/CY5GKykNr8Zap0P8g+yTRroXyMu8UtwGtJRWpmGfX?=
 =?us-ascii?Q?WY63uIS2MCW0CIsptSJarwmyakPU2pdJEk6jR4z28rvV77Xq9DGkFX1pOoNo?=
 =?us-ascii?Q?X/tjEjrNMmnU3l5MYXDj2cs8QpBNlg+2HkUc58mITTzmnzVIab6nYQRvHRb/?=
 =?us-ascii?Q?16hYtEGYpXiT3kgVCtucdVEcyOxrtVvsY1NThKkUkl5mqxCL5hRvfM/RJT4b?=
 =?us-ascii?Q?tyiME4HQiV+rAQXrC4Lq0HJwKnqtAfIfmIHqV3ZRTkEndm24DqlXU5h47p++?=
 =?us-ascii?Q?bobXWyjLmeKxU3IKkPbrlnUkbSDvT6DmgtiTSwnXQsXc3O8hHpn4+rhnQMDs?=
 =?us-ascii?Q?zLXwvEYdCG+4ZL8smqZOHiGhcb6oA3q/wL31HPQj6r8h6cHQAEweaC0BgcAt?=
 =?us-ascii?Q?BRImLglBMB871AxU+CT8eb9MeYeS9UFlOJz9hpjP3wUCDzFd0Jog5ZAFeZAn?=
 =?us-ascii?Q?mxkoZfmj4b/3XoJkg3CI/K0lBEgFnsNTlKyEKNuxWiv7Fk+AcavQoCm7lDX4?=
 =?us-ascii?Q?Ze23qkb68s6HXa+UIU54H4Q1L/cNCaCohtxELHckYsXaE5AURHDHiTNHNbgW?=
 =?us-ascii?Q?sqn5aNz6O63TzivAVnVh3FZ+4WldrznYe5fVhmmZK3IrxS+b1Yo+PaK9DYEq?=
 =?us-ascii?Q?nCaHGDcH6f2xpbAAHsREiM2gcIeLct/r1wNamZ9w2MjAbS9CAnAhEtf0A+DM?=
 =?us-ascii?Q?+iA+I09zq9c7gIB/1cRNbZN5I238zr6n6yKY6dsBFa2H/OSUd8Ea1rCBTkp0?=
 =?us-ascii?Q?OxSq1SHh8hHCGAx3ooAz0YpRshn9sN1lO4jK0QlCf4ER//Q86widg1u6wK/Z?=
 =?us-ascii?Q?b9DdhmOtWlfRsw8kKiHn/kwHuelJ1rxtxI16RF4kJ9XcSMslF51LzK3QUZ5e?=
 =?us-ascii?Q?zMCUxQKMFpJiS+DsYSQMxVYkumr7cB/GotVyue8HjTznD7D2bJXm3c+fYr/v?=
 =?us-ascii?Q?HsMfRgX2S7BOE+5RoVCNA2k7gfQsi2A63BseS9VhQljBg3ci1k5Rm7Tt2f/k?=
 =?us-ascii?Q?OiId4gKV9SInAqLxKE53TcrCpXsFiqWOc7TKpSHfbog766CNPYCmu/wxEr0o?=
 =?us-ascii?Q?IIi3D12PeW7JEio4kaj2ewNpsTF+EkqdYnqpgNbDrszq6WXwzoVjib0tIfQ+?=
 =?us-ascii?Q?yRj3jRl3VaWbztivv3G5CqBfjstOZPN2lRvNf1rxnpzkIwYyKlhjkMDT1yvT?=
 =?us-ascii?Q?2Gbo1+/IxZpdxOUlVwKPB6T+y7f1PwKkuu/4MS+M3u8mYGJNTK4F91NFlPnC?=
 =?us-ascii?Q?TzSLDg1sz1n6a7UG/uizH8wkbH5YzDMtcWoQ+CKrWasIPnODjEGKlWUN4UJE?=
 =?us-ascii?Q?nNNFmFqrrXp1i0oa4kuBHLE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3d47f2-f4a6-43b2-44ca-08dcf70c053e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 04:50:18.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 657KdQxkhc8T27SkXvTQ/ga3N5BTIoAdbopHsD9CcPPy7pjtKj0h3cyGWC5Gl/R5GblosxPoOd8dj/ai0hJbGAR1OwLn1ftckYBM6DqaJyUGrQgqfKAHUE4L24jrl1Od
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
X-Authority-Analysis: v=2.4 cv=eZtvfKEH c=1 sm=1 tr=0 ts=671f180d cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=rbgffVyd9T_6m-TEuo4A:9
 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _R62TmhZq0AgsUtWTtQ5o2r_pzkKl_rM
X-Proofpoint-ORIG-GUID: _R62TmhZq0AgsUtWTtQ5o2r_pzkKl_rM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=829
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410280039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 04:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206420

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

There were some rust tests which were FAILing only for mips architectures.
Hence, they were added to the exclusion list to avoid the failures when
running rust oe-selftest for mips architectures.The current yocto framework
disabled the rust oe-selftest for mips architectures.Hence, these tests have
been added back to the test framework.

The rust-1.79 has been successfully tested on X86, X86_64, ARM, AARCH64 and
PPC Architectures with the current test inclusions.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6cf1d262d5..010abefd16 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -74,9 +74,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/rustdoc-themes',
                             'src/tools/rust-installer',
                             'src/tools/suggest-tests',
-                            'src/tools/tidy/src/',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
-                            'tests/codegen/abi-main-signature-32bit-c-int.rs',
                             'tests/codegen/issues/issue-122805.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/mir-opt/',
@@ -91,7 +89,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
                             'tests/ui-fulldeps/',
                             'tests/ui/process/nofile-limit.rs',
-                            'tests/ui/structs-enums/multiple-reprs.rs',
                             'tidyselftest'
                         ]
 
-- 
2.43.0


