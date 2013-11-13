Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D17DF6D817
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:23:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD6N3BF001345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:23:03 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 22:23:02 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 14:23:03 +0800
Message-ID: <bec05c4e97e82a9de25b2bf8c9aa94337fe7eceb.1384323613.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384323613.git.Qi.Chen@windriver.com>
References: <cover.1384323613.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/7] udev: fix dependency and location of udevadm
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
X-List-Received-Date: Wed, 13 Nov 2013 06:23:01 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

As udev's init script needs udevadm, we should make udev RDEPEND on
udev-utils instead of just recommends it.

Also, move udevadm from /usr/bin to /bin. The purpose is to make udev
start correctly even if /usr is missing.

This patch also takes into consideration the situation of ${bindir}
and ${base_bindir} being the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev.inc |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 02cab3b..7667a79 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -55,7 +55,8 @@ INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev"
-RRECOMMENDS_${PN} += "udev-utils udev-cache"
+RRECOMMENDS_${PN} += "udev-cache"
+RDEPENDS_${PN} += "udev-utils"
 
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
@@ -72,7 +73,7 @@ FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libg
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-FILES_udev-utils = "${bindir}/udevadm"
+FILES_udev-utils = "${base_bindir}/udevadm"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
@@ -87,9 +88,14 @@ do_install_append () {
 	touch ${D}${sysconfdir}/udev/cache.data
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
-
 	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
 
+	if [ "${bindir}" != "${base_bindir}" ]; then
+	    install -d ${D}${base_bindir}
+	    mv ${D}${bindir}/udevadm ${D}${base_bindir}/udevadm
+	    rmdir ${D}${bindir}
+	fi
+
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
-- 
1.7.9.5


