Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D36C55AB9
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9709.1785816518219663203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hN0v2V7C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6741aV5C2679265
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	hN0v2V7Cp7++xEn+Q33YlcAnuDO6ol+fo8o9oA+rCMlOTRAWRtKT/VfXIBoJn4N6
	fCwHvPP6oJYE8vDvnxt8bYSv0rn9A2VDZzI94AXw0W71h1F/i2E7acJmzIJOAYxA
	WR4nlotnLbiJAW7JKezYmnQotA4rDBRVY+f5jOerLZZFQo4hpUe+bANGAFZruK+Y
	PrDsCQe8grg+ttfZK6e0awb6wg0rgnxS+fL6+sidpJ4R6J0Pu0myjCOp1irT8LIf
	qO2TZOMSHwfDZx4KbLnZ9iVEukc6ZeRn7fIsBcpdiOcWqhXQusHE45msRDJ19Wa2
	tfLu5EUcDQCLRZxvUQdelA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah3ae4-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eulMQURmt9cLzfwAKf27VbBC7JFYQn2PmTM5LzoJ8S2FZfkM53JBnMZgN8NGjHuxGDYQ4OIv47WZfyXN0D41U6XUxERYqviNt6BwyQHSOx82FjqNcAN8cxgkwSxzBWxEpJ7UhSoGCsvb34dB1EnjZ9EsWhMRcvPG6qkmO6pcg3If0cunj+uiSHFRGziSQYp0QDlGFkyjpyWb9TIwZpViolLXc2ByfcPU7wNkTZXU/pJn+J1Tw5bar6w4mA939J7rknS5A42gGh4Ddemuc0vuredk1TqsQpQrYGKEdMRne772D2oeh8801FRwGIV9+E1c3p6iyIWsFXtFlZ18qpkk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=sTl0ZU7WYmvYl4HnmRmPQ4cI9UVrvJMdUhcsF2cLB8BgvdcNmdHPRTWFyLD08nTM023FZpXiN74okSd0Jp/kq8UE9bPLz727mGDtPf3tYu3XfJ/NkNM40sVSnWcGevNM/0CpSXsFlscCPuG3ZW3mo8h+BXud/GsjmeX0sRWPGZaTfWssY5ZsW+U7lJlTirqXZJ+6/H/W/l35v8y/0TMek4UzhD2E0x55JRXpqzZVoZAgr92lzOu+e/C6AmeEcJyftFowhd3aXFFhRqhVQTXX7+8FXlwKaZyI0x9kg70gqGwK4RNU8SC8ygft7cVdMuLcGHDdhRpRsZKQr/j112gUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:08:34 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:34 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 5/8] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Mon,  3 Aug 2026 21:08:12 -0700
