Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E503C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 19:16:09 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.24853.1739387767722911820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 11:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+/w+9nG;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f768e9be1aso10839127b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387766; x=1739992566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWGgWC82cgPS+UrcP/ADwvpyAqJ2x9Uai+uTCNAlOCg=;
        b=X+/w+9nGo8m+UaHVGz8/lDETEOXRu2uAaOEEHzlmlkL+85YyskE5HdCehnqlEI3qdD
         SUKff7ehxE8b4YJaq9X6ptJuPgKHbnFLNZ+0f2OyoBKIY8R2Mu+iTn2CWhknpf1Sl9r8
         dQpV2x8wVnD8WGuYXpe8ZzailCBS5fenl/Glk/5HSIwQFBDTl51/fT99GvbEQo+ztvHn
         YTA5knvsEWwQ3wwxtVq9h723d+TuiHwjU7haumsqbUNVVUIWVm6n76wSd1P5eliRPJPT
         ohWp5YU7KXJPw4PiPjjfNQS9pnAVTksylAgbWFlhXXHVxR4WyqzyysfIn/uecSOYaXGr
         YfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387766; x=1739992566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWGgWC82cgPS+UrcP/ADwvpyAqJ2x9Uai+uTCNAlOCg=;
        b=X83rzsTmAPzXd8RmlUNMyufBz1Gp/agVAMQl3w2yWU9rcFBBEfy5ykoAucXymsN4K1
         9fyTHWBdBth6r/Aab8O+GwyjZNR+roLpQDtntuIH2pQcr57iVrLMFTDqzkOCmjDCZNGJ
         m6v97WyH0t4do/414pDjD3WBJoDmR7TIfMR3aHui8vOdofJTdfrYc/7zS6DMZM6FsOJ9
         HDIJHCUU4BocYERmTpuHBW3PUboNUinDNCeHm+GbvYd5ujts/QzCNPpa3Olbw+QsxRhP
         7EmDPwKfNPbWOdxyp29B78sgSzV8UW5sTYLrK705UG2uqP+cmbYhvPM/1Kh2Z82U31Bg
         fx/g==
X-Gm-Message-State: AOJu0YyrOBy2BNfaCaqisxvya+HkiVMhbGom0SFb3XGJ+MTtVWKj6LU+
	ay1jn6LtsSavMeoC3S2c7rv7jRkpDSU+/M7uZ0M3x10p76PvPJDOc688Yw==
X-Gm-Gg: ASbGncvIru8MTYrt23sU7TnNXx7HAvkUXTkALZMWhJti805BlER0BjFSuY07P7J0vj5
	TC2/qROZgDK9yP7kPYNiE1/s0bHHKiOH9TPxAbVZ+Tp6QtTxHOi3lwenvVmtuD2Ped56xpldA8H
	Se1kxnlVj6cNsBGLNXyF7h9fwMTGkcCafpDBmDbpdyIKfLbGO8YGSIDs9SZ932SEiJwIhV51VIl
	UUTT5D0Qjv/uoXSH+fXh0fV1Bv36OsmuD13xWP6YBhaNrkSSOnW+Q81f7DRsAGf9yPCsMtwaGNt
	lKr4R11ztMU7KiDS0vBm+CMeBwrO1G4cCZ5G8rhQ
X-Google-Smtp-Source: AGHT+IEnMc2vwmRquEaF3Ctq1wRuqNcju0vr/KuN1fhb/ftHQJV8DpiGBjqAo4ajDr6R2BArikSz2w==
X-Received: by 2002:a05:690c:4a13:b0:6e5:2adf:d584 with SMTP id 00721157ae682-6fb33efaf03mr931227b3.14.1739387766350;
        Wed, 12 Feb 2025 11:16:06 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce16d1sm28115017b3.23.2025.02.12.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:16:05 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 2/4] nfs-utils: Use upstream systemd service files
Date: Wed, 12 Feb 2025 13:12:30 -0600
Message-ID: <20250212191518.1968329-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250212191518.1968329-1-danismostlikely@gmail.com>
References: <20250212191518.1968329-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 19:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211274

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Reduce diffs against upstream by using the service files provided
by them. This reduces our dependence on patches that simply change
the names of a service.
This also changes the way some nfs options get set for systemd, it
introduces the nfs.conf file for configuration, which all daemons
already support.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 .../bugfix-adjust-statd-service-name.patch    | 39 -----------------
 .../nfs-utils/nfs-utils/nfs-mountd.service    | 18 --------
 .../nfs-utils/nfs-utils/nfs-server.service    | 24 -----------
 .../nfs-utils/nfs-utils/nfs-statd.service     | 16 -------
 .../nfs-utils-debianize-start-statd.patch     | 42 -------------------
 .../nfs-utils/nfs-utils/nfs-utils.conf        | 35 ----------------
 .../nfs-utils/nfs-utils/proc-fs-nfsd.mount    |  8 ----
 .../nfs-utils/nfs-utils_2.8.2.bb              | 33 +++++----------
 8 files changed, 11 insertions(+), 204 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
