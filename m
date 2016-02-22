Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92605771C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:02:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 22 Feb 2016 10:02:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; 
	d="asc'?scan'208";a="921393225"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2016 10:02:14 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<99d32b8b8e7d0422dfa5f89a30e86668d88ef77f.1456153260.git.anibal.limon@linux.intel.com>
	<56CB2F1D.4050605@linux.intel.com> <56CB32C1.9040308@linux.intel.com>
	<56CB35E8.6060301@linux.intel.com> <56CB3949.5030804@linux.intel.com>
	<CAJTo0LZ+onCXJXw74VJSJkaOGdYi=qwBeXCnBtz0jvkpdrybJQ@mail.gmail.com>
	<56CB3FBE.50906@linux.intel.com> <56CB44EA.5000303@linux.intel.com>
	<56CB49B2.5040306@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56CB4DAC.4070002@linux.intel.com>
Date: Mon, 22 Feb 2016 12:04:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56CB49B2.5040306@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
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
X-List-Received-Date: Mon, 22 Feb 2016 18:02:13 -0000
X-Groupsio-MsgNum: 78491
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="S7v1E0RhrfxSol5DDfSWtINMu7XU2T2hq"

--S7v1E0RhrfxSol5DDfSWtINMu7XU2T2hq
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/22/2016 11:47 AM, An=EDbal Lim=F3n wrote:
>=20
>=20
> On 02/22/2016 11:27 AM, Randy Witt wrote:
>> On 02/22/2016 09:05 AM, An=EDbal Lim=F3n wrote:
>>>
>>>
>>> On 02/22/2016 10:48 AM, Burton, Ross wrote:
>>>> On 22 February 2016 at 16:37, An=EDbal Lim=F3n
>>>> <anibal.limon@linux.intel.com>
>>>> wrote:
>>>>
>>>>> I agree with you to modify avoid_paths_in_environ for return the ne=
w
>>>>> PATH variable is better than only modify it internally but for
>>>>> simplicity i will maintain the os.environ['PATH'] set/restore
>>>>> instead of
>>>>> generate the environment line.
>>>>>
>>>>
>>>> Totally agree with Randy here for what it's worth.  The
>>>> environment-munging
>>>> code in avoid_paths... should return the strings instead of manipula=
ting
>>>> the current environment so the caller has the choice whether to
>>>> modify the
>>>> current environment or pass a new environment to subprocess.  And in=

>>>> general I'd say that passing modified environments to subprocess is =
a
>>>> cleaner solution as it means that there's no way cleanup can fail to=

>>>> happen.  Whilst that's just a try/except now, the code could get
>>>> copied and
>>>> extended and end up with codepaths that don't hit the right cleanup.=
  By
>>>> having an explicit environment passed in, this isn't possible.
>>>
>>> Agree, now modified at,
>>>
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dal=
imon/esdk_update_v2&id=3D3143bf09130c52cd71e3f2f9795208e17152005d
>>>
>>
>> If you either convert path to a dict or have avoid_paths_in_environ()
>> return a dict you can do:
>>
>> +            output =3D subprocess.check_output(". %s > /dev/null; %s;=
" % \
>> +                (self.tc.sdkenv, cmd), env=3Dpath, shell=3DTrue)
>>
>> It's not quite obvious in the docs that you can pass that in, they ref=
er
>> you to the Popen docs.
>=20
>=20
> I know that you could pass env in kwargs but since it's using shell=3DT=
rue
> is easy to set PATH inline also it causes a little overhead for copy th=
e
> os.environ.
>=20
> But if you want the another way that's ok, see [1].
>=20
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dalim=
on/esdk_update_v2&id=3Dab84d325c5cbb751d7b18e861964b757d9682e0f

Bad rev this is the one that works [1].

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dalimon=
/esdk_update_v2&id=3D228e8e506f946a1245798b0d0e818f63aca221ce
>=20
> 	alimon
>=20
>>
>>> Cheers,
>>>     alimon
>>>
>>>>
>>>> Ross
>>>>
>>>
>>
>=20
>=20
>=20


--S7v1E0RhrfxSol5DDfSWtINMu7XU2T2hq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWy02vAAoJEGJqcE9h3glg7WMP/jzceHijceEQIG8OtN10I2q1
EzqSrEdpwqq0R7h4T2KcIFGO+ZlpAc8teit4vkM2c3+JGRPV81qQdnHJulMbc3rX
KdseKDrDiFPIomMWoudKwGQ/bUEUSGKrmGF+U9Uc5DACkWuXJDmU64amSlhL1Lqk
7ZkHZKeG8bqkkPCrjkS6WVKunmeXVGfjHWfnAGU+TnwOm3hBmRbPpF9F8wo4eIHm
+RBNOyH8b1IYAuYlTudKnVC2YAJCgOoHWSL+PeMbpEISwjnPIwT5VEgQpOOe9DAf
mc634i3h8pXyF5Tqj7qQerwNL5iqyEuv6Sp7+UVhQr3bEpOSCqe4MJCWzEEjhURW
3n+LlmaqX964iJM2pVzZvPSoN1d2UEoc38w/cFGM22zbQfQy5mNoG36RnDz+YQKn
RspwTtnKqpvarT07skAqb4hVYrBA1OI7Lu7rn179+Ql9NsLxIDYMCXIdYLitocIY
af6rk+B5BSCAfm3lQDbCAFQKVcqPDTrJR5NtTOJBHPUFQKN1JKdzhsUf6jLS6h93
EhTtAkwR5UvI8Ku6eUs7pA+O2po5Kq6VqnTqQh8P0ZGGDKdkfz9jMH1Bgm2dM3Mw
c3+eViNJzR+1E1wqLYIR2yV0UpkXdb/6Kx723oRoO4rNO3mba0klY40/t/XBgNzo
c8RfUKmVC4UFPGO11d9q
=Xfnw
-----END PGP SIGNATURE-----

--S7v1E0RhrfxSol5DDfSWtINMu7XU2T2hq--
