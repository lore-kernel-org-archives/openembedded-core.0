Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7193972332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 18:31:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0GIVKVM004851
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 16 Jan 2015 10:31:21 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.42]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Fri, 16 Jan 2015 10:31:20 -0800
From: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] gcc-runtime: Remove libgfortran data from
	receipe
Thread-Index: AQHQMOCtYARDNTwSJE+gye7vMnihH5zB6EyAgAEQcgE=
Date: Fri, 16 Jan 2015 18:31:20 +0000
Message-ID: <7805B0FACE4FCC4E84636AB320CBA4AC360C5160@ALA-MBB.corp.ad.wrs.com>
References: <1421339471-11486-1-git-send-email-daniel.dragomir@windriver.com>,
	<1421340029.18703.0.camel@linuxfoundation.org>
In-Reply-To: <1421340029.18703.0.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.124.175]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Fri, 16 Jan 2015 18:31:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
>On Thu, 2015-01-15 at 18:31 +0200, Daniel Dragomir wrote:=0A=
>> Remove libgfortran packages from PACKAGES list and skip them at compilin=
g=0A=
>> and installing as long as libgfortran has separate receipe since commit=
=0A=
>>=0A=
>> 5bde5d9b39ea67f19a1a6aedd0c08c6cfedcbe5f=0A=
>> gcc: Allow fortran to build successfully in 4.8=0A=
>>=0A=
>> Otherwise, when fortran support will be enabled in the compiler, both=0A=
>> lingfortran and gcc-runtime receipes will create the same files and will=
=0A=
>> try to install them. This will cause errors:=0A=
>>=0A=
>> ERROR: The recipe libgfortran is trying to install files into a shared=
=0A=
>> area when those files already exist. Those files and their manifest=0A=
>> location are: ...=0A=
>> Please verify which recipe should provide the above files.=0A=
>>=0A=
>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>=0A=
>> ---=0A=
>>  meta/recipes-devtools/gcc/gcc-runtime.inc | 41 ++++++++++++------------=
-------=0A=
>>  1 file changed, 16 insertions(+), 25 deletions(-)=0A=
>>=0A=
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-de=
vtools/gcc/gcc-runtime.inc=0A=
>> index 167869e..c3b4a46 100644=0A=
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc=0A=
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc=0A=
>> @@ -22,28 +22,34 @@ do_configure () {=0A=
>>       target=3D`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`=0A=
>>       hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget $=
{B}=0A=
>>       for d in libgcc ${RUNTIMETARGET}; do=0A=
>> -             echo "Configuring $d"=0A=
>> -             rm -rf ${B}/$target/$d/=0A=
>> -             mkdir -p ${B}/$target/$d/=0A=
>> -             cd ${B}/$target/$d/=0A=
>> -             chmod a+x ${S}/$d/configure=0A=
>> -             ${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}=0A=
>> +             if [ "$d" !=3D "libgfortran" ]; then=0A=
>=0A=
>Why would libgfortran be in RUNTIMETARGET? Surely it would be better=0A=
>just to ensure it isn't rather than ignore it?=0A=
>=0A=
>Cheers,=0A=
>=0A=
>Richard=0A=
=0A=
My mistake.=0A=
I didn't noticed that I had in my layer, in a bbappend for gcc-runtime this=
 line=0A=
=0A=
RUNTIMETARGET +=3D "libgfortran"=0A=
=0A=
because I added fortran support in dora branch.=0A=
And in dora the receipes (gcc-runtime and libgfortran) were not splited.=0A=
=0A=
That's why I added those "if" statements to skip libgfortran.=0A=
=0A=
I remove the line and iny layer I added "libgfortran" in DEPENDS for image =
to build it.=0A=
=0A=
Do you thing that we still need to ensure libgfortran is not in RUNTIMETARG=
ET?=0A=
Or I should remove the "if" statements and create a patch just with the oth=
er changes?=0A=
=0A=
BR,=0A=
Daniel=0A=
=0A=
=0A=
>> +                     echo "Configuring $d"=0A=
>> +                     rm -rf ${B}/$target/$d/=0A=
>> +                     mkdir -p ${B}/$target/$d/=0A=
>> +                     cd ${B}/$target/$d/=0A=
>> +                     chmod a+x ${S}/$d/configure=0A=
>> +                     ${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}=
=0A=
>> +             fi=0A=
>>      done=0A=
>>  }=0A=
>>=0A=
>>  do_compile () {=0A=
>>       target=3D`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`=0A=
>>       for d in libgcc ${RUNTIMETARGET}; do=0A=
>> -             cd ${B}/$target/$d/=0A=
>> -             oe_runmake MULTIBUILDTOP=3D${B}/$target/$d/=0A=
>> +             if [ "$d" !=3D "libgfortran" ]; then=0A=
>> +                     cd ${B}/$target/$d/=0A=
>> +                     oe_runmake MULTIBUILDTOP=3D${B}/$target/$d/=0A=
>> +             fi=0A=
>>       done=0A=
>>  }=0A=
>>=0A=
>>  do_install () {=0A=
>>       target=3D`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`=0A=
>>       for d in ${RUNTIMETARGET}; do=0A=
>> -             cd ${B}/$target/$d/=0A=
>> -             oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/$target/$=
d/ install=0A=
>> +             if [ "$d" !=3D "libgfortran" ]; then=0A=
>> +                     cd ${B}/$target/$d/=0A=
>> +                     oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/$=
target/$d/ install=0A=
>> +             fi=0A=
>>       done=0A=
>>       rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir=0A=
>>       rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir=0A=
>> @@ -76,9 +82,6 @@ PACKAGES =3D "\=0A=
>>      libssp \=0A=
>>      libssp-dev \=0A=
>>      libssp-staticdev \=0A=
>> -    libgfortran \=0A=
>> -    libgfortran-dev \=0A=
>> -    libgfortran-staticdev \=0A=
>>      libmudflap \=0A=
>>      libmudflap-dev \=0A=
>>      libmudflap-staticdev \=0A=
>> @@ -131,18 +134,6 @@ FILES_libssp-dev =3D "\=0A=
>>  "=0A=
>>  FILES_libssp-staticdev =3D "${libdir}/libssp*.a"=0A=
>>=0A=
>> -FILES_libgfortran =3D "${libdir}/libgfortran.so.*"=0A=
>> -FILES_libgfortran-dev =3D "\=0A=
>> -    ${libdir}/libgfortran*.so \=0A=
>> -    ${libdir}/libgfortran.spec \=0A=
>> -    ${libdir}/libgfortran.la \=0A=
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \=0A=
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \=0A=
>> -"=0A=
>> -FILES_libgfortran-staticdev =3D "${libdir}/libgfortran.a"=0A=
>> -=0A=
>> -INSANE_SKIP_${MLPREFIX}libgfortran-dev =3D "staticdev"=0A=
>> -=0A=
>>  FILES_libquadmath =3D "${libdir}/libquadmath*.so.*"=0A=
>>  FILES_libquadmath-dev =3D "\=0A=
>>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \=0A=
>> --=0A=
>> 1.8.1.4=0A=
>>=0A=
=0A=
=0A=

