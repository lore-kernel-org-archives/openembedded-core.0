Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E656E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:24:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web11.26961.1734884697639551475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=S+e49MV7;
 spf=pass (domain: oss.nxp.com, ip: 40.107.21.89, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5TgAl+NNZw3XfYuLiEcYW78OOo3rlJbdhVp1jd8M39/Vg0aoY2aLkqkZYcwzdTGiz+c0rxu5xEqSJzJWfzXAXlInc62kSAhmaTWbu9N+GHGLir63g35ptkqI1wd+gLH4JgLs/Ra8GT0ZGiMeJIoxMi/TF/8L1I/A3xI1RmdBLIE/ZYu8fyC0j2n//0X7Dzo+Beqz9CvFZVSKcoNkPEmjGYaMZCkytNwMTlr2NkM0Ry/VvUvZADFf9i1xxCfUDw07/PqPulvyUJJGnbcm1wXRQaG3pQbXQIGECCqaIuhPKMc4rIg51iRO0Z+6daLzrPtRzkzHOCQw+NResDuQeVafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYBlV5gnNT3IGauuZ5f/CgOs4U3Q5cyjwuuAyuoR7sM=;
 b=si7nrPLgMbf3eLD3GBq3XsjwB/aC/eoD/NsruqlVRrJxw/Zt3iXY2SKBBpQkhEyjt20wOwth8ixacJN30+BZ4+NydyNyM4suzDcO0IN/2EcgKhF/Z1AF1WLAwRYw/PvYunCq7GZkU0Q1g5LFU2saCPlEHeSBy4/wjgL2rwS4fMRktF3iScknpNLHSnlRbXQM+kIN5IcV0AN4Okd7Wb2vj+4BEVkXIrXoaKte/lmbJ/ivbC8jOmbYHlY5VPNjLFNuXnu5KBj3Ve8b4TvlN7yCJJZbWCFNb/gy4Ymy0fAPfdbzPMFHKQgC1clPZzlgZKCZ3+M3Fgvd23fkmT1DRt0XZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYBlV5gnNT3IGauuZ5f/CgOs4U3Q5cyjwuuAyuoR7sM=;
 b=S+e49MV7RB2ejqahbAoXKl2qXStk59aYacho4a8PPwK3/2tk331Ayj0LfRCM/BS5qNRQ7qvHhxu7s2+6Eqz6YwKo7WCj2rxOLVcxOo5RwnteXzEsdAtyjpTAbdb4PF7uCS5ba3N+m8t1lZX+X/wjTLVx9HrVoJUn2nugNwisB0JoMhF5pmSRsbj9YZP4EFGbySljWCWm4lK7NSuMCRa+hEbgT6RtWjJg7HOR97HQ0lkN12neNZW1KHCGX5l8j9OHKG2/siD6D4fmCCVvEo70qP2uxyTq27NteeSjlrhuJKCxv0y2ZpIe2AEvUx/c8SPt8XUaz+A/Xvo0ukgai6rwXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Sun, 22 Dec
 2024 16:24:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 16:24:54 +0000
Message-ID: <c6100e7c-4002-4fd8-8c2d-a800c94ca376@oss.nxp.com>
Date: Sun, 22 Dec 2024 10:24:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 5/5] mesa: Fix missing GLES3 headers in SDK
 sysroot
