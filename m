Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC8B7F2A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0831718487;
	Thu,  5 Sep 2019 15:53:53 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id MPskD4ybXStR; Thu,  5 Sep 2019 15:53:48 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 92E2518508;
	Thu,  5 Sep 2019 15:53:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C7C61E0DD;
	Thu,  5 Sep 2019 15:53:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 309E91E0DF;
	Thu,  5 Sep 2019 15:53:48 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  5 Sep 2019 15:53:48 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 24DBA2858;
	Thu,  5 Sep 2019 15:53:48 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by XBOX02.axis.com (10.0.5.16)
	with Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 5 Sep 2019 15:53:47 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Thu, 5 Sep 2019 15:53:47 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] mdadm: fix do_package failed when changed
	local.conf but not cleaned
Thread-Index: AQHVY9vTsXtoEVNc90y9dMMTzrKRgacdGj+Q
Date: Thu, 5 Sep 2019 13:53:47 +0000
Message-ID: <7e606b1fc76248459bdcc7b3d365ebcc@xbox06.axis.com>
References: <1567682351-87682-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1567682351-87682-1-git-send-email-changqing.li@windriver.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] mdadm: fix do_package failed when changed	local.conf but not cleaned
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
X-List-Received-Date: Thu, 05 Sep 2019 13:53:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> changqing.li@windriver.com
> Sent: den 5 september 2019 13:19
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] mdadm: fix do_package failed when changed
> local.conf but not cleaned
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> reproduce steps:
> 1. add DISTRO_FEATURE_append =3D 'usrmerge' in local.conf
> 2. bitbake mdadm --success
> 3. remove DISTRO_FEATURE_append =3D 'usrmerge' from local.conf
> 4. bitbake mdadm  -- failed when do_package
>=20
> it is not proper to change source Makefile during do_compile by sed,
> change to add patch for it.
>=20
> [YOCTO: #13493]
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../mdadm/files/0001-mdadm-support-usrmerge.patch  | 46
> ++++++++++++++++++++++
>  meta/recipes-extended/mdadm/mdadm_4.1.bb           |  7 ++--
>  2 files changed, 50 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-
> support-usrmerge.patch
>=20
> diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-support-
> usrmerge.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-support-
> usrmerge.patch
> new file mode 100644
> index 0000000..f1aa119
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-mdadm-support-
> usrmerge.patch
> @@ -0,0 +1,46 @@
> +From 2c7ccea05d7cf9dde48d735faa511d1b06c14878 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Sep 2019 18:03:11 +0800
> +Subject: [PATCH] mdadm: support usrmerge
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 4839001..466e960 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -88,7 +88,7 @@ MAP_PATH =3D $(MAP_DIR)/$(MAP_FILE)
> + MDMON_DIR =3D $(RUN_DIR)
> + # place for autoreplace cookies
> + FAILED_SLOTS_DIR =3D $(RUN_DIR)/failed-slots
> +-SYSTEMD_DIR=3D/lib/systemd/system
> ++SYSTEMD_DIR=3D${SYSTEMD_UNITDIR}/system
> + LIB_DIR=3D/usr/libexec/mdadm
> +
> + COROSYNC:=3D$(shell [ -f $(SYSROOT)/usr/include/corosync/cmap.h ] ||
> echo -DNO_COROSYNC)
> +@@ -120,7 +120,7 @@ LDLIBS=3D-ldl
> +
> + INSTALL =3D /usr/bin/install
> + DESTDIR =3D
> +-BINDIR  =3D /sbin
> ++BINDIR  =3D ${BASE_SBINDIR}
> + MANDIR  =3D /usr/share/man
> + MAN4DIR =3D $(MANDIR)/man4
> + MAN5DIR =3D $(MANDIR)/man5
> +@@ -128,7 +128,7 @@ MAN8DIR =3D $(MANDIR)/man8
> +
> + UDEVDIR :=3D $(shell $(PKG_CONFIG) --variable=3Dudevdir udev 2>/dev/nul=
l)
> + ifndef UDEVDIR
> +- UDEVDIR =3D /lib/udev
> ++ UDEVDIR =3D ${NONARCH_BASE_LIBDIR}/udev
> + endif
> +
> + ifeq (,$(findstring s,$(MAKEFLAGS)))
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-
> extended/mdadm/mdadm_4.1.bb
> index 74c94f6..efeb09d 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>  	   file://mdadm.init \
>  	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.pat=
ch \
>             file://include_sysmacros.patch \
> +           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://000=
1-mdadm-support-usrmerge.patch','',d)} \

Since the patch will work regardless of whether usrmerge is enabled=20
or not, I think it is better to always apply it. The same goes for=20
the corresponding path for bootchart2.

>             "
>  SRC_URI[md5sum] =3D "51bf3651bd73a06c413a2f964f299598"
>  SRC_URI[sha256sum] =3D "ab7688842908d3583a704d491956f31324c3a5fc9f6a0465=
3cb75d19f1934f4a"
> @@ -41,13 +42,13 @@ CFLAGS_append_powerpc64 =3D ' -D__SANE_USERSPACE_TYPE=
S__'
>  CFLAGS_append_mipsarchn64 =3D ' -D__SANE_USERSPACE_TYPES__'
>  CFLAGS_append_mipsarchn32 =3D ' -D__SANE_USERSPACE_TYPES__'
>=20
> -EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CXFLAGS=3D"${CFLAGS}"'
> +EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CXFLAGS=3D"${CFLAGS}" BASE_SBINDIR=
=3D"${base_sbindir}" \
> +                NONARCH_BASE_LIBDIR=3D"${nonarch_base_libdir}" \
> +                SYSTEMD_UNITDIR=3D"${systemd_unitdir}"'
>=20
>  DEBUG_OPTIMIZATION_append =3D " -Wno-error"
>=20
>  do_compile() {
> -	# Point to right sbindir
> -	sed -i -e "s;BINDIR  =3D /sbin;BINDIR =3D $base_sbindir;" -e "s;UDEVDIR=
 =3D /lib;UDEVDIR =3D $nonarch_base_libdir;" -e "s;SYSTEMD_DIR=3D/lib/syste=
md/system;SYSTEMD_DIR=3D${systemd_unitdir}/system;" ${S}/Makefile
>  	oe_runmake SYSROOT=3D"${STAGING_DIR_TARGET}"
>  }
>=20
> --
> 2.7.4

//Peter


