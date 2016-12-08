Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0DE060745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:58:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 08 Dec 2016 08:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; 
	d="asc'?scan'208";a="795794863"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.142])
	([10.219.5.142])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2016 08:58:34 -0800
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
	<5840A839.5070704@linux.intel.com>
	<CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <584991B7.9050603@linux.intel.com>
Date: Thu, 8 Dec 2016 11:00:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Dec 2016 16:58:38 -0000
X-Groupsio-MsgNum: 90500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7MjNRI329jb0s4xNcbcXhXr0ghXVKg2lq"

--7MjNRI329jb0s4xNcbcXhXr0ghXVKg2lq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ping, :D

	alimon

On 12/01/2016 06:19 PM, Khem Raj wrote:
> On Thu, Dec 1, 2016 at 2:46 PM, An=C3=ADbal Lim=C3=B3n
> <anibal.limon@linux.intel.com> wrote:
>>
>>
>> On 12/01/2016 04:39 PM, Khem Raj wrote:
>>> On Thu, Dec 1, 2016 at 8:34 AM, An=C3=ADbal Lim=C3=B3n
>>> <anibal.limon@linux.intel.com> wrote:
>>>> Some distributions (like opensuse421) supported by the project
>>>> comes with older gcc releases, -fstack-protector=3Dstrong is support=
ed
>>>> by GCC>=3D4.9.
>>>>
>>>> This causes a build failure when install perl-native from a sstate t=
hat
>>>> comes from a machine supporting -fstack-protector=3Dstrong [1].
>>>>
>>>> So disable usage of this flag in perl-native builds, this patch coul=
d
>>>> be removed when all supported distros comes with GCC>=3D4.9.
>>>
>>>
>>> Instead of disabling it. Can it be made detectable during configure.
>>
>> The issue here is that comes from SSTATE mirror so the configure step
>> isn't executed again when a other machine without
>> -fstack-protector=3Dstrong download the sstate artifact was generate i=
n
>> other machine with -fstack-protector=3Dstrong support. This is only fo=
r
>> native builds for target builds in enabled.
>>
>> We have similar patches for example in rpm,
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devto=
ols/rpm/rpm/popt-disable-auto-stack-protector.patch
>>
>=20
> yeah I see, thanks, I guess we need to bring it down to lowest common
> denominator I guess.
> maybe we should start thinking about gcc-native
>=20
>=20
>> Cheers,
>>         alimon
>>
>>
>>>
>>>>
>>>> [YOCTO #10338]
>>>>
>>>> [1] http://errors.yoctoproject.org/Errors/Details/109589/
>>>>
>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>=

>>>> ---
>>>>  meta/recipes-devtools/perl/perl-native_5.24.0.bb   |   1 +
>>>>  ...emove-fstack-protector-strong-for-native-.patch | 103 ++++++++++=
+++++++++++
>>>>  2 files changed, 104 insertions(+)
>>>>  create mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-R=
emove-fstack-protector-strong-for-native-.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta=
/recipes-devtools/perl/perl-native_5.24.0.bb
>>>> index af2ad7b..b1f0179 100644
>>>> --- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
>>>> +++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
>>>> @@ -11,6 +11,7 @@ SRC_URI +=3D "\
>>>>             file://debian/errno_ver.diff \
>>>>             file://dynaloaderhack.patch \
>>>>             file://perl-PathTools-don-t-filter-out-blib-from-INC.pat=
ch \
>>>> +           file://0001-Configure-Remove-fstack-protector-strong-for=
-native-.patch \
>>>>            "
>>>>
>>>>  SRC_URI[md5sum] =3D "59456ae4bd4b06cb6e57cb19a3b2d349"
>>>> diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-f=
stack-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/per=
l/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
>>>> new file mode 100644
>>>> index 0000000..7391ac5
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-p=
rotector-strong-for-native-.patch
>>>> @@ -0,0 +1,103 @@
>>>> +Some distributions (like opensuse421) supported by the project
>>>> +comes with older gcc releases, -fstack-protector=3Dstrong is suppor=
ted
>>>> +by GCC>=3D4.9.
>>>> +
>>>> +This causes a build failure when install perl-native from a sstate =
that
>>>> +comes from a machine supporting -fstack-protector=3Dstrong [1].
>>>> +
>>>> +So disable usage of this flag in perl-native builds, this patch cou=
ld
>>>> +be removed when all supported distros comes with GCC>=3D4.9.
>>>> +
>>>> +[YOCTO #10338]
>>>> +
>>>> +Upstream-status: Inappropriate [configuration]
>>>> +
>>>> +[1] http://errors.yoctoproject.org/Errors/Details/109589/
>>>> +
>>>> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com=
>
>>>> +---
>>>> + Configure | 54 ---------------------------------------------------=
---
>>>> + 1 file changed, 54 deletions(-)
>>>> +
>>>> +diff --git a/Configure b/Configure
>>>> +index efbdcfd..d5bd98c 100755
>>>> +--- a/Configure
>>>> ++++ b/Configure
>>>> +@@ -5468,30 +5468,6 @@ default|recommended)
>>>> +               eval $checkccflag
>>>> +               ;;
>>>> +       esac
>>>> +-
>>>> +-      # on x86_64 (at least) we require an extra library (libssp) =
in the
>>>> +-      # link command line. This library is not named, so I infer t=
hat it is
>>>> +-      # an implementation detail that may change. Hence the safest=
 approach
>>>> +-      # is to add the flag to the flags passed to the compiler at =
link time,
>>>> +-      # as that way the compiler can do the right implementation d=
ependant
>>>> +-      # thing. (NWC)
>>>> +-      case "$osname" in
>>>> +-      amigaos) ;; # -fstack-protector builds but doesn't work
>>>> +-      *)      case "$gccversion" in
>>>> +-              ?*)     set stack-protector-strong -fstack-protector=
-strong
>>>> +-                      eval $checkccflag
>>>> +-                      case "$dflt" in
>>>> +-                      *-fstack-protector-strong*) ;; # It got adde=
d.
>>>> +-                      *) # Try the plain/older -fstack-protector.
>>>> +-                         set stack-protector -fstack-protector
>>>> +-                         eval $checkccflag
>>>> +-                         ;;
>>>> +-                      esac
>>>> +-                      ;;
>>>> +-              esac
>>>> +-              ;;
>>>> +-      esac
>>>> +-      ;;
>>>> + esac
>>>> +
>>>> + case "$mips_type" in
>>>> +@@ -5634,21 +5610,6 @@ case "$ldflags" in
>>>> +       ;;
>>>> + *) dflt=3D"$ldflags";;
>>>> + esac
>>>> +-# See note above about -fstack-protector
>>>> +-case "$ccflags" in
>>>> +-*-fstack-protector-strong*)
>>>> +-      case "$dflt" in
>>>> +-      *-fstack-protector-strong*) ;; # Don't add it again
>>>> +-      *) dflt=3D"$dflt -fstack-protector-strong" ;;
>>>> +-      esac
>>>> +-      ;;
>>>> +-*-fstack-protector*)
>>>> +-      case "$dflt" in
>>>> +-      *-fstack-protector*) ;; # Don't add it again
>>>> +-      *) dflt=3D"$dflt -fstack-protector" ;;
>>>> +-      esac
>>>> +-      ;;
>>>> +-esac
>>>> +
>>>> + : Try to guess additional flags to pick up local libraries.
>>>> + for thislibdir in $libpth; do
>>>> +@@ -8571,21 +8532,6 @@ EOM
>>>> +           ''|' ') dflt=3D'none' ;;
>>>> +       esac
>>>> +
>>>> +-      case "$ldflags" in
>>>> +-          *-fstack-protector-strong*)
>>>> +-              case "$dflt" in
>>>> +-                  *-fstack-protector-strong*) ;; # Don't add it ag=
ain
>>>> +-                  *) dflt=3D"$dflt -fstack-protector-strong" ;;
>>>> +-              esac
>>>> +-              ;;
>>>> +-          *-fstack-protector*)
>>>> +-              case "$dflt" in
>>>> +-                  *-fstack-protector*) ;; # Don't add it again
>>>> +-                  *) dflt=3D"$dflt -fstack-protector" ;;
>>>> +-              esac
>>>> +-              ;;
>>>> +-      esac
>>>> +-
>>>> +       rp=3D"Any special flags to pass to $ld to create a dynamical=
ly loaded library?"
>>>> +       . ./myread
>>>> +       case "$ans" in
>>>> +--
>>>> +2.1.4
>>>> +
>>>> --
>>>> 2.1.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


