Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F06C02187
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:45:56 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.56])
 by mx.groups.io with SMTP id smtpd.web11.17124.1736775953469853327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WYtrgow9;
 spf=pass (domain: cherry.de, ip: 40.107.241.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4f/Mpo3WS9LcOneqQhedV/YLVQaeBZ2qWe7Ff6t/lKP/r05Q8icG0iDKJerw+oGq7BquGHt8n3gD/vD4OR5I5Q5Ekw8vuD9vESwd6LotRoiRmTpK2c/ZwEV2NQClpgikHRJ+l76LlQ3av/PDCDsCLmzfMxebhZ9At6d6186zpYWAIYsowLsaOWFIxI1UtNW+Ikrpu+DP3uSZHMmII3Wj6GlcAw/vSGh2JnFuTev1f4AiXzOKiwntUEbcm8Us5HTOZ3aCIAN6apvHFbEu43LXIgkY1UamNGZn9qZLv0+JWbuUUXDYlPUJ7TGJpu/Xq3f/i/KiMJbtoK+aJnGZUpRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1tB5c8tPXR5lxWFZSWLFJJp6vbCKRdSq+3qN2shzMY=;
 b=aT7t0umjsmhw6c5qsKjv1VzxFuyPaNAElX4zypc6+ZcYnGk03mA+88B+D7Yf6darrwI0KlPRMMgOjO1CnHJBT5XVzX3LhV01/C1F/o8XOFL9EpELhtAppcpgdJ5ibswEp0dIcu7WWjQvVYHhCRBrsrnZhR/P27neK161hlbKyxtBD9Zrf4mMTvqbABxXzzFj3gxg3djEWKy3J/4rSxw7226Ws2wcqoqUBeDkpC2Bcx8dS+IX+2NqDp0Np5ZQGf/YZuebYtciA3+BVYg5moN3h5//PIRi+J95m5YErdO9+0kKfokKyR9BZun05d46yF5fVX16aEmU33TV5YPkSTdJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1tB5c8tPXR5lxWFZSWLFJJp6vbCKRdSq+3qN2shzMY=;
 b=WYtrgow9KluINbgMI7ZUHu2Mg0TpfgCpIi5gvEP6/0fEzdlg4je9aGZnxzIBCnF5tSzqNvWyE8wW8y/gPTc7pRW42p8PMt2fRLvEWyGotiCzFB/p3eS/CbqUZ8hDBUKYNjL4FO3h4xPL6i7vpDIxszeRj6djgsltmFMzEJq6chU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 13:45:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 13:45:47 +0000
Message-ID: <83b689cd-fca0-4ced-a644-68c9437de9ba@cherry.de>
Date: Mon, 13 Jan 2025 14:45:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] native: Improve ${PN}-XXX package name
 handling
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
 <20250106160948.803305-4-richard.purdie@linuxfoundation.org>
