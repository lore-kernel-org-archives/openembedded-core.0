Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DFCC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 13:17:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.15184.1668691039933455959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 05:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=h6raQigy;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.84, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwAEBnxFLNwHPJKmSRAj7B1oxtNrbpekNLFhgPsDWW/PZUmUtfapkXvoWWu+zdAwu7NV8M2GW6c17UAkatTN9nTG2lJ6VRQuWbw3WO2e5hE8XeVzfPdTRVsy6TcgFVGO86t+hIgcfcr3l+AFoeB1qZPzAEgVSgPLk8pO5hQeGdfAS6rUTavRVuFy545ZOcBcIaTwQZq8A6xpz19elTyJL4l7TWmdnKE49mGnz5WROd4zpDwjfhHZXUn7wHL/vgupt+8P7KZp1BtuqDRghjVmxrxWyxZRHper5E3a4j+rkq3cyRwjLD5tmg7Scg1m4kmef5U+tVo5w58o8VS5u1rtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPoo6jH+R08iMg4ryyMn+qgBF2yVMWH4vQnwORDkVpI=;
 b=L4wbwUcnPFSiJXzfKMD0te2d+oY4CLnxUoXdxjN796o5+z08Fk3W9/oWNnx6OWZM9Q5yDl9TxA6PaZMTsWm2Cugu2NO/9RlcZYSD8SXLi/z0RpV8Dv7h0a86hbApcnT8qPkYuHgf+bJTbD4gEujxsprxcwjtjrrvPGmybGpLsTwAvX3eicLyAwlghbBVnqcoCbEWTp0GeBarNY5S3Jxcs6wtMgAnyU+JmV8j+vVp9SZGfpV2sdIdmHkt0zPQlH4CB4QkzuUCquIPkwzIs/vswHh/hfxH+dxQN13tG2DijQyCOfZ7tfkjhTEkto/hKvuqRlo9ZamHIxk/6Z5TPAxgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPoo6jH+R08iMg4ryyMn+qgBF2yVMWH4vQnwORDkVpI=;
 b=h6raQigyrpKWLpuPfCLFcvEi4HnPhspJ7jDp3Pp5GBuARMV2JF8BvTJsHuxB4Zy0br8WwOsQNNKRCBCihnNLT3NDfrRxbna5/8Z7p4ZaIrAN5jglP++Qv1PTGWlYmcW+sRzRyEKN6e3oO4QMVt7T5NE+NYaaItcafu96XvD9glOBTrJhPDjSfxBiVuk/Gk6dj4nBtbSwasuVdfB/4RtWFAlreFA8fkJkoBKqvn4KCp+jdjD6Tt2Ba1a/Dtn+1SN/l55dO3DJvSxRhmbcMf5CFgYGaWbOCwsflEXOhRk6xVinvqQgmPuq7aSCrw9FbR4ezPT22016v0uAcoqLUnezfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 13:17:14 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 13:17:14 +0000
