Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1867459C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:10:39 +0000 (UTC)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])
	by msfrf2605.sfr.fr (SMTP Server) with ESMTP id 9F4681C00041F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:10:40 +0200 (CEST)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2605.sfr.fr (SMTP Server) with ESMTPSA;
	Fri, 15 Jun 2018 09:10:38 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Andre McCurdy' <armccurdy@gmail.com>, 'Khem Raj' <raj.khem@gmail.com>
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
	<20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
	<CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
	<CAMKF1spJGLVW_HKD9YEgDY6aidz6q_TvjohfoJHnXHDiyc3vtg@mail.gmail.com>
	<CAJ86T=U7Uk0uajnnu=1P_dSxGrO3thQDp9655KC1EEYesPa3_Q@mail.gmail.com>
	<CAMKF1srPwWebGHZcmnV5vaNhRgSjrp2DG0CgT44zyUqfnFBf_A@mail.gmail.com>
	<CAJ86T=WRTcXsWs3V32RC0dTNG-F7va_5m-hd6zYQ6aF6YZcxdw@mail.gmail.com>
In-Reply-To: <CAJ86T=WRTcXsWs3V32RC0dTNG-F7va_5m-hd6zYQ6aF6YZcxdw@mail.gmail.com>
Date: Fri, 15 Jun 2018 09:10:33 +0200
Message-ID: <002301d40477$f719ceb0$e54d6c10$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQMm0QNrb4sapHzB2tQR4rf39Ym55AH/wOdRAg4pqcwCqWuq7AKeZMZLARe8FzgB51lCTALgu/dFoUGf18A=
X-sfr-mailing: LEGIT
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 15 Jun 2018 07:10:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi,

So the issue is whether we want to change the behaviour of previous =
architectures, or if we try to fix the issue only for the architectures =
that don't work.
Until now, the db recipe was enabling the 'swp' optimization, and that =
behavior could be disabled on .bbappend if needed.
While that works fine until armv7ve, it does not work for armv8, which =
has removed support for those instructions.
Therefore, there is a need to fix it for armv8 - and armv8 only - =
whereas it can be safely used on previous architectures.
If we remove the use for all ARM architectures, that might create some =
regression/issues.
If we just remove the use of 'swp' only for armv8, we ensure it doesn't =
break anything that's running on previous ARM architectures.

Cheers,
Herve

-----Original Message-----
From: Andre McCurdy [mailto:armccurdy@gmail.com]=20
Sent: vendredi 15 juin 2018 00:03
To: Khem Raj <raj.khem@gmail.com>
Cc: Herve Jourdain <herve.jourdain@neuf.fr>; Ovidiu Panait =
<ovidiu.panait@windriver.com>; Patches and discussions about the oe-core =
layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex =
code

On Thu, Jun 14, 2018 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jun 14, 2018 at 1:01 PM Andre McCurdy <armccurdy@gmail.com> =
wrote:
>> On Thu, Jun 14, 2018 at 12:24 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>> > On Thu, Jun 14, 2018 at 12:12 PM Andre McCurdy=20
>> > <armccurdy@gmail.com>
>> > wrote:
>> >>
>> >> On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>> >> > On 6/14/18 5:10 AM, Herve Jourdain wrote:
>> >> >> Hi,
>> >> >>
>> >> >> I believe I solved that same problem by just adding, in the=20
>> >> >> case of
>> >> >> armv8
>> >> >> (which I believe may be the new architecture you're referring =
to):
>> >> >> MUTEX_armv8 =3D ""
>> >> >> This way, it allows previous versions to work just like they=20
>> >> >> did before, without having to disable ARM assembler mutex code=20
>> >> >> for architectures that support it correctly - up to armv7ve I=20
>> >> >> believe.
>> >> >> Of course, we might need to also have a good definition for=20
>> >> >> armv8, which is the object of another thread.
>> >> >
>> >> > right thats a better approach.
>> >>
>> >> SWP is not guaranteed to work on SMP systems... and even if it=20
>> >> does, performance is likely to be worse than the pthreads version=20
>> >> (which can take advantage of the newer instructions).
>> >>
>> >>
>> >> https://community.arm.com/processors/b/blog/posts/locks-swps-and-t
>> >> wo-smoking-barriers
>> >>
>> >> In general, use of hand optimised assembler mutex implementations=20
>> >> in user space isn't something to be encouraged - use pthreads (or=20
>> >> maybe a gcc intrinsic) instead.
>> >>
>> >
>> > question is about disabling it on old arm machines, do we have data =

