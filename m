Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4A3C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 11:21:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.web11.10440.1749727307781249634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 04:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gaI4NJRe;
 spf=pass (domain: cherry.de, ip: 52.101.66.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJwGgNETVvgRORHLeLTVVuQjdW8kVl4LAzBknEj/gm4AWVP1K/UqlSov0Ka7iisPUJCGKDBI1PVJI5buBjW9mUy06pyuQ2GHMuZe+3Crtl5nr9CgT/Indi4CyE2FdTIx9UH295WqlSfYApxnZ5etHTlOWoh42heeE1B17MTCLhPrJrzZwath689XfyszrkzdVCH+aRhON9c0lY+FnpwRn1mHLtSec+RL9axKvYfw5bP7oF3L7sKfzCKxn/Adu6BsK7iZpfQhX+l5kcQacZW/vqtZizNjuB4ZF9QLx9Zk4jBBOqpMSVpGbrYTXnbz3ov00yR2pwKAtnQHcsp/+xfDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RfB/h+wd5kGXvFzP9YLNGKJagbNdII9YB289UcnOaU=;
 b=poKGGagdTEbevA/roTm3zq8mYKgxeJn3+hrdTUwL6dXfsJ+FxU48Ip9/7NIJ8rrPbOOF51pLDJbXRsO480wQDmqCgV3Du8Ag0FRFkhWOvbs3+UyUYwtAkdVLpn4aSGNtzgfgnnZrqY4n952fVoma8GtZe8Vi6dUbEecMMCF0xRvAVyP0lrhZGtcFt5GQn2SZn6qdrl1luc05A5o+T7xxw0TDd+jVYwbgMNd8dlGKz8IyxcffFbE+47Fs+Q8U7hxOURdQv1nFxdIjvLFHXoUm48m4DLP7VR++Qyb1uiaep9X0E4rR72gs7quvYZ9xnW+KS4xCYO4fRKZWc6heoeJKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RfB/h+wd5kGXvFzP9YLNGKJagbNdII9YB289UcnOaU=;
 b=gaI4NJRem6c4gPFnKTkyhGTZOnEBQdMHOOweqxrB3KprhMg3h4zKK8NLNV+hYrw72rh4h228jMvEiX+YBKC9WaX2bqiR6CYC7czdSEZ8AzEGcZG7sk2hkddQaomOZs4ZKAsZGeb3QF47zMBriTaFTuMKDRapjdqIb43qCmUtciw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10307.eurprd04.prod.outlook.com (2603:10a6:150:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Thu, 12 Jun
 2025 11:21:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:21:42 +0000
Message-ID: <b7dd59f6-12b1-4bea-a340-16582aecb598@cherry.de>
Date: Thu, 12 Jun 2025 13:21:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: How to fix Panfrost support in mesa?
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Markus Volk <f_l_k@t-online.de>,
 Trevor Woerner <twoerner@gmail.com>
References: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
 <CAO9ioeUJVaovv7WTdP1V4KFRHeTK7Tv9LowrcG6V2OfvrJwpvQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO9ioeUJVaovv7WTdP1V4KFRHeTK7Tv9LowrcG6V2OfvrJwpvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d81b15b-3211-4b3f-231c-08dda9a34e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0xKaDdVNzhjaG5zdDlKQ0pkMlpLMUFsRWlSYjdLOFBQZ2pPNnpybW9tbXF0?=
 =?utf-8?B?S01JZ3Nvckk3T1JuSC9WTUhyb09RT0Y2bmk3VC8rM0s2V1FhSDF1Wk16MU0r?=
 =?utf-8?B?MjBnUCtyY2w0YmlOdWw2L3NGUHdNVVFxaTVyZ3JVM1d4NWlzaTRQVDJsZzl5?=
 =?utf-8?B?eE1DUUhBaVA2R2l2dzlsSzdoK3Vib2c4N3NrYmRZYTZadkg2TGR0d2tTUTNR?=
 =?utf-8?B?SEUxOXVROWpWZVNIYnBIazFkRExsM2dFZTF0elpGVi9jN2toUGpUS3dydzE1?=
 =?utf-8?B?c2pIVTJCZDNIY1c1c3NpTFpFa3A0MU5JN3RmUnU0aTRneG1QZVpnYTRUNFhl?=
 =?utf-8?B?TVdhOUVCa1hHYzRZRW56cWpUc28zcVlVajM3VWw0M2E3VCtEZjlnRVd3R3FY?=
 =?utf-8?B?Vm95dlEreG9oWEp2bTBLL0Z3dnpTSTc3YUwrRFBjcWtvYTNMYWFhM2xCMWJJ?=
 =?utf-8?B?TXpQZmVGY0Y3cnM0MUNuakwwc2lLa3JhcS9lSlI1Z1U3Y1dQSnNMYkNBSHRB?=
 =?utf-8?B?TlZrYzN6b1p1S0F1UUE5WVNpTzExUTNRcS9Rc2dDWEhMbFg4LzlqMjJxUVlv?=
 =?utf-8?B?UGp0S1JGbllEaEFmaEZKYTFEVTBaTS82citYc29wWHRTUGxTSDU1MmlPeE91?=
 =?utf-8?B?c3dwZXBKanpIREFsWWYvZHpVZHE4QkRXeW4vczFtQmNiZ1AvaVBoaEZBN1pS?=
 =?utf-8?B?M2xNZWNIdkZ5UjRHNHV1aVh0Z01GYy9UekdDY2didFpJQkZXK25qc20yeXd0?=
 =?utf-8?B?ajVFVk9VQjkwemVGWE1sakdHL2w4OHR0elo4aVZEbHBwb2lobnJUc0tIaC94?=
 =?utf-8?B?NTJJQVNUQllLNWo2OTc3ZDVPT1FqSmdiN3B6dGdlbWVZR2htMlNyTjRJVm1h?=
 =?utf-8?B?YjV0ZGhlbzhnSFZTbEVWdERXWWxzQ284Y0xZSWpXZUdua0xuTUxMR0JpVG9k?=
 =?utf-8?B?SkRKOUdibHNxbkE5T0JUellTdy9OWmg3RGYyZmhyOUxVUlBmaGVLQmIzNStv?=
 =?utf-8?B?WGVnVE0zT1dZREV3QnFZT01Sc3RBTmlCOFd2QWhMTHVDZFBUSWZQYitHK25L?=
 =?utf-8?B?cUlvWWdKYy9Wc1RLbk1KNzlxb0huOHUxTERET1hlekNBdW9vcFU1S0ZnUjBC?=
 =?utf-8?B?TkVnT05xZUtYdXhWZTdSL3dzNVVQR2RtRFFEQ3M5T0lDdEQ2ODUra1lEb1VM?=
 =?utf-8?B?V3JkS2F6V21FNG9EZ1lHdmhWNVREaTFHeFB3YlplMDZMa21USWtCaWRROFBD?=
 =?utf-8?B?RXVNQzl2WkF6OEZFVWdmV2tlN09RUlhJbGZGN3FRTk5UVGN3cTdwNzZPWG04?=
 =?utf-8?B?Uk1BM1pobzhkTXdBMHRxQk1Udmd3bFdkdThBNVpqNjRMSElUaGRrMnNMZUVp?=
 =?utf-8?B?MHlZOUhzRDI2ZE5ybWFWdzR5WVZuNDV3NHYza1NqNUhuYkhKTHZMUVBNdllS?=
 =?utf-8?B?dzdsL3hnYTc4RklNQUZHZ2FJUUZOK0xvQStiSmxuOXNXY0dzbDBwaTlmZGFn?=
 =?utf-8?B?ZXZnNThRcXFNaCtTNDIxTmFMWjlSZUZiNUVnTTFGcm9BWnRjU3RUaWJIK0lQ?=
 =?utf-8?B?aXNRVk1ocnBmU2plV2NoQjltbDFJdU1Kbm5ZSTIrYU92d2xtQndESXBJc3di?=
 =?utf-8?B?bUJNZ1M5Qkh6WFBrN2ltYS9ibExvWnp5WkdJdUVjclAwZ0p3eVBET3Z0VW1C?=
 =?utf-8?B?YnRtdENPK2ZEQThjNExvbWJKSk9peURVbXVVY01TbWVod25LNGF2WHlBOE4r?=
 =?utf-8?B?VHVHc2s5VDk3WGIvenRZOTloSzFQUTRQMDZ4Mk1GT1JTWDUrS0pOYWltMTRh?=
 =?utf-8?B?T0FSMHFmN2FjVVRsbmZGS3p1b2RRQTF1ODBmMDJ6QnJpaDVja1NackNHQUd5?=
 =?utf-8?B?SjA5TmJTZ0xqNS96cW90MXVXUFd2Rkl2SXhpa1pYK0VTa2RTTHE5WnhaTEs4?=
 =?utf-8?Q?CDMNw2QU7N8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTVxT1FjZUpyS3FwMlZXelFhZDBrWTFDbDdxcS94ZmxtNHJHcy8xUjdWY1VG?=
 =?utf-8?B?RHVYcW5CdHZKWWVhbEEvTFRnalhKNHVpM0s5MGxURHEraU1rU2gyME8xaXF2?=
 =?utf-8?B?R0Z0azJyQUFDMFhsamRUZmwyRVZ3QTdURHRBNGhOdVVSbmlmMEt4dVNtb0pv?=
 =?utf-8?B?SEtxc1pvWVlhS2lKVFd3M3R5NGI2TStQTWN4dHp4SHFsMS82SnNsbE9WQTFN?=
 =?utf-8?B?ODRrSkltckNRYjlydlVwaEFkTVRxenVxbjN1Q2psR3BHQ0N4amlNaS8wd1NY?=
 =?utf-8?B?Y2RJek1zbHBHdkFHWTNGV0xwOUw3d1g4Q08xdnlSd3ZMdnJTc1ZaMmRBWGs0?=
 =?utf-8?B?LytJdW1meDhReCtLRE9UaTFIajZneFRmeTNQVitaVmtra295TlozNHEvNVkz?=
 =?utf-8?B?RHpPV29yeU1WSVFldHpjTGQ2WElKT0kvR1JWMjVkaVN5aUx6K0N4Qm9kVW9K?=
 =?utf-8?B?LzBBNTV2Yk9Xc3BYWEhFSlRiTkttRFV6Y3lkZ2NrVzgwWE11MGZNUjFQeXY1?=
 =?utf-8?B?a2h6UlVoZVJodHFiTm9kdDRzZFQxNG9Nc3NOSnY1cXlaUmdnTkwxNC8waXRX?=
 =?utf-8?B?ZGwvR3pPd3dpZ20rQmFEUGphTTMvUGNvZFFENEZTOURjWlQ4M2h3dGhFL3VH?=
 =?utf-8?B?c1ZqMTJyM2ROcWRnT0lmRVFZY21NNmxkeFFWUm5Oa2hmUncwRldnUDBIV1J6?=
 =?utf-8?B?SS9sd0lBVktMS285cHorSEZycjI1MERRdEs4cVVuTmUzZkFvWnJPY29oVkgv?=
 =?utf-8?B?WjBHTlc1TWd3dzBIVjRWcDFSNk1udDdMOTBBQmVweFRkdEpUcXI5clZlOHI1?=
 =?utf-8?B?SjhmeTQzUWJZc1l5VVI1VUk2OVVaK3ZUUmM5MXJ3TEdYcVNLWkIwNFJRb0la?=
 =?utf-8?B?WFBNTmpOVm5UV1hvNWNmYUJkVC9EMm5LNDJxR0R0OE1keDd3M2x0SUYrdmlW?=
 =?utf-8?B?T3FibkNNNld2M20va3VTTlprbVgvYXlsZjFEWVVtSEZEUElHRmtQUVZkVEEv?=
 =?utf-8?B?akdBYXBEWllXbmxPZUplWlppbm44UE5kQ2dWK2JyRjBya1FZS0dlL0hkVXVx?=
 =?utf-8?B?cXoyWk1ZeW11Y2xGeEkvZTRTZng1V1Y0T1oxK1Y2cnVBbFdtVy9QYVg3VlFD?=
 =?utf-8?B?N0FtRXJJaTdvcjFqb2ZkVGhUeWNhdkJIVlpWeXVkbTN5NWdySWgrM1VwaTd1?=
 =?utf-8?B?TzMySitwZi93YWE4RDZHVDVOVFh2YXBoZVkyVWs0Wk10M3ZLY3RPZStPS2F3?=
 =?utf-8?B?UHVUQmJWTEkzNlJSL3pjbnNwWE43b21qV1BpRlp1UGU0VVpkb2RjVE9TK0oy?=
 =?utf-8?B?TGtTeWhHU2lWRVB4bWhzSkVhV1ozU3NheU4vT09NL2ZrNjdOUWFhdDFNaHdv?=
 =?utf-8?B?Z1lmZitqTlRHdytCT3RsQ29VNDY5Rk1vWkdlbGt6MlRzd25UdTJWSFpabytL?=
 =?utf-8?B?djNEZEhKQzUyWDR6SmxmWmdpT1V2S21FTm1HZ3RSamRuV0RMM2UycldnMmp0?=
 =?utf-8?B?VEZGaVhaVjg2dXlpd2x4UGZwU1lYVlRYR0M3SXovR014OEhjTHZCY2hsUWMv?=
 =?utf-8?B?MzA3VzFlZEozZTNvNmcrdndYTmhMNUd6QUpRZmlsTVlhTGpoWC96Y1JGYTlF?=
 =?utf-8?B?YVp2NWFVU3hsbWMwdStkQ2Q0K0JqRjRQaUNVRk55Z0FGN2tuaG15cFNaeC9H?=
 =?utf-8?B?a0FnckZoT3RIOGtRL3d5aHI2OFRJVU9FMFMyUHU4MlZ0dExFc0J5ZitSVFRK?=
 =?utf-8?B?RjZLc3puckl6UTd4d3NRaloveTBlMkxBNVdUTGJXOWhZSUdCR21WZ01idDFD?=
 =?utf-8?B?eHJhL1NnNkNqUXJxVUlsSXNxb0NMV3JiMGxobkk2bWM0OEJpcnZ6RDk4U1Ez?=
 =?utf-8?B?d3VVMk0rNkRZbnR2cmZ3YUJybzZIU0JyUjlldWI1N2xTRkQ4SHFqQUkxL2V1?=
 =?utf-8?B?OE92cElsZEI4UjI0NG11VzUvUlBYL25WSkFWMkptMlB6dmEzRTJnZ0lSdjFD?=
 =?utf-8?B?VzI2QjFqUlpYZkRCaTZZdk94dytyeTZVSXJhRUgwNDJCd3pXL0ZLaGF6M2d0?=
 =?utf-8?B?THJ5TzVJVWx0YkpJMmxBQmtPMFpNRFJDejRYZ1Y5ZzZMQVBIYWtpSk94Skov?=
 =?utf-8?B?Qys3azBPdEJFR1VsbFZ0YzQwUEFOQkNPSXRnMGdkeWVoOHZqaGRRSS9LYUp3?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d81b15b-3211-4b3f-231c-08dda9a34e15
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 11:21:42.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faVTZx5Sm4kclYJyugdmNmeumyzYQJkNRAQ6YOvy6bbecVfC8/4j2Ek4VxrQb0NUHYFpmb03zWelqvaE4kDl43THNZGrIGPEh6QVwzGFl0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 11:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218513

Hi Dmitry,

On 6/11/25 10:08 PM, Dmitry Baryshkov wrote:
> On Wed, 11 Jun 2025 at 18:33, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi all,
>>
>> I've been trying to add support for Panthor (Panfrost for Mali Valhall
>> and later as far as I understood) to meta-rockchip a few months ago
>> already and attempting again.
>>
>> I had managed to do something for an old mesa release but it doesn't
>> work anymore. Worse, it seems that the current Panfrost support is broken :)
> 
> That's an interesting claim. I hope you mean 'broken in OE-Core', not
> 'broken in Mesa'.
> 

