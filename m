Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T4DSX-0007ag-2S
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:07:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2012 08:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,808,1336374000"; d="scan'208";a="184070496"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.122])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2012 08:50:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 16:50:27 +0100
Message-Id: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] zeroconf: remove
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
X-List-Received-Date: Wed, 22 Aug 2012 16:07:09 -0000

We already have avahi in OE-Core and some cursory research suggests that
avahi is preferred over this package, which has apparently not seen a
release since 2006. Nothing in OE-Core actually refers to it, so let's just
remove it.

CC: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../zeroconf/zeroconf/compilefix.patch             |   19 --------
 .../zeroconf/zeroconf/debian-zeroconf              |   51 --------------------
 .../zeroconf/zeroconf/zeroconf-default             |   17 -------
 meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb |   34 -------------
 4 files changed, 121 deletions(-)
 delete mode 100644 meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch
 delete mode 100644 meta/recipes-connectivity/zeroconf/zeroconf/debian-zeroconf
 delete mode 100644 meta/recipes-connectivity/zeroconf/zeroconf/zeroconf-default
 delete mode 100644 meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb

diff --git a/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch b/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch
deleted file mode 100644
index 328e574..0000000
--- a/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-| zeroconf.c: In function 'main':
-| zeroconf.c:145: error: 'PATH_MAX' undeclared (first use in this function)
-
-RP - 4/9/09
-
-Upstream-Status: Pending
-
-Index: zeroconf-0.9/zeroconf.c
-===================================================================
---- zeroconf-0.9.orig/zeroconf.c	2009-09-04 10:05:25.000000000 +0100
-+++ zeroconf-0.9/zeroconf.c	2009-09-04 10:05:42.000000000 +0100
-@@ -33,6 +33,7 @@
- #include <net/if_arp.h>
- #include <sys/time.h>
- #include <signal.h>
-+#include <limits.h>
- 
- #include "delay.h"
- 
diff --git a/meta/recipes-connectivity/zeroconf/zeroconf/debian-zeroconf b/meta/recipes-connectivity/zeroconf/zeroconf/debian-zeroconf
deleted file mode 100644
index c3705d2..0000000
--- a/meta/recipes-connectivity/zeroconf/zeroconf/debian-zeroconf
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/bin/sh
-
-if [ ! -x /usr/sbin/zeroconf ]; then
-    exit 0
-fi
-
-# IPv4 link-local addresses (zeroconf) are
-# only applicable on the 'inet' address family
-[ "X$ADDRFAM" != "Xinet" ] && exit 0
-
-# However there are some methods where it doesn't
-# make any sense to configure an IPv4LL address
-
-# not on loopback
-[ "X$METHOD" = "Xloopback" ] && exit 0
-
-# not on ppp or wvdial either
-[ "X$METHOD" = "Xppp" ] && exit 0
-[ "X$METHOD" = "Xwvdial" ] && exit 0
-
-# The administrator may have blacklisted interfaces
-# or only want zeroconf in a fallback situation
-[ -f /etc/default/zeroconf ] &&
-    . /etc/default/zeroconf
-
-[ -n "$DISABLE" ] && exit 0
-
-for BLACK in $IFBLACKLIST; do
-    case $IFACE in
-	$BLACK)
-	exit 0
-	;;
-    esac
-done
-
-# should we only allocate an address if we do not already have one?
-if [ -n "$FALLBACK" ]; then
-    /bin/ip addr show $IFACE scope global | grep -q "inet"
-    IP=$?
-    if [ $IP -eq 0 ]; then
-        /bin/ip route add 169.254.0.0/16 dev $IFACE
-        exit 0
-    fi
-fi
-
-# otherwise, run if we aren't already going
-if [ ! -r /var/run/zeroconf.$IFACE.pid ]; then
-	/usr/sbin/zeroconf -i $IFACE
-fi
-
-exit 0
diff --git a/meta/recipes-connectivity/zeroconf/zeroconf/zeroconf-default b/meta/recipes-connectivity/zeroconf/zeroconf/zeroconf-default
deleted file mode 100644
index cc07b27..0000000
--- a/meta/recipes-connectivity/zeroconf/zeroconf/zeroconf-default
+++ /dev/null
@@ -1,17 +0,0 @@
-# Default for zeroconf
-
-# disable zeroconf
-# If you want to disable zeroconf completely, uncomment the following line
-# this may be useful if you are debugging zeroconf or starting it manually
-#DISABLE=yes
-
-# black-listed interfaces
-# Interfaces which you never wish to have zeroconf run on should
-# be listed here. e.g. "eth2 wlan1" in a space seperated string
-IFBLACKLIST=""
-
-# fallback only
-# If you would only like a link-local address if you were unable to
-# obtain an address via DHCP then uncomment the following line
-#FALLBACK=yes
-
diff --git a/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb b/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb
deleted file mode 100644
index f755940..0000000
--- a/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "IPv4 link-local address allocator"
-DESCRIPTION = "Zeroconf is a program that is used to claim IPv4 \
-link-local addresses. IPv4 link-local addresses are useful when setting \
-up ad-hoc networking between devices without the involvement of a either \
-a DHCP server or network administrator. \
-These addresses are allocated from the 169.254.0.0/16 address range and \
-are normally attached to each Ethernet device in your computer. \
-Addresses are assigned randomly by each host and, in case of collision, \
-both hosts (are supposed to) renumber."
-AUTHOR = "Anand Kumria <wildfire@progsoc.uts.edu.au>"
-HOMEPAGE = "http://www.progsoc.org/~wildfire/zeroconf/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
-                    file://zeroconf.c;beginline=1;endline=13;md5=a5bada96e1e34b08eb7446b28e2630b2"
-SECTION = "net"
-
-PR = "r1"
-
-SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.gz \
-           file://compilefix.patch \
-           file://zeroconf-default \
-           file://debian-zeroconf"
-
-SRC_URI[md5sum] = "bdafb16b008ebb5633e4e581f77821d2"
-SRC_URI[sha256sum] = "a8c74df127753e2310fa1e072f3c9ca44a404bb0bbce9cfec7a84c6dff8bec7b"
-
-do_install () {
-	install -d ${D}${sbindir}
-	install -d ${D}${sysconfdir}/network/if-up.d
-	install -d ${D}${sysconfdir}/default
-	install -c -m 755 ${S}/zeroconf ${D}${sbindir}/zeroconf
-	install -c -m 755 ${WORKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
-	install -c ${WORKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
-}
-- 
1.7.9.5



