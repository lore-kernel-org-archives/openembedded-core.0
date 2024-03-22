Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EAFC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 10:57:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.135])
 by mx.groups.io with SMTP id smtpd.web11.10340.1711105047559236337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 03:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=M8y/qAE9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.135, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+u/dhkO8snGeapXtZlRRjMfh+QTbdhD6V5zSuq94o0PUtuRwHdAnQmuLWNS5uVGwb7/65MpT18Qmj8mpMqMge+fGf26MEpBQIaWUDlCI+FVoIm8NoYFwejPvuOE89uq6fbH1recwbULy1laQH9HVxIcQ5z8hXWR7zKhEqqyeTBKP8KGj4Bz3mzhIiRGIKaalnUFfKF5EYR/3EurJtEOKL3m3y8kN+AsMo9zmKcMzQtaU6WD0XxyCIwMqwsb6818Wy9p/DmJucV3iTEV6n5/YfI8cjGingpbNwfVqSa8pEeNVoZ54BxmTYwibi70KKml1Gtkl2VXjMdJqH47G+N7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIZ9yfsEoUcSPQpUZCRqYB+Xl3uH4fNwrm+cNVor0YA=;
 b=dZ6OwtWwgtpABfLmMDRbQKZomzrp5bLf2rD3Zh5yS1KWjFy4xeAU6klAB265aS5GvyN/U8MnzoaOm2dl7zyxY19x8M242v5rcNEIuSIt4eYpCNfSEIwgkxeyGTuZ8ytFWpfHpME9sIHdaSoJ18RJj4dKfEiPqvI1UPDRYGf+7WITEzGLzuH4ZHo4A17IG+sCscpkddzvaFMNNfr/jX2rn1NNcwybg9L45qishvM6LTMKKerV0cd83k0Ta9hN4rab1UjVN8C8ZMUb1ylqf0rp9JOfzg9JW6rv60XIAD0fqVkiyt2Stey6rWZN3U0/hwTO+uUhrRWTPlFUOw1hQbVaoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIZ9yfsEoUcSPQpUZCRqYB+Xl3uH4fNwrm+cNVor0YA=;
 b=M8y/qAE97Es7n5Jth+Yre5TYROI2JRWZSJIY5bss1+SgiglIkGrbpwfEHsUOuVDQaCfBsCrXd9CaFZapl8aBrQm+Kx0477eegYucFDjXFfuiK8SaTKlk59m59mwu+14Fihz6kq+fiSLJEHIz9dT96pUEhMotrt/LGvhV0Kyr1aiUFXNQ7ILznpa9CBRq7EUD8o58zX7FWlMKl5qpuAwF73vIMK4v67VB1R615gBsHlVE2UwWP/ibNCfOpLtICLQGJ2Z90b15cwiA6QDz/VYj+zCROyeohWy+AVGFQT5jZV+nbRuwfM5JMqHsVwjDlzvXP2CIN2ZrLU/EZx2KxOT50g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PR3PR04MB7484.eurprd04.prod.outlook.com (2603:10a6:102:8d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.29; Fri, 22 Mar
 2024 10:57:23 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7386.025; Fri, 22 Mar 2024
 10:57:23 +0000
Message-ID: <96d8fe3f-83bb-4a72-bc3a-d04d873164bb@theobroma-systems.com>
Date: Fri, 22 Mar 2024 11:57:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot: fix externalsrc not triggering do_configure on
 defconfig changes
Content-Language: en-US
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
Cc: Iskander Amara <iskander.amara@theobroma-systems.com>, steve@sakoman.com
References: <20240321-u-boot-defconfig-devtool-v1-1-2fccfc4c6f5e@theobroma-systems.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240321-u-boot-defconfig-devtool-v1-1-2fccfc4c6f5e@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PR3PR04MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1c876b-ae91-44aa-b32f-08dc4a5eda61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A2Lt3f7t2hYAROtGH72FKHbVcfjcrKw26/VttG2IMbHl0eQ4CcU77FnK0ky4LDbgHncIA6cT78PQ9ujrobKMWBW1AC49Psvt7jpcoCvAMNlJ8UKOraV1rLEG+Mw2cPrlOi1LY7llPyXwy5lhkhanW6Ke7vSqnb7PkpLCGJYQWM8JcpkKj7y/uWvEZ3E2oyfDCw+Oye7spsJx3f5IC6klrt+4jU3m2o9+LYTjRj8B32UQ7FvGf7Ws4nOqUP2J0oG8rmomxjTspGfaXbTJkGM4OGc0xpEPT9uzxFtFROgeG8Cl32wwgPvj8FLTuyWaul47k8im4+s8tK5X7+ij64E+UcbvuzwIyZS8dFdsKc6XTwHPR4F8BrVcR8OgVmze83oZvc0H5X8vjK1DlKJunVn4whvEXJilX6ub2sLXmt423d2UeZ6C4cQGL/MNnIiT5myJl1BQTWMJ0UvkmNdsz5QHJSUwcdsX8/NBh1NgaXbAjfMlY4bf0IQnIY1xxyFGAPXOi2HEwFJf48gbzNwgsy3ZPnLLWaTHVy2//3HVmTQNMemQbWFjyRi6ecrdbcWHDKhsVnFx6lcGOVruDwIS5wUT2Tl7N2gH3mXNSnGa2YaFT12tvXVOGUBtDb62SH+cHTo6Sqjp9XV53IgWrTVDjnkjZLbfmROu7/LEcdXSWI+3VrU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2hacitiSUdIakpSRHJpQk1BeFRnMmNQMllRNUFBRlYrQTdmQTZKWjV2WDhG?=
 =?utf-8?B?Kys3YmhsZFR5WFBndlB5dUh4NHpMYzQ1WE9SUXhBdkpOUmx6TFV4QTBlRFJK?=
 =?utf-8?B?eDY2QlJidklWaXEvNG53QmMwdDRvUVFUbFJ5NGloRTJRT2w5OUthZllLR2w5?=
 =?utf-8?B?TW5qMjAwaHZQS2FSV0kxUmlOVjFUa1RTeE80K2pCbzVpYklPbnBXNmNmYzFW?=
 =?utf-8?B?dnJtSDZTdUNkNTd0aWhnMlVMK2RUWUtTUy80VG02Nk5VdUlhK0h2cDlPZU1E?=
 =?utf-8?B?MUUwZjFvVXA3djd2Ry8vclBpcVhJbTNOdHRBOFNUb1V5N293dzRhalMxdUt5?=
 =?utf-8?B?dzZpcTdFWnFoQVV4QUF5RlVTRUIwaXUyU0dBRnV1R0pjMTUzR2gxL2hucUFv?=
 =?utf-8?B?ZFJDWldhcTU0OWx4c3RDVDhoZjYvQ0ZBaDl0TmJVQk9nZkNmQ29UZ1VXZzAx?=
 =?utf-8?B?ZjhGWWlHdDA3RTJJV2tBVlc5SGR6UnlxbWFCS3ZDWDllUlFKVXE4bGUzeU55?=
 =?utf-8?B?a3VjYlVvaGFPVm4vNC90MzBITldvYllCbWd4U05rNUZrYmhvcm8rUnFSK3J2?=
 =?utf-8?B?S0tBT0s4b0dubEY5K08yVkVOemU4WWtXdWlFVG5GaXBsaVYyOStiV0FmZytj?=
 =?utf-8?B?NFgxN3hnellsTFNWSjZCcjB0aXcreGJpSTVZNWlRdkNVbmM2cGRJcGx5ODMv?=
 =?utf-8?B?LzdxdmdhYkxQU0d5VzF0dkFtcTZKZVRiY3BFMk1NRFp4M05EYjg4ckVMRVVq?=
 =?utf-8?B?V3JaNmxIWjVGdmVaYlY4QzVad1JoSmtWWEduZTRaZm1SdXFFMWxRSUF3cndN?=
 =?utf-8?B?ckZuMWM2Nm1ySUJxUjcyL0ZxRUNqcFdmd3lwdTBjcmp6TDRjWFE4Ymc4a3Vj?=
 =?utf-8?B?NWppUE1BTjBBT21iNGdsb2cwOEt6VVNmNk5PbWR6eXhlNWpCVnVEQVBHRDU4?=
 =?utf-8?B?SkRLZEFiUkJYdG0va1E3cUFUZE16azdyYWdwRUE2elJGTjhITWoxSy9pS1pj?=
 =?utf-8?B?bmdob1JXQnZvVWd1QlVjR3Y4R2ZOajFSZE9iNUdlTnhoM2dXQ3kyTGF0eDVS?=
 =?utf-8?B?dWpvOGRueWlWaklnOWYwUUpKRXlNSlMwb0hFNDRBdUREdEtrL1pyN0lJMlBM?=
 =?utf-8?B?TThFV2hRMVI2QzdTOGsxV3lDR0VlUUo5L1hVd2hjNEF3ckFHb3pnSXN3bFpX?=
 =?utf-8?B?ekVQK1ZCRXN3Uy93UTFoNTh0YnQzRWlRVXFUdDJJNDRWSU14Q1c5dHpMRm1M?=
 =?utf-8?B?cjJEUFFLRjJKKytBeVFRTUk4TmJnVjdMV2pJQ0c3Qjcxbk0rZ2hsZ0ZISlly?=
 =?utf-8?B?Vk1MMFhleUFJN0VTM1ZIclQ2dXpRQk15QitESVJaZXpxbWR2cjdKcWFHLzVY?=
 =?utf-8?B?cGlRYlNUeS9tektTSDJKL1BiUElMYWlrN21ZU1AwQlN4UGNEY2ZaSTJ2M3FI?=
 =?utf-8?B?aHVSQ0NKbTZrT2lWajBZRCtVOFQrcGg0V29DampEYnBVZGFWY0FOYi85eGVq?=
 =?utf-8?B?NlJOVWpMenFxMHYwR1VDeGVoZ1pPZi96QnVNcmlWUUtoRjQ1Tkswb2pYSzBj?=
 =?utf-8?B?YzlMSHFZNHFuR2VCekJraVh0U0pzZlBpK3dsOWNHZlN3QWhobHBWY2I4ZmR6?=
 =?utf-8?B?MEVsWTJZd2FOaUJ5OU82OHh3VTFzM05XbEhFcWUwbUpHOHlhMzUzNE9TYlZy?=
 =?utf-8?B?VVNOcmVIOXJEbzFHcWpqbWtISmpxejc5ZGhZN2xPOUU2ak0wZTgxRGoreEhJ?=
 =?utf-8?B?Tks5Yi9Zdnp2S1MzUVphYy96UWpESnNSRmxhaGxmYUl6K2p5ZDNoZ2VwTkVV?=
 =?utf-8?B?S3FCK3Rrb1V6YTBBb3dDazdsZk4rdmxNamRyTFAwek94aGhzQXJkVW45Zisz?=
 =?utf-8?B?Ri9YZDc4SkROSTVLYU92M0t5RHYwS3M1QVBCT0RhK052VVBMbjJ1ZHU5blZs?=
 =?utf-8?B?ODMzZHRRUU1wcEhnNTJDaVRXSU9rRzlEMGdtSkMxSVhpdW5CWlF6bTZ4TmZN?=
 =?utf-8?B?VGJTS3NjRlpleGFoZjFmM0s2Yk04ZFJPU0RVeEt4YVZpcnI5Y0xjM05MNHN3?=
 =?utf-8?B?T3RkbzRPTWc5RFA5dTlIM2VERTJJWWJOelYxSUo5di82YVlOWjRiMi85WE9h?=
 =?utf-8?B?QnJFNjNzRFhObTUrWldQOG9ualhHRkhpMzdIQXh2ZkkzSXJ0WGgyNXpXTnVZ?=
 =?utf-8?Q?Z4j3UH9pnUDTnOVGLNt51Zg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1c876b-ae91-44aa-b32f-08dc4a5eda61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 10:57:23.2014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIscubY3uIsKgfwZknYus29E0PA7yqEK42VzzicIKeHZ4w0ZF777w46tAr3wmwr5OGCVuZCwNKYNXbOFy98GyoXREfTtEL2tsGwyclIbXwSFW8ppN0YxUzPdZWj28abI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7484
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197442

Adding Steve as Cc since he's maintaining the stable branches.

I've tested this on Kirkstone as well (in downstream u-boot recipes 
including u-boot-configure.inc and have that new line themselves), so if 
this gets merged into master, I suggest we backport it to stable 
branches too?

