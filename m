Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7177D6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 06:57:51 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so67695281pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=m+MfJeYocK2oPWYu6aK9E1xXn92gpww/zlOsdp1aK5s=;
	b=BYyijFrPD2d+9xNHMGALAXMbdW2lCzE/hWUdXZiR43kEV9yJaJJBpvUxolw/fNnTXr
	2S/ugprvYkbNFLLhEAmLGzOCYaHj7ZS7l0OqZrkfXT0bd/wvEOD2vsPNT8PVpKFhk0S1
	MOAbtctbiGa/nUwc4KBAQiqGvApx0hfASNpJpKUJXY/iwvLZlvgzYw/ATnpI5XS9c1lx
	5/gVD3RvnQI8wLDn2cNvMlOOw5FDBsZ1dQLPhLF/vQLsrROL4SSuw7/vYtor2lgm41pG
	KXrtfHnrjYIKmcbrvy4hCJJBjwGEOvIltvaSmQLS2CZ/XPzs0iIbjmRjZ53igECpvY+4
	jJWA==
X-Received: by 10.68.139.103 with SMTP id qx7mr16157952pbb.133.1428821872229; 
	Sat, 11 Apr 2015 23:57:52 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:192b:ba53:6c37:7889?
	([2601:9:3580:84c:192b:ba53:6c37:7889])
	by mx.google.com with ESMTPSA id x10sm3683284pas.5.2015.04.11.23.57.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Apr 2015 23:57:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428665669-16128-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 11 Apr 2015 23:57:50 -0700
Message-Id: <1EBE1238-F773-4755-9A9D-19CD1D473AD5@gmail.com>
References: <1428665669-16128-1-git-send-email-Martin.Jansa@gmail.com>
	<1428665669-16128-2-git-send-email-Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dylan][PATCH 2/2] binutils: backport patch to fix build with gcc-4.9
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
X-List-Received-Date: Sun, 12 Apr 2015 06:57:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 10, 2015, at 4:34 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> * backported from 2.23.2, fixes:
> =
work/x86_64-linux/binutils-native/2.23.1-r3/binutils-2.23.1/gas/write.c:40=
9:24:
>  error: 'dummy.fr_type' may be used uninitialized in this function =
[-Werror=3Dmaybe-uninitialized]
>   gas_assert (prev_frag->fr_type !=3D 0);
>                        ^
> =
work/x86_64-linux/binutils-native/2.23.1-r3/binutils-2.23.1/gas/write.c:39=
2:9: note: 'dummy' was declared here
>   fragS dummy, *prev_frag =3D &dummy;
>         ^
>=20

This is ok

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/recipes-devtools/binutils/binutils-2.23.1.inc |  1 +
> ...in_frchains_together_1-Reorder-assertion-.patch | 30 =
++++++++++++++++++++++
> 2 files changed, 31 insertions(+)
> create mode 100644 =
meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_togeth=
er_1-Reorder-assertion-.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc =
b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> index 7b3366a..6a6811b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> @@ -31,6 +31,7 @@ SRC_URI =3D "\
>      file://binutils-fix-over-array-bounds-issue.patch \
>      file://replace_macros_with_static_inline.patch \
>      =
file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
> +     =
file://0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch \
>      "
>=20
> BACKPORT =3D "\
> diff --git =
a/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_toge=
ther_1-Reorder-assertion-.patch =
b/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_toge=
ther_1-Reorder-assertion-.patch
> new file mode 100644
> index 0000000..ffe6852
> --- /dev/null
> +++ =
b/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains_toge=
ther_1-Reorder-assertion-.patch
> @@ -0,0 +1,30 @@
> +=46rom c50d883cb61ff9917464cb695a0fd83fdb0f9c20 Mon Sep 17 00:00:00 =
2001
> +From: Alan Modra <amodra@bigpond.net.au>
> +Date: Mon, 21 Jan 2013 13:48:31 +0000
> +Subject: [PATCH] write.c (chain_frchains_together_1): Reorder =
assertion to
> + avoid uninit warning.
> +
> +Upstream-Status: Backport from 2.23.2
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + gas/write.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gas/write.c b/gas/write.c
> +index a467147..56ebb6c 100644
> +--- a/gas/write.c
> ++++ b/gas/write.c
> +@@ -406,8 +406,8 @@ chain_frchains_together_1 (segT section, struct =
frchain *frchp)
> + 	  prev_fix =3D frchp->fix_tail;
> + 	}
> +     }
> +-  gas_assert (prev_frag->fr_type !=3D 0);
> +-  gas_assert (prev_frag !=3D &dummy);
> ++  gas_assert (prev_frag !=3D &dummy
> ++	      && prev_frag->fr_type !=3D 0);
> +   prev_frag->fr_next =3D 0;
> +   return prev_frag;
> + }
> +--=20
> +2.3.5
> +
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