>> > where we know that other sync methods without swp works better on=20
>> > armv5 and lower ?
>>
>> On armv5 and below a hand optimised implementation using SWP is=20
>> likely to be faster than pthreads. No one is suggesting otherwise.
>>
>> On SMP (highly likely nowadays for armv7 and above), SWP simply might =

>> not work (aside from the fact that if it does work, it's likely to be =

>> slower than pthreads). It's not really a question of performance=20
>> there, so the proposal to only disable SWP for armv8 doesn't seem=20
>> like a safe solution.
>
> Suggestion is not to just do it for armv8 but To keep it there where=20
> its beneficial

You can always argue that micro optimisations are beneficial. The =
question is whether they make a big enough difference in some real world =
use case to be worth the maintenance effort.

>> Using pthreads unconditionally is safe and easy. Unless you can prove =

>> that hand optimised SWP is really a big win for armv5 (is anyone=20
>> really running a performance critical database on an armv5 system?)=20
>> why not keep the recipe simple and use pthreads everywhere?
>>
>> >> I think the original patch is good.
>> >>
>> >> >> Cheers,
>> >> >> Herve
>> >> >>
>> >> >> -----Original Message-----
>> >> >> From: openembedded-core-bounces@lists.openembedded.org
>> >> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On=20
>> >> >> Behalf Of Ovidiu Panait
>> >> >> Sent: jeudi 14 juin 2018 13:55
>> >> >> To: openembedded-core@lists.openembedded.org
>> >> >> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler=20
>> >> >> mutex code
>> >> >>
>> >> >> The swpb in macro MUTEX_SET will cause "undefined instruction"=20
>> >> >> error on the new arm arches which don't support this assembly=20
>> >> >> instruction any more. If use ldrex/strex to replace swpb, the=20
>> >> >> old arm arches don't support them. So to avoid this issue, just =

>> >> >> disable the ARM assembler mutex code, and use the default=20
>> >> >> pthreads mutex.
>> >> >>
>> >> >> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> >> >> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
>> >> >> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> >> >> ---
>> >> >>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
>> >> >>  1 file changed, 1 insertion(+), 12 deletions(-)
>> >> >>
>> >> >> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>> >> >> b/meta/recipes-support/db/db_5.3.28.bb
>> >> >> index 093ee44909..15b4155a29 100644
>> >> >> --- a/meta/recipes-support/db/db_5.3.28.bb
>> >> >> +++ b/meta/recipes-support/db/db_5.3.28.bb
>> >> >> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV =3D "${libdir}/libdb.so=20
>> >> >> ${libdir}/libdb_cxx.so"
>> >> >>  # All the --disable-* options replace --enable-smallbuild,=20
>> >> >> which breaks a bunch of stuff (eg. postfix)  DB5_CONFIG ?=3D=20
>> >> >> "--enable-o_direct --disable-cryptography --disable-queue=20
>> >> >> --disable-replication --disable-verify --disable-compat185=20
>> >> >> --disable-sql"
>> >> >>
>> >> >> -EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx=20
>> >> >> --with-sysroot"
>> >> >> -
>> >> >> -# Override the MUTEX setting here, the POSIX library is -# the =

>> >> >> default - "POSIX/pthreads/library".
>> >> >> -# Don't ignore the nice SWP instruction on the ARM:
>> >> >> -# These enable the ARM assembler mutex code, this won't -#=20
>> >> >> work with thumb compilation...
>> >> >> -ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
>> >> >> -MUTEX =3D ""
>> >> >> -MUTEX_arm =3D "${ARM_MUTEX}"
>> >> >> -MUTEX_armeb =3D "${ARM_MUTEX}"
>> >> >> -EXTRA_OECONF +=3D "${MUTEX} STRIP=3Dtrue"
>> >> >> +EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx
>> >> >> --with-sysroot
>> >> >> STRIP=3Dtrue"
>> >> >>  EXTRA_OEMAKE +=3D "LIBTOOL=3D'./${HOST_SYS}-libtool'"
>> >> >>
>> >> >>  EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader  -I=20
>> >> >> ${S}/dist/aclocal -I${S}/dist/aclocal_java"
>> >> >> --
>> >> >> 2.17.1
>> >> >>
>> >> >> --
>> >> >> _______________________________________________
>> >> >> Openembedded-core mailing list
>> >> >> Openembedded-core@lists.openembedded.org
>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-cor
>> >> >> e
>> >> >>
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >


