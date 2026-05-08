Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23883CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:35:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15174.1778250947637422170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AFKzeVvd;
 spf=pass (domain: cherry.de, ip: 52.101.70.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqqL9PJv+Put0JhvNPW5jNEtEhYXpT+C2uF047q8buwu1euAOSO4ZF6+/pcwgKFIyRKzxCZattPAK/dPQheb04Gj+zRVZuNMFWYmiQwQh3VbwFXJoxDwFALzBjOtaLDnnXECr6TNflzQNgz+GCC089KI7b0ynrBrqOvElS4pokC4doFDIOG3ReUtGnk80+V1/Zv+mVGC2FDieW93xHKgRKwJmrsPTkjt3rIsoy2t1nGET9gYMBl7va+w0Fwl27y0DoLVMyPngkPnw8KEWhEIkqT4XOxiuYp5Vydj6FRgI4WYGnPt9/mCm7xJr+3zBUEwTANRNVn3N8xTRCWwsF7Qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlUf7YE5mtxn3YJEyE1S2FGYIgznHHs1nAOyOQn1G9w=;
 b=c0wjri+13g70zDTV6erkgMcXSRr40FKHvBCGoRDbPpPAhXuYWptIwbbF+4ncL2SNlhXv+1anI26gZsseJUuQn7nf2o31qzlU48ajdrJdps1EKgVRMmDw3xfbiF23h0uXCOdoemlhKCHCGmds8MZOA7iRCSvsMddZqrJkG98tF6ICdHqAVsqAZ0gK0kOAj7cFRJrFIFZkV4h/T971bsbBgVix6dX8SW8mlZInsPiIpN+h/NMVx3GuxRCq2tsfy7i9srBhmhaYayPHvMyT2t7yWNxs0RPkmfnWEDs3pAK3BMLrre3zn777eK6NVSY9xXafKc0K5hMtXYmrwCW6EghB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlUf7YE5mtxn3YJEyE1S2FGYIgznHHs1nAOyOQn1G9w=;
 b=AFKzeVvdMhrm9GJDW+iVbbY6mrhm5U7b5bXDvYi9ZVKB33BSCN0Pckm9JNRCdPxHnG8Dm/JSZIedz+gu2D+Y8DvMwOv/i6mCj0eH53XyRgd00pe2uuYoacBSns0loh84BTziqJf8M9ymtpImlPNIPEZ6o99khMXsGW/Oi5uw+d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8714.eurprd04.prod.outlook.com (2603:10a6:20b:43d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 14:35:43 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 14:35:43 +0000
Message-ID: <8410dd92-5356-49d2-a294-ec197ec67bac@cherry.de>
Date: Fri, 8 May 2026 16:35:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: ricardo.salveti@oss.qualcomm.com, openembedded-core@lists.openembedded.org
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0055.eurprd03.prod.outlook.com
 (2603:10a6:803:118::44) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: b3573cbb-c88b-4954-9b5d-08dead0f15b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|3023799003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	nBuR5LW71MA32KhU4wcswMWD+xiBWHUr9TErPv2DH1UPCINImz7plBtjerf7Xtc5ix3zgb+swHT8VEF94PX0/JNfUZv/uVzSMUzC5OBw40KMG8MnkCasWy3w7+SDCZ4WKI5SaMJjYE5xXceiiZjUnUdnyWAF08JqFLtCSrlVQGfA4M3mwtd8j1cbwOsv02kihV0EC63G3Knr4AaCiM5o3Jn2x6qK3pWiORsaKABnKE2vTwqZ7GsFspeozBfoGxBGXmUwyVVRr7VfPvAMfPX66skMw1p1Wv+iruMU5I3gmcr/F+AOOoRWPqTkAbMwspBtTgirZnI3OnvoHA1CCuBcPBV0TO6HoslpeU/nZb2NttnYSP00An0KaaEH9BdPB04uhNhp72n6I2BeInnezG+H7DxNNDUJ9miBLKIxMDLhzIYCdDiSyJIuOlbGB0QcwmiWuz6nF8GDrkVGhtnAqc0KDyMjmaBTZMgQAJQoSNGPqr6z9lx6eSLRS/cWiHZeDyGhMH77CxR+v6GjOUnkzWIBITQej9LaF8ZmEb8/oZsUMBUCji1WfrdYgfH1nfENihoLqtjyk0UaZl8eFA7W/7gzuyqSmyFrz5XRGwk4wiPJK/quRwhvhxGpmN/Jq8ISRhVAyrmsR8Pq0JTpkb70ezQDSz0r5oiiTYP15NT99i7TykbNz6S4mxs5f7kMtERGCl+x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(3023799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEI1NmJBRWNVcXRpM1lkNGd4VHYvRmQ0bTFhY1VrTE9pQUhWNUNzNHdvS1RO?=
 =?utf-8?B?c0hKQ1JMaVFHWXZOdlV3Y1dEQ0NNOEx3S1Y1MXFZcSsxNktibU5JZUl4d2U2?=
 =?utf-8?B?elY0RmR6UkxYL2U4cVZtdHhBSEdxazUvcGl5VXc2amtlSVZWcTNhSGg5emxr?=
 =?utf-8?B?M3F1Z0ovYkIyTGk3amx4M1dWdE4zcXhPZCt6RGg5QWpMaS9YL3p5MTh6ZmRS?=
 =?utf-8?B?T3k5azZBbEd4L0VhT3VmSzdadklGeGNRTjBvekQ4SVdnT0sralZ6RzhjTFRi?=
 =?utf-8?B?bVhYTU12T051aDJkRExvUEVoY1NCKzUybGpPbDhTRlZOb3F2ZHoyblhzVGV0?=
 =?utf-8?B?ZkRFL0FvRGwxTW83djI3TkRFSHErY2VuZXJTc3hFRDkxdUdjWmUrdHovekF3?=
 =?utf-8?B?OEx2aVVrL0lQcXRxR1FUZlhjalpsVTJ0MmJtMGZxbE0zNGM5QUxtQUFURWZL?=
 =?utf-8?B?K2xNYm04SGQ1Q2ZsWVRHemJOdkErRlp5YU51OXQrbExiYzRKRkdTTTdIL2E2?=
 =?utf-8?B?WmFJdUhBMU54QVk1aDNKc2ROTEt6ek8rQkxjRE4xV251RngwTlJOYVRGSWNT?=
 =?utf-8?B?RTcySVVtNlR4c1ZuK2ZCR0xxZHNHNnJQWGR6bldQZUgwR2NoNDlUMXhkbkJu?=
 =?utf-8?B?T1Ztaml2K1ZLNkRDMDBlNTVVWmgxcHVranZKN2lxbjlkcnExWnZMZkFTbTF1?=
 =?utf-8?B?SDJLWUdUdS9zcHV0WTZsZWdYeGU1OFRnWm1sbzNqNWpCMmw4SU1Jc3M1MVdJ?=
 =?utf-8?B?L3NrMHYycHhORlJYNVRjTnRSUnZseW00b3hjOStoZTMrcGcwZVZXN0JJUHk0?=
 =?utf-8?B?alVUUVpqaEdmMnN1L1ZYYVp0enc0T1pVeldLeWw1ejJUSXVBdGlBQzhXVmNk?=
 =?utf-8?B?MFNEZVlGL1lNOVhZYWxySHpVYUFWbXM1QUdTeWpuWlhGV3JCeHpVMUoyamNP?=
 =?utf-8?B?aURlL2hSYkFNN0dPZTRaVW1SRlR5VWFHZTl2aVFqTXd2Z0dRQUhkRUdCbWFD?=
 =?utf-8?B?Q0I5cExoQjkvNmlBdVFXT2NRWWxTNm0rYWhFRkpnUm1Fc2dPMjBlRFJ0bzJ2?=
 =?utf-8?B?dG9tNFQvb3dnSVBWNmE3VWErQk53RWUvMTJXVVQ0RjAvNFpvRlBUYkZtUXJ6?=
 =?utf-8?B?Y2FaV3RGaW9QT1pIRHNvVDBxWEZJRFJZK2hmVWI0eFhVVUk0TFVjN0Q2VjJY?=
 =?utf-8?B?eGJlVnRBYUxXbUxtdHJVc0ZUbEdqSWtHeFk5aEd2YjBONG9NV1RZN3IzUXhm?=
 =?utf-8?B?ZktZSE1EajhHeGZzeXBtak9xTjVFWUhXV1h6aUVhc1kzL0VSZk41SDBhVzVr?=
 =?utf-8?B?cC80dHJucWdYR3pRb3lRU2pJTVpOT3kvakRQVENvUk1LZmkvdHozeDIvU2d4?=
 =?utf-8?B?a1BTMmlpUTR1MjgzNzRHck5qa2tCd2FUMzV1dktiYUxoTW1sa0VDbzg1T1ZU?=
 =?utf-8?B?dUxCbDZsaHEvQjZGTXM2STdmeXlXT1l6ZTlXbDVhUlo1TTI3VWZRaStkZFNS?=
 =?utf-8?B?K0kzNFFJalBIYzFPbTBTdExTc2k4bmc3TURwMVpNM0pWR1RWdGRKT1VYRnNt?=
 =?utf-8?B?NzNEUkIxZXJHS0w1ZkM4dUQ1Q2puWHVKZzdhTW1LMG1GZTI3QmtvSzBJRnJx?=
 =?utf-8?B?a1BldWtmMzFYblhqajhONTMzaHo2SnBhSi8yY2FvYkxxaEp6OVVGOW9JSFVU?=
 =?utf-8?B?cUlNR0pzVER1dGk5SVNMTG84WTN4Vk1sMFl0ejNhR2hKanZTaWhWSS8vOGZr?=
 =?utf-8?B?SGdZRjFOMFFDbUVnOVNuZFJXMmVVZG1ZNFFJL2VDY2E3WUI1NjE4MXBHMDB0?=
 =?utf-8?B?bldoQ3Y0Q1BLNXdvSXcrem9TY1FYVSthaVEzQzRxcitmWTc4UzdEdDdKaXkw?=
 =?utf-8?B?NStON1JFVXF2R2htUGlnbjdmeUcwZWtobEpRTUFCRHhkc2kzOXlpdTJJckZX?=
 =?utf-8?B?d3dqbnpaQmlld09ONC9IdS9KcXNwYU5nSk9CcVlQZ3BxemxnNUwxV2owZXJp?=
 =?utf-8?B?VmZNNWx2ZjErS1pBYmp4Y1Z4bzNFaWdUSGF6WmhJMTBkdGZReTQvSWJoSkZJ?=
 =?utf-8?B?MldLOEF4MHpJRXAyQlFZQTNqcCtQaXNKOHlMdkRNRzUzd0kzQ2NiVm4rWTRG?=
 =?utf-8?B?S2tqRUVyR0hmNUxLRjY3eVlVemxTSlQvZFJMWjRIZDFEejlOS05hYjJpU3N4?=
 =?utf-8?B?bUJTSEtTaU1MUnlNTkYyNWFzR1FrUnJHWVdpZDV4WkJNMDVxR3V5a3c5bUVy?=
 =?utf-8?B?bkNMUXFjMHRHcGdoYlFYYWt0NjZDcHdYc3hIaGRWSy9FL0E0L2h1RkdyL0RR?=
 =?utf-8?B?TjRueFlwK2lUM09FZU1xZEZsUXZvbk94aGhjd1VDcFFGUWI1bTZBUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3573cbb-c88b-4954-9b5d-08dead0f15b7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:35:43.5133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB9agCIEaPDpEu/hEprzkr6ZKbxsz0tR8DAWXMXXpfqIKr1u3ITmMiSOEbMw8YhXoOG0WR1/dIRYL7JbaG4Xqi27B23590Dy3RNmEBhNGnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236716

Hi Ricardo,

On 5/7/26 10:40 PM, Ricardo Salveti via lists.openembedded.org wrote:
> Commit 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation") added the
> backport through SRC_URI_RISCV, so only RISC-V u-boot builds picked it up.
> 
> This issue is because the v1 of the patch was merged instead the v2 (which
> is also not fully correct as it is not patching u-boot-tools). Drop the
> patch from SRC_URI_RISCV and move it to u-boot-common.inc so it is applied
> consistently to both u-boot and u-boot-tools.
> 
> Fixes: 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation")
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot-common.inc | 5 ++++-
>   meta/recipes-bsp/u-boot/u-boot_2026.04.bb | 1 -
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index 574768b9f8..15e94a4e37 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -14,7 +14,10 @@ PE = "1"
>   # repo during parse
>   SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
>   
> -SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
> +SRC_URI = "\
> +    git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV} \
> +    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
> +"
>   

This means any recipe including recipes-bsp/u-boot/u-boot-common.inc 
will need to override SRC_URI in addition to SRCREV otherwise the patch 
may not apply.

Wondering if we should move SRCREV and that patch into a

u-boot-2026.04.inc

which we can then include from
meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
meta/recipes-bsp/u-boot/u-boot_2026.04.bb

with
require u-boot-${PV}.inc

?

Cheers,
Quentin

