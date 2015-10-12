Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D002865C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 17:54:58 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so59677416wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 10:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ldA6jdyCKtR5up7gSKwqft5gKWAZ2eSKLSFrYPDIUTI=;
	b=ScDl+yUVlgkh4mdzmDAAIavpEWcpm0MJrmE9A6gGmtd5e4Ts2boLuh1IkLCDCF4CcF
	Cz4DgrdwO4RC6+k0pmZnunygc2ROWUNnoX3d3M8vdnxjvvCoRddtZZg8EHIriwYFvzfF
	RmHiIcL/S5gFsY/+UhLM5gkflKEbTkCzYAjtixC60absQFv+AM6iicQ27bQltPy0xt18
	96IylNfJ9Xg1VvbeJpxzt7H7llWnOHZhsPHQ7+rjD1VZIWRBJltyqtvhwYCBIao1XhU/
	Lkm4+OSo+AZfW2QdkWAPmU6Kw9mx6qqVYlZz6RudDlMLLdL2TyzKbefbEiRUKxNyhMLM
	AUSg==
X-Received: by 10.180.79.5 with SMTP id f5mr14900957wix.79.1444672498865;
	Mon, 12 Oct 2015 10:54:58 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	p18sm11730198wik.19.2015.10.12.10.54.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Oct 2015 10:54:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
Date: Mon, 12 Oct 2015 19:54:55 +0200
Message-Id: <B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
	<CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Oct 2015 17:55:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 12.10.2015 um 18:32 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Mon, Oct 12, 2015 at 9:01 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 08.10.2015 um 18:40 schrieb Khem Raj <raj.khem@gmail.com>:
>> [...]
>> During hacking on the fix in meta/conf/machine/ I recognized that the =
expected thump suffix in meta/conf/machine/include/tune-arm926ejs.inc
>> isn't there and modified the line as
>>=20
>> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
>> index 335e4e0..a310c9d 100644
>> --- a/meta/conf/machine/include/tune-arm926ejs.inc
>> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
>> @@ -8,4 +8,4 @@ TUNE_CCARGS .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", " -mtune=3Darm9
>> AVAILTUNES +=3D "arm926ejs"
>> ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
>> TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
>> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
>> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
>>=20
>=20
> this is ok ?

=46rom=20

TUNE_FEATURES=3D"${TUNE_FEATURES_tune-${DEFAULTTUNE}}"

is ok probably the wrong question ;)

Setting DEFAULTTUNE to arm926ejs results in expanding PACKAGE_ARCH from =
TUNE_PKGARCH which is combined via
=
"${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGS=
FX_ENDIAN}${ARMPKGSFX_FPU}" in
meta/conf/machine/include/arm/arch-arm.inc:12

Since ARMPKGSFX_THUMB is set to "t" (or "t2" on ARMv6+) only when thumb =
code should be generated and
ARMPKGSFX_DSP is set to "e" when DSP is featured, both have to be =
recognized.

The entire construct doesn't feel "ok'ish" - but it works and is more or =
less reliable ...

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


