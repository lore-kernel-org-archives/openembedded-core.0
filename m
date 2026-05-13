Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30ECCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:27:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2747.1778660831067180202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=B2mLyf8X;
 spf=pass (domain: est.tech, ip: 40.107.162.16, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3M/xtFsXElnu24qt+lrjXDYe9a8aUSFCtWVGUtr9Ofszq1nCsGC+Q/LMPloAR95oBbC4rqkor1lSjYO0TjdAWWobQuI3t93+cDbcHSiPKyH9hD2AxpgpSfrpYdvbplhuIceMxRLJ3RiUKNSfft0Yljzo53Cb/L//8r1ol3UxXeWHD76yoqOos1n5jj9ay4uoxxQnNAVnWNw8z2fXGXs5Ir5Am6F7M0YwoGhUAuxhkMZdv4R+dB8pFwPJADoOXvZUIwmKIjjSoSwqZmxL/LwGJ727XKDhtaym7VuQSB85qF7ATqhtXhA6408OS49myYQam2d1pj49DcZu4Wfl6inSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TKF5j5TpVh9LituWON7jhPreiKev3J0dyEJL8O03bE=;
 b=kUc03EvDRuSEvv1FNEH8t7+Z3iuf+ai1ffOhyQMrt04e4jFV7pOzZHhQuWmPgi7jESKkTs/sbBs/zzBux1AJnkPxyulRi/SQa3utJi+s8LFH2jTmvaJhrrSwEwORWsIRiXI2CRl6hPVzRDBfxmh3+YgJKPy+28bNLLkwOBgJJZhzUyIfSIGqhsIEq4mPY6SjMNIZvFGvmAmLlkp71t9UuyMr1+jTIPCr+jbHhX5Acoj0nnyVz7FOSlwyJcUcip2q+ntF373/vPPz8I6BxpyGpZhQAMgE0OWoa+h70ib7CdQum1U7UzvWpkS9ww52MhSovs0EVUSlzjzfDyLGSCAqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TKF5j5TpVh9LituWON7jhPreiKev3J0dyEJL8O03bE=;
 b=B2mLyf8XiYzp+Xl7pStqB4ZBgF3Wum3NI5P+3/Ws/m2Xotn6Uij2icMv2eGhfoc7Jd1nXrh55o1Durv4LqOoM9qX3qsaZfINXIop8EIxdeDyIzokthfiU8DFC0XSzHVjbT2qmNgeGK4qw/MgR4LGrwI1RJ70sYOMhWM61Y6YXwcZX3KdKArDoNG08EnejwcGIwenCOQ3a+3rUN6Uaa+zBEyni18QJukQjfse5rFoCf4NU2ND4IyqGTobIdjcAkSDuZWTXiQuE6PnKN8aygsnx/j5fUCBaTv/OlJNmlsttQpXwZhqiaFhEcTrgTioqA67m+mOgRFGHWqaZh0VN2O7Ww==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB2324.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:476::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 08:27:05 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 08:27:05 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v3] libffi: add ptest support
Thread-Index: 
 AQHc3t79HFJRIyPmnEaLI9NoW4xm/7YIW9SAgAAvgyCAADlegIABUG3kgABxnQCAAO95gIAALya0
Date: Wed, 13 May 2026 08:27:05 +0000
Message-ID: 
 <GV2P189MB3005E48C410DEC97170387B2FE062@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com>
 <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DIGSPNC40V0B.325NZ64GRFWZL@bootlin.com>
 <DIHAXWVL9CB6.2DT385U5BQUR8@bootlin.com>
