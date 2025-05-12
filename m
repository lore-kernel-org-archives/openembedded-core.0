Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F112DC3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:34:25 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by mx.groups.io with SMTP id smtpd.web11.53513.1747064059719663097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 08:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=Do6FXYyV;
 spf=pass (domain: toradex.com, ip: 194.104.109.113, mailfrom: rogerio.borin@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1747064058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SH8iFO36iWiBDMeVbPtGkKbz1mDt+7+Afg+AOd39Sts=;
	b=Do6FXYyVJYyYM7/ydzAn29F6oMoYAQZH+L/9gjZ2Gyr72fw3l5Gf2hCZNO8C4uzHq2SSSj
	0BNFYVrwcaSlVeAR2T33iaNpMFWkbLMjTJxE/EjyUHDL4Ynjmh5hd/au2sinHhg5+YaZK5
	EYH+C7V+RpWALRKUl1TBgjzgbeqGmT0=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp17012053.outbound.protection.outlook.com
 [40.93.85.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-59-EKbTW3sBPPuqos95T5E23g-1; Mon, 12 May 2025 17:34:16 +0200
X-MC-Unique: EKbTW3sBPPuqos95T5E23g-1
X-Mimecast-MFC-AGG-ID: EKbTW3sBPPuqos95T5E23g_1747064055
Received: from ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1e::11)
 by ZRAP278MB0032.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 15:34:14 +0000
Received: from ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM
 ([fe80::a53b:9416:5d5b:98a2]) by ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM
 ([fe80::a53b:9416:5d5b:98a2%3]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:34:14 +0000
Message-ID: <0c393004-1fa5-4999-a70f-df51cf7dee7d@toradex.com>
Date: Mon, 12 May 2025 12:34:07 -0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot: ensure keys are generated before assembling
 U-Boot FIT image
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
CC: Marek Vasut <marex@denx.de>, Sean Anderson <sean.anderson@seco.com>
References: <20250509213736.3950997-1-rogerio.borin@gmail.com>
 <c8555801fc5b5778d99be7f6527c319a40aa4f8c.camel@siemens.com>
From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
In-Reply-To: <c8555801fc5b5778d99be7f6527c319a40aa4f8c.camel@siemens.com>
X-ClientProxiedBy: CP5P284CA0040.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:96::9) To ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0336:EE_|ZRAP278MB0032:EE_
X-MS-Office365-Filtering-Correlation-Id: 45390d18-edd9-4467-427c-08dd916a72d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WY5f7EIHnL8eIXH7c1o7casyx2kDy9CuTxzlkA/roTfzRsmV2QCge+pPagMi?=
 =?us-ascii?Q?ovKkbMM57ZkAVN4PhABoGXSwELuxfHkbN7RvnWdVhVfJnF4KVAna3nGIXW5w?=
 =?us-ascii?Q?DJ9hVHgQC+JSNx4+QCsYyRyySlfrrdXFNra3iwhknQPP8n0zoGfIWDckXK8L?=
 =?us-ascii?Q?lzUrRKYZ5ql9WMhkAFvyQUXAPCB4yMl+rG+B+WTwgsNSHyr5jYSsTG9E4hc4?=
 =?us-ascii?Q?9f/wvH+7zLA9norV5CCqbH7qP4v4IMMwCQWPKela875q3PCjjr+3FEXa3cJf?=
 =?us-ascii?Q?B/PHAOU2Zij3ovYvdWQ4SeSBoGe9DYfg/4e0f4rrNGAztRuAkPBYyPuU+0tJ?=
 =?us-ascii?Q?8lX0p0CDbEWAEStTw866wqKmOkp8LPXD2xpLQXmnHm8duE/CCjfL5iCOLKrE?=
 =?us-ascii?Q?ZLVsJSW7pE7t3VEF7XrGTXSqyur9tzk/wzku7pt3FO29oPf6KYUpff1XAsKi?=
 =?us-ascii?Q?UMB1lOvEVEpAgZbNste6G07v0cpfN+sA6cDee6U9Ao1K8Km7KAarYFtDsSFN?=
 =?us-ascii?Q?85YOthag9h+QMQQlJBRdXxfkKRoq+X1G6Vv4e3cvYX6W2hZ7BsCBcGKRh5uU?=
 =?us-ascii?Q?QxsVx/VsVV8xo+jMEPTgeAHr5O/roxvOAWPjxFXZ0Se7LX/zKVwzlydNcA5O?=
 =?us-ascii?Q?Q0/K32Hm/cdBvKbba2UZje8Gj64JcVXhuaQe8f4+4R0x/oO8UAGBj2MCQixB?=
 =?us-ascii?Q?d1DHKSAYRM/iXXo9jEoJ7wO7pd/AxBRwFQX+Mj90ngLPJPDe9V8ZwfGIhQni?=
 =?us-ascii?Q?VMWXnWOjvjfs6RDcyK/JGsk8j7c6dU6jZRhhOSIVWrEyumtxbIwUpdQqPS0g?=
 =?us-ascii?Q?xSfOwtgjdmquOtVO36745IxklPloI2nGjSFFzNqc9dyEZUhm7qbJ+HyZQaFA?=
 =?us-ascii?Q?1g+vmKxgea2NkA1n1r87pf2FH8gi8/SxjUlOsaXwnLWAbN+0GIJYYLRphys3?=
 =?us-ascii?Q?eYpfDxsqnCEzK1Wpq9H801IDLvwEpp5qPteR0XmZqh6YzxxxAOJ5RBGgb7pz?=
 =?us-ascii?Q?RhYT0V+G0EyfHchOtaMqebialLHxl7VuPnn4J0VwurWnm8Upv12s25cXRmsQ?=
 =?us-ascii?Q?JuwgP6dsUk22Eo1TAib8IL+SUl+pX1NPECyddYEcXJSiA7ytbg0doUe9z0ca?=
 =?us-ascii?Q?ZyZ+LmmivqHKXyDANp2LLB9zo+70+lew5fVSDHeKDi5wNTOAKVP0Z1XDKEUw?=
 =?us-ascii?Q?RrCzYF3sNKktHJR/KLydSinC0biWy8SIl9W2g4ZTLtz9GqHWuXMRJwJ04hGr?=
 =?us-ascii?Q?cbmjyY7NeYDmfADeNdUvk4E/w4xZSd4yuaIJkflO6u32vrcR8BImI56CPpjF?=
 =?us-ascii?Q?j3DpWXvhhnw6DKbjXptHNMM7+WKOAHzU+rlSlWdBcOSMtz7sbopZ/N7z9udi?=
 =?us-ascii?Q?eMkifgVUSXQ2COkApE4CTF/Flb2+lR2WLPbkku5ihejSXFFUCet8f30JNM5l?=
 =?us-ascii?Q?U+Nb17xYwhM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LHN3IAs9DJRTuNhIlTnbJf89p4l4ZoCz4Oj/SKd5rxyMN8sgFfUWET4iCCXm?=
 =?us-ascii?Q?1lVCY7hoaKj0gPWQm/yAtKZJozSkRwJzKfn4slafSyxivWsm3mSpadQWDwZ6?=
 =?us-ascii?Q?RZBUniYJdVB8NDXvtC/nWv8DsJnMmHeVTlEQcftdHnDuTwoAyKp8mrnQAD2I?=
 =?us-ascii?Q?lEi0eyiyM1kXl07SuapKU4/WUYH4Wdlcc2MuQRyfSU8zfWRYC3DB1fvI//Pw?=
 =?us-ascii?Q?GPYUH1z1NGGf2Arf+SV0LNZ7tQDg7QKtH41DCEvBtuOiI0i/8znLsnVYLNgd?=
 =?us-ascii?Q?72bn02D7Ph9ETL2qMfmWosM4GjOAgkx+Z3eClFg3B3R0R1/IoCZtpife6pLv?=
 =?us-ascii?Q?RK8MG6aNLNx+1JJIFhqHSiQ7dxUtetwtNnVw9Ha8gzj5b+ScKjKAU2/sV/84?=
 =?us-ascii?Q?kromCM59gU0AQTT8CGWoVpqticlycVvBpe65MrZcL33F++gH5o8l75wMeYmE?=
 =?us-ascii?Q?VVGZ6CeVbCD3jV0EwiSqNdtPTsVeh5JLgxap0z1DGC/h+/NgEq5BirLNgl8O?=
 =?us-ascii?Q?vrQZIQuTeDKZXPuuXM394rYP+/ML2U3Ua7L2mzrTjHEmX+PadMbHnGsG1+ct?=
 =?us-ascii?Q?3mzl9obTd5F1xK8CsdiNg9aeUamEPAVOvHFvrWUtKPlpjGgvsD7UW7AQXZ6t?=
 =?us-ascii?Q?ZwoANkfVSripLzps3GHD5TH3zAFUMOLNIYj0RrATn3gbeU0tm5GBLV1Vy4uI?=
 =?us-ascii?Q?kYm/hZOfKyq+E6i6PrgWzqZ9bN1ywHb2j4cS6e6V+4j9i3doWy59MtubDZZH?=
 =?us-ascii?Q?2bG7vEWlxFQ2roSQdMdSEaCfol3uRNxbzmzfPBWbupu/ynFVyw4rX8Fi2wIp?=
 =?us-ascii?Q?rZYlUGdKAKA6Le3gZoWFukf8BurHMOQoWdW5/YugEnGGZTD2oD1Ms7K8c9vn?=
 =?us-ascii?Q?/d/Oeq3nhuZSV7HjEO0LpuQLpe10qFCW+sF67cMaZx+E0JC3RXqQAqJVczlf?=
 =?us-ascii?Q?YaX5SImChtqH+LgPpS3Q8gStKweaBJGJg8l1HmhCZ9NE+LzWCvsUThysvOvo?=
 =?us-ascii?Q?ExtAL0BeUVvK4tHtw5EQUG75RGlMMDh3EJX4WfkwbPm1+ZnJAzHL1oweuhUN?=
 =?us-ascii?Q?wvjrHCAvHid14QLPBcPdYhDgTqs0EGSfyeMLX/UYajXi8kxIaPFcbCobAq2n?=
 =?us-ascii?Q?u4QZ3t1NPs75WYblViolN3Z0LYOomZynFNGR3PEZO/Tj51I65duqixV/S29B?=
 =?us-ascii?Q?vTOYHcKkcXbC9k1zjnWY6UxhIa0iU+/UW+TXkR5do2X14B8osFbnnazXwVdV?=
 =?us-ascii?Q?VNdu8rH+Ty5LW4DF6t3gjvASNycQA4je1tVeOZD3JKLEzd3MlclJWg65KbEh?=
 =?us-ascii?Q?jbYA3OAjXR3Lwxco+uOGBnIAZR8WEIl+JLNilZOJDOsNIp/SMqs+0TAlgwdS?=
 =?us-ascii?Q?XbLR246Z3y4jhtrz1rxY68v7l02UFv0UH2D2kiGwk3zZU34eFC/VpLLMlt/S?=
 =?us-ascii?Q?JMFViwxPww2iwQcRVc4fsCEtVZijxhsfCn925sT8cGX+Pq9bu9l0y9Xb98Nn?=
 =?us-ascii?Q?v1Mseh68LusgG1uueNFNR8iV5C5nSSvMxQJHYQQW2mZNjv5a/t5lA3Gl0PSV?=
 =?us-ascii?Q?49/JZFSERSX78QoTG80wXugfquWuLHMtEsPjB3iDMncLtKfEXpzZ84sKsRVL?=
 =?us-ascii?Q?ypfxGEoE/pyWDSWmtQbvkH5aV0/EBtDNiiQx/kZ9ZiwRSLXlG8PKVKPLsXZz?=
 =?us-ascii?Q?dAyq7w=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45390d18-edd9-4467-427c-08dd916a72d0
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0336.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:34:13.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiApeFiuVRK0AfWrhiuEdfBl1tRu0+5W/j+aDuaYzfYi8U17FX38kke87G3w8LedLeesAKQnzvhRhFnhntILesxEI1eHvxVEawZ7nXwgS4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0032
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -51PRrxDndpCChXcMQk7fPCVXNNe8bkGqeL2jnxK5_0_1747064055
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216376

On 5/10/25 13:59, Freihofer, Adrian wrote:
> This message originated from outside your organization
>=20
> On Fri, 2025-05-09 at 18:37 -0300, Rogerio Guerra Borin wrote:
>> From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
>>
>> Add the task dependency:
>>
>> do_uboot_assemble_fitimage ->
>> virtual/kernel:do_kernel_generate_rsa_keys
>>
>> to ensure the kernel FIT image signing keys are available when
>> creating
>> the U-Boot DTB. This is done only if the signing of the kernel FIT
>> image
>> is enabled (UBOOT_SIGN_ENABLE=3D"1").
>>
>> The lack of the dependency causes build errors when executing a build
>> with no kernel FIT keys initially present in the keys directory. In
>> such
>> cases one would see an output like this in the Bitbake logs:
>>
>> Log data follows:
>>> DEBUG: Executing shell function do_uboot_assemble_fitimage
>>> Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key':
>>> No such file or directory
>>> Failed to sign 'signature' signature node in 'conf-1' conf node
>>> FIT description: Kernel Image image with one or more FDT blobs
>>> ...
>>
>> This issue was introduced by commit 259bfa86f384 where the dependency
>> between U-Boot and the kernel was removed (for good reasons). Before
>> that commit the dependency was set via DEPENDS so that, in terms of
>> tasks, one had:
>>
>> u-boot:do_configure -> virtual/kernel:do_populate_sysroot
>>
>> and the chain leading to the key generation was:
>>
>> virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
>> virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
>> virtual/kernel:do_assemble_fitimage ->
>> virtual/kernel:do_kernel_generate_rsa_keys
>>
>> With the removal of the first dependency, no more guarantees exist
>> that
>> the keys would be present when assembling the U-Boot FIT image.
>> That's
>> the situation we are solving with the present commit.
>>
>> Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if
>> UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
>> Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Sean Anderson <sean.anderson@seco.com>
>> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  =C2=A0meta/classes-recipe/uboot-sign.bbclass | 2 ++
>>  =C2=A01 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-
>> recipe/uboot-sign.bbclass
>> index 76a81546e34..7744e0c5ab5 100644
>> --- a/meta/classes-recipe/uboot-sign.bbclass
>> +++ b/meta/classes-recipe/uboot-sign.bbclass
>> @@ -113,6 +113,8 @@ python() {
>>  =C2=A0=C2=A0=C2=A0=C2=A0 sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D =
'1'
>>  =C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1=
' or sign:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('DEPENDS',=
 " u-boot-tools-native dtc-native")
>> +=C2=A0=C2=A0=C2=A0 if sign:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag('do_uboot_as=
semble_fitimage', 'depends', '
>> virtual/kernel:do_kernel_generate_rsa_keys')
>=20
> Short answer: Thank you for fixing this regression. I basically agree
> with the fix.
> However, could you please also check if FIT_GENERATE_KEYS is enabled?
> Would a v2 like this be fine?
>=20
> + if sign and d.getVar('FIT_GENERATE_KEYS') =3D=3D '1':
> + d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', '
>=20

Absolutely. I'll do it on v2.

>=20
> Longer answer: The way the keys are (and always have been) generated
> presents two major issues from my point of view:
>     1. It creates a dependency from U-Boot on the kernel, which should
>        generally be avoided.
>     2. More problematically, the current implementation leads to random
>        key generation in many use cases:
>         - When building from an existing TMPDIR, the existing key is reus=
ed
>         - When building from an empty TMPDIR, a new key is generated, and
>           signing works automatically with this fresh key
>         - This also occurs when building with an SDK that uses the sstate=
-
>           cache to create the TMPDIR. Since the key is not sstate-cached,=
 each
>           SDK will likely create its own key
>=20
> While FIT_GENERATE_KEYS might be a convenient feature for quick
> experiments, it becomes problematic when maintaining real products
> where using random keys is typically not acceptable. Until now, my
> assumption has been that FIT_GENERATE_KEYS is primarily used for
> testing purposes rather than in actual product deployments. So offering
> the possibility to switch it properly off without pulling in some
> potentially problematic task dependencies is important.
>=20
> We likely need a more sophisticated implementation for the future - one
> that is reproducible, secure, and doesn't create a task dependency from
> U-Boot to the kernel.
> The key management should probably be moved to a separate (native?)
> recipe that provides the key via (native-)sysroots to other recipes.
> Yocto could provide a reasonably secure default implementation for such
> a key provider recipe, which could be easily overridden in a downstream
> layer.
>=20
> I will consider this after the major refactoring of the FIT image is
> merged. Basically, I'm thinking about a recipe that:
>   * Takes an optionally encrypted key via SRC_URI (note that using the
>     fetcher is important for handling key changes reliably)
>   * Provides the decrypted key to other recipes via sysroots
>   * Stores the encrypted key in sstate-cache
>   * Uses a password provided by a non sstate-cached file for decrypting
>     the symmetrically encrypted key
> This would provide a semi-secure, reproducible implementation.
>=20
> For enhanced security, I see two possible implementations:
>   * Replacing the semi-secure signature created by the default
>     implementation later on, independently from the build process (e.g.
>     with a hardware token offering a PKCS#11 interface.
>   * Passing a PKCS#11 interface to Bitbake. However, this appears
>     extremely complicated and raises the question of how to pass the
>     PKCS#11 secret to BitBake. It also raises the question if a PKCS#11
>     interface is available on a build machine.
>=20
> Regards,
> Adrian
>=20
>=20
>>  =C2=A0}
>>  =20
>>  =C2=A0concat_dtb() {
>=20

Thanks for the detailed answer. Yeah, that looks like a promising path=20
to follow for improving the signing infrastructure.

Cheers,
Rogerio


