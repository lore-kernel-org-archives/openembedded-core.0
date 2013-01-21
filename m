Received: from retry101.mer-nm.internl.net ([217.149.192.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1TxFB2-0001mo-Di
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 12:04:35 +0100
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 17B3941889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 11:49:05 +0100 (CET)
Received: from amavisd-new (mailscanner12.mer-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 8865B3F521
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 11:49:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mailscanner12.mer-nm.internl.net
X-Spam-Flag: NO
X-Spam-Score: -0.617
X-Spam-Level: 
X-Spam-Status: No, score=-0.617 required=3 tests=[INN_HELPER1=-1,
	INN_NONNLRELAY=0.01, INN_TESTB=0.01, RDNS_DYNAMIC=0.363]
	autolearn=disabled
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner12.mer-nm.internl.net [217.149.192.159])
	(amavisd-new, port 10024) with ESMTP id uerC7ziJtvK9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 11:49:04 +0100 (CET)
Received: from TOP-EX02.topic.local (82-204-13-181.dsl.bbeyond.nl
	[82.204.13.181]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 11:49:04 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (192.168.10.102) by mail.topic.nl
	(192.168.1.103) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Mon, 21 Jan 2013 11:48:53 +0100
Received: from TOP-EX01.TOPIC.LOCAL ([::1]) by TOP-EX01.TOPIC.LOCAL ([::1])
	with mapi id 14.01.0289.001; Mon, 21 Jan 2013 11:49:03 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Index: Ac33xO0Pxn2jr5GkRBa45zOEDgDazg==
Date: Mon, 21 Jan 2013 10:49:02 +0000
Message-ID: <A551BDF323A45B48ACE6A404AA16A1C4127970C8@TOP-EX01.TOPIC.LOCAL>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [85.150.144.104]
x-exclaimer-md-config: 9833cda7-5b21-4d34-9a38-8d025ddc3664
x-exclaimer-md-bifurcation-instance: 0
MIME-Version: 1.0
Subject: (No subject)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 11:04:38 -0000
Content-Language: nl-NL
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This mail bounced so the v2 patch overtook it...

>> From: Mike Looijmans <mike.looijmans@topic.nl>
>>
>> Multicore embedded systems are getting more and more common.
>>
>> Remove "--disable-openmp" from the GCC configuration options and
>> always build libgomp. This only creates a "bigger" compiler but
>> has no effect on the compiled binaries that don't use openmp.
>>
>> Tested a clean build on mips32el and arm7a, no problems encountered.
>>
>> Autoconf will not detect OpenMP after this change, because it will
>> build and run a target binary on the build system. In order to use
>> OpenMP, the variable ac_cv_prog_c_openmp=3D-fopenmp must be set.
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.7.inc              |    9 +++------
>>  .../recipes-devtools/gcc/gcc-configure-runtime.inc |    4 +---
>>  .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 +-
>>  3 files changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> index 08a0103..a7aa4a4 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -88,7 +88,6 @@ JAVA =3D ""
>>  EXTRA_OECONF_BASE =3D " --enable-lto \
>>                       --enable-libssp \
>>                       --disable-bootstrap \
>> -                     --disable-libgomp \
>>                       --disable-libmudflap \
>>                       --with-system-zlib \
>> --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
>> @@ -99,7 +98,6 @@ EXTRA_OECONF_BASE =3D " --enable-lto \
>>                       --enable-cheaders=3Dc_global "
>>
>>  EXTRA_OECONF_INITIAL =3D "--disable-libmudflap \
>> -                     --disable-libgomp \
>>                       --disable-libssp \
>>                       --disable-libquadmath \
>>                       --with-system-zlib \
>> @@ -108,7 +106,6 @@ EXTRA_OECONF_INITIAL =3D "--disable-libmudflap \
>>                       --enable-decimal-float=3Dno"
>>
>>  EXTRA_OECONF_INTERMEDIATE =3D "--disable-libmudflap \
>> -                             --disable-libgomp \
>>                               --disable-libquadmath \
>>                               --with-system-zlib \
>>                               --disable-lto \
>
>
> I nearly took this however you still want this disabled in the
> INITIAL/INTERMEDIATE versions, you're just wasting compile time there sa
> nothing would use it.

I don't see the harm in allowing OpenMP usage in build tools (e.g. image
processing on the build machine), but if it gets the patch through
sooner, I'll happily remove it. I tend to run unit tests on my build
system, using OE's compiler version, so it's nice if both host and build
compilers accept the same options.


>
>> @@ -117,9 +114,9 @@ EXTRA_OECONF_INTERMEDIATE =3D "--disable-libmudflap =
\
>>
>>  EXTRA_OECONF_append_libc-uclibc =3D " --disable-decimal-float "
>>
>> -EXTRA_OECONF_PATHS =3D " \
>> - --with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_includedir}/c++=
 \
>> -                      --with-sysroot=3D${STAGING_DIR_TARGET} \
>> +EXTRA_OECONF_PATHS =3D " \
>> + --with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_includedir}/c++=
 \
>> +                      --with-sysroot=3D${STAGING_DIR_TARGET} \
>
>
> What changed here?

Excellent question, I haven't got the faintest clue why GIT added this.
I'll fix it.

>
>> --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>>  do_configure_prepend () {
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> index d40383c..1c9155f 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> @@ -7,9 +7,7 @@ EXTRA_OECONF_PATHS =3D " \
>>      --with-sysroot=3D${STAGING_DIR_TARGET} \
>>      --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>> -RUNTIMETARGET =3D "libssp libstdc++-v3"
>> -RUNTIMETARGET_append_powerpc =3D " libgomp"
>> -RUNTIMETARGET_append_powerpc64 =3D " libgomp"
>> +RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp"
>>  #  ?
>>  # libiberty
>>  # libmudflap
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> index 53c4632..6c048c0 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
>> @@ -13,7 +13,7 @@ SYSTEMLIBS =3D "${target_base_libdir}/"
>>  SYSTEMLIBS1 =3D "${target_libdir}/"
>>
>>  EXTRA_OECONF +=3D "--disable-libunwind-exceptions --disable-libssp \
>> -             --disable-libgomp --disable-libmudflap \
>> +             --disable-libmudflap \
>
>
> Again, I'm wondering if you mean this here. The library would have been
> built as part of the target build? Does the library need gcc support as
> well as its presence?
>

Same motivation as above actually, I see no harm in allowing it. Again,
I'll remove it for quickness, I'm quite eager to see OpenMP support in OE.

I'll post a much smaller V2 patch.

Mike


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) - (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.