Content-Language: en-US
Cc: docs <docs@lists.yoctoproject.org>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250106160948.803305-4-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: a66e0d1a-f231-4827-4437-08dd33d895c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2hTeUwyMXRsVHcvL2x5dG1TU0pUMlJFQkFsQ2o5RVR6ZE42Nm1PUXptZUxr?=
 =?utf-8?B?dzNvMGR2RnJpQjBhZy9YeURZQkxBazg1V0hCdVNQOTQ3aGRuLzEzNTA2OEor?=
 =?utf-8?B?UnlPSXhKVmw2eG9NQmtJbGJtYlRQMlMrb3FlbWt2NFZ4UHlPdnhpSmNSaFpq?=
 =?utf-8?B?WngzMW1sVUlNTGttaml3cWJNRkdPVUtvSm9DS09mSnFtRklZZXBoenorTTBK?=
 =?utf-8?B?V0ZZR0RBbG5tY29idE14ZE9OaGZaT0xpWDNKSXd2TzIyR0w1Z3d6WC9wckhR?=
 =?utf-8?B?dnNmUEZmNGI4ckVVVXNCUngyekYxVW5CVjliSFVJdWdFYWZuTDltVGNOandp?=
 =?utf-8?B?ZGs1aVpCNHdUUWhPcC9jSzNNemJlMHBPZnBlRmh2Nlp1NmZWVngvUFBSb0ps?=
 =?utf-8?B?eXk2eHQ0TGpYUTZVbWZ0TVZ0OHJZeUFjcm1vdkM1WmdzN2pCK2pvUU9qZjR6?=
 =?utf-8?B?S2VrSTkrRkxpc0hJRE00U1RQTVdaMGRMbGp3NW9zaTkxUFNQZktKSEdxY1RT?=
 =?utf-8?B?MjAyK2pkaFlaSTZlMmZpb0kwZGp0d1dYWHc3K3AyVk0wMlhXY2dEUVA0eEF2?=
 =?utf-8?B?a1dWQmU5bldmNzdTN2VBNExOYkR0K0RGNVgyYkZTUG5MbkRFdnR6ejlwNzd6?=
 =?utf-8?B?THo3SXR0NXlNa0htTTlidTViTzRrY3RXOWRLZCtsakN3OHZyVGtVSFdxOVp3?=
 =?utf-8?B?YTlod0wwelpMSSt4SXZCZ3FZVHkwSGtoVDNRRlBGQlEydElONFBFdGlBZ3c1?=
 =?utf-8?B?c3JYVGFJTE12ZFNWNXRLN3NzVEdvWkVTUGJNdllqOExBelpMMHpVejVGZjV0?=
 =?utf-8?B?QTdmMmx4YTVaMTBoMERBV0FkL2tTWnhBbENxMUlDeUw3U1VjQjRrMEhXT3Ar?=
 =?utf-8?B?THJXMlVrWUphTWZNTWdlTEZlY21pTVNpc0hWWktYSjZCb0k0YlkrN0M2cDZk?=
 =?utf-8?B?UHREWTNRaC9xZmpnTzFjZWZmOFZ1WVlYamEvbkpINWNRbWszd3JyYUdNZERi?=
 =?utf-8?B?TEt0UGRXNjl3SmNnbVRpaUhVeDg4TmVlRmo4a2x2ZnZYNlFTSWl0NzVsZVNP?=
 =?utf-8?B?VEZETlFDMFFxeFFLYUk0L0o0eEFwakUwblU0a2h0QVEvemVWbklCdk0zWTVv?=
 =?utf-8?B?dzFubERCVm4zSXlUeTZ0RUZleFVESkNFWmdaYUhScUpQMFF1eFZMZ2RSbXQr?=
 =?utf-8?B?ZmxPNUlaSEwyeDkvdXdtUWZSaVdXTnBERVJxdmRZMThPdDFtaFhrNXdEcnA2?=
 =?utf-8?B?RHpVUElqZjdMcjJqVG82TE01Nzh5SWszK3JxMWFZdFcva3VhUVYyQkNheWc5?=
 =?utf-8?B?bWJYQ0hWYXNpZUl2eXBJdnpabmg2dVM0TlVnT2VwbWpwSG9hdkpMMkZBSzBR?=
 =?utf-8?B?NmlWdGJPbG5qcWpFOGxLbGVVS0Rrc3JKbURoSjlQVXd3bHBrQTgwMVV0MC9E?=
 =?utf-8?B?eUFPQVJLMFRPNUNuaXdzZjRkb09DSzUvc2ZlWEEzSGNSdHd6VDNlODZHK3Nj?=
 =?utf-8?B?U0NjR2Jjc0FxUmUrYnpvbjVEN0xETERYUHFqUDhiVHhBa0dUZFJJV2Mzb1Rz?=
 =?utf-8?B?YmMydUpkY1FuTFlaalhQSU1CeFc4YlZjS1ErRi9JTC9oN3VEWjVQT1dENDQ4?=
 =?utf-8?B?T0l3eWVkK2dKZ3dReDlwOTE2WkpFQ3U4dmY2akdJY29CYUYwbjVwb2haQmJO?=
 =?utf-8?B?aEZvR2dxL1UwN21WQUFFVWdJWGQ0TXlndlBVUUpTM0pWTVBIUDczR2JFVFMz?=
 =?utf-8?B?ZTc0VUhmdVhnRDNWNGRQZUhKUVRPaDMydW96VjRQdVhSejJwb0xzTzRGbVBq?=
 =?utf-8?B?U1g3SWtBMHJCMFNHaFROZjZ6SWZLODE0K2R4UXNIZzJtNWxLbHo0NUs3VjU5?=
 =?utf-8?Q?kLBekMcgP59At?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWkvZGRJU3BQMlAxU1MyREtiTTc3OVdMd3RtZG5hcm1FaStibkRHQ1V6UW02?=
 =?utf-8?B?VVpTUDdaL0t2M1dRUVpuVWF0Z2hhQUs0VGdkTE1XdDJJekpteWFkY3FRT0lS?=
 =?utf-8?B?UWxWUWx1NnRyd3VvYkJvL3Y3TENvMnpEZk9vRVovQ0Ewdm5FREhKMmxjUmpJ?=
 =?utf-8?B?UFZLdEtaNTlzYUVFZHQzUVg5dXhHWnVBMkx0U1N1dWtkV0Jaems2L1ZheENt?=
 =?utf-8?B?Y05scCtVeDZ3SUpOVHFZWWowUEJxazQ3UkloeHo2VFZzSTdNUTZreUhZTVdR?=
 =?utf-8?B?UnFRcFNGa05EdEF5Vmp3S3VXL2oreEVxbmV5MmNINUFwbVdCRml0QkdQRVgv?=
 =?utf-8?B?YytVUEJtMkNCODBqTzVDZ2ZvU0g4QUhSSW8yQWlVZkZPME5SMkxKazhuTkth?=
 =?utf-8?B?aERnVEpNaUtSMkd0bDZYKzN0WU5pTStYQXh2eXE2anRPSW5kR0NiOFBoYXZB?=
 =?utf-8?B?L0hybGtwM2lITlBjSWwvdzVWMnhpWGQ1UmZZVGtXN1BmK0FJeWFpbGFPdHk0?=
 =?utf-8?B?YkZ0bmZXSEZNb3IvTnhKMzNPRDlQM3dzMFNxR2s0Sm00ZG5JRzVmLzYvU1dn?=
 =?utf-8?B?UmF2cFRONG9ZTXY0Z0lWaXQyQ1ZyczluWm9odm0xUmpPUnprYmNSTGQ1dG0w?=
 =?utf-8?B?YitkdTlBVUFpYTEzL2luRTIrWTRMY3Nxdmd4OUxJY1pzbEpOUVRNd005OWVr?=
 =?utf-8?B?TU5RbFFFUnpVYTgwTGxvV3ZvdlVjcHhoTXAzMWVob0JvN05wUHk0aDlJeHFm?=
 =?utf-8?B?UUFrMGc0VXhpd1l5cGhvZkxlWGxJT2djWEhlckJET2pYTVplT0JDRFp6RHRt?=
 =?utf-8?B?bEZQNWpSUjdvVGw0RTJ0RW9kZTFscEJlYXhZcmJSVktTWjVoTjh0YlBxZkl0?=
 =?utf-8?B?a1dDUVlTazljUVhQSXEwVGlCV1BRY0daY3hHUWV4T3F3NEVjZHFBSXY2Titk?=
 =?utf-8?B?b2R0MkhEYTJuRjY5U2ZqeS8rUWRpMjN4VVFNS0UrOCtObldid013em1CSkha?=
 =?utf-8?B?ZWJFOSs4TTlHeVNQcmUxTFFUbFprb05PeUNPZEh0OHZqWmNmTVUzeHgvNDZQ?=
 =?utf-8?B?R2dxVXdRVUF1TG9nanI0Y2hsbG5BaGRmbnhDOTg5SFE0eW9UWHlQR2ZRVndZ?=
 =?utf-8?B?ekFyMTBDMERiQWg4dXYwTlpua09tdzZ0NDdUWUpocXZDQlQrNWhRc3JlejdP?=
 =?utf-8?B?eTM3NTJkS0xhUG5qb0grSlZBekM3UEYwb1BhdWhMQ1JoS21TS2JKdEUwNXlw?=
 =?utf-8?B?S2ZybmlneExFYmNDeC9DNTFxY1NPOVRHQTMvMThyM1l3Wmx5bnVwZytzR1Yr?=
 =?utf-8?B?MnRnOE5Qd0svOHBZM2txZjhqOU1ucDg3SmtuUHQ1NSt3YUhjcFliT0JRTXNI?=
 =?utf-8?B?dkkvMGtCc3RuUTUzVnFYbVE2UjlzS0VSN3c0b3I0bENCMTNrQ3pwR01OelZ2?=
 =?utf-8?B?blN1c2hjYTNhQmEyM2x3RUwzSUM2MU9kVWVBL2dTb25vMFZsMnUwelNXelIy?=
 =?utf-8?B?RmxHc3l5NHFycC9wRE1VV1hUWHNxTmNla3lFZnZDSnJ6aGg1RDJ0UHBhRVEv?=
 =?utf-8?B?VlduYTF0VU9WakRidHdwSVRKMU1WOU5UV3BCaTlTWENHWTdDdlJjOHIyMXlz?=
 =?utf-8?B?eW05ZjU1YWsxZmhHSG1jK2MwK3pCK0hlR1BJVzBucmVRbEUrUXdMNzNRd2d1?=
 =?utf-8?B?eXk2cW0zVEw0cGpaUjZrSG83aUdXbWdoTjNNRnBxOVVwak1yZmxDQ29WZzlT?=
 =?utf-8?B?U2gxSTliZ0hnQ0NZRStadmRWUGl3ZDM5YzNJVWQybzAzRUR1MXIzaG9CdFdZ?=
 =?utf-8?B?Wm1JVG1MVUNxSnZUNGQrcDRNUTB5M2R3Y1o5WnlHWHF2c1hHU1JaMjZCa3BJ?=
 =?utf-8?B?VGtzL1pYdjg5eEQ2bXVaQkRyVTh3WmcrZ2M0ck9EdnZxSHNXM1RnZEgzSmlC?=
 =?utf-8?B?dVpJSCswK3UyNEFYWkV6WnM0OXRLaFExZVVHWTRXSVhtQ1hsZWhDbzZiV2JG?=
 =?utf-8?B?aFFnd3EyNmVXNWVaNURHRm9rWjZtcHVWRm1xSTUzRkxUSUgxYkFrQWJmbko0?=
 =?utf-8?B?blFmZXFNSmtkS2FiaEZ1bHU2VmtBSkNKdUpzWkM5SUlQbTJHZVg1ZjQ5cXBv?=
 =?utf-8?B?cS9XeHpWakNKeVQxOXZ0emQ3bG5ZdDhrTXVPVTZ4L2VrTjN1Q0hXcjREa20x?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a66e0d1a-f231-4827-4437-08dd33d895c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 13:45:47.6316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwqUuK3mqhACcS1vvx0qdUqljW4f0wI+j4czlzTU5zLTbLybjrKlvN0wkKgH3y7wgM9FSDXaG7pHa9O9VPiipQjA9MEaKHY2G/NBez/vGHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 13:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209723

