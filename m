Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id DBC176013D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 04:55:25 +0000 (UTC)
Received: by pdea3 with SMTP id a3so59283658pde.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Apr 2015 21:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZUtSGwzNGONSyq3PY8yccRA6eGveNVQAAUOJz7rX6xc=;
	b=wL0GDLxiX4fhjxf5a3Pr1PM5eYmo+QnoKeKDOw5737h8gdXv5/ZZ5difxTWEZtd7b3
	7gug4VQgMmSwMwH1KO384k6mLrfBC/BsZt338ydOV7K9tOMY3bQ3e4kWN0CUVfFtFnav
	nawyzyCFEAIwkS+SSUcuJJv0dSw0QiUK3nCq0g2YAnndrXIEfIxx0jlhWRcauLdayEv2
	uFQtTz5ZY5aY3wKi/rjyLsRSxAOW16yCMCbiIOOQer5oErqNwrZFIvQGBTBQkes8P5Q/
	c2wb7svfYZ4ayzH9sChBOiAYrJmXL7Lm+VTzSIyxcY9GWf/J7Km35f7w6/V1PBWs3NZj
	Squg==
X-Received: by 10.70.102.8 with SMTP id fk8mr1189974pdb.141.1428036926615;
	Thu, 02 Apr 2015 21:55:26 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:28e4:4276:9c7a:df6b?
	([2601:9:3580:84c:28e4:4276:9c7a:df6b])
	by mx.google.com with ESMTPSA id xt9sm6766230pbc.14.2015.04.02.21.55.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 Apr 2015 21:55:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1427414112.14020.170.camel@linuxfoundation.org>
Date: Thu, 2 Apr 2015 21:55:24 -0700
Message-Id: <DBE02995-FD6A-409B-944C-D14DB4A56925@gmail.com>
References: <1427414112.14020.170.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Tweak arm multilib endian patch for baremetal
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
X-List-Received-Date: Fri, 03 Apr 2015 04:55:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 26, 2015, at 4:55 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> In a baremetal build, TARGET_ENDIAN_OPTION isn't set leading to build
> failures. Add in ifdefs to avoid this.
>=20

We should define it in=20

gcc/config/arm/linux-eabi.h

something like

diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
index 048a062..05f01ca 100644
--- a/gcc/config/arm/linux-eabi.h
+++ b/gcc/config/arm/linux-eabi.h
@@ -51,8 +51,12 @@
    config.gcc for big endian configurations.  */
 #undef  TARGET_LINKER_EMULATION
 #if TARGET_BIG_ENDIAN_DEFAULT
+#define TARGET_ENDIAN_DEFAULT    MASK_BIG_END
+#define TARGET_ENDIAN_OPTION     "mbig-endian"
 #define TARGET_LINKER_EMULATION "armelfb_linux_eabi"
 #else
+#define TARGET_ENDIAN_DEFAULT    0
+#define TARGET_ENDIAN_OPTION     "mlittle-endian"
 #define TARGET_LINKER_EMULATION "armelf_linux_eabi"
 #endif

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch =
b/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch
> index ba0a227..37c46fc 100644
> --- =
a/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch
> @@ -11,26 +11,34 @@ Upstream-Status: Pending
>  gcc/config/arm/linux-elf.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> -Index: gcc-4.9-20140316/gcc/config/arm/coff.h
> +Index: gcc-4.9.2/gcc/config/arm/coff.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config/arm/coff.h
> -+++ gcc-4.9-20140316/gcc/config/arm/coff.h
> -@@ -33,7 +33,7 @@
> +--- gcc-4.9.2.orig/gcc/config/arm/coff.h
> ++++ gcc-4.9.2/gcc/config/arm/coff.h
> +@@ -32,8 +32,11 @@
> + #define TARGET_DEFAULT (MASK_APCS_FRAME)
>=20
>  #ifndef MULTILIB_DEFAULTS
> ++#ifndef TARGET_ENDIAN_OPTION
> ++#define TARGET_ENDIAN_OPTION "mlittle-endian"
> ++#endif
>  #define MULTILIB_DEFAULTS \
> -  { "marm", "mlittle-endian", "mfloat-abi=3Dsoft", =
"mno-thumb-interwork" }
> +  { "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=3Dsoft", =
"mno-thumb-interwork" }
>  #endif
>  =0C
>  /* This is COFF, but prefer stabs.  */
> -Index: gcc-4.9-20140316/gcc/config/arm/elf.h
> +Index: gcc-4.9.2/gcc/config/arm/elf.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.9-20140316.orig/gcc/config/arm/elf.h
> -+++ gcc-4.9-20140316/gcc/config/arm/elf.h
> -@@ -112,7 +112,7 @@
> +--- gcc-4.9.2.orig/gcc/config/arm/elf.h
> ++++ gcc-4.9.2/gcc/config/arm/elf.h
> +@@ -116,8 +116,11 @@
> + #endif
>=20
>  #ifndef MULTILIB_DEFAULTS
> ++#ifndef TARGET_ENDIAN_OPTION
> ++#define TARGET_ENDIAN_OPTION "mlittle-endian"
> ++#endif
>  #define MULTILIB_DEFAULTS \
> -  { "marm", "mlittle-endian", "mfloat-abi=3Dsoft", =
"mno-thumb-interwork", "fno-leading-underscore" }
> +  { "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=3Dsoft", =
"mno-thumb-interwork", "fno-leading-underscore" }
>=20
>=20


