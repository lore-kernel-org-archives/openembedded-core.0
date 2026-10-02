Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CCACA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:55:02 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14225.1790952901224461745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ijQ380Bf;
 spf=pass (domain: est.tech, ip: 40.107.159.49, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/XXk/MOAH9fPi4wMN/1Ps20MBMBo5UVhjwIYqo9TgmhQCwNrUyntHGpmM5SsmoU7u1YpEs7+BKAk0g/y0x14X/TBT6iU7fUdpG/OE5F5ioTwtF4o88ryl1yEMgZ5eMeSuJnukqK1xFfl4C+XUTzlEa68GVJEW8zlqf6RORIqB2K9xPfJVM9Y5AuU8GCiwxhCde7unkwliYatJTkDEvc4UYQ9xcTqGbXZGHKO4LDKZRZ+dHARQeTMeYk3yc+x/X2afVaUSpWIA1evz14rTeE7Aklv8A21fd4JzQQhvUi7EQCKOQ3HRKE2Iz3uGwaCCHyRgBYib+Ow0Q/66ttTawHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kvtx+4p2TtSstnfmkl+UixUvsw/7zYRc/o0FJQWatV4=;
 b=I7WeLON/nNbiZ5FyjumEaQ0y2xFSwA5C0pa2UV4DhFn0PxQH24AJg/W+XH9Z634DSUj3j7MlMvCWTiLUDNNPavITFyjg35JIYpXx32cP21kdH0Jr2grhEVKz2ZIKwAcVe1d6rA7eZ3b5GmUMqfIGhYlTqT1gS54RLpw9cvNJL7S0vUaXkWUbCp+b6zvIVweWYqixaPgm+04H4G0oahwHcrFsj3FiGhhGAdzrW1NT+F48+iShRuKTiKQ8y4aTJbcac5zoTzB7wzGnGgZCqDcT2xfImcVxHqUq9H8XzFGeP6rjs5SMuTJ/yZt9hZMPTyEtFzTnp1hzUPPYgl4FL6w80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kvtx+4p2TtSstnfmkl+UixUvsw/7zYRc/o0FJQWatV4=;
 b=ijQ380Bf726pUglB8syBlpYZfh+FWzTLE39JLotxo1Koxt39aCoyaAmSartZykWdvni0MxwKgNWh1neWaJilbQQBHOigseNawwX+TSEm5qA2INKf+B3Z1ZKOzSqPI1VF7Qhsb0eTbWqjIgsT1rvTOvfU4IKiMQhkL53aUpdsCl28g0trqZprFouaPgYW9FVgMsZpr/78vX39t6Wf/00lqSdsvbFQU2uq5G+9+b3Jx9Kvsfu4z1/HGZu0Bli3Sc1Bd2k+ZKtLd/NdVBB5LV6BoJIbf5C1YFo8cnAbnGoN40PF9N9O8uwmUjUMKEErbt2CdVoZZ4ZPYaUKFIuF/G70BQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GVXP189MB2819.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 14:54:54 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 14:54:54 +0000
Message-ID: <55f7e9a7-144e-4dcb-8c70-c14e5e7e0901@est.tech>
Date: Fri, 2 Oct 2026 16:54:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] rust: add rust-analyzer support
To: paul@pbarker.dev,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
 <DLTK70W1LZPD.1WPEJTEXRP8Q1@bootlin.com>
 <91fb8d9886d06181a0a1ecc63b30652b1002509d.camel@pbarker.dev>
