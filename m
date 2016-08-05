Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDC5977154
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 21:44:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 05 Aug 2016 14:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,475,1464678000"; 
	d="asc'?scan'208";a="1020498104"
Received: from pgronows-mobl.amr.corp.intel.com (HELO [10.254.134.94])
	([10.254.134.94])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2016 14:44:17 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <1469821981-6456-1-git-send-email-anibal.limon@linux.intel.com>
	<04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57A508B0.6080109@linux.intel.com>
Date: Fri, 5 Aug 2016 16:44:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
Cc: alexander.kanavin@intel.com
Subject: Re: [PATCH] apt: Upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 21:44:29 -0000
X-Groupsio-MsgNum: 85397
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="EhDn5Qcg3f9LqTaJwUHG1Bi6p2S23sHqk"

--EhDn5Qcg3f9LqTaJwUHG1Bi6p2S23sHqk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 08/05/2016 10:44 AM, Khem Raj wrote:
>=20
>=20
> On 7/29/16 12:53 PM, An=C3=ADbal Lim=C3=B3n wrote:
>> Test was made building core-image-sato with package_deb on qemux86 and=

>> qemuarm then run for two of them testimage and install packages with
>> apt-get using PACKAGE_FEED_URI's configuration.
>>
>> Now apt support drop priviligies for install packages using a sandbox
>> with _apt user, the useradd class was inherit and configured to instal=
l
>> _apt user and group.
>>
>> Rebased patches:
>>
>> 	- 0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
>>         - 0001-fix-the-gcc-version-check.patch
>> 	- 0001-remove-Wsuggest-attribute-from-CFLAGS.patch
>> 	- disable-test.patch
>> 	- no-curl.patch
>=20
> This breaks on musl. Another plea to add a world build on AB for atleas=
t
> 1 target for musl.
>=20
> see
>=20
> http://errors.yoctoproject.org/Errors/Details/74375/
>=20
> Fix is simply to include <sys/types.h> which is getting included
> indirectly via some  other header on glibc but not on musl

Hi Khem,

I sent a patch for fix the include of sys/path and another one for fix
musl unsupported AI_IDN flag in netdb.h.

Thanks for notice it,
	alimon

>=20
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/recipes-devtools/apt/apt-native_1.0.10.1.bb   |   4 -
>>  meta/recipes-devtools/apt/apt-native_1.2.12.bb     |   4 +
>>  meta/recipes-devtools/apt/apt.inc                  |  11 +-
>>  ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 278 +-----------=
---------
>>  .../apt/apt/0001-fix-the-gcc-version-check.patch   | 128 ++--------
>>  ...001-remove-Wsuggest-attribute-from-CFLAGS.patch |  24 +-
>>  meta/recipes-devtools/apt/apt/disable-test.patch   |  47 ++--
>>  meta/recipes-devtools/apt/apt_1.0.10.1.bb          |  19 --
>>  meta/recipes-devtools/apt/apt_1.2.12.bb            |  19 ++
>>  meta/recipes-devtools/apt/files/no-curl.patch      |  30 ++-
>>  10 files changed, 131 insertions(+), 433 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/apt/apt-native_1.0.10.1.bb
>>  create mode 100644 meta/recipes-devtools/apt/apt-native_1.2.12.bb
>>  delete mode 100644 meta/recipes-devtools/apt/apt_1.0.10.1.bb
>>  create mode 100644 meta/recipes-devtools/apt/apt_1.2.12.bb
>>
>> diff --git a/meta/recipes-devtools/apt/apt-native_1.0.10.1.bb b/meta/r=
ecipes-devtools/apt/apt-native_1.0.10.1.bb
>> deleted file mode 100644
>> index 1e660da..0000000
>> --- a/meta/recipes-devtools/apt/apt-native_1.0.10.1.bb
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -require apt-native.inc
>> -
>> -SRC_URI +=3D "file://noconfigure.patch \
>> -            file://no-curl.patch"
>> diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/rec=
ipes-devtools/apt/apt-native_1.2.12.bb
>> new file mode 100644
>> index 0000000..1e660da
>> --- /dev/null
>> +++ b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
>> @@ -0,0 +1,4 @@
>> +require apt-native.inc
>> +
>> +SRC_URI +=3D "file://noconfigure.patch \
>> +            file://no-curl.patch"
>> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools=
/apt/apt.inc
>> index 78ef5a7..87cc206 100644
>> --- a/meta/recipes-devtools/apt/apt.inc
>> +++ b/meta/recipes-devtools/apt/apt.inc
>> @@ -2,7 +2,7 @@ SUMMARY =3D "Advanced front-end for dpkg"
>>  LICENSE =3D "GPLv2.0+"
>>  SECTION =3D "base"
>> =20
>> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20150805T09492=
8Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
>> +SRC_URI =3D "http://snapshot.debian.org/archive/debian/20160526T16294=
3Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
>>             file://use-host.patch \
>>             file://makerace.patch \
>>             file://no-nls-dpkg.patch \
>> @@ -13,15 +13,15 @@ SRC_URI =3D "http://snapshot.debian.org/archive/de=
bian/20150805T094928Z/pool/main/
>>             file://disable-test.patch \
>>             file://0001-environment.mak-musl-based-systems-can-generat=
e-shar.patch \
>>             "
>> -SRC_URI[md5sum] =3D "6505c4297b338adb2087ce87bbc4a276"
>> -SRC_URI[sha256sum] =3D "3fb1de9598363c416591d49e3c285458e095b035e6c06=
d5b944a54e15fc9b543"
>> +SRC_URI[md5sum] =3D "80f6f0ef110a45a7e5af8a9d233fb0e7"
>> +SRC_URI[sha256sum] =3D "e820d27cba73476df4abcff27dadd1b5847474bfe85f7=
e9202a9a07526973ea6"
>>  LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D0636e73ff0215e8d672dc4=
c32c317bb3"
>> =20
>>  # the package is taken from snapshots.debian.org; that source is stat=
ic and goes stale
>>  # so we check the latest upstream from a directory that does get upda=
ted
>>  UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
>> =20
>> -inherit autotools gettext
>> +inherit autotools gettext useradd
>> =20
>>  EXTRA_AUTORECONF =3D "--exclude=3Dautopoint,autoheader"
>> =20
>> @@ -29,3 +29,6 @@ do_configure_prepend() {
>>      rm -rf ${S}/buildlib/config.sub
>>      rm -rf ${S}/buildlib/config.guess
>>  }
>> +
>> +USERADD_PACKAGES =3D "${PN}"
>> +USERADD_PARAM_${PN} =3D "--system --no-create-home --home-dir /nonexi=
stent --shell /bin/false --user-group _apt"
>> diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg=
-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001=
-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
>> index d33069b..b3a883b 100644
>> --- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-config=
ure-a-at-the-end-of-our.patch
>> +++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-config=
ure-a-at-the-end-of-our.patch
>> @@ -1,4 +1,4 @@
>> -From 106797f1c66fa578dad21fd9380bf9d576573dfd Mon Sep 17 00:00:00 200=
1
>> +From dfc1370d50322e2e9d225a7a63b44993fc01a727 Mon Sep 17 00:00:00 200=
1
>>  From: Roy Li <rongqing.li@windriver.com>
>>  Date: Fri, 22 May 2015 08:05:15 +0800
>>  Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end =
of our
>> @@ -16,21 +16,16 @@ be passed into dpkg, and lead to the below similar=
 error:
