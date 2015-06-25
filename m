Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A3DA9605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 08:56:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97740973"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 17:00:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P8sOaR019555
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 16:54:24 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Jun 2015 16:56:01 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 16:55:53 +0800
Message-ID: <1435222553-1609-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] util-linux: add user uuidd and group uuidd
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
X-List-Received-Date: Thu, 25 Jun 2015 08:56:08 -0000
Content-Type: text/plain

it is need to start uuidd.service.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 60309a5..0d3c742 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
-inherit autotools gettext pkgconfig systemd update-alternatives python-dir
+inherit autotools gettext pkgconfig systemd update-alternatives python-dir useradd
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
@@ -171,6 +171,13 @@ do_install_append_class-native () {
 	rm -f ${D}${base_sbindir}/nologin
 }
 
+USERADD_PACKAGES = "${PN}-uuidd"
+FILES_util-linux-uuidd += "/var/lib/libuuid /var/uuidd"
+
+USERADD_PARAM_${PN}-uuidd = "-r -d /var/lib/libuuid -M \
+                        -s /sbin/nologin -g uuidd uuidd"
+GROUPADD_PARAM_${PN}-uuidd = "-f -r uuidd"
+
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
@@ -260,3 +267,17 @@ python populate_packages_prepend() {
                       description='util-linux lib%s',
                       extra_depends='', prepend=True, allow_links=True)
 }
+
+pkg_postinst_${PN}-uuidd () {
+    if [ "x$D" != "x" ]; then
+        OPTS="--root=$D"
+        if type systemctl >/dev/null 2>/dev/null; then
+            systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+        fi
+        exit 1
+    fi
+
+    chown uuidd.uuidd ${sbindir}/uuidd
+    chmod g+s ${libdir}/libuuid
+}
+
-- 
1.8.4.2

