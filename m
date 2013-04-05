Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UOEDM-00034Q-0v
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 23:30:29 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so1541138eaj.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=IopMpeZM7T0X8681s8MQZhKhkTr7pCipChoOb0Cj0hE=;
	b=bwJ7XwnQ/5ZmhyzUt9b+9ozcvkhlwyc2wk2SniLtdG+4svm9l/rIzkqzG/OmoTI5rD
	HuDF7cpzgeYHBwhHTfjHgzNmP6vyt2faOVSLZ4UVLIRC5UQNT24bL4unbuyfSWOwWYL/
	gmBQ1Qy3LYSobIxbc+XxJ8yqsclpvb8PLuWAeJLgxSVQNCEH5fzv+DT4VFXVJynsOQgZ
	YI7XmcCzLSoaWhIZL7+4t7mgYE65r4nHAAHT3l2pLJqIOnIQ+CfK9gqch2ULOagMXL6i
	LzrAkbJajrrdsskiLAexLnT7Eg8IXY3TsBvJEWQUOO7huaYgrayi7l+btE/ytvScKQUj
	xoow==
X-Received: by 10.14.194.198 with SMTP id m46mr23014228een.8.1365196393182;
	Fri, 05 Apr 2013 14:13:13 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPS id ca4sm17573917eeb.15.2013.04.05.14.13.11
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 14:13:12 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:13:00 +0300
Message-Id: <1365196380-1930-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH] systemd: added python-systemd package generation.
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
X-List-Received-Date: Fri, 05 Apr 2013 21:31:22 -0000

---
 meta/recipes-core/systemd/systemd_199.bb |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index ba1d133..2a3d351 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -10,12 +10,18 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 python"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d pythonnative python-dir
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
                  ac_cv_path_KILL=${base_bindir}/kill \
                "
@@ -114,7 +120,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-staticdev"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -124,6 +130,13 @@ FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
+RDEPENDS_python-${PN} = "python-core"
+FILES_python-${PN}-staticdev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
+RDEPENDS_python-${PN} = "python-core"
+FILES_python-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
+RDEPENDS_python-${PN} = "python-core"
+
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
-- 
1.7.9.5



