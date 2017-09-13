Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2297865A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 04CC22E241;
	Wed, 13 Sep 2017 17:26:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id vPZy1ZaBPQ43; Wed, 13 Sep 2017 17:26:55 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id EDC842E0B4;
	Wed, 13 Sep 2017 17:26:54 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C63301A075;
	Wed, 13 Sep 2017 17:26:54 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAF5D1A072;
	Wed, 13 Sep 2017 17:26:54 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 13 Sep 2017 17:26:54 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id AF41B4AE;
	Wed, 13 Sep 2017 17:26:54 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 13 Sep 2017 17:26:54 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 13 Sep 2017 17:26:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC][PATCH] recipes: replace runtime dependency on
	bash	with VIRTUAL-RUNTIME_bash
Thread-Index: AQHTLJ8hIZpITrtotEWtbw/G5M1QZqKy7xWw
Date: Wed, 13 Sep 2017 15:26:54 +0000
Message-ID: <db4ca86fa5444b1aba4b4910d99374c8@XBOX02.axis.com>
References: <20170913144851.18729-1-Martin.Jansa@gmail.com>
In-Reply-To: <20170913144851.18729-1-Martin.Jansa@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [RFC][PATCH] recipes: replace runtime dependency on bash	with VIRTUAL-RUNTIME_bash
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
X-List-Received-Date: Wed, 13 Sep 2017 15:26:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: den 13 september 2017 16:49
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC][PATCH] recipes: replace runtime dependency on
> bash with VIRTUAL-RUNTIME_bash
>=20
> * this allows to reliably replace bash with e.g. busybox
> * without this change the QA check can find bash as the provider
>   for /bin/bash if you build bash before some other recipe using
>   bash and then QA issue like this is shown:
>   ERROR: QA Issue: foo rdepends on bash, but it isn't a build dependency
>   , missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
>   even when the distro has bash enabled in busybox defconfig and
>   busybox RPROVIDES bash as well as /bin/bash, this is because the QA
>   check (and to some extend also the package-manager) doesn't know which
>   provider is prefered, so if bash isn't built at all in sysroot, it
>   will happily accept busybox as the provider, but when both are built
>   in sysroot, then bash is found first and QA error is shown.
> * more information in:
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9217
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                     | 3 ++-
>  meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb          | 3 ++-
>  meta/recipes-connectivity/openssl/openssl_1.1.0f.bb             | 3 ++-
>  meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb         | 3 ++-
>  meta/recipes-core/console-tools/console-tools_0.3.2.bb          | 3 ++-
>  meta/recipes-core/dbus/dbus-test_1.10.20.bb                     | 3 ++-
>  meta/recipes-core/glibc/glibc-scripts.inc                       | 3 ++-
>  meta/recipes-core/systemd/systemd_234.bb                        | 5 +++-=
-
>  meta/recipes-core/util-linux/util-linux.inc                     | 3 ++-
>  meta/recipes-devtools/apt/apt_1.2.24.bb                         | 3 ++-
>  meta/recipes-devtools/build-compare/build-compare_git.bb        | 3 ++-
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb             | 3 ++-
>  meta/recipes-devtools/flex/flex_2.6.0.bb                        | 3 ++-
>  meta/recipes-devtools/go/go-dep_0.3.0.bb                        | 3 ++-
>  meta/recipes-devtools/go/go-target.inc                          | 3 ++-
>  meta/recipes-devtools/libtool/libtool_2.4.6.bb                  | 3 ++-
>  meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb              | 3 ++-
>  meta/recipes-devtools/qemu/qemu.inc                             | 3 ++-
>  meta/recipes-devtools/qemu/qemu_2.10.0.bb                       | 3 ++-
>  meta/recipes-devtools/quilt/quilt.inc                           | 5 +++-=
-
>  meta/recipes-devtools/rpm/rpm_git.bb                            | 3 ++-
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb                | 3 ++-
>  meta/recipes-extended/hdparm/hdparm_9.52.bb                     | 3 ++-
>  meta/recipes-extended/mdadm/mdadm_4.0.bb                        | 3 ++-
>  meta/recipes-extended/parted/parted_3.2.bb                      | 3 ++-
>  meta/recipes-kernel/dtc/dtc.inc                                 | 3 ++-
>  meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb                  | 3 ++-
>  meta/recipes-kernel/perf/perf.bb                                | 9 ++++=
+----
>  meta/recipes-kernel/systemtap/systemtap_git.bb                  | 3 ++-
>  meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.4.bb        | 3 ++-
>  meta/recipes-support/apr/apr_1.6.2.bb                           | 3 ++-
>  meta/recipes-support/attr/acl_2.2.52.bb                         | 3 ++-
>  meta/recipes-support/source-highlight/source-highlight_3.1.8.bb | 3 ++-
>  33 files changed, 71 insertions(+), 38 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-b=
sp/pm-utils/pm-utils_1.4.1.bb
> index cac09101c4..d9dcde1aff 100644
> --- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> +++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> @@ -17,7 +17,8 @@ inherit pkgconfig autotools manpages
>=20
>  PACKAGECONFIG[manpages] =3D "--enable-doc, --disable-doc, libxslt-native=
 xmlto-native"
>=20
> -RDEPENDS_${PN} =3D "grep bash"
> +VIRTUAL-RUNTIME_bash ?=3D "bash"

Isn't it better to set the default once in=20
meta/conf/distro/include/default-providers.inc?

> +RDEPENDS_${PN} =3D "grep ${VIRTUAL-RUNTIME_bash}"
>=20
>  do_configure_prepend () {
>  	( cd ${S}; autoreconf -f -i -s )
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
> index d917c4d713..b0237a72a0 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D95f3a93a5c3c7888de623b46ea085a84"
>=20
>  # util-linux for libblkid
>  DEPENDS =3D "libcap libnfsidmap libevent util-linux sqlite3 libtirpc"
> -RDEPENDS_${PN} =3D "${PN}-client bash"
> +VIRTUAL-RUNTIME_bash ?=3D "bash"
> +RDEPENDS_${PN} =3D "${PN}-client ${VIRTUAL-RUNTIME_bash}"
>  RRECOMMENDS_${PN} =3D "kernel-module-nfsd"
>=20
>  inherit useradd
...

//Peter


