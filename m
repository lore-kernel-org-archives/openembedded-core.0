Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31B6973E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 04:54:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99984029"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2015 12:57:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7P4sRqA010513
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 12:54:28 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Tue, 25 Aug 2015 12:54:33 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] util-linux: add user uuidd and group uuidd
Thread-Index: AQHQryTDa6P9KKJGMEWd+SWJBRVzlJ4chdgw
Date: Tue, 25 Aug 2015 04:54:33 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBCC59@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1435222553-1609-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1435222553-1609-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [PATCH] util-linux: add user uuidd and group uuidd
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
X-List-Received-Date: Tue, 25 Aug 2015 04:54:46 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Ping

Thanks
>-----Original Message-----
>From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Sent: Thursday, June 25, 2015 4:56 PM
>To: openembedded-core@lists.openembedded.org
>Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Subject: [OE-core][PATCH] util-linux: add user uuidd and group uuidd
>
>it is need to start uuidd.service.
>
>Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>---
> meta/recipes-core/util-linux/util-linux.inc | 23 ++++++++++++++++++++++-
> 1 file changed, 22 insertions(+), 1 deletion(-)
>
>diff --git a/meta/recipes-core/util-linux/util-linux.inc
>b/meta/recipes-core/util-linux/util-linux.inc
>index 60309a5..0d3c742 100644
>--- a/meta/recipes-core/util-linux/util-linux.inc
>+++ b/meta/recipes-core/util-linux/util-linux.inc
>@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D
>"file://README.licensing;md5=3D1715f5ee3e01203ca1e1e0b9ee65918c
>
>file://libmount/COPYING;md5=3Dfb93f01d4361069c5616327705373b16 \
>
>file://libblkid/COPYING;md5=3Dfb93f01d4361069c5616327705373b16"
>
>-inherit autotools gettext pkgconfig systemd update-alternatives python-di=
r
>+inherit autotools gettext pkgconfig systemd update-alternatives
>+python-dir useradd
> DEPENDS =3D "zlib ncurses"
> DEPENDS_append_class-native =3D " lzo-native"
> DEPENDS_append_class-nativesdk =3D " lzo-native"
>@@ -171,6 +171,13 @@ do_install_append_class-native () {
> 	rm -f ${D}${base_sbindir}/nologin
> }
>
>+USERADD_PACKAGES =3D "${PN}-uuidd"
>+FILES_util-linux-uuidd +=3D "/var/lib/libuuid /var/uuidd"
>+
>+USERADD_PARAM_${PN}-uuidd =3D "-r -d /var/lib/libuuid -M \
>+                        -s /sbin/nologin -g uuidd uuidd"
>+GROUPADD_PARAM_${PN}-uuidd =3D "-f -r uuidd"
>+
> ALTERNATIVE_PRIORITY =3D "100"
>
> ALTERNATIVE_${PN}  =3D "dmesg kill more mkswap blockdev pivot_root
>switch_root"
>@@ -260,3 +267,17 @@ python populate_packages_prepend() {
>                       description=3D'util-linux lib%s',
>                       extra_depends=3D'', prepend=3DTrue, allow_links=3DT=
rue)  }
>+
>+pkg_postinst_${PN}-uuidd () {
>+    if [ "x$D" !=3D "x" ]; then
>+        OPTS=3D"--root=3D$D"
>+        if type systemctl >/dev/null 2>/dev/null; then
>+            systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>+        fi
>+        exit 1
>+    fi
>+
>+    chown uuidd.uuidd ${sbindir}/uuidd
>+    chmod g+s ${libdir}/libuuid
>+}
>+
>--
>1.8.4.2

