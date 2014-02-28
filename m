Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2719F6F137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 15:40:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2014 07:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="464234195"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 28 Feb 2014 07:40:39 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 17:43:34 +0200
Message-Id: <1393602214-24659-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH V2] wpa-supplicant: upgrade to 2.1
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
X-List-Received-Date: Fri, 28 Feb 2014 15:40:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- USE {BP} variable;
- Updated naming scheme;
- Updated copyright owners.
- Update defconfig file, is now in
  sync with current version;
  as such, more functionality can
  be enabled for wpa-supplicant.
- removed register-autoscan-correctly.patch,
  included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{wpa-supplicant-2.0.inc => wpa-supplicant.inc} |   8 +-
 .../wpa-supplicant/wpa-supplicant/defconfig-gnutls | 186 +++++++++++++++++----
 .../register-autoscan-correctly.patch              |  51 ------
 .../wpa-supplicant/wpa-supplicant_2.0.bb           |   6 -
 .../wpa-supplicant/wpa-supplicant_2.1.bb           |   2 +
 5 files changed, 162 insertions(+), 91 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-2.0.inc => wpa-supplicant.inc} (91%)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
similarity index 91%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index f9c5ea7..11e8287 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -4,8 +4,8 @@ BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=cba4fa09fa364da845ca546f21008909"
+                    file://README;beginline=1;endline=56;md5=a07250b28e857455336bb59fc31cb845 \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=e8e021e30f3a6ab7c341b66b86626a5a"
 DEPENDS = "gnutls dbus libnl openssl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -21,7 +21,9 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://fix-libnl3-host-contamination.patch \
-           file://register-autoscan-correctly.patch"
+          "
+SRC_URI[md5sum] = "e96b8db5a8171cd17a5b2012d6ad7cc7"
+SRC_URI[sha256sum] = "91632e7e3b49a340ce408e2f978a93546a697383abf2e5a60f146faae9e1b277"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
index 92573e2..92ef823 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
@@ -78,12 +78,29 @@ CONFIG_DRIVER_HOSTAP=y
 #CONFIG_DRIVER_RALINK=y
 
 # Driver interface for generic Linux wireless extensions
+# Note: WEXT is deprecated in the current Linux kernel version and no new
+# functionality is added to it. nl80211-based interface is the new
+# replacement for WEXT and its use allows wpa_supplicant to properly control
+# the driver to improve existing functionality like roaming and to support new
+# functionality.
 CONFIG_DRIVER_WEXT=y
 
 # Driver interface for Linux drivers using the nl80211 kernel interface
-CONFIG_LIBNL32=y
 CONFIG_DRIVER_NL80211=y
 
+# driver_nl80211.c requires libnl. If you are compiling it yourself
+# you may need to point hostapd to your version of libnl.
+#
+#CFLAGS += -I$<path to libnl include files>
+#LIBS += -L$<path to libnl library files>
+
+# Use libnl v2.0 (or 3.0) libraries.
+#CONFIG_LIBNL20=y
+
+# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignored)
+CONFIG_LIBNL32=y
+
+
 # Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
 #CONFIG_DRIVER_BSD=y
 #CFLAGS += -I/usr/local/include
@@ -110,11 +127,6 @@ CONFIG_DRIVER_NL80211=y
 # Driver interface for development testing
 #CONFIG_DRIVER_TEST=y
 
-# Include client MLME (management frame processing) for test driver
-# This can be used to test MLME operations in hostapd with the test interface.
-# space.
-#CONFIG_CLIENT_MLME=y
-
 # Driver interface for wired Ethernet drivers
 CONFIG_DRIVER_WIRED=y
 
@@ -144,10 +156,9 @@ CONFIG_EAP_PEAP=y
 CONFIG_EAP_TTLS=y
 
 # EAP-FAST
-# Note: Default OpenSSL package does not include support for all the
-# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
-# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
-# to add the needed functions.
+# Note: If OpenSSL is used as the TLS library, OpenSSL 1.0 or newer is needed
+# for EAP-FAST support. Older OpenSSL releases would need to be patched, e.g.,
+# with openssl-0.9.8x-tls-extensions.patch, to add the needed functions.
 #CONFIG_EAP_FAST=y
 
 # EAP-GTC
@@ -162,6 +173,9 @@ CONFIG_EAP_OTP=y
 # EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
 #CONFIG_EAP_PSK=y
 
+# EAP-pwd (secure authentication using only a password)
+#CONFIG_EAP_PWD=y
+
 # EAP-PAX
 #CONFIG_EAP_PAX=y
 
