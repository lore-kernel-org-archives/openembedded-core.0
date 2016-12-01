Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A8C6B71B61
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 22:44:42 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2016 14:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,284,1477983600"; 
	d="asc'?scan'208";a="38050322"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.149])
	([10.219.5.149])
	by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2016 14:44:18 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5840A839.5070704@linux.intel.com>
Date: Thu, 1 Dec 2016 16:46:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Thu, 01 Dec 2016 22:44:43 -0000
X-Groupsio-MsgNum: 90148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8SS359cCDxRTfuajwbCDf7wgKPHtN56hX"

--8SS359cCDxRTfuajwbCDf7wgKPHtN56hX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 12/01/2016 04:39 PM, Khem Raj wrote:
> On Thu, Dec 1, 2016 at 8:34 AM, An=C3=ADbal Lim=C3=B3n
> <anibal.limon@linux.intel.com> wrote:
>> Some distributions (like opensuse421) supported by the project
>> comes with older gcc releases, -fstack-protector=3Dstrong is supported=

>> by GCC>=3D4.9.
>>
>> This causes a build failure when install perl-native from a sstate tha=
t
>> comes from a machine supporting -fstack-protector=3Dstrong [1].
>>
>> So disable usage of this flag in perl-native builds, this patch could
>> be removed when all supported distros comes with GCC>=3D4.9.
>=20
>=20
> Instead of disabling it. Can it be made detectable during configure.

The issue here is that comes from SSTATE mirror so the configure step
isn't executed again when a other machine without
-fstack-protector=3Dstrong download the sstate artifact was generate in
other machine with -fstack-protector=3Dstrong support. This is only for
native builds for target builds in enabled.

We have similar patches for example in rpm,

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools=
/rpm/rpm/popt-disable-auto-stack-protector.patch

Cheers,
	alimon


>=20
>>
>> [YOCTO #10338]
>>
>> [1] http://errors.yoctoproject.org/Errors/Details/109589/
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/recipes-devtools/perl/perl-native_5.24.0.bb   |   1 +
>>  ...emove-fstack-protector-strong-for-native-.patch | 103 ++++++++++++=
+++++++++
>>  2 files changed, 104 insertions(+)
>>  create mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-Rem=
ove-fstack-protector-strong-for-native-.patch
>>
>> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/r=
ecipes-devtools/perl/perl-native_5.24.0.bb
>> index af2ad7b..b1f0179 100644
>> --- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
>> +++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
>> @@ -11,6 +11,7 @@ SRC_URI +=3D "\
>>             file://debian/errno_ver.diff \
>>             file://dynaloaderhack.patch \
>>             file://perl-PathTools-don-t-filter-out-blib-from-INC.patch=
 \
>> +           file://0001-Configure-Remove-fstack-protector-strong-for-n=
ative-.patch \
>>            "
>>
>>  SRC_URI[md5sum] =3D "59456ae4bd4b06cb6e57cb19a3b2d349"
>> diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fst=
ack-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/perl/=
0001-Configure-Remove-fstack-protector-strong-for-native-.patch
>> new file mode 100644
>> index 0000000..7391ac5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-pro=
tector-strong-for-native-.patch
>> @@ -0,0 +1,103 @@
>> +Some distributions (like opensuse421) supported by the project
>> +comes with older gcc releases, -fstack-protector=3Dstrong is supporte=
d
>> +by GCC>=3D4.9.
>> +
>> +This causes a build failure when install perl-native from a sstate th=
at
>> +comes from a machine supporting -fstack-protector=3Dstrong [1].
>> +
>> +So disable usage of this flag in perl-native builds, this patch could=

>> +be removed when all supported distros comes with GCC>=3D4.9.
>> +
>> +[YOCTO #10338]
>> +
>> +Upstream-status: Inappropriate [configuration]
>> +
>> +[1] http://errors.yoctoproject.org/Errors/Details/109589/
>> +
>> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> +---
>> + Configure | 54 -----------------------------------------------------=
-
>> + 1 file changed, 54 deletions(-)
>> +
>> +diff --git a/Configure b/Configure
>> +index efbdcfd..d5bd98c 100755
>> +--- a/Configure
>> ++++ b/Configure
>> +@@ -5468,30 +5468,6 @@ default|recommended)
>> +               eval $checkccflag
>> +               ;;
>> +       esac
>> +-
>> +-      # on x86_64 (at least) we require an extra library (libssp) in=
 the
>> +-      # link command line. This library is not named, so I infer tha=
t it is
>> +-      # an implementation detail that may change. Hence the safest a=
pproach
>> +-      # is to add the flag to the flags passed to the compiler at li=
nk time,
>> +-      # as that way the compiler can do the right implementation dep=
endant
>> +-      # thing. (NWC)
>> +-      case "$osname" in
>> +-      amigaos) ;; # -fstack-protector builds but doesn't work
>> +-      *)      case "$gccversion" in
>> +-              ?*)     set stack-protector-strong -fstack-protector-s=
trong
>> +-                      eval $checkccflag
>> +-                      case "$dflt" in
>> +-                      *-fstack-protector-strong*) ;; # It got added.=

