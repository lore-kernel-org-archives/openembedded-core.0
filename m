Return-Path: <wei.tee.ng@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 93FE975618
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 07:46:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jun 2015 00:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,643,1427785200"; d="scan'208";a="730491514"
Received: from weiteeng-ilbpg1.png.intel.com ([10.88.227.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2015 00:46:28 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2015 15:46:19 +0800
Message-Id: <1434699981-8983-2-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
References: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH 1/3][dizzy] recipes-connectivity: Add hostapd configuration for enabling Marvell 8897 WiFi feature
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
X-List-Received-Date: Fri, 19 Jun 2015 07:46:27 -0000

From: Ng Shui Lei <shui.lei.ng@intel.com>

Hostapd feature was created in the recipes-connectivity
layer to enable Marvell 8897 module in AP mode and STA mode.

Signed-off-by: Ng Shui Lei <shui.lei.ng@intel.com>
Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
---
 .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++++++++
 .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
 meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
 meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
 4 files changed, 262 insertions(+)
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb

diff --git a/meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig b/meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
new file mode 100644
index 0000000..2789640
--- /dev/null
+++ b/meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
@@ -0,0 +1,145 @@
+# Example hostapd build time configuration
+#
+# This file lists the configuration options that are used when building the
+# hostapd binary. All lines starting with # are ignored. Configuration option
+# lines must be commented out complete, if they are not to be included, i.e.,
+# just setting VARIABLE=n is not disabling that variable.
+#
+# This file is included in Makefile, so variables like CFLAGS and LIBS can also
+# be modified from here. In most cass, these lines should use += in order not
+# to override previous values of the variables.
+
+# Driver interface for Host AP driver
+CONFIG_DRIVER_HOSTAP=y
+
+# Driver interface for wired authenticator
+CONFIG_DRIVER_WIRED=y
+
+# Driver interface for madwifi driver
+#CONFIG_DRIVER_MADWIFI=y
+#CFLAGS += -I../../madwifi # change to the madwifi source directory
+
+# Driver interface for Prism54 driver
+CONFIG_DRIVER_PRISM54=y
+
+# Driver interface for drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL32=y
+# driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
+# shipped with your distribution yet. If that is the case, you need to build
+# newer libnl version and point the hostapd build to use it.
+#LIBNL=/usr/src/libnl
+#CFLAGS += -I$(LIBNL)/include
+#LIBS += -L$(LIBNL)/lib
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+
+# Driver interface for no driver (e.g., RADIUS server only)
+#CONFIG_DRIVER_NONE=y
+
+# IEEE 802.11F/IAPP
+CONFIG_IAPP=y
+
+# WPA2/IEEE 802.11i RSN pre-authentication
+CONFIG_RSN_PREAUTH=y
+
+# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
+CONFIG_PEERKEY=y
+
+# IEEE 802.11w (management frame protection)
+# This version is an experimental implementation based on IEEE 802.11w/D1.0
+# draft and is subject to change since the standard has not yet been finalized.
+# Driver support is also needed for IEEE 802.11w.
+#CONFIG_IEEE80211W=y
+
+# Integrated EAP server
+CONFIG_EAP=y
+
+# EAP-MD5 for the integrated EAP server
+CONFIG_EAP_MD5=y
+
+# EAP-TLS for the integrated EAP server
+CONFIG_EAP_TLS=y
+
+# EAP-MSCHAPv2 for the integrated EAP server
+CONFIG_EAP_MSCHAPV2=y
+
+# EAP-PEAP for the integrated EAP server
+CONFIG_EAP_PEAP=y
+
+# EAP-GTC for the integrated EAP server
+CONFIG_EAP_GTC=y
+
+# EAP-TTLS for the integrated EAP server
+CONFIG_EAP_TTLS=y
+
+# EAP-SIM for the integrated EAP server
+#CONFIG_EAP_SIM=y
+
+# EAP-AKA for the integrated EAP server
+#CONFIG_EAP_AKA=y
+
+# EAP-AKA' for the integrated EAP server
+# This requires CONFIG_EAP_AKA to be enabled, too.
+#CONFIG_EAP_AKA_PRIME=y
+
+# EAP-PAX for the integrated EAP server
+#CONFIG_EAP_PAX=y
+
+# EAP-PSK for the integrated EAP server (this is _not_ needed for WPA-PSK)
+#CONFIG_EAP_PSK=y
+
+# EAP-SAKE for the integrated EAP server
+#CONFIG_EAP_SAKE=y
+
+# EAP-GPSK for the integrated EAP server
+#CONFIG_EAP_GPSK=y
+# Include support for optional SHA256 cipher suite in EAP-GPSK
+#CONFIG_EAP_GPSK_SHA256=y
+
+# EAP-FAST for the integrated EAP server
+# Note: Default OpenSSL package does not include support for all the
+# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
+# the OpenSSL library must be patched (openssl-0.9.9-session-ticket.patch)
+# to add the needed functions.
+#CONFIG_EAP_FAST=y
+
+# Wi-Fi Protected Setup (WPS)
+CONFIG_WPS=y
+# Enable UPnP support for external WPS Registrars
+#CONFIG_WPS_UPNP=y
+
+# EAP-IKEv2
+#CONFIG_EAP_IKEV2=y
+
+# Trusted Network Connect (EAP-TNC)
+#CONFIG_EAP_TNC=y
+
+# PKCS#12 (PFX) support (used to read private key and certificate file from
+# a file that usually has extension .p12 or .pfx)
+CONFIG_PKCS12=y
+
+# RADIUS authentication server. This provides access to the integrated EAP
+# server from external hosts using RADIUS.
+CONFIG_RADIUS_SERVER=y
+
+# Build IPv6 support for RADIUS operations
+CONFIG_IPV6=y
+
+# IEEE Std 802.11r-2008 (Fast BSS Transition)
+#CONFIG_IEEE80211R=y
+
+# Use the hostapd's IEEE 802.11 authentication (ACL), but without
+# the IEEE 802.11 Management capability (e.g., madwifi or FreeBSD/net80211)
+CONFIG_DRIVER_RADIUS_ACL=y
+
+# IEEE 802.11n (High Throughput) support
+CONFIG_IEEE80211N=y
+
+# Remove debugging code that is printing out debug messages to stdout.
+# This can be used to reduce the size of the hostapd considerably if debugging
+# code is not needed.
+#CONFIG_NO_STDOUT_DEBUG=y
diff --git a/meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service b/meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
new file mode 100644
index 0000000..151c050
--- /dev/null
+++ b/meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Hostapd IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/hostapd.pid
+ExecStart=@SBINDIR@/hostapd @SYSCONFDIR@/hostapd.conf -P /run/hostapd.pid -B
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/hostapd/hostapd-2.2/init b/meta/recipes-connectivity/hostapd/hostapd-2.2/init
new file mode 100644
index 0000000..8ba4e07
--- /dev/null
+++ b/meta/recipes-connectivity/hostapd/hostapd-2.2/init
@@ -0,0 +1,58 @@
+#!/bin/sh
+DAEMON=/usr/sbin/hostapd
+NAME=hostapd
+DESC="HOSTAP Daemon"
+ARGS="/etc/hostapd.conf -B"
+
+test -f $DAEMON || exit 0
+
+set -e
+
+# source function library
+. /etc/init.d/functions
+
+delay_stop() {
+	count=0
+	while [ $count -lt 9 ] ; do
+	        if pidof $DAEMON >/dev/null; then
+	                sleep 1
+	        else
+	                return 0
+	        fi
+		count=`expr $count + 1`
+	done
+	echo "Failed to stop $DESC."
+	return 1
+}
+
+case "$1" in
+    start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon -S -x $DAEMON -- $ARGS
+	echo "$NAME."
+	;;
+    stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K --oknodo -x $DAEMON
+	echo "$NAME."
+	;;
+    restart)
+	$0 stop
+	delay_stop && $0 start
+	;;
+    reload)
+	echo -n "Reloading $DESC: "
+	killall -HUP $(basename ${DAEMON})
+	echo "$NAME."
+	;;
+    status)
+	status $DAEMON
+	exit $?
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart|reload|status}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta/recipes-connectivity/hostapd/hostapd_2.2.bb b/meta/recipes-connectivity/hostapd/hostapd_2.2.bb
new file mode 100644
index 0000000..b75f2b9
--- /dev/null
+++ b/meta/recipes-connectivity/hostapd/hostapd_2.2.bb
@@ -0,0 +1,48 @@
+HOMEPAGE = "http://hostap.epitest.fi"
+SECTION = "kernel/userland"
+LICENSE = "GPLv2 | BSD"
+LIC_FILES_CHKSUM = "file://README;md5=0854a4da34ac3990770794d771fac7fd"
+DEPENDS = "libnl openssl"
+SUMMARY = "User space daemon for extended IEEE 802.11 management"
+
+inherit update-rc.d systemd
+INITSCRIPT_NAME = "hostapd"
+
+SYSTEMD_SERVICE_${PN} = "hostapd.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = " \
+    http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
+    file://defconfig \
+    file://init \
+    file://hostapd.service \
+"
+
+S = "${WORKDIR}/hostapd-${PV}/hostapd"
+
+
+do_configure() {
+    install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+}
+
+do_compile() {
+    export CFLAGS="-MMD -O2 -Wall -g -I${STAGING_INCDIR}/libnl3"
+    make
+}
+
+do_install() {
+    install -d ${D}${sbindir} ${D}${sysconfdir}/init.d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
+    install -m 0755 ${S}/hostapd ${D}${sbindir}
+    install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
+    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
+    install -m 0644 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
+    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/hostapd.service
+}
+
+CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
+
+SRC_URI[md5sum] = "23c1f78a693c3288802d516adb7fd289"
+SRC_URI[sha256sum] = "f15b6bcb434378860ea5b88dffed7f54d8cb71fff2146de0f006977a5e25a882"
-- 
1.7.9.5


