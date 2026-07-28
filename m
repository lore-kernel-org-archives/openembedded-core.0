Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE403C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:38:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8096.1785232979213523209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 03:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=VhC5sJW5;
 spf=pass (domain: est.tech, ip: 40.107.162.42, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCx/2zIVEZyhkRikyRYQ0ZEi50Ubk4cQEkwM00F52AsO0JaY7gZnyfMdYQjce4CLO/Rw4LiMdDIe4/13l9dqL8YCbdOv5Qbyrnmt3WvR+Zz33rxcz6wVYBqAPiWC156IJBcusKYT0bEePePSj7rmeXLxP4yYxSvsjQ+ksNNRYByEcQKvQhZkKpQYjRLbgO7DGYkc/77c1qP3lRBtCYpaaZ5BTGPiK1pSpb+qA7/eZSUHz8ZJEuprjitZFJxUWMfNxb+4IC3mnjr+V+CGmajZ3HuHCjMOCluFmwxYBY5V4QlcmMezgCoB8NXWbocBg+w6rvRqvpXVhEXCNiUROdE80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXWbyoC5cujHj5R6fsAFM8vj58WyabaQJdptFj2pths=;
 b=y0liDdT3uMN+Xzs338ct1bnxO4E8vU0JAz88cihRkFQSmEOA+kO4+y5V85AvT8PtecYwxtOvqfOXGNp7I8Hns0V1Y92JXnn8WwQ13FTlDtcj04yAT7Kv5MDrC1XNiRJwRMEFSGOxiz9yiRCRB+FbkJ3vd+jnyEfH/LvTo8peRftEZ1QxMz1r6EN/T/GjQabfyENPxOVkhWDB6qWkFIle5//nBq8fdiGTwIjsrW67bU9NEc8eI78fmRtk2Wgj4I8TB/nNL129u4Y7BlpKqitS7i/9InHltN1H9L3y/FOOHby7nilndYyCABcrrSSyeba54hrb9Mpy70lhh3rFtoXoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXWbyoC5cujHj5R6fsAFM8vj58WyabaQJdptFj2pths=;
 b=VhC5sJW5FCJaahHyt47yghpxgn1n4urLhOrDpMCQ2ghz13B/pfJETSoXmUbroJDNgfVy0gjjzt8sNZA1hjnMC1QKEm0QpZiSQ/rH50p/KAA07yBrqpsMeRQhkwUsvO1OPfmQi7iQz0hgbtdETA/JjLB9fQL7CTGl4NcowefnMlI4J8Xl2sDTkPZY4PwlpLTTlV0dbocq8bOrVWwWwHL22hqsPaNr5UEC+/zcfE4JPLMX414bkqcDeo+SpNow/7lHCQrd6FdQb8zaVlWOxUiHvOBF6x4gzxDLwcbr/knmN24L4R11sdGmAb0sxUQ3QajGpNDR+qro5tne4ALhMGGOfg==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2073.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:394::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:02:55 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 10:02:55 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] glibc: stable 2.43 branch updates
Thread-Topic: [OE-core][PATCH] glibc: stable 2.43 branch updates
Thread-Index: AQHdHbshJwbEeXHRJUGbtE+Z55bSsbaCW9+AgAA6G7GAABzBBA==
Date: Tue, 28 Jul 2026 10:02:55 +0000
Message-ID: 
 <AS8P189MB16727C6ADFA9FA3534EB2A93B3CB2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260727112902.1653529-1-adarsh.jagadish.kamini@est.tech>
 <DK9XHGRCG7LU.1L6EFEVZGMPXB@bootlin.com>
 <AS8P189MB167215816D7316E8DF75329DB3CB2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS8P189MB167215816D7316E8DF75329DB3CB2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DB9P189MB2073:EE_
