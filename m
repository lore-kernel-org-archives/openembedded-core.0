Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6085C771B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 17:07:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 22 Feb 2016 09:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; 
	d="asc'?scan'208";a="52564744"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2016 09:07:45 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<64384d8bd09f15c666f133893c3beb96e66af51d.1456153260.git.anibal.limon@linux.intel.com>
	<56CB34E8.6060203@linux.intel.com> <56CB36C3.2080609@linux.intel.com>
	<56CB3918.7060503@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56CB40E8.1000709@linux.intel.com>
Date: Mon, 22 Feb 2016 11:10:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56CB3918.7060503@linux.intel.com>
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
X-List-Received-Date: Mon, 22 Feb 2016 17:07:45 -0000
X-Groupsio-MsgNum: 78488
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="DVA8fpfnTJnX5QTLMETrg5iBxitjAf10f"

--DVA8fpfnTJnX5QTLMETrg5iBxitjAf10f
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/22/2016 10:36 AM, Randy Witt wrote:
> On 02/22/2016 08:26 AM, An=C3=ADbal Lim=C3=B3n wrote:
>>
>>
>> On 02/22/2016 10:18 AM, Randy Witt wrote:
>>> On 02/22/2016 07:03 AM, An=C3=ADbal Lim=C3=B3n wrote:
>>>> From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>>>>
>>>> The SDKUpdateTest class test devtool sdk-update mechanism inside
>>>> eSDK.
>>>>
>>>> The SDKUpdateTest class search for new sdk if not found uses
>>>> the main one then it publish the eSDK into known folder
>>>> inside work and it starts a web server for serve the eSDK.
>>>>
>>>> Finally it executes sdk-update over http, the local test is
>>>> commented due to bug [1].
>>>>
>>>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9043
>>>>
>>>> [YOCTO #9089]
>>>>
>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>>>> ---
>>>>    meta/lib/oeqa/sdkext/sdk_update.py | 39
>>>> ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 39 insertions(+)
>>>>    create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py
>>>>
>>>> diff --git a/meta/lib/oeqa/sdkext/sdk_update.py
>>>> b/meta/lib/oeqa/sdkext/sdk_update.py
>>>> new file mode 100644
>>>> index 0000000..16f5b10
>>>> --- /dev/null
>>>> +++ b/meta/lib/oeqa/sdkext/sdk_update.py
>>>> @@ -0,0 +1,39 @@
>>>> +import os
>>>> +import shutil
>>>> +import subprocess
>>>> +
>>>> +from oeqa.oetest import oeSDKExtTest
>>>> +from oeqa.utils.httpserver import HTTPService
>>>> +
>>>> +class SdkUpdateTest(oeSDKExtTest):
>>>> +
>>>> +    @classmethod
>>>> +    def setUpClass(self):
>>>> +        self.publish_dir =3D os.path.join(self.tc.sdktestdir,
>>>> 'esdk_publish')
>>>> +        if os.path.exists(self.publish_dir):
>>>> +            shutil.rmtree(self.publish_dir)
>>>> +        os.mkdir(self.publish_dir)
>>>> +
>>>> +        tcname_new =3D self.tc.d.expand(
>>>> +            "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}-new.sh")
>>>> +        if not os.path.exists(tcname_new):
>>>> +            tcname_new =3D self.tc.tcname
>>>> +
>>>> +        cmd =3D 'oe-publish-sdk %s %s' % (tcname_new, self.publish_=
dir)
>>>> +        subprocess.check_output(cmd, shell=3DTrue)
>>>> +
>>>> +        self.http_service =3D HTTPService(self.publish_dir)
>>>> +        self.http_service.start()
>>>
>>> I think Paul and I briefly mentioned it, but SimpleHTTPServer fails a=
s
>>> an sstate mirror if enough fetchers run. We think it was because of a=

>>> limit on the number of simultaneous connections. So I would expect th=
is
>>> to fail for instance if all packages were updated.
>>
>> I tested running an update and didn't fail this implementation of
>> oeqa.utils open another process with multiprocessing for serve http on=
ly.
>=20
> My suspicion is because nothing actually updated. And even if something=

> updated, unless you hit the max connection limit when pulling from
> sstate_mirror it would be fine.

Not it was updated the first time didn't display Already up to date that
was the second time also i saw the connections from sdk-update to local
web server.

>=20
>>>
>>> But really we shouldn't care too much about the sstate updating part,=

>>> and more about the layer updating etc. Ideally this test would check =
to
>>> make sure the local sdk now matches the remote.
>>
>> I could add a test for the output that i saw displays "Already updated=
"
>> or what you mean about match?
>=20
> devtool sdk-update will check the remote conf/sdk-conf-manifest to see
> if any configuration changed. So for instance the creator of the sdk
> could add new configuration variables, or even items to bblayers.conf.
>=20
> If the sdk-conf-manifest is changed, the updater should pull down the
> new layer by pulling(cloning if that fails) layers/.git on the remote
> and moving the layers to the appropriate local location. It should also=

> update the local configuration to match what is on the remote.
>=20
> So if you get "Already up-to-date" nothing changed and nothing was
> updated. To test the updating, we need to make sure the configuration
> actually changes, and potentially even add another layer, then update,
> and then make sure the local sdk matches what we think it should based
> on the remote sdk we published.

Up comment,

That's the reason for search new esdk (suffix -new) in the code because
that is another task (AB task) to generate the new eSDK, this test
satisfy the requeriment for install the eSDK launch the webserver and
launch sdk-update tool over it.


>=20
>>
>>>
>>>> +        self.http_url =3D "http://127.0.0.1:%d" % self.http_service=
=2Eport
>>>> +
>>>> +    def test_sdk_update_http(self):
>>>> +        output =3D self._run("devtool sdk-update \"%s\"" %
>>>> self.http_url)
>>>> +
>>>> +#    def test_sdk_update_local(self):
>>>> +#        output =3D self._run("devtool sdk-update \"%s\"" %
>>>> self.publish_dir)
>>>> +
>>>> +    @classmethod
>>>> +    def tearDownClass(self):
>>>> +        self.http_service.stop()
>>>> +        shutil.rmtree(self.publish_dir)
>>>>
>>>
>>
>=20


