Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADABEBFD07
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:05:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265987.1776063919047107964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 00:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jutJe0M0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85638de241=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D58gAF1939479
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 00:05:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=QGbcxsgNE
	FEcUWHypffWdNOqj19YK7XWS1veQ4axrgY=; b=jutJe0M0zbPc9lAnhzDIEKk/i
	cC0iiAL1L8DfTXLvew4lHDrjogrZ02mgm5/E8fqlIesH5LNwk9AAzarWZD1z6ssu
	2Peop7RSsGcgQ7+5Iw+YtlB48db1LonrxlXbW5/MES6enXlId6FG/QB/B6qZXi49
	bB8oM0cQhWPMM+eaW5BnjRYMC2o7R5+e/rABvjCxJ3mnQOgxlFTcpd4VEgNb3c8o
	X0QVtqwBAiYbPPpcwgNyKJFyEnx+EpRqXew7d5f4BZHTFc0Vw3EK5WN/bmCqFWlV
	Xmfr5cHmbMjMcTBEmpIruak9mmuzP1uBkkO7V+2eLR4qucIxdDJRRf0V16CDA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfntds6es-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 00:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SV+MPm3hu0m+YbzOiWDFsbm2SMqSz9SfKBznK1G1a1EmOqhCl9B5B0adUa7MKL8Bm+X1iuRDLaVKrpcmPUkBy1HGKaIqOcbr9H2XbaGMTII0+Q22qSHF6ODQD1Uz5NEurmHrWLKTitQji4brOda+ZfCpRTFkaJSNIVNkAcl3zb2PHWVPsdCvQj55BpnxpPnPPCyWR65FWJV7v/h/9R/1e2Gxc7gGa/wftuWUnbV5c/wO6AHbSwmdMb+z29/LL408eTHY4uS76xyko9YhY6ApTfKQpAF3GZ/44qYSzdXNvA5i74Vx0XPqFLm2TO4B1/9BUrO4ICGFQjG1khwWjYq4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGbcxsgNEFEcUWHypffWdNOqj19YK7XWS1veQ4axrgY=;
 b=HEh5D4NoDiI2E8GCG1AX4nUY94i41a4iZ1qKu1N+7P5Z/fSzyeEySLMW1O9G0WK99E/dfU0ydH+nz3iCEl0bGbI24HyPFak19miq9dsIkvVcjHqist9AT1CY4973sQTMJYskgYoJhh3JzaO5J85TTpSVJXfKbi5lKDjLx/4XcU0Qi6nqaGizu7zT0mAjcroiOmeQuO1rSxL7RSZJspmvGUGhwzlaDwODeLnqHqJGSNdpO/uc4bmzWhRMRZTsYlwq1UymmWhP4SQsja+T9D9VdYig442KH+AlZWLjhm+m2CpWJXIL2xHF+s99F00RWh90/qGLJIILN5wabEfHDWux+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.35; Mon, 13 Apr 2026 07:05:15 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 07:05:15 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: SunilKumar.Dora@windriver.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH] rust: enable fully static linking with TCLIBC=musl