Yes, I meant in the OE-Core recipe :)

>>
>> For starters, the build doesn't succeed unless we have both panfrost and
>> libclc PACKAGECONFIG enabled. I believe this is due to 20970bcd9652
>> ("panfrost: Add base of OpenCL C infrastructure") merged in 25.1.0. So
>> there are some changes required in mesa recipe to force libclc
>> PACKAGECONFIG *in addition* to the panfrost PACKAGECONFIG for the whole
>> thing to build. This shouldn't be too difficult though.
> 
> This seems almost correct.
> 
>>
>> However, reading the aforementioned commit revealed something else (or
>> maybe I misunderstood :) ). It appears that LLVM is now required at
>> build time for the Gallium driver, so that would make panfrost part of
>> GALLIUMDRIVERS_LLVM now. The issue is that it builds with and without
>> gallium-llvm PACKAGECONFIG, and it seems to be running glmark2-es2-drm
>> just fine on RK3588 (G610; Valhall). So I'm not sure what to do here?
> 
> If I understand correctly, panfrost requires at least mesa-clc /
> panfrost-compile to be built for the build system. We support building

Not sure? I believe panfrost-compile is always used (either by taking it 
from the host or building it) whenever the gallium or vulkan dirver (or 
tools) for panfrost is enabled?

