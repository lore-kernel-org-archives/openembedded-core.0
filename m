Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qqydm-0003Ir-6C
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 04:35:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2011 19:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,347,1309762800"; d="scan'208";a="39946069"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2011 19:30:47 -0700
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 10 Aug 2011 10:29:00 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 10 Aug 2011 10:28:59 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 10 Aug 2011 10:28:59 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 10:28:57 +0800
Thread-Topic: [OE-core] [PATCH 3/3] x86 tune inc files: add x32 abi tune
	parameters
Thread-Index: AcxTzSQ5tygQe9HbTe+nc3n2zDiX8gDN5cOw
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2FA7674FDB@shsmsx502.ccr.corp.intel.com>
References: <cover.1312565996.git.nitin.a.kamble@intel.com>
	<d6226c2a156d6c9d53237f98385e252c34a1e74d.1312565996.git.nitin.a.kamble@intel.com>
In-Reply-To: <d6226c2a156d6c9d53237f98385e252c34a1e74d.1312565996.git.nitin.a.kamble@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] x86 tune inc files: add x32 abi tune	parameters
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
X-List-Received-Date: Wed, 10 Aug 2011 02:35:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

nitin.a.kamble@intel.com wrote on 2011-08-06:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/conf/machine/include/ia32/arch-ia32.inc |   19 +++++++++++++++++--
>  meta/conf/machine/include/tune-core2.inc     |    4 ++++
>  meta/conf/machine/include/tune-x86_64.inc    |    2 +-
>  3 files changed, 22 insertions(+), 3 deletions(-)
> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc
> b/meta/conf/machine/include/ia32/arch-ia32.inc index 2709440..96980d2
> 100644 --- a/meta/conf/machine/include/ia32/arch-ia32.inc +++
> b/meta/conf/machine/include/ia32/arch-ia32.inc @@ -9,13 +9,22 @@
> X86ARCH64 ?=3D "x86_64"
>=20
>  # ELF32 ABI
>  TUNEVALID[m32] =3D "IA32 ELF32 standard ABI"
> -TUNECONFLICTS[m32] =3D "m64"
> +TUNECONFLICTS[m32] =3D "m64 mx32"
>  TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
>  "${X86ARCH32}", "" ,d)}" TUNE_CCARGS +=3D
>  "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32",
> "", d)}"
>=20
> +# x32 ABI
> +TUNEVALID[mx32] =3D "IA32e (x86_64) ELF32 standard ABI"
> +TUNECONFLICTS[mx32] =3D "m64 m32"
> +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32",
> "${X86ARCH64}", "" ,d)}"
> +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32",
> "" ,d)}"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32",
> "-mx32", "", d)}"
> +TUNE_LDARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m
> elf32_x86_64", "", d)}"
> +TUNE_ASARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32",
> "", d)}"
> +
>  # ELF64 ABI
>  TUNEVALID[m64] =3D "IA32e (x86_64) ELF64 standard ABI"
> -TUNECONFLICT[m64] =3D "m32"
> +TUNECONFLICT[m64] =3D "m32 mx32"
>  TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m64",
>  "${X86ARCH64}", "" ,d)}" TUNE_CCARGS +=3D
>  "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64",
> "", d)}"
>=20
> @@ -31,3 +40,9 @@ AVAILTUNES +=3D "x86-64"
>  TUNE_FEATURES_tune-x86-64 ?=3D "m64"
>  BASE_LIB_tune-x86-64 ?=3D "lib64"
>  PACKAGE_EXTRA_ARCHS_tune-x86-64 =3D "x86_64"
> + +AVAILTUNES +=3D "x86-64-x32" +TUNE_FEATURES_tune-x86-64-x32 ?=3D "mx32=
"
> +BASE_LIB_tune-x86-64-x32 ?=3D "lib" +PACKAGE_EXTRA_ARCHS_tune-x86-64-x32
> =3D "x86_64-x32" +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES"=
,
> "mx32", +"-x32", "", d)}" diff --git
> a/meta/conf/machine/include/tune-core2.inc
> b/meta/conf/machine/include/tune-core2.inc index 25c2226..78f8f4d 100644
> --- a/meta/conf/machine/include/tune-core2.inc +++
> b/meta/conf/machine/include/tune-core2.inc @@ -18,3 +18,7 @@
> TUNE_FEATURES_tune-core2-64 ?=3D "${TUNE_FEATURES_tune-x86-64} core2"
>  BASE_LIB_tune-core2-64 ?=3D "lib64"
>  PACKAGE_EXTRA_ARCHS_tune-core2-64 =3D
> "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
>=20
> +AVAILTUNES +=3D "core2-64-x32" +TUNE_FEATURES_tune-core2-64-x32 ?=3D
> "${TUNE_FEATURES_tune-x86-64-x32} core2" +BASE_LIB_tune-core2-64-x32 ?=3D
> "lib" +PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 =3D
> "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-64-x32" diff --git
> a/meta/conf/machine/include/tune-x86_64.inc
> b/meta/conf/machine/include/tune-x86_64.inc index 04b0f96..50f20ba
> 100644 --- a/meta/conf/machine/include/tune-x86_64.inc +++
> b/meta/conf/machine/include/tune-x86_64.inc @@ -1,3 +1,3 @@
>  require conf/machine/include/ia32/arch-ia32.inc
> -DEFAULTTUNE =3D "x86-64"
> +DEFAULTTUNE ?=3D "x86-64"

Well, it seems this "?=3D" has no effect here because DEFAULTTUNE is alread=
y "?=3D"ed in arch-ia32.inc. Now machine qemux86-64 has the incorrect TUNE_=
ARCH of i586.

Best Regards,
-Lianhao=20





