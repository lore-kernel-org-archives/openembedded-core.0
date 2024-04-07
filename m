Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C321FCD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 20:36:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.91492.1712522160135630222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Apr 2024 13:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OZeaZmqs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2D4D60002;
	Sun,  7 Apr 2024 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712522158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6XJdwLvfGjd3AMXKk8/mxMBTxAApQpKxxN944Pxal4=;
	b=OZeaZmqsM5l3aKtHJmB12Iegmcw3gYj5FhGO9ft8rKhAsCahhZZA9GxwDz2Oam7P0M6BWx
	IzJR5DNXacHxw2PQqKUjL1fCGp4lx+EPb5jRxBJfFTWMwgXdq7J4Zad0w0jfmyz41KRDYc
	5+l1NbZHFX50UifjJWOznigqKJyXP6cZ4k/quQ99jn5OB0pgDIb58H37+zx4mmaNVWk7KY
	NI78tOXJQvew9BbLx3ufFynvZWfZMqwIscY9TW9hp18+4qPkIx+yfqaBKApq7jqzAXm+Er
	3O+uIQwGPP2aBTvQI92XAmLxg8cB5Kqr+q1URWh9oxl8v4U6TK4p/m/gxWHQ9g==
Date: Sun, 7 Apr 2024 22:35:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH v7 2/3] nfs-utils: Use upstream systemd service
 files
Message-ID: <2024040720355780204503@mail.local>
References: <20240402002058.3910908-1-danismostlikely@gmail.com>
 <20240402002058.3910908-2-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402002058.3910908-2-danismostlikely@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Apr 2024 20:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198004

Hello,

I just got this which I think is caused by this series:

https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/7711/steps/11/logs/stdio

However, I'm not sure yet why I didn't see it in my previous builds