--DVA8fpfnTJnX5QTLMETrg5iBxitjAf10f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWy0DrAAoJEGJqcE9h3glgeb4P/jUCPIGcoIS7HSQ4rNKXL+Tp
F7OoP8cB9RFNRT52KLnT3g3DnivVPViavZC5NUYvXdjdn54oEyrak0t2pH+5RM0l
EioDgybbQAW8I93EqRrvSmquulKrM04jqcvZ/7hYqIY5vHMO3hhBenE+g0LiLF3M
OS52MJMsSMOc6Ds1eYJC5S8hhCA+QSIaUYO464LdvDTSu7TvgAXcjfJcPyDhL56C
0wSr5VfGWz/JfyWM+iL8ED6BZ7sTm5RNuGNKLt55mF5PMTOaT0evFolsO9mtxlho
kK/acI/RrZb5Ph7ORLRUyMuMXpgNWBicTPJrCL+jVKYTyEFpptbwGoW3HmgwG5Db
LGFTrWN8EdbyKyUf5H5XY5Iw0NJFb5ig90FFVhXdGYZ9G0iHHsJh5NEE7fwd/Ltb
eCyzrcXruAb3ideg+S8XAIXtjlk9RYIR78cc7pundLbAflyRYBpjYyVWkFEh1zKR
/WyFYz/+RszndRSNiDRryBUfIdyEMiY6cCggF/9+75HddU13wMcDFb5MAo5AmMJQ
yjPu7JVUkTSMdRfpA/Byqo5ZkUW7I+U0StglvJqZ+1vG0IyFUJKbRl9DNlyy9rLc
UgbkU71rKlBKyPeQxJJ5lgmXYmeRb/m7+DB2qjAz+zSTnRFuN8JJR/CZKrMDYaio
BVyZJuJwUwp31aRfxrs2
=x7Qe
-----END PGP SIGNATURE-----

--DVA8fpfnTJnX5QTLMETrg5iBxitjAf10f--
