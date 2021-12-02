Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FD4C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 17:31:06 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.11])
 by mx.groups.io with SMTP id smtpd.web12.107.1638466264553933436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=aYVrXze7;
 spf=pass (domain: outlook.com, ip: 40.92.67.11,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB+y7e7PB8Bm/XA3pxsYqj1FrYzBTodxwiHp9d9OuOk3tckBbrdaZkQ4uQBu26d8gHZATKl3EgP6amw2qHh12O7MHM+0Dm8yoR6APi26zgGe1gqP50mDEujLLnUWDfW1hSifpFZ260lVeQa/5Ro+Ay8ZvYsm8SnSH+DTmeOAtNUSPDh2kE/V20brPpAbbu38pn2pFAMbTS/xe6HGenWMrbZTufYNXMY/9APk24zHEhpFhI+JogfMv+KdIob8AjeKI3QwtRho7yrLb7SPcWVU8kPxMzkzbf7wcns++RACUB/y+aqQCah010y1CXadOzPTtN4cuP2/TlgOqAgwQDKTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kX54RlxWFmK6AUMLjZREeGLUM9Tvn+Xi+HhhXKuVC0c=;
 b=HylsawRs7l04/8jKzSgKhkPrGk5+/FCk7B/etFP3NDAMwD0t1dj07TVIhuii+8+xMjJjUvBuBqcobfjTJxGZLIrbPF9lFPNPz9LxuT7wJGxxe5ivlwWGK+haUDdaGvuzeUjecZl4Gq/WK+QK7OGct2yF6LDkxXkRVZCCUTMxxp2kEUBtrHZioXOlIS6uL+vrl3Vy96Qdkb8MU+udg57scSLhf7nnIdtD7Slsabqm1wXRua5u1imq1eHUC3BN6kur/g9oyih3UGA7ERXALFZ3cy+h/4+ufcGEHdmKsd8IfCEa1o7QDEvZ42hL40M7YbpYcF260mUZAvS7JW/ImH9o3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kX54RlxWFmK6AUMLjZREeGLUM9Tvn+Xi+HhhXKuVC0c=;
 b=aYVrXze7lYGl4/j1izNzx1C+xFMI0pi2xk8WpbJIZxUdTh72YtA6V1cI7E6hEaNlPxkDkz46DNglcZh38pGwaJoTPxTXqpRxGaHs0eEMvq0a5r6KRO2S5hUc7kB6INGhPC4Zk/ShvSVhsr+my1S8EohZp06g1iqqQzhy322xUU7908UxonD7erIYE+5LPhzx/v5R0ZnQY0d5uYtcg+0w3F9rNK403Z6LdxGeRnUypkNxXJ/WkKWPbLOaHyGxHnTQ+T5ZcaQPZbEy6vXASVo5FnFEuXgSUEno+6Qf0sbImTHZcXbsaAGFRSqD///VNuHu+XLuiH1oEMHGEzYzPN6SBw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5010.eurprd09.prod.outlook.com (2603:10a6:20b:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 17:31:01 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4755.017; Thu, 2 Dec 2021
 17:31:01 +0000
Subject: Re: [OE-core] [PATCH] distutils3: fix bindir mangling to stop
 breaking symlinks
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20211202171706.2259724-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642C0F1D2DF8CEB9F067F00A8699@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 2 Dec 2021 18:31:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211202171706.2259724-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [1nG8LP/5g0pl4JO9Wvo/n5G6XvA4AdoeozUyYYNr4EirVXLKAiYXsNG/y24xPvmu]
X-ClientProxiedBy: AM3PR07CA0082.eurprd07.prod.outlook.com
 (2603:10a6:207:6::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <a4113b11-fdb1-3aad-c008-dcac3e9f53ed@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM3PR07CA0082.eurprd07.prod.outlook.com (2603:10a6:207:6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 2 Dec 2021 17:31:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36b5f9d5-bad3-4cb7-52cf-08d9b5b982c1
X-MS-TrafficTypeDiagnostic: AM9PR09MB5010:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZgTBA6RZkIOuegWkUDL+cx1lbC6q3RBiTlVVfn3mFVY1Hdppvfxr4U7J0YQhGyRWLV8id0OgSoWs94UaM30jmR1RHhOm1mDTZ1z+jvW67esD3aSpQ01ngV6Vcq9y/XHUwoSjxQumJ3azAY4ErK5m6a/iCW3Bp/jxpFbTX0CIenOBF8wGhqn6hR3MV5F34Dr6PJyxunTvWxC3Rpu8RHXJcP31MhhL/O2zRTDzDs84M/wPXFatji0uAj3qsawv3RpBFlpjGfuB5OJX66clgwks2Vjv6Zg7YhLwoZ2e0kHKbIN6hKv/h7piZB8ADxQ3zC7+Ry55PKeRhAfX0TnBKd0y0Sjr2wz2czRXRynYF426VlENCTo2seesEH3tCkyJAhy25SG51srhnQ5DA1HIy6fzg9XjPDLhJEu0UEe1CYJ1eqmdfGDsarB2bAW1mSe7G8Sis3LPGicGg6GXNJ5ItOLP2j1I6Bkw+szhSRq9ew5oraM3mB4hClPiJXmzM/qPKJRAtyWDRLewG3R3tHG2NhLlFRxaXgXbxwvZNI1a4WV+1SsBT6gniyPNmPGY9jAbzq0yXSXGkglW5cJ2ZOrkchNFCcjiYYSTI/NmFswpLp06J3lvlCjd450b/yCa//BwqIC+alPR1XSohlVgA8wXnYMiPg0rtthaLgk2+gjMxe/r3v8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVhQT085VTU4eHhWYUJLdkY0RzZuUkNxS3loZ1J2UE1oRkZaWWtydk81S2lr?=
 =?utf-8?B?NDlIZFRTYkI1eDJtR2FNTk4yRjFzeDkzeWxhYVlQMkpNOC9raUozdDZBcGQ2?=
 =?utf-8?B?Wk53RURqTnhrdlJVSFdrempjNEZFOUgrRXZaQUVXV3ZiZDlOUStFMmxjVTc5?=
 =?utf-8?B?czFuN2t3TllTOUY3eU8rR2NTRkg3MTg1UlZqVEsxS29adDBzeldoVDU4a2dx?=
 =?utf-8?B?N29sVy82V1ZiK1VFWTJxcUgra1dsVEkvbFFhMEFyLzZsaHVHbHh4T0QydzY1?=
 =?utf-8?B?M2s3Q3pyVFVVT0N0Z3ZYbmR1WVd5OVFyREkrVktCaXZ0cC9RVjM4M1ZmMmxU?=
 =?utf-8?B?M0VaZjZ0RkFFQy9UdDh4bDR3Y3R5d0VJb1ZxVG54VE5HM2F4dm4vUWxXVytS?=
 =?utf-8?B?cUN1YzB2dTFvRmJ2U2hHWGovZ2d4M1llZXhvQ0dTQ3o0bDNDSUFTQzM3OElD?=
 =?utf-8?B?UUtWZjA3cW41bG1kWjZRTGpDeVRJV0V1V3hFK3JqcmRVZkZoV2hQT0FJa1Ev?=
 =?utf-8?B?dUx5S0ZtQ0NWcUhaSUtlSGtJVWU4d1RMQi9ubkd6OFR5dWg1Tnd6akkrOVhn?=
 =?utf-8?B?YVhsTmRaa2dsaFdKNWlIbnhjWXNxMi91UFpqNm5BamFNcU5vc3VrMStYbk9Y?=
 =?utf-8?B?RTNjT3g1UmI2Q1pxWStDTXNnWjRGWjRJdlFBaGljNlc4V0Z2RnV2bFFIby9o?=
 =?utf-8?B?VHFkR3JHV09hUEQ3cHVzOFpPclBsdWlNR3prQkRPR0wvY2ZRV3lUc1lEOGNS?=
 =?utf-8?B?aGp1NUpGUzBURERuSGRNanZLRVl1eklFS2JvcEdJWCtSeXdFazRGdzRaeEo0?=
 =?utf-8?B?N2FybFNoeWtaSm1Cd0k5Z09GcjVvTnllcVJtaDJsVTVLOTEwbko1U1NjM1c4?=
 =?utf-8?B?ZXpxWndlTXZWUkdtaWM1T3IwOGZESEJYS3dCZ3dCMUE0ZURzUlF4bXpVbVJi?=
 =?utf-8?B?bGVJUnNZTE0yVzVHZjZtVTJoS3I4V2pHSG9VWXBSdEczRTdpQzVzbXVDRTNR?=
 =?utf-8?B?aFFWaWNNemp0NUVMOW5uZCtrd1dUbnhWWk0vZnlHQmlPUzViQ1dmR3RYNWZE?=
 =?utf-8?B?SVJ0b2xveTgzWnVQL0duenh0OUpmQUlyTW96bUxDby8zQlM2TVdxamJzd3J5?=
 =?utf-8?B?WVNkQVFJVmpUVE05UFZCZ1Nyb0tKVURWQnUyOHNoUEhUR1Fka3VFZ2pVeStC?=
 =?utf-8?B?cmdOM0EzZ2xTMjdwU2tOcXdOSWZYbWh4K21lMmdlYXZoemZqdlpCTjhMcjFS?=
 =?utf-8?B?M2dCWHFRTUdPcE1YbkJuSXlhL0EzaHlMZU9KUWlhVGVyZDBYemxDTlZoalMz?=
 =?utf-8?B?VEh4WllKcmRuVWt0WnN0TlRGN2s0ZlVuOVBtQUgvVHdBMkFCTStsSDVURWFm?=
 =?utf-8?B?Zzc5cGIyMjl6WXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36b5f9d5-bad3-4cb7-52cf-08d9b5b982c1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 17:31:01.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 17:31:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159098



On 02.12.21 18:17, Ross Burton wrote:
> distutils3_do_install wants to sed out build directory references from
> all binaries in ${bindir} and ${sbindir}. It tries to avoid touching
> symlinks by doing 'test -f' on the files as it iterates, but test always
> dereferences symlinks so this will touch both real files and symlinks to
> real files.
> 
> The end result of this is that recipes which ship a script /usr/bin/foo
> and a symlink /usr/bin/bar -> foo, bar will be replaced with a real file
> which is a duplicate of foo, wasting disk space.
> 
> Replace the loop with a find loop which can look at the real file type,
> not the target type.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/distutils3.bbclass | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
> index be645d37bd..0973d304f4 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -43,11 +43,9 @@ distutils3_do_install() {
>           find ${D} -name "*.py" -exec grep -q ${D} {} \; \
>                                  -exec sed -i -e s:${D}::g {} \;
>   
> -        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> -            if [ -f "$i" ]; then
> -                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
> -                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> -            fi
> +        for bin in $(find ${D}${bindir} ${D}${sbindir} -type f -maxdepth 1); do
> +            sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $bin
> +            sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $bin

Does the same also apply to setuptools as in Tim's distutils deprecation 
series?
If so it should definitely we be merged there

>           done
>   
>           rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159096): https://lists.openembedded.org/g/openembedded-core/message/159096
> Mute This Topic: https://lists.openembedded.org/mt/87457521/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

