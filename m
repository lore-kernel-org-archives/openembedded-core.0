Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 604AB771CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:35:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Feb 2016 08:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; 
	d="asc'?scan'208";a="891846304"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2016 08:35:13 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<99d32b8b8e7d0422dfa5f89a30e86668d88ef77f.1456153260.git.anibal.limon@linux.intel.com>
	<56CB2F1D.4050605@linux.intel.com> <56CB32C1.9040308@linux.intel.com>
	<56CB35E8.6060301@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56CB3949.5030804@linux.intel.com>
Date: Mon, 22 Feb 2016 10:37:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56CB35E8.6060301@linux.intel.com>
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 2/4] classes/testsdk: Move the removal of bitbake PATH to eSDK context only
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
X-List-Received-Date: Mon, 22 Feb 2016 16:35:18 -0000
X-Groupsio-MsgNum: 78483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="uf392J11VfJqtCA0H9VMDLIShw52Dmt0g"

--uf392J11VfJqtCA0H9VMDLIShw52Dmt0g
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/22/2016 10:23 AM, Randy Witt wrote:
> On 02/22/2016 08:09 AM, An=C3=ADbal Lim=C3=B3n wrote:
>>
>>
>> On 02/22/2016 09:54 AM, Randy Witt wrote:
>>> On 02/22/2016 07:03 AM, An=C3=ADbal Lim=C3=B3n wrote:
>>>> From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>>>>
>>>> The removal of bitbake and scripts PATH is only needed by eSDK tests=