Message-ID: <20260804040815.1499699-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 504dbc2f-19c8-4a75-81ed-08def1de0d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EktvLRRodjxz596vEwcT3SCHeESujtxI+RNS07rf/+LMwn0IjodaFQSkqMMN/lPVuMozjNK8hprJJjfDHbcyaDaPs1eJ+Dg3gbSsuUrCE8w5ZZBO2YVaVZtoVM6lYWR8QVlpb8m5530glKyH7eBEJtJGAT9MFZcucSp9cMxWuSYbYDhqCBPtQC0/iWk8xG5VY2BA/wesyDL4/vunzH0dbFr6jFdnt5zlnjVwB21nvsTx9iZ847qrR6VvuEquC2Dbm/itPyI/DjJhuRkEgZLQjWQu1klGuTcUw+Pm9jBeQ/OQ05MZn5OcNK6NcfHTAMj+9kwdgLo94jxLDLwHRlZWvOAS7n5BixUhOrvuWOICj6O2ZbD/1PL/c6UeWNwiziIwhkyUGugTU4Fst5PUQ4iIry9r4EanlklDHDF5sKBv/eogpSRqQgZZktzatC4GgSqGlfS8T6ioicuFh2jrUQ5AIA8f9ciKJ2dHoEv7/CPGMmEWZXBXaJCXgsYPfL5CVF3bm8QXPt4gBkkWwR0Jv3Wpjg6csIlgu2S/u6PoJdxj3UtH3aG0kQNNFQrOWUWzc6sFvFhhi40slzc0piDTYiQ0C8GLBfkCkq+ZNpHzUKiQlMjgpJK0n1yzUQ7zzhc1xmKCk+Bcyue/3YasmHT54Ih8H8aJIFIONkxW9G+zKcFnnv7+Tg1bp2EGP2SUJAF/pp0VQjlKzVCFtgGRBP8TPVDg1j1WS0BiJg480B/DmPcCXTc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OucbhkYkYHC5M9ux1uIJvqYZyysT65poSD11Hfa6Jfy6VaBE8xZW5HGL4p2Y?=
 =?us-ascii?Q?Ma9P++SRHIk2iv+xSPS6DAUHkZ1BhelrVfs8hzlcscJ0DATH2tDNFluxzLjn?=
 =?us-ascii?Q?DQFWlfzdp7tftjtTuW5U07Yf9t5cUd4aOesk9ozabEOc0M2/oYons+Byd07f?=
 =?us-ascii?Q?8repwF6cUOKPM2rw4r30gUriTLMEW47cF8NK+G/uYSkXDfoRJZrVZT1WdJAG?=
 =?us-ascii?Q?5k/W4TtuLf1JuYZfttZqe3HqBtsP6RHrvlT8bLKmwi0HloEvSw9kegNz+rNM?=
 =?us-ascii?Q?0Kl8rh8y/ZpoV6JrJGaL8dVolTgmcIth5EDqC60odis7SVW7vd6LtZmVYbCW?=
 =?us-ascii?Q?RpD/3dkIO9oEh9SwOGd7wFi078w7URpiYpzq6Vi7P7ujf6F8t1juK7nUl3GX?=
 =?us-ascii?Q?Qlwh9zrPCh8ME28LaZh1lwD+V/gROEC2ziJYIXlmsCIrGLHJS6pl4Mkg7gAu?=
 =?us-ascii?Q?GmLp99GPj+r8whji6XEs5iQFawLDD1SPniQeidxjRDMDn1cFxpHYBh9JUCQF?=
 =?us-ascii?Q?po+Nnyi4IFq9uNvrvfNVQdc27gZ1sF2sMLTCpJN4FOyyY9YXm4H/gzQdp6y5?=
 =?us-ascii?Q?kh1EF/hGyI6i97c+MTIqX9Pn1AB7OoWzYga1jZzDxPtL58FgtC0f/jZw8OdE?=
 =?us-ascii?Q?lAEugq4Blyanli4oYFhbd0xUCdLhGv5lg87JzjyQdFyAB4MTsUFs6BlLOsac?=
 =?us-ascii?Q?uuQOD0aDK7tI1eaW443NEbZfCWxgPOmVQ5UZFPdNZw+2P0oNpzzgb6LVTqKN?=
 =?us-ascii?Q?iVHAz2wR7KaYkXkTYumtQwiOseuAmBB3oi3D1xZuAdAK7ULBsS/WI1cMOmVz?=
 =?us-ascii?Q?b9foLjF4FljexDAmo1O4/SXp12ir6Gv4C5G6tNw72azY2+ZBiEhkA/z6rblx?=
 =?us-ascii?Q?AFLsL6YaE64+5AMvq3Kws1sx1SfwiwRDcWKCsiFGjVuqCzaDdG3dd7cYKqxS?=
 =?us-ascii?Q?6p7omPtcBPrrowjQGIQIe4VQmA0cQL5eaQwEt3zBTDQFGpzxtse6ytpOU9MG?=
 =?us-ascii?Q?fYA51YM4M14jZc2JixzR1kD8H2voHEn4CjzelluDOcjyaC5uQXrUYmbOoLtd?=
 =?us-ascii?Q?hHDxYS9Pmmh1lLr2dc/qkTCUE4mVKf4UhD/fBPOEAwrhpjd28haJQ4bmMqJ1?=
 =?us-ascii?Q?lt4j40E/Uh4dGS6JkAFhl7rUPIlNs0If1uKvASxC/Oyvb6v8PMC/twtMqqtu?=
 =?us-ascii?Q?2YqX6eUYipwJFLMhWmyHdoJo3U33f/PzJB7S7R+pK5Q3r05uLCMJbBjKU46c?=
 =?us-ascii?Q?cTf/t2w+WYlnmhVlwSaXqwpDk669fbZW1YPcxFjRnRMJ16Ef16SOkmlJf5X8?=
 =?us-ascii?Q?zDAVPJZC/rlXgcHL9IvTTbZb5747TGC3T/K7LaQseozPdHIys2EwQZ7K+0Dl?=
 =?us-ascii?Q?1Dqk52VD1npSVYxTmHumakDrUE335qhcwdablZ0D4bYfNGSnnTvSrf7ugq5A?=
 =?us-ascii?Q?JLFFt8ED7eWQ8aSTt3Vk+dV/jmbrvtN2IXanqyWXC29n8T0UwhdA0BOapx2J?=
 =?us-ascii?Q?P4OCPNZdn9dX74Q8rp/UQuDzersS9mr38fejhy/Njc0i24S3oIQy5BNLs4G4?=
 =?us-ascii?Q?eeRpn1SUlowZcv6bplSkPYEDj/FE4MueWGeDJiC3M1huPBntlEO4hN3mJiMD?=
 =?us-ascii?Q?2uyeehdaZzrvB4E1m2jtaZavXrOc+IvzdqoL44nPbjvhEoWFWH0uxu1FClxH?=
 =?us-ascii?Q?UQWgbRzwJVrJ3QukBdrIqHsJ4DTJXIPWo0Yqv8k0eV2m8Fe0aPf1pCQqYISq?=
 =?us-ascii?Q?kYDfCJ+3l+q5YPvt/omY32fInZRXId4=3D?=
