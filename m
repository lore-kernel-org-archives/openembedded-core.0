Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 768F573243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 00:09:52 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so57160471pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0HICGDdNnDznBWSYvBD/BNkL1YNwdvN9ICcLBJvZbXQ=;
	b=gbI89bY4Fx36brBfJoNH+fJ3jYWEQ/gFknIWkU2zluBjpuup0hbcFbEmZ31lGrFuSm
	izCIv23ai/L61vyhsh6hFcMf7QtxicGOGVTnBZqhneJMxsuaiMtJ6yRYHEVwPLtyB9Bj
	K93CH8i/dqaHTVgAnU3lf4kwu3Y2+EZkv/jX0AfXjvb0lmltBXhrkUHa5O11oUjaYSX/
	Ovq6QdjnFNKHLsmyDAW9GC2gEEAqyQTilGU1SkKUs8/FvBXAuOG3mJE3CPQSh4eyE037
	A4kZdZcaq1MozPz1Q+t98Th8qr3tNgNa98zbNNixVtzi3umQN1UVxam1j8y4Y4/PLN11
	7SyA==
X-Received: by 10.68.68.167 with SMTP id x7mr58031102pbt.140.1441930193308;
	Thu, 10 Sep 2015 17:09:53 -0700 (PDT)
Received: from localhost.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	gs2sm14162988pbc.15.2015.09.10.17.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 17:09:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 17:19:18 -0700
Message-Id: <98577e11b5374ff71bb883e708dc023b24e2c856.1441929533.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
References: <e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441929533.git.raj.khem@gmail.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
Subject: [PATCH V2 3/3] systemd: Implement OE-Specific systemd-sysv-install
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
X-List-Received-Date: Fri, 11 Sep 2015 00:09:53 -0000

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
index 2dc8884..6ac99cd 100644
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


