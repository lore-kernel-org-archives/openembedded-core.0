Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUOOE-0004qk-AN
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 23:35:14 +0200
Received: by mail-we0-f181.google.com with SMTP id m1so480200wea.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=/8C3ExysXTDK0szzaVFgX3djlIKyPVQPxw/0xPXNaMQ=;
	b=Zd5BEejTp3JVkTjyvGdosxuSclE0kbBbZ2N8u0Adc75XQw4qtFxsXzxDzAVgyjD6Dw
	UFf4gqp/EN1ahv6j4e4Bs7st+YzLVHpwgi16F2sdvfsbvU3kGr4bAJor1hTgqGjCQt4A
	1sEpCyai0Y63mhwpq3lYGEhMy6qtA0k9be/Ge3qK+sz4bn3mbIRpZ7coKYMiTI8fpfMb
	nkzf/IqVeM5EKNy+6SDROicpYc9mzwU7NJHKG9FPAAOXNb5LVJkO7l+ai8aa0OQX6Hft
	v3q7rCGBzl9A075qPQjxGJqAdjjg+ethvF9bXmfLoZEz/+1oDpAAnY0xVXgPXmp3VvPj
	AVEQ==
X-Received: by 10.181.11.164 with SMTP id ej4mr14658118wid.29.1366665449658;
	Mon, 22 Apr 2013 14:17:29 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPS id bk42sm43111902eeb.3.2013.04.22.14.17.28
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 14:17:28 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 00:16:47 +0300
Message-Id: <1366665407-32136-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v3] systemd: added python-systemd package generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 21:35:39 -0000

---
 meta/recipes-core/systemd/systemd_199.bb |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 5240443..9a68960 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -11,12 +11,18 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r2"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 python"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives pythonnative python-dir
+
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
@@ -63,9 +69,9 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-coredump \
                  --disable-introspection \
                  --disable-tcpwrap \
+                 --with-python \
                  --enable-split-usr \
                  --disable-microhttpd \
-                 --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
@@ -119,7 +125,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-dev"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -129,6 +135,11 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
+RDEPENDS_python-${PN} = "python-core python-datetime python-logging python-syslog"
+FILES_python-${PN}-dev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
+FILES_python-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
+
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
-- 
1.7.9.5