@@ -191,10 +205,22 @@ CONFIG_EAP_LEAP=y
 
 # Wi-Fi Protected Setup (WPS)
 CONFIG_WPS=y
+# Enable WSC 2.0 support
+#CONFIG_WPS2=y
+# Enable WPS external registrar functionality
+#CONFIG_WPS_ER=y
+# Disable credentials for an open network by default when acting as a WPS
+# registrar.
+#CONFIG_WPS_REG_DISABLE_OPEN=y
+# Enable WPS support with NFC config method
+#CONFIG_WPS_NFC=y
 
 # EAP-IKEv2
 #CONFIG_EAP_IKEV2=y
 
+# EAP-EKE
+#CONFIG_EAP_EKE=y
+
 # PKCS#12 (PFX) support (used to read private key and certificate file from
 # a file that usually has extension .p12 or .pfx)
 CONFIG_PKCS12=y
@@ -207,6 +233,12 @@ CONFIG_SMARTCARD=y
 # Enable this if EAP-SIM or EAP-AKA is included
 #CONFIG_PCSC=y
 
+# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
+#CONFIG_HT_OVERRIDES=y
+
+# Support VHT overrides (disable VHT, mask MCS rates, etc.)
+#CONFIG_VHT_OVERRIDES=y
+
 # Development testing
 #CONFIG_EAPOL_TEST=y
 
@@ -214,6 +246,7 @@ CONFIG_SMARTCARD=y
 # unix = UNIX domain sockets (default for Linux/*BSD)
 # udp = UDP sockets using localhost (127.0.0.1)
 # named_pipe = Windows Named Pipe (default for Windows)
+# udp-remote = UDP sockets with remote access (only for tests systems/purpose)
 # y = use default (backwards compatibility)
 # If this option is commented out, control interface is not included in the
 # build.
@@ -225,6 +258,10 @@ CONFIG_CTRL_IFACE=y
 # the resulting binary.
 #CONFIG_READLINE=y
 
+# Include internal line edit mode in wpa_cli. This can be used as a replacement
+# for GNU Readline to provide limited command line editing and history support.
+#CONFIG_WPA_CLI_EDIT=y
+
 # Remove debugging code that is printing out debug message to stdout.
 # This can be used to reduce the size of the wpa_supplicant considerably
 # if debugging code is not needed. The size reduction can be around 35%
@@ -235,11 +272,6 @@ CONFIG_CTRL_IFACE=y
 # 35-50 kB in code size.
 #CONFIG_NO_WPA=y
 
-# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code to
-# save about 1 kB in code size when building only WPA-Personal (no EAP support)
-# or 6 kB if building for WPA-Enterprise.
-#CONFIG_NO_WPA2=y
-
 # Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
 # This option can be used to reduce code size by removing support for
 # converting ASCII passphrases into PSK. If this functionality is removed, the
@@ -283,9 +315,11 @@ CONFIG_BACKEND=file
 # Select event loop implementation
 # eloop = select() loop (default)
 # eloop_win = Windows events and WaitForMultipleObject() loop
-# eloop_none = Empty template
 #CONFIG_ELOOP=eloop
 
+# Should we use poll instead of select? Select is used by default.
+#CONFIG_ELOOP_POLL=y
+
 # Select layer 2 packet implementation
 # linux = Linux packet socket (default)
 # pcap = libpcap/libdnet/WinPcap
@@ -298,26 +332,30 @@ CONFIG_BACKEND=file
 # PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
 CONFIG_PEERKEY=y
 
-# IEEE 802.11w (management frame protection)
-# This version is an experimental implementation based on IEEE 802.11w/D1.0
-# draft and is subject to change since the standard has not yet been finalized.
+# IEEE 802.11w (management frame protection), also known as PMF
 # Driver support is also needed for IEEE 802.11w.
 #CONFIG_IEEE80211W=y
 
 # Select TLS implementation
 # openssl = OpenSSL (default)
-# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
+# gnutls = GnuTLS
 # internal = Internal TLSv1 implementation (experimental)
 # none = Empty template
 #CONFIG_TLS=openssl
 
-# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
-# You need CONFIG_TLS=gnutls for this to have any effect. Please note that
-# even though the core GnuTLS library is released under LGPL, this extra
-# library uses GPL and as such, the terms of GPL apply to the combination
-# of wpa_supplicant and GnuTLS if this option is enabled. BSD license may not
-# apply for distribution of the resulting binary.
-#CONFIG_GNUTLS_EXTRA=y
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
+# can be enabled to get a stronger construction of messages when block ciphers
+# are used. It should be noted that some existing TLS v1.0 -based
+# implementation may not be compatible with TLS v1.1 message (ClientHello is
+# sent prior to negotiating which version will be used)
+#CONFIG_TLSV11=y
+
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
+# can be enabled to enable use of stronger crypto algorithms. It should be
+# noted that some existing TLS v1.0 -based implementation may not be compatible
+# with TLS v1.2 message (ClientHello is sent prior to negotiating which version
+# will be used)
+#CONFIG_TLSV12=y
 
 # If CONFIG_TLS=internal is used, additional library and include paths are
 # needed for LibTomMath. Alternatively, an integrated, minimal version of
@@ -379,6 +417,17 @@ CONFIG_CTRL_IFACE_DBUS_NEW=y
 # Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
 #CONFIG_DEBUG_FILE=y
 
+# Send debug messages to syslog instead of stdout
+#CONFIG_DEBUG_SYSLOG=y
+# Set syslog facility for debug messages
+#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
+
+# Add support for sending all debug messages (regardless of debug verbosity)
+# to the Linux kernel tracing facility. This helps debug the entire stack by
+# making it easy to record everything happening from the driver up into the
+# same file, e.g., using trace-cmd.
+#CONFIG_DEBUG_LINUX_TRACING=y
+
 # Enable privilege separation (see README 'Privilege separation' for details)
 #CONFIG_PRIVSEP=y
 
@@ -390,7 +439,7 @@ CONFIG_CTRL_IFACE_DBUS_NEW=y
 # This tracks use of memory allocations and other registrations and reports
 # incorrect use with a backtrace of call (or allocation) location.
 #CONFIG_WPA_TRACE=y
-# For BSD, comment out these.
+# For BSD, uncomment these.
 #LIBS += -lexecinfo
 #LIBS_p += -lexecinfo
 #LIBS_c += -lexecinfo
@@ -399,15 +448,69 @@ CONFIG_CTRL_IFACE_DBUS_NEW=y
 # This enables use of libbfd to get more detailed symbols for the backtraces
 # generated by CONFIG_WPA_TRACE=y.
 #CONFIG_WPA_TRACE_BFD=y
-# For BSD, comment out these.
+# For BSD, uncomment these.
 #LIBS += -lbfd -liberty -lz
 #LIBS_p += -lbfd -liberty -lz
 #LIBS_c += -lbfd -liberty -lz
+
 CONFIG_TLS = gnutls
-#CONFIG_GNUTLS_EXTRA=y
 CONFIG_CTRL_IFACE_DBUS=y
 CONFIG_CTRL_IFACE_DBUS_NEW=y
 
+# wpa_supplicant depends on strong random number generation being available
+# from the operating system. os_get_random() function is used to fetch random
+# data when needed, e.g., for key generation. On Linux and BSD systems, this
+# works by reading /dev/urandom. It should be noted that the OS entropy pool
+# needs to be properly initialized before wpa_supplicant is started. This is
+# important especially on embedded devices that do not have a hardware random
+# number generator and may by default start up with minimal entropy available
+# for random number generation.
+#
+# As a safety net, wpa_supplicant is by default trying to internally collect
+# additional entropy for generating random data to mix in with the data fetched
+# from the OS. This by itself is not considered to be very strong, but it may
+# help in cases where the system pool is not initialized properly. However, it
+# is very strongly recommended that the system pool is initialized with enough
+# entropy either by using hardware assisted random number generator or by
+# storing state over device reboots.
+#
+# wpa_supplicant can be configured to maintain its own entropy store over
+# restarts to enhance random number generation. This is not perfect, but it is
+# much more secure than using the same sequence of random numbers after every
+# reboot. This can be enabled with -e<entropy file> command line option. The
+# specified file needs to be readable and writable by wpa_supplicant.
+#
+# If the os_get_random() is known to provide strong random data (e.g., on
+# Linux/BSD, the board in question is known to have reliable source of random
+# data from /dev/urandom), the internal wpa_supplicant random pool can be
+# disabled. This will save some in binary size and CPU use. However, this
+# should only be considered for builds that are known to be used on devices
+# that meet the requirements described above.
+#CONFIG_NO_RANDOM_POOL=y
+
+# IEEE 802.11n (High Throughput) support (mainly for AP mode)
+#CONFIG_IEEE80211N=y
+
+# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)
+# (depends on CONFIG_IEEE80211N)
+#CONFIG_IEEE80211AC=y
+
+# Wireless Network Management (IEEE Std 802.11v-2011)
+# Note: This is experimental and not complete implementation.
+#CONFIG_WNM=y
+
+# Interworking (IEEE 802.11u)
+# This can be used to enable functionality to improve interworking with
+# external networks (GAS/ANQP to learn more about the networks and network
+# selection based on available credentials).
+#CONFIG_INTERWORKING=y
+
+# Hotspot 2.0
+#CONFIG_HS20=y
+
+# Disable roaming in wpa_supplicant
+#CONFIG_NO_ROAMING=y
+
 # AP mode operations with wpa_supplicant
 # This can be used for controlling AP mode operations with wpa_supplicant. It
 # should be noted that this is mainly aimed at simple cases like
