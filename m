Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id B497E606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 07:53:49 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so220102496pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=S+zlBcJflbSD7v7/XDpiaWbVxLXTvA2v4IMRSwiOsb0=;
	b=oNu3DJ77DAj6lk2HaWfaetq+N87MYZ7COQl0X+sI9dFhV6pTwSxgvhZMaZXld1tiV4
	OFYbv0iN3DzHwDA7cTgmtcqnKHTc1c650Z/YKon7E9aMfu0H+s37eeSPaTkjwWglDvf6
	cpVo8XGGHo5pqlh8oFJio0yphRYVlVAcOjVTw10DBuLBLRMIncazeoaBQmCfP0PkqPsQ
	mR1P7hzZvN+Y/IWfuchRLko4WpVHfW72ZlOv3gMDRPz72mdyORf2yjHwGcgzHZeS/PLl
	LqXvS72QKKUeMoJGH9wzT1ZfqF1CZ+m8t3zSi/d9efGjCaSZgVaL1lgxGwEBJVPh/Nkc
	T+1Q==
X-Received: by 10.98.15.68 with SMTP id x65mr78833416pfi.146.1448956430113;
	Mon, 30 Nov 2015 23:53:50 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:1d08:52b6:b188:1466?
	([2601:646:8802:5d5c:1d08:52b6:b188:1466])
	by smtp.gmail.com with ESMTPSA id
	s6sm55839719pfi.21.2015.11.30.23.53.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 23:53:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1448570585-13334-1-git-send-email-marex@denx.de>
Date: Mon, 30 Nov 2015 23:53:46 -0800
Message-Id: <C6BF64E1-46B1-4086-974F-F2F57B84484A@gmail.com>
References: <1448570585-13334-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3112)
Cc: Walter Goossens <waltergoossens@home.nl>, Ley Foon Tan <lftan@altera.com>,
	Thomas Chou <thomas@wytron.com.tw>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Add nios2 support
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
X-List-Received-Date: Tue, 01 Dec 2015 07:53:50 -0000
X-Groupsio-MsgNum: 74159
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1470DFAD-BC4B-48AB-8369-F961D4EC603F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1470DFAD-BC4B-48AB-8369-F961D4EC603F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 26, 2015, at 12:43 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> Add the necessary bits for nios2 support into cmake.

This is ok.

>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Ley Foon Tan <lftan@altera.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Thomas Chou <thomas@wytron.com.tw>
> Cc: Walter Goossens <waltergoossens@home.nl>
> ---
> meta/recipes-devtools/cmake/cmake.inc              |  1 +
> .../cmake/cmake/0001-Add-NIOS2-CPU-support.patch   | 50 =
++++++++++++++++++++++
> 2 files changed, 51 insertions(+)
> create mode 100644 =
meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake.inc =
b/meta/recipes-devtools/cmake/cmake.inc
> index 57e93ac..f43327e 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION =3D =
"${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
> SRC_URI =3D =
"http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>            file://support-oe-qt4-tools-names.patch \
>            file://qt4-fail-silent.patch \
> +           file://0001-Add-NIOS2-CPU-support.patch \
>            "
>=20
> SRC_URI[md5sum] =3D "52638576f4e1e621fed6c3410d3a1b12"
> diff --git =
a/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch =
b/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
> new file mode 100644
> index 0000000..6e0ab9f
> --- /dev/null
> +++ =
b/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
> @@ -0,0 +1,50 @@
> +=46rom 3f8c3d3011ea192da2c761560b615f55763715ef Mon Sep 17 00:00:00 =
2001
> +From: Marek Vasut <marex@denx.de>
> +Date: Thu, 26 Nov 2015 21:31:04 +0100
> +Subject: [PATCH] Add NIOS2 CPU support
> +
> +Add necessary bits to support the NIOS2 little-endian CPU.
> +
> +Signed-off-by: Marek Vasut <marex@denx.de>
> +Cc: Ley Foon Tan <lftan@altera.com>
> +Cc: Thomas Chou <thomas@wytron.com.tw>
> +Cc: Walter Goossens <waltergoossens@home.nl>
> +Upstream-Status: Submitted
> +---
> + Source/kwsys/CPU.h.in    | 4 ++++
> + Utilities/KWIML/ABI.h.in | 4 ++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/Source/kwsys/CPU.h.in b/Source/kwsys/CPU.h.in
> +index 884d71a..66ffbb1 100644
> +--- a/Source/kwsys/CPU.h.in
> ++++ b/Source/kwsys/CPU.h.in
> +@@ -88,6 +88,10 @@
> + #elif defined(__mips) || defined(__mips__) || defined(__MIPS__)
> + # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID =
@KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
> +
> ++/* NIOS2 */
> ++#elif defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
> ++# define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID =
@KWSYS_NAMESPACE@_CPU_ENDIAN_ID_LITTLE
> ++
> + /* OpenRISC 1000 */
> + #elif defined(__or1k__)
> + # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID =
@KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
> +diff --git a/Utilities/KWIML/ABI.h.in b/Utilities/KWIML/ABI.h.in
> +index 6300ada..87b6e96 100644
> +--- a/Utilities/KWIML/ABI.h.in
> ++++ b/Utilities/KWIML/ABI.h.in
> +@@ -398,6 +398,10 @@ suppression macro @KWIML@_ABI_NO_VERIFY was =
defined.
> + #elif defined(__mips) || defined(__mips__) || defined(__MIPS__)
> + # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
> +
> ++/* NIOS2 */
> ++#elif defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
> ++# define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_LITTLE
> ++
> + /* OpenRISC 1000 */
> + #elif defined(__or1k__)
> + # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
> +--
> +2.6.2
> +
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_1470DFAD-BC4B-48AB-8369-F961D4EC603F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZdUg4ACgkQuwUzVZGdMxSvpACdHI69g1jMTMONrFIuVKbc4r1C
KXYAoIqN2APYKgpZyVjQGl4A3NzIC0w1
=+T6x
-----END PGP SIGNATURE-----

--Apple-Mail=_1470DFAD-BC4B-48AB-8369-F961D4EC603F--
