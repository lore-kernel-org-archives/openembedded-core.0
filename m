Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2133.1601017585223836660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 00:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08P75mP3001413
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 25 Sep 2020 00:05:58 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 00:05:37 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [oe-core][PATCH 2/4] util-linux: fix calling uuidd failed with /run/uuidd not found
Date: Fri, 25 Sep 2020 00:05:33 -0700
Message-ID: <20200925070535.59518-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925070535.59518-1-hongxu.jia@windriver.com>
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It failed to call uuidd
...
root@qemux86-64:~# uuidd
uuidd: cannot open /run/uuidd/uuidd.pid: No such file or directory
...

Create volatile dir /run/uuidd for both of systemd and sysvinit system

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../util-linux/util-linux_2.36.bb             | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 2ad00ff0a5..3762308c38 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -151,6 +151,11 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
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
@@ -179,6 +184,12 @@ SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
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
@@ -226,6 +237,16 @@ do_install_append_class-target () {
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
 # kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
-- 
2.21.0

