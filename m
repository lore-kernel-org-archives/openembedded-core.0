Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A7F836FFC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:05:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 30 May 2016 14:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,392,1459839600"; 
	d="asc'?scan'208";a="987643753"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.164])
	([10.219.5.164])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2016 14:05:22 -0700
To: Renato Caldas <rm.santos.caldas@gmail.com>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<574C9E8C.1070503@linux.intel.com>
	<CA+21M5A1CeV6ojWjLsLNcf3XgC_nUgwJtjV5B5NCF-0_Aj_4Qw@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <574CAB3D.9060706@linux.intel.com>
Date: Mon, 30 May 2016 16:06:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CA+21M5A1CeV6ojWjLsLNcf3XgC_nUgwJtjV5B5NCF-0_Aj_4Qw@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 May 2016 21:05:25 -0000
X-Groupsio-MsgNum: 82854
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="k5bHLoiEd0GJHGEucXgCH2EVT3eml4GLJ"

--k5bHLoiEd0GJHGEucXgCH2EVT3eml4GLJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/30/2016 03:39 PM, Renato Caldas wrote:
> Hi An=C3=ADbal,
>=20
> Sorry but I'm still a bit unfamiliar with the yocto workflow, should I
> resubmit exact same patch with the [krogoth] prefix added, or should I
> change the commit message in any way? It applies cleanly to both
> master and krogoth.

You need to send two patches one with [krogoth] prefix and another
without it for master.

Also is a good practice to cc the maintainer of the release [krogoth]
release, since the 2.1 release was a little time ago i don't know who is
the current maintainer sorry.

Cheers,
	alimon


>=20
> Cheers,
>   Renato
>=20
> 2016-05-30 21:11 GMT+01:00 An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.i=
ntel.com>:
>> Hi Renato,
>>
>> I tested the patch and works very well.
>> Could you sent another patch with [krogoth] prefix to be backported?
>>
>> Thanks a lot,
>>         alimon
>>
>>
>> On 05/28/2016 06:53 AM, Renato Caldas wrote:
>>> On some distributions tar requires the FILE argument to be the last, =
and
>>> the existing order was causing the subsequent --exclude options to be=
 dropped.
>>>
>>> Fixes [YOCTO #9673].
>>>
>>> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
>> Acked-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>> ---
>>>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes=
-devtools/perl/perl-ptest.inc
>>> index 948ea7c..66c5355 100644
>>> --- a/meta/recipes-devtools/perl/perl-ptest.inc
>>> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
>>> @@ -7,8 +7,8 @@ do_install_ptest () {
>>>       mkdir -p ${D}${PTEST_PATH}
>>>       sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>>>       sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
>>> -     tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makef=
ile --exclude makefile --exclude hostperl \
>>> -             --exclude miniperl --exclude generate_uudmap --exclude =
patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>> +     tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefil=
e --exclude makefile --exclude hostperl \
>>> +             --exclude miniperl --exclude generate_uudmap --exclude =
patches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>>
>>>       sed -i -e "s,${D},,g" \
>>>              -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
>>>
>>


--k5bHLoiEd0GJHGEucXgCH2EVT3eml4GLJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXTKs/AAoJEGJqcE9h3glg1iAP/06br8rINSYoIRJOtJ+vuyDQ
Q1KHEiz9/a9jNj6o75encRI4IweBxa2kBgGH8DGHSMjCWjfaF8oaPAjO5TLmdtF6
dPqACYSNgEP+LJpqSb2J2opLkbHep5NSl2oXGmRKOb7U/w8SONiHqeXJNXaB+BaR
FXm53WyGeS0XscqPjxNdJICYPRdL8bqnVF/CcGB2wxNg43Zi9ApvBetugdWk0X+l
siSck2yDzblNILa9OOhnbAIKwvX4OVUeHfRRcweHXElOXmuSBIdfO8a+f3SC7nBH
Y9YWnpVfTtiq404z5/K8/8TcyuazpK71K1lIgnrpWjbbDeciJohAGdhN9Pbmg6Wx
LM6IQZ1eXMhJT8ctLdCBAkwWZwhU4BPe02wvk+nn2ZEht6QTy3AA5Xzq/G7sTbeG
aoILsbp+8jVPDt1HL5uD1NY2VeCpuiDcHStdMzhhc53s/vpdahcZ+4pIbyl5mqUu
tfiHctCkw+fg9oNG03Jf6kmB2d5UsfBOaDbYZhdkR5hCTcKhJevRwOHoc7byHK3I
oD/5PhJVcpjNgIy9XDeVRo3hzbAeMXHBZFQnV5+EMFh/g2Ft3Q+u5d9nqNwTtfpL
8miBvL3RV5AfHNiSh5NWhmK46IQpDHMM7AEeKuK2gTt1UtTQ1ASx9c97EBnkt3A5
MNvXAAeMyA5F77JWPs9k
=tdrO
-----END PGP SIGNATURE-----

--k5bHLoiEd0GJHGEucXgCH2EVT3eml4GLJ--