>>>> so move to eSDK context only.
>>>>
>>>> This also it's a support for eSDK update test because it needs to
>>>> execute oe-publish-sdk from scripts.
>>>>
>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>>>> ---
>>>>    meta/classes/testsdk.bbclass |  9 ++++-----
>>>>    meta/lib/oeqa/oetest.py      | 22 +++++++++++++++++++++-
>>>>    2 files changed, 25 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/meta/classes/testsdk.bbclass
>>>> b/meta/classes/testsdk.bbclass
>>>> index 7e245e9..01d37c4 100644
>>>> --- a/meta/classes/testsdk.bbclass
>>>> +++ b/meta/classes/testsdk.bbclass
>>>> @@ -96,11 +96,10 @@ def testsdkext_main(d):
>>>>        # extensible sdk use network
>>>>        export_proxies(d)
>>>>
>>>> -    # extensible sdk shows a warning if found bitbake in the path
>>>> -    # because can cause problems so clean it
>>>> -    paths_to_avoid =3D ['bitbake/bin', 'poky/scripts',
>>>> -                       d.getVar('STAGING_DIR', True),
>>>> -                       d.getVar('BASE_WORKDIR', True)]
>>>> +    # extensible sdk can be contaminated if native programs are
>>>> +    # in PATH, i.e. use perl-native instead of eSDK one.
>>>> +    paths_to_avoid =3D [d.getVar('STAGING_DIR', True),
>>>> +                      d.getVar('BASE_WORKDIR', True)]
>>>>        avoid_paths_in_environ(paths_to_avoid)
>>>>
>>>>        pn =3D d.getVar("PN", True)
>>>> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
>>>> index 3e2ea0f..cd1e7e0 100644
>>>> --- a/meta/lib/oeqa/oetest.py
>>>> +++ b/meta/lib/oeqa/oetest.py
>>>> @@ -21,6 +21,7 @@ import logging
>>>>    import oeqa.runtime
>>>>    import oeqa.sdkext
>>>>    from oeqa.utils.decorators import LogResults, gettag, getResults
>>>> +from oeqa.utils import avoid_paths_in_environ
>>>>
>>>>    logger =3D logging.getLogger("BitBake")
>>>>
>>>> @@ -128,7 +129,26 @@ class oeSDKTest(oeTest):
>>>>            return subprocess.check_output(". %s > /dev/null; %s;" %
>>>> (self.tc.sdkenv, cmd), shell=3DTrue)
>>>>
>>>>    class oeSDKExtTest(oeSDKTest):
>>>> -    pass
>>>> +    def _run(self, cmd):
>>>> +        output =3D None
>>>> +
>>>> +        paths =3D os.environ['PATH']
>>>> +
>>>> +        # extensible sdk shows a warning if found bitbake in the pa=
th
>>>> +        # because can cause contamination, i.e. use devtool from
>>>> +        # poky/scripts instead of eSDK one.
>>>> +        paths_to_avoid =3D ['bitbake/bin', 'poky/scripts']
>>>> +        avoid_paths_in_environ(paths_to_avoid)
>>>> +
>>>> +        try:
>>>> +            output =3D subprocess.check_output(". %s > /dev/null;
>>>> %s;" % \
>>>> +                (self.tc.sdkenv, cmd), shell=3DTrue)
>>>
>>> Just pass env to the check_output call, then you won't have to worry
>>> about resetting the parent process' env back to the original value.
>>
>> Could be but then we need the code for generate the env line so for
>> practically the result is the same.
>=20
> Modify avoid_paths_in_environ() to instead return the environment rathe=
r
> than modify it as a side effect. Then the code reads more easily and
> prevents future bugs where someone uses avoid_paths_in_environ, but
> forgets to reset the os.environ.

I agree with you to modify avoid_paths_in_environ for return the new
PATH variable is better than only modify it internally but for
simplicity i will maintain the os.environ['PATH'] set/restore instead of
generate the environment line.


>=20
>>
>>>
>>>> +        except:
>>>> +            os.environ['PATH'] =3D paths
>>>> +            raise
>>>> +
>>>> +        os.environ['PATH'] =3D paths
>>>> +        return output
>>>>
>>>>    def getmodule(pos=3D2):
>>>>        # stack returns a list of tuples containg frame information
>>>>
>>>
>>
>=20


--uf392J11VfJqtCA0H9VMDLIShw52Dmt0g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWyzlLAAoJEGJqcE9h3glgxCkP/AxthnXPSLf92JKnV9kYJZ4L
oaYLp9zFskd24mgZQJ10vzGxrZDHBMr1MTBhw2AOdQ0dl77FGyr035U8aYiUtiB5
NMjitLYsEpQKXbXPxdeHFcg8UR8GWakt6KU2VeB4TQ0BX4pa/2mLoAHj3IJ60Bu2
/TkAIJUT00/i0zWhZ2b0krUzklNJ6ArWZxXk1yUKUgY9QULO9L8zBXJiFD3wwPT+
i8ODTKw2WGPQTdBDO5iotZuWvIHSpLVEM5oRL8Ddtor6+sR1xfLuTUwts41K0xWL
53Zcs6eDxm9AaRyRWV/ArvabZ9VbArsbTPtYoDfvI/05A20i8F2Vsn8T00zJqGBy
YCkfI+QBzL0RNN5BjXNvwjeaukbtGXmiMgKQLy8zh7tEHOPLiaVXND+77Vk7z4Ux
c+pQ4NLEZsgClr54vFQ4EeVXbqmgyKgSY6R79obHsSLAVQ/dUTORRHPWi7j+SdvH
MZdalLv4kjf1x6UbtetrE3Wfa5QwymesCKQP4m1Jj/cM8YZfsu+lHOZeEyw8GJM3
hUaeoTBMeWD/wd+XcSEtLnYLU9kOn1X95qhDbQukm0hsqRjTolHbjICx+xT+E/up
lB05xKvEI4jvCFYP+MewsALSZaQ+azl8VvmIm4kaE1UmJawDl+2Hgac6KYyem0Gj
6FxQWi0GmIydTxqFry8Y
=3zBx
-----END PGP SIGNATURE-----

--uf392J11VfJqtCA0H9VMDLIShw52Dmt0g--
