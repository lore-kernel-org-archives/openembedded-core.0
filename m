Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF00CD1288
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 01:24:33 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.7697.1711675466537633565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 18:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PM18P2T6;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7d07e8c5e04so67225639f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711675465; x=1712280265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onn9xogGk4Bl5wFgmwAFwXSNAD3RSwfGfXmkQBQqsLY=;
        b=PM18P2T6XfzIBnJMcvDOE2lnsRi1k3maeSz8r7WI957BjOkarjiJtiapeGtllA3Eyt
         AN4EMRUrPqtKjXpJTW9bMqSATOa+BwQAvUT+ivmFPEeL5gfSh/49y/lXAjLHXxCsJYnV
         qToi4IHjosR8t/j2n9e0zAcxrzaV68Js5oteby4mwapAQ1uzPH+/ivPUh2uKjGfTW+wa
         cVYtWVQPxtK/Ob7QRYMw9ApMTO8wQZ9iIPbH8PHzXzmFYy4TExMqgEDxYM3hkcFxmMoI
         wp2YT6M42Wo1ORYySy6cArydOrv+AIAkOw6Q5qcGGtTYx3LxfULkwp7gWXUDPkFASBkl
         k/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711675465; x=1712280265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onn9xogGk4Bl5wFgmwAFwXSNAD3RSwfGfXmkQBQqsLY=;
        b=VQ51MTqvjU7DybA5axppprdCxzx7U+TztJeiGvbx0oj5hOvLAar09AOALwGZOptzz2
         nxLjNUU5CD7g0QrV3anutKW72kRHFbOOlZ6Q7geLX/cwv/984SfyjhCqCcY2LwHgzysK
         ZGd142GvotcjOqIMqAjky23+IgrqwP1SeNIjWrE8syAAdgBkQ1Af5BJi3SbRuVrsDCz3
         HcxHP8DabEuRNpSh1Rqa09pC73DvGQ+Qfs5tCVJpV+QOdtyWWdIa8BMlSIFFuf74/H5V
         SbBHW7YIYHk5FblAzywzYOM2uSFcWNYds+t/Cr+k6NQItBCO52Fr7sIQKLib1hZwK0jg
         evKg==
X-Gm-Message-State: AOJu0YzPm5EElh2wW0TNQUOBBjpLylopXRVTg4WU4gk9LHonUf+Sjffi
	szX3kqr0N+cQvna0bEg9srpFGaa2c8Ui7ug+KIuvF0YYZNCaooCMoNRQN7a9gs4=
X-Google-Smtp-Source: AGHT+IGcOlSy12Qxg2LP9a2SwtHYHhxzzi7RDJ+uU1TaelbORcX01lP6bCVk6hebaelH8tX9mq/51g==
X-Received: by 2002:a05:6602:1c87:b0:7d0:3e4e:242d with SMTP id hf7-20020a0566021c8700b007d03e4e242dmr942167iob.5.1711675465434;
        Thu, 28 Mar 2024 18:24:25 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id t21-20020a028795000000b0047c0d5be2casm694756jai.24.2024.03.28.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 18:24:25 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v5 2/3] nfs-utils: Use upstream systemd service files
Date: Thu, 28 Mar 2024 19:24:11 -0600
Message-ID: <20240329012413.892379-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240329012413.892379-1-danismostlikely@gmail.com>
References: <20240329012413.892379-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 01:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197617

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
 .../nfs-utils/nfs-utils_2.6.4.bb              | 32 +++++---------
 8 files changed, 11 insertions(+), 203 deletions(-)
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 527fcd609c1..3896fac6ed5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
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
@@ -58,6 +51,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-uuid \
                 --disable-gss \
                 --disable-nfsdcltrack \
+                --disable-sbin-override \
                 --with-statdpath=/var/lib/nfs/statd \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
                "
@@ -65,7 +59,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
 LDFLAGS:append = " -lsqlite3 -levent"
 
 PACKAGECONFIG ??= "tcp-wrappers \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
 PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
@@ -74,6 +68,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
 
@@ -81,14 +76,16 @@ CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
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
@@ -125,18 +122,11 @@ do_install:append () {
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
 	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
-	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
-	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}
+	install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}
 
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
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
2.41.0


