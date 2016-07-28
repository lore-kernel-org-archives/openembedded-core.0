Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91FDF6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:33:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2016 07:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; 
	d="asc'?scan'208";a="740986249"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2016 07:33:50 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
	<1469659242-12350-6-git-send-email-anibal.limon@linux.intel.com>
	<f10cdb53-0628-e44a-2c42-c0b488171a3a@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <579A17F7.7040602@linux.intel.com>
Date: Thu, 28 Jul 2016 09:34:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <f10cdb53-0628-e44a-2c42-c0b488171a3a@linux.intel.com>
Subject: Re: [PATCH 5/5] oeqa/utils/commands.py: Command class improve validations/decoding in output
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
X-List-Received-Date: Thu, 28 Jul 2016 14:33:50 -0000
X-Groupsio-MsgNum: 85070
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ThsX4GFINrpSspg1S4MscmB2e2MGjk5Dm"

--ThsX4GFINrpSspg1S4MscmB2e2MGjk5Dm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 07/27/2016 10:18 PM, Leonardo Sandoval wrote:
> Hi Anibal,
>=20
>=20
> El 07/27/2016 a las 05:40 PM, An=C3=ADbal Lim=C3=B3n escribi=C3=B3:
>> When run a command sometimes the output isn't provided so validate
> I wonder if this problem is related to a timeout, so at some point this=

> is reached and no output is shown.

This could be one scenario but the output needs to be validated in order
to don't crash trying to use a None var.

	alimon

>> before trying to encode to utf-8, also some output like BIOS/EFI
>> contains characters that can't be codified into utf-8 for this reason
>> set errors=3D'replace'.
>>
>> [YOCTO #10019]
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> ---
>>   meta/lib/oeqa/utils/commands.py | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/utils/commands.py
>> b/meta/lib/oeqa/utils/commands.py
>> index 4f79d15..a8e184d 100644
>> --- a/meta/lib/oeqa/utils/commands.py
>> +++ b/meta/lib/oeqa/utils/commands.py
>> @@ -78,7 +78,10 @@ class Command(object):
>>                   self.process.kill()
>>                   self.thread.join()
>>   -        self.output =3D self.output.decode("utf-8").rstrip()
>> +        if not self.output:
>> +            self.output =3D ""
>> +        else:
>> +            self.output =3D self.output.decode("utf-8",
>> errors=3D'replace').rstrip()
>>           self.status =3D self.process.poll()
>>             self.log.debug("Command '%s' returned %d as exit code." %
>> (self.cmd, self.status))
>=20


--ThsX4GFINrpSspg1S4MscmB2e2MGjk5Dm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXmhf5AAoJEGJqcE9h3glg1qgQAIZRPzj7SLFDcx661oTGoqkU
NNJRIEO9D8tpICiVsn70kc/26+Wkq0sPWTmS4c2nr7fHmUK+zp3JQ1APzf9n+rV6
3zHtSDQkJwBnyC4yf87GgZAKqS1hstZZH+C2LeWYLvk82KfDiPcr0ZPZTnz+7yu1
UgPsJFHP3lkLmXhxRkRIEOF2UpHjlv8fUNXgIeIKTvJutyMxxmU/1jtIVjvMug1j
T9bM8OUUUrxIxVqXphy07J9OM+xqFa2UD6ZmVA8OM24/8iQWlEbEQxuNtREZuJxl
+wALusThQ0BwL44QFFecgjaqdyZDKVNaevLz/S8l9WIiRx9U0eFTMcD5B3/qnMU3
qW5NTjUcKi49NRVWC6ENxeCmx5JIa9dJx0QQWltB3IkojZGZjvw3pLEfysz7mBJH
CmQ8Bcq+urtPKKSg2XRL0QwQd9MoCpTRqJ6tdtCm2izF49G9gJsJHX32Zfj8sWCW
bmXzGIy+t0SrDvR202jdhfltYUjIcMElihW/H18S8jSo7ve8lbN+iFMYOzlTIBTS
4+lqaVS8ZoDcNZTKvRi+bc5gnfWWvl3wWsIPioImiF3AUWo+aocH7QOY25ouuwmc
xk5utgUeSEznEfG+/av35PwLpbZ2/84L4ZpeM5XBAzyOQzX2l5H1UltMxvOKNrVD
h57bTCssYWR7EM90FbeY
=qz/r
-----END PGP SIGNATURE-----

--ThsX4GFINrpSspg1S4MscmB2e2MGjk5Dm--