Date: Mon, 13 Apr 2026 00:04:57 -0700
Message-ID: <20260413070457.505816-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f98aed-8ce2-48f6-6ebe-08de992b034d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2IOYkVq1ZqihLbx9OUw9TL/wg8A5qCii1KS4fDosSfTvufZ4YJsBx1hpNKuoTPv58DkHENRBntDgwobU4CBd82ptIsxR+VRIW6xvyuMZVCMP9K2LxvnHGl2vWimMmIs+KNMTo20rRToekjomWbnFkrlFBZf3SA+pydGZ+jrvS8CaLu6VwnFJ6ZjL1xnYIVG9QTrgCedt1FmJjAcYpMW/9+S5bYlQLwpMLB6UZJytxjYr34qWNRxC4DZYa+XLmtDH09UswtctoP1aKd9Se7AIe4C+8IE5C+SPBxv1v5jqMFjSS2Qy+pSW8yramuJhMv4BMM6W5H+GB5j2gTsFFs1/lB2s1A8R7cBEEIwEeuSZ4a3Dar2qgAdG7K8wu4cIa4dIFa6txNAIbbQLaNkQxFrS5FzGrTxG5/DrP8Q64g0ILO/Cfz9qXOTFq7w9LDShWkQdBUv+RC/uJ9IWJThXlBULxdU193ruA9SlWZxWyPO+1WyvBYAEQ+k5vZUd9WNns5kfvYRT2+sD/3TLzjVRdkUC4mHNA0bhB5TOOmC2fP8BXa6KCWKHnKpcYZILdtI0XUl5HZ7p1RKOLsJ/P5PwWjmMiFKujAN2vcroxBBFr1CYDTFYxiHmqvmW74la7lzkTErvA5CwYZhXNTO//LSZ2akpcAeRunyLk0WmNc5+KlB605DdquERtWDHkptezXtphWvC+ZkBpyM/Yx5BSJi2ITLGAtHzxbDXhrehVhR/RzxHLK5jCnKOyd1gKyu6Rwr08AjZYymShXx7viw+Ll5zQxNUbXRz1U2LgvmQbe/tLQP3zfxKpeo5jxq9dyDarjFCI1lG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vk4cP/tU3QUdmwcUZGM049EZgSw9pebdIuUcJP5OhuFh0C5TyUc7u0JzbCw8?=
 =?us-ascii?Q?n9FbGNz6TUCh3X8OBg9qu/yFXq5fb63h0VFeME7RF70VnxURy66oZYkhi8In?=
 =?us-ascii?Q?o0MAhN53Tii6DG6NWl/fHm/zdIkEWXhdiewmri2Wk9v5Ne3J1Y7YSFwzWvsW?=
 =?us-ascii?Q?+w5LdevYfp3lQ0P5L3YHBRbja/yHClXiDfhUWW5P2CPd7JGvHS0P41+yaoBy?=
 =?us-ascii?Q?zBEhYli57W/VXYV8Ip/E2ASX3CYfSRZ3LsrqJVCJA0USaohN4nbOXG/0FQiE?=
 =?us-ascii?Q?XX9paPtFmzo4ibFGsG8pzjTgnRPHB9Q5CJnCCOP/kKt2Ou9mymfA8SkGS5JH?=
 =?us-ascii?Q?4NhuscAAADTHh5yh/zRVmqXyN3hJY63P6XuJ7D9cumZCmKH8FpM/MWINof3t?=
 =?us-ascii?Q?DC2ES+cYH9lJLQSQLpV7NYYAH6dy3uRW/Q9K/TGhuV1yeK664g0yiFMULbLJ?=
 =?us-ascii?Q?bMl713kJBfdqxjG71oZqDWfFz6BoPh8liiWh7OL+eIsGBolNp7SMz3373kLi?=
 =?us-ascii?Q?WLYTBV6uMoICVXAnQGdFUDNGB4N7zbSCWOtInO7VOpLnYQyzv+nysX8wJl9N?=
 =?us-ascii?Q?+PDsHz32umEo2EYYGfg7uSGHmytUjm3Vmwx+bGhRxkTnMaPqqqtOB988ZPz9?=
 =?us-ascii?Q?zOrHQGkHH29RzY48OoDWPhCTv79f3OQVAS6KSlEpN4YXbEiP8HXv54iZur1O?=
 =?us-ascii?Q?jS5DQjt41uVsa1QCCGys0uLRdTGAtV2q8xLzrRX631AFPKUCIiikuOjctWvO?=
 =?us-ascii?Q?2riRmJzLJZ0S+1Yzetcl5sSWDK2P6gcuzPjvhzMjSyFcnVDAY+rDDwvGYd9W?=
 =?us-ascii?Q?R2VLnJ2NmdOlt7nrQizoKOHUdpuyo/AgC4e856KIYsMeyX6D3G1dqS/jjJZX?=
 =?us-ascii?Q?DxUSdrXVZr8sD8a45YgzdHj368XuXh1+42w05GIJ8wYyvytsdhsvi/7XFHIL?=
 =?us-ascii?Q?lGUoaPT0nsiiINZY/NVg3G8tm2Q/H7mgTAyFJsm+Hm0YYIqUxDZOf4cKjXt2?=
 =?us-ascii?Q?XvboaQXoYJHPBnM0XzPkKCLaXJceWhaNWZuMkUq6b9+jm+XhgBRs441w1rtc?=
 =?us-ascii?Q?GQhAxA3Wh0j0nkc3bqrP4pPsSYgDsJjxLxGJfBsQhE3/HaRVdvlbSPzIHE5Z?=
 =?us-ascii?Q?L9KLuDFy2IXMfDJ0t5PHTExyH+jYIMz20M+DqpZJ1EoAQUCvyA5lqmr2PogW?=
 =?us-ascii?Q?RmleNxd0HbkY/t79ydK77XJuOh5a5XTOg8hPJroRt+MDzl4bugxek3em0EjY?=
 =?us-ascii?Q?rqATmjN6LBQxIzdPPR6I0PR+b2+oA3AAT/WCbEdaB8tK/4DETg+qCkwi0F1+?=
 =?us-ascii?Q?d8GpC4/yzHBzb0CkXOJA67kBhWMnn6Ljo9KXNolqKBEidFoRJCzk0wDz6USQ?=
 =?us-ascii?Q?vxO5O4ZYrMl9Xlu9Z4iNcJEt7uYYm/B9DX3MrGMmcdO+JmZ/GOGtLqWoN3Fu?=
 =?us-ascii?Q?zf6CS8V/b4mRIhfjW+12k67SJSIeIWbze/vTw2XXLIJrgHo8guUdkGkBZGDU?=
 =?us-ascii?Q?RRM45hiYT4R94J8h/Ymd5kMxoaNdVnHnlPfRp74bDH1kHyWZzdDDjkyO4C3p?=
 =?us-ascii?Q?5l79A8vh8JC9hsaRPFabehHkgbG3t1zjKtNbGdoWsujwZcwspx/ph5iZxAw1?=
 =?us-ascii?Q?lI4wz86iX9zalalBSRwy5BpoGJH0lMF5+YJ3G+CdvTz9urPEbZO4SmyfzP+q?=
 =?us-ascii?Q?1be0EDr90AKgKjOShpiCQREFGZfehgQLbcvMTSGb69AkQUoThPWGHhx/Xd2P?=
 =?us-ascii?Q?vsTNhbBGl1WUbx6t3W+6uKtM2lSptuA=3D?=
