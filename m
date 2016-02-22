Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD16771DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:24:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Feb 2016 08:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; 
	d="asc'?scan'208";a="908698832"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2016 08:24:27 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<64384d8bd09f15c666f133893c3beb96e66af51d.1456153260.git.anibal.limon@linux.intel.com>
	<56CB34E8.6060203@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56CB36C3.2080609@linux.intel.com>
Date: Mon, 22 Feb 2016 10:26:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56CB34E8.6060203@linux.intel.com>
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 4/4] oeqa/sdkext: Add sdk_update.SDKUpdateTest class.
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
X-List-Received-Date: Mon, 22 Feb 2016 16:24:28 -0000
X-Groupsio-MsgNum: 78481
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="02uebu7HSfJGRcBiapsEDdtn7FvnAPKkO"

--02uebu7HSfJGRcBiapsEDdtn7FvnAPKkO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/22/2016 10:18 AM, Randy Witt wrote:
> On 02/22/2016 07:03 AM, An=C3=ADbal Lim=C3=B3n wrote:
>> From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
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
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>> ---
>>   meta/lib/oeqa/sdkext/sdk_update.py | 39
>> ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>   create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py
>>
>> diff --git a/meta/lib/oeqa/sdkext/sdk_update.py
>> b/meta/lib/oeqa/sdkext/sdk_update.py
>> new file mode 100644
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
>> +        self.publish_dir =3D os.path.join(self.tc.sdktestdir,
>> 'esdk_publish')
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
>=20
> I think Paul and I briefly mentioned it, but SimpleHTTPServer fails as
> an sstate mirror if enough fetchers run. We think it was because of a
> limit on the number of simultaneous connections. So I would expect this=

> to fail for instance if all packages were updated.

I tested running an update and didn't fail this implementation of
oeqa.utils open another process with multiprocessing for serve http only.=


>=20
> But really we shouldn't care too much about the sstate updating part,
> and more about the layer updating etc. Ideally this test would check to=

> make sure the local sdk now matches the remote.

I could add a test for the output that i saw displays "Already updated"
or what you mean about match?


>=20
>> +        self.http_url =3D "http://127.0.0.1:%d" % self.http_service.p=
ort
>> +
>> +    def test_sdk_update_http(self):
>> +        output =3D self._run("devtool sdk-update \"%s\"" % self.http_=
url)
>> +
>> +#    def test_sdk_update_local(self):
>> +#        output =3D self._run("devtool sdk-update \"%s\"" %
>> self.publish_dir)
>> +
>> +    @classmethod
>> +    def tearDownClass(self):
>> +        self.http_service.stop()
>> +        shutil.rmtree(self.publish_dir)
>>
>=20


--02uebu7HSfJGRcBiapsEDdtn7FvnAPKkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWyzbFAAoJEGJqcE9h3glgYW8P/3k/EPyHASGxl5XKOFb+K+uE
tEcNuSHfKJuvbQMJ9neZvSl3bcYJ6lGI5NJqAMjV/H9fg9N/ILNcHIWRp0WMDm/l
gq3V0M/50QzR+cUL5ki6Qhkptttokkc1OBffkKbGgZMgme4r9ul1WlNCKeBe1wm9
Uh9eQL3b3ywWGImYsfcsq01XEtkWVIuE9CrwDjucFsPCEvx0/dR5HZlpIc1CWmVQ
pagjEEwYDlJpuyS+UIC1YJGvLXt5diloFo4r5JiO7uoVxGhYk2CfMhE6biJDSdI3
2kNbROa6PGPYKAh+PIBtPYy7eczVaTlql+uTpFaQcnN9aDHNN5d63Ba8jgLYFM67
gMQxOhMaExLIMKAbjtleadqRnX3s62/GWq4sLXhnQQyGBMphL6yr0Js06I5w8YmI
OVK2pR0tfIKNck8qwpbbo+RkCncpBRm1T6/wmFy8P23HMpURMvfwzndTU+TzOPha
THJpXtHtsVB4yyOV5I5ULxqwJEXmV7ZE32vgp8TQ3jrIqhoh2tjovSJ7BE0CBBPG
VpMPp95KvhH0Ts4a2ziclgOYqVTIHoYt56pbOyH+wFnAck+ulzScEie8tBCx/Bci
pNB6eZYZQFq/GYULR0kkP6JjdkekYSAjWh8GE2KX7G0h24tJ2/aZbdXxQSAveoNZ
a3k/4Emfyi7dHhZUsvkF
=lF0t
-----END PGP SIGNATURE-----

--02uebu7HSfJGRcBiapsEDdtn7FvnAPKkO--
