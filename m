Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+OkO5jWqvL1KO0ZqAZloa4z3mvuErxeAQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrjlT-0006jd-Mo
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 06:54:36 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7C4o0vQ007314;
	Thu, 11 Aug 2011 23:50:00 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E444ECF.9090704@linux.intel.com>
Date: Thu, 11 Aug 2011 23:49:59 -0500
Message-Id: <6C9792A6-3B35-419B-A1CA-E701A6D5477A@kernel.crashing.org>
References: <1313043452-28242-1-git-send-email-galak@kernel.crashing.org>
	<4E444ECF.9090704@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] tune-ppc: Update to pass glibc configure option to get cpu specific support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 04:54:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 11, 2011, at 4:51 PM, Saul Wold wrote:

> On 08/10/2011 11:17 PM, Kumar Gala wrote:
>> We need --with-cpu based to glibc to get proper support on 603e&  =
e500mc
>> to pickup proper math libs to deal with sqrt.  These core do not
>> implement the fsqrt[s] instructions that the normal PPC math libs
>> utilize.
>>=20
>> This causes use to not set AVAILTUNES specifically to the sub-arch =
only
>> as we arent generically compatiable.
>>=20
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>> v3:
>> - utilize TUNE_FEATURES for how we set GLIBC_EXTRA_OECONF
>>=20
>>  meta/conf/machine/include/tune-ppc603e.inc   |    5 ++++-
>>  meta/conf/machine/include/tune-ppce500mc.inc |    5 ++++-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/tune-ppc603e.inc =
b/meta/conf/machine/include/tune-ppc603e.inc
>> index 9abb694..44a708a 100644
>> --- a/meta/conf/machine/include/tune-ppc603e.inc
>> +++ b/meta/conf/machine/include/tune-ppc603e.inc
>> @@ -6,6 +6,9 @@ TUNEVALID[ppc603e] =3D "Enable ppc603e specific =
processor optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", =
"-mcpu=3D603e", "", d)}"
>>  TUNE_PKGARCH =3D "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', =
'ppc603e', '${PPCPKGARCH}', d)}"
>>=20
>> -AVAILTUNES +=3D "ppc603e"
>> +AVAILTUNES =3D "ppc603e"
>>  TUNE_FEATURES_tune-ppc603e =3D "m32 ppc603e"
>>  PACKAGE_EXTRA_ARCHS_tune-ppc603e =3D "powerpc ppc603e"
>> +
>> +# glibc configure options to get 603e specific library (for sqrt)
>> +GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppc603e", "-with-cpu=3D603e", "", d)}"
>> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc =
b/meta/conf/machine/include/tune-ppce500mc.inc
>> index b5031f4..9849603 100644
>> --- a/meta/conf/machine/include/tune-ppce500mc.inc
>> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
>> @@ -6,6 +6,9 @@ TUNEVALID[ppce500mc] =3D "Enable ppce500mc specific =
processor optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", =
"-mcpu=3De500mc", "", d)}"
>>  TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", =
"ppce500mc", "${PPCPKGARCH}", d)}"
>>=20
>> -AVAILTUNES +=3D "ppce500mc"
>> +AVAILTUNES =3D "ppce500mc"
>>  TUNE_FEATURES_tune-ppce500mc =3D "m32 ppce500mc"
>>  PACKAGE_EXTRA_ARCHS_tune-ppce500mc =3D "powerpc ppce500mc"
>> +
>> +# glibc configure options to get e500mc specific library (for sqrt)
>> +GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppce500mc", "-with-cpu=3De500mc", "", d)}"
>=20
> Kumar,
>=20
> This patch is not applying directly it seems that you might have some =
difference in the TUNE_FEATURES and PACKAGE_EXTRA_ARCHS_ that is =
throwing things off, have you rebased against master?
>=20
> Sau!
>=20

I'll post a clean version.

- k



