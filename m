Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1164BC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 03:49:57 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by mx.groups.io with SMTP id smtpd.web11.12194.1739850594220878684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 19:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=Az4H3MTL;
 spf=pass (domain: toradex.com, ip: 194.104.109.113, mailfrom: rogerio.borin@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1739850592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLWByZi8AQABn6Y2s8szgwmvm/tnaACmwbvq5qGLZqE=;
	b=Az4H3MTLg6PqG9aTyDudzpTbAkAWEcC+oQtg54i7I60qKW/9Qz7ZYgryI/CIABJTYmgBBh
	jptv5BYTnwoFE4uXrPT7mpuiWDvd1GToa2IINlKFFrM7cwL955Ox4//wNRDTHlgzgJE0BY
	8Zqzg0O+rbsY/FcEo2m4sIsOYIKHZCE=
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp17011025.outbound.protection.outlook.com
 [40.93.85.25]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-61-s9LbDLYRPUGGThS95KcfUg-1; Tue, 18 Feb 2025 04:49:50 +0100
X-MC-Unique: s9LbDLYRPUGGThS95KcfUg-1
X-Mimecast-MFC-AGG-ID: s9LbDLYRPUGGThS95KcfUg_1739850589
Received: from ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1e::11)
 by ZR1P278MB1524.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 03:49:48 +0000