In-Reply-To: <DIHAXWVL9CB6.2DT385U5BQUR8@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DU0P189MB2324:EE_
x-ms-office365-filtering-correlation-id: 62217dfe-9502-4475-7c1d-08deb0c96a77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|3023799003|11063799003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 sLwgP1QLx3X4DVK/Asi74ivmTTb97V8LXnRU9je9ccXwG8SYeHQZBBgHJrg4/qiokK9+SSq3nByzDIdVmM4xCBjrzpE8VKRQkq4FryKxNbLDNsV+wZwQ/5KbInzuszSsrfcRS9ePEIXsIviRmbkL+Y12BGGt+XKzycvyqZzBK2O8rzCQJl044bK8EwfT4KxbtAATKnovCFIof8MFq9IXFCoUXBiG0pbsPCRiiILzQp4JidPiUzDihJEXjR3BwlQFBwdtkwcK/v4Yc9J6KJRFyp3RmwFq6J2KcNCyBM9Sphx0WQWvi9QFKHRwKdiRsa0rmC1RXfx9d9Y+wCLEcjpXykXb3sZ1AhfQlcVCulpu1o3ADKdM7wQTC/Ueg04LQd73vQHWjl3Oo6J5LrOPuzh+zkRjmZDmOT38VSdT4q0l0m8vWQI59q34dP07PjZqA8GCr1WubfdJ7vuRfLSKmkNh3YC3qHo5Q/tQp7u53Pez/MsrL/H1JIVZfINx6AfD32GUSFeF4ysYfVYW1aaJNBqo7LCiuXlJuV1L6w+3eFBggjbRVtyMmofjJt17LxJ0lHSxrLr+1Do3sSROKUz7JAosuBz7NvyVIhV5qW9gnm06ACkW+ZP9WhAEr1dCeF5xRxiMmvxqQOtiUGo4t8zm+F6nQTYnCxcbyC7BZRd1LMQRW5oi4LYNxhAAnYYqf/EHs4p3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(3023799003)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0Q7pSy65DzhHDGzFpgWSg4MjQl7cSzzgF5FWQptnhJGsOopgmalW/KAyH73D?=
 =?us-ascii?Q?R+fkiSbuJKT5X0CaGsDnj7SRoAApQ1wfShVhsoRiufL7CCwWMDnYPvjOUMfW?=
 =?us-ascii?Q?ryZiPesr6o1UL3Ipr3BfnYTQoEmmU1ui0xoYDSUelsp3DYZ82XtxexUfHp0o?=
 =?us-ascii?Q?gSjXNWzewC5Lo6DDtXNae2hfCsyGOW6+zO2BMRRZ0661V8AWWpyiLnuOC+/H?=
 =?us-ascii?Q?fxK3eF/FatEkFG1gAmpIzAWB3DATLUBtTVA/fpYRNlhtNlQMVqq96FJE0of/?=
 =?us-ascii?Q?PgTMHdu/6vx3AV93urbBol/uUlOVdLJGus0EOm7jknVG19292KYqurD5lKwZ?=
 =?us-ascii?Q?W5lYnL+eKYHGXb4KtGK2IdHKfvlvrxFYIfqipEHcWLt7ln5CwOvDbuPOPlTa?=
 =?us-ascii?Q?v12bPta3fzEGbKUKs/sEj7wm3aM6FzKB0Ti2dgaJUPERn6GSK/EnCvKtAVkM?=
 =?us-ascii?Q?1pbSXlxyFU9dU9hpZiJbXCslja2PlYwPelwZ810DAPYLC7HeybqUQDmtpH6Z?=
 =?us-ascii?Q?UDyhU3UDtmC9iW4C7NLnYJJ24wdyM5k6M/GqBQ3Z8xjNduD91PkPeQBMm0gh?=
 =?us-ascii?Q?+QP6kfZirZ2NTjtvidVmiZPyDqic8BUiOGmQdSafsZixNCdb9Rgv8IFEZneP?=
 =?us-ascii?Q?LHVKWDGspQVO+w0rqQVjrtSCPNu1qVP6EX17nc0HOB/GoAueaqpPFdMknF5b?=
 =?us-ascii?Q?N5ihMwosv8j9mcTeX/48mgSl7Kzm+wytkoBFjsO95Us2QJj1f9nbAgYUkQF4?=
 =?us-ascii?Q?E6DZhw702Ysk05mflII6/dLcJ34p7xIOnz4V6+tIH9zGS/XZ4IcNAjeYWAvw?=
 =?us-ascii?Q?OZWi/EfQla94MXUVvoSySfUWGt2PbQTuYo2rNicYBxnsVgBQ0k8dBgJU+7xP?=
 =?us-ascii?Q?vWiBv5tP5L/ol3S5G/N2wavKNjLFF6GX8dia6n8WPhcQt+Bg2nHaRgKAkLFN?=
 =?us-ascii?Q?vXY/TUzEtFwfCPoqbqpKh9ophtoCR7Ec9ABHmlAURosvtASRnU9WYlVN+4UF?=
 =?us-ascii?Q?3eSh6+JOeDZkZNyrPIUs6fJ0rBQ20jRLGE8jfrclOZ3GHPv8PeTrYx4Z8dD5?=
 =?us-ascii?Q?/rSNDyBfsLRxJyURUAsMCwr/R2384O1wP9BBTPL68KAwjcwgLp1TR4rJnqYJ?=
 =?us-ascii?Q?0REmmSZ7kM8EHLM00rXHnTTs2Yp+jLFZZCRzqeLSK7hAIXdeLfP9QCbubRey?=
 =?us-ascii?Q?dyzJxU63A5KVQw+geeTBFgPUGfbOXy9oyboVcYbd0xFFZCFJrP27FuvGd7XX?=
 =?us-ascii?Q?84vfAUjTgxVmFoIVlGTuS9nIInICwokmjSI+QA/oHhvEp6PoqsVyNGBRrlO/?=
 =?us-ascii?Q?H3rchoWqTIZqORV1k7FszF6TmB1cwTEAjtkNDhRyv47tM6RlB7kDOnPdiMTT?=
 =?us-ascii?Q?MRAoYbrQm2bxYHAe/NnLKq09mQsCHP56gqd89K+KnYCImTo9kRejgGcULkdf?=
 =?us-ascii?Q?29/5H/5Gugz5pKiUa2fSMjeEKGmsC7/bza9CAX35sqfznqdtzFNGaUEcadhA?=
 =?us-ascii?Q?0HTm72/sTDJRbnupVqcLck+VUhGSs+A81RAfTeg7NMbE+LEePvaXJaXNzVor?=
 =?us-ascii?Q?nyRkm82uVRCmcHOJYi1bt+7t5ePCvv10pe93la8VQsS+DXviJU1XSX+MH+JC?=
 =?us-ascii?Q?zJOL6Xsx3j72ZzApFmrf1TMRvSZOzGkOrQVjPX8hv3eYDGVzOu++j7b4ANWg?=
 =?us-ascii?Q?IdDFswLse6+qGtl2v7BIMkySN9kxW7Ew4y+OiERtzyNoupzS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 62217dfe-9502-4475-7c1d-08deb0c96a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 08:27:05.3729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WVq4cT5GVzOcFPXNvwoLRsM9UVZYpTtXbcdP4oMdSx7nflKQkRJwyZdEiVgcBXTrJVNo0qKj38Kw6VmX0msJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2324
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236947

