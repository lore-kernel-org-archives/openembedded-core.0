Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 243087E53A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 07:50:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7K7o1nj025964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2019 00:50:01 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 20 Aug 2019 00:50:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 20 Aug 2019 15:49:59 +0800
Message-ID: <1566287399-2447-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] util-linux: fix uuidd failed with /run/uuidd not found
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
X-List-Received-Date: Tue, 20 Aug 2019 07:50:01 -0000
Content-Type: text/plain

It failed to run uuidd
...
root@qemux86-64:~# uuidd
uuidd: cannot open /run/uuidd/uuidd.pid: No such file or directory
...

Create dir /run/uuidd for both of systemd and sysvinit

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 84c7012..90a4750 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -127,6 +127,11 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 FILES_${PN}-mount = "${sysconfdir}/default/mountall"
 FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES_${PN}-uuidd = " \
+    /etc/tmpfiles.d/uuidd.conf \
+    /etc/default/volatiles/99_uuidd \
+"
+
 CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
 FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
@@ -155,6 +160,12 @@ SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
 SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
 
+pkg_postinst_${PN}-uuidd() {
+	if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
+		${sysconfdir}/init.d/populate-volatile.sh update
+	fi
+}
+
 do_install () {
 	# with ccache the timestamps on compiled files may
 	# end up earlier than on their inputs, this allows
@@ -202,6 +213,16 @@ do_install () {
 		# and thus prevents the operation.
 		ln -s su ${D}${sysconfdir}/pam.d/su-l
 	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/uuidd 0755 root root - -" > ${D}${sysconfdir}/tmpfiles.d/uuidd.conf
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/default/volatiles
+		echo "d root root 0755 /run/uuidd none" > ${D}${sysconfdir}/default/volatiles/99_uuidd
+	fi
 }
 
 # nologin causes a conflict with shadow-native
-- 
2.8.1