Received: from ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM
 ([fe80::a53b:9416:5d5b:98a2]) by ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM
 ([fe80::a53b:9416:5d5b:98a2%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 03:49:48 +0000
Message-ID: <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
Date: Tue, 18 Feb 2025 00:49:39 -0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Marek Vasut <marex@denx.de>, Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
 <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
In-Reply-To: <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
X-ClientProxiedBy: CP3P284CA0121.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6a::6) To GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0336:EE_|ZR1P278MB1524:EE_
X-MS-Office365-Filtering-Correlation-Id: a92a6f5e-bf07-4e2e-e868-08dd4fcf49cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|13003099007|4053099003
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXQ0SG9ON0dTQ2R6aU1xMTVPWFpnQTRtTUJPVlhzL1d6SVdPV2tBMGwyTnpu?=
 =?utf-8?B?RnRBeFk0NWZtWk9aUDhXQmNXMnhObE5mRDI5elJLUEJqQWJFTW1Lb2pJTnFU?=
 =?utf-8?B?aGJMUlVJVzBMT0lNK3VxaGxxRzBXd0dQMUs1eldjYm5ITzljSzNrV2dmWWgw?=
 =?utf-8?B?dklJTFhMeDh0UDVUZ1lOd1JESytZWFhPSG54djNUNGV3Y2pOL2hGOGh4TXYx?=
 =?utf-8?B?bXkraVpycEs4Q25XNGZzd1grRzA3Tk40OFVvQk40ckZ2YWJEOUdCUTZENGpQ?=
 =?utf-8?B?QmRNOTZvN1ZwV3QrTVluN2w1TXdTUHlGTTBncWQvR1ltUDZpTjR4UUNicWZJ?=
 =?utf-8?B?aHNRYk11NzQ0ZGE5Q0piZ3NVOTVSdllYZVcrT2FhSTU5Q0w1dWQ0bE5VNmdw?=
 =?utf-8?B?cys3M2RkbEQ1WlZTR2xhQWtidnh4a04wOThPUkFnUUYvNzIveXA0bGtoRVlI?=
 =?utf-8?B?Rk1XWjcrdVA1TlR1Y295cER5aXc0NWlvdmg0RGoxRE56eHVkQWhLYThzYkRl?=
 =?utf-8?B?M0o2WkxkSnU0cXNST0gyZWFpTkx2WTUySVZ2ZmpRQWVTZ2dyQkhEMWRBU1JI?=
 =?utf-8?B?cDRuTVI5blZOZFpoOVNmV2RmdHhUVm1vdGVibG55b0FGUk9WQ0dTZVhJbStt?=
 =?utf-8?B?Rm1naURHb0lMTVppMm01aTVGOGowRXd5SERGaVpUZHJPdVN5NytVcVVCSmNY?=
 =?utf-8?B?TVpVU2JCVG1vQ1RtZzVtSFhCK2MxTzdJL2RUbkdydjF3czNKWDU3UHFRc0ha?=
 =?utf-8?B?LzVRK3JlME1ySGkyMHJQUzZJaU02dU45ZmQ4Z2t4YkdLc3h3a3JMd0ZpS0c5?=
 =?utf-8?B?MUNyS1F4Z2lycitDZkl6cTJiSnhQTjRPNGJqaWJ4UUpZc0swblRsQXdubnh0?=
 =?utf-8?B?aXNHMEpCYURLWHdGRFNUT09DU0ZVY2EycDhUeGFGZlRTU2txMnl6NVlVQ3lQ?=
 =?utf-8?B?d1M0WnVZeDVlOExPemRPM041V0thUDVhUENJUjZGclRPVVJKcFpTWUlPZ1FC?=
 =?utf-8?B?ZTZ0QzBrNGRmMFIvR2RnWDFVaFNZTWtQMlNmczhLUEFjcEFTc0crWjdzdm4v?=
 =?utf-8?B?TWhEcUovTjBVcFJpQVhKL0dhUTBzcVJqcWlkS0tyQi9ZeS9BeUJDbWVkRlJ3?=
 =?utf-8?B?bXZRbzdWODMrUmF5QnM3WWJoZFAzUGRPRWtOSW0zVTFaYXE0eVFhSEdpVUJ2?=
 =?utf-8?B?eDhBQVQxVVM0L2NveThYdlZGK0dWRkRxeDFTOU5kU2FCdjY5RlczMnhNSUk5?=
 =?utf-8?B?S1lUNkI1anhub0ljNjRMVXlURi81ZjAxUzhrdHh1THkydVZMc1AzMHpQbGVk?=
 =?utf-8?B?M0RmK09yNXpzeEpHeEtJZ0YrSWtKVDk3aW8zQUhwOENlalhUOGc2N3NqQnlj?=
 =?utf-8?B?a1VjSkQrTjB1NjBNMGlaRGdSYTMzd1VsUVRYVVdoenozakZ5cVB3b2lWaDlU?=
 =?utf-8?B?NVdLb2RaR3BPZXU5ekdhT1E4QWo0bXhQZFFCMUcwaUFGVUVPNm1ESmdZdmcv?=
 =?utf-8?B?dCtrRWFwdXdkaktMSlg3L0J1Z0xIbTh1cGJzVmlkMFFNRVpYTWpTNFFtL21M?=
 =?utf-8?B?UllPNVpWaXFKQjA0cDJxRkM3QlpINHhJckNKaStJQnJiODFtcXFBQ0ZNSGcy?=
 =?utf-8?B?NWZKRzZVbFMrakxJajJ5OTA3MjJYMWdxaCttNks1b2xXN1IwV0lQMHJqRmVi?=
 =?utf-8?B?QmJDQzM5alZZOTJ6K0IyL1hUTE1VMWpsUU10UDVmaTkwZ0ZZMzkzNVNDMEt1?=
 =?utf-8?B?K2FGaE55ZFdUMkRhS3pKYWVWY2FESytIU0tSbjFaZFMwbHlrZTZxRE9ERS82?=
 =?utf-8?B?T0J0c296VDBCL3JKRmpYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(13003099007)(4053099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui9BYnlla1BJaGRhaFBrMTdJY21NWUJKMVJVdVQ2cVpxL1pnVERyN3Y1eHcy?=
 =?utf-8?B?ZTBrNEE3TmhPRkxSaGxYWmF0c2pvRzN3dHY3aytzazUvSHZ2Tnp0K2ZITGZn?=
 =?utf-8?B?cXFQVjRoK29zRnRwYmVZM1h1Ylh4QnFVMjZvdnNBeWc5OUVrQm1IQ2NBSit4?=
 =?utf-8?B?WWVxZXBFVmFTMDJKZWdUV2IyWnBwRTRMVVppR0V0SlZYci9BMkd0aUtXNnBt?=
 =?utf-8?B?TlJVMm9sa0ZJdnZYZFZlb2JLTUtXTkF4aHBYeVdrVmlVcXhoL1ZtK05XY0dO?=
 =?utf-8?B?c1pyR2F4YWNpU3dKNGtCQ3l4QjQva3E4Tm1id0hqUVlpbFFDQ2R1OG5qME1L?=
 =?utf-8?B?VVcyMEo3dEZKc2JDOHcvRVU5VXBFSU9GdVJhcWQ5TFFjQ0pqd0hMM3haQm9C?=
 =?utf-8?B?YTJGaWNqcExLRUwwK0ZlbDJZYlQ3QkYvckhDZHQ2aHNkMEd3MmxVRFdsTVlU?=
 =?utf-8?B?YnkzeEZ3ZS9iVnlYWFJmbVMrcDdKc0tDZEs1dVJzNkU1L2VTWU9oVDIyaVVF?=
 =?utf-8?B?NXcxZDNkNVBTZ3JUMFF2SHoyM1VlLzJjbGNlK2hlOUJlcDRPS1hhQ2ZMeU9i?=
 =?utf-8?B?Rnh3dnNJSGhrb01ZSnV5cGxBMnpOMkRvRFhHZ3lLRWx0OVZVUHdEUXJjaDN6?=
 =?utf-8?B?RTdjWTdUZFg3dnk1NGNsdjFzZTh2RHdCMHFIMkVWNno0V2hCamFhWWxKOUhj?=
 =?utf-8?B?aGp1bEVmbnAzZ0lrRDBmRVVKVXhMR29idGhKRVB2bnd3aVYvZnlicUovVk1R?=
 =?utf-8?B?K0xzU2RJT0g3ejNYenBWQjdkNy83TUhJbDNmazZEV3JRVWFhMEp1b3A3TlVO?=
 =?utf-8?B?dXVSa04xOFlpOE9pV3hzWmE0SWd4UTYxeDg1U2gwekE5U0VQWTE5SW9MWGFC?=
 =?utf-8?B?UFdsbUNaMFFORGRrUGg4eEtIOHRmcHpsdVd5RDRjUWk3UWVwZGRRNldxOUd3?=
 =?utf-8?B?S2w0NTVEN0ZsTDBlQ2FEakVIMlFFcjREd1NyZXp3REZvL0J5Vng1RWR5bVdr?=
 =?utf-8?B?U2FWNlFiZnRwcTJxMWlmU2hGMXVuaXd5K1ZUZHh0OC9PRXVDY2VNTURvZ2pi?=
 =?utf-8?B?TnZmemUzRkVxdlRJVGswdGQ1QWVYVkxDSDFhSlRxRVlSUkM0amc3Y0JWeSts?=
 =?utf-8?B?NU12TkN5RDdlVGdyN2k0QVRNalY3RHM5ajQrYVJRSVYzQldFdE1zdXI1bmxw?=
 =?utf-8?B?T2dGU3cxL25ZVmhjK1pndlRJbmVEQ2tycU0rL2NaTVJGNVB1WDNhMktnWTRl?=
 =?utf-8?B?S05IRHFubkEwY2ZwYnVnQW42U08zdHB2K2M3eDFXSFFpREZEanZCYTd3bFMy?=
 =?utf-8?B?MFJKL2dKbzlrdW1wZks4UC9yV1JGR0tXRFJPbWI5d3VvNk1nMld4Smw0TUpY?=
 =?utf-8?B?T21RUDdTYlJ1eVppaWduZ2ViRUhLZFVpaWhmazZFUm9iaVl5ZVFlM0Vaa2NE?=
 =?utf-8?B?dlRCREVsV1NubFBuTzBCaTl5dnBRa2Q2WlVMbnh3Qmllb0ZBL3NiUlVDejAw?=
 =?utf-8?B?bnlxQnJSbzdRMFUvUjhsNHJJOFQwVGZmY1pUc0VzQ3ZBVkEvUjNjQnpuNm5j?=
 =?utf-8?B?a3E5KzlKNGQ3QkFmOWgvNnd2b3d2eDErN2tKRmxqS0JOQ09CSlI3TkNQZEQ4?=
 =?utf-8?B?VnIraW9YOXM2c2dtQWd1T2xYeUl0L2VXNS95NjQ2NGE5N3lWeHNxbnFnV1Qv?=
 =?utf-8?B?RmRaeFd2Ui9IckhCaHVwOE12dVRzZzk5dkNJc01hUStGdXRSTVR2eGZOR043?=
 =?utf-8?B?YnlxcjFpSUhxdVEwV2VYUmdKQ1hTMWtHczQ2R05EcmNPZDJxcnhPL21zZnBT?=
 =?utf-8?B?RFJXWmErSTY5d3ppNDNyTjRhVEprUlJqelBBNzl4TFQ3dndHSTZtODF0bDl4?=
 =?utf-8?B?cDFVVThPOXpuVFp1MzdlOVdIbWMwdzBldkEzc3pTVmVJN0xkR29CaTkwSTdT?=
 =?utf-8?B?NHRkWkp0NVB3eXFBMmhMTzJUYld1bHlFS1FWSWIvc2J6cVp0UXA1OTFZdHh1?=
 =?utf-8?B?OGhwZjNzSDZMNFJDVldUbitlMzhSYUJ4UndmY3dKeGpEQlI0eTIzUXhvVi9T?=
 =?utf-8?B?ZVRESlNwK1Z1dnBNNGNYc0V0SjFveU1RbEgra09QcjNkc3FOa1JueUFtSWk0?=
 =?utf-8?B?eEEwL2VZRmZKdVFSa2M3dUI0NzBoeDZDUmRWZDJOQ0VyTXB6cDA4UEU5QWtH?=
 =?utf-8?B?eU4xNzFvZFVJSlE3L3BQZmNDYTdnOHZraEZDZjdnU2JqT0VNYThDUzRNbDhG?=
 =?utf-8?B?MWxlMUJUbG5BN1dGcTRDVTFPNm1RPT0=?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92a6f5e-bf07-4e2e-e868-08dd4fcf49cc
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 03:49:48.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZgNnkyqELS7guemJ3/1DOLf+9vJeTeiokll6XDbXemQvkbXgUi0+BUg3h/gD0OMWur7NPaFiqmvvCzgDNDxpH/BScYYhvFxFVLtHhOo9+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1524
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7mEfekkbotIezP92d-W_bNH5eUgEWTm2SbihR_C1nLA_1739850589
X-Mimecast-Originator: toradex.com
Content-Type: multipart/mixed; boundary="------------j5m8ZfWeHoMX3vpliPLDyzBP"
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 03:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211561

--------------j5m8ZfWeHoMX3vpliPLDyzBP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

> This message originated from outside your organization
>=20
> On 2/17/25 11:34 AM, Quentin Schulz wrote:
>  > +Cc Marek
>=20
> Hi,

Thanks for the quick answer!

>=20
>  > On 2/16/25 7:36 PM, Rogerio Guerra Borin via lists.openembedded.org=20
> wrote:
>  >> You don't often get email from
>  >> rogerio.borin=3Dtoradex.com@lists.openembedded.org. Learn why this is
>  >> important<https://aka.ms/LearnAboutSenderIdentification=20
> <https://aka.ms/LearnAboutSenderIdentification>>
>  >> Hello,
>  >>
>  >> At Toradex we're using class "kernel-fitimage" to produce our signed
>  >> kernel FIT images and we've found that the recent commit d7bd9c627661
>  >> ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE
>  >> and UBOOT_ENV enabled") broke our builds. The logs of a failed build
>  >> show the following message that I found noteworthy:
>=20
> Can you mail me the entire log file for completeness ?

Sure.

I've added it as attachment (log.do_uboot_assemble_fitimage.841485).

>  >> log.do_uboot_assemble_fitimage.841485:
>  >> ...
>  >> Couldn't open RSA private key: '/secboot-data/fit-keys/dev2.key': No
>  >> such file or directory
>  >>
>  >> The odd thing was that the build was setting:
>  >>
>  >> UBOOT_SIGN_KEYNAME =3D "dev"
>  >> UBOOT_SIGN_IMG_KEYNAME =3D "dev2"
>  >> FIT_SIGN_INDIVIDUAL =3D "0"
>  >> FIT_GENERATE_KEYS =3D "0"
>=20
> FIT_SIGN_INDIVIDUAL =3D "0" is correct, you do want to sign
> configurations, not individual images in the fitImage, because signing
> individual images is susceptible to mix-and-match attack.
>=20
>  >> =C2=A0From the above we see the individual images signing is disabled=
 but
>  >> the system is trying to access the key file for the individual signin=
g
>  >> (dev2) regardless of that. Checking the code in uboot-sign.bbclass I
>  >> found this line:
>  >>
>  >> https://git.openembedded.org/openembedded-core/tree/meta/classes-=20
> <https://git.openembedded.org/openembedded-core/tree/meta/classes->
>  >> recipe/uboot-sign.bbclass?h=3Dscarthgap#n116
>  >>
>  >> that is responsible for that access (inside function concat_dtb()).
>  >> The code is always referencing variable UBOOT_SIGN_IMG_KEYNAME
>  >> regardless of FIT_SIGN_INDIVIDUAL being set to "1" or "0" even though
>  >> there's a condition a couple lines above L116 where
>  >> FIT_SIGN_INDIVIDUAL is tested to decide in which mode to run the
>  >> signing tool.
>=20
> Uh, good find, does the following patch fix your problem ?
>=20
> """
> diff --git a/meta/classes-recipe/uboot-sign.bbclass
> b/meta/classes-recipe/uboot-sign.bbclass
> index 96c47ab016..74ef5697ca 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -107,13 +107,16 @@ concat_dtb() {
> # makes fitImage susceptible to mix-and-match attack.
> if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
> UBOOT_MKIMAGE_MODE=3D"auto"
> + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}
> + else
> + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}
> fi
> ${UBOOT_MKIMAGE_SIGN} \
> ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -f $UBOOT_MKIMAGE_MODE \
> -k "${UBOOT_SIGN_KEYDIR}" \
> -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> - -g "${UBOOT_SIGN_IMG_KEYNAME}" \
> + -g "$UBOOT_MKIMAGE_KEYNAME" \
> -K "${UBOOT_DTB_BINARY}" \
> -d /dev/null \
> -r ${B}/unused.itb \
> """

Looking at the patch I'm pretty sure it would solve my problem,=20
particularly because we set FIT_SIGN_INDIVIDUAL=3D"0" in our builds.=20
However, I see it keeps the concept of the signing being either on the=20
config or on the individual images, which I wanted to further comment=20
down below.

>  >> To better understand the behavior I created dev2.
>  >> {key,crt} files and retried a build which worked. However, checking
>  >> the contents of the final u-boot.dtb file I found that the "dev2" key
>  >> node was present but the "dev" key wasn't. Then, checking the content=
s
>  >> of the final fitImage I noticed the configuration nodes were signed b=
y
>  >> the dev key while the individual images were not signed (as expected)=
.
>  >> But that means such a system wouldn't boot since the required "dev"
>  >> key is not present in the U-Boot DTB, from what I conclude the FIT
>  >> signing is broken at the moment.
>  >>
>  >> So, first of all I wanted to let you guys know about this issue
>  >> (hoping we're not doing anything wrong with our builds).
>=20
> No, your builds are fine, this is a real bug.

Thanks for the confirmation.

>  >> As a second point, I wanted to confirm the expected behavior regardin=
g
>  >> variable FIT_SIGN_INDIVIDUAL. According to the documentation:
>  >>
>  >> https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-=
=20
> <https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term->
>  >> FIT_SIGN_INDIVIDUAL
>  >>
>  >> when its value is "1" the individual images will be signed *in
>  >> addition* to the FIT image being signed.
>=20
> That is a bit weird and no, I don't think that is how it is supposed to
> work.
>=20
> FIT_SIGN_INDIVIDUAL=3D1 -> only image subnodes in fitImage /images nodes
> are signed AND fitImage is susceptible to mix-and-match attack
> (basically attacker can replace individual signed images in fitImage
> with different individual signed images, e.g. with older versions, to
> achieve a combination of images which allows them to somehow break the
> system).
>=20
> FIT_SIGN_INDIVIDUAL=3D0 (recommended) -> images are hashed, configuration=
s
> are hashed, hashes are combined and signed. Because images and
> configurations (which images are to be used together) are signed,
> attacker cannot mix-and-match images into an un-allowed configuration.
>=20
>  >> From that, I understand that
>  >> the configurations will be always signed and the individual images ma=
y
>  >> or may not be signed depending on FIT_SIGN_INDIVIDUAL.
>=20
> The other way around. The configurations are signed by default, which is
> good, but this can be disabled if needed (unlikely).
>=20
>  >> I kind of
>  >> confirmed this behavior by checking our build artifacts on kirkstone:
>  >> with FIT_SIGN_INDIVIDUAL=3D"0" the U-Boot DTB has only the "dev" key =
and
>  >> the fit image is signed by that same key; with FIT_SIGN_INDIVIDUAL=3D=
"1"
>  >> both keys are present in the DTB, the configurations are signed by th=
e
>  >> "dev" key and the images by the "dev2" key. I understand this is the
>  >> correct behavior, right?
>=20
> Images shouldn't be signed by different keys than configurations, that
> is a bit odd.
>=20
>  >> I'm asking because looking at the comment at:
>  >>
>  >> https://git.openembedded.org/openembedded-core/tree/meta/classes-=20
> <https://git.openembedded.org/openembedded-core/tree/meta/classes->
>  >> recipe/uboot-sign.bbclass?h=3Dscarthgap#n106
>  >>
>  >> it gives me the impression that FIT_SIGN_INDIVIDUAL would select
>  >> between either signing individual images
>=20
> Yes
>=20
>  >> or signing the
>  >> configurations
>=20
> Signed configuration also includes hash of the images that the
> configuration references in it, that's what prevents the mix-and-match
> attack.
>=20
>  >> , which doesn't match the documented behavior. I believe
>  >> the code in concat_dtb() also seems to assume only one of the keys
>  >> (dev/dev2) would need be present in the DTB. So the fix would involve
>  >> a review on this as well I imagine.
> IIRC Adrian was looking into improving those docs.

Regarding this second topic, let me show you some other information I=20
gathered from a couple of builds that may help with your assessment:

FSI :=3D FIT_SIGN_INDIVIDUAL
CFG :=3D Whether or not the configurations inside the FIT image were signed
IMG :=3D Whether or not the subimages inside the FIT image were signed

| Branch    | Version       | FSI | Keys inside DTB  | CFG | IMG |
|-----------+---------------+-----+------------------+-----+-----|
| kirkstone | latest        | "0" | {dev}            | Y   | N   |
| kirkstone | latest        | "1" | {dev,dev2}       | Y   | Y   |
|-----------+---------------+-----+------------------+-----+-----|
| scarthgap | latest        | "0" | Build failed (!) | n/a | n/a |
|           | + dummy dev2  |     | {dev2}           | Y   | N   |
| scarthgap | latest        | "1" | {dev2} (!)       | Y   | Y   |
|-----------+---------------+-----+------------------+-----+-----|
| scarthgap | w/o @d7bd9c62 | "0" | {dev}            | Y   | N   |
| scarthgap | w/o @d7bd9c62 | "1" | {dev,dev2}       | Y   | Y   |

The first two lines show that on kirkstone when FIT_SIGN_INDIVIDUAL=3D"0"=
=20
only the configurations are signed and the DTB contains only the "dev"=20
key. When FIT_SIGN_INDIVIDUAL=3D"1" both "dev" and "dev2" are present in=20
the DTB and both the configurations and the images are signed. And=20
that's the exact same behavior I got on scarthgap after reverting the=20
commit d7bd9c62. And, as I said, this seems to match the documentation.
I've attached snippets of the fdtdump for the FIT image and U-Boot DTB=20
from my build on kirkstone to illustrate what I said.

So, if the expected behavior is according to what you described then the=20
behavior so far was wrong (for a long time) and the new behavior is=20
introducing a breaking change for anyone relying on what's documented=20
for the FIT_SIGN_INDIVIDUAL=3D"1" case, right? Btw, for us at Toradex this=
=20
is not a big deal because we don't fall into that case but considering=20
the general use of the layer the change in behavior could be an issue.

Another piece of information that might be useful: I made a change to=20
concat_dtb() to make it add both keys (dev/dev2) to the DTB (by invoking=20
mkimage twice) and I found the invocation to "uboot-fit_check_sign"=20
failed afterwards. I confirmed that the DTB had the two keys, but=20
because the FIT image only had the configurations signed, the tool threw=20
an error saying the signature of "require key dev2" could not be=20
verified but the showed that the check of the "dev" key succeeded.=20
Unfortunately I don't have the logs available for that case, but I could=20
repeat the tests if needed. Anyway, my point is that the=20
"uboot-fit_check_sign" tool seems capable of checking both keys as well.

Interestingly, if I removed the verification step (performed on the=20
"unused.itb" file), then the image generation succeeded and everything=20
seemed to work as before both when FIT_SIGN_INDIVIDUAL is "0" or "1".
So, it's not hard to get the old behavior, though we'd need to figure=20
out how to properly do the verification when mkimage is invoked with -f=20
"auto" or -f "auto-conf". I could post my unfinished patch if helpful.

--------------j5m8ZfWeHoMX3vpliPLDyzBP
Content-Type: text/plain; charset=UTF-8; 
	name=log.do_uboot_assemble_fitimage.841485
Content-Disposition: attachment;
 filename="log.do_uboot_assemble_fitimage.841485"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb191Ym9vdF9hc3NlbWJsZV9maXRpbWFn
ZQpDb3VsZG4ndCBvcGVuIFJTQSBwcml2YXRlIGtleTogJy9zZWNib290LWRhdGEvZml0LWtleXMv
ZGV2Mi5rZXknOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CkZhaWxlZCB0byBzaWduICdzaWdu
YXR1cmUnIHNpZ25hdHVyZSBub2RlIGluICdjb25mLTEnIGNvbmYgbm9kZQpGSVQgZGVzY3JpcHRp
b246IEtlcm5lbCBJbWFnZSBpbWFnZSB3aXRoIG9uZSBvciBtb3JlIEZEVCBibG9icwpDcmVhdGVk
OiAgICAgICAgIFRodSBKYW4gIDEgMDA6MDA6MDAgMTk3MAogSW1hZ2UgMCAoa2VybmVsLTEpCiAg
RGVzY3JpcHRpb246CiAgQ3JlYXRlZDogICAgICBUaHUgSmFuICAxIDAwOjAwOjAwIDE5NzAKICBU
eXBlOiAgICAgICAgIEtlcm5lbCBJbWFnZQogIENvbXByZXNzaW9uOiAgZ3ppcCBjb21wcmVzc2Vk
CiAgRGF0YSBTaXplOiAgICAwIEJ5dGVzID0gMC4wMCBLaUIgPSAwLjAwIE1pQgogIEFyY2hpdGVj
dHVyZTogUG93ZXJQQwogIE9TOiAgICAgICAgICAgTGludXgKICBMb2FkIEFkZHJlc3M6IDB4MDAw
MDAwMDAKICBFbnRyeSBQb2ludDogIDB4MDAwMDAwMDAKICBIYXNoIGFsZ286ICAgIHNoYTEKICBI
YXNoIHZhbHVlOiAgIGRhMzlhM2VlNWU2YjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkKIERl
ZmF1bHQgQ29uZmlndXJhdGlvbjogJ2NvbmYtMScKIENvbmZpZ3VyYXRpb24gMCAoY29uZi0xKQog
IERlc2NyaXB0aW9uOiAgdW5hdmFpbGFibGUKICBLZXJuZWw6ICAgICAgIGtlcm5lbC0xCiAgU2ln
biBhbGdvOiAgICBzaGEyNTYscnNhMjA0ODpkZXYyCiAgU2lnbiB2YWx1ZTogICB1bmF2YWlsYWJs
ZQogIFRpbWVzdGFtcDogICAgdW5hdmFpbGFibGUKU2lnbmF0dXJlIHdyaXR0ZW4gdG8gJy93b3Jr
ZGlyL2J1aWxkLXZlcmRpbi1pbXg4bW0tc2VjL3RtcC93b3JrL3ZlcmRpbl9pbXg4bW0tdGR4LWxp
bnV4L3UtYm9vdC10b3JhZGV4LzIwMjQuMDcvdS1ib290LXRvcmFkZXgtMjAyNC4wNy91bnVzZWQu
aXRiJywgbm9kZSAnL2NvbmZpZ3VyYXRpb25zL2NvbmYtMS9zaWduYXR1cmUnClB1YmxpYyBrZXkg
d3JpdHRlbiB0byAndS1ib290LmR0YicsIG5vZGUgJy8nClZlcmlmeWluZyBIYXNoIEludGVncml0
eSBmb3Igbm9kZSAnY29uZi0xJy4uLiBWZXJpZmllZCBPSywgbG9hZGluZyBpbWFnZXMKIyMgTG9h
ZGluZyBrZXJuZWwgZnJvbSBGSVQgSW1hZ2UgYXQgN2YyNzU3ZjFjMDAwIC4uLgogICBVc2luZyAn
Y29uZi0xJyBjb25maWd1cmF0aW9uCiAgIFZlcmlmeWluZyBIYXNoIEludGVncml0eSAuLi4KT0sK
CiAgIFRyeWluZyAna2VybmVsLTEnIGtlcm5lbCBzdWJpbWFnZQogICAgIERlc2NyaXB0aW9uOgog
ICAgIENyZWF0ZWQ6ICAgICAgVGh1IEphbiAgMSAwMDowMDowMCAxOTcwCiAgICAgVHlwZTogICAg
ICAgICBLZXJuZWwgSW1hZ2UKICAgICBDb21wcmVzc2lvbjogIGd6aXAgY29tcHJlc3NlZAogICAg
IERhdGEgU2l6ZTogICAgMCBCeXRlcyA9IDAuMDAgS2lCID0gMC4wMCBNaUIKICAgICBBcmNoaXRl
Y3R1cmU6IFBvd2VyUEMKICAgICBPUzogICAgICAgICAgIExpbnV4CiAgICAgTG9hZCBBZGRyZXNz
OiAweDAwMDAwMDAwCiAgICAgRW50cnkgUG9pbnQ6ICAweDAwMDAwMDAwCiAgICAgSGFzaCBhbGdv
OiAgICBzaGExCiAgICAgSGFzaCB2YWx1ZTogICBkYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYw
MTg5MGFmZDgwNzA5CiAgIFZlcmlmeWluZyBIYXNoIEludGVncml0eSAuLi4Kc2hhMSsKT0sKCiAg
IERlY3J5cHRpbmcgRGF0YSAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApPSwoKICAgVW5jb21wcmVzc2lu
ZyBLZXJuZWwgSW1hZ2UKVW5pbXBsZW1lbnRlZCBjb21wcmVzc2lvbiB0eXBlIDEKIyMgTG9hZGlu
ZyBmZHQgZnJvbSBGSVQgSW1hZ2UgYXQgN2YyNzU3ZjFjMDAwIC4uLgogICBVc2luZyAnY29uZi0x
JyBjb25maWd1cmF0aW9uCiAgIFZlcmlmeWluZyBIYXNoIEludGVncml0eSAuLi4KT0sKCkNvdWxk
IG5vdCBmaW5kIHN1YmltYWdlIG5vZGUgdHlwZSAnZmR0JwojIyBMb2FkaW5nIHJhbWRpc2sgZnJv
bSBGSVQgSW1hZ2UgYXQgN2YyNzU3ZjFjMDAwIC4uLgogICBVc2luZyAnY29uZi0xJyBjb25maWd1
cmF0aW9uCiAgIFZlcmlmeWluZyBIYXNoIEludGVncml0eSAuLi4KT0sKCkNvdWxkIG5vdCBmaW5k
IHN1YmltYWdlIG5vZGUgdHlwZSAncmFtZGlzaycKU2lnbmF0dXJlIGNoZWNrIE9LCkRFQlVHOiBS
ZS1nZW5lcmF0aW5nIGZsYXNoLmJpbiB3aXRoIGFuIHVwZGF0ZWQgRFRCCkVycm9yIGF0ICcvc2ln
bmF0dXJlJzogRkRUX0VSUl9OT1RGT1VORApFcnJvciBhdCAnL3NpZ25hdHVyZSc6IEZEVF9FUlJf
Tk9URk9VTkQKV0FSTklORzogL3dvcmtkaXIvYnVpbGQtdmVyZGluLWlteDhtbS1zZWMvdG1wL3dv
cmsvdmVyZGluX2lteDhtbS10ZHgtbGludXgvdS1ib290LXRvcmFkZXgvMjAyNC4wNy90ZW1wL3J1
bi5kb191Ym9vdF9hc3NlbWJsZV9maXRpbWFnZS44NDE0ODU6MjUzIGV4aXQgMSBmcm9tICcvd29y
a2Rpci9idWlsZC12ZXJkaW4taW14OG1tLXNlYy90bXAvd29yay92ZXJkaW5faW14OG1tLXRkeC1s
aW51eC91LWJvb3QtdG9yYWRleC8yMDI0LjA3L2lteDhtX2NvcHlfc2lnbmF0dXJlX25vZGVfdG9f
ZmR0cy5zaCAidS1ib290LmR0Yi1zaWduZWQiJwpXQVJOSU5HOiBCYWNrdHJhY2UgKEJCIGdlbmVy
YXRlZCBzY3JpcHQpOgogICAgICAgICMxOiBjb25jYXRfZHRiLCAvd29ya2Rpci9idWlsZC12ZXJk
aW4taW14OG1tLXNlYy90bXAvd29yay92ZXJkaW5faW14OG1tLXRkeC1saW51eC91LWJvb3QtdG9y
YWRleC8yMDI0LjA3L3RlbXAvcnVuLmRvX3Vib290X2Fzc2VtYmxlX2ZpdGltYWdlLjg0MTQ4NSwg
bGluZSAyNTMKICAgICAgICAjMjogdWJvb3RfYXNzZW1ibGVfZml0aW1hZ2VfaGVscGVyLCAvd29y
a2Rpci9idWlsZC12ZXJkaW4taW14OG1tLXNlYy90bXAvd29yay92ZXJkaW5faW14OG1tLXRkeC1s
aW51eC91LWJvb3QtdG9yYWRleC8yMDI0LjA3L3RlbXAvcnVuLmRvX3Vib290X2Fzc2VtYmxlX2Zp
dGltYWdlLjg0MTQ4NSwgbGluZSAxODIKICAgICAgICAjMzogZG9fdWJvb3RfYXNzZW1ibGVfZml0
aW1hZ2UsIC93b3JrZGlyL2J1aWxkLXZlcmRpbi1pbXg4bW0tc2VjL3RtcC93b3JrL3ZlcmRpbl9p
bXg4bW0tdGR4LWxpbnV4L3UtYm9vdC10b3JhZGV4LzIwMjQuMDcvdGVtcC9ydW4uZG9fdWJvb3Rf
YXNzZW1ibGVfZml0aW1hZ2UuODQxNDg1LCBsaW5lIDE2OAogICAgICAgICM0OiBtYWluLCAvd29y
a2Rpci9idWlsZC12ZXJkaW4taW14OG1tLXNlYy90bXAvd29yay92ZXJkaW5faW14OG1tLXRkeC1s
aW51eC91LWJvb3QtdG9yYWRleC8yMDI0LjA3L3RlbXAvcnVuLmRvX3Vib290X2Fzc2VtYmxlX2Zp
dGltYWdlLjg0MTQ4NSwgbGluZSA0ODAK
--------------j5m8ZfWeHoMX3vpliPLDyzBP
Content-Type: text/plain; charset=UTF-8; name=fdtdump-kirkstone-fitImage.txt
Content-Disposition: attachment; filename="fdtdump-kirkstone-fitImage.txt"
Content-Transfer-Encoding: base64

ZGVwbG95L2ltYWdlcy92ZXJkaW4taW14OG1tL2ZpdEltYWdlOiBmb3VuZCBmZHQgYXQgb2Zmc2V0
IDAKL2R0cy12MS87Ci8vIG1hZ2ljOgkJMHhkMDBkZmVlZAovLyB0b3RhbHNpemU6CQkweGQ1NzJj
ZSAoMTM5ODg1NTgpCi8vIG9mZl9kdF9zdHJ1Y3Q6CTB4MzgKLy8gb2ZmX2R0X3N0cmluZ3M6CTB4
ZDU1Y2Y4Ci8vIG9mZl9tZW1fcnN2bWFwOgkweDI4Ci8vIHZlcnNpb246CQkxNwovLyBsYXN0X2Nv
bXBfdmVyc2lvbjoJMTYKLy8gYm9vdF9jcHVpZF9waHlzOgkweDAKLy8gc2l6ZV9kdF9zdHJpbmdz
OgkweGM1Ci8vIHNpemVfZHRfc3RydWN0OgkweGQ1NWNjMAoKLyB7CiAgICB0aW1lc3RhbXAgPSA8
MHgwMDAwMDAwMD47CiAgICBkZXNjcmlwdGlvbiA9ICJLZXJuZWwgZml0SW1hZ2UgZm9yIFRvcml6
b25Db3JlLzUuMTUuMTQ4K2dpdEFVVE9JTkMrYzhkZjY0NjZlOV8wYjAyYmUxNGEwL3ZlcmRpbi0K
ICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDAwMDAwMDE+OwogICAgaW1hZ2VzIHsKICAgICAgICBr
ZXJuZWwtMSB7CiAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIkxpbnV4IGtlcm5lbCI7CiAgICAg
ICAgICAgIGRhdGEgPSA8MHgxZjhiMDgwOCAweGY4ZjFiMzY3IDB4MDIwMzZjNjkgMHg2ZTc1Nzgy
ZSAweDYyNjk2ZTAwIDB4ZWM5YzdiNzQgMHgxNDU1OWVjNyAweDcKICAgICAgICAgICAgdHlwZSA9
ICJrZXJuZWwiOwogICAgICAgICAgICBhcmNoID0gImFybTY0IjsKICAgICAgICAgICAgb3MgPSAi
bGludXgiOwogICAgICAgICAgICBjb21wcmVzc2lvbiA9ICJnemlwIjsKICAgICAgICAgICAgbG9h
ZCA9IDwweDQ4MjAwMDAwPjsKICAgICAgICAgICAgZW50cnkgPSA8MHg0ODIwMDAwMD47CiAgICAg
ICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDcwYmFkYmNhIDB4OWM2
YTZhYTkgMHg3MTM4ZWRlYiAweGI2ZmIwZTBmIDB4NDg4MmZjYWIgMHgwOWEzYzQyMSAweDBiNGU5
OTEKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAg
ICAgICAgc2lnbmF0dXJlLTEgewogICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAw
MDA+OwogICAgICAgICAgICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAg
ICAgICAgICBzaWduZXItbmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0g
PDB4YTNkZjJmZWQgMHgzYzI5YmM5ZCAweGI5ZTZiODc1IDB4NjY1M2E3MzkgMHg2MDg5MmQxZiAw
eDdlZTE5NzcxIDB4NzIyOTc0NQogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0
OCI7CiAgICAgICAgICAgICAgICBrZXktbmFtZS1oaW50ID0gImRldjIiOwogICAgICAgICAgICB9
OwogICAgICAgIH07CiAgICAgICAgZmR0LWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLW5vbndpZmkt
ZGFobGlhLmR0YiB7CiAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIkZsYXR0ZW5lZCBEZXZpY2Ug
VHJlZSBibG9iIjsKICAgICAgICAgICAgZGF0YSA9IFtkMCAwZCBmZSBlZCAwMCAwMSAwNSA0OSAw
MCAwMCAwMCAzOCAwMCAwMCBlZiA4NCAwMCAwMCAwMCAyOCAwMCAwMCAwMCAxMSAwMCAwMCAwMAog
ICAgICAgICAgICB0eXBlID0gImZsYXRfZHQiOwogICAgICAgICAgICBhcmNoID0gImFybTY0IjsK
ICAgICAgICAgICAgY29tcHJlc3Npb24gPSAibm9uZSI7CiAgICAgICAgICAgIGxvYWQgPSA8MHg1
MDIwMDAwMD47CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDww
eGUyYmFjYzVmIDB4ODQxNWRlY2YgMHg4N2M3ZGVkZSAweGM3NzkxZmY1IDB4Njg0YmRjMGUgMHhi
YjNjNmViYyAweGEwYTI0MmYKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAg
ICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0dXJlLTEgewogICAgICAgICAgICAgICAgdGltZXN0
YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAgICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAy
Mi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXItbmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAg
ICAgICAgIHZhbHVlID0gPDB4MTkzZTIxMDkgMHgwZmUzMzJkNCAweDA4YWIwNTVkIDB4Y2FkYzMx
ODQgMHg4MTIzZGIyNyAweDEyYjMzNTlkIDB4YzYwNmRiZAogICAgICAgICAgICAgICAgYWxnbyA9
ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAgICAgICBrZXktbmFtZS1oaW50ID0gImRldjIi
OwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICAgICAgZmR0LWZyZWVzY2FsZV9pbXg4bW0t
dmVyZGluLW5vbndpZmktZGV2LmR0YiB7CiAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIkZsYXR0
ZW5lZCBEZXZpY2UgVHJlZSBibG9iIjsKICAgICAgICAgICAgZGF0YSA9IFtkMCAwZCBmZSBlZCAw
MCAwMSAwMyAxMSAwMCAwMCAwMCAzOCAwMCAwMCBlZCA3MCAwMCAwMCAwMCAyOCAwMCAwMCAwMCAx
MSAwMCAwMCAwMAogICAgICAgICAgICB0eXBlID0gImZsYXRfZHQiOwogICAgICAgICAgICBhcmNo
ID0gImFybTY0IjsKICAgICAgICAgICAgY29tcHJlc3Npb24gPSAibm9uZSI7CiAgICAgICAgICAg
IGxvYWQgPSA8MHg1MDIwMDAwMD47CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAg
ICB2YWx1ZSA9IDwweDVlYzE4NjI2IDB4MGM4ZGE3OGUgMHg0MWQwNDQyMyAweDlmNTkwNjRmIDB4
ZTg4MDkzZTEgMHhjMmNjNzY5OSAweDc1N2Q4NzcKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hh
MjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0dXJlLTEgewogICAgICAgICAg
ICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAgICAgICAgc2lnbmVyLXZl
cnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXItbmFtZSA9ICJta2ltYWdl
IjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4NmM2YWZkZmYgMHg0NjA4MmQ4ZSAweDllNTkw
MjFlIDB4ODk3OWNkYzUgMHgxOTY0YTRkMiAweGViNzdiM2UzIDB4NGI1YTM2ZAogICAgICAgICAg
ICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAgICAgICBrZXktbmFtZS1o
aW50ID0gImRldjIiOwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICAgICAgZmR0LWZyZWVz
Y2FsZV9pbXg4bW0tdmVyZGluLW5vbndpZmktbWFsbG93LmR0YiB7CiAgICAgICAgICAgIGRlc2Ny
aXB0aW9uID0gIkZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIjsKICAgICAgICAgICAgZGF0YSA9
IFtkMCAwZCBmZSBlZCAwMCAwMSAwMiBlMiAwMCAwMCAwMCAzOCAwMCAwMCBlZSA0OCAwMCAwMCAw
MCAyOCAwMCAwMCAwMCAxMSAwMCAwMCAwMAogICAgICAgICAgICB0eXBlID0gImZsYXRfZHQiOwog
ICAgICAgICAgICBhcmNoID0gImFybTY0IjsKICAgICAgICAgICAgY29tcHJlc3Npb24gPSAibm9u
ZSI7CiAgICAgICAgICAgIGxvYWQgPSA8MHg1MDIwMDAwMD47CiAgICAgICAgICAgIGhhc2gtMSB7
CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDNmYTI1ZmMxIDB4ZjdkMGI5OWEgMHgzMzBmNDMy
OCAweGNmOTg5ZGFhIDB4MWVjYTM4M2UgMHg2ODBhODUyYiAweGZhMWQ2MjUKICAgICAgICAgICAg
ICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0dXJl
LTEgewogICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAg
ICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXIt
bmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4MWQxODJkMmQgMHgw
Y2I1YzkyZiAweDFmNzRkNWQ3IDB4Yzg5ZWEyZDYgMHhkNWM5YjM4NCAweGE2ZTQ3MGRkIDB4OTQ1
NTI0MgogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAg
ICAgICBrZXktbmFtZS1oaW50ID0gImRldjIiOwogICAgICAgICAgICB9OwogICAgICAgIH07CiAg
ICAgICAgZmR0LWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLW5vbndpZmkteWF2aWEuZHRiIHsKICAg
ICAgICAgICAgZGVzY3JpcHRpb24gPSAiRmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2IiOwogICAg
ICAgICAgICBkYXRhID0gW2QwIDBkIGZlIGVkIDAwIDAxIDAyIGVkIDAwIDAwIDAwIDM4IDAwIDAw
IGVlIDU0IDAwIDAwIDAwIDI4IDAwIDAwIDAwIDExIDAwIDAwIDAwCiAgICAgICAgICAgIHR5cGUg
PSAiZmxhdF9kdCI7CiAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAgICBjb21w
cmVzc2lvbiA9ICJub25lIjsKICAgICAgICAgICAgbG9hZCA9IDwweDUwMjAwMDAwPjsKICAgICAg
ICAgICAgaGFzaC0xIHsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4NDFkZTQ1NDIgMHg5ZmYy
ZWM2YiAweDI5YmQ5M2UxIDB4NmNlMWY2OTEgMHg0Nzc0ZmM0ZiAweDNlODNkZGVkIDB4NDVlY2U1
NQogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAg
ICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgwMDAwMDAw
MD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAgICAgICAg
ICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFsdWUgPSA8
MHg5NDViYzg2MCAweGMyZGNkOWZlIDB4MTY5ODZhOWEgMHg2ZjM0YmQ3ZSAweDdlODY4NTdjIDB4
N2YyMDRmYjcgMHhmYjFmNGViCiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4
IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2MiI7CiAgICAgICAgICAgIH07
CiAgICAgICAgfTsKICAgICAgICBmZHQtZnJlZXNjYWxlX2lteDhtbS12ZXJkaW4td2lmaS1kYWhs
aWEuZHRiIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiRmxhdHRlbmVkIERldmljZSBUcmVl
IGJsb2IiOwogICAgICAgICAgICBkYXRhID0gW2QwIDBkIGZlIGVkIDAwIDAxIDA2IDE1IDAwIDAw
IDAwIDM4IDAwIDAwIGYwIDQ0IDAwIDAwIDAwIDI4IDAwIDAwIDAwIDExIDAwIDAwIDAwCiAgICAg
ICAgICAgIHR5cGUgPSAiZmxhdF9kdCI7CiAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAg
ICAgICAgICBjb21wcmVzc2lvbiA9ICJub25lIjsKICAgICAgICAgICAgbG9hZCA9IDwweDUwMjAw
MDAwPjsKICAgICAgICAgICAgaGFzaC0xIHsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4ZDhl
NDM0MDMgMHgwYzllZjZlMyAweGRhZjcwMDRkIDB4MmRmYjIyMjMgMHg0OTUzYmUyMCAweDA3Y2Jl
NTlkIDB4M2JkYjM0YwogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAg
ICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICB0aW1lc3RhbXAg
PSA8MHgwMDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAx
IjsKICAgICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAg
ICAgdmFsdWUgPSA8MHgzOTU5ZDI5MSAweDkwNzE4NTUwIDB4MWIxZjJiYTkgMHhlYTQ2NmM0MCAw
eDMzYjg5ODY5IDB4OTExMGRlZTUgMHg4YmI1MWU5CiAgICAgICAgICAgICAgICBhbGdvID0gInNo
YTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2MiI7CiAg
ICAgICAgICAgIH07CiAgICAgICAgfTsKICAgICAgICBmZHQtZnJlZXNjYWxlX2lteDhtbS12ZXJk
aW4td2lmaS1kZXYuZHRiIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiRmxhdHRlbmVkIERl
dmljZSBUcmVlIGJsb2IiOwogICAgICAgICAgICBkYXRhID0gW2QwIDBkIGZlIGVkIDAwIDAxIDAz
IGQ5IDAwIDAwIDAwIDM4IDAwIDAwIGVlIDJjIDAwIDAwIDAwIDI4IDAwIDAwIDAwIDExIDAwIDAw
IDAwCiAgICAgICAgICAgIHR5cGUgPSAiZmxhdF9kdCI7CiAgICAgICAgICAgIGFyY2ggPSAiYXJt
NjQiOwogICAgICAgICAgICBjb21wcmVzc2lvbiA9ICJub25lIjsKICAgICAgICAgICAgbG9hZCA9
IDwweDUwMjAwMDAwPjsKICAgICAgICAgICAgaGFzaC0xIHsKICAgICAgICAgICAgICAgIHZhbHVl
ID0gPDB4Y2U0Zjk5YmYgMHgzMTA2OTc0MyAweDllM2YxMWE4IDB4MTc5MDE5NzcgMHhiYzcwNzdh
NCAweDEwMjcwMjIxIDB4NzUwZGUyNwogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwog
ICAgICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICB0
aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9
ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAg
ICAgICAgICAgICAgdmFsdWUgPSA8MHg1YTA1OTI0OCAweDQ3NzU3ZTJkIDB4ZWEzNGRmNjggMHhj
MWRmOWU1MSAweDZiYjczOGY4IDB4MDZiNjE4YjcgMHhmMzk5ZTAwCiAgICAgICAgICAgICAgICBh
bGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAi
ZGV2MiI7CiAgICAgICAgICAgIH07CiAgICAgICAgfTsKICAgICAgICBmZHQtZnJlZXNjYWxlX2lt
eDhtbS12ZXJkaW4td2lmaS1tYWxsb3cuZHRiIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAi
RmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2IiOwogICAgICAgICAgICBkYXRhID0gW2QwIDBkIGZl
IGVkIDAwIDAxIDAzIGFlIDAwIDAwIDAwIDM4IDAwIDAwIGVmIDA4IDAwIDAwIDAwIDI4IDAwIDAw
IDAwIDExIDAwIDAwIDAwCiAgICAgICAgICAgIHR5cGUgPSAiZmxhdF9kdCI7CiAgICAgICAgICAg
IGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAgICBjb21wcmVzc2lvbiA9ICJub25lIjsKICAgICAg
ICAgICAgbG9hZCA9IDwweDUwMjAwMDAwPjsKICAgICAgICAgICAgaGFzaC0xIHsKICAgICAgICAg
ICAgICAgIHZhbHVlID0gPDB4YWNiMzI0OTMgMHgxMDIyNDYxMCAweDMwOGU0NTI5IDB4YTAyZWI0
OGQgMHhiNTc0ODc4NCAweDEyMzY2ZDM5IDB4NmVkZDZhMAogICAgICAgICAgICAgICAgYWxnbyA9
ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAg
ICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWdu
ZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1r
aW1hZ2UiOwogICAgICAgICAgICAgICAgdmFsdWUgPSA8MHg3NDI4YTIwMyAweDU3ZDhmN2YxIDB4
NDgzYWFhNDAgMHgzZTEwNWEwOSAweDg1ZGY4ZjI5IDB4NDBjYjI5NzkgMHgzNDg2Y2U0CiAgICAg
ICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1u
YW1lLWhpbnQgPSAiZGV2MiI7CiAgICAgICAgICAgIH07CiAgICAgICAgfTsKICAgICAgICBmZHQt
ZnJlZXNjYWxlX2lteDhtbS12ZXJkaW4td2lmaS15YXZpYS5kdGIgewogICAgICAgICAgICBkZXNj
cmlwdGlvbiA9ICJGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiI7CiAgICAgICAgICAgIGRhdGEg
PSBbZDAgMGQgZmUgZWQgMDAgMDEgMDMgYjUgMDAgMDAgMDAgMzggMDAgMDAgZWYgMTAgMDAgMDAg
MDAgMjggMDAgMDAgMDAgMTEgMDAgMDAgMDAKICAgICAgICAgICAgdHlwZSA9ICJmbGF0X2R0IjsK
ICAgICAgICAgICAgYXJjaCA9ICJhcm02NCI7CiAgICAgICAgICAgIGNvbXByZXNzaW9uID0gIm5v
bmUiOwogICAgICAgICAgICBsb2FkID0gPDB4NTAyMDAwMDA+OwogICAgICAgICAgICBoYXNoLTEg
ewogICAgICAgICAgICAgICAgdmFsdWUgPSA8MHg3Njc4OTNlNSAweDNlYWUwMTQ0IDB4OTZjNDY1
Y2QgMHhkZTUxYWRmZSAweGY5NTg3NWVmIDB4OTNkMzU5MGIgMHg4NzhmODhlCiAgICAgICAgICAg
ICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNpZ25hdHVy
ZS0xIHsKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAgICAgICAg
ICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAgc2lnbmVy
LW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDMxZTdmMmQxIDB4
NGRlMTg3MWMgMHhlOTMwNzc0NiAweGE2MWFmN2RhIDB4M2JiM2M4ODQgMHgyNTNmZTVlNyAweGU0
Y2RjMjYKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAgICAgICAg
ICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYyIjsKICAgICAgICAgICAgfTsKICAgICAgICB9Owog
ICAgICAgIGZkdC12ZXJkaW4taW14OG1tXzIwbWh6X2NhbjEuZHRibyB7CiAgICAgICAgICAgIGRl
c2NyaXB0aW9uID0gIkZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIjsKICAgICAgICAgICAgZGF0
YSA9IFtkMCAwZCBmZSBlZCAwMCAwMCAwMSA5NSAwMCAwMCAwMCBiOCAwMCAwMCAwMSA2YyAwMCAw
MCAwMCAyOCAwMCAwMCAwMCAxMSAwMCAwMCAwMAogICAgICAgICAgICB0eXBlID0gImZsYXRfZHQi
OwogICAgICAgICAgICBhcmNoID0gImFybTY0IjsKICAgICAgICAgICAgY29tcHJlc3Npb24gPSAi
bm9uZSI7CiAgICAgICAgICAgIGxvYWQgPSA8MHg1MDI0MDAwMD47CiAgICAgICAgICAgIGhhc2gt
MSB7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDA2NzY1MTkxIDB4MzJhZmE0MjkgMHg0YmU0
MDc2MCAweDIzOTVhNWM0IDB4OTNhM2VhZTAgMHhkOTUzZTE4NiAweGRkYTFkNTgKICAgICAgICAg
ICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0
dXJlLTEgewogICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAg
ICAgICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWdu
ZXItbmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4N2Y2OWIxMTYg
MHgyNmVmNjNlZiAweGRlMjJhMzMwIDB4NmQ5MzllNmUgMHg2YWY4NmQ5MCAweDc1MzZmYmE3IDB4
YjU3NDlkZgogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAg
ICAgICAgICBrZXktbmFtZS1oaW50ID0gImRldjIiOwogICAgICAgICAgICB9OwogICAgICAgIH07
CiAgICAgICAgZmR0LXZlcmRpbi1pbXg4bW1fZGlzYWJsZV9jYW4xLmR0Ym8gewogICAgICAgICAg
ICBkZXNjcmlwdGlvbiA9ICJGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiI7CiAgICAgICAgICAg
IGRhdGEgPSBbZDAgMGQgZmUgZWQgMDAgMDAgMDEgOTIgMDAgMDAgMDAgYjggMDAgMDAgMDEgNzQg
MDAgMDAgMDAgMjggMDAgMDAgMDAgMTEgMDAgMDAgMDAKICAgICAgICAgICAgdHlwZSA9ICJmbGF0
X2R0IjsKICAgICAgICAgICAgYXJjaCA9ICJhcm02NCI7CiAgICAgICAgICAgIGNvbXByZXNzaW9u
ID0gIm5vbmUiOwogICAgICAgICAgICBsb2FkID0gPDB4NTAyNDAwMDA+OwogICAgICAgICAgICBo
YXNoLTEgewogICAgICAgICAgICAgICAgdmFsdWUgPSA8MHg1ZWNkNGFkMSAweDEwNTA1NTU0IDB4
ODRlZGVmOWEgMHg4Mjc3ODVkYiAweGJkYTVjOGQ5IDB4YmY5MDA0MWYgMHg3OWI5YjYxCiAgICAg
ICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNp
Z25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAg
ICAgICAgICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAg
c2lnbmVyLW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDM2NGE1
OWNlIDB4MjkyNzVjYWUgMHg2NTQ2OWYzNiAweDg5NjlmM2E1IDB4ZjZjNjA5ZTAgMHhkOWRkMDFl
MCAweDA2MDRiZDEKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAg
ICAgICAgICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYyIjsKICAgICAgICAgICAgfTsKICAgICAg
ICB9OwogICAgICAgIGZkdC12ZXJkaW4taW14OG1tX2RzaS10by1oZG1pX292ZXJsYXkuZHRibyB7
CiAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIkZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIjsK
ICAgICAgICAgICAgZGF0YSA9IDwweGQwMGRmZWVkIDB4MDAwMDBhZjQgMHgwMDAwMDBiOCAweDAw
MDAwOTk4IDB4MDAwMDAwMjggMHgwMDAwMDAxMSAweDAwMDAwMDEwIDB4MAogICAgICAgICAgICB0
eXBlID0gImZsYXRfZHQiOwogICAgICAgICAgICBhcmNoID0gImFybTY0IjsKICAgICAgICAgICAg
Y29tcHJlc3Npb24gPSAibm9uZSI7CiAgICAgICAgICAgIGxvYWQgPSA8MHg1MDI0MDAwMD47CiAg
ICAgICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweGE0ODAxOGJjIDB4
NDJiYzc4ZDIgMHhjMzhiMzc3MyAweGVhMzU5ZGYyIDB4M2ZmZjBiNDggMHhlMjIyMmQ2OSAweGFk
OWI2MTUKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAg
ICAgICAgICAgc2lnbmF0dXJlLTEgewogICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAw
MDAwMDA+OwogICAgICAgICAgICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAg
ICAgICAgICAgICBzaWduZXItbmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVl
ID0gPDB4OWRlZWMwODQgMHhhMTNlNjA1NSAweDQxZDhmZTcwIDB4YzU1MzFkZmQgMHgwMzUzZGVk
MSAweDhkNmE4NDU5IDB4YzlkNzdiMgogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNh
MjA0OCI7CiAgICAgICAgICAgICAgICBrZXktbmFtZS1oaW50ID0gImRldjIiOwogICAgICAgICAg
ICB9OwogICAgICAgIH07CiAgICAgICAgZmR0LXZlcmRpbi1pbXg4bW1fZHNpLXRvLWx2ZHNfcGFu
ZWwtY2FwLXRvdWNoLTEwaW5jaC1sdmRzX292ZXJsYXkuZHRibyB7CiAgICAgICAgICAgIGRlc2Ny
aXB0aW9uID0gIkZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIjsKICAgICAgICAgICAgZGF0YSA9
IFtkMCAwZCBmZSBlZCAwMCAwMCAwZiAwNiAwMCAwMCAwMCBiOCAwMCAwMCAwZCAwOCAwMCAwMCAw
MCAyOCAwMCAwMCAwMCAxMSAwMCAwMCAwMAogICAgICAgICAgICB0eXBlID0gImZsYXRfZHQiOwog
ICAgICAgICAgICBhcmNoID0gImFybTY0IjsKICAgICAgICAgICAgY29tcHJlc3Npb24gPSAibm9u
ZSI7CiAgICAgICAgICAgIGxvYWQgPSA8MHg1MDI0MDAwMD47CiAgICAgICAgICAgIGhhc2gtMSB7
CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDVkMTg5MjVmIDB4YTRlNmRiNzUgMHg3NmJkYzRh
MCAweGM5NTFmZjRlIDB4Y2YxY2RlMTUgMHgwZmJhYjdiOSAweDllY2NhYzAKICAgICAgICAgICAg
ICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0dXJl
LTEgewogICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAg
ICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXIt
bmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4YmExM2UwOWYgMHhj
Y2FlYjYzYyAweGRkNTdjNWVhIDB4OGM1NjgwMzYgMHgyZjQ3NjMwZCAweDMwMzg5Mzc1IDB4Njhh
ZmZlMAogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAg
ICAgICBrZXktbmFtZS1oaW50ID0gImRldjIiOwogICAgICAgICAgICB9OwogICAgICAgIH07CiAg
ICAgICAgZmR0LXZlcmRpbi1pbXg4bW1faG1wX292ZXJsYXkuZHRibyB7CiAgICAgICAgICAgIGRl
c2NyaXB0aW9uID0gIkZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIjsKICAgICAgICAgICAgZGF0
YSA9IFtkMCAwZCBmZSBlZCAwMCAwMCAwOCA2MiAwMCAwMCAwMCBiOCAwMCAwMCAwNyA3NCAwMCAw
MCAwMCAyOCAwMCAwMCAwMCAxMSAwMCAwMCAwMAogICAgICAgICAgICB0eXBlID0gImZsYXRfZHQi
OwogICAgICAgICAgICBhcmNoID0gImFybTY0IjsKICAgICAgICAgICAgY29tcHJlc3Npb24gPSAi
bm9uZSI7CiAgICAgICAgICAgIGxvYWQgPSA8MHg1MDI0MDAwMD47CiAgICAgICAgICAgIGhhc2gt
MSB7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweGM2NTEzNjI3IDB4YjQ5NDNlNjAgMHg3NTcy
NDI2YiAweDZkNzhhYWJmIDB4MWVlYWRiMDkgMHhiYTM5Yzk5MyAweDY4NDk2OWYKICAgICAgICAg
ICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0
dXJlLTEgewogICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAg
ICAgICAgICAgc2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWdu
ZXItbmFtZSA9ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4MjM3MjgxMTIg
MHgzOTE0MWY4OCAweDczNzQ5ZGI4IDB4ODkxNWI5NWMgMHg2ZmUyOTQ1NSAweGIyNDA4N2ViIDB4
OTI5MDllZgogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAg
ICAgICAgICBrZXktbmFtZS1oaW50ID0gImRldjIiOwogICAgICAgICAgICB9OwogICAgICAgIH07
CiAgICAgICAgZmR0LXZlcmRpbi1pbXg4bW1fbmF1ODgyMi1idGxfb3ZlcmxheS5kdGJvIHsKICAg
ICAgICAgICAgZGVzY3JpcHRpb24gPSAiRmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2IiOwogICAg
ICAgICAgICBkYXRhID0gW2QwIDBkIGZlIGVkIDAwIDAwIDAxIDk1IDAwIDAwIDAwIGI4IDAwIDAw
IDAxIDY4IDAwIDAwIDAwIDI4IDAwIDAwIDAwIDExIDAwIDAwIDAwCiAgICAgICAgICAgIHR5cGUg
PSAiZmxhdF9kdCI7CiAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAgICBjb21w
cmVzc2lvbiA9ICJub25lIjsKICAgICAgICAgICAgbG9hZCA9IDwweDUwMjQwMDAwPjsKICAgICAg
ICAgICAgaGFzaC0xIHsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4OWYyYmVkYzIgMHgxODAz
ZWVhNSAweDA3NzI3NzY1IDB4OWY5NzM3NGQgMHg4OTY3ZjcxMCAweGU2ODFkNzYzIDB4NWE3MjVm
MAogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAg
ICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgwMDAwMDAw
MD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAgICAgICAg
ICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFsdWUgPSA8
MHgyMmE1YjQwMSAweDIwNWRhZDM2IDB4OGQ2YmJmYjQgMHgyM2Y4YjAzOSAweGM4NWRhODI5IDB4
ZTdkZjhjOTIgMHg5NmM1ZmM1CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4
IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2MiI7CiAgICAgICAgICAgIH07
CiAgICAgICAgfTsKICAgICAgICBmZHQtdmVyZGluLWlteDhtbV9vdjU2NDBfb3ZlcmxheS5kdGJv
IHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiRmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2Ii
OwogICAgICAgICAgICBkYXRhID0gW2QwIDBkIGZlIGVkIDAwIDAwIDBjIDNiIDAwIDAwIDAwIGI4
IDAwIDAwIDBhIDcwIDAwIDAwIDAwIDI4IDAwIDAwIDAwIDExIDAwIDAwIDAwCiAgICAgICAgICAg
IHR5cGUgPSAiZmxhdF9kdCI7CiAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAg
ICBjb21wcmVzc2lvbiA9ICJub25lIjsKICAgICAgICAgICAgbG9hZCA9IDwweDUwMjQwMDAwPjsK
ICAgICAgICAgICAgaGFzaC0xIHsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4MWM5OWY0NGQg
MHhjMzNlZmQwNyAweDRmNmQ4ODc3IDB4MjBjNTI5OTUgMHgwNDNkMjQyNSAweDI2NTYzNThjIDB4
MjNlMTA0NgogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAgICB9Owog
ICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgw
MDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAg
ICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFs
dWUgPSA8MHg0MzMwZjNlMiAweDdjOTI2NjQ1IDB4OGM2OWM3YjEgMHgyMDBjMzE2YyAweGFiZjY4
ZmQxIDB4ODRhMmVkZWEgMHg1ZGE5YWY2CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixy
c2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2MiI7CiAgICAgICAg
ICAgIH07CiAgICAgICAgfTsKICAgICAgICBmZHQtdmVyZGluLWlteDhtbV9wYW5lbC1jYXAtdG91
Y2gtMTBpbmNoLWRzaV9vdmVybGF5LmR0Ym8gewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICJG
bGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiI7CiAgICAgICAgICAgIGRhdGEgPSA8MHhkMDBkZmVl
ZCAweDAwMDAwZTk4IDB4MDAwMDAwYjggMHgwMDAwMGM2MCAweDAwMDAwMDI4IDB4MDAwMDAwMTEg
MHgwMDAwMDAxMCAweDAKICAgICAgICAgICAgdHlwZSA9ICJmbGF0X2R0IjsKICAgICAgICAgICAg
YXJjaCA9ICJhcm02NCI7CiAgICAgICAgICAgIGNvbXByZXNzaW9uID0gIm5vbmUiOwogICAgICAg
ICAgICBsb2FkID0gPDB4NTAyNDAwMDA+OwogICAgICAgICAgICBoYXNoLTEgewogICAgICAgICAg
ICAgICAgdmFsdWUgPSA8MHhjNDZlODI1MiAweDY1ZDEyYmQ0IDB4YjJjYjU0YzQgMHhhOTNiMDg3
OCAweDAxMDUxZTIxIDB4NzliNDJhNmIgMHhmY2I5MTAwCiAgICAgICAgICAgICAgICBhbGdvID0g
InNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNpZ25hdHVyZS0xIHsKICAgICAg
ICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAgICAgICAgICAgICAgIHNpZ25l
ci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAgc2lnbmVyLW5hbWUgPSAibWtp
bWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDc2OTg0MGYyIDB4NTU5YzQ4NTcgMHhl
YmY2ZjkzNCAweDhiMDg5YmY1IDB4MmZmOWI2NDUgMHg0ZTc0MjU0ZiAweDRjNTJhMDQKICAgICAg
ICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAgICAgICAgICAgICAga2V5LW5h
bWUtaGludCA9ICJkZXYyIjsKICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAgICAgIGZkdC12
ZXJkaW4taW14OG1tLXNlY2Jvb3Qta2FyZ3Nfb3ZlcmxheS5kdGJvIHsKICAgICAgICAgICAgZGVz
Y3JpcHRpb24gPSAiRmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2IiOwogICAgICAgICAgICBkYXRh
ID0gW2QwIDBkIGZlIGVkIDAwIDAwIDAxIGRhIDAwIDAwIDAwIGI4IDAwIDAwIDAxIGJjIDAwIDAw
IDAwIDI4IDAwIDAwIDAwIDExIDAwIDAwIDAwCiAgICAgICAgICAgIHR5cGUgPSAiZmxhdF9kdCI7
CiAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAgICBjb21wcmVzc2lvbiA9ICJu
b25lIjsKICAgICAgICAgICAgbG9hZCA9IDwweDUwMjQwMDAwPjsKICAgICAgICAgICAgaGFzaC0x
IHsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4NWI3ZjM1NzIgMHhkMTJiY2IzNCAweGVjNzJj
NTNiIDB4NzY0MTQ0NjkgMHg1NjI1ZTk2NSAweGJkNWIxNjZmIDB4YWQxODViMwogICAgICAgICAg
ICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1
cmUtMSB7CiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAgICAgICAg
ICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAgIHNpZ25l
ci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFsdWUgPSA8MHgxN2VlZTQ1ZiAw
eGRlOThmNzA5IDB4NjM0ZDM1YzEgMHg1ZmVmMDgzNCAweDVjOTU2ZTMyIDB4MWZjOTM0YmYgMHg3
Mjc5YmM3CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAg
ICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2MiI7CiAgICAgICAgICAgIH07CiAgICAgICAgfTsK
ICAgICAgICBmZHQtdmVyZGluLWlteDhtbV9zcGlkZXZfb3ZlcmxheS5kdGJvIHsKICAgICAgICAg
ICAgZGVzY3JpcHRpb24gPSAiRmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2IiOwogICAgICAgICAg
ICBkYXRhID0gW2QwIDBkIGZlIGVkIDAwIDAwIDAyIDMxIDAwIDAwIDAwIGI4IDAwIDAwIDAxIGUw
IDAwIDAwIDAwIDI4IDAwIDAwIDAwIDExIDAwIDAwIDAwCiAgICAgICAgICAgIHR5cGUgPSAiZmxh
dF9kdCI7CiAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAgICBjb21wcmVzc2lv
biA9ICJub25lIjsKICAgICAgICAgICAgbG9hZCA9IDwweDUwMjQwMDAwPjsKICAgICAgICAgICAg
aGFzaC0xIHsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4MzRjM2M3NDggMHhhMDg1ODE1YyAw
eDk0MzY0YjMzIDB4NzllNmNiNzMgMHhiNDU2NzkzNSAweDllM2FlN2E3IDB4ODIwZjM2MwogICAg
ICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAgICAgICBz
aWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAg
ICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAg
IHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFsdWUgPSA8MHhhZTgw
Y2JjYSAweDA2MGY0MjZmIDB4ODA2ZWRjMmMgMHhlYWM4Y2Q4NSAweGU5MmI0YmJlIDB4NTYyOTdk
YWQgMHhkNTUxMTQ1CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAg
ICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2MiI7CiAgICAgICAgICAgIH07CiAgICAg
ICAgfTsKICAgIH07CiAgICBjb25maWd1cmF0aW9ucyB7CiAgICAgICAgZGVmYXVsdCA9ICJjb25m
LWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLW5vbndpZmktZGFobGlhLmR0YiI7CiAgICAgICAgY29u
Zi1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi1ub253aWZpLWRhaGxpYS5kdGIgewogICAgICAgICAg
ICBkZXNjcmlwdGlvbiA9ICIxIExpbnV4IGtlcm5lbCwgRkRUIGJsb2IiOwogICAgICAgICAgICBr
ZXJuZWwgPSAia2VybmVsLTEiOwogICAgICAgICAgICBmZHQgPSAiZmR0LWZyZWVzY2FsZV9pbXg4
bW0tdmVyZGluLW5vbndpZmktZGFobGlhLmR0YiI7CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAg
ICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNp
Z25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhhc2hlZC1zdHJpbmdzID0gPDB4MDAwMDAwMDAg
MHgwMDAwMDBhOT47CiAgICAgICAgICAgICAgICBoYXNoZWQtbm9kZXMgPSAiLyIsICIvY29uZmln
dXJhdGlvbnMvY29uZi1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi1ub253aWZpLWRhaGxpYS5kdGIK
ICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAgICAgICAgICAgICAg
IHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAgc2lnbmVyLW5hbWUg
PSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDJmZmI0NmEzIDB4ODI5M2Jh
OWQgMHgyNjIyZDhmOSAweGYwZDYyODVkIDB4NTUwOTc2NDUgMHg1NWFhZWNjMCAweDEwYmYwNWYK
ICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAgICAgICAgICAgICAg
a2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAgICAgICAgICAgcGFkZGluZyA9ICJwa2NzLTEu
NSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdlcyA9ICJrZXJuZWwiLCAiZmR0IjsKICAgICAg
ICAgICAgfTsKICAgICAgICB9OwogICAgICAgIGNvbmYtZnJlZXNjYWxlX2lteDhtbS12ZXJkaW4t
bm9ud2lmaS1kZXYuZHRiIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiMCBMaW51eCBrZXJu
ZWwsIEZEVCBibG9iIjsKICAgICAgICAgICAga2VybmVsID0gImtlcm5lbC0xIjsKICAgICAgICAg
ICAgZmR0ID0gImZkdC1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi1ub253aWZpLWRldi5kdGIiOwog
ICAgICAgICAgICBoYXNoLTEgewogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAg
ICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICBoYXNo
ZWQtc3RyaW5ncyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwYzU+OwogICAgICAgICAgICAgICAgaGFz
aGVkLW5vZGVzID0gIi8iLCAiL2NvbmZpZ3VyYXRpb25zL2NvbmYtZnJlZXNjYWxlX2lteDhtbS12
ZXJkaW4tbm9ud2lmaS1kZXYuZHRiIiwgCiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgw
MDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAg
ICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFs
dWUgPSA8MHg4MDQwOGU2ZCAweGNiNmI0NjBhIDB4YzVjNmJmMmUgMHg2ZjZiOGY2NiAweDgyYjU4
NGZjIDB4MTBjYzkwMDAgMHgwMWNlM2E0CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixy
c2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2IjsKICAgICAgICAg
ICAgICAgIHBhZGRpbmcgPSAicGtjcy0xLjUiOwogICAgICAgICAgICAgICAgc2lnbi1pbWFnZXMg
PSAia2VybmVsIiwgImZkdCI7CiAgICAgICAgICAgIH07CiAgICAgICAgfTsKICAgICAgICBjb25m
LWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLW5vbndpZmktbWFsbG93LmR0YiB7CiAgICAgICAgICAg
IGRlc2NyaXB0aW9uID0gIjAgTGludXgga2VybmVsLCBGRFQgYmxvYiI7CiAgICAgICAgICAgIGtl
cm5lbCA9ICJrZXJuZWwtMSI7CiAgICAgICAgICAgIGZkdCA9ICJmZHQtZnJlZXNjYWxlX2lteDht
bS12ZXJkaW4tbm9ud2lmaS1tYWxsb3cuZHRiIjsKICAgICAgICAgICAgaGFzaC0xIHsKICAgICAg
ICAgICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2ln
bmF0dXJlLTEgewogICAgICAgICAgICAgICAgaGFzaGVkLXN0cmluZ3MgPSA8MHgwMDAwMDAwMCAw
eDAwMDAwMGM1PjsKICAgICAgICAgICAgICAgIGhhc2hlZC1ub2RlcyA9ICIvIiwgIi9jb25maWd1
cmF0aW9ucy9jb25mLWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLW5vbndpZmktbWFsbG93LmR0Ygog
ICAgICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAgICAgICAg
c2lnbmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXItbmFtZSA9
ICJta2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4MjZmYmI5NDYgMHgwNWJlZDA1
ZiAweGE4NTA1NGY5IDB4YzVkODkxNDQgMHg4NmRiZDU1ZiAweDMzMjJiYWI3IDB4MjZhOGM2Nwog
ICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAgICAgICBr
ZXktbmFtZS1oaW50ID0gImRldiI7CiAgICAgICAgICAgICAgICBwYWRkaW5nID0gInBrY3MtMS41
IjsKICAgICAgICAgICAgICAgIHNpZ24taW1hZ2VzID0gImtlcm5lbCIsICJmZHQiOwogICAgICAg
ICAgICB9OwogICAgICAgIH07CiAgICAgICAgY29uZi1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi1u
b253aWZpLXlhdmlhLmR0YiB7CiAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIjAgTGludXgga2Vy
bmVsLCBGRFQgYmxvYiI7CiAgICAgICAgICAgIGtlcm5lbCA9ICJrZXJuZWwtMSI7CiAgICAgICAg
ICAgIGZkdCA9ICJmZHQtZnJlZXNjYWxlX2lteDhtbS12ZXJkaW4tbm9ud2lmaS15YXZpYS5kdGIi
OwogICAgICAgICAgICBoYXNoLTEgewogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwog
ICAgICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICBo
YXNoZWQtc3RyaW5ncyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwYzU+OwogICAgICAgICAgICAgICAg
aGFzaGVkLW5vZGVzID0gIi8iLCAiL2NvbmZpZ3VyYXRpb25zL2NvbmYtZnJlZXNjYWxlX2lteDht
bS12ZXJkaW4tbm9ud2lmaS15YXZpYS5kdGIiCiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8
MHgwMDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsK
ICAgICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAg
dmFsdWUgPSA8MHg1MGE0MDNiOCAweGMxMWVmNjMxIDB4YWRhZWU4ZWUgMHhlY2NlNmNhZiAweDZk
M2RkYTgzIDB4ZmQzYTNmNmUgMHgwM2Y0NzdkCiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1
Nixyc2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2IjsKICAgICAg
ICAgICAgICAgIHBhZGRpbmcgPSAicGtjcy0xLjUiOwogICAgICAgICAgICAgICAgc2lnbi1pbWFn
ZXMgPSAia2VybmVsIiwgImZkdCI7CiAgICAgICAgICAgIH07CiAgICAgICAgfTsKICAgICAgICBj
b25mLWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLXdpZmktZGFobGlhLmR0YiB7CiAgICAgICAgICAg
IGRlc2NyaXB0aW9uID0gIjAgTGludXgga2VybmVsLCBGRFQgYmxvYiI7CiAgICAgICAgICAgIGtl
cm5lbCA9ICJrZXJuZWwtMSI7CiAgICAgICAgICAgIGZkdCA9ICJmZHQtZnJlZXNjYWxlX2lteDht
bS12ZXJkaW4td2lmaS1kYWhsaWEuZHRiIjsKICAgICAgICAgICAgaGFzaC0xIHsKICAgICAgICAg
ICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0
dXJlLTEgewogICAgICAgICAgICAgICAgaGFzaGVkLXN0cmluZ3MgPSA8MHgwMDAwMDAwMCAweDAw
MDAwMGM1PjsKICAgICAgICAgICAgICAgIGhhc2hlZC1ub2RlcyA9ICIvIiwgIi9jb25maWd1cmF0
aW9ucy9jb25mLWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLXdpZmktZGFobGlhLmR0YiIsIAogICAg
ICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAgICAgICAgc2ln
bmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXItbmFtZSA9ICJt
a2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4NjUxNmEzMzcgMHg2OTMwODQ2NyAw
eDQ2N2Q2YzRiIDB4MmVlYzAyZDMgMHhkMWFkMDA5NiAweDBjMGEzZTk5IDB4MWIxYTkxZgogICAg
ICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAgICAgICBrZXkt
bmFtZS1oaW50ID0gImRldiI7CiAgICAgICAgICAgICAgICBwYWRkaW5nID0gInBrY3MtMS41IjsK
ICAgICAgICAgICAgICAgIHNpZ24taW1hZ2VzID0gImtlcm5lbCIsICJmZHQiOwogICAgICAgICAg
ICB9OwogICAgICAgIH07CiAgICAgICAgY29uZi1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi13aWZp
LWRldi5kdGIgewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICIwIExpbnV4IGtlcm5lbCwgRkRU
IGJsb2IiOwogICAgICAgICAgICBrZXJuZWwgPSAia2VybmVsLTEiOwogICAgICAgICAgICBmZHQg
PSAiZmR0LWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLXdpZmktZGV2LmR0YiI7CiAgICAgICAgICAg
IGhhc2gtMSB7CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07
CiAgICAgICAgICAgIHNpZ25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhhc2hlZC1zdHJpbmdz
ID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBjNT47CiAgICAgICAgICAgICAgICBoYXNoZWQtbm9kZXMg
PSAiLyIsICIvY29uZmlndXJhdGlvbnMvY29uZi1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi13aWZp
LWRldi5kdGIiLCAiL2kKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsK
ICAgICAgICAgICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAg
ICAgc2lnbmVyLW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDI4
ZmY5NjhlIDB4NGNmODAxOTggMHg2NGU5YTFhMyAweDE2ZThmYjJhIDB4MzM1MzFkODYgMHg4NjNj
ZTM2NiAweGIxZjE5NzUKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwog
ICAgICAgICAgICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAgICAgICAgICAgcGFk
ZGluZyA9ICJwa2NzLTEuNSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdlcyA9ICJrZXJuZWwi
LCAiZmR0IjsKICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAgICAgIGNvbmYtZnJlZXNjYWxl
X2lteDhtbS12ZXJkaW4td2lmaS1tYWxsb3cuZHRiIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24g
PSAiMCBMaW51eCBrZXJuZWwsIEZEVCBibG9iIjsKICAgICAgICAgICAga2VybmVsID0gImtlcm5l
bC0xIjsKICAgICAgICAgICAgZmR0ID0gImZkdC1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi13aWZp
LW1hbGxvdy5kdGIiOwogICAgICAgICAgICBoYXNoLTEgewogICAgICAgICAgICAgICAgYWxnbyA9
ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAg
ICAgICAgICAgICBoYXNoZWQtc3RyaW5ncyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwYzU+OwogICAg
ICAgICAgICAgICAgaGFzaGVkLW5vZGVzID0gIi8iLCAiL2NvbmZpZ3VyYXRpb25zL2NvbmYtZnJl
ZXNjYWxlX2lteDhtbS12ZXJkaW4td2lmaS1tYWxsb3cuZHRiIiwgCiAgICAgICAgICAgICAgICB0
aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9
ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAg
ICAgICAgICAgICAgdmFsdWUgPSA8MHg0MWMzMDc4ZCAweDc1MjM1NzRlIDB4ZGVhMmY1YTkgMHhj
MzU0Y2ExMiAweDMwODNiNzU4IDB4NmRmNmNlZjcgMHg4YjZkZmZmCiAgICAgICAgICAgICAgICBh
bGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAi
ZGV2IjsKICAgICAgICAgICAgICAgIHBhZGRpbmcgPSAicGtjcy0xLjUiOwogICAgICAgICAgICAg
ICAgc2lnbi1pbWFnZXMgPSAia2VybmVsIiwgImZkdCI7CiAgICAgICAgICAgIH07CiAgICAgICAg
fTsKICAgICAgICBjb25mLWZyZWVzY2FsZV9pbXg4bW0tdmVyZGluLXdpZmkteWF2aWEuZHRiIHsK
ICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiMCBMaW51eCBrZXJuZWwsIEZEVCBibG9iIjsKICAg
ICAgICAgICAga2VybmVsID0gImtlcm5lbC0xIjsKICAgICAgICAgICAgZmR0ID0gImZkdC1mcmVl
c2NhbGVfaW14OG1tLXZlcmRpbi13aWZpLXlhdmlhLmR0YiI7CiAgICAgICAgICAgIGhhc2gtMSB7
CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAg
ICAgIHNpZ25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhhc2hlZC1zdHJpbmdzID0gPDB4MDAw
MDAwMDAgMHgwMDAwMDBjNT47CiAgICAgICAgICAgICAgICBoYXNoZWQtbm9kZXMgPSAiLyIsICIv
Y29uZmlndXJhdGlvbnMvY29uZi1mcmVlc2NhbGVfaW14OG1tLXZlcmRpbi13aWZpLXlhdmlhLmR0
YiIsICIKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAgICAgICAg
ICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAgc2lnbmVy
LW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDg0ZWJkYWMyIDB4
NDkwNWJlMjEgMHhhNWFlYWUzMSAweGJkNWJhNTdhIDB4NzU3ZjgzM2EgMHhmZDgxODNmYyAweGE3
M2VkYTYKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAgICAgICAg
ICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAgICAgICAgICAgcGFkZGluZyA9ICJw
a2NzLTEuNSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdlcyA9ICJrZXJuZWwiLCAiZmR0IjsK
ICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAgICAgIGNvbmYtdmVyZGluLWlteDhtbV8yMG1o
el9jYW4xLmR0Ym8gewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICIwIEZEVCBibG9iIjsKICAg
ICAgICAgICAgZmR0ID0gImZkdC12ZXJkaW4taW14OG1tXzIwbWh6X2NhbjEuZHRibyI7CiAgICAg
ICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAg
ICAgIH07CiAgICAgICAgICAgIHNpZ25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhhc2hlZC1z
dHJpbmdzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBjNT47CiAgICAgICAgICAgICAgICBoYXNoZWQt
bm9kZXMgPSAiLyIsICIvY29uZmlndXJhdGlvbnMvY29uZi12ZXJkaW4taW14OG1tXzIwbWh6X2Nh
bjEuZHRibyIsICIvaW1hZ2VzL2YKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAw
MDAwPjsKICAgICAgICAgICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAg
ICAgICAgICAgc2lnbmVyLW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9
IDwweDM4ZmQ3ZmMxIDB4ZGE1Y2U4YTMgMHhmNTNmOWE3ZCAweDI0NDVhNTczIDB4MDJmNmMxOWYg
MHhhYzAzZmY0YSAweGEzNTQwNjMKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIw
NDgiOwogICAgICAgICAgICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAgICAgICAg
ICAgcGFkZGluZyA9ICJwa2NzLTEuNSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdlcyA9ICJm
ZHQiOwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICAgICAgY29uZi12ZXJkaW4taW14OG1t
X2Rpc2FibGVfY2FuMS5kdGJvIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiMCBGRFQgYmxv
YiI7CiAgICAgICAgICAgIGZkdCA9ICJmZHQtdmVyZGluLWlteDhtbV9kaXNhYmxlX2NhbjEuZHRi
byI7CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7
CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNpZ25hdHVyZS0xIHsKICAgICAgICAgICAgICAg
IGhhc2hlZC1zdHJpbmdzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBjNT47CiAgICAgICAgICAgICAg
ICBoYXNoZWQtbm9kZXMgPSAiLyIsICIvY29uZmlndXJhdGlvbnMvY29uZi12ZXJkaW4taW14OG1t
X2Rpc2FibGVfY2FuMS5kdGJvIiwgIi9pbWFnZXMKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9
IDwweDAwMDAwMDAwPjsKICAgICAgICAgICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEi
OwogICAgICAgICAgICAgICAgc2lnbmVyLW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAg
ICB2YWx1ZSA9IDwweGEyYzAxODMwIDB4NmI2OTM0ZjIgMHgyNmE2MzRmNCAweDUxMjY5MzRlIDB4
NTg3MTMzNWIgMHhjZWY4NDU3NSAweGZlZDNkZjAKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hh
MjU2LHJzYTIwNDgiOwogICAgICAgICAgICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAg
ICAgICAgICAgICAgcGFkZGluZyA9ICJwa2NzLTEuNSI7CiAgICAgICAgICAgICAgICBzaWduLWlt
YWdlcyA9ICJmZHQiOwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICAgICAgY29uZi12ZXJk
aW4taW14OG1tX2RzaS10by1oZG1pX292ZXJsYXkuZHRibyB7CiAgICAgICAgICAgIGRlc2NyaXB0
aW9uID0gIjAgRkRUIGJsb2IiOwogICAgICAgICAgICBmZHQgPSAiZmR0LXZlcmRpbi1pbXg4bW1f
ZHNpLXRvLWhkbWlfb3ZlcmxheS5kdGJvIjsKICAgICAgICAgICAgaGFzaC0xIHsKICAgICAgICAg
ICAgICAgIGFsZ28gPSAic2hhMjU2IjsKICAgICAgICAgICAgfTsKICAgICAgICAgICAgc2lnbmF0
dXJlLTEgewogICAgICAgICAgICAgICAgaGFzaGVkLXN0cmluZ3MgPSA8MHgwMDAwMDAwMCAweDAw
MDAwMGM1PjsKICAgICAgICAgICAgICAgIGhhc2hlZC1ub2RlcyA9ICIvIiwgIi9jb25maWd1cmF0
aW9ucy9jb25mLXZlcmRpbi1pbXg4bW1fZHNpLXRvLWhkbWlfb3ZlcmxheS5kdGJvIiwgIgogICAg
ICAgICAgICAgICAgdGltZXN0YW1wID0gPDB4MDAwMDAwMDA+OwogICAgICAgICAgICAgICAgc2ln
bmVyLXZlcnNpb24gPSAiMjAyMi4wMSI7CiAgICAgICAgICAgICAgICBzaWduZXItbmFtZSA9ICJt
a2ltYWdlIjsKICAgICAgICAgICAgICAgIHZhbHVlID0gPDB4NzM4N2ZkOWEgMHg0ZTE0NDM3OSAw
eDk4YzUxMGUzIDB4NWI1MmRhZTYgMHhlZTI1NmI2OSAweGEwMWQ2MjMzIDB4MTk1MWEzMAogICAg
ICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAgICAgICAgICAgICBrZXkt
bmFtZS1oaW50ID0gImRldiI7CiAgICAgICAgICAgICAgICBwYWRkaW5nID0gInBrY3MtMS41IjsK
ICAgICAgICAgICAgICAgIHNpZ24taW1hZ2VzID0gImZkdCI7CiAgICAgICAgICAgIH07CiAgICAg
ICAgfTsKICAgICAgICBjb25mLXZlcmRpbi1pbXg4bW1fZHNpLXRvLWx2ZHNfcGFuZWwtY2FwLXRv
dWNoLTEwaW5jaC1sdmRzX292ZXJsYXkuZHRibyB7CiAgICAgICAgICAgIGRlc2NyaXB0aW9uID0g
IjAgRkRUIGJsb2IiOwogICAgICAgICAgICBmZHQgPSAiZmR0LXZlcmRpbi1pbXg4bW1fZHNpLXRv
LWx2ZHNfcGFuZWwtY2FwLXRvdWNoLTEwaW5jaC1sdmRzX292ZXJsYXkuZHRibyI7CiAgICAgICAg
ICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAg
IH07CiAgICAgICAgICAgIHNpZ25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhhc2hlZC1zdHJp
bmdzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBjNT47CiAgICAgICAgICAgICAgICBoYXNoZWQtbm9k
ZXMgPSAiLyIsICIvY29uZmlndXJhdGlvbnMvY29uZi12ZXJkaW4taW14OG1tX2RzaS10by1sdmRz
X3BhbmVsLWNhcC10b3VjaC0KICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAw
PjsKICAgICAgICAgICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAg
ICAgICAgc2lnbmVyLW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDww
eDEyMzc1YzkzIDB4NTE2OGVjZDkgMHg1OTY2ZWRjNSAweGNjYjkwMzJkIDB4ZWI0NDc3OGQgMHgz
ZTQ5MmNkOSAweDY1NmVkOTEKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgi
OwogICAgICAgICAgICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAgICAgICAgICAg
cGFkZGluZyA9ICJwa2NzLTEuNSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdlcyA9ICJmZHQi
OwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICAgICAgY29uZi12ZXJkaW4taW14OG1tX2ht
cF9vdmVybGF5LmR0Ym8gewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICIwIEZEVCBibG9iIjsK
ICAgICAgICAgICAgZmR0ID0gImZkdC12ZXJkaW4taW14OG1tX2htcF9vdmVybGF5LmR0Ym8iOwog
ICAgICAgICAgICBoYXNoLTEgewogICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAg
ICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICBoYXNo
ZWQtc3RyaW5ncyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwYzU+OwogICAgICAgICAgICAgICAgaGFz
aGVkLW5vZGVzID0gIi8iLCAiL2NvbmZpZ3VyYXRpb25zL2NvbmYtdmVyZGluLWlteDhtbV9obXBf
b3ZlcmxheS5kdGJvIiwgIi9pbWFnZXMvCiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgw
MDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAg
ICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFs
dWUgPSA8MHgwYjVkYWQ0YSAweGNlMWZhYTFjIDB4OTkzYzUyNDUgMHhhYTI1M2Q2ZiAweGVjOTVh
YzkyIDB4ZThiOWEwMjUgMHgzMTU5ZGRhCiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixy
c2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2IjsKICAgICAgICAg
ICAgICAgIHBhZGRpbmcgPSAicGtjcy0xLjUiOwogICAgICAgICAgICAgICAgc2lnbi1pbWFnZXMg
PSAiZmR0IjsKICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAgICAgIGNvbmYtdmVyZGluLWlt
eDhtbV9uYXU4ODIyLWJ0bF9vdmVybGF5LmR0Ym8gewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9
ICIwIEZEVCBibG9iIjsKICAgICAgICAgICAgZmR0ID0gImZkdC12ZXJkaW4taW14OG1tX25hdTg4
MjItYnRsX292ZXJsYXkuZHRibyI7CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAg
ICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNpZ25hdHVyZS0x
IHsKICAgICAgICAgICAgICAgIGhhc2hlZC1zdHJpbmdzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBj
NT47CiAgICAgICAgICAgICAgICBoYXNoZWQtbm9kZXMgPSAiLyIsICIvY29uZmlndXJhdGlvbnMv
Y29uZi12ZXJkaW4taW14OG1tX25hdTg4MjItYnRsX292ZXJsYXkuZHRibyIsICIKICAgICAgICAg
ICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAgICAgICAgICAgICAgIHNpZ25lci12
ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAgc2lnbmVyLW5hbWUgPSAibWtpbWFn
ZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDE5OWE3YjJlIDB4ZDNmMWFiMDkgMHhlNjc3
NTMxOCAweDNlMWY4MGRhIDB4ZGRiMTFmYWIgMHhlMTRlYWQ4ZiAweDM5YjJiOTgKICAgICAgICAg
ICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAgICAgICAgICAgICAga2V5LW5hbWUt
aGludCA9ICJkZXYiOwogICAgICAgICAgICAgICAgcGFkZGluZyA9ICJwa2NzLTEuNSI7CiAgICAg
ICAgICAgICAgICBzaWduLWltYWdlcyA9ICJmZHQiOwogICAgICAgICAgICB9OwogICAgICAgIH07
CiAgICAgICAgY29uZi12ZXJkaW4taW14OG1tX292NTY0MF9vdmVybGF5LmR0Ym8gewogICAgICAg
ICAgICBkZXNjcmlwdGlvbiA9ICIwIEZEVCBibG9iIjsKICAgICAgICAgICAgZmR0ID0gImZkdC12
ZXJkaW4taW14OG1tX292NTY0MF9vdmVybGF5LmR0Ym8iOwogICAgICAgICAgICBoYXNoLTEgewog
ICAgICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAgICAg
ICBzaWduYXR1cmUtMSB7CiAgICAgICAgICAgICAgICBoYXNoZWQtc3RyaW5ncyA9IDwweDAwMDAw
MDAwIDB4MDAwMDAwYzU+OwogICAgICAgICAgICAgICAgaGFzaGVkLW5vZGVzID0gIi8iLCAiL2Nv
bmZpZ3VyYXRpb25zL2NvbmYtdmVyZGluLWlteDhtbV9vdjU2NDBfb3ZlcmxheS5kdGJvIiwgIi9p
bWFnCiAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAgICAgICAgICAg
ICAgICBzaWduZXItdmVyc2lvbiA9ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAgIHNpZ25lci1u
YW1lID0gIm1raW1hZ2UiOwogICAgICAgICAgICAgICAgdmFsdWUgPSA8MHhiMWQ4YmM2ZCAweDA0
NzMzYjU5IDB4ZjVhNjExNzggMHhkMDQ0Mjk0MCAweDNhMzY1ZGNiIDB4YTM4NDg0MGQgMHgxNWU2
YjYyCiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAg
ICAgIGtleS1uYW1lLWhpbnQgPSAiZGV2IjsKICAgICAgICAgICAgICAgIHBhZGRpbmcgPSAicGtj
cy0xLjUiOwogICAgICAgICAgICAgICAgc2lnbi1pbWFnZXMgPSAiZmR0IjsKICAgICAgICAgICAg
fTsKICAgICAgICB9OwogICAgICAgIGNvbmYtdmVyZGluLWlteDhtbV9wYW5lbC1jYXAtdG91Y2gt
MTBpbmNoLWRzaV9vdmVybGF5LmR0Ym8gewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICIwIEZE
VCBibG9iIjsKICAgICAgICAgICAgZmR0ID0gImZkdC12ZXJkaW4taW14OG1tX3BhbmVsLWNhcC10
b3VjaC0xMGluY2gtZHNpX292ZXJsYXkuZHRibyI7CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAg
ICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAgICAgICAgICAgIH07CiAgICAgICAgICAgIHNp
Z25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhhc2hlZC1zdHJpbmdzID0gPDB4MDAwMDAwMDAg
MHgwMDAwMDBjNT47CiAgICAgICAgICAgICAgICBoYXNoZWQtbm9kZXMgPSAiLyIsICIvY29uZmln
dXJhdGlvbnMvY29uZi12ZXJkaW4taW14OG1tX3BhbmVsLWNhcC10b3VjaC0xMGluY2gtZHNpX28K
ICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDwweDAwMDAwMDAwPjsKICAgICAgICAgICAgICAg
IHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwogICAgICAgICAgICAgICAgc2lnbmVyLW5hbWUg
PSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2YWx1ZSA9IDwweDYyZjcxNDk4IDB4ZmRmZDNl
OGYgMHgxMWJiYTIzOCAweDNhYzA4MDMzIDB4NmFkZTJkZGYgMHhmZjZiYTU1MyAweDNjZmY1NzUK
ICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2LHJzYTIwNDgiOwogICAgICAgICAgICAgICAg
a2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAgICAgICAgICAgcGFkZGluZyA9ICJwa2NzLTEu
NSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdlcyA9ICJmZHQiOwogICAgICAgICAgICB9Owog
ICAgICAgIH07CiAgICAgICAgY29uZi12ZXJkaW4taW14OG1tLXNlY2Jvb3Qta2FyZ3Nfb3Zlcmxh
eS5kdGJvIHsKICAgICAgICAgICAgZGVzY3JpcHRpb24gPSAiMCBGRFQgYmxvYiI7CiAgICAgICAg
ICAgIGZkdCA9ICJmZHQtdmVyZGluLWlteDhtbS1zZWNib290LWthcmdzX292ZXJsYXkuZHRibyI7
CiAgICAgICAgICAgIGhhc2gtMSB7CiAgICAgICAgICAgICAgICBhbGdvID0gInNoYTI1NiI7CiAg
ICAgICAgICAgIH07CiAgICAgICAgICAgIHNpZ25hdHVyZS0xIHsKICAgICAgICAgICAgICAgIGhh
c2hlZC1zdHJpbmdzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBjNT47CiAgICAgICAgICAgICAgICBo
YXNoZWQtbm9kZXMgPSAiLyIsICIvY29uZmlndXJhdGlvbnMvY29uZi12ZXJkaW4taW14OG1tLXNl
Y2Jvb3Qta2FyZ3Nfb3ZlcmxheS5kdGJvIiwKICAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IDww
eDAwMDAwMDAwPjsKICAgICAgICAgICAgICAgIHNpZ25lci12ZXJzaW9uID0gIjIwMjIuMDEiOwog
ICAgICAgICAgICAgICAgc2lnbmVyLW5hbWUgPSAibWtpbWFnZSI7CiAgICAgICAgICAgICAgICB2
YWx1ZSA9IDwweDQ3Yzk3ZDRlIDB4NTMzMTBkZWQgMHgwZDc1YWMzMSAweGQ3NWM0YWJhIDB4NzY2
ZWJkYzcgMHg0NWMwZjdjNyAweDcwMjYzNjEKICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMjU2
LHJzYTIwNDgiOwogICAgICAgICAgICAgICAga2V5LW5hbWUtaGludCA9ICJkZXYiOwogICAgICAg
ICAgICAgICAgcGFkZGluZyA9ICJwa2NzLTEuNSI7CiAgICAgICAgICAgICAgICBzaWduLWltYWdl
cyA9ICJmZHQiOwogICAgICAgICAgICB9OwogICAgICAgIH07CiAgICAgICAgY29uZi12ZXJkaW4t
aW14OG1tX3NwaWRldl9vdmVybGF5LmR0Ym8gewogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICIw
IEZEVCBibG9iIjsKICAgICAgICAgICAgZmR0ID0gImZkdC12ZXJkaW4taW14OG1tX3NwaWRldl9v
dmVybGF5LmR0Ym8iOwogICAgICAgICAgICBoYXNoLTEgewogICAgICAgICAgICAgICAgYWxnbyA9
ICJzaGEyNTYiOwogICAgICAgICAgICB9OwogICAgICAgICAgICBzaWduYXR1cmUtMSB7CiAgICAg
ICAgICAgICAgICBoYXNoZWQtc3RyaW5ncyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwYzU+OwogICAg
ICAgICAgICAgICAgaGFzaGVkLW5vZGVzID0gIi8iLCAiL2NvbmZpZ3VyYXRpb25zL2NvbmYtdmVy
ZGluLWlteDhtbV9zcGlkZXZfb3ZlcmxheS5kdGJvIiwgIi9pbWFnCiAgICAgICAgICAgICAgICB0
aW1lc3RhbXAgPSA8MHgwMDAwMDAwMD47CiAgICAgICAgICAgICAgICBzaWduZXItdmVyc2lvbiA9
ICIyMDIyLjAxIjsKICAgICAgICAgICAgICAgIHNpZ25lci1uYW1lID0gIm1raW1hZ2UiOwogICAg
ICAgICAgICAgICAgdmFsdWUgPSA8MHgwNDNkM2VlYyAweDUzZDNlNDE4IDB4OWM5YWZlZDQgMHgw
Y2RkMWFiYiAweDgyOGIzMjQyIDB4ZDRjNDNhMmIgMHhkYTE5MWMwCiAgICAgICAgICAgICAgICBh
bGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAgICAgIGtleS1uYW1lLWhpbnQgPSAi
ZGV2IjsKICAgICAgICAgICAgICAgIHBhZGRpbmcgPSAicGtjcy0xLjUiOwogICAgICAgICAgICAg
ICAgc2lnbi1pbWFnZXMgPSAiZmR0IjsKICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAgfTsK
fTsK
--------------j5m8ZfWeHoMX3vpliPLDyzBP
Content-Type: text/plain; charset=UTF-8; 
	name=fdtdump-kirkstone-u-boot-dtb.txt
Content-Disposition: attachment; filename="fdtdump-kirkstone-u-boot-dtb.txt"
Content-Transfer-Encoding: base64

ZGVwbG95L2ltYWdlcy92ZXJkaW4taW14OG1tL3UtYm9vdC12ZXJkaW4taW14OG1tLTIwMjIuMDQt
cjAuZHRiOiBmb3VuZCBmZHQgYXQgb2Zmc2V0IDAKL2R0cy12MS87Ci8vIG1hZ2ljOgkJMHhkMDBk
ZmVlZAovLyB0b3RhbHNpemU6CQkweDEzOWEwICg4MDI4OCkKLy8gb2ZmX2R0X3N0cnVjdDoJMHgz
OAovLyBvZmZfZHRfc3RyaW5nczoJMHhkN2QwCi8vIG9mZl9tZW1fcnN2bWFwOgkweDI4Ci8vIHZl
cnNpb246CQkxNwovLyBsYXN0X2NvbXBfdmVyc2lvbjoJMTYKLy8gYm9vdF9jcHVpZF9waHlzOgkw
eDAKLy8gc2l6ZV9kdF9zdHJpbmdzOgkweDEzODEKLy8gc2l6ZV9kdF9zdHJ1Y3Q6CTB4ZDc5OAoK
LyB7CiAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDAwMDAwMDE+OwogICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MHgwMDAwMDAwMj47CiAgICAjc2l6ZS1jZWxscyA9IDwweDAwMDAwMDAyPjsKICAgIG1v
ZGVsID0gIlRvcmFkZXggVmVyZGluIGlNWDhNIE1pbmkgUXVhZC9EdWFsTGl0ZSI7CiAgICBjb21w
YXRpYmxlID0gInRvcmFkZXgsdmVyZGluLWlteDhtbSIsICJmc2wsaW14OG1tIjsKICAgIHNpZ25h
dHVyZSB7CiAgICAgICAga2V5LWRldiB7CiAgICAgICAgICAgIHJlcXVpcmVkID0gImNvbmYiOwog
ICAgICAgICAgICBhbGdvID0gInNoYTI1Nixyc2EyMDQ4IjsKICAgICAgICAgICAgcnNhLHItc3F1
YXJlZCA9IDwweDA2ZDExYzIyIDB4NTZmMzE2NjEgMHgxMzMxNDNiYiAweGZkYmNkZTUxIDB4ZDY1
M2QyYTUgMHhjZDEzOWRmZCAweDRiNgogICAgICAgICAgICByc2EsbW9kdWx1cyA9IDwweGRiMDY4
NjRhIDB4MTJhMWUwMzMgMHgwNGIwYjQ1NyAweDQ2ZTVkOTY3IDB4YzZhNmY3OGQgMHgzMTMyYjY2
ZCAweGYxNTk4CiAgICAgICAgICAgIHJzYSxleHBvbmVudCA9IDwweDAwMDAwMDAwIDB4MDAwMTAw
MDE+OwogICAgICAgICAgICByc2EsbjAtaW52ZXJzZSA9IDwweDg5MjVjNWM3PjsKICAgICAgICAg
ICAgcnNhLG51bS1iaXRzID0gPDB4MDAwMDA4MDA+OwogICAgICAgICAgICBrZXktbmFtZS1oaW50
ID0gImRldiI7CiAgICAgICAgfTsKICAgICAgICBrZXktZGV2MiB7CiAgICAgICAgICAgIHJlcXVp
cmVkID0gImltYWdlIjsKICAgICAgICAgICAgYWxnbyA9ICJzaGEyNTYscnNhMjA0OCI7CiAgICAg
ICAgICAgIHJzYSxyLXNxdWFyZWQgPSA8MHgzOTU2ZGJkNSAweDhiNjUxZDNiIDB4YTYyMTI0NGIg
MHhkMGM3MThmZCAweDZjOGEyNzQzIDB4NmQ5NzNiNGYgMHgxOTcKICAgICAgICAgICAgcnNhLG1v
ZHVsdXMgPSA8MHhiY2I5NGIwZiAweDc3ZjA1OWMyIDB4ZmI3N2NjYWMgMHg2N2U3NzM1ZSAweGM1
NjI2NzQ3IDB4MGQzOWIzMGMgMHg1YjM0NwogICAgICAgICAgICByc2EsZXhwb25lbnQgPSA8MHgw
MDAwMDAwMCAweDAwMDEwMDAxPjsKICAgICAgICAgICAgcnNhLG4wLWludmVyc2UgPSA8MHg3MDc4
MTNmZD47CiAgICAgICAgICAgIHJzYSxudW0tYml0cyA9IDwweDAwMDAwODAwPjsKICAgICAgICAg
ICAga2V5LW5hbWUtaGludCA9ICJkZXYyIjsKICAgICAgICB9OwogICAgfTsKICAgIGFsaWFzZXMg
ewogICAgICAgIGV0aGVybmV0MCA9ICIvc29jQDAvYnVzQDMwODAwMDAwL2V0aGVybmV0QDMwYmUw
MDAwIjsKICAgICAgICBncGlvMCA9ICIvc29jQDAvYnVzQDMwMDAwMDAwL2dwaW9AMzAyMDAwMDAi
OwogICAgICAgIGdwaW8xID0gIi9zb2NAMC9idXNAMzAwMDAwMDAvZ3Bpb0AzMDIxMDAwMCI7CiAg
ICAgICAgZ3BpbzIgPSAiL3NvY0AwL2J1c0AzMDAwMDAwMC9ncGlvQDMwMjIwMDAwIjsKICAgICAg
ICBncGlvMyA9ICIvc29jQDAvYnVzQDMwMDAwMDAwL2dwaW9AMzAyMzAwMDAiOwogICAgICAgIGdw
aW80ID0gIi9zb2NAMC9idXNAMzAwMDAwMDAvZ3Bpb0AzMDI0MDAwMCI7CiAgICAgICAgaTJjMCA9
ICIvc29jQDAvYnVzQDMwODAwMDAwL2kyY0AzMGEyMDAwMCI7CiAgICAgICAgaTJjMSA9ICIvc29j
QDAvYnVzQDMwODAwMDAwL2kyY0AzMGEzMDAwMCI7CiAgICAgICAgaTJjMiA9ICIvc29jQDAvYnVz
QDMwODAwMDAwL2kyY0AzMGE0MDAwMCI7CiAgICAgICAgaTJjMyA9ICIvc29jQDAvYnVzQDMwODAw
MDAwL2kyY0AzMGE1MDAwMCI7CiAgICAgICAgbW1jMCA9ICIvc29jQDAvYnVzQDMwODAwMDAwL21t
Y0AzMGI0MDAwMCI7CiAgICAgICAgbW1jMSA9ICIvc29jQDAvYnVzQDMwODAwMDAwL21tY0AzMGI1
MDAwMCI7CiAgICAgICAgbW1jMiA9ICIvc29jQDAvYnVzQDMwODAwMDAwL21tY0AzMGI2MDAwMCI7
CiAgICAgICAgc2VyaWFsMCA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NlcmlhbEAzMDg2MDAwMCI7
CiAgICAgICAgc2VyaWFsMSA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NlcmlhbEAzMDg5MDAwMCI7
CiAgICAgICAgc2VyaWFsMiA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NlcmlhbEAzMDg4MDAwMCI7
CiAgICAgICAgc2VyaWFsMyA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NlcmlhbEAzMGE2MDAwMCI7
CiAgICAgICAgc3BpMCA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NwaUAzMDgyMDAwMCI7CiAgICAg
ICAgc3BpMSA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NwaUAzMDgzMDAwMCI7CiAgICAgICAgc3Bp
MiA9ICIvc29jQDAvYnVzQDMwODAwMDAwL3NwaUAzMDg0MDAwMCI7CiAgICAgICAgdXNiMCA9ICIv
c29jQDAvYnVzQDMyYzAwMDAwL3VzYkAzMmU0MDAwMCI7CiAgICAgICAgdXNiMSA9ICIvc29jQDAv
YnVzQDMyYzAwMDAwL3VzYkAzMmU1MDAwMCI7CiAgICAgICAgdmlkZW8wID0gIi9zb2NAMC9idXNA
MzJjMDAwMDAvbGNkaWZAMzJlMDAwMDAiOwogICAgICAgIGVlcHJvbTAgPSAiL3NvY0AwL2J1c0Az
MDgwMDAwMC9pMmNAMzBhMjAwMDAvZWVwcm9tQDUwIjsKICAgICAgICBlZXByb20xID0gIi9zb2NA
MC9idXNAMzA4MDAwMDAvaTJjQDMwYTUwMDAwL2VlcHJvbUA1NyI7CiAgICAgICAgZWVwcm9tMiA9
ICIvc29jQDAvYnVzQDMwODAwMDAwL2kyY0AzMGE1MDAwMC9lZXByb21ANTAiOwogICAgICAgIHVz
YmdhZGdldDAgPSAiL3VzYmcxIjsKICAgIH07CiAgICBjcHVzIHsKICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwweDAwMDAwMDAxPjsKICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwMDAwMDAwPjsK
ICAgICAgICBpZGxlLXN0YXRlcyB7CiAgICAgICAgICAgIGVudHJ5LW1ldGhvZCA9ICJwc2NpIjsK
ICAgICAgICAgICAgY3B1LXBkLXdhaXQgewogICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0saWRsZS1zdGF0ZSI7CiAgICAgICAgICAgICAgICBhcm0scHNjaS1zdXNwZW5kLXBhcmFtID0g
PDB4MDAwMTAwMzM+OwogICAgICAgICAgICAgICAgbG9jYWwtdGltZXItc3RvcDsKICAgICAgICAg
ICAgICAgIGVudHJ5LWxhdGVuY3ktdXMgPSA8MHgwMDAwMDNlOD47CiAgICAgICAgICAgICAgICBl
eGl0LWxhdGVuY3ktdXMgPSA8MHgwMDAwMDJiYz47CiAgICAgICAgICAgICAgICBtaW4tcmVzaWRl
bmN5LXVzID0gPDB4MDAwMDBhOGM+OwogICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAw
MDA2PjsKICAgICAgICAgICAgfTsKICAgICAgICB9OwogICAgICAgIGNwdUAwIHsKICAgICAgICAg
ICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sY29y
dGV4LWE1MyI7CiAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwPjsKICAgICAgICAgICAgY2xv
Y2stbGF0ZW5jeSA9IDwweDAwMDBlZTZjPjsKICAgICAgICAgICAgY2xvY2tzID0gPDB4MDAwMDAw
MDIgMHgwMDAwMDBkNz47CiAgICAgICAgICAgIGVuYWJsZS1tZXRob2QgPSAicHNjaSI7CiAgICAg
ICAgICAgIG5leHQtbGV2ZWwtY2FjaGUgPSA8MHgwMDAwMDAwMz47CiAgICAgICAgICAgIG9wZXJh
dGluZy1wb2ludHMtdjIgPSA8MHgwMDAwMDAwND47CiAgICAgICAgICAgIG52bWVtLWNlbGxzID0g
PDB4MDAwMDAwMDU+OwogICAgICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gInNwZWVkX2dyYWRl
IjsKICAgICAgICAgICAgY3B1LWlkbGUtc3RhdGVzID0gPDB4MDAwMDAwMDY+OwogICAgICAgICAg
ICAjY29vbGluZy1jZWxscyA9IDwweDAwMDAwMDAyPjsKICAgICAgICAgICAgYXJtLXN1cHBseSA9
IDwweDAwMDAwMDA3PjsKICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDA4PjsK
--------------j5m8ZfWeHoMX3vpliPLDyzBP--


