Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9WKK-0000Kv-3X
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 09:16:36 +0200
Received: by weyr6 with SMTP id r6so1015319wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 00:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=/3GmxExvujlgPog3wNQhWw/kQSnlvHOJp6xYktXUWaY=;
	b=WgxSP0mzVbp/YyjtN2WRRuTp22hNBFVxxdLNmjp2UbH0m+6uXyHuXYrsdeYvkKwGfc
	uhLarszytB71PUGssHWu6LQgxcZB5KVpd9p2pnayqWBUUTmLNjjjGdSuiOw2MgvZdKH1
	UXOhx3F/q8PmMWdRE5ZITfQzGUrP93hHiRz+xPGLlmHCsfqt/MBi+Y5I0yl07uyWwf8L
	+7Ne0AA73I1gdnlBA1taMFVuk7XpTiUsAU+BUKpdvGODFXVgrCTeaSUxGKXaovhS1EJQ
	2W1pPW9kIighV9ZHaqHGBaWlQ/Gtqwl0QhUf44w56WlHpVtqQ3l98uDmVDt55uPTxU+1
	/91w==
Received: by 10.216.132.156 with SMTP id o28mr633893wei.141.1346915052014;
	Thu, 06 Sep 2012 00:04:12 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm2758973wib.6.2012.09.06.00.04.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 00:04:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <698f0ce085fc3bcdb6798f26916dbd2c450b5e1f.1346905978.git.raj.khem@gmail.com>
Date: Thu, 6 Sep 2012 09:04:10 +0200
Message-Id: <691C34E1-3DE3-4663-99CA-333D3033B92D@dominion.thruhere.net>
References: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
	<698f0ce085fc3bcdb6798f26916dbd2c450b5e1f.1346905978.git.raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkNqQmzdEDrh03MEbym19vWYNHSTX8JK9oDeO0WyU7V4cLWOCpqF7uPyb75JiL3UHFrsuEF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] gcc-4.7: Fix build for armv4/EABI and ppc/Os
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 07:16:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 06:35 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> arm patch is a forward port from OE/classic
> ppc patch should help in building images with Os

Can you add an Upstream-Status to both patches?

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.7.inc              |    4 ++-
> .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   29 =
++++++++++++++++++++
> .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   21 =
++++++++++++++
> 3 files changed, 53 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc =
b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index affbd54..b455b28 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
> require gcc-common.inc
>=20
> -PR =3D "r11"
> +PR =3D "r12"
>=20
> # Third digit in PV should be incremented after a minor release
> # happens from this branch on gcc e.g. currently its 4.7.1
> @@ -75,6 +75,8 @@ SRC_URI =3D =
"svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH};protocol=3Dhttp \
> 	   file://fix-g++-sysroot.patch \
> 	   file://disablesdt.patch \
> 	   file://libtool.patch \
> +	   file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
> +	   file://ppc_no_crtsavres.patch \
> 	  "
>=20
> S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch =
b/meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
> new file mode 100644
> index 0000000..6cd645a
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
> @@ -0,0 +1,29 @@
> +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> +the option is not passed to linker when chosing march=3Darmv4
> +This patch redefines this in linux-eabi.h and reinserts it
> +for eabi defaulting toolchains.
> +
> +We might want to send it upstream
> +
> +-Khem
> +Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-08-21 =
22:54:12.448453417 -0700
> ++++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-08-21 =
23:05:18.008478722 -0700
> +@@ -78,10 +78,14 @@
> +      %{mfloat-abi=3Dsoft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
> +      %{!mfloat-abi=3D*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
> +=20
> ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> ++#undef TARGET_FIX_V4BX_SPEC
> ++#define TARGET_FIX_V4BX_SPEC =
"%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstrongarm*|march=3Darmv4: =
--fix-v4bx}"
> ++
> + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> +    use the GNU/Linux version, not the generic BPABI version.  */
> + #undef  LINK_SPEC
> +-#define LINK_SPEC BE8_LINK_SPEC						=
\
> ++#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC			=
\
> +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				=
\
> + 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> +=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch =
b/meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
> new file mode 100644
> index 0000000..88684d3
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
> @@ -0,0 +1,21 @@
> +--- a/gcc/config/rs6000/sysv4.h
> ++++ b/gcc/config/rs6000/sysv4.h
> +@@ -246,13 +246,13 @@ do {							=
		\
> +=20
> + /* Define cutoff for using external functions to save floating =
point.
> +    When optimizing for size, use external functions when profitable. =
 */
> +-#define FP_SAVE_INLINE(FIRST_REG) (optimize_size			=
\
> ++#define FP_SAVE_INLINE(FIRST_REG) (1 || (optimize_size			=
\
> + 				   ? ((FIRST_REG) =3D=3D 62			=
\
> + 				      || (FIRST_REG) =3D=3D 63)		=
\
> +-				   : (FIRST_REG) < 64)
> ++				   : (FIRST_REG) < 64))
> + /* And similarly for general purpose registers.  */
> +-#define GP_SAVE_INLINE(FIRST_REG) ((FIRST_REG) < 32	\
> +-				   && !optimize_size)
> ++#define GP_SAVE_INLINE(FIRST_REG) (1 || ((FIRST_REG) < 32	\
> ++				   && !optimize_size))
> +=20
> + /* Put jump tables in read-only memory, rather than in .text.  */
> + #define JUMP_TABLES_IN_TEXT_SECTION 0
> +
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



