Return-Path: <prvs=693446f18=Mikko.Rapeli@bmw.de>
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 068D06E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 06:33:56 +0000 (UTC)
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 15 Sep 2015 08:33:56 +0200
Received: from unknown (HELO esabb2.muc) ([160.50.100.34]) by esagw2.muc with
	ESMTP/TLS; 15 Sep 2015 08:33:55 +0200
Received: from smuch54b.muc (HELO SMUCH54B.europe.bmw.corp) ([160.46.137.112])
	by esabb2.muc with ESMTP/TLS; 15 Sep 2015 08:33:41 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH54B.europe.bmw.corp ([160.46.137.112]) with mapi id 14.03.0248.002;
	Tue, 15 Sep 2015 08:33:40 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 02/12] hostap-utils: Use C99 stddefs in
	defining local typedefs
Thread-Index: AQHQ74B1azg272f4V0WUnPO2a1TLOA==
Date: Tue, 15 Sep 2015 06:33:40 +0000
Message-ID: <20150915062937.GN9460@loska>
References: <cover.1442248108.git.raj.khem@gmail.com>
	<2e8b33d5ff6928987dde0b059cd7403fc32a2e0b.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <2e8b33d5ff6928987dde0b059cd7403fc32a2e0b.1442248108.git.raj.khem@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/12] hostap-utils: Use C99 stddefs in defining local typedefs
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
X-List-Received-Date: Tue, 15 Sep 2015 06:33:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB9CBDCF7416C34F9B0396A91FE28948@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2015 at 04:31:17PM +0000, Khem Raj wrote:
> The code is creating more abstract types which is nice however it should
> be using standard defines from stdint.h and not random defines to base
> its own type system

These types are not random. They are standard Linux kernel types used by he=
aders
exported to userspace and their definitions come from <linux/types.h>.
These headers should not depend on libc headers like stdint.h.

Also, this file is actually a convenience copy of <linux/wireless.h> which =
should
be used directly instead.

-Mikko

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch | 36 ++++++++++++++++=
++++++
>  meta/recipes-bsp/hostap/hostap-utils.inc           |  4 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Defin=
e-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
>=20
> diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-=
__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch b/meta/recipes-bsp/hostap/ho=
stap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.=
patch
> new file mode 100644
> index 0000000..b44dca3
> --- /dev/null
> +++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-_=
_u16-__s16-__u8-in-terms-of-c99-t.patch
> @@ -0,0 +1,36 @@
> +From 742fb110d9841a04b3ced256b0bf80ff304dcaff Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 31 Aug 2015 05:45:08 +0000
> +Subject: [PATCH] Define _u32/__s32/__u16/__s16/__u8 in terms of c99 type=
s
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + wireless_copy.h | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/wireless_copy.h b/wireless_copy.h
> +index 8208258..1171a35 100644
> +--- a/wireless_copy.h
> ++++ b/wireless_copy.h
> +@@ -86,11 +86,11 @@
> + #else
> + #include <sys/types.h>
> + #include <net/if.h>
> +-typedef __uint32_t __u32;
> +-typedef __int32_t __s32;
> +-typedef __uint16_t __u16;
> +-typedef __int16_t __s16;
> +-typedef __uint8_t __u8;
> ++typedef u_int32_t __u32;
> ++typedef int32_t __s32;
> ++typedef u_int16_t __u16;
> ++typedef int16_t __s16;
> ++typedef u_int8_t __u8;
> + #ifndef __user
> + #define __user
> + #endif /* __user */
> +--=20
> +2.5.1
> +
> diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc b/meta/recipes-bsp/=
hostap/hostap-utils.inc
> index 89d977a..140321d 100644
> --- a/meta/recipes-bsp/hostap/hostap-utils.inc
> +++ b/meta/recipes-bsp/hostap/hostap-utils.inc
> @@ -10,7 +10,9 @@ SECTION =3D "kernel/userland"
>  PR =3D "r4"
> =20
>  SRC_URI =3D "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz=
 \
> -	   file://hostap-fw-load.patch"
> +           file://hostap-fw-load.patch \
> +           file://0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c9=
9-t.patch \
> +"
>  S =3D "${WORKDIR}/hostap-utils-${PV}"
> =20
>  BINARIES =3D "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_deb=
ug \
> --=20
> 2.5.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