On 01/04/2024 18:20:55-0600, Dan McGregor wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
> 
> Reduce diffs against upstream by using the service files provided
> by them. This reduces our dependence on patches that simply change
> the names of a service.
> This also changes the way some nfs options get set for systemd, it
> introduces the nfs.conf file for configuration, which all daemons
> already support.
> 
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  .../bugfix-adjust-statd-service-name.patch    | 39 -----------------
>  .../nfs-utils/nfs-utils/nfs-mountd.service    | 18 --------
>  .../nfs-utils/nfs-utils/nfs-server.service    | 24 -----------
>  .../nfs-utils/nfs-utils/nfs-statd.service     | 16 -------
>  .../nfs-utils-debianize-start-statd.patch     | 42 -------------------
>  .../nfs-utils/nfs-utils/nfs-utils.conf        | 35 ----------------
>  .../nfs-utils/nfs-utils/proc-fs-nfsd.mount    |  8 ----
>  .../nfs-utils/nfs-utils_2.6.4.bb              | 33 +++++----------
>  8 files changed, 11 insertions(+), 204 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
> deleted file mode 100644
> index f13d7b380ca..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 398fed3bb0350cb1229e54e7020ae0e044c206d1 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
> -Date: Wed, 17 Feb 2016 08:33:45 +0100
> -Subject: bugfix: adjust statd service name
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream uses 'rpc-statd.service' and Yocto introduced 'nfs-statd.service'
> -instead but forgot to update the mount.nfs helper 'start-statd' accordingly.
> -
> -Upstream-Status: Inappropriate [other]
> -
> -Signed-off-by: Ulrich �lmann <u.oelmann@pengutronix.de>
> -
> -Rebase it.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - utils/statd/start-statd | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/statd/start-statd b/utils/statd/start-statd
> -index af5c950..df9b9be 100755
> ---- a/utils/statd/start-statd
> -+++ b/utils/statd/start-statd
> -@@ -28,10 +28,10 @@ fi
> - # First try systemd if it's installed.
> - if [ -d /run/systemd/system ]; then
> -     # Quit only if the call worked.
> --    if systemctl start rpc-statd.service; then
> -+    if systemctl start nfs-statd.service; then
> -         # Ensure systemd knows not to stop rpc.statd or its dependencies
> -         # on 'systemctl isolate ..'
> --        systemctl add-wants --runtime remote-fs.target rpc-statd.service
> -+        systemctl add-wants --runtime remote-fs.target nfs-statd.service
> -         exit 0
> -     fi
> - fi
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
> deleted file mode 100644
> index ebfe64b9ced..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -[Unit]
> -Description=NFS Mount Daemon
> -DefaultDependencies=no
> -After=rpcbind.socket
> -Requires=proc-fs-nfsd.mount
> -After=proc-fs-nfsd.mount
> -After=network.target local-fs.target
> -BindsTo=nfs-server.service
> -ConditionPathExists=@SYSCONFDIR@/exports
> -
> -[Service]
> -EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
> -ExecStart=@SBINDIR@/rpc.mountd -F $MOUNTD_OPTS
> -LimitNOFILE=@HIGH_RLIMIT_NOFILE@
> -StateDirectory=nfs
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
> deleted file mode 100644
> index 15ceee04d0d..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -[Unit]
> -Description=NFS server and services
> -DefaultDependencies=no
> -Requires=network.target proc-fs-nfsd.mount
> -Requires=nfs-mountd.service
> -Wants=rpcbind.service
> -After=local-fs.target
> -After=network.target proc-fs-nfsd.mount rpcbind.service nfs-mountd.service
> -ConditionPathExists=@SYSCONFDIR@/exports
> -
> -[Service]
> -Type=oneshot
> -EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
> -ExecStartPre=@SBINDIR@/exportfs -r
> -ExecStart=@SBINDIR@/rpc.nfsd $NFSD_OPTS $NFSD_COUNT
> -ExecStop=@SBINDIR@/rpc.nfsd 0
> -ExecStopPost=@SBINDIR@/exportfs -au
> -ExecStopPost=@SBINDIR@/exportfs -f
> -ExecReload=@SBINDIR@/exportfs -r
> -RemainAfterExit=yes
> -StateDirectory=nfs
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
> deleted file mode 100644
> index b519194121c..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -[Unit]
> -Description=NFS status monitor for NFSv2/3 locking.
> -DefaultDependencies=no
> -Conflicts=umount.target
> -Requires=nss-lookup.target rpcbind.service
> -After=network.target nss-lookup.target rpcbind.service
> -ConditionPathExists=@SYSCONFDIR@/exports
> -
> -[Service]
> -EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
> -ExecStart=@SBINDIR@/rpc.statd -F $STATD_OPTS
> -LimitNOFILE=@HIGH_RLIMIT_NOFILE@
> -StateDirectory=nfs
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
> deleted file mode 100644
> index ede0dcefc49..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -[PATCH] nfs-utils: debianize start-statd
> -
> -Upstream-Status: Pending
> -
> -make start-statd command to use nfscommon configure, too.
> -
> -Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
> -Signed-off-by: Li Wang <li.wang@windriver.com>
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - utils/statd/start-statd | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> -
> -diff --git a/utils/statd/start-statd b/utils/statd/start-statd
> -index 2fd6039..f591b34 100755
> ---- a/utils/statd/start-statd
> -+++ b/utils/statd/start-statd
> -@@ -17,6 +17,14 @@ then
> -     # statd already running - must have been slow to respond.
> -     exit 0
> - fi
> -+
> -+# Read config
> -+DEFAULTFILE=/etc/default/nfs-common
> -+NEED_IDMAPD=
> -+if [ -f $DEFAULTFILE ]; then
> -+    . $DEFAULTFILE
> -+fi
> -+
> - # First try systemd if it's installed.
> - if [ -d /run/systemd/system ]; then
> -     # Quit only if the call worked.
> -@@ -25,4 +33,4 @@ fi
> - 
> - cd /
> - # Fall back to launching it ourselves.
> --exec rpc.statd --no-notify
> -+exec rpc.statd --no-notify $STATDOPTS
> --- 
> -2.6.6
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
> deleted file mode 100644
> index a1007a7fbf4..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -# Parameters to be passed to nfs-utils (clients & server) service files.
> -#
> -
> -# Options to pass to rpc.nfsd.
> -NFSD_OPTS=""
> -
> -# Number of servers to start up; the default is 8 servers.
> -NFSD_COUNT=""
> -
> -# Where to mount nfsd filesystem; the default is "/proc/fs/nfsd".
> -PROCNFSD_MOUNTPOINT=""
> -
> -# Options used to mount nfsd filesystem; the default is "rw,nodev,noexec,nosuid".
> -PROCNFSD_MOUNTOPTS=""
> -
> -# Options for rpc.mountd.
> -# If you have a port-based firewall, you might want to set up
> -# a fixed port here using the --port option.
> -MOUNTD_OPTS=""
> -
> -# Parameters to be passed to nfs-common (nfs clients & server) init script.
> -#
> -
> -# If you do not set values for the NEED_ options, they will be attempted
> -# autodetected; this should be sufficient for most people. Valid alternatives
> -# for the NEED_ options are "yes" and "no".
> -
> -# Do you want to start the statd daemon? It is not needed for NFSv4.
> -NEED_STATD=""
> -
> -# Options to pass to rpc.statd.
> -# N.B. statd normally runs on both client and server, and run-time
> -# options should be specified accordingly.
> -# STATD_OPTS="-p 32765 -o 32766"
> -STATD_OPTS=""
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount b/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
> deleted file mode 100644
> index 630801b3751..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -[Unit]
> -Description=NFSD configuration filesystem
> -After=systemd-modules-load.service
> -
> -[Mount]
> -What=nfsd
> -Where=/proc/fs/nfsd
> -Type=nfsd
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> index 527fcd609c1..bb155f8568e 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> @@ -21,13 +21,6 @@ USERADD_PARAM:${PN}-client = "--system  --home-dir /var/lib/nfs \
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
>             file://nfsserver \
>             file://nfscommon \
> -           file://nfs-utils.conf \
> -           file://nfs-server.service \
> -           file://nfs-mountd.service \
> -           file://nfs-statd.service \
> -           file://proc-fs-nfsd.mount \
> -           file://nfs-utils-debianize-start-statd.patch \
> -           file://bugfix-adjust-statd-service-name.patch \
>             file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>             file://clang-warnings.patch \
>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
> @@ -48,8 +41,8 @@ INITSCRIPT_PARAMS:${PN}-client = "defaults 19 21"
>  inherit autotools-brokensep update-rc.d systemd pkgconfig
>  
>  SYSTEMD_PACKAGES = "${PN} ${PN}-client"
> -SYSTEMD_SERVICE:${PN} = "nfs-server.service nfs-mountd.service"
> -SYSTEMD_SERVICE:${PN}-client = "nfs-statd.service"
> +SYSTEMD_SERVICE:${PN} = "nfs-server.service"
> +SYSTEMD_SERVICE:${PN}-client = "nfs-client.target"
>  
>  # --enable-uuid is need for cross-compiling
>  EXTRA_OECONF = "--with-statduser=rpcuser \
> @@ -65,7 +58,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
>  LDFLAGS:append = " -lsqlite3 -levent"
>  
>  PACKAGECONFIG ??= "tcp-wrappers \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
>  "
>  PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
> @@ -74,6 +67,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
>  # keyutils is available in meta-oe
>  PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
> +PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd"
>  
>  PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
>  
> @@ -81,14 +75,16 @@ CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
>  			   ${localstatedir}/lib/nfs/rmtab \
>  			   ${localstatedir}/lib/nfs/xtab \
>  			   ${localstatedir}/lib/nfs/statd/state \
> +			   ${sysconfdir}/nfs.conf \
>  			   ${sysconfdir}/nfsmount.conf"
>  
>  FILES:${PN}-client = "${sbindir}/*statd \
>  		      ${libdir}/libnfsidmap.so.* \
>  		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
>  		      ${sbindir}/showmount ${sbindir}/nfsstat \
> +		      ${sbindir}/nfsconf \
>  		      ${localstatedir}/lib/nfs \
> -		      ${sysconfdir}/nfs-utils.conf \
> +		      ${sysconfdir}/nfs.conf \
>  		      ${sysconfdir}/nfsmount.conf \
>  		      ${sysconfdir}/init.d/nfscommon \
>  		      ${systemd_system_unitdir}/nfs-statd.service"
> @@ -108,7 +104,7 @@ FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_libdir}/modp
>  
>  do_configure:prepend() {
>  	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
> -		${S}/utils/mount/Makefile.am
> +		${S}/utils/mount/Makefile.am ${S}/utils/nfsdcltrack/Makefile.am
>  }
>  
>  # Make clean needed because the package comes with
> @@ -125,18 +121,11 @@ do_install:append () {
>  	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
>  	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
>  
> -	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
> -	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}
> +	install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}
>  
>  	install -d ${D}${systemd_system_unitdir}
> -	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
> -	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
> -	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
> -	install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
> -	sed -i -e 's,@SBINDIR@,${sbindir},g' \
> -		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
> -		${D}${systemd_system_unitdir}/*.service
> +	# Retain historical service name so old scripts keep working
> +	ln -s rpc-statd.service ${D}${systemd_system_unitdir}/nfs-statd.service
>  	# Add compatibility symlinks for the sysvinit scripts
>  	ln -s nfs-server.service ${D}${systemd_system_unitdir}/nfsserver.service
>  	ln -s /dev/null ${D}${systemd_system_unitdir}/nfscommon.service
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197859): https://lists.openembedded.org/g/openembedded-core/message/197859
> Mute This Topic: https://lists.openembedded.org/mt/105279024/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