Hi Mathieu,

I was able to reproduce the multilib symlinks conflict locally with the sam=
e configuration. The root cause is that packagegroup-core-buildessential pu=
lls in
gcc-symlinks, g++-symlinks, and cpp-symlinks which conflict in multilib ima=
ges (both arches try to own /usr/bin/gcc).

The fix is to replace:
  RDEPENDS:${PN}-ptest +=3D "packagegroup-core-buildessential"
 with:
  RDEPENDS:${PN}-ptest +=3D "gcc g++ make"

And update run-ptest to find the compiler dynamically rather than hardcodin=
g gcc/g++. I've verified this resolves the multilib conflict -lib64-core-im=
age-sato-sdk builds cleanly with the fix applied.

Once you've had a chance to reproduce the glib-2.0 locale selftest issue, I=
'll send v4 addressing all three problems:
- glib-2.0 locale selftest issue
- Multilib symlinks conflict (use gcc/g++/make instead of packagegroup)
- complex_int exclusion (fails on riscv64)

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, May 13, 2026 7:33 AM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support

On Tue May 12, 2026 at 5:16 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue May 12, 2026 at 10:30 AM CEST, Pratik Farkase wrote:
>> Hi Mathieu,
>>
>> I tested v3 on qemux86-64 against current master and was unable to
>> reproduce the glib-2.0 locale or multilib symlinks failures.
>>
>> Could you share the steps or configuration you used to reproduce the
>> these two issues? That would help me investigate further.
>>
>> Best Regards,
>> Pratik
>>
>
> Hi Pratik,
>
> Regarding the multilib one, I just managed to reproduce it locally:
>
> Using tag oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3808 from
> poky-ci-archive git:
> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-3808
>
> Default local.conf template, with these lines added:
> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib64'
> SANITY_TESTED_DISTROS =3D ''
> OEQA_TESTDISPLAY =3D ':1'
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuil=
der/autobuilder-resource-constraints'
> EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow=
-root-login'
> OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
>
> Then:
> bitbake lib64-core-image-sato-sdk
> ...
> ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf. =
Command '...' returned 1:
> ...
> Running transaction check
> Transaction check succeeded.
> Running transaction test
> Error: Transaction test error:
>   file /usr/bin/g++ conflicts between attempted installs of lib64-g++-sym=
links-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
>   file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks-=
15.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
>   file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-sym=
links-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32
>
> I will try to reproduce the selftest failures.
>

I don't have the selftest issue locally. We can assume it is some sstate
pollution for now, we will go back to it later if it happens again.

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


