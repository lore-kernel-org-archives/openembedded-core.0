Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21897D6C2BF
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 10:14:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10200.1732097686524222864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 02:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1054da9f2c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK7D9I6013175
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 02:14:46 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq3vsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 02:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXjQNNrkEp1pRJNQ8zolBHxQ6xcB55089bIO8GZZhw8annCRdLLRD2INu8oW9SNfywPUh8wnGvScSaLzmwnJQqtCKBXpq/P5TCa1Q1cbTMEauVIib/aNIxA+vKKHNWFxSxwSLFwueqhGT0Gl1yZv8rPwnMn+9aE1PA4NxIH9RMu6s9SOPgommsiT2AYpvbW4gyeNh5CkWZsaT8/23Wf1AJMkC5BvlkSBQrwCQEUA0vXu+6YaXM85worfjjFl5IPQ8YlinJUK1gTRgwHrgL2I0oH+sz8B7YnKCO+5IcRjZsFAAMbi1D06JluEOLndGHLFLRSzpfFuAtKPvFN1VNTvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SyqmcJeuHKqBPLyg2jkdf2Migb9ifa0ael87K0x2K4=;
 b=MfGosKPQVMVBOpVLOwh+QcoJjvRE1xh/W4k+0O2JpzSDiW0K9YP6nA6iDRTyErHLh3cyTyORyg2fcIEZMvuyHFT25RkIeDv4ofbcjgvj4uW2Cu/iyGdWw0WUDe+0pu8WXqYsRifGZrb8JPRw/D6q/dVWMNidubJyZsF83Ash0VXXZLyk4Hw6JW+OUNiBbNm9xfkDgO3t1KZiJIxonq+zPDdUiwrr0+KQ2PR9gPqQywSUsLuI4lhng7SRYfB67yHLeAzDaac68y1ipbLaeHUhA3BOGGkYqGRGHmD8FMJ84CXNaDnMY2QwtQBBlc54MJqkrgRJd/OdAOPjFRTegTmjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6452.namprd11.prod.outlook.com (2603:10b6:510:1f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 10:14:43 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 10:14:43 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust-target-config: fix cargo build with toolchain clang for riscv64
Date: Wed, 20 Nov 2024 02:14:29 -0800
Message-ID: <20241120101429.209176-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0e4e61-ea80-4b04-6ec1-08dd094c26cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xtE6kDLkru9BAzA1ZpEVrBlpkDjMPjCMpktl+kq8xXej+FTvwtOgJmTP2GDl?=
 =?us-ascii?Q?BRIeIlNa8JsodX4zOot1pfgIRv0NUD20+ieLuAqiGpU3fyKR0mh82vZn3Bf3?=
 =?us-ascii?Q?CgYSm3zN4g1kjytM9+EcUJVsus8vdwWy4MHiQcu66W91hoEHP5MJ8tfYjcoc?=
 =?us-ascii?Q?58rXcEOV3HQwCnZYhFR27BG3mZxZZHx9M3fuZomDBhMroksCHprf9Qlgr1+K?=
 =?us-ascii?Q?BQnsBUA3ojbeIegyn+e5obwIgGG/aKeqUse7iCRHz3FlHm1BPrKbKVLGqcnu?=
 =?us-ascii?Q?byMd2nmoLKf2iyKTXPAmKqf5QY/5pz4X/DLuvlEvlcW2ZffiMvV9m5w7N+gv?=
 =?us-ascii?Q?Cj9ES4NnZYY97MrrgP40g6Hr2RJXTg+ENjwlj4USrkMxtMH+EiuTUehRTtTr?=
 =?us-ascii?Q?GHMZl2DZ78PjYQEgXrd+xF5UBPz7KayezjZBe7e3o5Bj4cwR9/BvrISAlhHf?=
 =?us-ascii?Q?FRYWXJ8SRjvl1D2mbb8+WHGScu63n6C0eU6IFYBnI+PkKeyFQWg4gsHA0R/0?=
 =?us-ascii?Q?Wya17NOBoQFrwqVSVBU0kCKszrhM4h9RPpNHv8eBp3dI7tQu1vf9KK2v9RVM?=
 =?us-ascii?Q?kruFyyhbfkhl/+6HLriJckKPNik3cntPgerO0QnkLiuCjHRTAuztlDGQkPXY?=
 =?us-ascii?Q?QRpnsk5BFqmJ5veMWM35ph3mFgxTQXFXRW/ORgvAXGdhApFkNvU/MM6Nazpf?=
 =?us-ascii?Q?8eQkeN7monH1VCUC1dOXYGul07rbTqa7KDS2jTdMWGyzpoWO4EFwjEE2MFec?=
 =?us-ascii?Q?OhgzZDOrKMkQDLEVi8tpbXE+VKP+GeWJWKBRCvWI0hhaCsp4Jo8ba+xC/AUA?=
 =?us-ascii?Q?FSFvsjy8DbwW2CJ6gWmv7qlhj8N7Z/jEFIxioeFCw6D1ghG1nMadngH5vfL/?=
 =?us-ascii?Q?nx9hsbCKD+un5QDeTaqUBKtKAEth1FUaF4bQD29SgmhcHD7kQfMFHXbukswO?=
 =?us-ascii?Q?GwMbgc++PoXK8v0uZU8kKGrgf0BMMWxqXdPkfZIw+07eOU1bE7gUWYmg9xiN?=
 =?us-ascii?Q?KwjA7sWrCNzX5K2y9Q1hLLceZ3CfFHJOUpPp9oUh/25QkjJwBABJR2oab344?=
 =?us-ascii?Q?6qE8xr8A0FvSCubetf7EtIubyeS/kbkaVQIJDuXC7xeTIeDkrxCWqHNC0TlY?=
 =?us-ascii?Q?1OOBx4Ae/hO4BJu3yK/54wxzAqa7b2w+FtDvIVr73BEKwE8RZMtW9s8h73Hn?=
 =?us-ascii?Q?tZdBos6xVFebr95SyBCVx/gl9NO+M8hLAizbVUIrszbR9xxrfTl0E9wfrQVm?=
 =?us-ascii?Q?Aa1R2Px1Nqnp0qixQqTC5nFxTbiPhVDShX7tQ7vYL0RlRo0CahcMm0aylYX2?=
 =?us-ascii?Q?YeIB0QHYi17boDf5/gS8OHV5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6AlMfy1opnIrIrzvHgCsjC2tv9tLrp7k9OLpvV4kfAw1tBJ59H7V5OLZp6IF?=
 =?us-ascii?Q?If0QmGE4ZMbEyCcwvRiBBg8ImDWB6T0gN8ffdpLOs8SN0rMiCWlSjeQCNyWF?=
 =?us-ascii?Q?BPsTHpdSRfZzA67tXO/cFSyPf+FS4pbL3opwOQSOytRfcwggQjhnpk6BVPeM?=
 =?us-ascii?Q?0RlvmKa7Y3aKE/ZB8W+3uuBea/j0+9H0DPkDbow9/fYP3zRUKB5N3AMUzMba?=
 =?us-ascii?Q?bg34N00HYOfsKkxjvegYsMhEciviayj6/fQH7x+G6oWuMdZb2jWd+Jfysfqz?=
 =?us-ascii?Q?tF+G6PSNqH+v4hN9pXm07bRlbFq5AyonoaCzNR4qZoNIW7pM3dDwJBgNFCq3?=
 =?us-ascii?Q?KtBFocvnZp93hmduLyi4TSJQYdcv4A+kCfih2kU4lcH0UdNVh5IsbeRXr96M?=
 =?us-ascii?Q?r6LcZ7VF5FNQYtGGmjxWDpovxABeGmHh9wzzokO5c25FmpwKtSWexatiNqZO?=
 =?us-ascii?Q?cEW3qUkaSFJRgY9DZz7T9ZFNMO9BD7n7qWquiTOoDydiFYmS4a1lDbKpUAej?=
 =?us-ascii?Q?AceKccb2wvxNDhiZ8aZjUJLZVK7ZLAw+AbUNVr8bkTH6oIXJMuiFvF8sE//z?=
 =?us-ascii?Q?yXUtSGpqsZyzoCXPThMyA+Fog0ocekqVqqR/YykpxI+rwkHw+3fAUc95gVFB?=
 =?us-ascii?Q?a3zFAOSeQHHAJ5yLUiFqTphXFJ93QHZ/TV2bjODJcI1dL5OA5+qAXJJEsdl8?=
 =?us-ascii?Q?Mmx07CxLpJtsC5FivIXNmaQoI0cTLV2DYzdNyVRaZxgTD2+fsmqa+D+jFJdF?=
 =?us-ascii?Q?XYP5h9gm4O0DjM81bAKTYsHoOenp4OQPGG+573qYT1jAV3qxxXABRe5/3kCg?=
 =?us-ascii?Q?SI8LYaoOLp0YSRLq+wH+ITBcpN7mV0oEGgIQRr0WByWvy4fzQGYbOD8yIij1?=
 =?us-ascii?Q?AzFnY2nW4bHPipPe4mAddG5BRecUXGNljCq2U+gE1rrc238xiyxA6beAWrer?=
 =?us-ascii?Q?O8i32D9+PGYfvSGkILmGCcf3carMsYclXIB1BV2ZLVTUaAemocW/pHLtYEDe?=
 =?us-ascii?Q?uXPl7w1H6Z8zyuY4K9TnxGi+JUfaG+AVx43rfir44hM0Y4DmyQnbuc/mawP4?=
 =?us-ascii?Q?dy9KBkypB7ozj9597A4XuiFuIMhV8jQFhgCxsvPLVLp8bc+oRn5BqewQGKIr?=
 =?us-ascii?Q?Fj76GkzKJ0hNSXdcH0sk6+3/ySEhtOthIlKR2cWS1D1TcCAnp6X+27Y7qveq?=
 =?us-ascii?Q?7q1EAE04wvrAIAVLqftm1Y1wxe3wsJOmP6bjUi9rfhnHJqhBuLaQDs+IJQsO?=
 =?us-ascii?Q?GHi7fNbCtUGAB/quIwz8OLG8kvzxLJ62IIHAABPEqXF4bZa9Q/JyKz62IWu7?=
 =?us-ascii?Q?F7b7g2jSG17JFxqHjoHWhCSj+PJhOJYNpDCmpRSRVEyg7PlZO71l9ioqAyN8?=
 =?us-ascii?Q?49q1xDVwwx8reKDroT8Cy3CcDof72j+3LYzdE9vAbtIzXMoLnNTb73276JT4?=
 =?us-ascii?Q?gMkUvDFQ8xRubdudGEB35PsbsC+dsSFsF+8EOk2bmFpKVLCW4h+CTDA7y1iL?=
 =?us-ascii?Q?fM5JBtpbsjpzywGp292Lmf2XkyZaMDPvQjAVtvLBk+XoDMWp+Jenz5TOoRWO?=
 =?us-ascii?Q?K9IeZQplBfHcOET6LPgyH9nthVBGo8WSkIPWbTsMIBgRIA7j8pB6XzOqgkgn?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0e4e61-ea80-4b04-6ec1-08dd094c26cb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 10:14:43.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvnQp6vDt3C7gd1cDmT3o1VKzT3tiqXnJGt82DJE+RWXf6gV1CWIHjlsL3AU88nVOPtMhk5QtV6cT0jgp2e0SCY/jR8WWSil4oDamAT+5hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6452
X-Proofpoint-GUID: Kg5LIAnC6N1I8JxQNFoxgsoRrp5naH-0
X-Proofpoint-ORIG-GUID: Kg5LIAnC6N1I8JxQNFoxgsoRrp5naH-0
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673db696 cx=c_pps a=v3ez6FdVe4RSF1xj2bRqRw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=syMfazXBAAAA:8
 a=t7CeM3EgAAAA:8 a=Un47RyniyaE4MzO_4v4A:9 a=34Rgu48Vc-cA:10 a=uyKFD9ku5uKmkIuqXy1C:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_07,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207420

From: Harish Sadineni <Harish.Sadineni@windriver.com>

bitbake cargo is getting failed when building  with toolchain clang
for riscv64 with the bellow error:

error[E0512]: cannot transmute between types of different sizes, or dependently-sized types
   --> /usr/src/debug/cargo/1.79.0/rustc-1.79.0-src/vendor/dbus-0.9.7/src/ffidisp/connection.rs:298:50
    |
298 |         if r == -1 { Err(e) } else { Ok(unsafe { mem::transmute(r) }) }
    |                                                  ^^^^^^^^^^^^^^
    |
    = note: source type: `i32` (32 bits)
    = note: target type: `DBusRequestNameReply` (64 bits)

Issue will be fixed by changing TARGET_C_INT_WIDTH to 32 instead of 64.

Referred TARGET_C_INT_WIDTH for riscv64 from the following link:
https://docs.rs/crate/rustc-ap-rustc_target/587.0.0/source/spec/riscv64gc_unknown_none_elf.rs

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index f7aa6c74d8..d5fcfa1e2a 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -247,7 +247,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] = "32"
 DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
 TARGET_ENDIAN[riscv64gc] = "little"
 TARGET_POINTER_WIDTH[riscv64gc] = "64"
-TARGET_C_INT_WIDTH[riscv64gc] = "64"
+TARGET_C_INT_WIDTH[riscv64gc] = "32"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
-- 
2.43.0


