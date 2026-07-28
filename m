Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AE2C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 08:25:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7184.1785227049579309301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 01:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=W1OnHsDM;
 spf=pass (domain: est.tech, ip: 52.101.83.0, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk7fHbqYcNyUZQr5AFntM2w/TZuH/pc42skLg0tRFeTNEao+iNDLwkuSU6NkA7IZjUu+sBSDVG937sa5b/YFCgvOr+lTNWZnMEMte0fvmdmbxc4hIpLwLpztNo9yIqtRTq8W8ZqN2jRm5Iru9k5wNRrHEWQCtNfTjmAzk4KlnoT539/xv6UL25ZbdlLVWyij94CrwDSQoEfFoc0IMAO4TZ1kp6Fxo0KIuU6kPGnGPeEjlqCvPrQPDZUJpyKFy+HevfNkoKQXf+60j3acRWLZw+PeVu+PF8oLlSjP60NCIEuae/1wUgwgYZuu0eITPNKcXrFIjy4ZQBfyX6fZVgJ1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqmEBm6/dRLcofU0JesBKQNlkRlyVzeI4ZuxJ7QgI34=;
 b=CNiqLz+aRJg/OA60leO+XQ00rPYZUMWeq8GpARQhFVuJmmExWQkooVHJu3CCitTIR3UNuDhn7Sj+F1muXEgw7GtI2jxZHFGZ4EW52ZNES/unhEhz1tzarN2fMHJpVnkfIqGQpNFROoOfuepr5bv+A5qiyzCY5Uoud8nz7LS6Lp7jfoC0c1s3FRJdA6N9MMRXNY5TYfOa+eG1S4Z2jZx6XOwiL9Kw1u8V+sN1eFXwLbRXVru6BNSA6SzBAgU4wX91K1p3QeYPxay4mtvTjiJBSZL48KJXbpFAZ2taKzCmldwbaabLyGAcYw9pj2MucWBrPMagSiTRCQ8gS6XQKuc2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqmEBm6/dRLcofU0JesBKQNlkRlyVzeI4ZuxJ7QgI34=;
 b=W1OnHsDM7CYIrACuh0KO1zgfERxae9uvGlMnj4ojol17HE25oSON+8Wgk3yvQPLwsqsrURaYeSgfPr2rNFzcW24tlPxJMV3t/q/U/s6CWN49JhgJLj54zRqnaw6NY7/sPPBMYeO4S/sYlN93uGCWsFoyTWf77Gyl6Kbv0i3lQN/xVdrLm7Lm0Lrgg6+2s0mxRB+JcG8ANOx+XdfWgpWsJ8ACRcnylg760FdRNnE9j4gIywWbzAmEnPd8iRgq66sVgRv1J0zgYIdXPDl6Xy0nVIVNMB9ioaTI411IF4AM+rlZwwwscFNIcDGGL9jMLb+UrCD8jxVGfn3yT56h/AjYvA==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI2P189MB3587.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:297::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 08:24:03 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 08:24:03 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] glibc: stable 2.43 branch updates
Thread-Topic: [OE-core][PATCH] glibc: stable 2.43 branch updates
Thread-Index: AQHdHbshJwbEeXHRJUGbtE+Z55bSsbaCW9+AgAA6G7E=
Date: Tue, 28 Jul 2026 08:24:03 +0000
Message-ID: 
 <AS8P189MB167215816D7316E8DF75329DB3CB2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260727112902.1653529-1-adarsh.jagadish.kamini@est.tech>
 <DK9XHGRCG7LU.1L6EFEVZGMPXB@bootlin.com>
