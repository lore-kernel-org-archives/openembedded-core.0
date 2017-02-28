Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EE66072F3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 20:29:41 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 12:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,221,1484035200"; 
	d="asc'?scan'208";a="70647419"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.120])
	([10.219.128.120])
	by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2017 12:29:42 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
	<1488312568.7785.73.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <58B5DE85.3010502@linux.intel.com>
Date: Tue, 28 Feb 2017 14:33:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1488312568.7785.73.camel@intel.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Tue, 28 Feb 2017 20:29:42 -0000
X-Groupsio-MsgNum: 94087
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="DBpQehI5cP5xSVLGc1CB3jRqlubqcPnUm"

--DBpQehI5cP5xSVLGc1CB3jRqlubqcPnUm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/28/2017 02:09 PM, Patrick Ohly wrote:
> On Mon, 2017-02-20 at 15:12 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>> common.test_signatures: Test executed in BSP and DISTRO layers to revi=
ew
>>     doesn't comes with recipes that changes the signatures.
>=20
> I have a question about the goal for this test: is it meant to detect
> layers which incorrectly change the signatures of allarch recipes or
> recipes which share the same tune flags with other machines?

The requirement is DISTRO and BSP layers aren't allowed to automatically
change the MACHINE or DISTRO variable that causes the signatures to chang=
e.

>=20
> Let's take MACHINE=3Dedison as an example.
>=20
> Modifying allarch creates a conflict with basically all other machines
> in a distro. Example for something not allowed:
> VOLATILE_BINDS_append_pn-volatile-binds_edison =3D " /var/volatile/foo =
/var/foo \n"
>=20
> This can be detected by comparing against OE-core, but only when testin=
g
> with MACHINE=3Dedison.
>=20
> More difficult to detect is modifying recipes with the same tune flags,=

> which is the majority of the recipes. MACHINE=3Dedison and
> MACHINE=3Dintel-core2-32 both compile for the same target architecture,=
 so
> something like this is incorrect:
> do_install_append_pn-base-files_edison () {
>     echo "Built for Edison" >>${D}${sysconfdir}/motd
> }
>=20
> This can only be detected when testing with both MACHINE=3Dedison and
> MACHINE=3Dintel-core2-32 - at least I think MACHINE=3Dqemux86 uses diff=
erent
> tune flags (haven't checked).
>=20
> My point is, the test probably needs to be extended to run with a set o=
f
> machines, and that set of machines must be broad enough to cover a
> variety of common tune flags.

It is expected to change recipe signatures when the machine change, this
leaves me other question. what signatures are expected to change when
set a different MACHINE?

	Anibal

>=20
> The corresponding selftest, test_sstate_sametune_samesigs in
> sstatetests.py, has the same limitation of its scope, i.e. doesn't
> actually test with real machine definitions.
>=20


--DBpQehI5cP5xSVLGc1CB3jRqlubqcPnUm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYtd6HAAoJEGJqcE9h3glgaT8P/1b0xqgIVrjmlEnx2ZR9Pgh1
tcooZk39gaGeq1Ri2M6dmwmdUCgPl3m/RgvJ1KlqJbdgzH2uKxhy0m1Imi8Uexi4
ZZlAW69l/bOL5a+TznC7xGH3TI5Jb/4rhDj/+NiHP7aRt7jyzwzSOg6TicZHa1pf
e0sQyQhwmFqJygf+dbcjh1uxC9gJlvO8rHMmVPHcYxeF59dpCqyaVFXlyx6ERGeB
pqzIRkj357Oflr41Q68O0+GvgFNd0/jkhS8gYGVgesLz8Znu+jcSH2Jnqn19HqyK
nvIrOcekb2l538tyVfG992GqLNtiNHJh7QSAAMLT7HjNAegbUaMRyF6Sdk8OBQME
lnqF7pZbVfQ8bxzljXlzTYxfgbs1sIWcdIny7P+cgISoLiLX495JW6EW/h8L6/Ta
pT/ncLeL2SdgP22iqSX4oxvkPeR1Xn7d5DO4LsrCmDYkWpkkM/Ib+IRq6sbdaFtF
IE5Hq2jsCWLrdQdU849is0lV2FOrjXdyQFgHW8ESalfeqGupY6TL/JzId57eRvks
xlWaFd7npK0nP0U6Jq3asEeiQPbgCoPe48iOhDXDbK28b2qRVj0QiN4LpHK/UH0N
SvSAwhkz26t2FfT7FAJodus/NbfTpVOBVJXDWkeUMa/IC3FOkx1FpnXJGwlv2PP1
4OUjHJLaiJfHkh0lD0WG
=Dg1o
-----END PGP SIGNATURE-----

--DBpQehI5cP5xSVLGc1CB3jRqlubqcPnUm--
