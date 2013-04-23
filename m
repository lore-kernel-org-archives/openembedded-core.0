Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUZZQ-00086o-Jr
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 11:31:33 +0200
Received: by mail-ee0-f42.google.com with SMTP id e52so142305eek.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 02:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=eCmNwqrTBuHex+Eg0+Bjuh0Bom4qYAnBX22/zoN9yRA=;
	b=EWjsKDSuKQ9OGyPaB6PBzb9mgmGONwxy+uFIRlcFptV3+hbkOMxKiKLe9fqkKX7kZ+
	LmjRSIZZZfTHdwN0dJHgFf/NH9Lu5KEX+ELsO48m+s2+XwobU0lCTBrPJgbph2KDy/xo
	Jl+CUT5UirdebQPzDaktWvy4XlSD6o2P3CDA+nxgrTqLYv3bNsPcs8UDyxUJVaWS3F7n
	1GxtlsBunRbQYvY6trCNWr3Oj9Q0ebvDn2V2kxa4RorZPB3RCVDEydTF20yXg4fP5iG5
	bdnrQmEo3OfDIEvXjNNoKxCtkv0xA7ZI5qPkFHB+GggquLJiUOk1B1OXaN4aW8NQ0vp/
	+1eg==
X-Received: by 10.15.22.199 with SMTP id f47mr49387575eeu.11.1366708428657;
	Tue, 23 Apr 2013 02:13:48 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPS id
	cb50sm45545616eeb.14.2013.04.23.02.13.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 02:13:47 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 12:13:22 +0300
Message-Id: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 09:31:34 -0000

---
 meta/recipes-core/systemd/systemd_199.bb |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 5240443..bbae6f8 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -16,7 +16,13 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
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
@@ -46,11 +52,13 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz"
+PACKAGECONFIG ??= "xz python"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+# Use python-systemd
+PACKAGECONFIG[python] = "--with-python,--without-python,python"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
@@ -65,7 +73,6 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
-                 --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
@@ -119,7 +126,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-dev"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -129,6 +136,11 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
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