x-ms-office365-filtering-correlation-id: d3cb5968-0dbb-4a27-23d9-08deec8f64fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: 
 prJD652o6jme7Qr9ThTJqxqEESLAGhyq84GH2kUIV/iqXAWFtHesUlrvV5zb55lpKPY4BpCotpu8hqixIO0oJXkQUL0MauoGwGun2AGtw5xc9AtEgrEE8AE8mEbjuqZWeCHUzanDh5sSUeGHQbxlVyM77/dzmvpmXgcBBVGv6O1u2YaKRMK0ehPNYps5OXXJ7MnfRTdydu5J684oqVxVG3y9Uwhgijh540gIXV6SiH1AETlwuaN9YYkoGIS7f/6NFKZSxB3xcUT5lbsJ1z9sJwzZCMoRauNDSgOk3oB0b6g7dGbFyrw0iBvpFUm0EFMoG85Y5mCWOUZq6H9mXEW7eAB0IxzLvucVpIMAqaDJuWhM6VEuV4YjoJi9vKBXRfvnYgHkMKQ3FPUBEtlAs5r9x8KGeO7K8lNsNxL6vr2tiRx7vaV7ffiDuGIQiP36phlZhyRSTXihqmjutB/d2YCliY7cnyg/S9ywL4TYCmfce3y6/mhfrk2VWENWBVVnkSHM1BFjvaXPkeRJhchlcpz2uZWod/FsglNPLReuK3fTAfgY+YjmLgCkPFOItbbUSZexAXo2wEqbpX8T1+uQ0gkZJTMBF/FN6JcYofJGhJmCp4wobHSSLBWv6zDgFHs2d2Nx9jD4vza6yF0eU/srrzs0ToT75zM0W12ONcuyaf4RI84=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?keaJUbL+wQQAwzVG1fKr/YplST5tzp+SpAzThFGsBfaL+BtC26Ulb8d1Mf?=
 =?iso-8859-1?Q?Qvu9sq2t3j6IYqUMh004xdkonsJIopWgiJy7mgDqwL9iwFT5hPJ8J5VgC6?=
 =?iso-8859-1?Q?S8voq8NmdJipofE2DJrj25wTOqlYfAR2CiysGvha+wupwug47ji/go/mdj?=
 =?iso-8859-1?Q?wpi+GwasTg9mN+Tp6hNkCZg7xGmVBifIhkNfd8IoHn7gO/wpcOkqfDQJMk?=
 =?iso-8859-1?Q?TbHeVtGmVvUSMxROkqS9G7ZyXcCdLlgpxYj9nBCQLnnUx0L0Ga/Mpo9fKE?=
 =?iso-8859-1?Q?UQjzhwuyjI+wwhb2xksxO91rQe6rVTFvOQRemfoO0UaeOXn2ANbEC3Tera?=
 =?iso-8859-1?Q?4K8sI98nUoQfgVXzg9XWsiYGSK4Nio9WUDhdBAfndOTP7cWWFGLH9il7NY?=
 =?iso-8859-1?Q?EpFm6yZjaMiPrPkknYxjbl9SnNYPZ2fnXAGZaMWNPjugOZQlbSK4MfjsUh?=
 =?iso-8859-1?Q?PI7wanj0XA1UdFbnOqV0fVA5sdfG/mpm266I+vynrvi/cXOcikVAv5zL2e?=
 =?iso-8859-1?Q?CGsGYSMw5goxGrMZS5usD4fHxNx8Q/FAeYLM9bkFwpg6b8xffkWmiRX0ao?=
 =?iso-8859-1?Q?6AgZMLU6osT/tMd1QGD7U1AWyEGzIRQWDwnn7vUXuOggI0UqZr/nqHIXTX?=
 =?iso-8859-1?Q?fCVZVNUsMaxaKGJ2g0rdjfAGjXEtx4KcOE5YZXt8xWrhrfAjT/lWLCacLh?=
 =?iso-8859-1?Q?PJ3uWG/JFmv4txYwSq+36j98Om5eDvgV+ey8Q1MFND+Id98bso3ZYnsaNN?=
 =?iso-8859-1?Q?coGSmU2+6HfMSN/Pd6EhTm5bnRybLAyJ0rM0u+b55CMOlh6NJmyYWROHOi?=
 =?iso-8859-1?Q?oBpXCxN/KynnGu9mIDbDp/uU9hIGu6pwLfpn6ADcVT2OF7xfifg/9IZIH+?=
 =?iso-8859-1?Q?IUazJOfCUB6bhDzC9jXsLRK63wefjiOrjKjwqZMhLFLwvyEqiO3iN1K/Ts?=
 =?iso-8859-1?Q?SDBOHD4TzSpJXNybFCj6HXYd3Xx019lXaP9pXTe8LIYMejvWnpgUZaAr5/?=
 =?iso-8859-1?Q?fWYqIcFhr1uk79ZeVZZ90pu+6b/kPVG48QbaJIkgfrXvRcNPFmBxfGIkNo?=
 =?iso-8859-1?Q?2ltuKOwGjO870tDX66YDW6dwDKPqfFsjpsCwC02vfnlnHom/xDQIWWPbjj?=
 =?iso-8859-1?Q?mA/1E2v4CvRHySZByHpbi0C6t1TCAgBjcQ8IQrFna9+87Ya6pqIANW9y3B?=
 =?iso-8859-1?Q?wX6YcK4fVaNk2f/qZbd5jQUljXBa5lZu5q0uGUTFWLSI/94P71sNZ7dLSH?=
 =?iso-8859-1?Q?SFFjeICSpymppjiUGG24roBf+Ghuv0k/TRWXYDrMowZe0Kb5xTK7CWrfNv?=
 =?iso-8859-1?Q?zL7PRj5vATOvEsITP9QqcciQtb8XEE3OTvg/HmHqbk1MD7wf1Go84taQys?=
 =?iso-8859-1?Q?t6T2Cptpn7B9rY1wEe6puqJG9nLcmSQZBn3vhVbn15fndkdg8hG1nlXjXN?=
 =?iso-8859-1?Q?CZexpZIkQFiZHX66cTSRSEUt5H0BM2cqklij0enRFILPBCHIQ0fd2GXERT?=
 =?iso-8859-1?Q?FAog90TBho5V3ZfMCAfZKzXacJNQvjBU1w0TgnU8FcqDNeWO7niQbDZcH4?=
 =?iso-8859-1?Q?fFOyfT+GoS6M8QT/QrKkzCE2Eeg8YjTs7uQ9EDs2tHLLcEguBh2EGsS9X9?=
 =?iso-8859-1?Q?IUW6WbbkZqUpxpspWKjyJWTuiVHyaqdN18PN91zUKHCvYVHWGVD+DBs2QW?=
 =?iso-8859-1?Q?O9s+0LjCxODvpKQdcED0qE5AXKWuSsySgyh06Rywn4Px0mJVaCllcUa1C4?=
 =?iso-8859-1?Q?rw0QxSMJl6/QYmuL+UgxiWXr67Xiq/NuoA2JKqtP6/AVaoOCsWyGTUr34p?=
 =?iso-8859-1?Q?euc37jaxA1ByXpuA5Yc0wspIJJYvg3/REs9GWCly9e3ThF9XUnUaExiK3s?=
 =?iso-8859-1?Q?vY?=
x-ms-exchange-antispam-messagedata-1: W7tO9slyOZNCsuv80DP7bNA9k7tECRQ8vdQ=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cb5968-0dbb-4a27-23d9-08deec8f64fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 10:02:55.2024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwHUSy+2DBQAQbY6bkbay4E5r1CCB0JwrRHu+oW0DscQYuXczRrkB4Oo6dipfm9RHUj7e1ktDvHnUNYx/sa9ppswR3+t5481rKs3cw6I6jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2073
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 10:38:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242178

=0A=
=0A=
________________________________________=0A=
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>=0A=
Sent: Tuesday, July 28, 2026 10:24=0A=
To: Mathieu Dubois-Briand; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH] glibc: stable 2.43 branch updates=0A=
=0A=
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
Thanks!=0A=
=0A=
=0A=
Hi,=0A=
I see that there is a patch file for CVE-2026-5450, which creates the confl=
ict. I also noticed that there is a patch submitted to uplift glibc to late=
st stable 2.44 that was submitted today. So, my patch is now irrelevant. I =
will drop this patch.=0A=
=0A=
Thanks!=