>> =20
>>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>  ---
>> - apt-pkg/deb/dpkgpm.cc                              |  9 +--
>> - test/integration/framework                         | 25 ++++----
>> - test/integration/test-apt-progress-fd              | 67 +++++++++---=
-------
>> - test/integration/test-apt-progress-fd-deb822       | 18 ++----
>> - test/integration/test-apt-progress-fd-error        |  2 +-
>> - ...est-bug-769609-triggers-still-pending-after-run | 75 ------------=
----------
>> - .../test-no-fds-leaked-to-maintainer-scripts       |  6 +-
>> - 7 files changed, 56 insertions(+), 146 deletions(-)
>> - delete mode 100755 test/integration/test-bug-769609-triggers-still-p=
ending-after-run
>> + apt-pkg/deb/dpkgpm.cc                                     |  9 ++---=
----
>> + test/integration/test-apt-progress-fd-deb822              | 14 +++++=
++-------
>> + test/integration/test-no-fds-leaked-to-maintainer-scripts |  6 ++---=
-
>> + 3 files changed, 11 insertions(+), 18 deletions(-)
>> =20
>>  diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
>> -index b187efb..f269764 100644
>> +index 834cb0e..84ded3a 100644
>>  --- a/apt-pkg/deb/dpkgpm.cc
>>  +++ b/apt-pkg/deb/dpkgpm.cc
>> -@@ -1049,12 +1049,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
>> +@@ -1037,12 +1037,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
>>   	 PackagesTotal++;
>>         }
>>      }
>> @@ -42,8 +37,8 @@ index b187efb..f269764 100644
>>  -   ++PackagesTotal;
>>   }
>>                                                                       =
    /*}}}*/