Message-ID: <3dd2aa3d-6510-90e4-d8a8-a5ec12e9c16c@theobroma-systems.com>
Date: Thu, 17 Nov 2022 14:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH 2/2] runqemu: limit slirp host port forwarding
 to localhost 127.0.0.1
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 openembedded-core@lists.openembedded.org
References: <20221114155038.3654499-1-mikko.rapeli@linaro.org>
 <20221114155038.3654499-2-mikko.rapeli@linaro.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221114155038.3654499-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 72eb26d8-24e2-4f61-3b77-08dac89e0b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mVKJb4+B1CfTgNXVHBa+IpxU25+HroycyULpV7qGL9sszzgVGIqklU+6raTBOUZ1QgMJ8NQnmbE0kyZO/wwhKXxgwu6n6TCpGesqmwhK5BN4Fw8ShpYzAAuV/i4377D8fQN7yHIMNmjDRQKTQ1zgoXxR+hiAo33jO3y68A3s4uj2/vYthCn0HptN438cTyhWND1mT7thv+9afgSeiKq3YxNBdpDYTakb7uoXAUDWEvhMlt2Vc0yZ4UP/we7yD6gx8GlJi44qZlgrwFGkU2DElka7LIxStkUUroanYcJPGNyS6vRNtFYoZpHoMzRlzvESNcW4L4/FPcWXmetRqINmBIMba4UHymIGwgeMO3xam6vUe2GUTSVe8d0Kswe5zNmMPDp1K67oSxJzK5m6dx3ZLjgL5dF59CnlU/ecaBTjfniVUT+Y+2yemLuqxjAEm+tN9EKC+pRfYELP5ZOgLfSBra1yOSIlCFzYBhpy+hA1mswsSrnPEWckZbyaZDIg/ZVUip0UGiWQ0mrVxXDSG8sUfWdXtpqQT69+6ObxMPbGMzraPZ9AXtf6jCGod0HqTtX9Q+TBQPFRavp+ArFD+9h5fdGN6MUeYEbAmHuRKYy++TyBb7sI6/ml6FAHuI0u1xdQd3Rwq3KhbBQdsoSNFtVN2NXXLvOSfu7pQrUYGsDjXARtCY9Q3zG0XYrwhfsUJEGYw9v0e6moW+mOLYzv0JYxrTuMqUhdKzBIrfmHa5ToGBgPBYMeH1ecw416jyKf8VvO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(346002)(39850400004)(396003)(451199015)(478600001)(31686004)(6486002)(966005)(41300700001)(2616005)(66476007)(66946007)(36756003)(8676002)(8936002)(66556008)(26005)(6512007)(44832011)(5660300002)(186003)(53546011)(6506007)(316002)(83380400001)(2906002)(31696002)(86362001)(66574015)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFkxTlB5emRpKzBDVDU3V2Q1NmkyT01yNVZ4ZllaNjdCT1NQekZCbHRvSm1E?=
 =?utf-8?B?ci9pK0YxVWNCNGdPSDc4clZuZGdVVEgydXVUMlBVdjc3Mkk1enNJMWFkVkg5?=
 =?utf-8?B?dDZZNDhiYVlyZkhNQ1ZTYnVnTnpHVDJET0REUmZSNTg4SkViU09OeE1vVnRK?=
 =?utf-8?B?bm01cGR6bldnWjUzSlEwdjdsRDhEYlRCTGpSQUdxc2lHYnBkUjIzMnNXTklp?=
 =?utf-8?B?Zjd1Rmxqb1o3RTN1bDdMVUdsa01RMDhDckgyUVlRczZxVWxpaktYUDVKby9L?=
 =?utf-8?B?YUQvY25HOEgwcDZXRUpsbXZQbndjQTYzS3lla3lyaDJKcll3VGR4VlZqUE5x?=
 =?utf-8?B?aEVmUGpldlNvKzVtTEVsRm1vRVA1R1hsc1JFT0ZSc25UMXN0QkF3bTJIQURm?=
 =?utf-8?B?T0pGb3dxVENGaDJNdzJVM0JsNjlLN0tZbVhxbkhPNDUrZ2NIR3llNFlNckh5?=
 =?utf-8?B?NVZKeHRpenhTVGFNdUJCTWJoSDdIVWlOTVZpOG5qNmc4TnY1KzlRdFhtYkpO?=
 =?utf-8?B?YnUxenk3RjVVRnIyZzZRUDFGYVNnSWN4WFB2dEhOcWFFSlIvcUhRNUpSUVZV?=
 =?utf-8?B?RjJ3TDFCb3g4OHFqblRGa2NJQVR1OWUvbURKMUpxS0R0bmpLUzJML0dyTjFV?=
 =?utf-8?B?WXpVTUhLU05oM2RMdCtYTkU2cnJxZHZTdk5TemZVbFNoWjFLaUNxRW5mQURl?=
 =?utf-8?B?MlliWVdSZ05IVWcyTDhvdzJLeFBjOTBaOHZ5NVk5c1VBSjdjanptY2lVdkZB?=
 =?utf-8?B?Nmp2MkJoTTVnZDBDbEl2bGU1SXp0SVFtUW1HWUtWNVNTQmZnRE5SU0U3a2hC?=
 =?utf-8?B?YzNXMXpkZkFFWXE5OHVhRDhsS1gzUlZ1U3F0Rk44bVpmdHRadE50aDhBc3ha?=
 =?utf-8?B?bC9EeENHQ3JKbVd0RzBseHltVWY3MmtJQXNVRWJGZHoxQTBLbXd2cjU3QmhS?=
 =?utf-8?B?TW02M053ZUhqYWxnWFphdXBkbm1qN1ZLbituNDM3U3ZsVzgwK0FVR3N5Z0ZE?=
 =?utf-8?B?RHphOVZmNkpKZmpZc3FEcmZ3dXNLL0lRd3YrbjFMbnI1cUVnUWJ3SWYwK2Zx?=
 =?utf-8?B?cXQvNC9tZEJ1d1NNVDlVNXhubk5ZZjhvZm1kOEsyZDNOdmVERm1ZV0EzNW82?=
 =?utf-8?B?RU94MlZxL0VlSERDZ1lRbW03VXFpZklTNTI3TXV6ZUZlaldNczJWVVhFKzFm?=
 =?utf-8?B?NGcyTmpONkI5MVhqQTJTVjNXMTU1WS9icUIrSWpPSnIvOC9DdHR0cXBxdHcr?=
 =?utf-8?B?M1NRbEtqbGVxbDBzU29zNWY5WWVGUjVVNjBXYm53Uy9BUkk5U3pKenMrSFZ6?=
 =?utf-8?B?cjNHblJCYlJENTJ0YmJLYjg0NTJBOVRLREl3cGZUZFAydGVJbFNrc0NXS2lP?=
 =?utf-8?B?bk5WQjM3cHp6SzF6TXRZcWZxbUtHblpjeU15MmlhSDZGN1ZzWENoOFNpbjd0?=
 =?utf-8?B?SVUra0xWWER5UThmaEVobko4UUhrbTBwMXpNSWM2RTQ2QlN0MG5SeWg5UkxM?=
 =?utf-8?B?V25Ed2Y4UGtPMno1My9ZbGE4d2plcWtEMTZUVDJBZFFWdTNRaHA5eGJUVHNs?=
 =?utf-8?B?Kzh5Z2FyTEg2UEc0cXlwcnZzaTdMTWpjN2hzK3V2SHVBSUJzSk9yZHpLQmM4?=
 =?utf-8?B?MXFtRFJJVG03TFZGTmJKL2VDVWFmSG5tMzZDSkJueGUraHZCWWl2UmJZNWE0?=
 =?utf-8?B?QXliM2RmaUJqUHJKT0hkWEN6UHpsQVBWRGE0KzhlY3dRS2RVbjRmY2dObnRP?=
 =?utf-8?B?a0FlVUZRMzJsMEd5OWxuYVRXNExXTEtFZ0krcTZyOTNpMDBRa1FUSm15eEZ3?=
 =?utf-8?B?ZlNSS254MDlxL05aRnkzRDJCRURoR1lYY1dMVWlKamFQSGJxYUw1TkphaElB?=
 =?utf-8?B?N3ludUJZS1lKbm51Yy9NcjhOcGIxcDdrbG9uV2FRVFgyUUh5Y3g2allIRk1C?=
 =?utf-8?B?azgrNkh1MUY1dmxQRkI1TlpDVlRyeTdqelh1L2plcWlXdjk0V29HZVdtWmhY?=
 =?utf-8?B?dE5OU2FMNzV3R0F1d0tmQTZPMVlkUXJad2l6Mzk5bjN4NFJIcGcyY0FqbVh4?=
 =?utf-8?B?VjhWZERCeWdodkMzRGlLOXBOL04yVHpCWlZkYlBDZGZwVXl3b3JFWG9zWjVZ?=
 =?utf-8?B?YjJJOG1GVUxNdmEvb2NoS2dxYnEzdENiY2hOcVpycGFrdWNvR1BxcVRqMUts?=
 =?utf-8?Q?FnUKjWqZbIhACGLW5lwVFv0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72eb26d8-24e2-4f61-3b77-08dac89e0b5a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:17:14.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i5MK6XjuQ21N/QNVjBg6sCMHa6crCQ0DBK5l7t0Im2C27UJwkvrNXZRz/rR29ktdd03wh7ftsJGt74B+aZ/2bSbBXmSqGr1W8tyd9KjXFAGcmaYZdf35GgY66LDvPD+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 13:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173422