To: openembedded-core@lists.openembedded.org
References: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
 <18138C56105EEBAA.17446@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <18138C56105EEBAA.17446@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec5e662-2c3d-4157-56d0-08dd22a52ae2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vi9MTVBGTHc0UWFsRUlxcHJMbnpYZ1lqR1p2TzhEM0U5QlFtRXNWSU1TQUs5?=
 =?utf-8?B?dG9JcjJUQTZWdWZ4Mm1nTXpyNVVUQmlEdFhqZ0lRQ2d5V2o2NEUxR2RYKzEv?=
 =?utf-8?B?TGtMem1vZ3NncFZ0YmVabkdXc29peXJ5WHc0L1JaeXoxTEtucmN1ODBaZ054?=
 =?utf-8?B?dFJSMnZ6VkdXbWhzdzZYRHVGVVJPSlE0VUdrbTNFajhzZ1orV1ZyUG5STU0r?=
 =?utf-8?B?NHNWaHlDcnh5SFVTZTRvODg4VnhXWlQrTkVDUSs2cHl6c1BzNVk3cTdBMm9E?=
 =?utf-8?B?K21ablRGekpYV3NTUThUMW9ycW5TVVM5OUJnbDJSUFhQbzlkbFBNQmZFbm5M?=
 =?utf-8?B?Nk9VRHEwWVJYZU5yZXR1Q3BpaUdkTktZUnNIbFZyTC83Q0c4QXFpYlFVT0hw?=
 =?utf-8?B?VXUreWZJT005T0Rpa3VhcjlJS0pYZnpzczVnOW4vb2VleGZzclVQRW8wdHBQ?=
 =?utf-8?B?WUpibVNaUmlLUDRyUzg0Wjk3bjM1YkIreUY4R1BwdFNJSzVwaXdEb2d2WDAz?=
 =?utf-8?B?aWhIVE1jUFdNSTVJN0dCTEdNbDhFcjV3Uis1cktiMkNBZS9ERkVMazl1dUM2?=
 =?utf-8?B?L2ZlN0Q4ZmtBaVQxNXZwSXl6OEZvSi9ESTNvTitMTzhlNElpV2ZzeTR0eVVZ?=
 =?utf-8?B?eXhaRFB4QkxEa2JzekhsM3VkNTd2R0VNYUtvaEg5OU1RNi9PNmxadG1PWmVC?=
 =?utf-8?B?d3F0cW0rL0oyMGgzUVNZd3lqUFRQWXVaSHlPNkJzZkxkcXErOGNEWkdOZXpa?=
 =?utf-8?B?SThBeHVRVmlzbzBrYzEyRXQvQndNcmlXc2lPRjBXNlRsQTNSVk1DV2dlNWsr?=
 =?utf-8?B?bDU2NENXNUNGQVp1UEs3QkRobWNwR2hyNHNjRnFXelNwUnV0b3puUXFld25q?=
 =?utf-8?B?dCtRS2xVTGJkRjhYL0t5a0FEVGxvN3BRNWdyUzNNN250M0U0QnRibDZpRzR4?=
 =?utf-8?B?SmF0ci82RVVUS2M1eFFLNUtLTm5WTWhHeWprVmRKTVBwWTVKTDJPWXFzNUVG?=
 =?utf-8?B?aHRMZjFQTWNRWGM0UVlDd3JjRDE3MTR2SzhJZGJaRHpYRllVR1FSK01kcEFJ?=
 =?utf-8?B?eWNsUHRHWjZETFdhQU5vM29XRFFZUlVqS1dKMkthR1Ayem02L2liNXJuQWlM?=
 =?utf-8?B?bkFzQVFuR1B3elR5RjdJSzJSVUJyWW50ajVNaFp4d0ZxaWhMVktydDV2OWZJ?=
 =?utf-8?B?b0haaktRc0tCUUJ0K0tWd09Fckd6WTF0M2NNOGg4aUQ1eFNqeFdrV1Nsd2xM?=
 =?utf-8?B?Q0RpVDhETkR3ZWVyNkRzU3FOUFM2S0hlclFjK2lvV2t4Y1M4Y0hvM0Vzc010?=
 =?utf-8?B?S3k0cmdUUVkyQ3hzZWVEQ1p6cVdRYVFNTnNmZ3FtTjVQUlBCSS9TU3luN3ZQ?=
 =?utf-8?B?TTlwM0YvV2xvSHdnM1laTE1oNGZpZ0dpOXpqYmpRZkY2ajI4eTlBMUpNMUxV?=
 =?utf-8?B?RThkbFl4ejJRcDBDbGVsTytTWjFZNTkwRXBrS29nbG1YRHF1SEtoSFlXcG5I?=
 =?utf-8?B?OFI1MGpPNWY3N3ZhUDhOM28vZnRqMGpibW5KcGlFRXM4Zmk3OVJtTVI3T2tu?=
 =?utf-8?B?WkpoN3pXQzBsT2F1R1dXSlhHeml0MzZtNXdaSkxKS3ZVN2V0YjRmbjU2V1Za?=
 =?utf-8?B?aE82bHh0NEIvSU5uSFJGbVZkTDZJRGpwb1NIUDZZVXdLM2ZpUVJuNGViVzVD?=
 =?utf-8?B?MDkzNVFweUdwK0FrRkVIZ3p3QWVvZ1Z5SjA3dGo0Nis1RXFlbWVnRFIyWmlM?=
 =?utf-8?B?NTFWRTRhTHNsZzlFejQ4emxqMjdOMVF0VVZkVHRQKzEvUUVab2J1enZweklr?=
 =?utf-8?B?QWNtT1NKZXIyT2xsaUcvNDNxRDczcFZ1a0xTVlRmdGRpdktNeDc5eS9MbjNq?=
 =?utf-8?Q?B6LRWDqFQm9L4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGRlOTRKblpscDJUbHJXVVlCSWdQRVp3RWNlMndIeHpUeHFaTmpQYUhuRGYv?=
 =?utf-8?B?ZTlhRktXUzZPcndIWjVlVEtremVGOUZEbDR1cWJSNHM2NWwxdVpsZldiYkJK?=
 =?utf-8?B?T21QWG9uN1JwZWY1NDZNZzAwVjR5Y3JyUUJ4N1ZaOTRmb3JJazhJTXluV1Fw?=
 =?utf-8?B?ekNqWXVyeDR2cDUyTEkzYWIyaHVOdERrS09NQzFjWUlyV3NBVlFQMW1wU1hs?=
 =?utf-8?B?Qis3V0Z6WEM0cmpqSlpiR0MxR2Y1dGx6R3JIWGs4ZVQ1K3lscER1RTNRb2Zp?=
 =?utf-8?B?L05rUGdSa2J0K0RwYWQraS9OUnlZNTJWVURyZ3RmdU5IUTFidFY4VWdVRGEz?=
 =?utf-8?B?aGlDS3FncE0raFNNQXRraXlITzM5Y2pJTnBEeDdzUWFkTFZXR1VIVTE3Zzhs?=
 =?utf-8?B?b0ZlY2ozeE9QTnVGREFLZEUwRlRyWVRiclZFYUdBblEvaG5FZzZScGxVTTdi?=
 =?utf-8?B?UDZwSkM0SWhwL0tKaWZNd0tUTFErUkJ4ZXFmUXphT0hxUnlma21mc1RaclpQ?=
 =?utf-8?B?cEU1VW4vRTBkVEFkekdFTmhSd2JoV0xWMElLbnBBTWlMd2gwZnFBTWtiSEw1?=
 =?utf-8?B?WVAyWVdtUFBVWU9PMzBvRkt5SmppNkRkVlc4dFBIUFkzMEhRb2UyQ3pNU3pp?=
 =?utf-8?B?WEUzZitIaEhVMXVrSnFuQzhvV21ZT05UWkU0UC9zOWVUcHVua1dXbklyVFZl?=
 =?utf-8?B?MXdldWkrWWZhUTZvSjNGZjlrRW95WGY4SG50VzlTRDhPUWpNSnN0TU91VWJp?=
 =?utf-8?B?ajlRTTlYcklZRGxBRHQ2dmRyWEFNNmM1OTU3V0FkTzFPcnJtNmUvZTJhbkw2?=
 =?utf-8?B?Y0ZoQWtLdUs0WllPOUJycG5CWWh4bnRZTDFLejJxM0I3QmFsZ3hWcGFUVDNn?=
 =?utf-8?B?MHJENjNVM3hpY2dSeDhxYmR6VkhYdG1ORHNseUdWNTh3eTdSaVdRWW9sVGt4?=
 =?utf-8?B?VUp0c09vVDJxQkp1a0tMSE1YVnZNU1RIbGZzb1B2TlZ3UHhaSnhtSHNsbDIv?=
 =?utf-8?B?eG1VOUJ2am9Cb1Jlck0xZ01KK0VDKzVxbFE5SmtoVHRsNkZKQTNrWHpQYzl5?=
 =?utf-8?B?V0NWaU55ZHJ3ejZBUFJ2a01DckI2SWxRZzY4bGo2Q0lYcUVqZjdITEt1M3p6?=
 =?utf-8?B?clpFMWtzcllaZCtFTGJjS01LaXlSc2JqaVQ0aHlrV3Jod2hpNWk2WUs3Yzdw?=
 =?utf-8?B?bjlrYzdtcnFib2MzNzF1TWFsOEF3bmZXZENaRkdScGt2SjFIYTl0OE12cUVv?=
 =?utf-8?B?ckxTOEhSckFRZHR3MzNXME9xTTdMYmxzN2VTL1o2TXduZUpoejJoMWFPSlVG?=
 =?utf-8?B?YUh5NHEvMTV0bXI1YjhudmcreEw5c0Q1cFppejM2Mlo3cTdGYUUrUUNRVVVx?=
 =?utf-8?B?MnFmVzh1SlZMUzFqclhzRTErWFlLSHczSS83Smt0dlJNQ3JPMGdrVW9rM1Z2?=
 =?utf-8?B?Rm1rb3E2VDBjNVV1dG1KQnlqeGdkSUdhd253QlBRbFBFNjFQSndtQ1graXNm?=
 =?utf-8?B?Q1JEWFlJWS9obnBYUlJ1Umk3SXUvejRnZXlkZEFQaHNCVUxqNzVSVlZJS2pR?=
 =?utf-8?B?dlRTY3VmY2U5ZzdXT0RSNFhYcElrSlFUcXR6WWY0Z3VPWGIyeUM3ZUpWdlJE?=
 =?utf-8?B?aTdZVmZnWUx6cGhrTWwzTVNvZTFQb1NkOS9ZYzM0MkVoM0djdmZySy9tTy9W?=
 =?utf-8?B?RmprWDdhWWZhTWtJNFpDZXpMT1dHcFdjQ21tYkNzTDU4Zmc0SHlPdWlpK0tL?=
 =?utf-8?B?QjNuNjFENlY3NXBqNXBxeXh6d1NCTWd5M3ZuRGJDYUQwZzFjcHMreUpuMlp3?=
 =?utf-8?B?V1Y1c2xoektkaEY1aHgwbDlqSUkzZG5JWFcwRlVRNHcwVWVnNExPQlVrYVdu?=
 =?utf-8?B?ZnFpRGZTYi9lelJHQkkxZWRzcHlWeWxueE1nb011Y0VET1kvb1FjTEM1dTRC?=
 =?utf-8?B?QnQ0SUhENldPQkw2ZVFzL3Y3bC9JL0Y1aVgzS2R3YjhyTWxZVWlqd2tYMytG?=
 =?utf-8?B?SitLVi9Oem92VU1XNkdTVk1lT1pKN25Ga0tUUWZzNEEyWHRObTdMdGYwb05Z?=
 =?utf-8?B?TytlRGIwcHV2TkJzb3dPTVJaRmdiZmZlV3BuZER4RnVoelE5dzRzMnVBWWN6?=
 =?utf-8?B?d1B4dm4yVUpmM3c0d1hsaWVsMkhiL2xjbGl6R3lZeXk0cmZ5U1VZL2U5WCtQ?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec5e662-2c3d-4157-56d0-08dd22a52ae2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 16:24:54.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W75pl0KK58PTCuLMiT669WbYgXbOOtDPVp9IYEVkKf5RKZxk7VvNIeSaaYHWz/9S9eC46wrmFDgnNJwo0E0Asw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209012

v3 is the same as v2 but adds this patch.

Tom

On 12/22/2024 10:22 AM, Tom Hochstein via lists.openembedded.org wrote:
> Building weston with core-image-weston SDK fails:
> ```
> ../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fatal error: GLES3/gl3.h: No such file or directory
>     29 | #include <GLES3/gl3.h>
>        |          ^~~~~~~~~~~~~
> ```
> 
> Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
> which is packaged in libgles2-mesa. However, the headers are split
> between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
> GLES3 headers end up missing in the SDK sysroot.
> 
> Add a dependency so the GLES3 headers are properly associated with
> the GLES3 implementation.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 9fdf496e8b..84490158f1 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -233,6 +233,10 @@ DEV_PKG_DEPENDENCY = ""
>   # development package of libgles3.
>   RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
>   
> +# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
> +# Add a dependency so the GLES3 dev package is associated with its implementation.
> +RDEPENDS:libgles2-mesa-dev += "libgles3-mesa-dev"
> +
>   RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
>   
>   PACKAGES =+ "libegl-mesa libegl-mesa-dev \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209011): https://lists.openembedded.org/g/openembedded-core/message/209011
> Mute This Topic: https://lists.openembedded.org/mt/110244770/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tom.hochstein@oss.nxp.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