@@ -417,12 +520,33 @@ CONFIG_AP=y
 
 CONFIG_BGSCAN_SIMPLE=y
 
+# P2P (Wi-Fi Direct)
+# This can be used to enable P2P support in wpa_supplicant. See README-P2P for
+# more information on P2P operations.
+#CONFIG_P2P=y
+
+# Enable TDLS support
+#CONFIG_TDLS=y
+
+# Wi-Fi Direct
+# This can be used to enable Wi-Fi Direct extensions for P2P using an external
+# program to control the additional information exchanges in the messages.
+#CONFIG_WIFI_DISPLAY=y
+
 # Autoscan
 # This can be used to enable automatic scan support in wpa_supplicant.
-# See wpa_supplicant.conf for more information on autoscan usage.
+# See wpa_supplicant.conf for more information on autoscan usage.
 #
 # Enabling directly a module will enable autoscan support.
 # For exponential module:
 CONFIG_AUTOSCAN_EXPONENTIAL=y
 # For periodic module:
 #CONFIG_AUTOSCAN_PERIODIC=y
+
+# Password (and passphrase, etc.) backend for external storage
+# These optional mechanisms can be used to add support for storing passwords
+# and other secrets in external (to wpa_supplicant) location. This allows, for
+# example, operating system specific key storage to be used
+#
+# External password backend for testing purposes (developer use)
+#CONFIG_EXT_PASSWORD_TEST=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
deleted file mode 100644
index 453240f..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f157b78166baff2c32ed3983b4e787417505b343 Mon Sep 17 00:00:00 2001
-From: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
-Date: Mon, 1 Jul 2013 19:11:34 +0300
-Subject: [PATCH] dbus: Register the AutoScan method call at the right place
-
-Upstream-Status: Accepted [hostap@lists.shmoo.com]
-
-Signed-hostap: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
----
- wpa_supplicant/dbus/dbus_new.c | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/wpa_supplicant/dbus/dbus_new.c b/wpa_supplicant/dbus/dbus_new.c
-index 8bc6618..d076d2d 100644
---- a/wpa_supplicant/dbus/dbus_new.c
-+++ b/wpa_supplicant/dbus/dbus_new.c
-@@ -1917,15 +1917,6 @@ static const struct wpa_dbus_method_desc wpas_dbus_global_methods[] = {
- 		  END_ARGS
- 	  }
- 	},
--#ifdef CONFIG_AUTOSCAN
--	{ "AutoScan", WPAS_DBUS_NEW_IFACE_INTERFACE,
--	  (WPADBusMethodHandler) &wpas_dbus_handler_autoscan,
--	  {
--		  { "arg", "s", ARG_IN },
--		  END_ARGS
--	  }
--	},
--#endif /* CONFIG_AUTOSCAN */
- 	{ NULL, NULL, NULL, { END_ARGS } }
- };
- 
-@@ -2649,6 +2640,15 @@ static const struct wpa_dbus_method_desc wpas_dbus_interface_methods[] = {
- 	  }
- 	},
- #endif /* CONFIG_AP */
-+#ifdef CONFIG_AUTOSCAN
-+	{ "AutoScan", WPAS_DBUS_NEW_IFACE_INTERFACE,
-+	  (WPADBusMethodHandler) &wpas_dbus_handler_autoscan,
-+	  {
-+		  { "arg", "s", ARG_IN },
-+		  END_ARGS
-+	  }
-+	},
-+#endif /* CONFIG_AUTOSCAN */
- 	{ NULL, NULL, NULL, { END_ARGS } }
- };
- 
--- 
-1.8.1.2
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
deleted file mode 100644
index a8b0dad..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require wpa-supplicant-2.0.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "3be2ebfdcced52e00eda0afe2889839d"
-SRC_URI[sha256sum] = "2c115609fbb5223d51381084a5c944455a8afcda81d584173ff55ba233379e09"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb
new file mode 100644
index 0000000..afd0654
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb
@@ -0,0 +1,2 @@
+require wpa-supplicant.inc
+
-- 
1.8.3.2


