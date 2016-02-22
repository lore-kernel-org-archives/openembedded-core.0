Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E30FC771BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 17:45:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Feb 2016 09:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; 
	d="asc'?scan'208";a="891906438"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2016 09:45:15 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<99d32b8b8e7d0422dfa5f89a30e86668d88ef77f.1456153260.git.anibal.limon@linux.intel.com>
	<56CB2F1D.4050605@linux.intel.com> <56CB32C1.9040308@linux.intel.com>
	<56CB35E8.6060301@linux.intel.com> <56CB3949.5030804@linux.intel.com>
	<CAJTo0LZ+onCXJXw74VJSJkaOGdYi=qwBeXCnBtz0jvkpdrybJQ@mail.gmail.com>
	<56CB3FBE.50906@linux.intel.com> <56CB44EA.5000303@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56CB49B2.5040306@linux.intel.com>
Date: Mon, 22 Feb 2016 11:47:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56CB44EA.5000303@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 22 Feb 2016 17:45:26 -0000
X-Groupsio-MsgNum: 78490
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="eRqwqt4M7d2p3nxmQn4modJFGX9KgTpjN"

--eRqwqt4M7d2p3nxmQn4modJFGX9KgTpjN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/22/2016 11:27 AM, Randy Witt wrote:
> On 02/22/2016 09:05 AM, An=C3=ADbal Lim=C3=B3n wrote:
>>
>>
>> On 02/22/2016 10:48 AM, Burton, Ross wrote:
>>> On 22 February 2016 at 16:37, An=C3=ADbal Lim=C3=B3n
>>> <anibal.limon@linux.intel.com>
>>> wrote:
>>>
>>>> I agree with you to modify avoid_paths_in_environ for return the new=

>>>> PATH variable is better than only modify it internally but for
>>>> simplicity i will maintain the os.environ['PATH'] set/restore
>>>> instead of
>>>> generate the environment line.
>>>>
>>>
>>> Totally agree with Randy here for what it's worth.  The
>>> environment-munging
>>> code in avoid_paths... should return the strings instead of manipulat=
ing
>>> the current environment so the caller has the choice whether to
>>> modify the
>>> current environment or pass a new environment to subprocess.  And in
>>> general I'd say that passing modified environments to subprocess is a=

>>> cleaner solution as it means that there's no way cleanup can fail to
>>> happen.  Whilst that's just a try/except now, the code could get
>>> copied and
>>> extended and end up with codepaths that don't hit the right cleanup. =
 By
>>> having an explicit environment passed in, this isn't possible.
>>
>> Agree, now modified at,
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dali=
mon/esdk_update_v2&id=3D3143bf09130c52cd71e3f2f9795208e17152005d
>>
>=20
> If you either convert path to a dict or have avoid_paths_in_environ()
> return a dict you can do:
>=20
> +            output =3D subprocess.check_output(". %s > /dev/null; %s;"=
 % \
> +                (self.tc.sdkenv, cmd), env=3Dpath, shell=3DTrue)
>=20
> It's not quite obvious in the docs that you can pass that in, they refe=
r
> you to the Popen docs.


I know that you could pass env in kwargs but since it's using shell=3DTru=
e
is easy to set PATH inline also it causes a little overhead for copy the
os.environ.

But if you want the another way that's ok, see [1].

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dalimon=
/esdk_update_v2&id=3Dab84d325c5cbb751d7b18e861964b757d9682e0f

	alimon

>=20
>> Cheers,
>>     alimon
>>
>>>
>>> Ross
>>>
>>
>=20


--eRqwqt4M7d2p3nxmQn4modJFGX9KgTpjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWy0m1AAoJEGJqcE9h3glgUf0P/0PMvdy4JLMNFKHd0SirdtzT
OUeyDzmTPbUkt6O9O+tguLLUEUJ8yshpG4ttZyNO2oIikj2LEiMC7gCdZ1AiUu4V
zHoIXrMSzKWGYEyKvK0odzyaZoiOkMvruXPWYo67q0k4YyPOSPACAY/BLKYhfHNz
K6QeFRN0ydw8ueQIoQIE6rBoOC4o441ztfi2Hq9o1GkpEfu+OfEzvJScirS7l6GC
lwvRRQO8CTjFaBPNi6CQuGCtoSLd4lET6oTxksmJbDWSEnD8uZEvPO3xYvX02JTR
IVeyimZsqtNy/qiJfcCkj8gk1rH6NOtIZGuFEr7Xiy7+asPAN0bzicnMf9JZu3OO
mtb4wly+cgdMlLoqkFyPmxN1XuVWJJaMoSgtE3PtkW/smoj8u6Mg2lSvx8/YRs8x
mJaZm1mMbVwG83B7yCdoWgiahYq64ondGq4B988DWigBBaF5wuWQTCI1jwfXtPI6
SFT0WnxXssiO4xhoJ9LxlZEMmqTy7mOJQJMDoHlithaRSRmP6Fx2k4ZxCcImGhyc
0DEJ/JlNmO7vZz2O46hbTgw6QYmHQX4/I088k4tQH26nkqSiKhrpe+dl/BB2Y5Fm
yspx3wiH+VrsBrL7A32SSO4C5MA9dsE5WQdE4PdqCp9GVxlQ4KbKLyjZH6Q6tXcS
QQIrjeMRfvWG3WM0oVGh
=IJBE
-----END PGP SIGNATURE-----

--eRqwqt4M7d2p3nxmQn4modJFGX9KgTpjN--