Content-Language: en-US
From: Benhur T <benhur.tessele@est.tech>
In-Reply-To: <91fb8d9886d06181a0a1ecc63b30652b1002509d.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GVXP189MB2819:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb196f5-ec29-4cc7-4a0c-08df20951eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	52Mh2m8zYZC2MsUTeaOxZhjyUyakAlxZzpwUK+5qtyrLIV91IOIq8IPEbXQS+XlaDH4CuYmLuGJ444ALM3zv3OOXkBFtlZSK7TJQm7z1uJ1c45X/9YVP0ikQ2MUSYy4wL0CSeIES/svKNkjeoRAtTI7AEYxLSZ1CmYpEm0safeD5RtVfGQlflRjLODIl1AGMoAKd2CYhhWUtzSiLjYSTVGD1Uk9QEG9YWyqri4NTtW9zzHYwabmdzxiSCZj/C1iZQ47J6/mrKrIL5uqzSXvH5g4MWQ2nVdESkF4DEnoC8GW+zYr1W/HDWyriou1E/J5MYPdE2KiCnVc/Qt60rn9bAN8/RtYie9eMwJV0Km9w6TLfOd+6Gszw+kSlbLmzdDkwxwv9lc//rbCXEv57VlfXSf8T/ysGsLzxy5MjTr4Ko/MoDWdDqX66xlD0wulGNA5Q8vEmYWIbBcNvcKGZllsZyhfvdUdclLFn+6I7RucmO3LxVpE9E0Wq8wEoYfRuifpZjv9IvfgbHlxACqej0fYeEQXsMSrtUMQepNGrYnxbkGtlS8t+3HwB4RRuVmL9CygfY7mzygotw5y8/VMLaoJ751O84kZ2km/LhqjWly3xtGBwzhRVuJYAieag1+qJ5QHrl2VnK5yAVwqXiOQy2MSTA79PnW0KB1Wc3RE+SWDrns4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEl2RmZ6eGJrSk9DT2dGWFRPdHBpRE1pWEpSQkZOTEFUZE5oeUQvemc4bitj?=
 =?utf-8?B?cEJ1WnNpVGtadmhGeTkvMGpneTZrSU1lZWJmS2VMcjJIeTZYZnd5U3NFNXhL?=
 =?utf-8?B?ZklvUi9LQVJwMmhmS2JqUWZ1bHY3NDhJbFEwVko4MXBEV2VtQnpVaWRsVTFR?=
 =?utf-8?B?cmFIUDdvcVBHWnFJV3ltUkpRNyszcEF4TWt2VEs3RHFMbmNYT1I2bFJKMzVK?=
 =?utf-8?B?RlRrbENjcXJ1Y1VnTnN3RFdMY1NvajRha1NuTWlnTnRRUTJDSHVUUVRxNUtl?=
 =?utf-8?B?Z1c0U1A5Um4yUUJvSko0c2swYjJTL0JJODhMT1BLNXJoTFhNckpiR1VnUnQ4?=
 =?utf-8?B?SGJXdU5NREFFQ3k4d2x5WWJPclVyM21ZcUE3M01OcHVkRXIrZDNIU1JVQjNk?=
 =?utf-8?B?K1BvNVE2Y293enBiQmZDc3RwUHo3bTdUM0dkUXBMRjYyV0xqVk9USVZ3eGZx?=
 =?utf-8?B?dmZwbGQxWFl4UDRaZzc2RmhISmtmM0gzQlVlMzhLSHEweDN1ZjQ5MUxZQjNl?=
 =?utf-8?B?YkUzdm5uSkZkUytyMkZlQ0hCaTFQTkViMVFhMWk3UFhudXYvSFpjeCtONWdY?=
 =?utf-8?B?TlZ1VFo2S0x6VFArTTI1VFRYWFgrSVgvK1BWMUVvdzhPNzdma3hjNFo0Y3hW?=
 =?utf-8?B?bkYzcTRoSVZZRnJHZTZzcVBaM0taTERZZ1hqZWhTMGQzQTFGR3c4MlRobUwz?=
 =?utf-8?B?RnFZbDlaSDZHMlJ6NTR4KzBlQ2RtZWhwaDZBT3NGWEliSmhQRGJQSUd4aXFF?=
 =?utf-8?B?Znc5Nlg4ckdKNEM3MEc3WFpjbXRFMUtpSEtnM1JqYlFwZ0VXTnRWcWQ3WVZr?=
 =?utf-8?B?Qk9LZmMwc0JLblN1ZytseU1YN0VraEpJNTVmUVdiMTJNRWltTFNHTndtcWlv?=
 =?utf-8?B?eGVBSGZ5VDY5akNzaGNvRThDZm5JMUh5U09LNlc1QWtiQ1dXQUZVbEdPMWJq?=
 =?utf-8?B?aC9CSWczQUtSSG84U2VVLy9vcFVwWW4vOGFKK1M3b2lUb01IbjhCOFNHdnJq?=
 =?utf-8?B?a2JkK3FHOTBtYldIbDRnYmhobUN2VXZ5Vmp5RXZYUG43ajlEWUMvcUFaZkY3?=
 =?utf-8?B?KzN2Q2ljaHRtYUpvS25kTXFaYVRLWVJmSGJkNTBrclVDMWZZVmxraG1oRHg0?=
 =?utf-8?B?S0hjREVvQzZnM3p6WjM2MlRuc2RPb3pmdURJUUxicUNUWG5pUjQvNU5DaGpF?=
 =?utf-8?B?ak45VEtlYThRZS95R0NtTDUxQ01aR2R4aG5sWjJaT1E2UEdlaXd3ZU8rT0tH?=
 =?utf-8?B?dnUvV1RLbHdFc3ZHWFN5c2NIaklmdy9uaGJ6SG5Ca290WUJPZXo3Zm1IeVhs?=
 =?utf-8?B?bXJ0em1TZnpKTFRET3o3T2JhM2h2b1BVSHZuY3Jldno1WjhWem5UL3pzTTdW?=
 =?utf-8?B?MlRTdVh3cW1LYURDRzhZd0VESGQ4T0hYdHJ6SW04T2gxQUZMTXREU0NldUpD?=
 =?utf-8?B?WWYwUXd6MnhIdURIMFNHTDdhL0lJWjBLYWROeWtqM29YTUZPaWJmUVQ5ajk1?=
 =?utf-8?B?TEgvSnZGM2swOENEQVFyTmpFaWdISjZEVGdIeEdNVldDSjVNZVFKT2RoMWw5?=
 =?utf-8?B?THpjakY0bi9EUlNXZHlpLzRTeFVjRVhRcEZKMDh2OFBKUThoOGhlQXJ5bE5O?=
 =?utf-8?B?QmM4TmZyYzRjZm1yZkdUMEkySWFRTnp2aUZwdmJVN1U1ZkNpVEVldUVrQ1Nm?=
 =?utf-8?B?a1kwenlFcS8va2VwTnNvZTJVY3hVcXh3a3g5aEtzb0hqRWV6Wm5kYkNRWUli?=
 =?utf-8?B?eWxkbWMrWStGeWJhNGVsbnhFMWdYRENmcFBoTGN2UFQxTTJobmdxU0RWTUNC?=
 =?utf-8?B?V2ZoSkNkTlhtN2hKMTJNdldQVWc0dG5JYzRpSndCZVp1Z3lWK3FJVGVHTDJS?=
 =?utf-8?B?cXJ2NHBMZVhvSlZUcUhHTldiZGdtb3I5bVY0V3cxOENERHEwdHNzak5qQjBS?=
 =?utf-8?B?c1lmZnhMUVNaUmFic1cwU2hHYzlDTXo5cFNNOE5yT0hUaWpMNi9KeHFadHcv?=
 =?utf-8?B?KytmdGErQ1pyM3VqYUNyVEFZRGV3Zm5mMUd6WEMzelUxNnFpdVQrSWFKUlhp?=
 =?utf-8?B?WmVKNEI1UlI4dzQySWVrRlJ1M1ZPSERiTDJMYjd3VVFYTFJoVjhUUmNEcm9G?=
 =?utf-8?B?VVhKalZNaE1LUndPR1loTW9FUEN0NlluNUJPSWJyRy9lWEtEYXpxTE1tYVB0?=
 =?utf-8?B?bkcxanl6QXpuV0czcUJ2WVFOM1BUSXpNZC9lalV6TmUxNHM1eENOZlJSUmsw?=
 =?utf-8?B?Q1B1NlZwRUpoempqaEpyYmdXNWR6WXJGbUNHVUc0M2hNMUJ3T3UzTXJBTGph?=
 =?utf-8?B?emNPc3o3cXNrT1dQVkpnMm1lRE9UcGh6RXJldlhNK0trVG4zcTkwZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb196f5-ec29-4cc7-4a0c-08df20951eb6
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 14:54:54.8315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oe+00TqOYFp9DnCM5iSnc2PRz27yxJHB4Pka/Q8QaL4z7v6Hgj6WzcF7BuazftAgAgOWTgjEzYgs+TX4ffsQ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247128

