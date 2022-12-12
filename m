Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BADC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 09:08:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.38663.1670836136088139747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 01:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=FfJWQy0o;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.62, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iV/B25UNmCmFQT8eROTKX8T1SRVVvhmjCQ5iyuoBfQvFPiZEkn5zbUZmJi5qG6/yPfxRIsph8UXdKQ+zWP9ArEraoWlb05XJsp0+2Pg4ytcrGaCobDOJ4cBC7TwGdDC9OlCFEP9oom/jTTbliqs8O7rGCgVeNoqyjin05av/0D+P1OPecR4eNMtyBsouxnqaFO1L5rg6pR8fmz87OQ2cG90+cbhxaYX+IvlY4Nx37SN0U5MZOSpImDRMAmqLcYK4GqNbGpYiUxYTyNqGqndBYSxuSLrmYKbeRQF/zj/ch8hiVYJQ9+pMVTmf1xkWczTChtV9vnlG5SR7LWKAVrkYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiIkhHaFqGgdAgyzBfZjLXtFuyHQNS3pWV+xOa6TjeA=;
 b=NxKdkFa6dqPCesDDYoe0jSWt88LsfaiF8l7/HdlMsnXm6vNuhbqKNkVElXFnJXySOTUroUfwBeFL4L5bWZh3uTVops3T48d6bWIdHEMSFiUvMRIHwvgoYHihJSWWy9teLiZu6FwmLtcbMx9dkBjOBBBa5Aqli/cS99ElJ2Q5k0Xps/DeDvy843NFmOUilteZStegSvpgBmLL/iip2yobgLcWqywjlX+TZM9LD03ivnk7todr7qJzsWN4TSj3haZGH3YWYPDSXpBd/VX4V6wchkIdQvbhgkfKbhHKhRI+hF8NTnInX4dUXCnmaWlqGOUWmTlZGrxkTZY+S0JZQd/v8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiIkhHaFqGgdAgyzBfZjLXtFuyHQNS3pWV+xOa6TjeA=;
 b=FfJWQy0oeRq6F5QxepwbaOcCAIa/SPIkNDbFVYDS8MyXgzIblxjkS9M1jfbYBMmSIwjJpJOMenMfzLjexvCQH+EQ8n8yrPGqNKoV17jhUhKV8sCk0lftv/+w8LMQkmplm9Cjw4UCwyZ/go2vk94qsL9/LsbmsJhtm79nG9n0Y1/WKqqHLZni8qYSbc3waF+dot8awcFW7OgonpaUyvxFQrjRLsG7irPvPLtgpziTy0wyF1gUK3dmaCXF4zvfOoytw9rhUeaLK9Q8VX6FNbhKpuyvjoKucJ9/1Vq9BZOsl463mjVxdZq6HqOTRoSRzaqPaG3lpEY9IX6AuYil3WjtSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 09:08:52 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 09:08:52 +0000
