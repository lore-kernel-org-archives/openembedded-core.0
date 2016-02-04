Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CD12777156
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:11:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 04 Feb 2016 12:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; 
	d="asc'?scan'208";a="896563993"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2016 12:11:05 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<f4fae173e814851f4a14b4c1e47f5de5c497a7b7.1454459362.git.anibal.limon@linux.intel.com>
	<2637486.2zAlMEmPQJ@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B3B0CF.1030306@linux.intel.com>
Date: Thu, 4 Feb 2016 14:13:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <2637486.2zAlMEmPQJ@peggleto-mobl.ger.corp.intel.com>
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 25/28] oeqa/oetest.py: SDK{Ext, } improve host and target manifest load.
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
X-List-Received-Date: Thu, 04 Feb 2016 20:11:07 -0000
X-Groupsio-MsgNum: 77534
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="UvskBoEnqamn5E8FeTmCrMUeK9FRwt6Pf"

--UvskBoEnqamn5E8FeTmCrMUeK9FRwt6Pf
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Ok agreed.

On 02/04/2016 12:35 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 18:30:37 An=EDbal Lim=F3n wrote:
>> Don't pass variable name instead of it expands the host and target
>> manifest at init of the classes.
>>
>> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/lib/oeqa/oetest.py | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
>> index 6a95c28..80b40b6 100644
>> --- a/meta/lib/oeqa/oetest.py
>> +++ b/meta/lib/oeqa/oetest.py
>> @@ -382,18 +382,18 @@ class SDKTestContext(TestContext):
>>          self.sdktestdir =3D sdktestdir
>>          self.sdkenv =3D sdkenv
>>
>> -        if not hasattr(self, 'target_manifest_name'):
>> -            self.target_manifest_name =3D "SDK_TARGET_MANIFEST"
>> +        if not hasattr(self, 'target_manifest'):
>> +            self.target_manifest =3D d.getVar("SDK_TARGET_MANIFEST", =
True)
>>          try:
>> -            with open(d.getVar(self.target_manifest_name, True)) as f=
:
>> +            with open(self.target_manifest) as f:
>>                   self.pkgmanifest =3D f.read()
>>          except IOError as e:
>>              bb.fatal("No package manifest file found. Did you build t=
he sdk
>> image?\n%s" % e)
>>
>> -        if not hasattr(self, 'host_manifest_name'):
>> -            self.host_manifest_name =3D "SDK_HOST_MANIFEST"
>> +        if not hasattr(self, 'host_manifest'):
>> +            self.host_manifest =3D d.getVar("SDK_HOST_MANIFEST", True=
)
>>          try:
>> -            with open(d.getVar(self.host_manifest_name, True)) as f:
>> +            with open(self.host_manifest) as f:
>>                  self.hostpkgmanifest =3D f.read()
>>          except IOError as e:
>>              bb.fatal("No host package manifest file found. Did you bu=
ild
>> the sdk image?\n%s" % e) @@ -410,8 +410,8 @@ class
>> SDKTestContext(TestContext):
>>
>>  class SDKExtTestContext(SDKTestContext):
>>      def __init__(self, d, sdktestdir, sdkenv):
>> -        self.target_manifest_name =3D "SDK_EXT_TARGET_MANIFEST"
>> -        self.host_manifest_name =3D "SDK_EXT_HOST_MANIFEST"
>> +        self.target_manifest =3D d.getVar("SDK_EXT_TARGET_MANIFEST", =
True)
>> +        self.host_manifest =3D d.getVar("SDK_EXT_HOST_MANIFEST", True=
)
>>
>>          super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv=
)
>=20
> Please squash this into the earlier commit where the original logic was=
 added.
>=20
> Thanks,
> Paul
>=20


--UvskBoEnqamn5E8FeTmCrMUeK9FRwt6Pf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWs7DRAAoJEGJqcE9h3glgLHoP+wSgXG+4QcVRcq3fBIvIEChL
oLC597amL3ByxdhJtVEAp0iJDDOQIjCicTYbYDc0Oo666C2gsns+AFBWGsAXDURT
+dH+9h5pu9lvuAh2wkzlrtauQDj6wzCW7bRv8rzwwPoTSJr0fMC08hbP6ho2UELu
r6AJBpdikS86YZD/KEjJhQEgZ6dr9xcjALTOfh0PG7IhhF5rW8MPgOYTMxS+tp3S
vK9Bewvngn3g+2d+PS/ovOfOy3cl1+CtWEtgxkRqsJ4CjDyroypEN+p+7i208AID
MKEjwBDIcYmfaU5DNq5deJIRtV5cMwFr4pBQpu9NcfTAhxvsx5itX9HMzIe0EkhJ
7xtbIqZGeTE+kyOp8CbAhIvAxwSnp81QLwwTZ3/Hjlyd7vncAhrNA0DnMU1jzXBB
4b5M2u5Xbfei9xtjoW/OfloQcVhq7RAcrxzPprz1Jtx1zBFHkgAdOLvV6WuuVX5I
hKJj8kwE+v/qaO3UuaDUXVo5zapUxRMELMlK3FRYJS6r7TvPvTVDkUejgPO+iqoU
O3WcEDTWb/+6+aR3xwhjmZMhNSrslw9osgtfZlp9TS4rPNkrUPKH6K3G8dIQuQaB
eNG9LwYeKdhikmObMSAYE9orywLH/ETuJ6n6QfjKFyF5sQnhRredNJt5GYPrgpLc
6AUQcfJ+zSKYZ2yuXQta
=FT6K
-----END PGP SIGNATURE-----

--UvskBoEnqamn5E8FeTmCrMUeK9FRwt6Pf--