> the former, but we don't support building the latter.
> The quoted commit has the options to be passed to the meson when
> building the 'host' binaries aka mesa-native and when cross-building
> mesa.
> 
> Though I'm really surprised that building of panfrost works w/o
> gallium-llvm in the current mesa.inc
> 

For the target recipe, gallium-llvm isn't selected right now, and adding 
libclc is enough to make it pass the build. But we also set it for both 
target (by adding it manually) and native (already there, c.f. 
PACKAGECONFIG:append:class-native) recipes.

For the native recipe, gallium-llvm is always there (c.f. 
PACKAGECONFIG:append:class-native). So that might explain why you're 
surprised.

>> Making it part of gallium-llvm drivers brings in clang{,-native} among
>> other things which is horrifyingly long to compile.
> 
> I think clang-native would be required at least.
> 
> If you implement precomp-compilers in some way, the correct build
> options would be:
> 

I'm not sure it's necessarily worth it as one would need to have 
precomp-compilers + all drivers guarding this precomp-compilers (right 
now panfrost and asahi it seems) in the native recipe as well so that 
the target recipe could use it.

> PACKAGECONFIG:append:pn-mesa-native = " panfrost libclc gallium-llvm"

libclc and gallium-llvm are already part of the mesa-native 
PACKAGECONFIG, I don't have panfrost there though and I would need it to 
make use of precom-compiler=system on the target recipe.