X-Exchange-RoutingPolicyChecked: 
	idzSpwl8R87ahBlEGoS53io5r5crfOumgujsJNlr1RTUL9iabNNq1k3qIzZZEPbiXiwJ3ZeFDRn+DPdGHho1myF9UxkdIAmaHPmmsv928cBRjzts/odIaxZ65+rNglwScWaGhAxRRvtAhP76iVs5ygll4oNV/24M6micOQJhfM/BF2VsQGO5T41ZkLiZYad8W8YwiXayQf8PWbI1SLXVl+YmqW8uaCXC0B3Yd/J0/lf/jQaOLMbV/SI2dvWkXMXiU/fe2m0ec0bZbNDsPRn/bVHqd9RgKUxt36ZQPcUPbSss2tnnfaJ0dpjNEprImrwnasDxMBVxWVd+pmGQzAn30g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f98aed-8ce2-48f6-6ebe-08de992b034d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 07:05:15.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9BJLoGp31WIjxXDKAKwcQOqW6banAn0jVCbpY3R51Wv6TuKCJ8s/8GYa1K9WWIyeF+Yxymhe+2rzxK/ZwwAQvHnNu/In3gpXPm79Jwpobg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
X-Proofpoint-GUID: PNcXU5MhSiHsaT7xmlgXaQmtOSbNAqpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2NiBTYWx0ZWRfXzupZ1ORCKj3r
 L/MYn4xmjvLE7POOZn0xmjP0Q+Or3irxCD2E5YP78yRu0EvD7b0493Tx7eez0+i9lJvj6UaQBvv
 TYc3NkzpAUIq03LXaA34whtqwGN5Tq688ms92zT1UDxeAP3hS0aiiKfF9SNebCOQVLg79B9lhMO
 8HXOnUit0r674bE6HtU1kgXGsGChY93y+qsbYDDb5TS3sU/tGXxglibCw3Rx3S+sMa9jsLWHieX
 ARxwE6ryPTdt5NcFQB9vg41McVVG0rZEZLj5li6HzyjRu9jVkPBqNNoOeQ4AzmZsG2pVMjw245I
 Knwcv2WyuCfDuwfYb2GU6nxYGvTeKN0wc8jxYEs4sqwJlFgqn1trsdM1L4sEInaowrFKPgvOmll
 XYDjW4YaHXthBP7z6X4jKU/LgF2t2XzS2pSzh9aPhF0gfsahJN40oqhMH/qHf/NsVaNctvJPOH9
 mjYO/WLXpFcTlsooXYA==