Cc docs

On 1/6/25 5:09 PM, Richard Purdie via lists.openembedded.org wrote:
> If a recipe has something like:
> 
> RPROVIDES:${PN}-xxx = "yyy"
> 
> then the current code will turn this into:
> 
> RPROVIDES:${BPN}-native-xxx = "yyy-native"
> 
> which can lead to errors. Add in some handling for this special case in the class
> extension code.
> 
> The corresponding entry in PACAGES is correctly remapped, the variables aren't
> remapped to match though.
> 
> Note that merging this does trigger new dependencies to be exposed, some of which
> can't be met or are incorrect. These need to be fixed on a case by case basis.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes-recipe/native.bbclass | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
> index d9651a7f22d..0fad42a5a45 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -158,7 +158,12 @@ python native_virtclass_handler () {
>                   newdeps.append(dep.replace(pn, bpn) + "-native")
>               else:
>                   newdeps.append(dep)
> -        d.setVar(varname, " ".join(newdeps))
> +        output_varname = varname
> +        # Handle ${PN}-xxx -> ${BPN}-xxx-native
> +        if suffix != "${PN}" and "${PN}" in suffix:
> +            output_varname = varname.replace("${PN}", "${BPN}") + "-native"
> +            d.renameVar(varname, output_varname)
> +        d.setVar(output_varname, " ".join(newdeps))
>   

This seems like a bug we should document in known issues in old release 
notes?

I assume we may patch currently supported releases so stable dot 
releases may receive the patch, but outdated releases would be unpatched 
forever.

I guess we can say that the fix is to have each of RDEPENDS, 
RRECOMMENDS, RSUGGESTS, RPROVIDES, RREPLACES, PACKAGES overrides and 
PACKAGES_DYNAMIC to have ${BPN}-xxx+${BPN}-xxx-native instead of just 
${PN}-xxx? Is that an appropriate suggestion?

I'm bringing this up because we have a Known issues section in the 
migration guides which is pretty much empty right now. I don't know what 
we should actually put in there but this seems like a candidate? What do 
you think? Antonin?

Cheers,
Quentin