Message-ID: <a9e82b43-5624-2b3e-1af8-bb7e684c0ab0@theobroma-systems.com>
Date: Mon, 12 Dec 2022 10:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH] lib/sstatesig: Drop OEBasic siggen
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <20221211161239.17710-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221211161239.17710-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::29) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: c812868f-2eaf-4411-e402-08dadc207d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VNCZoPESL88UTiXrQ4Vf4fVMbJfpsrx3r/4RoYRnh0aQ58Ensj0UQ16Rj5ilPl/SbFwf2i0peW6mhtC09rXPrwXZ2ORVuBHzNDQgof7irkYhIRjj1caZ+e4HXPUox6BakGErOXY1YuDhFkO1so6aBeTWTmocj5Di+Z8ZG8q3xFN2P7gIUVprvGp1ZdGTpqB0OeXaqNkiTzJ0AkeCpbFyvu6JaVNFpRnaq48j/RM142bjANPmu4W1Btj7EzpMwNGqeVoOyh6V1Q1/FS5FOODDsLo2JJuMqbqxnl7FrKk/BLeuKpEWE5TPtkZAC/LF53E/bNGyfee4XRC+Tqzu/ovwXMaPIT4/MgmZzMwC3NOtK1En8qZIhoG5U0px/8kWmVb2rtMXPtZ3OLxKx8eNkyCPfBFAHBI/khSLECvp3zb0i2i3aYTGCIswBVq0fUJ7zWFzP/n4tYa1Qa5kzq1f1cVVYT0h87ugnr2kbtVH7UztQQXIxXL9dSrlSONSxD8Sr39pH2tkMFOzEmweAhcu8vlC4aMUVqsyY4e8zS3H1PLmDPzzlEEW+boRQuc4E0uAa3tREGTtDJjM3iBF8sX4oQYg03eAoMrkntuKL36R7JuYswIxnzngqmYrT0FSbbConHPjV6JlUeFF8e/EODnqB8SX4Rg6Kruwc5eCTwpD9EaKRBLQrfsG5RJgUhNNygMoWi2U+RN5RzA0nCS1mD6CYsIA/u9FFiSHhFLPEHM7lQYnrdnHMQz+k9qUAtSNgFIKA6AQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39850400004)(451199015)(478600001)(966005)(2616005)(6486002)(186003)(6512007)(6506007)(53546011)(6666004)(8936002)(110136005)(66899015)(66556008)(41300700001)(66946007)(31696002)(66476007)(86362001)(8676002)(316002)(38100700002)(2906002)(5660300002)(83380400001)(31686004)(44832011)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGZHUVZOOXR0Umh2K0N0cVJGeE5YM3QrR3RFaWMyTUdJQjl0N3pPVnZ1ZEth?=
 =?utf-8?B?cWk3TUxxVlRteTZpaWVwK0NqOW1oS2hqc2FHT1hZUStyL3pmYndUL2ZFL3pI?=
 =?utf-8?B?N1c3YVgxd0IyVlhYVWw0Vmc4MjhLNzg5MytIR0U5NG5pbnlaSjVPMHZNV3ls?=
 =?utf-8?B?U1UyVWo0MEx5bE0vSHhrZXg3Mzk4WW1vOFJVYjJLK1hXNGRKK2U3N3dBVDVw?=
 =?utf-8?B?bTJkcUpCeEhLcXE1alEwZWpabUdrMU9PMmU2djNBVEppOEFrNmdxSDRzY0hT?=
 =?utf-8?B?Z0VzazJEcVJUUFhFaXk2alhyUlQ2d3IySkdFQWNobk83WVA1d2RiYkZiMWJm?=
 =?utf-8?B?ME93Vmd0U1YzRm9CVzFKZG0rU1Z4QWxvbCs5RGU0S3l2emtEZkFISVJ2eGp0?=
 =?utf-8?B?VVBpWDFHWFVsNm1aWnczbjR6SUthVFJvYTZVUzZNbkYwYk9obVRNVkhtQzBX?=
 =?utf-8?B?V1lrUE1oL1dPYm5nYkVibERjNlpoc3NZa2NPZFQwTkd0Rmx0NlVHU2RrRWJO?=
 =?utf-8?B?UE8wcFREa3d5djlkbXZxaGlaNjZqTEpzaCtmTHNXbDVSRFhUWGQ2V2VaYTFl?=
 =?utf-8?B?REJjYzd0R0dEdE8vRHMrVXQzZzdiSHRRUmNUTWxyUjlQNmp0b0hMV3BkNjJF?=
 =?utf-8?B?R1JJUS9zdy9waWlXY3pIOFNpYTFRbHdqNldZZUpQUnlKdkFRbmh2b2hEelor?=
 =?utf-8?B?MGRXM3plMjNxYVlmZStTc09DUm5raUE4K0NORll0QjV6RjFROXVrQnE5Zmov?=
 =?utf-8?B?U0ZENGNqSHdaTFh1aUZsLzhvZE9hTlEzYmp4U2JUN3VlSlMrRCsxQmFhTmRU?=
 =?utf-8?B?aDJwdkdIZW8xbEtvQnZGMVpRbkQzQnZkWHZwNEl4aWI0WVQ3NUJ0WUt4c2xo?=
 =?utf-8?B?ZzNDN2xtd0ZObUt1SkNnWnM4ZFRlSlJURHBGS1ZWRlRQNWtHNzNLZ1Qva0wr?=
 =?utf-8?B?aTE2MGVNbVVvdkZHU2dOUVVOTzllYjBLaHAwMG5JT0s0TGN0VklzTW5LTjNl?=
 =?utf-8?B?ZTVZT09WUjZEREhhMy9rd0pJcVA3bVYzQzBPWURzUWwxNWU3ZkMzUjZOQW9i?=
 =?utf-8?B?cjY5RE9SRGE1M2d0OGhleTl3aytPM05RK0RBS3J1MURzOENBbDI1eEQ4TXhi?=
 =?utf-8?B?Vk1kQjFwb2pDbkZDaDlQeWFWb2hLaG10Y3JwZTBxVndlQzc0czU1bFVYSmQ2?=
 =?utf-8?B?aXBMcWlUYUV5bGVRYTZoaWlja28rZk1RRURrVlhJd1NFZGhpbGYyQW9WY0hy?=
 =?utf-8?B?aHRwdWVnd3dvMWpzN0pQQzJETUpTZlpDMVBCanphcmtrWmI0NGlRb0RJTkIw?=
 =?utf-8?B?U2hoMUZ3N1RsVDRJN3ovYVJNNzFCcy9ITElWTWlSZGEyY05FNEdWRERNQzBX?=
 =?utf-8?B?akp3UmcrUlN2Y2FZQUJvdUs5TC9LMGdQTWNERDJqbytFNURzR3lseDcwVU1E?=
 =?utf-8?B?NVZ1TGZVWHJPMVJiaURmVVJ2Y3JWL2E1NDZKWm5GN3JhQW1EZVRVRUJOZWVh?=
 =?utf-8?B?Z21zL3NkMEhLWjMrU0dHUmRHV2lLSWZSSzBVQzZrZ1NHVkVQWXBIdXNhUk1S?=
 =?utf-8?B?dzcyK2JzUFN6eEJ6OGdVcVI0Yk52ZGlacWVjbEpnbC9nZXpvcHlMT2VtM1F4?=
 =?utf-8?B?M3NQSVZZOGhvYUliUllLdUNxcllscHFIVzZkbDdJUVBkbDNmQlMxVVp4eDlZ?=
 =?utf-8?B?T2o4SmpBbVhmZytEVmZJL0lYdmkvNEppemJod0NGZzdPZ2pjRldFWk9MeWRW?=
 =?utf-8?B?cTV4YWVVdHdvYjIvdkU3TDcxZFcvWTNVYWZMdEVZK2hJY3NjQmlVYW1aeVND?=
 =?utf-8?B?NGtoUFl4QUFvNUdYYTQxU3orQW51N01JbHFWOTdOQjhidWhTRU1rNUJGeTNl?=
 =?utf-8?B?ekVzQjJ3NHJZbFN4RUlFQmNGNG5Qa2RhRVA2WnEzWTQvMGxsZExpemwyMWJD?=
 =?utf-8?B?K0lsN3JFeGdKR1Qwa1lxb0ljWWpyU2wzellManZjcnBHK3ZVNWRLcTN1NllL?=
 =?utf-8?B?M2lQQkc4TDY0eW4vZ1I1Zzg3bXlOSlVuUU8rdlUyMVlva3hsMGFWSnA0Y2FT?=
 =?utf-8?B?ZFg4U09ydGh1cDA5SEUxMGgvcFNWQTdlRjl4ZFZzQUs2OFYxV1pZWEpJWWVq?=
 =?utf-8?B?Qm0zNXF1Z2taRURVb1d1MlpQYzZNME1QSVZNUWVnUlB4elpLeGVDUjhwRVlV?=
 =?utf-8?B?dEVXcDNWY1ptUFoyVGxUcFRwN09YbllzZWpINDFDdVU0VnNBMGRQNVhGMWla?=
 =?utf-8?B?TUpKSHl5b3JGSDR5M0pVbysyQTZ3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c812868f-2eaf-4411-e402-08dadc207d16
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 09:08:52.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk/uol+qufkoqylf9gP+bSpS24vTUvqFcyRlFiVvRPyv8NWL+5FxmJVG0l0d3sLjDhM22nkr8A1brNLkY+PQjmtjrCTB0OaBaU1gDEXt8LLToFbeD2Osu/yxVyZXqRFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 09:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174489

