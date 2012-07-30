Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1Svsk8-0000Yn-T6
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 18:22:53 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6UGBFCl025417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 09:11:15 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.236]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0309.002;
	Mon, 30 Jul 2012 09:11:15 -0700
From: "Little, Morgan" <Morgan.Little@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Fwd: [oe-commits] Morgan Little : python-native: Put
	binaries in seperate directory
Thread-Index: AQHNblwTivQByBgeN06ijKFNwbvsO5dB/ng3
Date: Mon, 30 Jul 2012 16:11:14 +0000
Message-ID: <FCBA1E696337B442ADB5A7C30428F0684FF34D@ALA-MBA.corp.ad.wrs.com>
References: <20120722104353.A204B1032B@opal>
	<CALbNGRTJjTZZG=ysG3m+gnv0YqfaBhUEZkLF5WUJxg7-hSLGDg@mail.gmail.com>,
	<CALbNGRQdsaP8JOc91DJxD2wtvSV9KaL2LX4f-6ff2jubdGWgYQ@mail.gmail.com>
In-Reply-To: <CALbNGRQdsaP8JOc91DJxD2wtvSV9KaL2LX4f-6ff2jubdGWgYQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.224]
MIME-Version: 1.0
Subject: Re: [oe-commits] Morgan Little : python-native: Put binaries in seperate directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 16:22:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 12-07-30 10:02 AM, Andreas M=FCller wrote:=0A=
> On Sun, Jul 22, 2012 at 12:43 PM,  <git@git.openembedded.org> wrote:=0A=
>> Module: openembedded-core.git=0A=
>> Branch: master=0A=
>> Commit: a2e554f731437545e9483a7a73e6847c03f6f48a=0A=
>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommi=
t;h=3Da2e554f731437545e9483a7a73e6847c03f6f48a=0A=
>>=0A=
>> Author: Morgan Little <morgan.little@windriver.com>=0A=
>> Date:   Thu Jul 19 13:46:06 2012 -0400=0A=
>>=0A=
>> python-native: Put binaries in seperate directory=0A=
>>=0A=
>> Update python-native to install the binaries in the python-native direct=
ory,=0A=
>> add pythonnative.bbclass to let recipes that need python-native use the=
=0A=
>> binaries and update disutils access the new binaries. Update distutils-b=
ase=0A=
>> to inherit pythonnative.=0A=
>>=0A=
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
>>=0A=
>> ---=0A=
>>=0A=
>>  meta/classes/distutils-base.bbclass                |    2 +-=0A=
>>  meta/classes/distutils.bbclass                     |    8 ++++----=0A=
>>  meta/classes/pythonnative.bbclass                  |    3 +++=0A=
>>  .../recipes-devtools/python/python-native_2.7.3.bb |   10 ++++++----=0A=
>>  4 files changed, 14 insertions(+), 9 deletions(-)=0A=
>>=0A=
>> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutil=
s-base.bbclass=0A=
>> index 6d18e08..c761b36 100644=0A=
>> --- a/meta/classes/distutils-base.bbclass=0A=
>> +++ b/meta/classes/distutils-base.bbclass=0A=
>> @@ -1,5 +1,5 @@=0A=
>>  DEPENDS  +=3D "${@["python-native python", ""][(d.getVar('PACKAGES', Tr=
ue) =3D=3D '')]}"=0A=
>>  RDEPENDS_${PN} +=3D "${@['', 'python-core']['${PN}' =3D=3D '${BPN}']}"=
=0A=
>>=0A=
>> -inherit distutils-common-base=0A=
>> +inherit distutils-common-base pythonnative=0A=
>>=0A=
>> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbc=
lass=0A=
>> index bcddf8d..690df73 100644=0A=
>> --- a/meta/classes/distutils.bbclass=0A=
>> +++ b/meta/classes/distutils.bbclass=0A=
>> @@ -11,14 +11,14 @@ distutils_do_compile() {=0A=
>>           STAGING_INCDIR=3D${STAGING_INCDIR} \=0A=
>>           STAGING_LIBDIR=3D${STAGING_LIBDIR} \=0A=
>>           BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \=0A=
>> -         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUI=
LD_ARGS} || \=0A=
>> +         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build $=
{DISTUTILS_BUILD_ARGS} || \=0A=
>>           bbfatal "python setup.py build_ext execution failed."=0A=
>>  }=0A=
>>=0A=
>>  distutils_stage_headers() {=0A=
>>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}=0A=
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \=0A=
>> -        ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DIST=
UTILS_STAGE_HEADERS_ARGS} || \=0A=
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_=
headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \=0A=
>>          bbfatal "python setup.py install_headers execution failed."=0A=
>>  }=0A=
>>=0A=
>> @@ -28,7 +28,7 @@ distutils_stage_all() {=0A=
>>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}=0A=
>>          PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \=0A=
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \=0A=
>> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_ST=
AGE_ALL_ARGS} || \=0A=
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
${DISTUTILS_STAGE_ALL_ARGS} || \=0A=
>>          bbfatal "python setup.py install (stage) execution failed."=0A=
>>  }=0A=
>>=0A=
>> @@ -38,7 +38,7 @@ distutils_do_install() {=0A=
>>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \=0A=
>>          PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \=0A=
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \=0A=
>> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_IN=
STALL_ARGS} || \=0A=
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
${DISTUTILS_INSTALL_ARGS} || \=0A=
>>          bbfatal "python setup.py install execution failed."=0A=
>>=0A=
>>          for i in `find ${D} -name "*.py"` ; do \=0A=
>> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnati=
ve.bbclass=0A=
>> new file mode 100644=0A=
>> index 0000000..bc346da=0A=
>> --- /dev/null=0A=
>> +++ b/meta/classes/pythonnative.bbclass=0A=
>> @@ -0,0 +1,3 @@=0A=
>> +PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python"=0A=
>> +PATH_prepend =3D "${STAGING_BINDIR_NATIVE}/python-native:"=0A=
>> +DEPENDS +=3D " python-native "=0A=
>> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/=
recipes-devtools/python/python-native_2.7.3.bb=0A=
>> index 50bf894..bfdcd12 100644=0A=
>> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb=0A=
>> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb=0A=
>> @@ -1,6 +1,6 @@=0A=
>>  require python.inc=0A=
>>  DEPENDS =3D "openssl-native bzip2-full-native zlib-native readline-nati=
ve sqlite3-native"=0A=
>> -PR =3D "${INC_PR}.0"=0A=
>> +PR =3D "${INC_PR}.1"=0A=
>>=0A=
>>  SRC_URI +=3D "file://04-default-is-optimized.patch \=0A=
>>             file://05-enable-ctypes-cross-build.patch \=0A=
>> @@ -20,6 +20,8 @@ inherit native=0A=
>>=0A=
>>  RPROVIDES +=3D "python-distutils-native python-compression-native pytho=
n-textutils-native python-core-native"=0A=
>>=0A=
>> +EXTRA_OECONF +=3D " --bindir=3D${bindir}/${PN}"=0A=
>> +=0A=
>>  EXTRA_OEMAKE =3D '\=0A=
>>    BUILD_SYS=3D"" \=0A=
>>    HOST_SYS=3D"" \=0A=
>> @@ -34,11 +36,11 @@ do_configure_prepend() {=0A=
>>=0A=
>>  do_install() {=0A=
>>         oe_runmake 'DESTDIR=3D${D}' install=0A=
>> -       install -d ${D}${bindir}/=0A=
>> -       install -m 0755 Parser/pgen ${D}${bindir}/=0A=
>> +       install -d ${D}${bindir}/${PN}=0A=
>> +       install -m 0755 Parser/pgen ${D}${bindir}/${PN}=0A=
>>=0A=
>>         # Make sure we use /usr/bin/env python=0A=
>> -       for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do=
=0A=
>> +       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir=
}/${PN}`; do=0A=
>>                 sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT=
=0A=
>>         done=0A=
>>  }=0A=
>>=0A=
>>=0A=
> Could somebody enlighten me please: What is the benefit in moving=0A=
> python-native into a subdirectory and causing tons of recipe changes?=0A=
> The commit message does not help me much.=0A=
> To me it is just another build breaker after gobject-introspection &=0A=
> gtk-doc. Please tell me how many further weeks we have to suffer for=0A=
> innovations like this so I can come back then.=0A=
>=0A=
> Andreas=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A=
=0A=
The reason for the change was when python-native was built with other packa=
ges=0A=
in parallel it would sometimes hit a case where the python binary was insta=
lled=0A=
but the usr/lib/libpython2.7.so* was not installed yet. This would cause=0A=
failures because of the missing library. This would also cause some issues =
with=0A=
importing modules as they might not always be there when needed if python-n=
ative=0A=
was being installed. Richard suggested that we change it to do something si=
milar=0A=
to perl-native, http://lists.linuxtogo.org/pipermail/openembedded-core/2012=
-June/024644.html.=0A=
=0A=
This method solves the issue but means that everything that depends on=0A=
python-native needs to be updated to inherit the new pythonnative class. I=
=0A=
tried to get all of the recipes that depended on python-native and anything=
=0A=
that failed when I built and needed to inherit pythonnative. =0A=
=0A=
I can't say how long it will cause issues.=0A=
=0A=
//Morgan=


