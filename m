Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.7723.1618906939945888426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 01:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13K8MHtv031851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 01:22:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Apr 2021 01:22:16 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 20 Apr 2021 01:22:16 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libpam: make volatile files created successfully
Date: Tue, 20 Apr 2021 16:22:15 +0800
Message-ID: <20210420082215.16223-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../pam/libpam/pam-volatiles.conf             |  1 +
 meta/recipes-extended/pam/libpam_1.5.1.bb     | 21 +++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/pam-volatiles.conf

diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
new file mode 100644
index 0000000000..d8b8259a93
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
@@ -0,0 +1 @@
+d /var/run/sepermit 0755 root root - -
diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index f225487688..4363e16b9b 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
            file://0001-Makefile.am-support-usrmage.patch \
            file://run-ptest \
+           file://pam-volatiles.conf \
            "
 
 SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
@@ -125,8 +126,18 @@ do_install() {
 
 	# don't install /var/run when populating rootfs. Do it through volatile
 	rm -rf ${D}${localstatedir}
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_pam ${D}${sysconfdir}/default/volatiles
+
+        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)}; then
+            rm -rf ${D}${sysconfdir}/init.d/
+            rm -rf ${D}${sysconfdir}/rc*
+            install -d ${D}${sysconfdir}/tmpfiles.d
+            install -m 0644 ${WORKDIR}/pam-volatiles.conf \
+                    ${D}${sysconfdir}/tmpfiles.d/pam.conf
+        else
+            install -d ${D}${sysconfdir}/default/volatiles
+            install -m 0644 ${WORKDIR}/99_pam \
+                    ${D}${sysconfdir}/default/volatiles/
+        fi
 
 	install -d ${D}${sysconfdir}/pam.d/
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
@@ -146,6 +157,12 @@ do_install_ptest() {
     fi
 }
 
+pkg_postinst_${PN}() {
+         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+                 /etc/init.d/populate-volatile.sh update
+         fi
+}
+
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-- 
2.17.1

