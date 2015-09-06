Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id BD48C77002
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Sep 2015 15:25:48 +0000 (UTC)
Received: by qgx61 with SMTP id 61so48343680qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Sep 2015 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=aXrtnOUz2JHRU7wXKCFWE9S5fWYfWMAqqLJ4FJC3a2c=;
	b=hXvRj8+yl3aFhMR+hiAaAulIfljvN+dFQ21jngEqOC4JWs6qpqaUnQTy0MWDDkGpFf
	n9kb2VT8Awva7y5D+LUBfUnO7NlzkHi0cHHb/NYvIvmoksDX5Km/EXZlieLjV5gu2YuU
	aGWw3Xm45BbKs38cvSh6qGX90+FGDpcUDxWBxpG32QqoSs2dlvvlfpD+5e3bWwQ7HqIo
	vdy8vpbKWj6fiEaNlA9XF0sI2PjG7Uio+0CorVVdBv84bMsHD9y05vhInsq1A3gAsPij
	y9cY/MHbHOaoEScKMy1dYP4T/GszUDf1F2bVb+i+cXcODmD2B2rJ59aqJq1gUKEQoTX3
	i/Bg==
X-Received: by 10.140.42.104 with SMTP id b95mr20647339qga.78.1441553148703;
	Sun, 06 Sep 2015 08:25:48 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	i196sm5098459qhc.22.2015.09.06.08.25.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Sep 2015 08:25:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Sep 2015 15:25:41 +0000
Message-Id: <064359c4681b0d6e4d19798f0a11b8ce3c04e72d.1441552859.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441552859.git.raj.khem@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] systemd: Implement OE-Specific systemd-sysv-install
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
X-List-Received-Date: Sun, 06 Sep 2015 15:25:48 -0000

Support for chkconfig (--enable-chkconfig) was removed in favour of
calling an abstraction /lib/systemd/systemd-sysv-install. This
needs to be implemented for OE.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0012-implment-systemd-sysv-install-for-OE.patch | 40 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_225.bb           |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch

diff --git a/meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch
new file mode 100644
index 0000000..68b45a9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch
@@ -0,0 +1,40 @@
+From 5f8b9f2d276c0ddbcbf5423733a23f043d688009 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Sep 2015 06:31:47 +0000
+Subject: [PATCH] implment systemd-sysv-install for OE
+
+Use update-rc.d for enabling/disabling and status command
+to check the status of the sysv service
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: git/src/systemctl/systemd-sysv-install.SKELETON
+===================================================================
+--- git.orig/src/systemctl/systemd-sysv-install.SKELETON
++++ git/src/systemctl/systemd-sysv-install.SKELETON
+@@ -30,17 +30,17 @@ case "$1" in
+     enable)
+         # call the command to enable SysV init script $NAME here
+         # (consider optional $ROOT)
+-        echo "IMPLEMENT ME: enabling SysV init.d script $NAME"
++        update-rc.d -f $NAME defaults
+         ;;
+     disable)
+         # call the command to disable SysV init script $NAME here
+         # (consider optional $ROOT)
+-        echo "IMPLEMENT ME: disabling SysV init.d script $NAME"
++        update-rc.d -f $NAME remove
+         ;;
+     is-enabled)
+         # exit with 0 if $NAME is enabled, non-zero if it is disabled
+         # (consider optional $ROOT)
+-        echo "IMPLEMENT ME: checking SysV init.d script $NAME"
++        /etc/init.d/$NAME status
+         ;;
+     *)
+         usage ;;
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index a1d371b..2299081 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
            file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
+           file://0012-implment-systemd-sysv-install-for-OE.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://touchscreen.rules \
@@ -188,6 +189,7 @@ do_install() {
 	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
 	fi
+	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 }
 
 do_install_ptest () {
@@ -309,7 +311,7 @@ FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_uni
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
-RDEPENDS_${PN} += "volatile-binds"
+RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
                       systemd-compat-units udev-hwdb \
-- 
2.5.1


