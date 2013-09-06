Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id D042A615F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 21:06:06 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so3811344pad.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=DQWq9KAXsDeIaehWqjJlsdqRvzy1HtuDdhYXzkTAmBw=;
	b=YAmsPIqkuSIfX5Y8V2FZLCS4Mx7sg292km5DJXIolLrD6faeviQpAxRUyvxnH26o3w
	qMv+FE5CQvvYcZRpk3NPpKmURq39qHFijeHh7mpaVUdr9G7P2ZIi2MheJSvalKMLUfxp
	dvvRGC37J9FIP3xjqSWzWgKgthght4q9rPb32G/S20MHF5JH+9OMTWBvYIcUkGFNxSSk
	drz+4BrjndtKwzDlX78BJJaliY5TfqPTHzczFt+FbOtBkNxdBF6s6NLJuM2U438wVF9H
	QpQJRLt64R1WVY2YTUsApd15TMMJ68QskiK7w3jqzuRBMVatI3O2xCWqjzbRchoICMuC
	ToYg==
X-Received: by 10.68.178.2 with SMTP id cu2mr4968973pbc.161.1378501568801;
	Fri, 06 Sep 2013 14:06:08 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	ib9sm5847635pbc.43.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 14:06:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1378487137.3484.18.camel@ted>
Date: Fri, 6 Sep 2013 14:06:07 -0700
Message-Id: <A7AF04A1-07A7-4994-B4EB-48B09606345B@gmail.com>
References: <1378415843.32427.84.camel@ted>
	<165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
	<1378460046.32427.96.camel@ted>
	<50C050F1-3F84-419B-8053-D8DCA38FFFA7@gmail.com>
	<1378487137.3484.18.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] gcc-runtime: Hacks for libgfortran with gcc-4.8
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
X-List-Received-Date: Fri, 06 Sep 2013 21:06:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 6, 2013, at 10:05 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2013-09-06 at 09:54 -0700, Khem Raj wrote:
>> On Sep 6, 2013, at 2:34 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>>> On Fri, 2013-09-06 at 00:08 -0700, Khem Raj wrote:
>>>> On Sep 5, 2013, at 2:17 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>>=20
>>>>> These are the hacks I needed to make libgfortran build. This is =
ugly, no
>>>>> argument from me. We could probably get better results if we patch
>>>>> configure and libtool to stop doing nasty things. I've probably =
taken
>>>>> this as far as I'd want to though, not being a particular fan of
>>>>> fortran...
>>>>>=20
>>>>> Khem: Any thoughts on this?
>>>>>=20
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>>> index 2599760..395623f 100644
>>>>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>>> @@ -18,6 +18,9 @@ RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp"
>>>>> # libmudflap
>>>>> # libgfortran
>>>>>=20
>>>>> +DEPENDS_append =3D " chrpath-replacement-native"
>>>>> +EXTRANATIVEPATH +=3D "chrpath-native"
>>>>> +
>>>>> do_configure () {
>>>>> 	export CXX=3D"${CXX} -nostdinc++ -nostdlib++"
>>>>> 	mtarget=3D`echo ${MULTIMACH_TARGET_SYS} | sed -e =
s#-${SDKPKGSUFFIX}##`
>>>>> @@ -30,6 +33,11 @@ do_configure () {
>>>>> 		cd ${B}/$target/$d/
>>>>> 		chmod a+x ${S}/$d/configure
>>>>> 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
>>>>> +		# Ugly hack, libgfortran configure looks for =
../libquadmath/libquadmath.la
>>>>=20
>>>> Maybe we should explicitly --enable-libquadmath in gcc-cross when =
fortran is asked for in RUNTIMETARGETS
>>>> might avoid some of below.
>>>=20
>>> That would mean the gcc-cross recipe has to package it. We've =
basically
>>> now agreed and changed the code so all the packaging doesn't happen =
in
>>> -cross packages since it was always problematic.
>>>=20
>>> FWIW I also tried disabling quadmath but that caused different build
>>> failures.
>>=20
>> But we stash the build artifacts from gcc-cross that then we reuse to =
build gcc-runtime so I am hoping that
>> it will do the configuration bits right probably and we dont have to =
do libtool surgery.
>=20
> It won't help, we'd have to install the libs/headers from quadmath =
into
> the target sysroot and we can't reasonably do that from the cross
> recipe.

I was thinking just to have configured tree like we have for libgcc and =
others. full build of libquadmath and libgfortran
of course happens with gcc-runtime phase.


>=20
> Cheers,
>=20
> Richard
>=20