X-Authority-Analysis: v=2.4 cv=S6/pBosP c=1 sm=1 tr=0 ts=69dc95ae cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=j57RdskLAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=3ZaykzITAAAA:8 a=z2Bb3heFyi89ZgpCzI4A:9
 a=neqFGx5lQMtEv_Zc:21 a=FdTzh2GWekK77mhwV6Dw:22 a=eq567Uj9mPSXXwt5iH6V:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: PNcXU5MhSiHsaT7xmlgXaQmtOSbNAqpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235086

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [YOCTO #16076]

Rust binaries built with TCLIBC=musl and
-C target-feature=+crt-static were still dynamically linked.
Fix this by addressing three issues:

1) Set crt-static-respected in the generated musl target spec
   so rustc honors +crt-static. [1]

2) Add the target sysroot library path to the linker flags so
   libunwind.a can be found.

3) Use LLVM libunwind for musl:
   - GNU libunwind does not provide static libraries in OE
     and lacks required _Unwind_* symbols on some architectures [2]
   - libgcc_eh depends on pthread and cannot be used for fully
     static linking with musl
   - LLVM libunwind provides the required symbols without
     additional dependencies
   Install LLVM libunwind from libcxx and switch libstd-rs
   to depend on libcxx for musl.

Also remove the obsolete DEPENDS:remove:riscv32/riscv64 = "libunwind"
lines added in 2021 when riscv musl support was still being patched.
LLVM libunwind supports both riscv32 and riscv64 - verified locally.
riscv32 support was upstreamed at [3].

Add a selftest to verify that produced binaries are statically linked.

[1] https://github.com/rust-lang/rust/blob/main/compiler/rustc_target/src/spec/mod.rs
[2] https://github.com/libunwind/libunwind/issues/761
[3] https://github.com/llvm/llvm-project/commit/b17d464

Reported-by: Nick Owens <nick.owens@eero.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../rust/rust-static-musl-test/Cargo.lock     |  5 ++++
 .../rust/rust-static-musl-test/Cargo.toml     |  4 +++
 .../rust/rust-static-musl-test/src/main.rs    |  3 ++
 .../rust/rust-static-musl-test_0.1.bb         | 20 +++++++++++++
 meta/classes-recipe/rust-common.bbclass       |  1 +
 .../classes-recipe/rust-target-config.bbclass |  2 ++
 meta/lib/oeqa/selftest/cases/rust.py          | 30 +++++++++++++++++++
 meta/recipes-devtools/clang/libcxx_git.bb     |  5 ++++
 .../recipes-devtools/rust/libstd-rs_1.94.1.bb |  5 +---
 9 files changed, 71 insertions(+), 4 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.lock
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.toml
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-static-musl-test/src/main.rs
 create mode 100644 meta-selftest/recipes-devtools/rust/rust-static-musl-test_0.1.bb

diff --git a/meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.lock b/meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.lock
new file mode 100644
index 0000000000..cb488024c3
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.lock
@@ -0,0 +1,5 @@
+version = 3
+
+[[package]]
+name = "rust-static-musl-test"
+version = "0.1.0"
diff --git a/meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.toml b/meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.toml
new file mode 100644
index 0000000000..d7071302bd
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-static-musl-test/Cargo.toml
@@ -0,0 +1,4 @@
+[package]
+name = "rust-static-musl-test"
+version = "0.1.0"
+edition = "2021"
diff --git a/meta-selftest/recipes-devtools/rust/rust-static-musl-test/src/main.rs b/meta-selftest/recipes-devtools/rust/rust-static-musl-test/src/main.rs
new file mode 100644
index 0000000000..85dcaf9df5
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-static-musl-test/src/main.rs
@@ -0,0 +1,3 @@
+fn main() {
+    println!("static-musl-ok");
+}
diff --git a/meta-selftest/recipes-devtools/rust/rust-static-musl-test_0.1.bb b/meta-selftest/recipes-devtools/rust/rust-static-musl-test_0.1.bb
new file mode 100644
index 0000000000..442c24c1da
--- /dev/null
+++ b/meta-selftest/recipes-devtools/rust/rust-static-musl-test_0.1.bb
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: MIT
+# Minimal Rust binary to test static musl linking (bug 16076)
+
+SUMMARY = "Minimal Rust binary for static musl linking regression test"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://Cargo.toml \
+           file://Cargo.lock \
+           file://src/main.rs \
+          "
+
+S = "${UNPACKDIR}"
+CARGO_SRC_DIR = ""
+
+inherit cargo
+
+COMPATIBLE_HOST = ".*-musl.*"
+
+SSTATE_SKIP_CREATION = "1"
diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 34bb2377cf..057aeda67a 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -161,6 +161,7 @@ WRAPPER_TARGET_CC = "${CC}"
 WRAPPER_TARGET_CXX = "${CXX}"
 WRAPPER_TARGET_CCLD = "${CCLD}"
 WRAPPER_TARGET_LDFLAGS = "${LDFLAGS}"