deleted file mode 100644
index f13d7b380ca..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 398fed3bb0350cb1229e54e7020ae0e044c206d1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
-Date: Wed, 17 Feb 2016 08:33:45 +0100
-Subject: bugfix: adjust statd service name
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream uses 'rpc-statd.service' and Yocto introduced 'nfs-statd.service'
-instead but forgot to update the mount.nfs helper 'start-statd' accordingly.
-
-Upstream-Status: Inappropriate [other]
-
-Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
-
-Rebase it.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- utils/statd/start-statd | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index af5c950..df9b9be 100755
---- a/utils/statd/start-statd
-+++ b/utils/statd/start-statd
-@@ -28,10 +28,10 @@ fi
- # First try systemd if it's installed.
- if [ -d /run/systemd/system ]; then
-     # Quit only if the call worked.
--    if systemctl start rpc-statd.service; then
-+    if systemctl start nfs-statd.service; then
-         # Ensure systemd knows not to stop rpc.statd or its dependencies
-         # on 'systemctl isolate ..'
--        systemctl add-wants --runtime remote-fs.target rpc-statd.service
-+        systemctl add-wants --runtime remote-fs.target nfs-statd.service
-         exit 0
-     fi
- fi
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
deleted file mode 100644
index ebfe64b9ced..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ /dev/null
@@ -1,18 +0,0 @@
-[Unit]
-Description=NFS Mount Daemon
-DefaultDependencies=no
-After=rpcbind.socket
-Requires=proc-fs-nfsd.mount
-After=proc-fs-nfsd.mount
-After=network.target local-fs.target
-BindsTo=nfs-server.service
-ConditionPathExists=@SYSCONFDIR@/exports
-
-[Service]
-EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
-ExecStart=@SBINDIR@/rpc.mountd -F $MOUNTD_OPTS
-LimitNOFILE=@HIGH_RLIMIT_NOFILE@
-StateDirectory=nfs
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
deleted file mode 100644
index 15ceee04d0d..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
+++ /dev/null
@@ -1,24 +0,0 @@
-[Unit]
-Description=NFS server and services
-DefaultDependencies=no
-Requires=network.target proc-fs-nfsd.mount
-Requires=nfs-mountd.service
-Wants=rpcbind.service
-After=local-fs.target
-After=network.target proc-fs-nfsd.mount rpcbind.service nfs-mountd.service
-ConditionPathExists=@SYSCONFDIR@/exports
-
-[Service]
-Type=oneshot
-EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
-ExecStartPre=@SBINDIR@/exportfs -r
-ExecStart=@SBINDIR@/rpc.nfsd $NFSD_OPTS $NFSD_COUNT
-ExecStop=@SBINDIR@/rpc.nfsd 0
-ExecStopPost=@SBINDIR@/exportfs -au
-ExecStopPost=@SBINDIR@/exportfs -f
-ExecReload=@SBINDIR@/exportfs -r
-RemainAfterExit=yes
-StateDirectory=nfs
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
deleted file mode 100644
index b519194121c..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
+++ /dev/null
@@ -1,16 +0,0 @@
-[Unit]
-Description=NFS status monitor for NFSv2/3 locking.
-DefaultDependencies=no
-Conflicts=umount.target
-Requires=nss-lookup.target rpcbind.service
-After=network.target nss-lookup.target rpcbind.service
-ConditionPathExists=@SYSCONFDIR@/exports
-
-[Service]
-EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
-ExecStart=@SBINDIR@/rpc.statd -F $STATD_OPTS
-LimitNOFILE=@HIGH_RLIMIT_NOFILE@
-StateDirectory=nfs
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
deleted file mode 100644
index ede0dcefc49..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-[PATCH] nfs-utils: debianize start-statd
-
-Upstream-Status: Pending
-
-make start-statd command to use nfscommon configure, too.
-
-Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
-Signed-off-by: Li Wang <li.wang@windriver.com>
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- utils/statd/start-statd | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index 2fd6039..f591b34 100755
---- a/utils/statd/start-statd
-+++ b/utils/statd/start-statd
-@@ -17,6 +17,14 @@ then
-     # statd already running - must have been slow to respond.
-     exit 0
- fi
-+
-+# Read config
-+DEFAULTFILE=/etc/default/nfs-common
-+NEED_IDMAPD=
-+if [ -f $DEFAULTFILE ]; then
-+    . $DEFAULTFILE
-+fi
-+
- # First try systemd if it's installed.
- if [ -d /run/systemd/system ]; then
-     # Quit only if the call worked.
-@@ -25,4 +33,4 @@ fi
- 
- cd /
- # Fall back to launching it ourselves.
--exec rpc.statd --no-notify
-+exec rpc.statd --no-notify $STATDOPTS
--- 
-2.6.6
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
deleted file mode 100644
index a1007a7fbf4..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-# Parameters to be passed to nfs-utils (clients & server) service files.
-#
-
-# Options to pass to rpc.nfsd.
-NFSD_OPTS=""
-
-# Number of servers to start up; the default is 8 servers.
-NFSD_COUNT=""
-
-# Where to mount nfsd filesystem; the default is "/proc/fs/nfsd".
-PROCNFSD_MOUNTPOINT=""
-
-# Options used to mount nfsd filesystem; the default is "rw,nodev,noexec,nosuid".
-PROCNFSD_MOUNTOPTS=""
-
-# Options for rpc.mountd.
-# If you have a port-based firewall, you might want to set up
-# a fixed port here using the --port option.
-MOUNTD_OPTS=""
-
-# Parameters to be passed to nfs-common (nfs clients & server) init script.
-#
-
-# If you do not set values for the NEED_ options, they will be attempted
-# autodetected; this should be sufficient for most people. Valid alternatives
-# for the NEED_ options are "yes" and "no".
-
-# Do you want to start the statd daemon? It is not needed for NFSv4.
-NEED_STATD=""
-
-# Options to pass to rpc.statd.
-# N.B. statd normally runs on both client and server, and run-time
-# options should be specified accordingly.
-# STATD_OPTS="-p 32765 -o 32766"
-STATD_OPTS=""
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount b/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
deleted file mode 100644
index 630801b3751..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=NFSD configuration filesystem
-After=systemd-modules-load.service
-
-[Mount]
-What=nfsd
-Where=/proc/fs/nfsd
-Type=nfsd
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index df9c95a71ff..f07ed2040ad 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -21,13 +21,6 @@ USERADD_PARAM:${PN}-client = "--system  --home-dir /var/lib/nfs \
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
            file://nfsserver \
            file://nfscommon \