>> - #if (APT_PKG_MAJOR >=3D 4 && APT_PKG_MINOR < 13)
>> -@@ -1294,8 +1288,9 @@ bool pkgDPkgPM::GoNoABIBreak(APT::Progress::Pac=
kageManager *progress)
>> + bool pkgDPkgPM::Go(int StatusFd)
>> +@@ -1250,8 +1244,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManage=
r *progress)
>>  =20
>>      // support subpressing of triggers processing for special
>>      // cases like d-i that runs the triggers handling manually
>> @@ -54,159 +49,11 @@ index b187efb..f269764 100644
>>         List.push_back(Item(Item::ConfigurePending, PkgIterator()));
>>  =20
>>      // for the progress
>> -diff --git a/test/integration/framework b/test/integration/framework
>> -index 70ad381..00672ad 100644
>> ---- a/test/integration/framework
>> -+++ b/test/integration/framework
>> -@@ -1178,13 +1178,10 @@ testnopackage() {
>> - 	fi
>> - }
>> -=20
>> --testdpkgstatus() {
>> --	local STATE=3D"$1"
>> --	local NR=3D"$2"
>> --	shift 2
>> --	msgtest "Test that $NR package(s) are in state $STATE with" "dpkg -=
l $*"
>> --	local PKGS=3D"$(dpkg -l "$@" 2>/dev/null | grep "^${STATE}" | wc -l=
)"
>> --	if [ "$PKGS" !=3D $NR ]; then
>> -+testdpkginstalled() {
>> -+	msgtest "Test for correctly installed package(s) with" "dpkg -l $*"=

>> -+	local PKGS=3D"$(dpkg -l "$@" 2>/dev/null | grep '^i' | wc -l)"
>> -+	if [ "$PKGS" !=3D $# ]; then
>> - 		echo >&2 $PKGS
>> - 		dpkg -l "$@" | grep '^[a-z]' >&2
>> - 		msgfail
>> -@@ -1193,12 +1190,16 @@ testdpkgstatus() {
>> - 	fi
>> - }
>> -=20
>> --testdpkginstalled() {
>> --	testdpkgstatus 'ii' "$#" "$@"
>> --}
>> --
>> - testdpkgnotinstalled() {
>> --	testdpkgstatus 'ii' '0' "$@"
>> -+	msgtest "Test for correctly not-installed package(s) with" "dpkg -l=
 $*"
>> -+	local PKGS=3D"$(dpkg -l "$@" 2> /dev/null | grep '^i' | wc -l)"
>> -+	if [ "$PKGS" !=3D 0 ]; then
>> -+		echo
>> -+		dpkg -l "$@" | grep '^[a-z]' >&2
>> -+		msgfail
>> -+	else
>> -+		msgpass
>> -+	fi
>> - }
>> -=20
>> - testmarkedauto() {
>> -diff --git a/test/integration/test-apt-progress-fd b/test/integration=
/test-apt-progress-fd
>> -index 68cc043..d72e7e7 100755
>> ---- a/test/integration/test-apt-progress-fd
>> -+++ b/test/integration/test-apt-progress-fd
>> -@@ -19,14 +19,13 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
>> - dlstatus:1:0:Retrieving file 1 of 1
>> - pmstatus:dpkg-exec:0:Running dpkg
>> - pmstatus:testing:0:Installing testing (amd64)
>> --pmstatus:testing:16.6667:Preparing testing (amd64)
>> --pmstatus:testing:33.3333:Unpacking testing (amd64)
>> --pmstatus:testing:50:Preparing to configure testing (amd64)
>> --pmstatus:dpkg-exec:50:Running dpkg
>> --pmstatus:testing:50:Configuring testing (amd64)
>> --pmstatus:testing:66.6667:Configuring testing (amd64)
>> --pmstatus:testing:83.3333:Installed testing (amd64)
>> --pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
>> -+pmstatus:testing:20:Preparing testing (amd64)
>> -+pmstatus:testing:40:Unpacking testing (amd64)
>> -+pmstatus:testing:60:Preparing to configure testing (amd64)
>> -+pmstatus:dpkg-exec:60:Running dpkg
>> -+pmstatus:testing:60:Configuring testing (amd64)
>> -+pmstatus:testing:80:Configuring testing (amd64)
>> -+pmstatus:testing:100:Installed testing (amd64)" cat apt-progress.log=

>> -=20
>> - # upgrade
>> - exec 3> apt-progress.log
>> -@@ -35,14 +34,13 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
>> - dlstatus:1:0:Retrieving file 1 of 1
>> - pmstatus:dpkg-exec:0:Running dpkg
>> - pmstatus:testing:0:Installing testing (amd64)
>> --pmstatus:testing:16.6667:Preparing testing (amd64)
>> --pmstatus:testing:33.3333:Unpacking testing (amd64)
>> --pmstatus:testing:50:Preparing to configure testing (amd64)
>> --pmstatus:dpkg-exec:50:Running dpkg
>> --pmstatus:testing:50:Configuring testing (amd64)
>> --pmstatus:testing:66.6667:Configuring testing (amd64)
>> --pmstatus:testing:83.3333:Installed testing (amd64)
>> --pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
>> -+pmstatus:testing:20:Preparing testing (amd64)
>> -+pmstatus:testing:40:Unpacking testing (amd64)
>> -+pmstatus:testing:60:Preparing to configure testing (amd64)
>> -+pmstatus:dpkg-exec:60:Running dpkg
>> -+pmstatus:testing:60:Configuring testing (amd64)
>> -+pmstatus:testing:80:Configuring testing (amd64)
>> -+pmstatus:testing:100:Installed testing (amd64)" cat apt-progress.log=

>> -=20
>> - # reinstall
>> - exec 3> apt-progress.log
>> -@@ -51,24 +49,22 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
>> - dlstatus:1:0:Retrieving file 1 of 1
>> - pmstatus:dpkg-exec:0:Running dpkg
>> - pmstatus:testing:0:Installing testing (amd64)
>> --pmstatus:testing:16.6667:Preparing testing (amd64)
>> --pmstatus:testing:33.3333:Unpacking testing (amd64)
>> --pmstatus:testing:50:Preparing to configure testing (amd64)
>> --pmstatus:dpkg-exec:50:Running dpkg
>> --pmstatus:testing:50:Configuring testing (amd64)
>> --pmstatus:testing:66.6667:Configuring testing (amd64)
>> --pmstatus:testing:83.3333:Installed testing (amd64)
>> --pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
>> -+pmstatus:testing:20:Preparing testing (amd64)
>> -+pmstatus:testing:40:Unpacking testing (amd64)
>> -+pmstatus:testing:60:Preparing to configure testing (amd64)
>> -+pmstatus:dpkg-exec:60:Running dpkg
>> -+pmstatus:testing:60:Configuring testing (amd64)
>> -+pmstatus:testing:80:Configuring testing (amd64)
>> -+pmstatus:testing:100:Installed testing (amd64)" cat apt-progress.log=

>> -=20
>> - # and remove
>> - exec 3> apt-progress.log
>> - testsuccess aptget remove testing -y -o APT::Status-Fd=3D3
>> - testequal "pmstatus:dpkg-exec:0:Running dpkg
>> - pmstatus:testing:0:Removing testing (amd64)
>> --pmstatus:testing:25:Preparing for removal of testing (amd64)
>> --pmstatus:testing:50:Removing testing (amd64)
>> --pmstatus:testing:75:Removed testing (amd64)
>> --pmstatus:dpkg-exec:75:Running dpkg" cat apt-progress.log
>> -+pmstatus:testing:33.3333:Preparing for removal of testing (amd64)
>> -+pmstatus:testing:66.6667:Removing testing (amd64)
>> -+pmstatus:testing:100:Removed testing (amd64)" cat apt-progress.log
>> -=20
>> - # install non-native and ensure we get proper progress info
>> - exec 3> apt-progress.log
>> -@@ -79,13 +75,12 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
>> - dlstatus:1:0:Retrieving file 1 of 1
>> - pmstatus:dpkg-exec:0:Running dpkg
>> - pmstatus:testing2:0:Installing testing2 (i386)
>> --pmstatus:testing2:16.6667:Preparing testing2 (i386)
>> --pmstatus:testing2:33.3333:Unpacking testing2 (i386)
>> --pmstatus:testing2:50:Preparing to configure testing2 (i386)
>> --pmstatus:dpkg-exec:50:Running dpkg
>> --pmstatus:testing2:50:Configuring testing2 (i386)
>> --pmstatus:testing2:66.6667:Configuring testing2 (i386)
>> --pmstatus:testing2:83.3333:Installed testing2 (i386)
>> --pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
>> -+pmstatus:testing2:20:Preparing testing2 (i386)
>> -+pmstatus:testing2:40:Unpacking testing2 (i386)
>> -+pmstatus:testing2:60:Preparing to configure testing2 (i386)
>> -+pmstatus:dpkg-exec:60:Running dpkg
>> -+pmstatus:testing2:60:Configuring testing2 (i386)
>> -+pmstatus:testing2:80:Configuring testing2 (i386)
>> -+pmstatus:testing2:100:Installed testing2 (i386)" cat apt-progress.lo=
g
>> -=20
>> - rm -f apt-progress*.log
>>  diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/inte=
gration/test-apt-progress-fd-deb822
>> -index badc985..9d22794 100755
>> +index 58fd732..3359762 100755
>>  --- a/test/integration/test-apt-progress-fd-deb822
>>  +++ b/test/integration/test-apt-progress-fd-deb822
>> -@@ -27,41 +27,37 @@ Message: Installing testing (amd64)
>> +@@ -27,36 +27,36 @@ Message: Installing testing (amd64)
>>  =20
>>   Status: progress
>>   Package: testing:amd64
>> @@ -248,109 +95,10 @@ index badc985..9d22794 100755
>>  -Percent: 83.3333
>>  +Percent: 100
>>   Message: Installed testing (amd64)
>> --
>> --Status: progress
>> --Percent: 83.3333
>> --Message: Running dpkg
>> - " cat apt-progress.log
>> -=20
>>  =20
>> -diff --git a/test/integration/test-apt-progress-fd-error b/test/integ=
ration/test-apt-progress-fd-error
>> -index 6323007..a47095b 100755
>> ---- a/test/integration/test-apt-progress-fd-error
>> -+++ b/test/integration/test-apt-progress-fd-error
>> -@@ -18,7 +18,7 @@ setupaptarchive
>> - exec 3> apt-progress.log
>> - testfailure aptget install foo1 foo2 -y -o APT::Status-Fd=3D3
>> - msgtest "Ensure correct error message"
>> --if grep -q "aptarchive/pool/foo2_0.8.15_amd64.deb:36.3636:trying to =
overwrite '/usr/bin/file-conflict', which is also in package foo1 0.8.15"=
 apt-progress.log; then
>> -+if grep -q "aptarchive/pool/foo2_0.8.15_amd64.deb:40:trying to overw=
rite '/usr/bin/file-conflict', which is also in package foo1 0.8.15" apt-=
progress.log; then
>> - 	msgpass
>> - else
>> - 	cat apt-progress.log
>> -diff --git a/test/integration/test-bug-769609-triggers-still-pending-=
after-run b/test/integration/test-bug-769609-triggers-still-pending-after=
-run
>> -deleted file mode 100755
>> -index 146fa76..0000000
>> ---- a/test/integration/test-bug-769609-triggers-still-pending-after-r=
un
>> -+++ /dev/null
>> -@@ -1,75 +0,0 @@
>> --#!/bin/sh
>> --set -e
>> --
>> --TESTDIR=3D$(readlink -f $(dirname $0))
>> --. $TESTDIR/framework
>> --
>> --setupenvironment
>> --configarchitecture 'amd64'
>> --
>> --msgtest 'Check if installed dpkg supports' 'noawait trigger'
>> --if dpkg-checkbuilddeps -d 'dpkg (>=3D 1.16.1)' /dev/null; then
>> --	msgpass
>> --else
>> --	msgskip 'dpkg version too old'
>> --	exit 0
>> --fi
>> --configdpkgnoopchroot
>> --
>> --buildtriggerpackages() {
>> --	local TYPE=3D"$1"
>> --	setupsimplenativepackage "triggerable-$TYPE" 'all' '1.0' 'unstable'=
 "Depends: trigdepends-$TYPE"
>> --	BUILDDIR=3D"incoming/triggerable-${TYPE}-1.0"
>> --	cat >${BUILDDIR}/debian/postinst <<EOF
>> --#!/bin/sh
>> --if [ "\$1" =3D 'triggered' ]; then
>> --	ls -l /proc/self/fd/
>> --fi
>> --EOF
>> --	echo "$TYPE /usr/share/doc" > ${BUILDDIR}/debian/triggers
>> --	buildpackage "$BUILDDIR" 'unstable' 'main' 'native'
>> --	rm -rf "$BUILDDIR"
>> --	buildsimplenativepackage "trigdepends-$TYPE" 'all' '1.0' 'unstable'=

>> --}
>> --
>> --#buildtriggerpackages 'interest'
>> --buildtriggerpackages 'interest-noawait'
>> --buildsimplenativepackage "trigstuff" 'all' '1.0' 'unstable'
>> --
>> --setupaptarchive
>> --
>> --runtests() {
>> --	local TYPE=3D"$1"
>> --	msgmsg 'Working with trigger type' "$TYPE"
>> --	testsuccess aptget install triggerable-$TYPE -y
>> --	cp rootdir/tmp/testsuccess.output terminal.output
>> --	testsuccess grep '^REWRITE ' terminal.output
>> --	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE
>> --
>> --	testsuccess aptget install trigdepends-$TYPE -y --reinstall
>> --	cp rootdir/tmp/testsuccess.output terminal.output
>> --	testsuccess grep '^REWRITE ' terminal.output
>> --	testsuccess grep ' root root ' terminal.output
>> --	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE
>> --
>> --	testsuccess aptget install trigstuff -y
>> --	cp rootdir/tmp/testsuccess.output terminal.output
>> --	testsuccess grep '^REWRITE ' terminal.output
>> --	testsuccess grep ' root root ' terminal.output
>> --	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE trigstuff
>> --
>> --	testsuccess aptget purge trigstuff -y
>> --	cp rootdir/tmp/testsuccess.output terminal.output
>> --	testsuccess grep '^REWRITE ' terminal.output
>> --	testsuccess grep ' root root ' terminal.output
>> --	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE
>> --	testdpkgnotinstalled trigstuff
>> --
>> --	testsuccess aptget purge trigdepends-$TYPE -y
>> --	cp rootdir/tmp/testsuccess.output terminal.output
>> --	testfailure grep '^REWRITE ' terminal.output
>> --	testfailure grep ' root root ' terminal.output
>> --	testdpkgnotinstalled triggerable-$TYPE trigdepends-$TYPE
>> --}
>> --#runtests 'interest'
>> --runtests 'interest-noawait'
>> + Status: progress
>>  diff --git a/test/integration/test-no-fds-leaked-to-maintainer-script=
s b/test/integration/test-no-fds-leaked-to-maintainer-scripts
>> -index 41c0570..d3960d7 100755
>> +index d86e638..ef6d23b 100755
>>  --- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
>>  +++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
>>  @@ -59,8 +59,7 @@ startup packages configure
>> diff --git a/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-ch=
eck.patch b/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.=
patch
>> index beea56d..3ac9246 100644
>> --- a/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.pat=
ch
>> +++ b/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.pat=
ch
>> @@ -1,4 +1,4 @@
>> -From 15c6ef6a827d3681ad06e862d27ab3dfb84cb687 Mon Sep 17 00:00:00 200=
1
>> +From 53c5d0982f03fd0e24c4195d6e1e42b9ade9d500 Mon Sep 17 00:00:00 200=
1
>>  From: Roy Li <rongqing.li@windriver.com>
>>  Date: Wed, 27 May 2015 14:30:28 +0800
>>  Subject: [PATCH] fix the gcc version check
>> @@ -9,37 +9,29 @@ Upstream-Status: pending
>> =20
>>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>  ---
>> - apt-pkg/cacheset.h           |  4 ++--
>> - apt-pkg/deb/debsrcrecords.cc | 12 ++++++------
>> - apt-pkg/srcrecords.cc        |  4 ++--
>> - apt-pkg/srcrecords.h         |  4 ++--
>> - apt-pkg/vendorlist.cc        |  4 ++--
>> - 5 files changed, 14 insertions(+), 14 deletions(-)
>> + apt-pkg/contrib/macros.h     | 2 +-
>> + apt-pkg/deb/debsrcrecords.cc | 4 ++--
>> + apt-pkg/srcrecords.cc        | 4 ++--
>> + 3 files changed, 5 insertions(+), 5 deletions(-)
>> =20
>> -diff --git a/apt-pkg/cacheset.h b/apt-pkg/cacheset.h
>> -index b7229bc..8cc2917 100644
>> ---- a/apt-pkg/cacheset.h
>> -+++ b/apt-pkg/cacheset.h
>> -@@ -119,12 +119,12 @@ public:
>> - 		inline std::string FullName(bool const Pretty) const { return getP=
kg().FullName(Pretty); }
>> - 		inline std::string FullName() const { return getPkg().FullName(); =
}
>> - 		APT_DEPRECATED inline const char *Section() const {
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic push
>> - 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> +diff --git a/apt-pkg/contrib/macros.h b/apt-pkg/contrib/macros.h
>> +index 2727fd8..0ecae50 100644
>> +--- a/apt-pkg/contrib/macros.h
>> ++++ b/apt-pkg/contrib/macros.h
>> +@@ -136,7 +136,7 @@
>>   #endif
>> - 	   return getPkg().Section();
>> + #endif
>> +=20
>>  -#if __GNUC__ >=3D 4
>>  +#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic pop
>> - #endif
>> - 		}
>> + 	#define APT_IGNORE_DEPRECATED_PUSH \
>> + 		_Pragma("GCC diagnostic push") \
>> + 		_Pragma("GCC diagnostic ignored \"-Wdeprecated-declarations\"")
>>  diff --git a/apt-pkg/deb/debsrcrecords.cc b/apt-pkg/deb/debsrcrecords=
=2Ecc
>> -index 49a348d..4bc9dcf 100644
>> +index e8295de..40160b2 100644
>>  --- a/apt-pkg/deb/debsrcrecords.cc
>>  +++ b/apt-pkg/deb/debsrcrecords.cc
>> -@@ -126,13 +126,13 @@ bool debSrcRecordParser::Files(std::vector<pkgS=
rcRecords::File> &F)
>> +@@ -139,13 +139,13 @@ bool debSrcRecordParser::Files(std::vector<pkgS=
rcRecords::File> &F)
>>      for (std::vector<pkgSrcRecords::File2>::const_iterator f2 =3D F2.=
begin(); f2 !=3D F2.end(); ++f2)
>>      {
>>         pkgSrcRecords::File2 f;
>> @@ -55,46 +47,11 @@ index 49a348d..4bc9dcf 100644
>>   	#pragma GCC diagnostic pop
>>   #endif
>>         f.Path =3D f2->Path;
>> -@@ -190,14 +190,14 @@ bool debSrcRecordParser::Files2(std::vector<pkg=
SrcRecords::File2> &List)
>> - 	 // we have it already, store the new hash and be done
>> - 	 if (file !=3D List.end())
>> - 	 {
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	// set for compatibility only, so warn users not us
>> - 	#pragma GCC diagnostic push
>> - 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> - #endif
>> - 	    if (checksumField =3D=3D "Files")
>> - 	       file->MD5Hash =3D hash;
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic pop
>> - #endif
>> - 	    // an error here indicates that we have two different hashes fo=
r the same file
>> -@@ -212,7 +212,7 @@ bool debSrcRecordParser::Files2(std::vector<pkgSr=
cRecords::File2> &List)
>> - 	 F.FileSize =3D strtoull(size.c_str(), NULL, 10);
>> - 	 F.Hashes.push_back(hashString);
>> -=20
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	// set for compatibility only, so warn users not us
>> - 	#pragma GCC diagnostic push
>> - 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> -@@ -220,7 +220,7 @@ bool debSrcRecordParser::Files2(std::vector<pkgSr=
cRecords::File2> &List)
>> - 	 F.Size =3D F.FileSize;
>> - 	 if (checksumField =3D=3D "Files")
>> - 	    F.MD5Hash =3D hash;
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic pop
>> - #endif
>> -=20
>>  diff --git a/apt-pkg/srcrecords.cc b/apt-pkg/srcrecords.cc
>> -index 3175ee7..340e796 100644
>> +index 53d7e60..1484828 100644
>>  --- a/apt-pkg/srcrecords.cc
>>  +++ b/apt-pkg/srcrecords.cc
>> -@@ -160,7 +160,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pk=
gSrcRecords::File2> &F2)/*{{{*/
>> +@@ -157,7 +157,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pk=
gSrcRecords::File2> &F2)/*{{{*/
>>      for (std::vector<pkgSrcRecords::File>::const_iterator f =3D F.beg=
in(); f !=3D F.end(); ++f)
>>      {
>>         pkgSrcRecords::File2 f2;
>> @@ -103,7 +60,7 @@ index 3175ee7..340e796 100644
>>   	#pragma GCC diagnostic push
>>   	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>>   #endif
>> -@@ -168,7 +168,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pk=
gSrcRecords::File2> &F2)/*{{{*/
>> +@@ -165,7 +165,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pk=
gSrcRecords::File2> &F2)/*{{{*/
>>         f2.Size =3D f->Size;
>>         f2.Hashes.push_back(HashString("MD5Sum", f->MD5Hash));
>>         f2.FileSize =3D f->Size;
>> @@ -112,49 +69,6 @@ index 3175ee7..340e796 100644
>>   	#pragma GCC diagnostic pop
>>   #endif
>>         f2.Path =3D f->Path;
>> -diff --git a/apt-pkg/srcrecords.h b/apt-pkg/srcrecords.h
>> -index dde22bd..91f8061 100644
>> ---- a/apt-pkg/srcrecords.h
>> -+++ b/apt-pkg/srcrecords.h
>> -@@ -30,7 +30,7 @@ class pkgSrcRecords
>> - {
>> -    public:
>> -=20
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	// ensure that con- & de-structor don't trigger this warning
>> - 	#pragma GCC diagnostic push
>> - 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> -@@ -48,7 +48,7 @@ class pkgSrcRecords
>> -       unsigned long long FileSize;
>> -       HashStringList Hashes;
>> -    };
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic pop
>> - #endif
>> -=20
>> -diff --git a/apt-pkg/vendorlist.cc b/apt-pkg/vendorlist.cc
>> -index fb33ff1..ba1d3c3 100644
>> ---- a/apt-pkg/vendorlist.cc
>> -+++ b/apt-pkg/vendorlist.cc
>> -@@ -11,7 +11,7 @@
>> -=20
>> - #include <apti18n.h>
>> -=20
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic push
>> - 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> - #endif
>> -@@ -163,6 +163,6 @@ const Vendor* pkgVendorList::FindVendor(const std=
::vector<string> GPGVOutput)	/*
>> - }
>> - 									/*}}}*/
>> -=20
>> --#if __GNUC__ >=3D 4
>> -+#if __GNUC__ >=3D 4 + (6 >=3D __GNUC_MINOR__)
>> - 	#pragma GCC diagnostic pop
>> - #endif
>>  --=20
>> -1.9.1
>> +2.1.4
>> =20
>> diff --git a/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attrib=
ute-from-CFLAGS.patch b/meta/recipes-devtools/apt/apt/0001-remove-Wsugges=
t-attribute-from-CFLAGS.patch
>> index 7c42ff0..47870e3 100644
>> --- a/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-fro=
m-CFLAGS.patch
>> +++ b/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-fro=
m-CFLAGS.patch
>> @@ -1,4 +1,4 @@
>> -From 2bff7ee06a4f96e7d326991d61fb86f8aa651d48 Mon Sep 17 00:00:00 200=
1
>> +From 9fdf50d63df08ee65e7d8e62c35f19ac4841bca9 Mon Sep 17 00:00:00 200=
1
>>  From: Roy Li <rongqing.li@windriver.com>
>>  Date: Wed, 27 May 2015 09:48:45 +0800
>>  Subject: [PATCH] remove Wsuggest-attribute from CXXFLAGS
>> @@ -15,29 +15,29 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>   2 files changed, 2 deletions(-)
>> =20
>>  diff --git a/buildlib/environment.mak.in b/buildlib/environment.mak.i=
n
>> -index b0a8d9d..91ed011 100644
>> +index 9620722..c344d01 100644
>>  --- a/buildlib/environment.mak.in
>>  +++ b/buildlib/environment.mak.in
>> -@@ -11,7 +11,6 @@ CPPFLAGS+=3D @CPPFLAGS@ @DEFS@ -D_REENTRANT -D_FORT=
IFY_SOURCE=3D2
>> - CXX =3D @CXX@
>> - CXXFLAGS+=3D @CXXFLAGS@ -Wall -Wextra
>> +@@ -14,7 +14,6 @@ CXXFLAGS+=3D @CXXFLAGS@ -Wall -Wextra
>>   CXXFLAGS+=3D -Wcast-align -Wlogical-op -Wredundant-decls -Wmissing-d=
eclarations -Wunsafe-loop-optimizations
>> --CXXFLAGS+=3D -Wsuggest-attribute=3Dpure -Wsuggest-attribute=3Dconst =
-Wsuggest-attribute=3Dnoreturn
>> + CXXFLAGS+=3D -Wctor-dtor-privacy -Wdisabled-optimization -Winit-self=
 -Wmissing-include-dirs -Wnoexcept -Wsign-promo -Wundef
>> + # suggests methods which already have such an attribute
>> +-#CXXFLAGS+=3D -Wsuggest-attribute=3Dpure -Wsuggest-attribute=3Dconst=
 -Wsuggest-attribute=3Dnoreturn
>> + # sanitize options to be enabled for testing
>> + #CXXFLAGS+=3D -fsanitize=3Daddress -fsanitize=3Dundefined -fno-sanit=
ize=3Dvptr
>>   # a bit too pedantic to be run by default
>> - #CXXFLAGS+=3D -Wpedantic -Wno-long-long -Wno-vla -Wno-variadic-macro=
s
>> - NUM_PROCS =3D @NUM_PROCS@
>>  diff --git a/test/libapt/makefile b/test/libapt/makefile
>> -index 7f23ace..e805f13 100644
>> +index 5ff9cf6..c5b5190 100644
>>  --- a/test/libapt/makefile
>>  +++ b/test/libapt/makefile
>> -@@ -39,7 +39,6 @@ CXXFLAGS +=3D -pthread
>> +@@ -40,7 +40,6 @@ CXXFLAGS +=3D -pthread
>>   # disable some flags for gtest again
>>   CXXFLAGS+=3D -Wno-missing-declarations
>>   CXXFLAGS+=3D -Wno-missing-field-initializers
>>  -CXXFLAGS+=3D -Wno-suggest-attribute=3Dpure -Wno-suggest-attribute=3D=
const -Wno-suggest-attribute=3Dnoreturn
>> + CXXFLAGS+=3D -Wno-undef
>>  =20
>>   # All Google Test headers.  Usually you shouldn't change this defini=
tion.
>> - GTEST_HEADERS =3D /usr/include/gtest/*.h \
>>  --=20
>> -1.9.1
>> +2.1.4
>> =20
>> diff --git a/meta/recipes-devtools/apt/apt/disable-test.patch b/meta/r=
ecipes-devtools/apt/apt/disable-test.patch
>> index 676795d..0532671 100644
>> --- a/meta/recipes-devtools/apt/apt/disable-test.patch
>> +++ b/meta/recipes-devtools/apt/apt/disable-test.patch
>> @@ -1,35 +1,51 @@
>> -[PATCH] disable test
>> +From 67bc7948e0a721c75d636931abc105da5dcb0763 Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limo=
n@linux.intel.com>
>> +Date: Thu, 26 May 2016 15:32:11 -0500
>> +Subject: [PATCH] [PATCH] disable test
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> =20
>>  Upstream-Status: Inappropriate [configuration]
>> =20
>>  test needs gtest package, so not build the test dir
>> =20
>>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>  ---
>> - Makefile     | 7 +++----
>> - configure.ac | 6 ------
>> - 2 files changed, 3 insertions(+), 10 deletions(-)
>> + Makefile     | 9 +++------
>> + configure.ac | 7 -------
>> + 2 files changed, 3 insertions(+), 13 deletions(-)
>> =20
>>  diff --git a/Makefile b/Makefile
>> -index 5f5fb27..5070e96 100644
>> +index 7680f08..69527a5 100644
>>  --- a/Makefile
>>  +++ b/Makefile
>>  @@ -9,8 +9,8 @@ endif
>>   .PHONY: default
>>   default: startup all
>>  =20
>> --.PHONY: headers library clean veryclean all binary program doc test =
update-po
>> +-.PHONY: fast headers library clean veryclean all binary program doc =
test update-po
>>  -all headers library clean veryclean binary program doc manpages docb=
ook test update-po startup dirs:
>> -+.PHONY: headers library clean veryclean all binary program doc updat=
e-po
>> ++.PHONY: fast headers library clean veryclean all binary program doc =
update-po
>>  +all headers library clean veryclean binary program doc manpages docb=
ook update-po startup dirs:
>>   	$(MAKE) -C vendor $@
>>   	$(MAKE) -C apt-pkg $@
>>   	$(MAKE) -C apt-inst $@
>> -@@ -21,9 +21,8 @@ all headers library clean veryclean binary program =
doc manpages docbook test upd
>> +@@ -21,8 +21,6 @@ all headers library clean veryclean binary program =
doc manpages docbook test upd
>>   	$(MAKE) -C dselect $@
>> - #	$(MAKE) -C doc $@
>> + 	$(MAKE) -C doc $@
>>   	$(MAKE) -C po $@
>> --	$(MAKE) -C test $@
>> +-	# FIXME: -C test has issue swith parallel builds, investigate!
>> +-	-$(MAKE) -C test $@
>> +=20
>> + fast:
>> + 	$(MAKE) -C vendor all
>> +@@ -32,9 +30,8 @@ fast:
>> + 	$(MAKE) -C methods all
>> + 	$(MAKE) -C cmdline all
>> + 	$(MAKE) -C ftparchive all
>> +-	$(MAKE) -C test all
>>  =20
>>  -all headers library clean veryclean binary program doc manpages docb=
ook test update-po: startup dirs
>>  +all headers library clean veryclean binary program doc manpages docb=
ook update-po: startup dirs
>> @@ -37,22 +53,23 @@ index 5f5fb27..5070e96 100644
>>   dirs: startup
>>  =20
>>  diff --git a/configure.ac b/configure.ac
>> -index 5663aaf..b0f9564 100644
>> +index 1f05da5..e47f459 100644
>>  --- a/configure.ac
>>  +++ b/configure.ac
>> -@@ -89,12 +89,6 @@ AC_CHECK_LIB(curl, curl_easy_init,
>> +@@ -90,13 +90,6 @@ AC_CHECK_LIB(curl, curl_easy_init,
>>        AC_MSG_ERROR([failed: I need CURL due https support]),
>>   )
>>  =20
>>  -AC_LANG_PUSH([C++])
>>  -AC_CHECK_HEADER(gtest/gtest.h,,
>> --     AC_MSG_ERROR([failed: I need gtest to build tests]),
>> +-     AC_MSG_WARN([failed: I need gtest (packaged as libgtest-dev) fo=
r unit testing]),
>>  -)
>>  -AC_LANG_POP([C++])
>>  -
>> -=20
>> +-
>>   AC_SUBST(BDBLIB)
>>  =20
>> + HAVE_ZLIB=3Dno
>>  --=20
>> -1.9.1
>> +2.1.4
>> =20
>> diff --git a/meta/recipes-devtools/apt/apt_1.0.10.1.bb b/meta/recipes-=
devtools/apt/apt_1.0.10.1.bb
>> deleted file mode 100644
>> index 85c0d56..0000000
>> --- a/meta/recipes-devtools/apt/apt_1.0.10.1.bb
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -DEPENDS =3D "curl db zlib"
>> -RDEPENDS_${PN} =3D "dpkg bash debianutils"
>> -require apt.inc
>> -
>> -require apt-package.inc
>> -
>> -PACKAGECONFIG ??=3D "lzma"
>> -PACKAGECONFIG[lzma] =3D "ac_cv_lib_lzma_lzma_easy_encoder=3Dyes,ac_cv=
_lib_lzma_lzma_easy_encoder=3Dno,xz"
>> -PACKAGECONFIG[bz2] =3D "ac_cv_lib_bz2_BZ2_bzopen=3Dyes,ac_cv_lib_bz2_=
BZ2_bzopen=3Dno,bzip2"
>> -
>> -FILES_${PN} +=3D "${bindir}/apt-key"
>> -apt-manpages +=3D "doc/apt-key.8"
>> -
>> -do_install_append() {
>> -    #Write the correct apt-architecture to apt.conf
>> -    APT_CONF=3D${D}/etc/apt/apt.conf
>> -    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
>> -    oe_libinstall -so -C bin libapt-private ${D}${libdir}/
>> -}
>> diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-de=
vtools/apt/apt_1.2.12.bb
>> new file mode 100644
>> index 0000000..85c0d56
>> --- /dev/null
>> +++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
>> @@ -0,0 +1,19 @@
>> +DEPENDS =3D "curl db zlib"
>> +RDEPENDS_${PN} =3D "dpkg bash debianutils"
>> +require apt.inc
>> +
>> +require apt-package.inc
>> +
>> +PACKAGECONFIG ??=3D "lzma"
>> +PACKAGECONFIG[lzma] =3D "ac_cv_lib_lzma_lzma_easy_encoder=3Dyes,ac_cv=
_lib_lzma_lzma_easy_encoder=3Dno,xz"
>> +PACKAGECONFIG[bz2] =3D "ac_cv_lib_bz2_BZ2_bzopen=3Dyes,ac_cv_lib_bz2_=
BZ2_bzopen=3Dno,bzip2"
>> +
>> +FILES_${PN} +=3D "${bindir}/apt-key"
>> +apt-manpages +=3D "doc/apt-key.8"
>> +
>> +do_install_append() {
>> +    #Write the correct apt-architecture to apt.conf
>> +    APT_CONF=3D${D}/etc/apt/apt.conf
>> +    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
>> +    oe_libinstall -so -C bin libapt-private ${D}${libdir}/
>> +}
>> diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/reci=
pes-devtools/apt/files/no-curl.patch
>> index 30238fa..0838552 100644
>> --- a/meta/recipes-devtools/apt/files/no-curl.patch
>> +++ b/meta/recipes-devtools/apt/files/no-curl.patch
>> @@ -1,13 +1,23 @@
>>  Upstream-Status: Inappropriate [configuration]
>> +From 5d61ac822fd9a3871cd5089389c210606232ecdc Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limo=
n@linux.intel.com>
>> +Date: Thu, 26 May 2016 15:34:45 -0500
>> +Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> =20
>> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>  ---
>> - configure.in     |    6 ------
>> - methods/makefile |    7 -------
>> - 2 files changed, 13 deletions(-)
>> + configure.ac     | 7 -------
>> + methods/makefile | 7 -------
>> + 2 files changed, 14 deletions(-)
>> =20
>> +diff --git a/configure.ac b/configure.ac
>> +index e47f459..cd24264 100644
>>  --- a/configure.ac
>>  +++ b/configure.ac
>> -@@ -86,12 +86,6 @@ AC_CHECK_HEADER(db.h,
>> +@@ -83,13 +83,6 @@ AC_CHECK_HEADER(db.h,
>>  =20
>>   LIBS=3D"$saveLIBS"
>>  =20
>> @@ -17,9 +27,12 @@ Upstream-Status: Inappropriate [configuration]
>>  -        curl_ok=3Dno)],
>>  -     AC_MSG_ERROR([failed: I need CURL due https support]),
>>  -)
>> -=20
>> +-
>>   AC_SUBST(BDBLIB)
>>  =20
>> + HAVE_ZLIB=3Dno
>> +diff --git a/methods/makefile b/methods/makefile
>> +index 3274e92..255086b 100644
>>  --- a/methods/makefile
>>  +++ b/methods/makefile
>>  @@ -51,13 +51,6 @@ LIB_MAKES =3D apt-pkg/makefile
>> @@ -28,11 +41,14 @@ Upstream-Status: Inappropriate [configuration]
>>  =20
>>  -# The https method
>>  -PROGRAM=3Dhttps
>> --SLIBS =3D -lapt-pkg -lcurl $(INTLLIBS)
>> +-SLIBS =3D -lapt-pkg -lcurl $(INTLLIBS) -lresolv
>>  -LIB_MAKES =3D apt-pkg/makefile
>>  -SOURCE =3D https.cc server.cc
>>  -include $(PROGRAM_H)
>>  -
>>   # The ftp method
>>   PROGRAM=3Dftp
>> - SLIBS =3D -lapt-pkg $(SOCKETLIBS) $(INTLLIBS)
>> + SLIBS =3D -lapt-pkg $(SOCKETLIBS) $(INTLLIBS) -lresolv
>> +--=20
>> +2.1.4
>> +
>>


--EhDn5Qcg3f9LqTaJwUHG1Bi6p2S23sHqk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXpQiyAAoJEGJqcE9h3glgyggP/i5D96Q9uThBFbgV3+8T/Z3p
I2j06+CxE8EmcxqC8YpFT+3ML1IoqhBW3gzv8Uz1ek5bNaptHUix9+ZS81IPNc3l
jm451mh+MrW06DDNavwsIwil1brey800PXCG/Ik5HYLZ1Rk5PFK3VHCENrq9tfIJ
9rpMwHGrWieuI4u3Z9LEMg390lzfzxSLQb/9SAACua0cDzj/uMssuWgWrmnRP8GZ
nNxndCzGDMslqYUOlzgxGoWtIb9c8GrLgsQq839kkQnS7uCNCFJjPMj8ACeZ0Hc/
CvaftBNA/cr24kH+i/nTkDPghSgVPfQ7D/3yoWGBVlljD5abzOKqvVwCItSo2f0a
ay5T7OJgyxsOGUJTPObmd7yDVCBnZqvzYKAbvoexlcQLss8L0po5FuTossxP/RmY
uzFuFRCxtynbkmVzVct/6m5tHe2Uh4VkOaCFGFYe/eCe6+gv4Gujzu4AvkDklaL7
5l4mGk8SiGaKBSNJ2cFU5ZR9/sR8WiLq4m72RIJWP2rQ/V+02iLvj8ma+M6KjzTR
yuYbYrqIPTtZVmUvircZnG/vk6rK608mf6WUhE2HupCmlspUYXOF/+iikc65mrzZ
zahDGsFldH/tM2hjRZTmYctJDGDvFLbYNWZdLduSyHWwqiB2RUvN1i0dHKzbuihT
grzan2H5wqIBcBq/TnM3
=e+mS
-----END PGP SIGNATURE-----

--EhDn5Qcg3f9LqTaJwUHG1Bi6p2S23sHqk--