>> +-                      *) # Try the plain/older -fstack-protector.
>> +-                         set stack-protector -fstack-protector
>> +-                         eval $checkccflag
>> +-                         ;;
>> +-                      esac
>> +-                      ;;
>> +-              esac
>> +-              ;;
>> +-      esac
>> +-      ;;
>> + esac
>> +
>> + case "$mips_type" in
>> +@@ -5634,21 +5610,6 @@ case "$ldflags" in
>> +       ;;
>> + *) dflt=3D"$ldflags";;
>> + esac
>> +-# See note above about -fstack-protector
>> +-case "$ccflags" in
>> +-*-fstack-protector-strong*)
>> +-      case "$dflt" in
>> +-      *-fstack-protector-strong*) ;; # Don't add it again
>> +-      *) dflt=3D"$dflt -fstack-protector-strong" ;;
>> +-      esac
>> +-      ;;
>> +-*-fstack-protector*)
>> +-      case "$dflt" in
>> +-      *-fstack-protector*) ;; # Don't add it again
>> +-      *) dflt=3D"$dflt -fstack-protector" ;;
>> +-      esac
>> +-      ;;
>> +-esac
>> +
>> + : Try to guess additional flags to pick up local libraries.
>> + for thislibdir in $libpth; do
>> +@@ -8571,21 +8532,6 @@ EOM
>> +           ''|' ') dflt=3D'none' ;;
>> +       esac
>> +
>> +-      case "$ldflags" in
>> +-          *-fstack-protector-strong*)
>> +-              case "$dflt" in
>> +-                  *-fstack-protector-strong*) ;; # Don't add it agai=
n
>> +-                  *) dflt=3D"$dflt -fstack-protector-strong" ;;
>> +-              esac
>> +-              ;;
>> +-          *-fstack-protector*)
>> +-              case "$dflt" in
>> +-                  *-fstack-protector*) ;; # Don't add it again
>> +-                  *) dflt=3D"$dflt -fstack-protector" ;;
>> +-              esac
>> +-              ;;
>> +-      esac
>> +-
>> +       rp=3D"Any special flags to pass to $ld to create a dynamically=
 loaded library?"
>> +       . ./myread
>> +       case "$ans" in
>> +--
>> +2.1.4
>> +
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--8SS359cCDxRTfuajwbCDf7wgKPHtN56hX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYQKg7AAoJEGJqcE9h3glgOO8P/j0607qk9LCABaiegCkNp8O6
GGvOIisMxsA3oTwV95WXB4seiI8/YUaAtH6PapQ9zfCariocM5TCXOfyAikDuoGH
nGtswCZrvU6qj23GY2M+0u9kcRnnprDJvhvl1tkt/khqdPjhmheRpRJisfgVeJdp
xMDV7QCtMWOVaEEHIWHyXmqfDO9NoCWH7o6d3OvLmB1HXRlCmlzhqtVdLAh0hKH7
rGOibAHk8TNjJq5JXO6f1a3eDePNoGkUmi6FD7DrVnBohfPL09S3EKxm+0l+OP8j
NvNzoyuYnbQCPcgKcgc+bKTqjS1quQroDQ6i5nESXDlqyPFiiEqKMRzDpNgKRqqF
Kj0AAMTaos3pucDFkrpn+VKib/ufrfvu66JtLUCeJ+XwfyrLoPG22FpKN8Z4E25W
VHhUsS6upkFArwf6rlk9K5ZTSdtAmjRfU8iiapbHwdpD8oCVjbKTltSUuy41Kfka
YcwHox2MrATolpUSn+luBOZp2LcWacB6gGl6Hkam7qRTXanitlhxOwfuSjX5k2M5
vaxExGZUIOSW/chNFSicI9H815HUWcpOE9qaKlcvOUzWpK+GyhONJz1PaCbRb5oB
NtIFJhLpVSh/coWPEbMPN7KqFpviKbpvBWoE/ZA64KYIMxUz4u48HspgCQX4Hgkh
xhaK9w+CUfazs3MI/lbn
=1PtG
-----END PGP SIGNATURE-----

--8SS359cCDxRTfuajwbCDf7wgKPHtN56hX--
