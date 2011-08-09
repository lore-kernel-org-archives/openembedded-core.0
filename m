Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QqbGh-0004IU-8f
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 03:38:07 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Mon, 8 Aug 2011
	21:33:39 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: re: gcc version mismatch in sdk generation
Thread-Index: AcxWNCROR/sMldB4QsGmR27EYwO1yQ==
Date: Tue, 9 Aug 2011 01:33:38 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1832C5@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: gcc version mismatch in sdk generation
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
X-List-Received-Date: Tue, 09 Aug 2011 01:38:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue Aug 9 01:25:55 CEST 2011, Richard Purdie wrote:
>On Mon, 2011-08-08 at 05:02 +0000, James Limbouris wrote:
>> Hi,
>>=20
>> In oe-core, with Angstrom 2010.x, generating an sdk with:
>>=20
>> bitbake meta-toolchain-qte
>>=20
>> is giving me a toolchain with gcc-4.6.1 binaries in the i686 sysroot, bu=
t
>> gcc-4.5.4 runtime libraries in the arm (target) sysroot. The sdk can't
>> link until a symlink is installed to trick it into using the 4.5.4 libra=
ries.
>>=20
>> I've checked the preferred versions, but they seem to be set consistentl=
y
>> in the disto's conf file, at least as far as I can see.
>>=20
>> 'bitbake -s | grep gcc' gives:
>> gcc                                     :4.5-r39.1+svnr176640           =
              =20
>> gcc-cross                               :4.5-r39.2+svnr176640           =
              =20
>> gcc-cross-canadian-arm                  :4.5-r39.0+svnr176640           =
              =20
>> gcc-cross-initial                       :4.5-r39.0+svnr176640           =
              =20
>> gcc-cross-intermediate                  :4.5-r39.0+svnr176640           =
              =20
>> gcc-crosssdk                            :4.5-r39.0+svnr176640           =
              =20
>> gcc-crosssdk-initial                    :4.5-r39.0+svnr176640           =
              =20
>> gcc-crosssdk-intermediate               :4.5-r39.0+svnr176640           =
              =20
>> gcc-runtime                             :4.5-r39.1+svnr176640           =
              =20
>> gcc-runtime-nativesdk                    :4.6.1+svnr175454-r5     :4.5-r=
39.1+svnr176640
>> gccmakedep                                         1:1.0.2-r3           =
              =20
>> libgcc                                  :4.5-r39.1+svnr176640           =
              =20
>> libgcc-nativesdk                         :4.6.1+svnr175454-r3     :4.5-r=
39.1+svnr176640
>
> The nativesdk and crosssdk versions need to match at the very least.
>
> Cheers,
>
> Richard

Yes - that's what is so confusing. They seem to match in the Angstrom conf:

#Everybody else can just use this:=20
ANGSTROM_GCC_VERSION                             ?=3D "4.5"

ANGSTROM_BINUTILS_VERSION                        ?=3D "2.20.1"

PREFERRED_VERSION_binutils                       ?=3D "${ANGSTROM_BINUTILS_=
VERSION}"
PREFERRED_VERSION_binutils-cross                 ?=3D "${ANGSTROM_BINUTILS_=
VERSION}"
PREFERRED_VERSION_binutils-crosssdk              ?=3D "${ANGSTROM_BINUTILS_=
VERSION}"
PREFERRED_VERSION_binutils-cross-canadian        ?=3D "${ANGSTROM_BINUTILS_=
VERSION}"

PREFERRED_VERSION_gcc                            ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-cross                      ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-cross-initial              ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-cross-intermediate         ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-cross-canadian             ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-crosssdk                   ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-crosssdk-initial           ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-crosssdk-intermediate      ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-runtime                    ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_gcc-runtime-nativesdk          ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_libgcc                         ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
PREFERRED_VERSION_libgcc-nativesdk               ?=3D "${ANGSTROM_GCC_VERSI=
ON}"
=A0=A0
Regards=A0
James Limbouris



