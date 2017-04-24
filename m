Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 11A0B77A67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:16:04 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2017 06:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,244,1488873600"; d="scan'208";a="93097211"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2017 06:16:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 16:15:50 +0300
Message-Id: <20170424131551.2212-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170424131551.2212-1-alexander.kanavin@linux.intel.com>
References: <20170424131551.2212-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] portmap: remove recipe
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
X-List-Received-Date: Mon, 24 Apr 2017 13:16:07 -0000

It was dropped from Debian years ago, and superseded by rpcbind (which we also ship).
https://packages.qa.debian.org/p/portmap.html

The upstream source is no longer available either since a few days ago.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/portmap/portmap.inc      | 17 ------
 .../portmap/portmap/destdir-no-strip.patch         | 46 ---------------
 .../portmap/portmap/portmap.init                   | 67 ----------------------
 .../portmap/portmap/portmap.service                | 10 ----
 .../portmap/portmap/tcpd-config.patch              | 30 ----------
 meta/recipes-connectivity/portmap/portmap_6.0.bb   | 35 -----------
 6 files changed, 205 deletions(-)
 delete mode 100644 meta/recipes-connectivity/portmap/portmap.inc
 delete mode 100644 meta/recipes-connectivity/portmap/portmap/destdir-no-strip.patch
 delete mode 100755 meta/recipes-connectivity/portmap/portmap/portmap.init
 delete mode 100644 meta/recipes-connectivity/portmap/portmap/portmap.service
 delete mode 100644 meta/recipes-connectivity/portmap/portmap/tcpd-config.patch
 delete mode 100644 meta/recipes-connectivity/portmap/portmap_6.0.bb

