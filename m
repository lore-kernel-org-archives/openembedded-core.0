Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 33D856BDAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 16:54:42 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so3560107pab.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=sUTl2iakSsvDkeY3B9Mrc/xjCVeonyYeamaZRZox9Ec=;
	b=cqyiUB3ORXU9tyXH7gfBen/GW3mbkiIYtSTxbBYlTxxgVZ8mFJG5tkV/OOPUcCggAA
	bZ4329uyVu0AaEqO2B5xPMJfBmj/hgTdVREAa5bjKm6VXXdVkEoaWVPetHyJeMavfH3R
	ga//Xu1cFGQ43kCy+WeWBNIawjTlTsQWKWmIZt8qkOaIjWLoEO9di8WnMUK4Z79yv05k
	Zg3G4jdhlLYFPhv62c8BgqWjwQN5Anme45L4+o+SAEq4douQnxqbhTGsy04JnTpuz3Mc
	TrrhgWRDNojwLSWtRFAvuPhRWtV6zYx+9REkzMFm+RD5uiWu6H3mETONgPiL1tTa+90y
	NgQQ==
X-Received: by 10.68.98.36 with SMTP id ef4mr4093732pbb.27.1378486484089;
	Fri, 06 Sep 2013 09:54:44 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	va1sm1953551pbc.31.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 09:54:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1378460046.32427.96.camel@ted>
Date: Fri, 6 Sep 2013 09:54:44 -0700
Message-Id: <50C050F1-3F84-419B-8053-D8DCA38FFFA7@gmail.com>
References: <1378415843.32427.84.camel@ted>
	<165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
	<1378460046.32427.96.camel@ted>
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
X-List-Received-Date: Fri, 06 Sep 2013 16:54:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Sep 6, 2013, at 2:34 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2013-09-06 at 00:08 -0700, Khem Raj wrote:
>> On Sep 5, 2013, at 2:17 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>>> These are the hacks I needed to make libgfortran build. This is =
ugly, no
>>> argument from me. We could probably get better results if we patch
>>> configure and libtool to stop doing nasty things. I've probably =
taken
>>> this as far as I'd want to though, not being a particular fan of
>>> fortran...
>>>=20
>>> Khem: Any thoughts on this?
>>>=20
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> index 2599760..395623f 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> @@ -18,6 +18,9 @@ RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp"
>>> # libmudflap
>>> # libgfortran
>>>=20
>>> +DEPENDS_append =3D " chrpath-replacement-native"
>>> +EXTRANATIVEPATH +=3D "chrpath-native"
>>> +
>>> do_configure () {
>>> 	export CXX=3D"${CXX} -nostdinc++ -nostdlib++"
>>> 	mtarget=3D`echo ${MULTIMACH_TARGET_SYS} | sed -e =
s#-${SDKPKGSUFFIX}##`
>>> @@ -30,6 +33,11 @@ do_configure () {
>>> 		cd ${B}/$target/$d/
>>> 		chmod a+x ${S}/$d/configure
>>> 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
>>> +		# Ugly hack, libgfortran configure looks for =
../libquadmath/libquadmath.la
>>=20
>> Maybe we should explicitly --enable-libquadmath in gcc-cross when =
fortran is asked for in RUNTIMETARGETS
>> might avoid some of below.
>=20
> That would mean the gcc-cross recipe has to package it. We've =
basically
> now agreed and changed the code so all the packaging doesn't happen in
> -cross packages since it was always problematic.
>=20
> FWIW I also tried disabling quadmath but that caused different build
> failures.

But we stash the build artifacts from gcc-cross that then we reuse to =
build gcc-runtime so I am hoping that
it will do the configuration bits right probably and we dont have to do =
libtool surgery.

>=20
>>>=20
>>> +		# so we need to compile it before configure
>>> +		if [ "$d" =3D "libquadmath" ]; then
>>> +			oe_runmake MULTIBUILDTOP=3D${B}/$target/$d/
>>> +		fi
>>> 	done
>>> }
>>>=20
>>> @@ -38,6 +46,16 @@ do_compile () {
>>> 	for d in libgcc ${RUNTIMETARGET}; do
>>> 		cd ${B}/$target/$d/
>>> 		oe_runmake MULTIBUILDTOP=3D${B}/$target/$d/
>>> +		if [ "$d" =3D "libgfortran" ]; then
>>> +			# libtool needs libdir to match the final =
installation directory which configure
>>> +			# sets from output from this command (e.g. both =
set to /usr/lib/../lib
>>> +			# It also adds bogus RPATHS which we have to =
delete
>>> +			fulllibdir=3D`$CC -print-multi-os-directory`
>>> +			if [ $fulllibdir !=3D "." ]; then
>>> +				sed -i -e =
"s#relink_command=3D.*#relink_command=3D#" =
${B}/$target/$d/libgfortran.la
>>> +				chrpath -d `readlink -f =
${B}/$target/$d/.libs/libgfortran.so`
>>> +			fi
>>> +		fi
>>=20
>> hmm remind me but I think we use unmodified libtool that comes with =
gcc IIRC. if we used libtool-cross then this could
>> be fixed there
>=20
> We do use libtool from gcc, yes. To do otherwise safely, you have to
> reautoconf gcc which "is painful". Mixing two libtool versions usually
> gives stacks of errors so our only option would be to patch libtool in
> gcc to apply our patches. Even then, I'm not sure they'd cope with the
> way quadmath is linked :/.
>=20
> This is why I ended up hacking things in the metadata since it seemed
> the least worse solution=85

yeah. I dont think we have much choice there. re-autoconfiguring gcc =
with different libtool is a project in itself. GCC
does not recommend to reconfigure so thats fine.

>=20
> Cheers,
>=20
> Richard
>=20


