Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FB3C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:27:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.74])
 by mx.groups.io with SMTP id smtpd.web11.10044.1641918476058635984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=awFM7vvw;
 spf=pass (domain: outlook.com, ip: 40.92.89.74,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqr4fW0AB1jCJf24isRZeG58dvHtOKfqd4dR+vrlemEe0xjZiHY0uuR251P2M6CYsDLk8DJES24GKd2W3eoeOrgzZiytFbj/eJbZidL1U0uybQdqO2vNuW9h+sV6odCXzYaP4y8RFMfpo7z5jbRLXvhLi1kBD+v6wXo9GGO7X9gB4pleH+8L8tIQAFBmv7Ac6dplJu4FwasfDOMBDyoJhIRpsPGkRhJjntkWgotZ8GpdQr7P3eRPkXfJzVxgsXvmqnUcZk3Q+/IrzScYkzwFP+yy7yIm8LCqS6H/eH61Cb58VlCZqN1khKg9kwwOEi/ZM6YtCD5FXPDnACVP8etReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po9QMfBvMpJV7KmcqX4WIUcmugf3GkUbo7UvxI8oCec=;
 b=A/2oxyXR8VVIkyFB9I6m3zsD+76d5pHdcPhvNgpHTht2eUqyyS07iEmzyByYDKm45Xq8JFaxoDjz0k8nRP3RXzUF6tk1nixlFvq9E5Yee9uCf0L2oERJhk4AVMqWsqugT5FuVCuH+hTkRZXHpv1XA4HxxlXPDYYg/bFesA9iM/5D3o13EPr7nhCeoU8R9soKkd1KHdwm+3Ar4GzSSvORjN+FxPv/MgnaJcr9YLWuLFw9gh2alxCTXedvoStDCUovfKqAImniQIgNYeSEY/KYMIzJUjMbJe/li9M3+RxlVL6qjjfwNRgzHr6VsULaRJ6kyibhlxTn8dn/jvIiMR62QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po9QMfBvMpJV7KmcqX4WIUcmugf3GkUbo7UvxI8oCec=;
 b=awFM7vvw6iQC+KBGCXaaJDp3WMdCBjMDwqWa4nPauIzjgUZe9ThDPYBpVWAeMfxelbbl8oRyFh/SHUo1jBI6Y2bd2qCZFw2t9MIv9Z8AbSWm8o+8rFEwxfAq9xKw2WS4hviyaot4ZDrBxbCWQXIg97OoxdTkAsoQ/fpwm/CjavVwaq9nRIekTz2FI161eAxaPbW7Lw8+xV2PU+zotuu655GiUFmmwA1XCNRbOyaB+UCfQP6vlbgQ7flszVF7Nu5o4d97zd03H9VCLXIbnL/HOm0A+5mWJwtMvEhVBwZNFC1MJydrtOPxE1N2hjoDjQv9HMRCNWUEZ4cQJ8iFtiILGA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3219.eurprd09.prod.outlook.com (2603:10a6:208:178::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 16:27:54 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401%3]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 16:27:54 +0000
Subject: Re: [OE-core] [meta-oe][master][PATCH] nodejs_16.11.1.bb: only handle
 npm if configured
To: Nisha Parrakat <nishaparrakat@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220111162327.33864-1-nishaparrakat@gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642296DD2DCB7B1685EF77DA8519@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 11 Jan 2022 17:27:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220111162327.33864-1-nishaparrakat@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [eSQ7/XZVUKaXoE7yGxWp0+o/XVRgOpWzQSWmYQxUZzagdzCswBcGmglft1yAZd4g]
X-ClientProxiedBy: PR2PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:101:16::20) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <c1d8fcd3-dee4-7074-24a7-551f56151904@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e06f17-132e-48b1-038a-08d9d51f516e
X-MS-TrafficTypeDiagnostic: AM0PR09MB3219:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ZF+56A4loNtTGuYqWRqd/BHyReD0vg4575eUupJRQHrg9V6Nc/BuWYhiJkY4fsM7QF71UEcZ5WzKeTOL1Kw2wUQpFuIi0oLnx4Fp3jaVWqbgRCeIbsEifbZjEtyJh45N9F4jul4LLyaP6/KUxm5GBOS2wcDmCeo4Db7f6Ovz2/BGTxFcMm5Fuetd6AqKQMyK4f23Wwq9F9LRLeZMRBZKu7AHHaHLxfdjruiBP/pyj3Fyo5h+ULB3D/H7k5lNei5XhSdm4vY5TziOU1pDqHhDme7PKE9EEUo0JnRLmso++86uXA6PTIXElHSLmmAv2QZlrhbJ73GPHExBIJ3dqiXA4TkACOM5oIqkq/3Um6QUdtPXQFVcKnh9hSSF3o1JkCUKa51774evEFoGkth6d1lOW2Ki291RxPbZcaGYxxY2CRJDiYTuSoeBw0yZEe4nAjQQDLZSZ55NP8m/yuKCZoBb02ZfZ7BLu4sFx84lWQ33lKH9+kDj8LJfrozESaxPQbOcIxkJKAFwdaUnysvXHNJ9zN8YhXnN7m++g2WnjHrIHc9Um6wY0dhCpHcp9ByaeeOKk1Sc02CoJcl0rA0lG4/AG/D1c48WQoSowxE9bjxfFRIVrukwepxiMtKHIaWbma+WshH2Ncb/JOi1HIzs7kjCOZI0lp9NTw/ryYpTjEFiqs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTNOTTZMbmM0M1IyVXZqTkdYcG5USEI1SW1DQlpBQkxaaGYzTzYyVGcyRmRG?=
 =?utf-8?B?aGRmUmNMdGI5WVBkYjI4YW9qbnM4b1F4MHZtVmFJMVliUW42czlkSnZkWW1G?=
 =?utf-8?B?UndYb2JxbkxxeUJnd05WZ1IxWElRY3FxT1pwM0hIcGJiakRmWThFWDBYeUUz?=
 =?utf-8?B?WnFhQUxnRzdZdWNWdDRkaUh1aGpZUkhaNWd5VG9UMmRjdUpKdytaUTlHZGJH?=
 =?utf-8?B?YWQreWFGMDZ4Zy9SeEo2VWlTZndlTWJaZVJIbEplYWxJT1lLTUJtZUhoQWZZ?=
 =?utf-8?B?VC9GMGdLeDJxTHBVdVlDbnMxUFp3SUdSR2FVbUl1VUs1cFNGVUw1QTJXZTBS?=
 =?utf-8?B?dlhveFc4L0hmNmVuaFc5RGM2ODdUcE1TanVtUnlsOTRieE1XcFMvMzV4d3dR?=
 =?utf-8?B?aEhidjdYR2xCZDdZOHIyUnpHK3V0YWtrQnFIOWVEc0g2TGJzZlRBQ0pRaUg3?=
 =?utf-8?B?UFRzSWFkclFJemNLREhORnZ1a2RpT0dBeEEyNjY3UWVPS2Z2WGFtYXoyTWk3?=
 =?utf-8?B?Yk1PQlVkUHpseUYzb3cyNGxGWUFtcXhhQ1k4VTIzT1lzelJBYWtQTHJTYyt6?=
 =?utf-8?B?djV2c0JYUW9NUEQ5MTE2S3dZRUN6TUovVEVDMWVLWkI3dlJnTHdjV0JRcnJj?=
 =?utf-8?B?ekREd0JWUEtIUi9JMDRqOXB4RUYyQmsvY2g5amp2eTJqK01ocldHeHpmbWlL?=
 =?utf-8?B?UWxmUi8weldENGU1NU45UlBRbys4eWk1WVA5d29TMkx2WlYxaFpGK0JENklE?=
 =?utf-8?B?RHFZd2xqby9Bd2FlOVhmeGxERG1xNlFrYjN4Y2FpSS80ZzZrNWRYY3RDQkVN?=
 =?utf-8?B?OEY0RFphZkFMYU1tQVBJT0t1bFRyMWlONXo2UWNmSmt0NlcxMTlwOXR3SUp2?=
 =?utf-8?B?RStNVERnV3JMbDRRTE9mRi8xQXdWS0h1UlJXcmp6aU1EWlBRdjE2Z2ZCdnNr?=
 =?utf-8?B?VGFvdHFXV2tHTFpsUjBaZ1lHdWtkSEdVVEk5cVp3cmRSTU5sU1VPMkN2ZHFw?=
 =?utf-8?B?eUJDQkpyUkwvaGtiM2Q0dUV6NVRsVWJsRTN2UlAvRythMHUrVzBHeGVHODUr?=
 =?utf-8?B?VUVuTnE1bWRGWmR1RVlZSzFDRE8rTDhCWlNxNlQ2emZsYno3WVBueVRnSjJ4?=
 =?utf-8?B?SVFnZllPYU5raERZWi94NHpvaXN2aGdNZ1Y3VlY5OEZlby9jeGh4TVVtN2FZ?=
 =?utf-8?B?Q2lHcTlzSEVtb3dudk9mTmxlRlo1NTRpNDc4bVZIaFFXUEhVWFhJczliMTVi?=
 =?utf-8?B?R1hKK1pJMjVNcFR5ckFvME43UGhTL3ZZMkVKVkROMmJobmlWNjVBb0N1L1Q1?=
 =?utf-8?B?OEhvWVZ5cTM1QWxqdFpZSS9QaGRGY0dITWRxTjBJQi8wQmNtTEIwT2h6MUN2?=
 =?utf-8?B?b1pqN1VlM1ltQWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92e06f17-132e-48b1-038a-08d9d51f516e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 16:27:53.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 16:27:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160419

That needs to go to the openembedded-devel@list.openembedded.org as 
nodejs isn't part of core

On 11.01.22 17:23, Nisha Parrakat wrote:
> Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> ---
>   meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> index 11034420a..c8d942538 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> @@ -175,8 +175,9 @@ do_install:append:class-native() {
>       # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
>       # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
>       # npm-cli.js continues to use old shebang
> -    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> -
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
> +        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    fi
>       # Install the native binaries to provide it within sysroot for the target compilation
>       install -d ${D}${bindir}
>       install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
> @@ -189,7 +190,9 @@ do_install:append:class-native() {
>   }
>   
>   do_install:append:class-target() {
> -    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
> +        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    fi
>   }
>   
>   PACKAGES =+ "${PN}-npm"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160418): https://lists.openembedded.org/g/openembedded-core/message/160418
> Mute This Topic: https://lists.openembedded.org/mt/88352467/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

