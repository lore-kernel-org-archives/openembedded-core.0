Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SI9zU-0004jx-U1
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 04:42:33 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 04:33:08 +0200
Message-Id: <1334197988-26027-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] wpa-supplicant: remove unused files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 02:42:33 -0000

* defconfig, init.sh, wpa_supplicant-0.5.7-always-scan.patch,
  wpa_supplicant-fix-deprecated-dbus-function.patch and
  wpa_supplicant_default.conf are not used by the recipe.
* default-sane gets installed but is unused.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../wpa-supplicant-0.7.3/defaults-sane             |    8 -
 .../wpa-supplicant/wpa-supplicant-0.7.3/defconfig  |  157 ----------------
 .../wpa-supplicant/wpa-supplicant-0.7.3/init.sh    |   50 -----
 .../wpa_supplicant-0.5.7-always-scan.patch         |   14 --
 ...a_supplicant-fix-deprecated-dbus-function.patch |  189 --------------------
 .../wpa_supplicant_default.conf                    |   13 --
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 8 files changed, 2 insertions(+), 435 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/init.sh
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane
deleted file mode 100644
index 67c4cbd..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane
+++ /dev/null
@@ -1,8 +0,0 @@
-# Useful flags:
-#  -i <ifname>          Interface (required, unless specified in config)
-#  -D <driver>          Wireless Driver
-#  -d                   Debugging (-dd for more)
-#  -q                   Quiet (-qq for more)
-
-CONFIG="/etc/wpa_supplicant.conf"
-OPTIONS="-i eth1 -D wext"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
deleted file mode 100644
index c165343..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
+++ /dev/null
@@ -1,157 +0,0 @@
-# This file lists the configuration options that are used when building the
-# hostapd binary. All lines starting with # are ignored. Configuration option
-# lines must be commented out complete, if they are not to be included, i.e.,
-# just setting VARIABLE=n is not disabling that variable.
-#
-# This file is included in Makefile, so variables like CFLAGS and LIBS can also
-# be modified from here. In most cass, these lines should use += in order not
-# to override previous values of the variables.
-
-CFLAGS = $(TARGET_CFLAGS) -I../hostapd -I../utils -I../driver/modules -Wall -MMD
-
-# for wpa_supplicant, wpa_cli
-LIBS = $(TARGET_LDFLAGS)
-
-# for wpa_passphrase:
-LIBS_p = $(TARGET_LDFLAGS)
-
-
-# Uncomment following two lines and fix the paths if you have installed openssl
-# in non-default location
-#CFLAGS += -I/usr/local/openssl/include
-#LIBS += -L/usr/local/openssl/lib
-
-# Example configuration for various cross-compilation platforms
-
-#### sveasoft (e.g., for Linksys WRT54G) ######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
-#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
-###############################################################################
-
-#### openwrt (e.g., for Linksys WRT54G) #######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
-#	-I../WRT54GS/release/src/include
-#LIBS = -lssl
-###############################################################################
-
-
-# Driver interface for Host AP driver
-CONFIG_DRIVER_HOSTAP=y
-
-# Driver interface for Agere driver
-CONFIG_DRIVER_HERMES=y
-
-# Driver interface for madwifi driver
-#CONFIG_DRIVER_MADWIFI=y
-# Change include directories to match with the local setup
-#CFLAGS += -I../madwifi/wpa
-
-# Driver interface for Prism54 driver
-#CONFIG_DRIVER_PRISM54=y
-
-# Driver interface for ndiswrapper
-#CONFIG_DRIVER_NDISWRAPPER=y
-
-# Driver interface for Atmel driver
-#CONFIG_DRIVER_ATMEL=y
-
-# Driver interface for Broadcom driver
-#CONFIG_DRIVER_BROADCOM=y
-# Example path for wlioctl.h; change to match your configuration
-#CFLAGS += -I/opt/WRT54GS/release/src/include
-
-# Driver interface for Intel ipw2100 driver
-#CONFIG_DRIVER_IPW2100=y
-
-# Driver interface for generic Linux wireless extensions
-CONFIG_DRIVER_WEXT=y
-
-# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
-#CONFIG_DRIVER_BSD=y
-#CFLAGS += -I/usr/local/include
-#LIBS += -L/usr/local/lib
-
-# Driver interface for Windows NDIS
-#CONFIG_DRIVER_NDIS=y
-#CFLAGS += -I/usr/include/w32api/ddk
-#LIBS += -L/usr/local/lib
-# For native build using mingw
-#CONFIG_NATIVE_WINDOWS=y
-# Additional directories for cross-compilation on Linux host for mingw target
-#CFLAGS += -I/opt/mingw/mingw32/include/ddk
-#LIBS += -L/opt/mingw/mingw32/lib
-#CC=mingw32-gcc
-
-# Driver interface for development testing
-#CONFIG_DRIVER_TEST=y
-
-# Enable IEEE 802.1X Supplicant (automatically included if any EAP method is
-# included)
-CONFIG_IEEE8021X_EAPOL=y
-
-# EAP-MD5 (automatically included if EAP-TTLS is enabled)
-CONFIG_EAP_MD5=y
-
-# EAP-MSCHAPv2 (automatically included if EAP-PEAP is enabled)
-CONFIG_EAP_MSCHAPV2=y
-
-# EAP-TLS
-CONFIG_EAP_TLS=y
-
-# EAL-PEAP
-CONFIG_EAP_PEAP=y
-
-# EAP-TTLS
-CONFIG_EAP_TTLS=y
-
-# EAP-GTC
-CONFIG_EAP_GTC=y
-
-# EAP-OTP
-CONFIG_EAP_OTP=y
-
-# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
-#CONFIG_EAP_SIM=y
-
-# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
-#CONFIG_EAP_PSK=y
-
-# LEAP
-CONFIG_EAP_LEAP=y
-
-# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
-#CONFIG_EAP_AKA=y
-
-# PKCS#12 (PFX) support (used to read private key and certificate file from
-# a file that usually has extension .p12 or .pfx)
-CONFIG_PKCS12=y
-
-# PC/SC interface for smartcards (USIM, GSM SIM)
-# Enable this if EAP-SIM or EAP-AKA is included
-#CONFIG_PCSC=y
-
-# Development testing
-#CONFIG_EAPOL_TEST=y
-
-# Replace native Linux implementation of packet sockets with libdnet/libpcap.
-# This will be automatically set for non-Linux OS.
-#CONFIG_DNET_PCAP=y
-
-# Include control interface for external programs, e.g, wpa_cli
-CONFIG_CTRL_IFACE=y
-
-# Include interface for using external supplicant (Xsupplicant) for EAP
-# authentication
-#CONFIG_XSUPPLICANT_IFACE=y
-
-# Include support for GNU Readline and History Libraries in wpa_cli.
-# When building a wpa_cli binary for distribution, please note that these
-# libraries are licensed under GPL and as such, BSD license may not apply for
-# the resulting binary.
-#CONFIG_READLINE=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/init.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/init.sh
deleted file mode 100644
index bc7ee91..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/init.sh
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/bin/sh
-
-PATH=/sbin:/bin:/usr/sbin:/usr/bin
-
-DAEMON=/usr/sbin/wpa_supplicant
-CONFIG="/etc/wpa_supplicant.conf"
-PNAME="wpa_supplicant"
-
-# insane defaults
-OPTIONS=""
-
-test -f /etc/default/wpa && . /etc/default/wpa
-
-if [ ! -f $CONFIG ]; then
-	echo "No configuration file found, not starting."
-	exit 1
-fi
-
-test -f $DAEMON || exit 0
-
-case "$1" in
-	start)
-		echo -n "Starting wpa_supplicant: "
-		start-stop-daemon -S -b -x $DAEMON -- -Bw -c $CONFIG $OPTIONS >/dev/null
-		echo "done."
-		;;
-	stop)
-		echo -n "Stopping wpa_supplicant: "
-		start-stop-daemon -K -n $PNAME >/dev/null
-		echo "done."
-		;;
-	reload|force-reload)
-		echo -n "Reloading wpa_supplicant: "
-		killall -HUP $PNAME
-		echo "done."
-		;;
-	restart)
-		echo -n "Restarting wpa_supplicant: "
-		start-stop-daemon -K -n $PNAME >/dev/null
-		sleep 1
-		start-stop-daemon -S -b -x $DAEMON -- -Bw -c $CONFIG $OPTIONS >/dev/null
-		echo "done."
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload|force-reload}" >&2
-		exit 1
-		;;
-esac
-
-exit 0
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
deleted file mode 100644
index 5485d55..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-diff -up wpa_supplicant-0.5.7/wpa_supplicant.c.always-scan wpa_supplicant-0.5.7/wpa_supplicant.c
---- wpa_supplicant-0.5.7/wpa_supplicant.c.always-scan	2007-09-25 15:51:35.000000000 -0400
-+++ wpa_supplicant-0.5.7/wpa_supplicant.c	2007-09-25 16:31:27.000000000 -0400
-@@ -972,7 +972,7 @@ static void wpa_supplicant_scan(void *el
- 	struct wpa_ssid *ssid;
- 	int enabled, scan_req = 0, ret;
- 
--	if (wpa_s->disconnected)
-+	if (wpa_s->disconnected && !wpa_s->scan_req)
- 		return;
- 
- 	enabled = 0;
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
deleted file mode 100644
index a1898c3..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
---- dbus_dict_helpers.c.array-fix	2006-12-18 12:31:11.000000000 -0500
-+++ dbus_dict_helpers.c	2006-12-20 03:17:08.000000000 -0500
-@@ -629,36 +629,55 @@ dbus_bool_t wpa_dbus_dict_open_read(DBus
- }
- 
- 
-+#define BYTE_ARRAY_CHUNK_SIZE 34
-+#define BYTE_ARRAY_ITEM_SIZE (sizeof (char))
-+
- static dbus_bool_t _wpa_dbus_dict_entry_get_byte_array(
--	DBusMessageIter *iter, int array_len, int array_type,
-+	DBusMessageIter *iter, int array_type,
- 	struct wpa_dbus_dict_entry *entry)
- {
--	dbus_uint32_t i = 0;
-+	dbus_uint32_t count = 0;
- 	dbus_bool_t success = FALSE;
--	char byte;
-+	char * buffer;
- 
--	/* Zero-length arrays are valid. */
--	if (array_len == 0) {
--		entry->bytearray_value = NULL;
--		entry->array_type = DBUS_TYPE_BYTE;
--		success = TRUE;
--		goto done;
--	}
-+	entry->bytearray_value = NULL;
-+	entry->array_type = DBUS_TYPE_BYTE;
- 
--	entry->bytearray_value = wpa_zalloc(array_len * sizeof(char));
--	if (!entry->bytearray_value) {
-+	buffer = wpa_zalloc(BYTE_ARRAY_ITEM_SIZE * BYTE_ARRAY_CHUNK_SIZE);
-+	if (!buffer) {
- 		perror("_wpa_dbus_dict_entry_get_byte_array[dbus]: out of "
- 		       "memory");
- 		goto done;
- 	}
- 
--	entry->array_type = DBUS_TYPE_BYTE;
--	entry->array_len = array_len;
-+	entry->bytearray_value = buffer;
-+	entry->array_len = 0;
- 	while (dbus_message_iter_get_arg_type(iter) == DBUS_TYPE_BYTE) {
-+		char byte;
-+
-+		if ((count % BYTE_ARRAY_CHUNK_SIZE) == 0 && count != 0) {
-+			buffer = realloc(buffer, BYTE_ARRAY_ITEM_SIZE * (count + BYTE_ARRAY_CHUNK_SIZE));
-+			if (buffer == NULL) {
-+				perror("_wpa_dbus_dict_entry_get_byte_array["
-+				       "dbus] out of memory trying to "
-+				       "retrieve the string array");
-+				goto done;
-+			}
-+		}
-+		entry->bytearray_value = buffer;
-+
- 		dbus_message_iter_get_basic(iter, &byte);
--		entry->bytearray_value[i++] = byte;
-+		entry->bytearray_value[count] = byte;
-+		entry->array_len = ++count;
- 		dbus_message_iter_next(iter);
- 	}
-+
-+	/* Zero-length arrays are valid. */
-+	if (entry->array_len == 0) {
-+		free(entry->bytearray_value);
-+		entry->strarray_value = NULL;
-+	}
-+
- 	success = TRUE;
- 
- done:
-@@ -666,8 +685,11 @@ done:
- }
- 
- 
-+#define STR_ARRAY_CHUNK_SIZE 8
-+#define STR_ARRAY_ITEM_SIZE (sizeof (char *))
-+
- static dbus_bool_t _wpa_dbus_dict_entry_get_string_array(
--	DBusMessageIter *iter, int array_len, int array_type,
-+	DBusMessageIter *iter, int array_type,
- 	struct wpa_dbus_dict_entry *entry)
- {
- 	dbus_uint32_t count = 0;
-@@ -677,13 +699,7 @@ static dbus_bool_t _wpa_dbus_dict_entry_
- 	entry->strarray_value = NULL;
- 	entry->array_type = DBUS_TYPE_STRING;
- 
--	/* Zero-length arrays are valid. */
--	if (array_len == 0) {
--		success = TRUE;
--		goto done;
--	}
--
--	buffer = wpa_zalloc(sizeof (char *) * 8);
-+	buffer = wpa_zalloc(STR_ARRAY_ITEM_SIZE * STR_ARRAY_CHUNK_SIZE);
- 	if (buffer == NULL) {
- 		perror("_wpa_dbus_dict_entry_get_string_array[dbus] out of "
- 		       "memory trying to retrieve a string array");
-@@ -696,18 +712,14 @@ static dbus_bool_t _wpa_dbus_dict_entry_
- 		const char *value;
- 		char *str;
- 
--		if ((count % 8) == 0 && count != 0) {
--			char **tmp;
--			tmp = realloc(buffer, sizeof(char *) * (count + 8));
--			if (tmp == NULL) {
-+		if ((count % STR_ARRAY_CHUNK_SIZE) == 0 && count != 0) {
-+			buffer = realloc(buffer, STR_ARRAY_ITEM_SIZE * (count + STR_ARRAY_CHUNK_SIZE));
-+			if (buffer == NULL) {
- 				perror("_wpa_dbus_dict_entry_get_string_array["
- 				       "dbus] out of memory trying to "
- 				       "retrieve the string array");
--				free(buffer);
--				buffer = NULL;
- 				goto done;
- 			}
--			buffer = tmp;
- 		}
- 		entry->strarray_value = buffer;
- 
-@@ -723,6 +735,13 @@ static dbus_bool_t _wpa_dbus_dict_entry_
- 		entry->array_len = ++count;
- 		dbus_message_iter_next(iter);
- 	}
-+
-+	/* Zero-length arrays are valid. */
-+	if (entry->array_len == 0) {
-+		free(entry->strarray_value);
-+		entry->strarray_value = NULL;
-+	}
-+
- 	success = TRUE;
- 
- done:
-@@ -734,7 +753,6 @@ static dbus_bool_t _wpa_dbus_dict_entry_
- 	DBusMessageIter *iter_dict_val, struct wpa_dbus_dict_entry *entry)
- {
- 	int array_type = dbus_message_iter_get_element_type(iter_dict_val);
--	int array_len;
- 	dbus_bool_t success = FALSE;
- 	DBusMessageIter iter_array;
- 
-@@ -743,20 +761,14 @@ static dbus_bool_t _wpa_dbus_dict_entry_
- 
- 	dbus_message_iter_recurse(iter_dict_val, &iter_array);
- 
-- 	array_len = dbus_message_iter_get_array_len(&iter_array);
--	if (array_len < 0)
--		return FALSE;
--
-  	switch (array_type) {
- 	case DBUS_TYPE_BYTE:
- 		success = _wpa_dbus_dict_entry_get_byte_array(&iter_array,
--							      array_len,
- 							      array_type,
- 							      entry);
- 		break;
- 	case DBUS_TYPE_STRING:
- 		success = _wpa_dbus_dict_entry_get_string_array(&iter_array,
--								array_len,
- 								array_type,
- 								entry);
- 		break;
-@@ -943,9 +955,17 @@ void wpa_dbus_dict_entry_clear(struct wp
- 		break;
- 	case DBUS_TYPE_ARRAY:
- 		switch (entry->array_type) {
--		case DBUS_TYPE_BYTE:
--			free(entry->bytearray_value);
--			break;
-+		case DBUS_TYPE_BYTE: {
-+				free(entry->bytearray_value);
-+				break;
-+			}
-+		case DBUS_TYPE_STRING: {
-+				int i;
-+				for (i = 0; i < entry->array_len; i++)
-+					free (entry->strarray_value[i]);
-+				free (entry->strarray_value);
-+				break;
-+			}
- 		}
- 		break;
- 	}
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf
deleted file mode 100644
index 8eebdeb..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-# This is a basic configuration for WPA with pre-shared keys (WPA-PSK)
-
-ctrl_interface=/var/run/wpa_supplicant
-ctrl_interface_group=0
-eapol_version=1
-ap_scan=1
-network={
-	ssid="YOUR_SSID"
-	psk="YOUR WPA PASSWORD IN HEX OR ASCII"
-	key_mgmt=WPA-PSK
-	pairwise=CCMP
-	priority=5
-}
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index 539ab8c..d92acac 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -11,7 +11,6 @@ RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig-gnutls \
-           file://defaults-sane \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
@@ -43,8 +42,7 @@ do_install () {
 	install -d ${D}${docdir}/wpa_supplicant
 	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
 
-	install -d ${D}${sysconfdir}/default
-	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
+	install -d ${D}${sysconfdir}
 	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
 
 	install -d ${D}${sysconfdir}/network/if-pre-up.d/
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index c607fad..94c88ba 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.5.4