X-Exchange-RoutingPolicyChecked: 
	hvh/e0mlHUd0orr7ciM8+tp/Dm+pcZrW436SZ9iUmljBDPukhmU0UwhE6DlB+KoX+yf2K3u/spu7rPlFZucDzYzGkM6DszQ8IXgAehZ6XqI438ssZ1Emab4eEbDMm7LWU5AIYxlJo/0ndugYs3XMTmOmW20UgtZzKdeBTgwh71/RZCr/P1ApTQM/fCN+zQwooTOLWwLrtnKXswVhaDDnoTUQQ0UvIlSDDnjmN84xpyZnMTP1RB136qKLVccaZKQCugzYeR5UEmBcDPgCGxgfh+az6f231Nnb/L0b4YhESgWekp5nag15h41Qkaal4EF1cKDOLQ+QYU2wyVKxfaZ7yw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504dbc2f-19c8-4a75-81ed-08def1de0d18
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:33.9350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBtgO979zX390s1eTSzQM0CTYYdyS50zM46wYLEpa0cmT3zXsbtU5WZJ1kKz4EOeUS7oVtZnsX0SX/fX4azSgpXJeMwxwWZLv+WiDyeyEcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a7165c5 cx=c_pps
 a=pvXDubuVmAGz8fO+OL2vfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX3lvlfIx1o4jQ
 75VTQ4UfwVCbMbadqhFrd/ACH3ivI3ig/eTgTa1obmIb0qO15Zz7lCrYblIa4RIX6WAEz+K4Tpx
 BT7CNzokP5gxyLetwy1YvjS5RvR4/Te+qXQsUSRwoLB1phhlJSQad1AiYRORXZzYeooflDH7sdb
 PfxFglec/zUEa9Ls8umCcH7Ko61GgMthUQioKyQW+8Hw1HwKTMuPrIBoVIOPeUzMLlP0L7xvRpu
 uwFQCY/w1+OhjHp8+yt8dyQzf5Xpc1hj45IU/Z6d+vc4qQVSH40ZDc2/zZuzCzAMXp+corteXEP
 HQZeFMU+0R7zOZcuK8XUL1gi8lkr7Bbhr03TsciTm6fVMc7niZ2Sbiwf/4HMFv1eai3q5P498pQ
 v/iMfI+qdY5JQHPS5KBzCxYNCpv020+qAk34Ty82ykONx6MmHumLFWecz03BoRwjWa4l2uGZl2T
 +38yqLBKw6AUwZA0ujw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX2wTfutrlqx5m
 NVz4ibBIQs421iRv30yBW9+Q5RKtVo0mIQiGPzqkgCVWy6rft9LWzuyDOhzOeL6x08CTC8f/CuD
 qKYWb3fvfX40y4PwOB3YJh40IYY2izrEwiv7TGMm/NwmVZB9rBI6
X-Proofpoint-ORIG-GUID: zljGv3i3ANj4Ffkk5LNxXIoFw78ne6nb
X-Proofpoint-GUID: QN0XuRkHQIsUyO33QGGoYcU2W4YjhA5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242690

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

