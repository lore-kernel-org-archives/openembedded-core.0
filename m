Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AEB5A77234
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 12 Nov 2015 07:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,282,1444719600"; d="scan'208";a="599162151"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2015 07:39:17 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B5AE16A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:38:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 17:39:48 +0200
Message-Id: <1447342788-21575-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] wireless-tools: remove unused files
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
X-List-Received-Date: Thu, 12 Nov 2015 15:39:28 -0000

Remove wireless-tools.if-pre-up and zzz-wireless.if-pre-up.
As per the comment, these files were not in use from 20/8/08.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../wireless-tools/wireless-tools.if-pre-up        | 122 ---------------------
 .../wireless-tools/zzz-wireless.if-pre-up          |  34 ------
 .../wireless-tools/wireless-tools_30.pre9.bb       |   6 -
 3 files changed, 162 deletions(-)
 delete mode 100755 meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up b/meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up
deleted file mode 100755
index 2518a5c..0000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up
+++ /dev/null
@@ -1,122 +0,0 @@
-#!/bin/sh
-
-case "$METHOD" in loopback) exit 0 ;; esac
-
-IWCONFIG=/sbin/iwconfig
-IWPRIV=/sbin/iwpriv
-
-if [ ! -x $IWCONFIG ]; then
-  exit 0
-fi
-
-# Detect and do nothing for linux-wlan-ng interfaces;
-# which are configured by thier own if-pre-up script.
-if [ -n "$IF_WIRELESS_TYPE" -a "$IF_WIRELESS_TYPE" = "wlan-ng" ]; then
-  exit 0
-fi
-
-if [ -n "$IF_NEEDS_RESET" ]; then
-  $IWPRIV "$IFACE" reset 1
-  sleep 1
-fi
-
-if [ -n "$IF_NEEDS_FIRMWARE" ]; then
-  $IF_NEEDS_FIRMWARE "$IFACE"
-fi
-
-if [ -n "$IF_WIRELESS_SENS" ]; then
-  $IWCONFIG "$IFACE" sens $IF_WIRELESS_SENS
-fi
-
-if [ -n "$IF_WIRELESS_RATE" ]; then
-  $IWCONFIG "$IFACE" rate $IF_WIRELESS_RATE
-fi
-
-if [ -n "$IF_WIRELESS_RTS" ]; then
-  $IWCONFIG "$IFACE" rts $IF_WIRELESS_RTS
-fi
-
-if [ -n "$IF_WIRELESS_FRAG" ]; then
-  $IWCONFIG "$IFACE" frag $IF_WIRELESS_FRAG
-fi
-
-if [ -n "$IF_WIRELESS_POWER" ]; then
-  $IWCONFIG "$IFACE" power $IF_WIRELESS_POWER
-fi
-
-if [ -n "$IF_WIRELESS_POWERPERIOD" ]; then
-  $IWCONFIG "$IFACE" power period $IF_WIRELESS_POWERPERIOD
-fi
-
-if [ -n "$IF_WIRELESS_POWERTIMEOUT" ]; then
-  $IWCONFIG "$IFACE" power timeout $IF_WIRELESS_POWERTIMEOUT
-fi
-
-if [ -n "$IF_WIRELESS_TXPOWER" ]; then
-  $IWCONFIG "$IFACE" txpower $IF_WIRELESS_TXPOWER
-fi
-
-if [ -n "$IF_WIRELESS_RETRY" ]; then
-  $IWCONFIG "$IFACE" retry $IF_WIRELESS_RETRY
-fi
-
-if [ -n "$IF_WIRELESS_NICK" ]; then
-  $IWCONFIG "$IFACE" nick "$IF_WIRELESS_NICK"
-fi
-
-if [ -n "$IF_WIRELESS_NWID" ]; then
-  $IWCONFIG "$IFACE" nwid "$IF_WIRELESS_NWID"
-fi
-
-if [ -n "$IF_WIRELESS_ENC" ]; then
-  eval $IWCONFIG "$IFACE" enc $IF_WIRELESS_ENC
-fi
-
-if [ -n "$IF_WIRELESS_KEY" ]; then
-  eval $IWCONFIG "$IFACE" key $IF_WIRELESS_KEY
-fi
-
-if [ -n "$IF_WIRELESS_KEY1" ]; then
-  $IWCONFIG "$IFACE" key [1] "$IF_WIRELESS_KEY1"
-fi
-
-if [ -n "$IF_WIRELESS_KEY2" ]; then
-  $IWCONFIG "$IFACE" key [2] "$IF_WIRELESS_KEY2"
-fi
-
-if [ -n "$IF_WIRELESS_KEY3" ]; then
-  $IWCONFIG "$IFACE" key [3] "$IF_WIRELESS_KEY3"
-fi
-
-if [ -n "$IF_WIRELESS_KEY4" ]; then
-  $IWCONFIG "$IFACE" key [4] "$IF_WIRELESS_KEY4"
-fi
-
-if [ -n "$IF_WIRELESS_DEFAULTKEY" ]; then
-  $IWCONFIG "$IFACE" key ["$IF_WIRELESS_DEFAULTKEY"]
-fi
-
-if [ -n "$IF_WIRELESS_KEYMODE" ]; then
-  $IWCONFIG "$IFACE" key "$IF_WIRELESS_KEYMODE"
-fi
-
-if [ -n "$IF_WIRELESS_MODE" ]; then
-  $IWCONFIG "$IFACE" mode $IF_WIRELESS_MODE
-fi
-
-if [ -n "$IF_WIRELESS_FREQ" ]; then
-  $IWCONFIG "$IFACE" freq $IF_WIRELESS_FREQ
-fi
-
-if [ -n "$IF_WIRELESS_CHANNEL" ]; then
-  $IWCONFIG "$IFACE" channel $IF_WIRELESS_CHANNEL
-fi
-
-if [ -n "$IF_WIRELESS_ESSID" ]; then
-  $IWCONFIG "$IFACE" essid "$IF_WIRELESS_ESSID"
-fi
-
-if [ -n "$IF_WIRELESS_COMMIT" ]; then
-  $IWCONFIG "$IFACE" commit
-fi
-
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up b/meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up
deleted file mode 100644
index 4c8e95b..0000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up
+++ /dev/null
@@ -1,34 +0,0 @@
-#!/bin/sh
-#
-# /etc/network/if-pre-up.d/zzz-wireless
-# by Stefan Tomanek (stefan@pico.ruhr.de)
-
-
-IWCONFIG=/sbin/iwconfig
-IFCONFIG=/sbin/ifconfig
-GREP=/bin/grep
-LOGGER=/usr/bin/logger
-SLEEP=/bin/sleep
-
-# How long do we wait for association?
-RETRIES=15
-SLEEPTIME=1
-
-# Only sleep if we use DHCP (add others methods seperated by spaces)
-ONLY_FOR="static dhcp"
-
-if [ -z "$IF_WIRELESS_TYPE" ] && echo "$ONLY_FOR" | grep -q "$METHOD" ; then
-	$IFCONFIG $IFACE up
-	$LOGGER Checking for WLAN association...
-	while ( [ $RETRIES -gt 0 ] && ($IWCONFIG "$IFACE" | $GREP -q "Access Point: Not-Associated") ); do
-		$LOGGER No association yet, $RETRIES retries until timeout
-		RETRIES=$(($RETRIES-1))
-		$SLEEP $SLEEPTIME
-	done
-	
-	if [ $RETRIES -eq 0 ]; then
-		$LOGGER Timeout waiting for association, continuing anyway...
-	else
-		$LOGGER Found association!
-	fi
-fi
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
index 26ecdf3..38ad86e 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
@@ -9,8 +9,6 @@ SECTION = "base"
 PE = "1"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.${PV}.tar.gz \
-           file://wireless-tools.if-pre-up \
-           file://zzz-wireless.if-pre-up \
            file://remove.ldconfig.call.patch \
            file://man.patch \
            file://avoid_strip.patch \
@@ -36,10 +34,6 @@ do_install() {
 	oe_runmake PREFIX=${D} install-iwmulticall install-dynamic install-man install-hdr
 	install -d ${D}${sbindir}
 	install -m 0755 ifrename ${D}${sbindir}/ifrename
-	# Disabled by RP - 20/8/08 - We don't seem to need/use these
-	#install -d ${D}${sysconfdir}/network/if-pre-up.d
-	#install ${WORKDIR}/wireless-tools.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/wireless-tools
-	#install ${WORKDIR}/zzz-wireless.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/zzz-wireless
 }
 
 PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
-- 
2.4.0


