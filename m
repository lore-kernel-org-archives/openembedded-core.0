Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EACAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 13:07:03 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.web10.16495.1758632819617256896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=C5q6Y7r6;
 spf=pass (domain: cherry.de, ip: 52.101.69.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZ4IRQMtaLKdSG6yMFaEyg8iY5048OuB8RgBcRCJdunjfZ9zg0HyHWTulQx9DHVlcJLy7GMnyU7PJdVUyHBE7gpulL3R1QnlxMP1VEILQzIC44waO97ZWFx55Vd3fNJ6i7w4dxo8Oi8ywtfIMMj8+Fy3Mk9RdUB1Ys08Fs6BV3BQW3vPj9u0rOfppNLKgxe6SfIiz72nWTbsUd0pcSIK1eDKgc4XbZOeh1Ojf2fHRUYTefK8xzddsxXXFUA6Qo76adIABlVwZqqRE2JoQBuCbakx+Rqza9v3atqHUQgNnGcicL1W2kOnPg7Drp4zVx41OWenCEFG1BdxE3krJZb8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Usxf77XFR9+kZrVUt5sJGMV80rph2HsNDklNJ/m4IZ0=;
 b=vZpV2ZnJ5ar7rRyh8+Hx5+M9y32cY5PVuiZ3LWJgJLxy52jbFXth6+gF+uLxzxTjWdjyjb0KFy6TcT3miLE7gtHKA2kQkYXTg6E1D3G8SxG1zNMSN51EmAxXwGvZ+ySsTeknKE/eJAGB9MHV1y7e66e0HEIxcXXGf88v8RtFOk65mJuknZDHyBXd/ETvYJtFM4clQctSW3TT/elZSiZz+7+nJwfjyYhWxaZxl5u9Q3zgdMo/fe/66y1UPf4if0J20UWJSJzOGLEnUXdVFUrwR/q1XG1oXstBWN+pJMlQhbSd3bhBkwmn5QrsXk6I25XJIYodR01qxdRn3al6T8J/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Usxf77XFR9+kZrVUt5sJGMV80rph2HsNDklNJ/m4IZ0=;
 b=C5q6Y7r6RA3sMlCv4bbrSp1ngnu5Rrqu9HPo48our43kgN9oThTN6+UpTC4cf4kNKEpy5GoUkNtO/VideUahEa5s1YmGAqUKdthkP9nYw0woTKL0Kz1vYNHkuso2mJ9dQAsZVHanBmqDGu3GdiTXzeWvv9zM+BhrT77t9OnXeNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8511.eurprd04.prod.outlook.com (2603:10a6:102:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 13:06:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 13:06:53 +0000
Message-ID: <aea3691c-e260-4bdf-ba4e-32bfada69511@cherry.de>
Date: Tue, 23 Sep 2025 15:06:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add lz4-native dependency for
 Image.lz4
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 richard.purdie@linuxfoundation.org, openembedded-core@lists.openembedded.org
CC: peter.griffin@linaro.org, willmcvicker@google.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20250918-kernel-lz4-v1-1-b40ccf21bbe3@linaro.org>
 <2bcb17c0-d527-478b-9692-00a043a4608f@cherry.de>
 <edd6fa44-ee62-4bd4-afca-e862507c23f5@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <edd6fa44-ee62-4bd4-afca-e862507c23f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e8dd02-b915-4688-9c69-08ddfaa2110d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2lbYLvq6mT67LVl6yBw/FJTikQf4Ohz8kt2yMzmjcp9L1i5Nq7L9GYP/vNpg?=
 =?us-ascii?Q?hi2IA9Js6dDf+Vi/p23zB2eaJqg+haOeIJds30sgHsAIhsCMPB0t1wmalF6t?=
 =?us-ascii?Q?S4nk7hqCskHGMXEOUAxOYzv/t7O7XIwrqcoefZtqt5UTkxwKcIXF+mqkDhWE?=
 =?us-ascii?Q?2oeY/OYKYH5/dGx4EiR0U5nHy/Py5pyPJb/Be76xY/iU93MGAe1hPjl9Yiqt?=
 =?us-ascii?Q?KAO21bE/dpENgUrq6mS7h/4ajcyKz43+44I8JN/4IMYQpgqRsOU1TKotQCwe?=
 =?us-ascii?Q?UCn/cnjbtWMLYaNn5wliiZcb12tVnRm9ud1PpSDB49Zs+UL7kv1nRwi909ER?=
 =?us-ascii?Q?vRBc9p4KLHyKc9NJNjajVfECTy/lFBZ7LGB5YL3PkxszzQkfY7NvLdO66uEU?=
 =?us-ascii?Q?47L3PamvUa9n0aZ/6uubh0hngmxT1ea7h79AT6q7vCam2vdQY4lnqRt+K44a?=
 =?us-ascii?Q?dG9uOaNXdEi0YY7go7krNRt5RXuUyhqXgQoER6Urmu42M0uhoPHYQJRKBmIE?=
 =?us-ascii?Q?A4JeRMzsOfJRB500ecKrEFv06ZNdwJ3lTX9huE4xM5WWPq3H/HHwpFXHsxW6?=
 =?us-ascii?Q?K9BQJbgxOoWmOJ725baPMjNbC7Wd2a6Lu1V6EvEHBjnYh+6noUXyOqM1Hv5C?=
 =?us-ascii?Q?+Gx9RFtfSfDZTF19tOYnUVw3Ynm1nTrYg22pYiYZbmspAs2lE5dNTZWdRLVJ?=
 =?us-ascii?Q?YCFFUOMPt9++LZd3u0pLlXLKVDj1b+ZqOIdRs8DItjf26BQJrlNFWrU5f2Z7?=
 =?us-ascii?Q?AR6NQdLcw++kgY5vytS71/jArGagYQQuAPMo/vAZ3fMSRZzLkY2A2kKglhPN?=
 =?us-ascii?Q?DHiVot5xUL4rvECRKMr0wJrR6h74XjIkcy5DEICjTwcUgsiZhR7JzmWUYFEX?=
 =?us-ascii?Q?KAeVIb2ivqGsGrGtuSCa5LUv1InGvpmfD/KLklB4+AeLPfivO0Niv23iz8Ry?=
 =?us-ascii?Q?teuNPFajuJsutbktzCbtMIWIGkXVmRRMP1RDDCnD9qlvlm6O88ih/wPgVGXI?=
 =?us-ascii?Q?CYV7wui7o7i46guLcCucd4/o1irodKfAiod15E4GaOdYiJgx1g9S4nNu/XXH?=
 =?us-ascii?Q?Xb6v1ct6MW04c89TS6rRfqRJnKPAHyMdK/ppvVZJZat8JgjAU5jo0Q7vFKs8?=
 =?us-ascii?Q?0zG8n6qL3I5utF82yCSnS4H9z3JUVzoVUwWGvDssC9ux5JbkDaWJzO9hywBX?=
 =?us-ascii?Q?1w1TBOuEx01ZT/onsk+7Qxw0E/5lko0Jw123WeFrZ9kMlCaUhIpcI2iCq/vf?=
 =?us-ascii?Q?hOxM9s3Dcbc1pKDFn09AKFvMYCu7Ww/MxjkHBqq2tb41o0eGFNe0rOYrWs3m?=
 =?us-ascii?Q?i5J0h9n5gS49MR1ziZq1dG1TviRklCUTHN9s52UaafG/oLyx00tHgbsi8FOg?=
 =?us-ascii?Q?RN+68W5iau9URI+uNZinL011m529GXMziglL9efGIEyptwGplg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CEEblRmFlGHTXNa0JLeXEDIpQS6gv7wR0rsnCUjRzn77rGOzuxoX/DH943H/?=
 =?us-ascii?Q?UmrtJU7iO8LL5L0eeTuH3Ma7tX3dVKo4FSYDVNFh7yhpqM6Ol0uGDul4rFLv?=
 =?us-ascii?Q?wCdrEWRa/jmnvL1Vqr1diVI7stonJWbTMppIqRE6AAG5WOhIoCQB+y2OTbxq?=
 =?us-ascii?Q?4BQnEoAZ7vo41t9muWmSw5VSTYoq62NIxF6GkRex7agZ5ZZtW5xpPsi37p9c?=
 =?us-ascii?Q?d7OLKx7tzLags0qwyT3tMvjVHQI2FeyasAvGGIdstaLG28rq5CQJ+HMeZXdR?=
 =?us-ascii?Q?/FZXDcUCPZOOU94GeeJXaUPvAiWM9nagtLRJa7zLnfWCmKZAHW2yXXHdKLUA?=
 =?us-ascii?Q?Y3UbqOhPppvznPS3ygAznSb2RPy+H290nNpTZLwv3LZ9jYGB8ur8pg9svB0Q?=
 =?us-ascii?Q?Jg8yF+4pZ3X+Htl2TZdgVHSPy9PhW6D0ssHlQDGvix6ER6MfbZQ8aA6AXuqY?=
 =?us-ascii?Q?BlVxRqvTF999SdYhTsqhUfEsk2UGP2P9D5IPq+sm6Tbc0U4y7i7j4kz+i/Qk?=
 =?us-ascii?Q?kyCeH8gpsJdltMpYb+g28/QqpmQvo5C/LXXcFLwFWaw8WJGH6a0QYsuEX84g?=
 =?us-ascii?Q?2Lk/nJuDJZswvF1rPEvgcyVSepIniDdZLteNWjuPjEPgZHW4U6MXZJ0iQa5y?=
 =?us-ascii?Q?f6z/gRQT07ve4jNZ6K5xrbtmiIV0ShHK8pDU61K3+HzF6Fj/47Rf38hMlI06?=
 =?us-ascii?Q?fr4EBDuKoHqRZSrZ8Xw8JQVhfzBm8rnue3lw+FhGK8r4Jj2U7RMcCl5EcwSq?=
 =?us-ascii?Q?GAU5mFRagISPgl9O+sOUbuCloPtWsPHNu8VTGfwMU62BmQR3WM8tJi6LiWbO?=
 =?us-ascii?Q?nYflQqQT2qJaP3hwXF9i0y1WZdnmheglGaTPGxaU4DVWq5T8ENkKJpmMAlbg?=
 =?us-ascii?Q?G7qbGdD2CtjeADZDgxfKGm5YojoWNidQav4Fo70b7xbjiYjSaco3OS/QxwbT?=
 =?us-ascii?Q?hvo8fug2/vK7SAiOd/UJNr62WK9HOYCsIHOV9BaFZ0QdffcXzMzBmIfGTfYN?=
 =?us-ascii?Q?aSsdfdeq4QwWK1u2t5lIaU0X3oR1AXee5OJJAD2/zWY3saLeTErTxdZ7Xgol?=
 =?us-ascii?Q?Hx6qTxDcOimz9roiFKQxYNMMhUCB4FhA0Kcvf4VWQXkDqBMpqDFnmuurTLIs?=
 =?us-ascii?Q?sb6Z/EBJFl7ujuRPJs1uSab6+lAU2Hy+Z4aIkxEgRXkMStK+DeAoXJAyfgy4?=
 =?us-ascii?Q?jP6O4unFhYL+zzm9ibC6jeJUw6/9m3+kMcWvvZMseX3a4jUC7l/DGWS12He/?=
 =?us-ascii?Q?pmN9o663X2pxaHf+N38y9vybqzPTMjZ12HkF2yBTkZkLX/n/b9zLP2BPVJ2d?=
 =?us-ascii?Q?Rh9uF2owRVxwcot1GJbFtdlk8pCr0X20EqY1vF4gSVEGoK9aJ8+usKtGwiiz?=
 =?us-ascii?Q?vYImdfudx8VDLfAqMR1nWRdCO4pUa1QiOsev4gRsOzXeCpqJERiXjaSNAZc9?=
 =?us-ascii?Q?GkLvm43JeU4BBRckiw7/tWZm2RLwY/C7Lq9gID0b+q8oj5dl9foLIMJxg+Hp?=
 =?us-ascii?Q?TnCDo/ckws5K7Oi3EMSgb+ibcuhhVCIxD/lucj1ECX0+DeTSqvm2Y/rl/9N4?=
 =?us-ascii?Q?r9SBK+jvA5txIIpGMcJPnr1X7LuMumlvxgXsFrwo7u15PL1+auV+b/y4q2Gv?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e8dd02-b915-4688-9c69-08ddfaa2110d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 13:06:53.5640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yEDBIZWzvexQIZ/BatADCsLvhORQU13BJz6J0oHY1vDaaRO6JS8vQ9pldvR2bW4h+PLzJuGFn9CuW2xudWspkPjyVhCxsy53D+XIp7WCSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 13:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223876

On 9/23/25 2:36 PM, Tudor Ambarus wrote:
>=20
>=20
> On 9/23/25 1:29 PM, Quentin Schulz wrote:
>> Hi Tudor,
>=20
> Hi!
>=20
>>
>> On 9/18/25 3:01 PM, Tudor Ambarus via lists.openembedded.org wrote:
>>> [You don't often get email from tudor.ambarus=3Dlinaro.org@lists.openem=
bedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderI=
dentification ]
>>>
>>> The pixel6 kernel build fails with "lz4: command not found"
>>> when KERNEL_IMAGETYPE is set to `Image.lz4`.
>>>
>>> Upstream commit 0c7dc5bae1 ("bitbake.conf: Drop lz4 from HOSTTOOLS")
>>> dropped lz4 from the global `HOSTTOOLS` variable. This meant that
>>> the lz4 binary was no longer automatically provided to build tasks,
>>> causing the compilation to fail.
>>>
>>> Add a conditional dependency on `lz4-native` directly to
>>> `kernel.bbclass`. It ties the dependency directly to the image type
>>> that requires it, making the build more robust.
>>>
>>> Suggested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  =C2=A0 meta/classes-recipe/kernel.bbclass | 1 +
>>>  =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
>>> index eb03424dfc3e023842f7b67ef47468210af72cd1..003a155e794388efd3fa29c=
2c946b18542f4cef8 100644
>>> --- a/meta/classes-recipe/kernel.bbclass
>>> +++ b/meta/classes-recipe/kernel.bbclass
>>> @@ -20,6 +20,7 @@ DEPENDS +=3D "virtual/cross-binutils virtual/cross-cc=
 kmod-native bc-native bison-
>>>  =C2=A0 DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.l=
zo", "lzop-native", "", d)}"
>>>  =C2=A0 DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.l=
z4", "lz4-native", "", d)}"
>>>  =C2=A0 DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.z=
st", "zstd-native", "", d)}"
>>> +DEPENDS +=3D "${@bb.utils.contains("KERNEL_IMAGETYPES", "Image.lz4", "=
lz4-native", "", d)}"
>>
>> There's also gzip, lzo, lzma and xz support for aarch32 per arch/arm/boo=
t/compressed/Makefile.
>>
>> Additionally also bz2, zst and fit for Aarch64 per arch/arm64/boot/Makef=
ile.
>>
>> What about adding those as well so we cover everything?
>>
>=20
> I guess that would be alright, but maybe in a different patch? This one
> adds back something that worked before, but no longer works, the others
> are an extension maybe?
>=20

Indeed, I read a bit too fast the commit log :)

In any case, the patch is already merged so it's necessarily in a new=20
patch :)

Cheers,
Quentin

