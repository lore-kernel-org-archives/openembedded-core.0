Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D05A077349
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:38:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 25 Feb 2016 13:38:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; 
	d="asc'?scan'208";a="659368945"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 13:38:18 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
	<d796f5aefb56881a5d27585ff83474d4656c5581.1456165797.git.anibal.limon@linux.intel.com>
	<3087554.BNl70PJfo3@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56CF7448.9080701@linux.intel.com>
Date: Thu, 25 Feb 2016 15:38:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <3087554.BNl70PJfo3@peggleto-mobl.ger.corp.intel.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 4/4] oeqa/sdkext: Add sdk_update.SDKUpdateTest class.
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
X-List-Received-Date: Thu, 25 Feb 2016 21:38:20 -0000
X-Groupsio-MsgNum: 78724
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="KkBgdU37VotkuBTe0lKNeg7PTutIIrFKl"

--KkBgdU37VotkuBTe0lKNeg7PTutIIrFKl
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/24/2016 06:22 PM, Paul Eggleton wrote:
> Hi An=EDbal,
>=20
> On Mon, 22 Feb 2016 12:31:33 An=EDbal Lim=F3n wrote:
>> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>
>> The SDKUpdateTest class test devtool sdk-update mechanism inside
>> eSDK.
>>
>> The SDKUpdateTest class search for new sdk if not found uses
>> the main one then it publish the eSDK into known folder
>> inside work and it starts a web server for serve the eSDK.
>>
>> Finally it executes sdk-update over http, the local test is
>> commented due to bug [1].
>>
>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9043
>>
>> [YOCTO #9089]
>>
>> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>> ---
>>  meta/lib/oeqa/sdkext/sdk_update.py | 39
>> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 39 insertions(+=
)
>>  create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py
>>
>> diff --git a/meta/lib/oeqa/sdkext/sdk_update.py
>> b/meta/lib/oeqa/sdkext/sdk_update.py new file mode 100644
>> index 0000000..16f5b10
>> --- /dev/null
>> +++ b/meta/lib/oeqa/sdkext/sdk_update.py
>> @@ -0,0 +1,39 @@
>> +import os
>> +import shutil
>> +import subprocess
>> +
>> +from oeqa.oetest import oeSDKExtTest
>> +from oeqa.utils.httpserver import HTTPService
>> +
>> +class SdkUpdateTest(oeSDKExtTest):
>> +
>> +    @classmethod
>> +    def setUpClass(self):
>> +        self.publish_dir =3D os.path.join(self.tc.sdktestdir, 'esdk_p=
ublish')
>> +        if os.path.exists(self.publish_dir):
>> +            shutil.rmtree(self.publish_dir)
>> +        os.mkdir(self.publish_dir)
>> +
>> +        tcname_new =3D self.tc.d.expand(
>> +            "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}-new.sh")
>> +        if not os.path.exists(tcname_new):
>> +            tcname_new =3D self.tc.tcname
>> +
>> +        cmd =3D 'oe-publish-sdk %s %s' % (tcname_new, self.publish_di=
r)
>> +        subprocess.check_output(cmd, shell=3DTrue)
>> +
>> +        self.http_service =3D HTTPService(self.publish_dir)
>> +        self.http_service.start()
>> +
>> +        self.http_url =3D "http://127.0.0.1:%d" % self.http_service.p=
ort
>> +
>> +    def test_sdk_update_http(self):
>> +        output =3D self._run("devtool sdk-update \"%s\"" % self.http_=
url)
>> +
>> +#    def test_sdk_update_local(self):
>> +#        output =3D self._run("devtool sdk-update \"%s\"" % self.publ=
ish_dir)
>> +
>> +    @classmethod
>> +    def tearDownClass(self):
>> +        self.http_service.stop()
>> +        shutil.rmtree(self.publish_dir)
>=20
> You're testing invocation of the sdk-update command, but nothing much b=
eyond=20
> that - the update isn't going to be doing anything here since nothing w=
ill=20
> have changed. However since this would involve modifying the metadata t=
hough I=20
> guess that may have to be done as an oe-selftest test.

Yes Paul is only testing the exeution of sdk update command but if you
read the commit comment (may be i'm not too clear) the test search for a
new sdk with -new suffix the AB or selftest  could easily modify the
meta data and then generate new eSDK.

	alimon

>=20
> Cheers,
> Paul
>=20


--KkBgdU37VotkuBTe0lKNeg7PTutIIrFKl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWz3RLAAoJEGJqcE9h3glgmSkP/ipexe+/Tysy9P6NwLjzRIds
oiUTbaN1adjRlFMxaDxnNQajIcKPlLzNeDPCe4/Q19rwLNq2sPY3SXTNllFbKkFT
Sa/YOGWkhbPPjd7itrxF4elX7Cc/O1CBfe8n2xgA/00ZF29nIEbt1AKo4xQbGrbu
aC0YACPsIGUObvNLy0Jyr8teJYzVyC5cwBa+kYpfDVBaM11tGYuJ+S2bsWHJpV0E
Ts8fsko13v8YMc8W31gWMNKNcrxguH7zvtbgHly1/O4FjftAzus01pdAB1Me/uHN
1PB6uB6GoEDdHpuGp3zfahDpIx7XdTTvGUMjD1HFle8Nb/2ED4kSDwRoW5A/N9MX
rP0O72kr/N2HcIdxKZw5UOgrePeVfyqdzvU2fCSImaiuC8C2NxyU7bSH8o9gUn9S
6m7R41sim4HsSDHUn+q46rODvEl+T5+oPsITOv+8H5AI5tGI3/TGkaR/19imeFMM
LKcaeV25r1we62qLOFQaSkT4DXZXCBtsGgavC5X0or8aeONOkJs8s52fTwZuGNL7
VNxTok0sq9OTOOfBXKZNSfoyE87ko+8PJm+mYUBPOeWTmFra69eCWIOaNn+/qP7l
0AOVNIRSWO1WoI9184idWDs8YjFbLIEry2VLRHZ2YUFu7P0JVE75PnuKdkNPA+ga
RkLe7HT22ctbfwPpF5u7
=LIMe
-----END PGP SIGNATURE-----

--KkBgdU37VotkuBTe0lKNeg7PTutIIrFKl--
