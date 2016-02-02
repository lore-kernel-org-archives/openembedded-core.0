Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4536B77303
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:12:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2016 14:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="739421772"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2016 14:12:52 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<388d73eeea1fedcf2630488658dc8aa684a24c33.1454424743.git.anibal.limon@linux.intel.com>
	<3666142.Q8On7yAzEZ@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B12A57.5050402@linux.intel.com>
Date: Tue, 2 Feb 2016 16:14:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <3666142.Q8On7yAzEZ@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 19/20] oeqa/sdkext: Add devtool basic tests for eSDK.
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
X-List-Received-Date: Tue, 02 Feb 2016 22:12:52 -0000
X-Groupsio-MsgNum: 77387
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="eHA7eGtkUOXRMrArkMMWbdGTU2b6GXLCr"

--eHA7eGtkUOXRMrArkMMWbdGTU2b6GXLCr
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/02/2016 04:03 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 09:14:22 An=EDbal Lim=F3n wrote:
>> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>
>> Add simple myapp application is a C app that prints hello world
>> and exit.
>>
>> Add devtool test for that this app to the workspace, build and
>> reset it.
>>
>> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>> ---
>>  meta/lib/oeqa/sdkext/devtool.py           | 25 ++++++++++++++++++++++=
+++
>>  meta/lib/oeqa/sdkext/files/myapp/Makefile | 10 ++++++++++
>>  meta/lib/oeqa/sdkext/files/myapp/myapp.c  |  9 +++++++++
>>  3 files changed, 44 insertions(+)
>>  create mode 100644 meta/lib/oeqa/sdkext/devtool.py
>>  create mode 100644 meta/lib/oeqa/sdkext/files/myapp/Makefile
>>  create mode 100644 meta/lib/oeqa/sdkext/files/myapp/myapp.c
>>
>> diff --git a/meta/lib/oeqa/sdkext/devtool.py
>> b/meta/lib/oeqa/sdkext/devtool.py new file mode 100644
>> index 0000000..0262ed3
>> --- /dev/null
>> +++ b/meta/lib/oeqa/sdkext/devtool.py
>> @@ -0,0 +1,25 @@
>> +import shutil
>> +
>> +from oeqa.oetest import oeSDKExtTest
>> +from oeqa.utils.decorators import *
>> +
>> +class DevtoolTest(oeSDKExtTest):
>> +
>> +    @classmethod
>> +    def setUpClass(self):
>> +        self.myapp_src =3D os.path.join(self.tc.sdkextfilesdir, "myap=
p")
>> +        self.myapp_dst =3D os.path.join(self.tc.sdktestdir, "myapp")
>> +        shutil.copytree(self.myapp_src, self.myapp_dst)
>> +
>> +    def test_devtool_add_reset(self):
>> +        self._run('devtool add myapp %s' % self.myapp_dst)
>> +        self._run('devtool reset myapp')
>> +
>> +    def test_devtool_build(self):
>> +        self._run('devtool add myapp %s' % self.myapp_dst)
>> +        self._run('devtool build myapp')
>> +        self._run('devtool reset myapp')
>> +
>> +    @classmethod
>> +    def tearDownClass(self):
>> +        shutil.rmtree(self.myapp_dst)
>> diff --git a/meta/lib/oeqa/sdkext/files/myapp/Makefile
>> b/meta/lib/oeqa/sdkext/files/myapp/Makefile new file mode 100644
>> index 0000000..abd91be
>> --- /dev/null
>> +++ b/meta/lib/oeqa/sdkext/files/myapp/Makefile
>> @@ -0,0 +1,10 @@
>> +all: myapp
>> +
>> +myapp: myapp.o
>> +	$(CC) $(LDFLAGS) $< -o $@
>> +
>> +myapp.o: myapp.c
>> +	$(CC) $(CFLAGS) -c $< -o $@
>> +
>> +clean:
>> +	rm -rf myapp.o myapp
>> diff --git a/meta/lib/oeqa/sdkext/files/myapp/myapp.c
>> b/meta/lib/oeqa/sdkext/files/myapp/myapp.c new file mode 100644
>> index 0000000..f0b63f0
>> --- /dev/null
>> +++ b/meta/lib/oeqa/sdkext/files/myapp/myapp.c
>> @@ -0,0 +1,9 @@
>> +#include <stdio.h>
>> +
>> +int
>> +main(int argc, char *argv[])
>> +{
>> +	printf("Hello world\n");
>> +
>> +	return 0;
>> +}
>=20
> I guess we'll probably want to extend this test so it also looks at the=
=20
> binaries produced by the build to see if they're reasonable, but we can=
 do=20
> that later.
>=20
> One thing though - could you add a check to see that the 'devtool' comm=
and=20
> we're executing is definitely from the SDK and not the outer build envi=
ronment=20
> (or elsewhere)? Presumably you could just do "which devtool" and check =
the=20
> output.

Sure good idea... i'll add which devtool and search for path inside the
eSDK folder.

	alimon

>=20
> Cheers,
> Paul
>=20


--eHA7eGtkUOXRMrArkMMWbdGTU2b6GXLCr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsSpaAAoJEGJqcE9h3glgjW4QAIZazwZ3PWjj5zC1Fds/SUbQ
N0xJuJ8rdcfQ0CuwVba/lgPWZW8T7LSYjtfiRyJsrEMBkp1QAYl4JrLd6KTpG9tW
Ej/d1F4knG6SrVr9C5JISAJDPJxUE8kMfBuJFNAruFl7rYzN7YOKJGQgzh3KYu4b
98EzCzORrsx6AW7N7wI57rCbKmnDI7JIL5VBXbahOBmtIL4p5GCDGBiywp+VX9lc
abZNiiAvubLpsegMidWAT6dDCiUeJB/wFDr2t72fBttyIwQQXGgbXO6LnMQcBj3h
+RKb7xOFWxjm0hPKabGYaz8CF3zHnaEL0cr5iTUTJXWaL8VVG/2/6f2svtqQWDBI
w8l29OXrlBsAu3XWb201pGij53FvhCG8Me3T7pFM86XBaGL97IGjjQECt+C7oUIJ
aZIkJhpg2sqaoeCFJzkP9CrJ2S3HAPIzFwmabfTsMhvcBTbIWH5+yPgsYfb/WDOo
ZIzYbgFFP2D7HEijjc2wu5ycv5U5qgeK7+kKtsQGQ5AFBK6GOjt+w31aKbWnF+YW
hMBgq01WfQiRMfGNkVTi3YMbI6qfUg/4PVls6YknWqh7c2oPHAbF0UNum3YpMSWq
rhJ2F475BAUeorUWtd/sTkdLmbj17QHWWPXr0nRb9EWO3dl7CS7ubt1OVJyAZ5vX
at5Ti02QIZPVlOQ2ujEz
=mW03
-----END PGP SIGNATURE-----

--eHA7eGtkUOXRMrArkMMWbdGTU2b6GXLCr--