Hi Richard,

"Forwarding" this to Michael as a docs update requirement notice 
(yocto-docs and bitbake).

Cheers,
Quentin

On 12/11/22 17:12, Richard Purdie wrote:
> We're now used to using hashes as part of the task hashes and the sstate code
> relies on this. The older OEBasic hash approach therefore wouldn't work and
> can be removed.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/lib/oe/sstatesig.py | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index bf48aed7e11..f0224454c93 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -101,15 +101,6 @@ def sstate_lockedsigs(d):
>               sigs[pn][task] = [h, siggen_lockedsigs_var]
>       return sigs
>   
> -class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
> -    name = "OEBasic"
> -    def init_rundepcheck(self, data):
> -        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
> -        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
> -        pass
> -    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches = None):
> -        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
> -
>   class SignatureGeneratorOEBasicHashMixIn(object):
>       supports_multiconfig_datacaches = True
>   
> @@ -326,7 +317,6 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
>               bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
>   
>   # Insert these classes into siggen's namespace so it can see and select them
> -bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
>   bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
>   bb.siggen.SignatureGeneratorOEEquivHash = SignatureGeneratorOEEquivHash
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174475): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/174475__;!!OOPJP91ZZw!hzEFgmvDjswO3ys-VJ8xiRgn-iv4AXZnbHNnpzHngPvyJOsVMXf0xNYfP9hY5q4fnRGYI0m8YXN1uoqbcm5iBoicY5p5PRxrrLlnyWDkuxF5kIap$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/95602001/6293953__;!!OOPJP91ZZw!hzEFgmvDjswO3ys-VJ8xiRgn-iv4AXZnbHNnpzHngPvyJOsVMXf0xNYfP9hY5q4fnRGYI0m8YXN1uoqbcm5iBoicY5p5PRxrrLlnyWDku1kJZxVj$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!OOPJP91ZZw!hzEFgmvDjswO3ys-VJ8xiRgn-iv4AXZnbHNnpzHngPvyJOsVMXf0xNYfP9hY5q4fnRGYI0m8YXN1uoqbcm5iBoicY5p5PRxrrLlnyWDku1FpazUE$  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

