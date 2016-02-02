Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE87772BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:03:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 14:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="907148547"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2016 14:03:09 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<bd0a81514ee073e7f106abcdfc96f3c386ee818f.1454424743.git.anibal.limon@linux.intel.com>
	<4491582.7184pyYJcq@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B12812.70900@linux.intel.com>
Date: Tue, 2 Feb 2016 16:05:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <4491582.7184pyYJcq@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 02 Feb 2016 22:03:20 -0000
X-Groupsio-MsgNum: 77379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="k2XhAX5aGOumLIeRStplsbpSmJsomdtb2"

--k2XhAX5aGOumLIeRStplsbpSmJsomdtb2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/02/2016 03:52 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 09:14:21 An=EDbal Lim=F3n wrote:
>> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>
>> Extensible SDK needs to point to the correct manifest so add
>> SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST variables.
>>
>> oeqa/oetest.py: Fix SDKExtTestContext for load the correct manifests.
>>
>> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>> ---
>>  meta/classes/populate_sdk_ext.bbclass |  3 +++
>>  meta/lib/oeqa/oetest.py               | 11 +++++++++--
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/populate_sdk_ext.bbclass
>> b/meta/classes/populate_sdk_ext.bbclass index fc96a4b..27dc030 100644
>> --- a/meta/classes/populate_sdk_ext.bbclass
>> +++ b/meta/classes/populate_sdk_ext.bbclass
>> @@ -43,6 +43,9 @@ B_task-populate-sdk-ext =3D "${SDK_DIR}"
>>  TOOLCHAINEXT_OUTPUTNAME =3D "${SDK_NAME}-toolchain-ext-${SDK_VERSION}=
"
>>  TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext =3D "${TOOLCHAINEXT_OUTPUT=
NAME}"
>>
>> +SDK_EXT_TARGET_MANIFEST =3D
>> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
>> +SDK_EXT_HOST_MANIFEST =3D
>> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest" +
>>  SDK_TITLE_task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME', True)=
 or
>> d.getVar('DISTRO', True)} Extensible SDK"
>>
>>  python copy_buildsystem () {
>> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
>> index 6beb6c5..c951989 100644
>> --- a/meta/lib/oeqa/oetest.py
>> +++ b/meta/lib/oeqa/oetest.py
>> @@ -382,14 +382,18 @@ class SDKTestContext(TestContext):
>>          self.sdktestdir =3D sdktestdir
>>          self.sdkenv =3D sdkenv
>>
>> +        if not hasattr(self, 'target_manifest_name'):
>> +            self.target_manifest_name =3D "SDK_TARGET_MANIFEST"
>>          try:
>> -            with open(d.getVar("SDK_TARGET_MANIFEST", True)) as f:
>> +            with open(d.getVar(self.target_manifest_name, True)) as f=
:
>>                   self.pkgmanifest =3D f.read()
>>          except IOError as e:
>>              bb.fatal("No package manifest file found. Did you build t=
he sdk
>> image?\n%s" % e)
>>
>> +        if not hasattr(self, 'host_manifest_name'):
>> +            self.host_manifest_name =3D "SDK_HOST_MANIFEST"
>>          try:
>> -            with open(d.getVar("SDK_HOST_MANIFEST", True)) as f:
>> +            with open(d.getVar(self.host_manifest_name, True)) as f:
>>                  self.hostpkgmanifest =3D f.read()
>>          except IOError as e:
>>              bb.fatal("No host package manifest file found. Did you bu=
ild
>> the sdk image?\n%s" % e) @@ -406,6 +410,9 @@ class
>> SDKTestContext(TestContext):
>>
>>  class SDKExtTestContext(SDKTestContext):
>>      def __init__(self, d, sdktestdir, sdkenv):
>> +        self.target_manifest_name =3D "SDK_EXT_TARGET_MANIFEST"
>> +        self.host_manifest_name =3D "SDK_EXT_HOST_MANIFEST"
>> +
>>          super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv=
)
>>
>>          self.sdkextfilesdir =3D os.path.join(os.path.dirname(os.path.=
abspath(
>=20
> I really don't like the idea of passing the variable name here rather t=
han=20
> values. However, besides that, the manifest is always the SDK name plus=
=20
> .host.manifest or .target.manifest - do we even need to pass separate n=
ames?=20
> All you should need is the name of the SDK i.e. the value of=20
> TOOLCHAINEXT_OUTPUTNAME.

I prefer to have explicit value and construct them into one place
instead of have many name constructions like you said to use
TOOLCHAINEXT_OUTPUTNAME and suppose that always be end with .{host,
target}.manifest.

	alimon
>=20
> Cheers,
> Paul
>=20


--k2XhAX5aGOumLIeRStplsbpSmJsomdtb2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsSgVAAoJEGJqcE9h3glg1GcP/jbRy3QiDyCGa2mjIJ1fGrSL
vpG9YM8pDbSCxxsQsc+brss1ZXIzNHlnjYsGJWpcvRNDS5sINFavSrcWZCNpSL9a
OOaacBALn0/G83WzO/e3/xqIs0iUmvqCTNGYdxBZ6JrLZ79/YweamcuiTvp7LETY
w5INz8jGG+6+3MUdlSY9oX4BlHW/pB7Q+U6ICO3/KqsUGEov5J031nLTsVXfw/KL
YJPyIpOde5E8Z4AGOOCJnK/u02zdNgHhCWwZ7PccDz2Vru7EJt1Qlm9KN7Lj81Xt
VnuOBVQ1jW+ru4GdJhtqeTZKUfj8u+EeOp+5vvXd8NcnR9tRKTXhBlc6xa0Xz7GI
bfmEdZGZXGPFRVHaBnuqDPLep34EIvac5Mr1xaYdLEEAG1LuDGrAXfrIEdpqIE86
Qd8Mz1Fnf2qELhMbkvRoWrRWGhbKaqSa+CMt8b59yxxQyaXNqT61N1QOKCf6vAfS
glnCilY9ELg1cBjHvZvGoR8SZDlL65ar8U0CuZiJO0YtTSexY6oOtpt8o9Dv/myS
ghmkpcZl8+zC/n4dci7LtDmGIl6jAkYHSsFkwkw6VESOvC9f2tszEhKaH810j7uf
HitqjyeeckFx3/ina/7h/+7VvBhmALvKbghN6x/Co9CjLzVMe7nDWBU0aTOIlNoK
x8usORzIezJsQvemQgVA
=crZW
-----END PGP SIGNATURE-----

--k2XhAX5aGOumLIeRStplsbpSmJsomdtb2--