--7MjNRI329jb0s4xNcbcXhXr0ghXVKg2lq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYSZG6AAoJEGJqcE9h3glgbXoP/2w25PIlFAPk+Q6tWpDds4tn
stuHveRTBmzA4n3IqC2qVdjategt1L6Jsz2WoOKL4v5pRaNq8WJq4KwQNil9DK9S
XejULveBckv++rWiuKxy2kmnJRDe0Nhx52y4gr+TX6wBNlyTd9AD2K3RWEm/szuX
NEF/E+8o/93E2hqo/ffmWVJ0C9HDkwDcRz5xy/OPsM/6mM58GsdXjdcNnCUNPTqC
xsPSmwq/LykblRoAQUHbqr70seWxprvf2a5+CUrWxhpOtWm7PD6Y48DF6QfytF5M
0FKMZ0S8ru7t/e67FqubzpT1XkqqgZw0X5xHemzX9UA0u8dq/veBoqbIZ5UDq8Vm
CnpMkoLHGzxf6lh3ao9FGApVzbSABse+ZOdXhAzU0svdRNh1W3GS+cxkX5g8eoZP
wJEFEYo4QJJsE0JSJpGYw0vfR/PD50AS3viC+nHRyZpfiD7dh84+a01yhE0ay6gP
QkctHIPaQhlxKJ6BJwu1YYpr6r8D5gyR9ehJa5ZPNPDhcwBY9rWq7F5P//sqFe1u
7K6KoJxg4RO5b02aIRauxlzRTVkVd8xCMM8XTWZGrKz8BeEJb/fzggYViKfAeOpT
7nZYj8q/WIl1pvETguSKcqAQmudcFqnTLoF0cmk4Jx9cP8q/i14u10Z26HGzpfHG
pasFwP9DtuGbRCFPbvZZ
=8ta9
-----END PGP SIGNATURE-----

--7MjNRI329jb0s4xNcbcXhXr0ghXVKg2lq--
