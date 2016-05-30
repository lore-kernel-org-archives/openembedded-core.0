Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5958577144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:16:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 May 2016 14:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,392,1459839600"; 
	d="asc'?scan'208";a="817930186"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.164])
	([10.219.5.164])
	by orsmga003.jf.intel.com with ESMTP; 30 May 2016 14:16:32 -0700
To: Renato Caldas <rm.santos.caldas@gmail.com>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<574C9E8C.1070503@linux.intel.com>
	<CA+21M5A1CeV6ojWjLsLNcf3XgC_nUgwJtjV5B5NCF-0_Aj_4Qw@mail.gmail.com>
	<574CAB3D.9060706@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <574CADDB.1010108@linux.intel.com>
Date: Mon, 30 May 2016 16:17:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <574CAB3D.9060706@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 21:16:35 -0000
X-Groupsio-MsgNum: 82855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Euajx0i3vI1eXMBULUGifxHCT91mnd31d"

--Euajx0i3vI1eXMBULUGifxHCT91mnd31d
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 05/30/2016 04:06 PM, An=EDbal Lim=F3n wrote:
>=20
>=20
> On 05/30/2016 03:39 PM, Renato Caldas wrote:
>> Hi An=EDbal,
>>
>> Sorry but I'm still a bit unfamiliar with the yocto workflow, should I=

>> resubmit exact same patch with the [krogoth] prefix added, or should I=

>> change the commit message in any way? It applies cleanly to both
>> master and krogoth.
>=20
> You need to send two patches one with [krogoth] prefix and another
> without it for master.
>=20
> Also is a good practice to cc the maintainer of the release [krogoth]
> release, since the 2.1 release was a little time ago i don't know who i=
s
> the current maintainer sorry.

Reviewing this wiki [1] the maintainer for krogoth is Armin Kuster
<akuster@mvista.com>.

[1] https://wiki.yoctoproject.org/wiki/Releases

>=20
> Cheers,
> 	alimon
>=20
>=20
>>
>> Cheers,
>>   Renato
>>
>> 2016-05-30 21:11 GMT+01:00 An=EDbal Lim=F3n <anibal.limon@linux.intel.=
com>:
>>> Hi Renato,
>>>
>>> I tested the patch and works very well.
>>> Could you sent another patch with [krogoth] prefix to be backported?
>>>
>>> Thanks a lot,
>>>         alimon
>>>
>>>
>>> On 05/28/2016 06:53 AM, Renato Caldas wrote:
>>>> On some distributions tar requires the FILE argument to be the last,=
 and
>>>> the existing order was causing the subsequent --exclude options to b=
e dropped.
>>>>
>>>> Fixes [YOCTO #9673].
>>>>
>>>> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
>>> Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>>>> ---
>>>>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipe=
s-devtools/perl/perl-ptest.inc
>>>> index 948ea7c..66c5355 100644
>>>> --- a/meta/recipes-devtools/perl/perl-ptest.inc
>>>> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
>>>> @@ -7,8 +7,8 @@ do_install_ptest () {
>>>>       mkdir -p ${D}${PTEST_PATH}
>>>>       sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>>>>       sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
>>>> -     tar -cf - * --exclude \*.o --exclude libperl.so --exclude Make=
file --exclude makefile --exclude hostperl \
>>>> -             --exclude miniperl --exclude generate_uudmap --exclude=
 patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>>> +     tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefi=
le --exclude makefile --exclude hostperl \
>>>> +             --exclude miniperl --exclude generate_uudmap --exclude=
 patches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>>>
>>>>       sed -i -e "s,${D},,g" \
>>>>              -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
>>>>
>>>
>=20
>=20
>=20


--Euajx0i3vI1eXMBULUGifxHCT91mnd31d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXTK3dAAoJEGJqcE9h3glgf0sP/18/lndNRqsWUTaMTtcb8qDb
nxfcFO0I+GUMb2SeSIIqvbb9pZjdziBNPsgC3jRbln91mhxVF3aDDTHLg91+gqOF
WzkQBV4qXfESpjH2gFDfkGsDIB0f7fCrw9jfLI4nxrlxFMy8xSfNwwKLnDVCwvcd
yB+47gceaviF28TE+mJP2GlblwvUabY/G0it8R97JrLy1d5RKmOnIbFQhDJrkWsP
8Lh946zntaqann2mV9g6BDrd3ZdgNaqDPC+fKddWm0Sg3vMA7wLMfJx5ITetJFIv
bOMcMAMvJlV84Z1v8zC8el1L4l/aVmH6F7b1xdSu2LuPw/PkilMIijD1nFYIbbuX
vNtWL7STxzyg2v5n9FzBqYuAj4Aee2qFOoBOOOOKBtIs2f+JvpP9j9rIqC/JGUUr
UePLCob6ZC0YcZzNmxXfCQAZZIb5e9piz73Plavv688LnlOLVlhri+pZlxYILaE2
ZTaGsw2wxgSdRSbxUwKqTLEtnorAdZDyJSN392fCwe2NbHATEAS/AfcY5x/Vil1U
3GLALeq4ApzGby/yopAq1tnTeH/lVhxMQ053pLd9JVHRT+72PnjjVkRmfrWL9eku
dPFlZQHYM1psNpybxaabCACm0yz3zKp9UO61fy8RUBCF8dZqF97+O+0tBnZk0Rt1
QotZmqAjH6RItIC8003K
=N6BW
-----END PGP SIGNATURE-----

--Euajx0i3vI1eXMBULUGifxHCT91mnd31d--
