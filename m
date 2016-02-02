Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A1487772BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:11:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 14:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="739421078"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2016 14:11:16 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<4491582.7184pyYJcq@peggleto-mobl.ger.corp.intel.com>
	<56B12812.70900@linux.intel.com>
	<1685931.lfZTPyxPBX@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B129F8.9000402@linux.intel.com>
Date: Tue, 2 Feb 2016 16:13:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1685931.lfZTPyxPBX@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 18/20] classes/populate_sdk_ext: Add SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST
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
X-List-Received-Date: Tue, 02 Feb 2016 22:11:19 -0000
X-Groupsio-MsgNum: 77382
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="blmK01S4Kj90QntwtgjQ4Od2IxDAN9K7b"

--blmK01S4Kj90QntwtgjQ4Od2IxDAN9K7b
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/02/2016 04:06 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 16:05:06 An=EDbal Lim=F3n wrote:
>> On 02/02/2016 03:52 PM, Paul Eggleton wrote:
>>> On Tue, 02 Feb 2016 09:14:21 An=EDbal Lim=F3n wrote:
>>>> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>>>
>>>> Extensible SDK needs to point to the correct manifest so add
>>>> SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST variables.
>>>>
>>>> oeqa/oetest.py: Fix SDKExtTestContext for load the correct manifests=
=2E
>>>>
>>>> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>>> ---
>>>>
>>>>  meta/classes/populate_sdk_ext.bbclass |  3 +++
>>>>  meta/lib/oeqa/oetest.py               | 11 +++++++++--
>>>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/populate_sdk_ext.bbclass
>>>> b/meta/classes/populate_sdk_ext.bbclass index fc96a4b..27dc030 10064=
4
>>>> --- a/meta/classes/populate_sdk_ext.bbclass
>>>> +++ b/meta/classes/populate_sdk_ext.bbclass
>>>> @@ -43,6 +43,9 @@ B_task-populate-sdk-ext =3D "${SDK_DIR}"
>>>>
>>>>  TOOLCHAINEXT_OUTPUTNAME =3D "${SDK_NAME}-toolchain-ext-${SDK_VERSIO=
N}"
>>>>  TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext =3D
>>>>  "${TOOLCHAINEXT_OUTPUTNAME}"
>>>>
>>>> +SDK_EXT_TARGET_MANIFEST =3D
>>>> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
>>>> +SDK_EXT_HOST_MANIFEST =3D
>>>> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest" +
>>>>
>>>>  SDK_TITLE_task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME', Tru=
e) or
>>>>
>>>> d.getVar('DISTRO', True)} Extensible SDK"
>>>>
>>>>  python copy_buildsystem () {
>>>>
>>>> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
>>>> index 6beb6c5..c951989 100644
>>>> --- a/meta/lib/oeqa/oetest.py
>>>> +++ b/meta/lib/oeqa/oetest.py
>>>>
>>>> @@ -382,14 +382,18 @@ class SDKTestContext(TestContext):
>>>>          self.sdktestdir =3D sdktestdir
>>>>          self.sdkenv =3D sdkenv
>>>>
>>>> +        if not hasattr(self, 'target_manifest_name'):
>>>> +            self.target_manifest_name =3D "SDK_TARGET_MANIFEST"
>>>>
>>>>          try:
>>>> -            with open(d.getVar("SDK_TARGET_MANIFEST", True)) as f:
>>>>
>>>> +            with open(d.getVar(self.target_manifest_name, True)) as=
 f:
>>>>                   self.pkgmanifest =3D f.read()
>>>>         =20
>>>>          except IOError as e:
>>>>              bb.fatal("No package manifest file found. Did you build=
 the
>>>>              sdk
>>>>
>>>> image?\n%s" % e)
>>>>
>>>> +        if not hasattr(self, 'host_manifest_name'):
>>>> +            self.host_manifest_name =3D "SDK_HOST_MANIFEST"
>>>>
>>>>          try:
>>>> -            with open(d.getVar("SDK_HOST_MANIFEST", True)) as f:
>>>>
>>>> +            with open(d.getVar(self.host_manifest_name, True)) as f=
:
>>>>                  self.hostpkgmanifest =3D f.read()
>>>>         =20
>>>>          except IOError as e:
>>>>              bb.fatal("No host package manifest file found. Did you =
build
>>>>
>>>> the sdk image?\n%s" % e) @@ -406,6 +410,9 @@ class
>>>>
>>>> SDKTestContext(TestContext):
>>>>  class SDKExtTestContext(SDKTestContext):
>>>>      def __init__(self, d, sdktestdir, sdkenv):
>>>> +        self.target_manifest_name =3D "SDK_EXT_TARGET_MANIFEST"
>>>> +        self.host_manifest_name =3D "SDK_EXT_HOST_MANIFEST"
>>>> +
>>>>
>>>>          super(SDKExtTestContext, self).__init__(d, sdktestdir, sdke=
nv)
>>>>         =20
>>>>          self.sdkextfilesdir =3D
>>>>          os.path.join(os.path.dirname(os.path.abspath(
>>>
>>> I really don't like the idea of passing the variable name here rather=
 than
>>> values. However, besides that, the manifest is always the SDK name pl=
us
>>> .host.manifest or .target.manifest - do we even need to pass separate=

>>> names? All you should need is the name of the SDK i.e. the value of
>>> TOOLCHAINEXT_OUTPUTNAME.
>>
>> I prefer to have explicit value and construct them into one place
>> instead of have many name constructions like you said to use
>> TOOLCHAINEXT_OUTPUTNAME and suppose that always be end with .{host,
>> target}.manifest.
>=20
> When you add a variable to populate_sdk_ext.bbclass, it isn't just defi=
ned for=20
> the ext SDK - it's defined for every image recipe. I want to try to avo=
id=20
> defining additional variables and thus expanding the environment where =
we don't=20
> really need to.

I guess two more variable expansions gives you no more/less performance
and also gives you the possibility to have the thing set in a clean manne=
r,

>=20
> The naming of the manifest is something we can rely on, because externa=
l tools=20
> need to be able to.

May be now, :).

	alimon

>=20
> Cheers,
> Paul
>=20


--blmK01S4Kj90QntwtgjQ4Od2IxDAN9K7b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsSn7AAoJEGJqcE9h3glgS9wP/3dLiRGAYA0bvqeu2x+SkIIj
zMaBGHqkXmy4Y0TRu0ftDoxo0mBjnHUcaSN5PqHhc0Zv8jpjGWgPqsCgo8+1fxet
d3R0Wq8EXMbRSgt9zYoFI/WQT1JFqX3o0IwLylxVW+ADfjr032QR+U8fYM7473CJ
KVHL1V1ewiWyfOI2Oo5kCtxXsta1uzgeVka3rlngU3phh/B6kZyiiPd8zTacrzgr
oBhIlA1SfhXVOwJUBkS2RU/5KIsRAyPllYm82gD3trNW4DG1cstgWYskfcHuz7yp
d73tbArbNlAljrVl/0rbKL6440aaxCWx/Hl8Ur1pdoQuc2koXdkL5qQpCKM/Z59q
wgZ4XjrMItBSjmStX5MpOUihBTfRH8tA40dn5FKI4J5VoLlJ4GNL+lJedlA6yyAl
kU+mIZcck+MVMYwvHtownUXK8KSSumr67ugHv6DcjH2bQo9AIgSFx41G6U4N3JO5
uBPTSnsPVFw9HEVGxo7A/p1aAa/w0h2Y+RhxDKuzwJhfmYkwDHZCrdEP1T0qagKM
5mhxAZu7jTbAkpTVSt4lLO1uK7AftKg4DsLaHMEA57VjLTaMrtCQSYNCgNN5ldVS
N6H3pKvGFFNwK0334r/1aXktLleSj5mJKlm3PpXGfmFDduWUSFf36nk+eQ8/AY7w
ynaE3lKVDVLU23tc8kvu
=3P0e
-----END PGP SIGNATURE-----

--blmK01S4Kj90QntwtgjQ4Od2IxDAN9K7b--
