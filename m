Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1788.1596010964381803958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06T8MBN5019078
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 01:22:33 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Jul 2020
 01:22:06 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] nativesdk-rpm: adjust RPM_CONFIGDIR paths dynamically
Date: Wed, 29 Jul 2020 01:22:06 -0700
Message-ID: <20200729082206.43438-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While installing/extracting SDK to a non-default dir(not /opt),
run rpm failed:
$ python3 -c "import rpm"
|error: Unable to open /opt/windriver/wrlinux-graphics/20.31/sysroots/
x86_64-wrlinuxsdk-linux/usr/lib/rpm/rpmrc for reading: No such file or
directory.

This patch adds a flexible way to configure RPM_CONFIGDIR in SDK.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/rpm/files/environment.d-rpm.sh | 1 +
 meta/recipes-devtools/rpm/rpm_4.15.1.bb              | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/environment.d-rpm.sh

diff --git a/meta/recipes-devtools/rpm/files/environment.d-rpm.sh b/meta/recipes-devtools/rpm/files/environment.d-rpm.sh
new file mode 100644
index 0000000000..9b669a18d1
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/environment.d-rpm.sh
@@ -0,0 +1 @@
+export RPM_CONFIGDIR="$OECORE_NATIVE_SYSROOT/usr/lib/rpm"
diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index b5a0ac9382..c9258632d2 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -25,6 +25,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
 
 SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
+           file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -112,6 +113,9 @@ do_install_append_class-nativesdk() {
         done
 
         rm -rf ${D}/var
+
+        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+        install -m 644 ${WORKDIR}/environment.d-rpm.sh ${D}${SDKPATHNATIVE}/environment-setup.d/rpm.sh
 }
 
 # Rpm's make install creates var/tmp which clashes with base-files packaging
@@ -129,6 +133,7 @@ do_install_append () {
 
 FILES_${PN} += "${libdir}/rpm-plugins/*.so \
                "
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/rpm.sh"
 
 FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
-- 
2.21.0