Hi Mikko,

On 11/14/22 16:50, Mikko Rapeli wrote:
> With default slirp port forwarding config qemu listens on TCP ports
> 2222 and 2323 on all IP addresses available on the build host. Most
> use cases with runqemu only need it for localhost and it is not
> safe to run qemu images with root login without password enabled
> and listening on all available, possibly Internet reachable network
> interfaces. Limit qemu port forwarding to localhost 127.0.0.1 IP
> address. Now qemu machine SSH and telnet ports are only
> reachable from the build host machine, not full Internet.
> 
> If qemu machine needs to be reachable from network, then it can
> be enabled via local.conf or machine config variable QB_SLIRP_OPT:
> 
> QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::2222-:22"
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   scripts/runqemu | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index a6ea578564..7bd9465593 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1071,7 +1071,7 @@ class BaseConfig(object):
>           logger.info("Network configuration:%s", netconf)
>           self.kernel_cmdline_script += netconf
>           # Port mapping
> -        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> +        hostfwd = ",hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23"

With the additional knowledge we gathered in the last patches, I believe 
it would be a good thing to say a few words/update the documentation.

See 
https://lore.kernel.org/yocto-docs/fedb4cc0-44d6-d7d8-bc26-c8de5bee06ca@theobroma-systems.com/T/#t 
for a patch I believe might make it to master soon? I think we should 
say what the default value entails (even if this patch isnt' taken) and 
maybe point/refer to the QEMU documentation for the meaning of options 
in QB_SLIRP_OPT. I believe some/all of options listed 
https://www.qemu.org/docs/master/system/invocation.html are possible?

What do you think?

Cheers,
Quentin

