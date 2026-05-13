Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD868CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:30:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7712.1778679050410552176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=FXuB5nHj;
 spf=pass (domain: est.tech, ip: 40.107.159.39, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMJhNy5VRtVIo2/CIDdDvnN5oBVdc1Qp8oIlOy07klFtRVZWlFOR7jA1Lyn0zD1o5qjMmxOZat5SM4Mn9/IVuYQ6gPioLSGYymIeV3M5npAh2JFGu2Z+Dd0vK2/1alg68mMp/YgtHZBkIFpDTuoD9IVamuC0ppDwCwWcnLWoE/P1WTY7HADVJhkcyjXwMRMBVFDH+nDKHbkVZVajTQ+ZCZCrUAsCXEnmyplzwo62tSTq8dxw/mVWQKnj5XFlZYLW+24ACRcJp5d48YSjvvmApxK6l81m5U4KEb+SuVXwGTTqQ6m5LcK0H012hof/Rx6jGIetno9H32D+Z8KLEHFVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ04vejRmCVgJx9s42ZLO3IN+NJuQpkcmWDGc3+pyM4=;
 b=CVhmbNKrD8mp+vDo+vY2gFOI34rshj4bYDPi49//oDkp7wPEy1rsUhE3HF+jtnn8VCyMB1Nky5Vm9AdmDGkMnC85ZtDbNEmDA+fuNI/RNXBC6JXLEYlpB01+6FlGKyK+Kr3lyG25RUbLti3PU6XRqKgDypBsdUmICcnPCkdVd6oOEk2C+b2mN4AanMY1Gp05X5z65EECC+4ZSjrmj0t6BrU89CTEc4J23kVnV4Ua1QdxmlMsC7xn3lz2cBtn2/AGmru8FAE4/pxNCapj0Xp2tidNtGvuAilO9Wn+u4na49/Ph2uJQlmEScMn3Vgd6Cv8M36Af2EYTSfZhLChcUxDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ04vejRmCVgJx9s42ZLO3IN+NJuQpkcmWDGc3+pyM4=;
 b=FXuB5nHjoPnZ+ihhlcnppykh/98p8Yi4qW0u2OLZmUys6OqgVUAynqJnpFDRxKvLaK5CLhu3CaWXCWNuEv7BA3pRZrIyqOFs0tWXyrRAqqrrO6+N7B7BMELCEOC7VsoFWWO8fS1tbU4zbZQZDqwVARJIo0BBco0kG/lhSGtQvsMQqje4jZ5HmxWbfrld3GqZYpfpTVvulLJVlYXUZsr+ThAsm9zj5km5pyGmaV5xwLWHbYE71nUxOabIlPi4/g/DZxt5YB2KzvbuhbXN3TEhHzlegvQ3m5v47Kp3yRTe1S5r4uO6dJDJR1ddcknp8OIDtjjEi8fQhpMfd2yN4XVAhw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DB8P189MB0854.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Wed, 13 May
 2026 13:30:45 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 13:30:45 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v3] libffi: add ptest support
Thread-Index: 
 AQHc3t79HFJRIyPmnEaLI9NoW4xm/7YIW9SAgAAvgyCAADlegIABUG3kgABxnQCAAO95gIAALya0gAA0+4CAACDQ5A==
Date: Wed, 13 May 2026 13:30:45 +0000
Message-ID: 
 <GV2P189MB300539A6C4506B6852CFB9D3FE062@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com>
 <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DIGSPNC40V0B.325NZ64GRFWZL@bootlin.com>
 <DIHAXWVL9CB6.2DT385U5BQUR8@bootlin.com>
 <GV2P189MB3005E48C410DEC97170387B2FE062@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DIHIKAQL0NEQ.2BWFTYOSD28MQ@bootlin.com>
