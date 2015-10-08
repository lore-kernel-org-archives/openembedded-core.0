Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF3876536
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:46:32 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so56959368pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3vaKRatx1C8e5gbatdsY0b4jOvXfEQj84gfJOy6tuVQ=;
	b=VoCV0DhuDNWsSEhNGQZXAhMxhi3Y7YDMGQpc3TDmh7rkwcl8QaZPk6ylt7UI6iXxl/
	wGYphPFAESFH2+AUhHiER8jINxVV1aVQLXJ/Y0PifVrBF1Aj5w4mK+XsaDRH7hgSH3Ld
	qHfBw8x2IlBlvsvwSHXVGX+26Q60H+tVXnqPnkRJO4S3q12GDKIQO1lBNKAJi12np0QP
	WMMTb26i51U2x4sNRCjV/iG0zHFQlqa1ZIbM/sqX0TbAy8NUo5jvyEtk8RPaCVwzgoQm
	tG77VwptEK+CdQfo/oJXicDw0BlwJ2mSslFs+vbq2MCxvzDHW2mBB62h1MBlp4f5ldVT
	EA6w==
X-Received: by 10.68.238.69 with SMTP id vi5mr8581420pbc.29.1444315592798;
	Thu, 08 Oct 2015 07:46:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:9193:ceb1:996f:8b04?
	([2601:646:8601:4580:9193:ceb1:996f:8b04])
	by smtp.gmail.com with ESMTPSA id
	vv9sm45894808pbc.95.2015.10.08.07.46.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 07:46:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
Date: Thu, 8 Oct 2015 07:46:27 -0700
Message-Id: <9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
X-Mailer: Apple Mail (2.3095)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Thu, 08 Oct 2015 14:46:37 -0000
X-Groupsio-MsgNum: 72010
Content-Type: multipart/signed;
	boundary="Apple-Mail=_29DD49F5-5570-4622-8807-D8DB99A2DD26";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_29DD49F5-5570-4622-8807-D8DB99A2DD26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 8, 2015, at 7:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>=20
>=20
> [Icedtee Ticket #2153] -- see =
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D2153
>=20
> This patch prevents gcc generate code on ARM5e accessing 64 bit =
values, because gcc doesn't ensure they're 64 bit aligned.
> Accessing a 64 bit value from a 32 bit alignment causes segmentation =
faults.
>=20
> Patch is taken from =
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/gcc/0001-ARMv5-=
disable-LDRD-STRD.patch

Can you try using -mfix-cortex-m3-ldrd, does that help ?
The patch is a workaround to gcc, as it seems real problem is in =
defining instruction constraints
please open a gcc bug for this.

>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
> .../gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch | 24 =
++++++++++++++++++++++
> meta/recipes-devtools/gcc/gcc-5.2.inc              |  1 +
> .../gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch | 24 =
++++++++++++++++++++++
> 4 files changed, 50 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc =
b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 691ba5f..9a1b44e 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -80,6 +80,7 @@ SRC_URI =3D "\
>     =
file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
>     file://0063-nativesdk-gcc-support.patch \
>     file://0064-handle-target-sysroot-multilib.patch \
> +    file://0065-ARMv5-disable-LDRD-STRD.patch \
> "
> SRC_URI[md5sum] =3D "6f831b4d251872736e8e9cc09746f327"
> SRC_URI[sha256sum] =3D =
"2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch =
b/meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch
> new file mode 100644
> index 0000000..68fe3b9
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.9/0065-ARMv5-disable-LDRD-STRD.patch
> @@ -0,0 +1,24 @@
> +=46rom b1884b6d1950422a32f9ced0be6d5492e4315547 Mon Sep 17 00:00:00 =
2001
> +From: Kevin Mihelich <kevin@archlinuxarm.org>
> +Date: Wed, 7 Jan 2015 18:43:57 -0700
> +Subject: [PATCH] ARMv5: disable LDRD/STRD
> +
> +---
> + gcc/config/arm/arm.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
> +index c60d9a4..65c60b9 100644
> +--- a/gcc/config/arm/arm.h
> ++++ b/gcc/config/arm/arm.h
> +@@ -282,7 +282,7 @@ extern void =
(*arm_lang_output_object_attributes_hook)(void);
> + /* Thumb-1 only.  */
> + #define TARGET_THUMB1_ONLY		(TARGET_THUMB1 && =
!arm_arch_notm)
> +
> +-#define TARGET_LDRD			(arm_arch5e && =
ARM_DOUBLEWORD_ALIGN \
> ++#define TARGET_LDRD			(arm_arch6 && =
ARM_DOUBLEWORD_ALIGN \
> +                                          && !TARGET_THUMB1)
> +
> + #define TARGET_CRC32			(arm_arch_crc)
> +--
> +2.2.1
> diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc =
b/meta/recipes-devtools/gcc/gcc-5.2.inc
> index f6673e6..044e8ae 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
> @@ -73,6 +73,7 @@ SRC_URI =3D "\
>            =
file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
>            file://0040-nativesdk-gcc-support.patch \
>            file://0041-handle-target-sysroot-multilib.patch \
> +           file://0042-ARMv5-disable-LDRD-STRD.patch \
>           "
>=20
> BACKPORTS =3D ""
> diff --git =
a/meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch =
b/meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch
> new file mode 100644
> index 0000000..68fe3b9
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-5.2/0042-ARMv5-disable-LDRD-STRD.patch
> @@ -0,0 +1,24 @@
> +=46rom b1884b6d1950422a32f9ced0be6d5492e4315547 Mon Sep 17 00:00:00 =
2001
> +From: Kevin Mihelich <kevin@archlinuxarm.org>
> +Date: Wed, 7 Jan 2015 18:43:57 -0700
> +Subject: [PATCH] ARMv5: disable LDRD/STRD
> +
> +---
> + gcc/config/arm/arm.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
> +index c60d9a4..65c60b9 100644
> +--- a/gcc/config/arm/arm.h
> ++++ b/gcc/config/arm/arm.h
> +@@ -282,7 +282,7 @@ extern void =
(*arm_lang_output_object_attributes_hook)(void);
> + /* Thumb-1 only.  */
> + #define TARGET_THUMB1_ONLY		(TARGET_THUMB1 && =
!arm_arch_notm)
> +
> +-#define TARGET_LDRD			(arm_arch5e && =
ARM_DOUBLEWORD_ALIGN \
> ++#define TARGET_LDRD			(arm_arch6 && =
ARM_DOUBLEWORD_ALIGN \
> +                                          && !TARGET_THUMB1)
> +
> + #define TARGET_CRC32			(arm_arch_crc)
> +--
> +2.2.1
> --
> 2.4.3
>=20
> --
> Jens Rehsack - rehsack@gmail.com
>=20


--Apple-Mail=_29DD49F5-5570-4622-8807-D8DB99A2DD26
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYWgccACgkQuwUzVZGdMxRiLwCfdanTiEnkFR+qn41QBJ3qybtm
sCQAn38HMhWVdSnLyOf8aXdvAhMXeCDw
=HvCO
-----END PGP SIGNATURE-----

--Apple-Mail=_29DD49F5-5570-4622-8807-D8DB99A2DD26--