diff --git a/meta/recipes-connectivity/portmap/portmap.inc b/meta/recipes-connectivity/portmap/portmap.inc
deleted file mode 100644
index 338af33a387..00000000000
--- a/meta/recipes-connectivity/portmap/portmap.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "RPC program number mapper"
-HOMEPAGE = "http://neil.brown.name/portmap/"
-SECTION = "console/network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://portmap.c;beginline=2;endline=31;md5=51ff67e66ec84b2009b017b1f94afbf4 \
-                    file://from_local.c;beginline=9;endline=35;md5=1bec938a2268b8b423c58801ace3adc1"
-
-INITSCRIPT_NAME = "portmap"
-INITSCRIPT_PARAMS = "start 10 2 3 4 5 . stop 32 0 1 6 ."
-
-inherit update-rc.d systemd
-
-SYSTEMD_SERVICE_${PN} = "portmap.service"
-
-PACKAGES =+ "portmap-utils"
-FILES_portmap-utils = "${base_sbindir}/pmap_set ${base_sbindir}/pmap_dump"
-FILES_${PN}-doc += "${docdir}"
diff --git a/meta/recipes-connectivity/portmap/portmap/destdir-no-strip.patch b/meta/recipes-connectivity/portmap/portmap/destdir-no-strip.patch
deleted file mode 100644
index 2fbf784b737..00000000000
--- a/meta/recipes-connectivity/portmap/portmap/destdir-no-strip.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Backport
-
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sun, 13 May 2007 21:15:12 +0000 (-0400)
-Subject: respect DESTDIR and dont use -s with install
-X-Git-Url: http://neil.brown.name/git?p=portmap;a=commitdiff_plain;h=603c59b978c04df2354f68d4a2dc676a758ff46d
-
-respect DESTDIR and dont use -s with install
-
-$(DESTDIR) is the standard for installing into other trees, not $(BASEDIR) ...
-so I've converted the Makefile to use that.  I've also left in $(BASEDIR) as a
-default to support old installs; not sure if you'd just cut it.
-
-Stripping should be left to the person to handle, not automatically done by
-the install step.  Also, `install -s` always calls `strip` which is
-wrong/undesired in cross-compiling scenarios.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Neil Brown <neilb@suse.de>
----
-
-diff --git a/Makefile b/Makefile
-index 9e9a4b4..5343428 100644
---- a/Makefile
-+++ b/Makefile
-@@ -135,13 +135,14 @@ from_local: CPPFLAGS += -DTEST
- portmap.man : portmap.8
- 	sed $(MAN_SED) < portmap.8 > portmap.man
- 
-+DESTDIR = $(BASEDIR)
- install: all
--	install -o root -g root -m 0755 -s portmap ${BASEDIR}/sbin
--	install -o root -g root -m 0755 -s pmap_dump ${BASEDIR}/sbin
--	install -o root -g root -m 0755 -s pmap_set ${BASEDIR}/sbin
--	install -o root -g root -m 0644 portmap.man ${BASEDIR}/usr/share/man/man8/portmap.8
--	install -o root -g root -m 0644 pmap_dump.8 ${BASEDIR}/usr/share/man/man8
--	install -o root -g root -m 0644 pmap_set.8 ${BASEDIR}/usr/share/man/man8
-+	install -o root -g root -m 0755 portmap $(DESTDIR)/sbin
-+	install -o root -g root -m 0755 pmap_dump $(DESTDIR)/sbin
-+	install -o root -g root -m 0755 pmap_set $(DESTDIR)/sbin
-+	install -o root -g root -m 0644 portmap.man $(DESTDIR)/usr/share/man/man8/portmap.8
-+	install -o root -g root -m 0644 pmap_dump.8 $(DESTDIR)/usr/share/man/man8
-+	install -o root -g root -m 0644 pmap_set.8 $(DESTDIR)/usr/share/man/man8
- 
- clean:
- 	rm -f *.o portmap pmap_dump pmap_set from_local \
diff --git a/meta/recipes-connectivity/portmap/portmap/portmap.init b/meta/recipes-connectivity/portmap/portmap/portmap.init
deleted file mode 100755
index 621aa171ae6..00000000000
--- a/meta/recipes-connectivity/portmap/portmap/portmap.init
+++ /dev/null
@@ -1,67 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides:          portmap
-# Required-Start:    $network
-# Required-Stop:     $network
-# Default-Start:     S 2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: The RPC portmapper
-# Description:       Portmap is a server that converts RPC (Remote
-#                    Procedure Call) program numbers into DARPA
-#                    protocol port numbers. It must be running in
-#                    order to make RPC calls. Services that use
-#                    RPC include NFS and NIS.
-### END INIT INFO
-
-test -f /sbin/portmap || exit 0
-
-case "$1" in
-    start)
-	echo "Starting portmap daemon..."
-        start-stop-daemon --start --quiet --exec /sbin/portmap
-
-	if [ -f /var/run/portmap.upgrade-state ]; then
-          echo "Restoring old RPC service information..."
-          sleep 1 # needs a short pause or pmap_set won't work. :(
-	  pmap_set </var/run/portmap.upgrade-state
-	  rm -f /var/run/portmap.upgrade-state
-          echo "done."
-        fi
-
-	;;
-    stop)
-        echo "Stopping portmap daemon..."
-        start-stop-daemon --stop --quiet --exec /sbin/portmap
-	;;
-    reload)
-	;;
-    force-reload)
-        $0 restart
-	;;
-    restart)
-	# pmap_dump and pmap_set may be in a different package and not installed...
-	if [ -f /sbin/pmap_dump -a -f /sbin/pmap_set ]; then
-		do_state=1
-	else
-		do_state=0
-	fi
-	[ $do_state -eq 1 ] && pmap_dump >/var/run/portmap.state
-        $0 stop
-        $0 start
-	if [ $do_state -eq 1 ]; then
-	  if [ ! -f /var/run/portmap.upgrade-state ]; then
-            sleep 1
-	    pmap_set </var/run/portmap.state
-	  fi
-	  rm -f /var/run/portmap.state
-	fi
-	;;
-    *)
-	echo "Usage: /etc/init.d/portmap {start|stop|reload|restart}"
-	exit 1
-	;;
-esac
-
-exit 0
-
diff --git a/meta/recipes-connectivity/portmap/portmap/portmap.service b/meta/recipes-connectivity/portmap/portmap/portmap.service
deleted file mode 100644
index 7ef9d7b02e5..00000000000
--- a/meta/recipes-connectivity/portmap/portmap/portmap.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=The RPC portmapper
-After=network.target
-
-[Service]
-Type=forking
-ExecStart=@BASE_SBINDIR@/portmap
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/portmap/portmap/tcpd-config.patch b/meta/recipes-connectivity/portmap/portmap/tcpd-config.patch
deleted file mode 100644
index 2f25058095b..00000000000
--- a/meta/recipes-connectivity/portmap/portmap/tcpd-config.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sun, 13 May 2007 21:17:32 +0000 (-0400)
-Subject: fix building with tcpd support disabled
-X-Git-Url: http://neil.brown.name/git?p=portmap;a=commitdiff_plain;h=7847207aed1b44faf077eed14a9ac9c68244eba5
-
-fix building with tcpd support disabled
-
-Make sure pmap_check.c only includes tcpd.h when HOSTS_ACCESS is defined.
-
-Signed-off-by: Timothy Redaelli <drizzt@gentoo.org>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Neil Brown <neilb@suse.de>
----
-
-diff --git a/pmap_check.c b/pmap_check.c
-index 84f2c12..443a822 100644
---- a/pmap_check.c
-+++ b/pmap_check.c
-@@ -44,7 +44,9 @@
- #include <netinet/in.h>
- #include <rpc/rpcent.h>
- #endif
-+#ifdef HOSTS_ACCESS
- #include <tcpd.h>
-+#endif
- #include <arpa/inet.h>
- #include <grp.h>
- 
diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
deleted file mode 100644
index 999b4a93747..00000000000
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require portmap.inc
-
-DEPENDS_append_libc-musl = " libtirpc "
-
-PR = "r9"
-
-SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
-           file://destdir-no-strip.patch \
-           file://tcpd-config.patch \
-           file://portmap.init \
-           file://portmap.service"
-
-SRC_URI[md5sum] = "ac108ab68bf0f34477f8317791aaf1ff"
-SRC_URI[sha256sum] = "02c820d39f3e6e729d1bea3287a2d8a6c684f1006fb9612f97dcad4a281d41de"
-
-S = "${WORKDIR}/${BPN}_${PV}/"
-
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
-
-CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS -DHOSTS_ACCESS"
-CFLAGS += "-Wall -Wstrict-prototypes -fPIC"
-EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
-LDFLAGS_append_libc-musl = " -ltirpc "
-
-do_install() {
-    install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/portmap.init ${D}${sysconfdir}/init.d/portmap
-    oe_runmake install DESTDIR=${D}
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/portmap.service
-}
-- 
2.11.0


