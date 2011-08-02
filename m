Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19NEmkBgrHOeEk2yXveL7PijNrZbEhOVqE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoKxG-0005Rg-Ps
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 21:48:43 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72JiJvJ025014;
	Tue, 2 Aug 2011 14:44:20 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E38516E.7040202@linux.intel.com>
Date: Tue, 2 Aug 2011 14:44:20 -0500
Message-Id: <7F59D6E9-4A98-49E8-8FA4-DA4C6B86E8FF@kernel.crashing.org>
References: <1312302695-17747-1-git-send-email-galak@kernel.crashing.org>
	<4E38516E.7040202@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune/powerpc: Cleanup setting of TUNE_PKGARCH
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
X-List-Received-Date: Tue, 02 Aug 2011 19:48:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2011, at 2:35 PM, Saul Wold wrote:

> On 08/02/2011 09:31 AM, Kumar Gala wrote:
>> Add some uniformity to the naming scheme and reduce a bit of =
redudancy.
>>=20
>> Names are now back to: ppc603e, ppce300c2, ppce500, ppce500mc,
>> ppce500v2.
>>=20
>> On 64-bit we'll have something like ppc64e5500.
>>=20
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    5 +++--
>>  meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
>>  meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
>>  meta/conf/machine/include/tune-ppce500.inc         |    2 +-
>>  meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
>>  meta/conf/machine/include/tune-ppce500v2.inc       |    2 +-
>>  6 files changed, 8 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc =
b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> index 93b1c05..a8226ea 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -3,6 +3,7 @@
>>  # *) Hard Floating Point on 64-bit
>>=20
>>  DEFAULTTUNE ?=3D "powerpc"
>> +TUNE_PKGARCH ?=3D "ppc"
>>=20
>>  TUNEVALID[m32] =3D "Power ELF32 standard ABI"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", =
"-m32", "", d)}"
>> @@ -12,6 +13,7 @@ TUNEVALID[m64] =3D "Power ELF64 standard ABI"
>>  TUNE_CONFLICTS[m64] =3D "m32 nf"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m64", =
"-m64", "", d)}"
>>  TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], =
"powerpc64", "", d)}"
>> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], =
"64", "", d)}"
>>=20
>>  TUNEVALID[fpu-hard] =3D "Use hardware FPU."
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", =
"-mhard-float", "", d)}"
>> @@ -23,8 +25,7 @@ TARGET_FPU .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>>  ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in =
['ppc-efd', 'ppc-efs']]}"
>>=20
>>  PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", =
"-nf", "", d)}"
>> -
>> -TUNE_PKGARCH ?=3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>> +TUNE_PKGARCH .=3D "${PPCPKGSFX_FPU}"
>>=20
>>  # Basic tune definitions
>>  AVAILTUNES +=3D "powerpc powerpc-nf"
>> diff --git a/meta/conf/machine/include/tune-ppc603e.inc =
b/meta/conf/machine/include/tune-ppc603e.inc
>> index 7c05394..12ba425 100644
>> --- a/meta/conf/machine/include/tune-ppc603e.inc
>> +++ b/meta/conf/machine/include/tune-ppc603e.inc
>> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>>=20
>>  TUNEVALID[ppc603e] =3D "Enable ppc603e specific processor =
optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", =
"-mcpu=3D603e", "", d)}"
>> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", =
"ppc603e", "", d)}"
>> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", =
"603e", "", d)}"
>>=20
>>  AVAILTUNES +=3D "ppc603e"
>>  TUNE_FEATURES_tune-ppc603e =3D "m32 fpu-hard ppc603e"
>> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc =
b/meta/conf/machine/include/tune-ppce300c2.inc
>> index bad2611..6fe3e42 100644
>> --- a/meta/conf/machine/include/tune-ppce300c2.inc
>> +++ b/meta/conf/machine/include/tune-ppce300c2.inc
>> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>>=20
>>  TUNEVALID[ppce300c2] =3D "Enable ppce300c2 specific processor =
optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", =
"-mcpu=3De300c2", "", d)}"
>> -TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", =
"ppce300c2", "${TUNE_ARCH}", d)}"
>> +TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", =
"e300c2", "${TUNE_ARCH}", d)}"
>>=20
>>  AVAILTUNES +=3D "ppce300c2"
>>  TUNE_FEATURES_tune-ppce300c2 =3D "m32 fpu-soft ppce300c2"
>> diff --git a/meta/conf/machine/include/tune-ppce500.inc =
b/meta/conf/machine/include/tune-ppce500.inc
>> index c34d631..0e850f1 100644
>> --- a/meta/conf/machine/include/tune-ppce500.inc
>> +++ b/meta/conf/machine/include/tune-ppce500.inc
>> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>>=20
>>  TUNEVALID[ppce500] =3D "Enable ppce500 specific processor =
optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", =
"-mcpu=3D8540", "", d)}"
>> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", =
"ppce500", "", d)}"
>> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", =
"e500", "", d)}"
>>=20
>>  TUNEVALID[spe] =3D "Enable SPE ABI extensions"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "spe", =
"-mabi=3Dspe -mspe", "", d)}"
>> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc =
b/meta/conf/machine/include/tune-ppce500mc.inc
>> index 73217dd..9fee226 100644
>> --- a/meta/conf/machine/include/tune-ppce500mc.inc
>> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
>> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>>=20
>>  TUNEVALID[ppce500mc] =3D "Enable ppce500mc specific processor =
optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", =
"-mcpu=3De500mc", "", d)}"
>> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppce500mc", "ppce500mc", "", d)}"
>> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppce500mc", "e500mc", "", d)}"
>>=20
>>  AVAILTUNES +=3D "ppce500mc"
>>  TUNE_FEATURES_tune-ppce500mc =3D "m32 fpu-hard ppce500mc"
>> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc =
b/meta/conf/machine/include/tune-ppce500v2.inc
>> index 819d68a..2a0451b 100644
>> --- a/meta/conf/machine/include/tune-ppce500v2.inc
>> +++ b/meta/conf/machine/include/tune-ppce500v2.inc
>> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>>=20
>>  TUNEVALID[ppce500v2] =3D "Enable ppce500v2 specific processor =
optimizations"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", =
"-mcpu=3D8548", "", d)}"
>> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppce500v2", "ppce500v2", "", d)}"
>> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppce500v2", "e500v2", "", d)}"
>>=20
>>  TUNEVALID[spe] =3D "Enable SPE ABI extensions"
>>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "spe", =
"-mabi=3Dspe -mspe", "", d)}"
>=20
>=20
> I think this needs to be rebased against the recent changes.
>=20
> Sau!

I believe what is git now supercededs this patch.

- k=