In-Reply-To: <DK9XHGRCG7LU.1L6EFEVZGMPXB@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|VI2P189MB3587:EE_
x-ms-office365-filtering-correlation-id: 7220acc0-e915-4bec-1f18-08deec819571
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021|10067099003;
x-microsoft-antispam-message-info: 
 Ght2GhQ/E0X4qjVFwYf546K8134IUE+HbURyZwIl9NjrMOMneBzCKC10mGokNeHhF7txw2M2T+kq72C24CTmxh1OxDDscoESMG3rmTcSBALFUF0LCYDpkaAMZXI23toNg8hvWNO/si8sw3waDRAMNedwjPLIUA8G52Ss71hbAokyupe0PL13GxmeSjerP/AwJMzHJNsXuxetlx7MI2YpcMAlrNXyvczsYv8SKAp2fUYx2bT1lmzIZRKC1R6U8MxWuHWMsUSa8uQENeVjEzshCDBjcXVkJAU86LKN10aOouiowE5U5T7s7N5KjVA7rCmjKpT86+6fqfiZsdWyVqDRFrODpPlvu7MVsADOPoqN/AE0FfU8dngVxQsFJI8/HV/g6dAG/dTPXhfxyaSE4BrtxsIAtabawHY2trdQ1PcWvbOCCBLXoIQNAgl3TNzuF/y/NsgUg/6Ii63odqpnhJVTOsj2b1mVK24obnoAiMIfp0HVWBxgCjk+DNnAUGlDiraf4x2KuzlVdeUn56MyQLcL+usjpK2/nA698OLFTx+efl4xJj2kYspRysllvhywkU2fsV2vIlqLBFftc0jYbHybQAhHutku+3AZz0J7qW48Vu0ahtN24+xqQL9In+IVtXG/IW4Al/bTlHmzxc7bzBhKsMroG2fM2j/VZgPcNzyhxhs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?JwWQ40oY44NNLXDPH2DRQrbcOhUmUQRM98rBZKKHCVg3ZbMALOHnGMrvbk?=
 =?iso-8859-1?Q?Q29AuigUR1O/tREhkwvvpQrdrb247LS/mu+NYuONiAHAYNemJeLa41jRhI?=
 =?iso-8859-1?Q?rCbCeH1jQdegoAooLgagZzYXZLsaQeXbICZ9CmrZv1hpZe6JSlGkpBnehX?=
 =?iso-8859-1?Q?YD4ATm9BeqAqKciKt+7QLFFP156oic+OJuSXqz9pWacaj751TXFM5yUYvR?=
 =?iso-8859-1?Q?tN++I+Bf8uwnrPdiqlDcfBm7UIau27yyVfBMzi3Jd8HQCruhWVOs3qzheY?=
 =?iso-8859-1?Q?BZkMTtw5iqve9YinU0gZ0pMTkiKbaN7CDKu1ZfaOMBuWnddgjI9NAZ+9lf?=
 =?iso-8859-1?Q?g7Gga8ptrbXsoPg8qzR2In7wyUmMMxg8+jeti+NrInw0sZS0ZSm7J/b3IG?=
 =?iso-8859-1?Q?lu1nnAdAWMMJquVAxS0RDZPSYCgVji8ObU1JwwdCvElVEKa1HXbCGCEyKN?=
 =?iso-8859-1?Q?AvP2bM6k//MHOTGlZcY0W1IchhfelSWsIMC10V6AkKysrtNN4ScPEp/UsV?=
 =?iso-8859-1?Q?Koe0tMiuLJ8s3k2y46mQTnCziMc/DG2YeWJIbp64Zxk54Ar9tfuyIHxtwL?=
 =?iso-8859-1?Q?dDqJr6ufOkoeGqh7aSwOGw9oVTS+KQ7nuP0oKFuT/vpz/oqkTenEZBF1UY?=
 =?iso-8859-1?Q?4txzWVHqSfmXCvJXnybwmsdaCGMm5yZatwUc3hCsef3w5CPqX0twP4pVyF?=
 =?iso-8859-1?Q?StjMQWr5FByhNG2Jn1jQos/41g1XMbocYh1TrN8imp9LulvQ1nbxHwXZBJ?=
 =?iso-8859-1?Q?V3cg79ol2gyL71OR0iRfxL+7pFvkRaQIMOpSuRsxWdM4RwFCd3AARyqSM6?=
 =?iso-8859-1?Q?jLdpPIOAbPEIsVq8aj1k/erj4P09SbudwgSECJYkghr6pu+XQaUFBcjkUK?=
 =?iso-8859-1?Q?C4mqtz0vzqAyvcBwDkh0a02VAzCVH54vyUxh9j0Rn6jY6QUOlYGLICO3Uy?=
 =?iso-8859-1?Q?EJfAsBJPcjo5AjVcf5j/uHl0MZ6RE9ktuKlWdglX6y2NuuIef/8tiKgwKs?=
 =?iso-8859-1?Q?a9HFMvWuKtq8VI066tQeWRqmoEdk0L1/R1XCpehK9J/jyK51QOnhlJgDrF?=
 =?iso-8859-1?Q?RQaoyjqOnXeGm2ueidiiO7amNg0le+RR0JH9Ne+O1UJy+MfjqhK08I1J83?=
 =?iso-8859-1?Q?qzZf3pu707OTwI5aW4xipQGFO7zOCk/H+rBPsYrXX7SFl7oqRzCEadVJal?=
 =?iso-8859-1?Q?1JlM4VEarNWvuicfcNKSdgM8NTOFZQZ8vsNzjwjg0O20ZASBb2TrOUPyLO?=
 =?iso-8859-1?Q?rZ2RBG+Nn8sKcn8YtBg7EcqYoBndW9ZpQc7L6eD/BQAc8Ty0/ihFMYJa9b?=
 =?iso-8859-1?Q?hqCJxUCP89wmt4gmQK+NKNs12CnreI/HOLC4TTMtkj0f64InuIJkgW0tnD?=
 =?iso-8859-1?Q?QuccfY2cRiOaf90A23uSz02TfI6PB4OeCKyTS7FHbBXheBZT4n52bqaZk+?=
 =?iso-8859-1?Q?f9IYEjxyltQd7rYkmFOYgaaw/brksxvQxWDDUG8IzWCq4mm9/5AwUNlpYl?=
 =?iso-8859-1?Q?r4j7QU9amnL6HXievqaj6vqWyABIoM9Pa0khDLq8HG10lTjhZ367UyQCqH?=
 =?iso-8859-1?Q?UgrEnu6R24QWnHLON5LV+A+KZttNhN+hJVUGmlcbMesTd5Mt6FQfIcQTpV?=
 =?iso-8859-1?Q?eE5R0/HUbRy4EWddkn09+tSpyyIj40v2k/IoHiMvf1iwMnluZdp9c7NCMi?=
 =?iso-8859-1?Q?mewtcLudcjk9mQCmwU6UfG+0S1SYNAnduKuXcUiJbM66x4Gi2rdzMKWRUb?=
 =?iso-8859-1?Q?5ADqv1wqNm2zp+BFFC6EwxCYjRTGokC3FgbBKCMEVvQP9SdhHeHE3+I5I1?=
 =?iso-8859-1?Q?OSyNZau/yoa1/bJTFwVXS82wh1T+wUIB5huJksLMdVvOwx7TkZwVvhmoYj?=
 =?iso-8859-1?Q?QU?=