> I believe this is breaking build on some platforms. Maybe all ARM 32
> bits?
>
> ERROR: rust-1.98.1-r0 do_install: Execution of
'/srv/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa8t2hf-neon-poky-linux-gnueabi/rust/1.98.1/temp/run.do_install.3194208'
failed with exit code 1
> ...
> | error[E0658]: use of unstable library feature
`stdarch_arm_neon_intrinsics`
> |   --> /rust/deps/simd-adler32-0.3.9/src/imp/neon.rs:23:7
> |    |
> | 23 |   use core::arch::arm::*;
> |    |       ^^^^^^^^^^^^^^^
> |    |
> |    = note: see issue #111800
<https://github.com/rust-lang/rust/issues/111800> for more information
> |    = help: add `#![feature(stdarch_arm_neon_intrinsics)]` to the
crate attributes to enable
> |    = note: this compiler was built on 2026-09-01; consider upgrading
it if it is out of date
> ...
> | -------------
> | error: could not compile `simd-adler32` (lib) due to 67 previous errors
> | warning: build failed, waiting for other jobs to finish...
> ...
>
> Can you have a look at the issue?

@Mathieu, thanks for the feedback, yeah I could replicate it when
targeting "machine/beaglebone-yocto", seems like rust-analyzer is
resolving a newer simd-adler32 (0.3.9) than the rustc/std build (0.3.7)
which fails on NEON arm32 during build. It might be that the
std/compiler build runs with full unstable-feature access, whereas the
analyzer tool does not. Removing the target installation of the tool
seemed to fix the problem.

> One thing that's concerning here: We're seeing a compiler error message
> during do_install. That suggests we're missing a build step in
> do_compile, as things should already be built by the time we get to
> do_install.
> 
> That may be a pre-existing issue for the rust recipe, if it is then we
> should make sure there is a bug filed for it.

@Paul, I agree this is pre-existing, the rust recipe has an empty
do_compile(), and all building happens in do_install via "rust_runx
install", which runs x.py install (build + install in one step).

> We definitely want to take new features that people will use, but we
> should avoid enabling things just for the sake of it if there is no
> clear use case.
>
> Are you using rust-analyzer from the SDK?

Yes, so based on the conversation above seems like the most reasonable
is to install only for class-nativesdk.