-           file://nfs-utils.conf \
-           file://nfs-server.service \
-           file://nfs-mountd.service \
-           file://nfs-statd.service \
-           file://proc-fs-nfsd.mount \
-           file://nfs-utils-debianize-start-statd.patch \
-           file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
@@ -48,8 +41,8 @@ INITSCRIPT_PARAMS:${PN}-client = "defaults 19 21"
 inherit autotools-brokensep update-rc.d systemd pkgconfig
 
 SYSTEMD_PACKAGES = "${PN} ${PN}-client"
-SYSTEMD_SERVICE:${PN} = "nfs-server.service nfs-mountd.service"
-SYSTEMD_SERVICE:${PN}-client = "nfs-statd.service"
+SYSTEMD_SERVICE:${PN} = "nfs-server.service"
+SYSTEMD_SERVICE:${PN}-client = "nfs-client.target"
 
 # --enable-uuid is need for cross-compiling
 EXTRA_OECONF = "--with-statduser=rpcuser \
@@ -65,7 +58,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
 LDFLAGS += "-lsqlite3 -levent"
 
 PACKAGECONFIG ??= "tcp-wrappers \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
 PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
@@ -75,6 +68,7 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmap
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
 PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
 
@@ -82,14 +76,16 @@ CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
 			   ${localstatedir}/lib/nfs/xtab \
 			   ${localstatedir}/lib/nfs/statd/state \
+			   ${sysconfdir}/nfs.conf \
 			   ${sysconfdir}/nfsmount.conf"
 
 FILES:${PN}-client = "${sbindir}/*statd \
 		      ${libdir}/libnfsidmap.so.* \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \
+		      ${sbindir}/nfsconf \
 		      ${localstatedir}/lib/nfs \
-		      ${sysconfdir}/nfs-utils.conf \
+		      ${sysconfdir}/nfs.conf \
 		      ${sysconfdir}/nfsmount.conf \
 		      ${sysconfdir}/init.d/nfscommon \
 		      ${systemd_system_unitdir}/nfs-statd.service"
@@ -109,7 +105,7 @@ FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_libdir}/modp
 
 do_configure:prepend() {
 	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-		${S}/utils/mount/Makefile.am
+		${S}/utils/mount/Makefile.am ${S}/utils/nfsdcltrack/Makefile.am
 }
 
 # Make clean needed because the package comes with
@@ -126,18 +122,11 @@ do_install:append () {
 	install -m 0755 ${UNPACKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
 	install -m 0755 ${UNPACKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
-	install -m 0755 ${UNPACKDIR}/nfs-utils.conf ${D}${sysconfdir}
-	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}
+	install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}
 
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${UNPACKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${UNPACKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${UNPACKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${UNPACKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
-	sed -i -e 's,@SBINDIR@,${sbindir},g' \
-		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
-		${D}${systemd_system_unitdir}/*.service
+	# Retain historical service name so old scripts keep working
+	ln -s rpc-statd.service ${D}${systemd_system_unitdir}/nfs-statd.service
 	# Add compatibility symlinks for the sysvinit scripts
 	ln -s nfs-server.service ${D}${systemd_system_unitdir}/nfsserver.service
 	ln -s /dev/null ${D}${systemd_system_unitdir}/nfscommon.service
-- 
2.47.0


