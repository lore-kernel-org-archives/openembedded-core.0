Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 97CDD7FCCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:24:45 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 131155C3BCC;
	Fri, 22 Nov 2019 17:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574439885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=p9gA5Is75Kt+hNnUDnLnicnZ5eh9kJTWNP8ruew3D7w=;
	b=DStyu+PnNw2W4U9I35HZ4PqY9E7pn7eKpvq5KgfzKv0f2mo04mbCqVMnSpsDuaYWFdp1hV
	SXSk7s/7ZMEjhp2Ac/0xkwFNy1Sd2fbxH0+a6Y+vwC2oS0GlaM5ID8LAjQ+MdpoDfSIKHN
	pO4loN/AtzBapGls4CWcd+66vvaXgS0=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 16:24:41 +0000
Message-Id: <20191122162441.26400-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] rpcbind: use upstream systemd service
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
X-List-Received-Date: Fri, 22 Nov 2019 16:24:46 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Use upstream systemd service files instead of our own service files.
This also makes sure that /run/rpcbind.sock is used which fixes the
following systemd warning:
  /usr/lib/systemd/system/rpcbind.socket:5: ListenStream= references a
  path below legacy directory /var/run/, updating /var/run/rpcbind.sock
  \xe2\x86\x92 /run/rpcbind.sock; please update the unit file accordingly.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../0001-systemd-use-EnvironmentFile.patch    | 42 +++++++++++++++++++
 .../rpcbind/rpcbind/rpcbind.conf              |  2 +-
 .../rpcbind/rpcbind/rpcbind.service           | 12 ------
 .../rpcbind/rpcbind/rpcbind.socket            |  8 ----
 .../recipes-extended/rpcbind/rpcbind_1.2.5.bb | 13 +-----
 5 files changed, 45 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
new file mode 100644
index 0000000000..b92f2cf7b1
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -0,0 +1,42 @@
+From da528d5d60137f13202102b53cf178aba45849a5 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan.agner@toradex.com>
+Date: Sun, 6 Oct 2019 00:05:54 +0200
+Subject: [PATCH] systemd: use EnvironmentFile
+
+Use OE specific environment file.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+---
+ configure.ac               | 2 ++
+ systemd/rpcbind.service.in | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2dd9471..47a46c0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,5 +69,7 @@ AC_CHECK_HEADERS([nss.h rpcsvc/mount.h])
+ # 2 "evals" needed to expand variable names
+ AC_SUBST([_sbindir])
+ AC_CONFIG_COMMANDS_PRE([eval eval _sbindir=$sbindir])
++AC_SUBST([_sysconfdir])
++AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=$sbindir])
+ 
+ AC_OUTPUT([Makefile systemd/rpcbind.service])
+diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
+index 7b1c74b..f45ee1e 100644
+--- a/systemd/rpcbind.service.in
++++ b/systemd/rpcbind.service.in
+@@ -11,7 +11,7 @@ Wants=rpcbind.target
+ 
+ [Service]
+ Type=notify
+-# distro can provide a drop-in adding EnvironmentFile=-/??? if needed.
++EnvironmentFile=-@_sysconfdir@/rpcbind.conf
+ ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS -w -f
+ 
+ [Install]
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf
index 2a4dfbcfbc..f423ac1788 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf
@@ -1,3 +1,3 @@
 # Optional arguments passed to rpcbind.
 #
-RPCBIND_OPTS=""
+RPCBIND_OPTIONS=""
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
deleted file mode 100644
index 9cdade4959..0000000000
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=RPC Bind Service
-Requires=rpcbind.socket
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
-ExecStart=@SBINDIR@/rpcbind $RPCBIND_OPTS
-SuccessExitStatus=2
-
-[Install]
-Also=rpcbind.socket
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket
deleted file mode 100644
index d63c1d9720..0000000000
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=RPCbind Server Activation Socket
-
-[Socket]
-ListenStream=/var/run/rpcbind.sock
-
-[Install]
-WantedBy=sockets.target
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
index 19d778b6d1..aff00e56e6 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
@@ -13,9 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            file://rpcbind.conf \
-           file://rpcbind.socket \
-           file://rpcbind.service \
            file://rpcbind_add_option_to_fix_port_number.patch \
+           file://0001-systemd-use-EnvironmentFile.patch \
           "
 SRC_URI[md5sum] = "ed46f09b9c0fa2d49015f6431bc5ea7b"
 SRC_URI[sha256sum] = "2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a"
@@ -28,7 +27,7 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
 
-SYSTEMD_SERVICE_${PN} = "rpcbind.service"
+SYSTEMD_SERVICE_${PN} = "rpcbind.service rpcbind.socket"
 
 inherit useradd
 
@@ -50,12 +49,4 @@ do_install_append () {
 		-e 's,/sbin/,${sbindir}/,g' \
 		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
-
-	install -m 0755 ${WORKDIR}/rpcbind.conf ${D}${sysconfdir}
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/rpcbind.socket ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' \
-		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		${D}${systemd_unitdir}/system/rpcbind.service
 }
-- 
2.17.1