+WRAPPER_TARGET_LDFLAGS:append:libc-musl = " -L${STAGING_DIR_TARGET}${libdir}"
 WRAPPER_TARGET_EXTRALD = ""
 # see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 # we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 2e83cf5aa7..3469de2142 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -429,6 +429,8 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['has-thread-local'] = True
     tspec['position-independent-executables'] = True
     tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
+    if "musl" in tspec['llvm-target']:
+        tspec['crt-static-respected'] = True
 
     # write out the target spec json file
     with open(wd + rustsys + '.json', 'w') as f:
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7614941661..72ffa5f234 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: MIT
+import os
 import subprocess
 import time
 from oeqa.core.decorator import OETestTag
@@ -144,3 +145,32 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             test_results = parse_results(resultlog)
             for test in test_results:
                 self.ptest_result(ptestsuite, test, test_results[test])
+
+# Regression test for bug 16076 - verify static linking with TCLIBC=musl
+class RustStaticMuslTest(OESelftestTestCase):
+
+    RECIPE = "rust-static-musl-test"
+
+    def setUp(self):
+        super().setUp()
+        self.write_config(
+            'TCLIBC = "musl"\n'
+            'RUSTFLAGS:append:pn-%s = " -C target-feature=+crt-static"\n' % self.RECIPE
+        )
+        result = bitbake(self.RECIPE, ignore_status=True)
+        self.assertEqual(result.status, 0,
+            msg="bitbake %s failed:\n%s" % (self.RECIPE, result.output))
+
+    def test_static_musl_linking(self):
+        workdir = get_bb_var("WORKDIR", self.RECIPE)
+        cargo_target_subdir = get_bb_var("CARGO_TARGET_SUBDIR", self.RECIPE)
+        pn = get_bb_var("PN", self.RECIPE)
+        binary = os.path.join(workdir, "build", "target",
+                              cargo_target_subdir, pn)
+
+        result = runCmd("file %s" % binary, ignore_status=True)
+        self.assertIn("ELF", result.output,
+            msg="Not an ELF binary: %s" % result.output)
+        self.assertIn("statically linked", result.output,
+            msg="Binary is not statically linked. Regression of bug 16076.\n"
+                "file output: %s" % result.output)
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index 42b2c91e43..dff063ad8b 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -31,6 +31,11 @@ LIC_FILES_CHKSUM = "file://libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da39
 OECMAKE_TARGET_COMPILE = "cxxabi cxx"
 OECMAKE_TARGET_INSTALL = "install-cxxabi install-cxx"
 
+# LLVM libunwind.a needed for static Rust musl builds.
+# GNU libunwind never produces .a on musl so no collision risk.
+OECMAKE_TARGET_COMPILE:append:libc-musl = " unwind"
+OECMAKE_TARGET_INSTALL:append:libc-musl = " install-unwind"
+
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb
index 8af93bec57..2a5e977a5e 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb
@@ -17,10 +17,7 @@ inherit cargo
 
 CVE_PRODUCT = "rust"
 
-DEPENDS:append:libc-musl = " libunwind"
-# rv32 does not have libunwind ported yet
-DEPENDS:remove:riscv32 = "libunwind"
-DEPENDS:remove:riscv64 = "libunwind"
+DEPENDS:append:libc-musl = " libcxx"
 
 # Embed bitcode in order to allow compiling both with and without LTO
 RUSTFLAGS += "-Cembed-bitcode=yes"
-- 
2.49.0