x-ms-exchange-antispam-messagedata-1: LPO1RhNCG4xw87gmkpvSGE76Vg5iBuivQEE=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7220acc0-e915-4bec-1f18-08deec819571
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 08:24:03.4815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnA8qsb1W8RYbXdMm81aeDXlYysLoKW6IlDfsPkWSYkljjJIzvDGLA3p+we6/KnQSoimBuAKsz/iTA5Ge70xh9ajnLNdPGlybYR/Qa66R+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3587
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 08:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242170

=0A=
=0A=
=0A=
________________________________________=0A=
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>=0A=
Sent: Tuesday, July 28, 2026 06:43=0A=
To: Adarsh Jagadish Kamini; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH] glibc: stable 2.43 branch updates=0A=
=0A=
On Mon Jul 27, 2026 at 1:29 PM CEST, Adarsh Jagadish Kamini wrote:=0A=
> Update SRCREV to pull the latest fixes from the upstream=0A=
> release/2.43/master branch, including fixes for the following CVEs:=0A=
>=0A=
>   CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf=0A=
>   CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #3400=
8]=0A=
>   CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]=
=0A=
>   CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf=0A=
>   CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ=
 34091)=0A=
>=0A=
> Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e52=
5):=0A=
>=0A=
> 1c9988e525 rtld: cache cpuid results on the stack for intel=0A=
> dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091=
, CVE-2026-6791)=0A=
> 8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)=
=0A=
> 3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)=
=0A=
> e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)=
=0A=
> c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf=0A=
> c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf=
=0A=
> 1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug=
 34289)=0A=
> 349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use=
=0A=
> fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)=0A=
> a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, =
BZ 15792)=0A=
> fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236=
)=0A=
> 22f3d24a6b Hurd: restore some SIOC ioctls=0A=
> a13ebdbc7e Hurd: comment ioctls which cannot currently compile=0A=
> 446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines=0A=
> ced45fd472 Hurd: comment PF_LINK/AF_LINK defines=0A=
> 89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cach=
e [BZ #34210]=0A=
> 18b97b03b7 Rename __unused fields to __glibc_reserved.=0A=
> a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64=
 (BZ 34183)=0A=
> 4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]=0A=
> 2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]=0A=
>=0A=
> Testing Results:=0A=
>              Before    After    Diff=0A=
> PASS         6609      6611      +2=0A=
> XPASS        4         4          0=0A=
> FAIL         131       132       +1=0A=
> XFAIL        16        16         0=0A=
> UNSUPPORTED  554       555       +1=0A=
>=0A=
> Changes in testcases:=0A=
>=0A=
> testcase-name                                before  after=0A=
> resolv/tst-ns_sprintrr(new)                    -     PASS=0A=
> nptl/tst-robustpi7                            PASS    FAIL=0A=
>=0A=
> [Note: The uplift adds new testcases including resolv/tst-ns_sprintrr=0A=
> from commit 8759917de5, which passes, accounting for the PASS and=0A=
> UNSUPPORTED increases.=0A=
>=0A=
> nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under=0A=
> QEMU user-mode emulation (PI robust-mutex handling). No nptl code was=0A=
> changed in the SRCREV range.]=0A=
>=0A=
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>=
=0A=
> ---=0A=
=0A=
Hi Adarsh,=0A=
=0A=
Thanks for your patch, but this is not building at all. You will need to=0A=
refresh or drop some patches:=0A=
=0A=
ERROR: nativesdk-glibc-2.43+git-r1 do_patch: Applying patch '/srv/pokybuild=
/yocto-worker/genericx86-64/build/layers/openembedded-core/meta/recipes-cor=
e/glibc/glibc/0023-CVE-2026-5450.patch' on target directory '/srv/pokybuild=
/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-pokysdk-l=
inux/nativesdk-glibc/2.43+git/sources/glibc-2.43+git'=0A=
=0A=
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4241=0A=
=0A=
Can you have a look at the issue?=0A=
=0A=
Thanks,=0A=
Mathieu=0A=
=0A=
--=0A=
Mathieu Dubois-Briand, Bootlin=0A=
Embedded Linux and Kernel engineering=0A=
https://bootlin.com=0A=
=0A=
=0A=
Hi Mathieu,=0A=
I will check again.=0A=
=0A=
Thanks!=