In-Reply-To: <DIHIKAQL0NEQ.2BWFTYOSD28MQ@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DB8P189MB0854:EE_
x-ms-office365-filtering-correlation-id: d1de3772-07e0-4076-5f91-08deb0f3d646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700021|56012099003|18002099003|22082099003|11063799003|3023799003;
x-microsoft-antispam-message-info: 
 4QIJkw/CY9T4HTEZ0qeKdL3nCru+Y0GFw/67Z1vJZfge1SK1apL8R2yNholUJxnkyDjQNPmVrW1kM3FK7iBCWLsXnOZcPkP2qSLnjlMLjTUgYSIpuEmEhru2EE3vbZyGvQE2lG6HU8n/pTL1+EwSbLGmCDMAXloLmfOxQTOdJzf5Dr7eLLs272TBZ+4ND2rKodXCRkVIXD1DamBiLwKZyqkoOBbeu+tZ2kCoBSyrQEZiBbleY8Nh6GOXs9nHWh92fICu/82MsjOOenvtHGa16ggEUHW9ro67pMxnoNtH1TXuoWdz5JAw615ilLZkJ9SisA7okKosNoo3hmZ/JcFr83fp6Tgsj0xwIUJge10FDDKl5Tme2tmX7OruJwV606tGVIXIJdE4gOwcRanVAtEkZNcd6KulWDr6sIp6DJrWWDts+Qqwv+Hwcc/TDxoqmVD/td3VC4hpBMtHLpklTgNbS/FLR8yMe3dW+kfTtOQNhdPvg6QIQ2wwtsGR0qK1DGQmTRXhnX+bMcPh659jaXM1jHbtnufNYljp/8QSuaxC12+Ca8vfjp5I/QKxZf7Avnj59+PDHMEcvEJUue2i9TRa1Oep66o77z4E/47IBWSFt6r4HaegEKwvJDdf0NkaUqtZ2ohh3QAzT+CqkuVnQPJB8ALvakTijZMt052KXoAo21LvyZzL3fQ2cqk36P61xglC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700021)(56012099003)(18002099003)(22082099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DU40Umql3CuI7HGXnvS51U/lPRzJRLb6ADEhZ9wm1UZuZMSvNMwB+zmu0hXl?=
 =?us-ascii?Q?lBmSND887E67fjS7lsIuBQfgh+o7mc/0qczi4bfI2teGiDhMdDujPvMv/F1n?=
 =?us-ascii?Q?hUUYdfSGheefxCpHrJRF3vzCNJcD1I8G0vBvK2CYzyT5TP774f2Uy2M+6JiZ?=
 =?us-ascii?Q?Lpd1dMxaiKsCYZmFrwuW32LAGHelWwJkElRekzd1QWwYkycUW2nNKWfR1IH/?=
 =?us-ascii?Q?sUnkWhae/Y6/5sWmUH7OMGZm9PXJ1heG168rMMKdrvJIOkXgEAU6lxmAfZpP?=
 =?us-ascii?Q?Qu+stj63fnwHi7de8qyDGm5NOV6JXAiLNZmClW0ihbb+O9dHg7rvmIiYzev7?=
 =?us-ascii?Q?4tY39qX1PI6ghU7F5BNvQmLOwe8Yef35atfIV4bUA8YVp9Pyd85eeCbLd+cQ?=
 =?us-ascii?Q?UAd+xN+Tj+K8GBwVyOui4/JdYXKejyXYAZGgcLGIBaZA4CENFcWyMleThpcs?=
 =?us-ascii?Q?mWU41B6bMiTctZeSNni93H+kmC1GnFMQNihO/Vxc0l7ULHYd+uzaQhE6BY+I?=
 =?us-ascii?Q?GBf83kEdfEghfolLW2pqvwcCA4bAuQKGjiwRz7oesmfECNm30WD7zntlbPCv?=
 =?us-ascii?Q?69Ve0HrwZZEUSTrmuPSpNJUL09J371iT5Ebn3i0slKnl8FJ6hkMCtubuJxx8?=
 =?us-ascii?Q?fwc4zQNmyp7Y/0V2HR6eer9u8opKQPzy9rUhgE7vpTAF/Mp9eGuSqhGUBi+K?=
 =?us-ascii?Q?uFH79HrNMrzFnmt4pXP/gAMDJtJYu+mIJEDYRA/XGi0wXCfucFOUjTB1hhBY?=
 =?us-ascii?Q?Wp1hxJ63+Moold33V+iid8zv3KX1ZtU/lQTo2jDL1Ffhg/elUiPqiwX93i8/?=
 =?us-ascii?Q?hbEeLSBfwAVnwA4oF2MY6AHWnNlvt9xXNsBOo8UcyM9aCNdwewUd7MWN0pkr?=
 =?us-ascii?Q?ceOtS79Co/Fr75bkrbBc431A4/h+oPrZsJsj8yPsJ9T8wjuZPAhp+/CHH8kx?=
 =?us-ascii?Q?I8F4JmMrT9Ioa7T3/mmEXLvaLGxUpJ0ABsXBajVhKkp+P4Zw7S0USQcSVcYa?=
 =?us-ascii?Q?Sp57778QYOCEkSfrTcDfnlRblx4/dcRiwF9TNuoi/J9v2m+t+Q2tJ8YvSXLX?=
 =?us-ascii?Q?1C5dJVLvO8XYLMrEzQCaIXJWWJdhO7zxLWLwSDgent40zarO4mpllzpYP2Ps?=
 =?us-ascii?Q?4iETKAfe8D0vLMP6glDZKDSfSChQEPfLKVCj6Q4miSRqq5FNYlC0YR6WIgl3?=
 =?us-ascii?Q?Fpo9AQ1wWsGfG/3BeThC/4kHFKHoKTI4eq0nopInKM7P5yVn1Tf624SCBhsF?=
 =?us-ascii?Q?MJQY0khbBfe5/MfRG7gJr8q3Nc/JJJXdHMdesoLjaOOj65kSZYwEyNwDAzjd?=
 =?us-ascii?Q?q784jzYJ8Fl1nB91dLeb/a2kI9gmhtuAnF1czSTARVF8aW50ORr1Due9AFVs?=
 =?us-ascii?Q?7CGXDqRKe5SK8CMG0pfaOPO/gHDzyOyl1Lpfj8udOngzou3zrDAGoLx4O0ra?=
 =?us-ascii?Q?ALYmpPoITUe48N4H/F64oKDR1gQd/mGNiNQvXID/3zUI+IRnXlLEV49MuZZG?=
 =?us-ascii?Q?KMiuXq/GWH8A/Zc3L0yC1Sr8F1IQYI+LRdcnK93rzNakESc1Wc05mXaGYiOi?=
 =?us-ascii?Q?i9VtlSODj5ITBFXtu+1Kn8HE0aKHrLLcdlScjQmVAwBKbgB9jOOfJtIs3l8k?=
 =?us-ascii?Q?H2TjosM7NfXVb68Re863W6w44jBoM+PJLfvbD3W2/NcKwjg+CeTdxJLBgOuM?=
 =?us-ascii?Q?sC4Ajwpb+kD5eBLZfUEzJhNL3q57lDRXaSgT/bA3MzCDYzpSRAkpeWjQBr1Q?=
 =?us-ascii?Q?l++shHKOTA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1de3772-07e0-4076-5f91-08deb0f3d646
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 13:30:45.1252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KlFxFsPpk5EknDe42DXjHK9C3Ox2TChgEfxTUTaquNgcEnkDJGP834UFzQed0E8zJHD5m+h4v3H/Hq/yOtxjaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0854
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236978

Hi Mathieu,

I have sent a v4 which addresses the issues you reported:

- Replaced packagegroup-core-buildessential with "gcc g++ make" to fix
   the multilib symlinks conflict in lib64-core-image-sato-sdk
- Excluded complex_int test (fails on riscv64)
- Compiler is detected dynamically in run-ptest (works without symlinks)

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, May 13, 2026 1:31 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support

On Wed May 13, 2026 at 10:27 AM CEST, Pratik Farkase wrote:
> Hi Mathieu,
>
> I was able to reproduce the multilib symlinks conflict locally with the s=
ame configuration. The root cause is that packagegroup-core-buildessential =
pulls in
> gcc-symlinks, g++-symlinks, and cpp-symlinks which conflict in multilib i=
mages (both arches try to own /usr/bin/gcc).
>
> The fix is to replace:
>   RDEPENDS:${PN}-ptest +=3D "packagegroup-core-buildessential"
>  with:
>   RDEPENDS:${PN}-ptest +=3D "gcc g++ make"
>
> And update run-ptest to find the compiler dynamically rather than hardcod=
ing gcc/g++. I've verified this resolves the multilib conflict -lib64-core-=
image-sato-sdk builds cleanly with the fix applied.

Thanks.

>
> Once you've had a chance to reproduce the glib-2.0 locale selftest issue,=
 I'll send v4 addressing all three problems:
> - glib-2.0 locale selftest issue
> - Multilib symlinks conflict (use gcc/g++/make instead of packagegroup)
> - complex_int exclusion (fails on riscv64)

I failed to do that yesterday, and I won't have time to look at this in
the coming days. As I said, it might be some other issue that just shows
here.

Send your v4 when you are ready, if we are a bit lucky we won't see this
issue anymore.

>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Sent: Wednesday, May 13, 2026 7:33 AM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
>
> On Tue May 12, 2026 at 5:16 PM CEST, Mathieu Dubois-Briand wrote:
>> On Tue May 12, 2026 at 10:30 AM CEST, Pratik Farkase wrote:
>>> Hi Mathieu,
>>>
>>> I tested v3 on qemux86-64 against current master and was unable to
>>> reproduce the glib-2.0 locale or multilib symlinks failures.
>>>
>>> Could you share the steps or configuration you used to reproduce the
>>> these two issues? That would help me investigate further.
>>>
>>> Best Regards,
>>> Pratik
>>>
>>
>> Hi Pratik,
>>
>> Regarding the multilib one, I just managed to reproduce it locally:
>>
>> Using tag oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3808 from
>> poky-ci-archive git:
>> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder=
.yoctoproject.org/valkyrie/a-full-3808
>>
>> Default local.conf template, with these lines added:
>> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib64'
>> SANITY_TESTED_DISTROS =3D ''
>> OEQA_TESTDISPLAY =3D ':1'
>> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobui=
lder/autobuilder-resource-constraints'
>> EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allo=
w-root-login'
>> OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
>>
>> Then:
>> bitbake lib64-core-image-sato-sdk
>> ...
>> ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf.=
 Command '...' returned 1:
>> ...
>> Running transaction check
>> Transaction check succeeded.
>> Running transaction test
>> Error: Transaction test error:
>>   file /usr/bin/g++ conflicts between attempted installs of lib64-g++-sy=
mlinks-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
>>   file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks=
-15.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
>>   file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-sy=
mlinks-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32
>>
>> I will try to reproduce the selftest failures.
>>
>
> I don't have the selftest issue locally. We can assume it is some sstate
> pollution for now, we will go back to it later if it happens again.
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com




--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


