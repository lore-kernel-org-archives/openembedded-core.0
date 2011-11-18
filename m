Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RREaE-0001MQ-0u
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 03:53:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Nov 2011 18:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,530,1315206000"; d="scan'208";a="76435953"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 17 Nov 2011 18:47:15 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 17 Nov 2011 18:47:14 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 17 Nov 2011 18:47:14 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 18:47:11 -0800
Thread-Topic: [OE-core] [PATCH] gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a
Thread-Index: Acylh/cI7ytTw026RFS+ZEf4DM9YlAAFDtnA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3A62150@orsmsx504.amr.corp.intel.com>
References: <1321575634-24108-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1321575634-24108-1-git-send-email-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a
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
X-List-Received-Date: Fri, 18 Nov 2011 02:53:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


I tested this commit for qt4-x11-free for beagleboard machine, and the gcc =
ICE is gone with this commit.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Thursday, November 17, 2011 4:21 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a
>=20
> Backport fix for PR 47551 fixes the ICE seen on armv7-a/qt4-x11-free
> Bump up SRCREV past gcc 4.6.2 release
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.6.inc           |    9 ++--
>  meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch |   63
> +++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-
> devtools/gcc/gcc-4.6.inc
> index 469457c..7bf14e3 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>=20
> -PR =3D "r16"
> +PR =3D "r17"
>=20
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -8,7 +8,7 @@ PR =3D "r16"
>  # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
>  # to reflect that change
>=20
> -PV =3D "4.6.1+svnr${SRCPV}"
> +PV =3D "4.6.2+svnr${SRCPV}"
>=20
>  # BINV should be incremented after updating to a revision
>  # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
> @@ -16,9 +16,9 @@ PV =3D "4.6.1+svnr${SRCPV}"
>  # 4.6.1 then the value below will have 2 which will mean 4.6.2
>  # which will be next minor release and so on.
>=20
> -BINV =3D "4.6.2"
> +BINV =3D "4.6.3"
>=20
> -SRCREV =3D 180099
> +SRCREV =3D 181430
>  BRANCH =3D "gcc-4_6-branch"
>  FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
>=20
> @@ -71,6 +71,7 @@ SRC_URI =3D
> "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH};proto=3Dhttp \
>  	   file://gcc-with-linker-hash-style.patch \
>  	   file://pr46934.patch \
>  	   file://pr32219.patch \
> +	   file://pr47551.patch \
>  	  "
>=20
>  SRC_URI_append_sh3  =3D " file://sh3-installfix-fixheaders.patch "
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
> b/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
> new file mode 100644
> index 0000000..5271ffa
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
> @@ -0,0 +1,63 @@
> +2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
> +
> +	gcc/
> +	PR target/47551
> +	* config/arm/arm.c (coproc_secondary_reload_class): Handle
> +	structure modes.  Don't check neon_vector_mem_operand for
> +	vector or structure modes.
> +
> +	gcc/testsuite/
> +	PR target/47551
> +	* gcc.target/arm/neon-modes-2.c: New test.
> +
> +=3D=3D=3D modified file 'gcc/config/arm/arm.c'
> +--- old/gcc/config/arm/arm.c	2011-02-21 14:04:51 +0000
> ++++ new/gcc/config/arm/arm.c	2011-03-02 11:38:43 +0000
> +@@ -9139,11 +9139,14 @@
> +       return GENERAL_REGS;
> +     }
> +
> ++  /* The neon move patterns handle all legitimate vector and struct
> ++     addresses.  */
> +   if (TARGET_NEON
> ++      && MEM_P (x)
> +       && (GET_MODE_CLASS (mode) =3D=3D MODE_VECTOR_INT
> +-          || GET_MODE_CLASS (mode) =3D=3D MODE_VECTOR_FLOAT)
> +-      && neon_vector_mem_operand (x, 0))
> +-     return NO_REGS;
> ++	  || GET_MODE_CLASS (mode) =3D=3D MODE_VECTOR_FLOAT
> ++	  || VALID_NEON_STRUCT_MODE (mode)))
> ++    return NO_REGS;
> +
> +   if (arm_coproc_mem_operand (x, wb) || s_register_operand (x, mode))
> +     return NO_REGS;
> +
> +=3D=3D=3D added file 'gcc/testsuite/gcc.target/arm/neon-modes-2.c'
> +--- old/gcc/testsuite/gcc.target/arm/neon-modes-2.c	1970-01-01
> 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/arm/neon-modes-2.c	2011-02-02
> 10:02:45 +0000
> +@@ -0,0 +1,24 @@
> ++/* { dg-do compile } */
> ++/* { dg-require-effective-target arm_neon_ok } */
> ++/* { dg-options "-O1" } */
> ++/* { dg-add-options arm_neon } */
> ++
> ++#include "arm_neon.h"
> ++
> ++#define SETUP(A) x##A =3D vld3_u32 (ptr + A * 0x20)
> ++#define MODIFY(A) x##A =3D vld3_lane_u32 (ptr + A * 0x20 + 0x10, x##A,
> 1)
> ++#define STORE(A) vst3_u32 (ptr + A * 0x20, x##A)
> ++
> ++#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
> ++
> ++void
> ++bar (uint32_t *ptr, int y)
> ++{
> ++  uint32x2x3_t MANY (SETUP);
> ++  int *x =3D __builtin_alloca (y);
> ++  int z[0x1000];
> ++  foo (x, z);
> ++  MANY (MODIFY);
> ++  foo (x, z);
> ++  MANY (STORE);
> ++}
> +
> --
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


