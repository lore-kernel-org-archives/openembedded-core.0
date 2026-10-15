Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E8CCC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:12:58 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38145.1792066377095516281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NPCut5lo;
 spf=pass (domain: est.tech, ip: 40.107.130.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCKoxYHDjOqwERM4cHzADATe20hNjLT2hCmJ6FYP8ij+IIaKg6Z7mi/FJOi1U1A4+X6OAh7/Kh6EF3mpUxYVN3SgZkLoh8MMAjzqwgIIl5fgjnk7/ICT/WMv8ySp6KvzQHEy7nmZ2tZsVsls7nv2oCOBVLKCH3Uoc3JRMbd5uwbDTXM62jspbfx2swtqW506ebbcw6wujYCVaAs167TkAtngGfWiSxpE+aMS/22AFBgUJfxBOHlltJ5dUO2WxosF73F7fjAqPeqPChT/86zcyiZ9rFv62NaBJiAmBnMxtFNX/eY7kTxN73fFXF3na3OPB1Gh0NfLzRlu2mhCAjb2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXUEAtLqa3kAB4e7r3vVrn0aaBxTjSw8LsGxzOTLyIg=;
 b=K9yugIrDx0Bm5WsJPgQNhttNEMZCymAbzdpQTTZAPRul01fC8/BsYxWOl4rJnhMaCMAYLWbMTGsCuluH8ey1YVNhDCuUyUsN5r24wv8hGwYRiA755y/Omcoj/0ZwJj46fGymbc1wWldBjXWviriBUbpGx0MTK7rKSpSk9itPwHM1tUSRWwsylRe5oCzVTAp6RNYZxv/6FEwGeCDlsHZRrp2JPWqjFkIE3BZdt7Fdu4x8R6dgyHhnz4bx52SS8W7StbMb9ajAiqnuk6etsJ0i5GvuOAeiSo9SLWfy2wqiFTKt2mOp/R61Fe8x1D3Tf/vHjrbnZ5rbStjy+WvN/+xHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXUEAtLqa3kAB4e7r3vVrn0aaBxTjSw8LsGxzOTLyIg=;
 b=NPCut5loog7MFlaqwehbnaJpboUkRt3r0O4t6uWcqox9SHHYJrkTHS15B0H0irIfp+8Gyh7em/ke7DwOQsBAsUglWcjJoAmqKIQLAFioKIY/eSs8HLF6unQCfP7VesIYHDvpvlqKsO5gsCePiQYqLc5i4pjE1NbzcDbc8OCpPL0GOz0yxeClsz10alo3807JtcS4Fe374DD92NyNYbEA+EX1kRDeGd3HrCTo5oPE05Vt/+31+twpHeL3yApy9lT78t6lUXoYZvLLIoxtdr56Jp0w+vnwzKiMDYTLA3u2k/QcOuHI/dB6Bt4+RSBBWHi3VE7MX8tfQRv55D13Rf3S4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3568.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 12:12:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 12:12:51 +0000
Message-ID: <39eccd41-ee64-4500-b28e-6fb364089efa@est.tech>
Date: Thu, 15 Oct 2026 14:12:49 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, bruce.ashfield@gmail.com
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: Request for linux-yocto 6.18.54 upgrade on wrynose
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3568:EE_
X-MS-Office365-Filtering-Correlation-Id: c181a066-134d-4b7b-e2d8-08df2ab5a24e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	5/tPK1QZmEiCyhiazxiW1ZHXHWBOYTI7lyyO4CS9m8ttuDWQXR+FQnmrn8srzATM8haFnGYgSvkOgYdkVtvTwme7NnUkUyXogSywdVx+vSkSH3slZbo9FJlzqzKJiAjHnwic2DBej/VNqkcgj5ynQ3ooFIjwumFewuHGUc1a5JiGq+YqMTUfVX/I+qKDng9XucN96VQVdjJ3Fu0sLYbpayh6QhUEkyGqgBoi9SPCgq4m8yah4H2aXyg8wl2FtpwTff7JonFICTjKTtwORV7o8nCaelfpNk4u53BV2HwATlxuiBiKFH/uRHp5uSa9RaF57rqzwpMYWTQzVMkvb7YBP5RgIsmgjj4nW3sdWQPO31jNPQeTWx2QTclIWawyHpyxijOH1+DIMPYG/I27sZ6ax8zsV3rdtirZCJ0NGMYLuB1FZUCLeBlx+2DwggxFJ6ebGkmHXWU4gUBwmpbRmDkt9u7NJt3QvR2yDz4UxStWRl4URFmwQwHGj1OYg5d+gcNTjVLPy6BacqWvkR2pAFBNp927dpIOFnS91vkLxdgAJu0RvMLcSYWfGIqOlTMXOpsXTuFhODkXvq0QR4xPR3oVsL2zTt1zcclWgDBDRJ5r7/6/TQAdKlshUdLTwQiHJXtq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iJ4k5Em1cK29hAFsa1pzs5MIkfXRpEVSewipJcd8IycjF/PufzNDPrYs2nIS?=
 =?us-ascii?Q?5UP2QffLsMm5Z/W4U/CDbVjT83GebkPeDbgSZctVRf57aHJRAu3MPX7W/obJ?=
 =?us-ascii?Q?5lqMua3S2qdSnSNNqxvv206dfCB21xA3knfbmB5VKl8TPccfPonp/wLW55xO?=
 =?us-ascii?Q?DqeuZgrwKWwjbmip2nIFaTw1mDpePO10UyBKdw75hVVbAwqqmPUgrH3gKX67?=
 =?us-ascii?Q?LbL0fLvPN45mrFU9YhPsiVYeQgegKWTbwvVg5ZPqPu+WZRIntCJ0YHP9/F+W?=
 =?us-ascii?Q?2s+b+I8bSVzAj/d/hBCuSK49VbCORtxylCMBEjz2zaKvwIE+bNlcfeW2sssU?=
 =?us-ascii?Q?eFSSrJPTJpKEqpo/OWtTh5JpolpnNZ9mggCdyC1Twlw1XssSkqMp40NhE3S2?=
 =?us-ascii?Q?kAOQQMUrN/WLcF/uYipLtTpS3/xRC6zJ38rP6s2Ti5H45CvHTWRvz2VUSSoI?=
 =?us-ascii?Q?W3mBG/JH98Mx4KQIFCdIp3hJVbvRMw6669shpcUZVpaKjDKRyBMGASsbUEhB?=
 =?us-ascii?Q?75dBWfmytB5HWoODE2IfWJYmUynWG8p7RODY5EsWFCwucna6SeYq6mr7L/OC?=
 =?us-ascii?Q?BFGcYi8j/zUms5MHCUa9uIkf2RyCcL/8Ptv8Tgm7Zf3HyQ7fUdalvGZSrbiA?=
 =?us-ascii?Q?psXYRd+MSfJeo3cHeBfoQHPwUg9YRN+anYdyzFkPFF76G6fo5M0Z93bcgym8?=
 =?us-ascii?Q?4IGRu2gxrDh5wPc8A5Okd+U5z2WjrmNSTTBfeD1YeGeKNvLMD8lGBbkXVC4u?=
 =?us-ascii?Q?A/BzgmN304VfzEb/eauLRTQdhvZ8K3mvZZ6KtD4z+oORZP3wiZu7M+6Cm1JP?=
 =?us-ascii?Q?G7eNuQ1kFI4y3MXj+lh3gf5LcOSk5kR8Y/GRpwsnMZRxowy1exbK1aOkP5Bp?=
 =?us-ascii?Q?L8Pe220nzCdsHnwzQCAI5YiVCoNaSySefXiBKozUs2wt7FF/vuE4rQIgOZxu?=
 =?us-ascii?Q?6Av+AI/LUvOrHKIeYZwGFVLxj3lLKa/Y9/OvmqDNfbfuESR3xz7p/IP9n86o?=
 =?us-ascii?Q?r6TbpPTXaRA7QReMiVF3nyo/543T34BP0gOEueBDlmHDNoMCMS2k5CFtE77i?=
 =?us-ascii?Q?kpv3/3KIFVsKs2MUCtm1ewQmFLxhwlquRYBx1Hm24lVOzLxXI9rUXI2D7VNK?=
 =?us-ascii?Q?fmycTqvf0yzUtOaFcw/RWTBIJ+P0tFufICPjGp8mWXr7Wg4OmfLEpfnIm6Am?=
 =?us-ascii?Q?KnYRfIzEAef5GfNS41vGcN0aRpf6BZe3pkzuT8eu3rsy6961Z+jxz6c0qMXm?=
 =?us-ascii?Q?eRZX+m9LxYp4/PBwvlN6tYdVl9VZM3m21cHSk9eEG0JWDUpswU8fNAHoC+rw?=
 =?us-ascii?Q?dJBYwd+YCpS14YlmcJNujDuCZCcwpJJKXoeY6t1q743CfNiZHvWjxeRl9XEu?=
 =?us-ascii?Q?08g+g/vF0v8L3QBm88AIQOk8Q7VK/GdGTxOI53B3tYjexPGJTLsswUVsXOdq?=
 =?us-ascii?Q?ofwpNkn2ykv98+X3ND2QL52ztrlGuc/XAoqw++cy8cneDEh1zuV4wqs4/Bds?=
 =?us-ascii?Q?ZG5XyDWl8OZQETk4tDahyzO6MyuHJ78/+/Fj6N81oqWzCtJuAxOCehShL4hi?=
 =?us-ascii?Q?ZryrXa6ctPpxHxCBwsBfwduoZaMKqjwVbWd4ktCge9EMz6Zrurg+buhoTgtB?=
 =?us-ascii?Q?xdJqmH85mhBdshZwLEU5UqZGO38qqvKNYpiTHmymaj0pvyZMfTH+sOFLWzFl?=
 =?us-ascii?Q?ZvOaoltHnv6J6MY46YLpIkJ7lb3Pgx2nsTZLQ/B5LkJeSN1FgOFFWAgngDCn?=
 =?us-ascii?Q?mq7un238qQFXvDTdSgf13BjaRLb1AsY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c181a066-134d-4b7b-e2d8-08df2ab5a24e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 12:12:51.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/e1NoQxbkIr5b9ZRjNClY38IGK1x51kQAInClZKK3L9NtGDXJYzyYhqlnPQ/h5qERQSqAa6NH/BDJivYEt1Aa0wRdZBuqFuPv8Ue+5yzAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247875

Hi Yoann,

I encounter an issue with linux-yocto version 6.18.52 on wrynose with=20
TUI disabled for perf.

In short due to "e97bd4417010=C2=A0 "perf annotate: Fix build with=20
NO_SLANG=3D1" commit.

builtin-annotate.c:523: error: too few arguments to function

 =C2=A0 'hist_entry__tui_annotate'; expected 4, have 3


Kernel 6.18.54 already fixes this =E2=80=94 it just reverts that bad commit=
:

8c3b2bf7f39c7=C2=A0 Revert "perf annotate: Fix build with NO_SLANG=3D1"

But =C2=A0wrynose branch is still =C2=A0on **6.18.52**, which is the broken=
 one.

May I know do we have plans to upgrade wrynose to 6.18.54 ?

Here is 6.18.54 upgrade on master from Bruce.

https://patchwork.yoctoproject.org/project/oe-core/patch/20260929154516.250=
7960-1-bruce.ashfield@gmail.com/


Regards,

Jaipaul