Cheers,
Quentin

On 3/21/24 18:17, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> externalsrc only monitors files listed in CONFIGURE_FILES environment
> variable to know if it should trigger a rebuild of do_configure. By
> default it is unset, but the defconfig from U-Boot should be listed
> otherwise an old defconfig may be used even though the change is
> technically detected by the do_compile logic later in the process.
> 
> Because U-Boot recipe uses `make oldconfig` when no defconfig is passed,
> monitor .config for that special case.
> 
> This fixes U-Boot recipes not detecting defconfig changes when
> devtool'ed.
> 
> Reported-by: Iskander Amara <iskander.amara@theobroma-systems.com>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> Tested by running:
> 
> MACHINE=qemuarm devtool modify u-boot
> MACHINE=qemuarm devtool build u-boot
> [modify configs/qemu_arm_defconfig]
> MACHINE=qemuarm devtool build u-boot
> MACHINE=qemuarm bitbake-diffsigs -t u-boot compile
> [Checksum for file oe-devtool-tree-sha1-u-boot changed]
> 
> Apply the patch, then run:
> 
> MACHINE=qemuarm devtool build u-boot
> [modify configs/qemu_arm_defconfig]
> MACHINE=qemuarm devtool build u-boot
> MACHINE=qemuarm bitbake-diffsigs -t u-boot compile
> [Hash for task dependency u-boot:do_configure changed
>      Checksum for file qemu_arm_defconfig changed]
> ---
>   meta/recipes-bsp/u-boot/u-boot-configure.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> index 235623d25a..378d675364 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> @@ -8,6 +8,8 @@ inherit uboot-config cml1
>   
>   DEPENDS += "kern-tools-native"
>   
> +CONFIGURE_FILES = "${@d.getVar('UBOOT_MACHINE') or '.config'}"
> +
>   do_configure () {
>       if [ -n "${UBOOT_CONFIG}" ]; then
>           unset i j
> 
> ---
> base-commit: 94f99434eff15a92cfdc2dce423d32a1b74aab39
> change-id: 20240321-u-boot-defconfig-devtool-905683a1bedc
> 
> Best regards,