Considering we would need panfrost in mesa-native (+ precomp_compiler) 
to be able to build panfrost on target, does it mean we should always 
have panfrost in native (in OE-Core) to avoid having to figure this is 
required from target recipe's perspective? or in BSP layers?

> PACKAGECONFIG:append:pn-mesa = " panfrost"
> 
> Note, currently we don't pass -Dmesa-clc=system if libclc is disabled.
> Most likely that needs to be changed too.
> 

The issue is that if mesa-clc=system when libclc PACKAGECONFIG is 
disabled, we still need mesa-native (with libclc PACKAGECONFIG) 
otherwise it won't be found.

However, maybe with this we can lighten up the dependencies in the 
target recipe in PACKAGECONFIG[libclc] to essentially only mesa-native?

It seems like maybe some PACKAGECONFIG (e.g. libclc, the upcoming 
precomp_compiler, etc...) should be native-only? What's the point of 
libclc for the target recipe for example? Is there even a point making 
those PACKAGECONFIG options maybe we could simply hardcode them in 
EXTRA_OEMESON for example for the target (always =system for mesa-clc 
and precomp-compiler for the target recipe for example?)

I "quickly" hacked something together that would make panfrost build 
without requiring to add libclc to the target PACKAGECONFIG. This does a 
few things like using precomp-compilers from mesa-native and mesa-clc 
from mesa-native without requiring either PACKAGECONFIG in target 
recipe, forcefully adds mesa-native as dependency of target recipe 
(though maybe should only be added when libclc or precomp-compilers is 
not in target's PACKAGECONFIG?) and removes libclc spirv-tools 
spirv-llvm-translator from build dependencies for the target (panfrost 
builds fine, but is it correct?).

"""
diff --git a/meta/recipes-graphics/mesa/mesa.inc 
b/meta/recipes-graphics/mesa/mesa.inc
index 9b41955132..746b5f7be9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -97,7 +97,7 @@ INHIBIT_DEFAULT_RUST_DEPS = 
"${@bb.utils.contains('PACKAGECONFIG', 'opencl', '',
  PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd svga"
  PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd svga"
  PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd svga"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd svga 
asahi panfrost precomp_compiler"

  # "gbm" requires "opengl"
  PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
@@ -194,10 +194,18 @@ INSTALL_MESA_CLC = "false"
  INSTALL_MESA_CLC:class-native = "true"
  MESA_NATIVE = "mesa-native"
  MESA_NATIVE:class-native = ""
+MESA_PRECOMP_COMPILER = "system"
+MESA_PRECOMP_COMPILER:class-native = "enabled"
+INSTALL_MESA_PRECOMP_COMPILER = "false"
+INSTALL_MESA_PRECOMP_COMPILER:class-native = "true"
+MESA_CLC_DEPS = "mesa-native"
+MESA_CLC_DEPS:class-native = "libclc spirv-tools spirv-llvm-translator"

  PACKAGECONFIG[gallium] = 
"-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, 
-Dgallium-drivers='', libdrm"
  PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, 
-Dllvm=disabled, llvm llvm-native elfutils"
-PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} 
-Dinstall-mesa-clc=${INSTALL_MESA_CLC} 
-Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools 
spirv-llvm-translator ${MESA_NATIVE}"
+DEPENDS:append:class-target = "mesa-native"
+PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} 
-Dinstall-mesa-clc=${INSTALL_MESA_CLC} 
-Dmesa-clc-bundle-headers=enabled,-Dmesa-clc=system,${MESA_CLC_DEPS}"
+PACKAGECONFIG[precomp_compiler] = 
"-Dprecomp-compiler=${MESA_PRECOMP_COMPILER} 
-Dinstall-precomp-compiler=${INSTALL_MESA_PRECOMP_COMPILER},-Dprecomp-compiler=system,${MESA_NATIVE}"
  PACKAGECONFIG[va] = 
"-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
  PACKAGECONFIG[vdpau] = 
"-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
"""

To be honest, at this point it's quite difficult for me to understand 
what's going on. I have zero experience with mesa, very little with 
meson and somehow panfrost builds with wildly different configurations 
and seems to run fine as well with glmark2-es2-drm/kmscube, so not sure 
when things are supposed to fail when misconfigured at build time :/

I'm not sure everything I'm writing here makes sense.

[...]

>>
>> On a side note, I'm also not entirely sure why we need
>> softpipe,llvmpipe,r300,nouveau always enabled?
>> Can't we make softpipe the default only when llvmpipe isn't enabled?
>> Do we really need r300 and nouveau always compiled? Can't we have a
>> PACKAGECONFIG for those too? I see there's an amd PACKAGECONFIG already,
>> maybe we can use that for r300 as well? For nouveau, a new nvidia
>> PACKAGECONFIG maybe?
> 
> This is really a good idea. Please send those, idepdendently of your
> panfrost / panvk work.
> 

OK, will try to come up with something :)

Cheers,
Quentin

