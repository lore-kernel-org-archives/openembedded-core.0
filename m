Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 019B678754
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:52:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 09:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="20873937"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2018 09:52:34 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.116]) by
	ORSMSX102.amr.corp.intel.com ([169.254.3.86]) with mapi id
	14.03.0319.002; Wed, 28 Feb 2018 09:48:16 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "John, Maxin" <maxin.john@intel.com>
Thread-Topic: [OE-core] [PATCH] dbus-test_1.12.2: various fixes
Thread-Index: AQHTsAhKN9TD+Z9kD0Ku/XIqg9EQk6O6bhiA//+pSwQ=
Date: Wed, 28 Feb 2018 17:48:16 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C6649B3@ORSMSX112.amr.corp.intel.com>
References: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>,
	<20180228145424.GA23739@mbabyjoh-desk.ger.corp.intel.com>
In-Reply-To: <20180228145424.GA23739@mbabyjoh-desk.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.42]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus-test_1.12.2: various fixes
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
X-List-Received-Date: Wed, 28 Feb 2018 17:52:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, that is the root cause. I did file a bug a while ago:=0A=
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12273=0A=
=0A=
It is a race, I put the libraries in a hidden file, hoping they would not b=
e found.=0A=
I also considered linking the tests statically (which would eliminate the n=
eed for the shared libraries), =0A=
but the size was getting too big...=0A=
=0A=
Juro=0A=
________________________________________=0A=
From: John, Maxin=0A=
Sent: Wednesday, February 28, 2018 6:54 AM=0A=
To: Bystricky, Juro=0A=
Cc: openembedded-core@lists.openembedded.org; jurobystricky@hotmail.com=0A=
Subject: Re: [OE-core] [PATCH] dbus-test_1.12.2: various fixes=0A=
=0A=
Hi,=0A=
=0A=
On Tue, Feb 27, 2018 at 12:19:26PM -0800, Juro Bystricky wrote:=0A=
> The result of running dbus-test-ptest was a series of=0A=
> various segfaults, interpreted as FAILs. This was a direct consequence=0A=
> of the test suite loading the installed shared library libdbus-1.so, not =
the=0A=
> one built along the test suite.=0A=
>=0A=
> While we normally want to test against the installed libraries, we cannot=
=0A=
> do this in this case as the test suite expects a library that is configur=
ed/compiled=0A=
> differently from the installed one. We could configure the installed libr=
ary=0A=
> identically as the test suite expects, (and there should be no issues), h=
owever=0A=
> this is not desirable for performance reasons.=0A=
>=0A=
> Hence we need to use the library built along with the test suite.=0A=
> Of course, running the test suite against its own library does not=0A=
> test the installed library, however they are both built from the same=0A=
> sources so that can give us some kind of indication.=0A=
>=0A=
> The following changes were made:=0A=
>=0A=
> 1. Configure the test library as close as possible to the installed one,=
=0A=
>    with some additional configuration options that are needed for testing=
.=0A=
>    (Use dbus_1.12.2.bb recipe as a template)=0A=
> 2. Include the shared libraries in the package, use LD_LIBRARY_PATH durin=
g=0A=
>    testing to load them instead of the installed ones.=0A=
> 3. Add a few more tests. (There are still some additional tests built tha=
t=0A=
>    are not used, but they would have to be special-cased).=0A=
> 4. When evaluating the test results, differentiate between "FAIL" and "SK=
IP"=0A=
>=0A=
> [YOCTO #10841]=0A=
> [YOCTO #12277]=0A=
>=0A=
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>=0A=
> ---=0A=
>  meta/recipes-core/dbus/dbus-test_1.12.2.bb | 30 ++++++++++++++++++++++++=
++----=0A=
>  meta/recipes-core/dbus/dbus/run-ptest      | 20 +++++++++++++++++---=0A=
>  2 files changed, 43 insertions(+), 7 deletions(-)=0A=
=0A=
Probably due to this change, dbus ptest related sanity tests fails here:=0A=
=0A=
https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/813/steps/=
Running%20Sanity%20Tests/logs/stdio=0A=
=0A=
=0A=
NOTE:  ... ok=0A=
| NOTE: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
| NOTE: FAIL: test_ptestrunner (ptest.PtestRunnerTest)=0A=
| NOTE: -------------------------------------------------------------------=
---=0A=
| NOTE: Traceback (most recent call last):=0A=
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-de=
b/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f=0A=
|     return func(*args, **kwargs)=0A=
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-de=
b/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f=0A=
|     return func(*args, **kwargs)=0A=
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-de=
b/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f=0A=
|     return func(*args, **kwargs)=0A=
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-de=
b/build/meta/lib/oeqa/runtime/cases/ptest.py", line 93, in test_ptestrunner=
=0A=
|     self.assertFalse(failed_tests, msg =3D "Failed ptests: %s" %(str(fail=
ed_tests)))=0A=
| AssertionError: {'dbus-test': [' test/test-bus', ' test/test-dbus-daemon'=
, ' test/test-names']} is not false : Failed ptests: {'dbus-test': [' test/=
test-bus', ' test/test-dbus-daemon', ' test/test-names']}=0A=
=0A=
=0A=
Best Regards,=0A=
Maxin=0A=

