Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RSsLl-0004QR-2n
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 16:33:47 +0100
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Tue, 22 Nov 2011
	15:34:57 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2011 15:34:59 +0100
Message-ID: <aae59e13faeb6a33c8fc6ceca6aab4c44809ae0a.1321972428.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1321972428.git.anders@chargestorm.se>
References: <cover.1321972428.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] busybox: update to 1.19.3
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
X-List-Received-Date: Tue, 22 Nov 2011 15:34:30 -0000
Content-Type: text/plain

The updates to patch busybox-udhcpc-no_deconfig.patch is not fully verified.

Adds one upstream patch to 1.19.3.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../B921600.patch                                  |    0
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   17 ++
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |   66 +++--
 .../{busybox-1.18.5 => busybox-1.19.3}/defconfig   |  265 +++++++++++++-------
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |   16 +-
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.18.5.bb => busybox_1.19.3.bb}       |    7 +-
 10 files changed, 245 insertions(+), 126 deletions(-)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/B921600.patch (100%)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-udhcpc-no_deconfig.patch (62%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/defconfig (89%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/run-parts.in.usr-bin.patch (64%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.18.5.bb => busybox_1.19.3.bb} (82%)

diff --git a/meta/recipes-core/busybox/busybox-1.18.5/B921600.patch b/meta/recipes-core/busybox/busybox-1.19.3/B921600.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/B921600.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/B921600.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
new file mode 100644
index 0000000..137d095
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
@@ -0,0 +1,17 @@
+Upstream-status: Backport
+
+Patch is taken from upstream 
+http://busybox.net/downloads/fixes-1.19.3/busybox-1.19.3-getty.patch
+
+--- busybox-1.19.3/loginutils/getty.c
++++ busybox-1.19.3-getty/loginutils/getty.c
+@@ -271,7 +271,9 @@ static void termios_init(int speed)
+ #ifdef CMSPAR
+ 		| CMSPAR  /* mark or space parity */
+ #endif
++#ifdef CBAUD
+ 		| CBAUD   /* (output) baud rate */
++#endif
+ #ifdef CBAUDEX
+ 		| CBAUDEX /* (output) baud rate */
+ #endif
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-appletlib-dependency.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-dependency.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/busybox-appletlib-dependency.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
similarity index 62%
rename from meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
index 405d482..481d8b3 100644
--- a/meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
@@ -1,3 +1,8 @@
+From 16c5fa61059f9862b2534c75dad75f7ece338208 Mon Sep 17 00:00:00 2001
+From: Anders Darander <anders@chargestorm.se>
+Date: Thu, 3 Nov 2011 08:51:31 +0100
+Subject: [PATCH] busybox-udhcpc-no_deconfig.patch
+
 Upstream-Status: Pending
 
 Add a new option -D to the udhcpc client that allows for
@@ -15,11 +20,19 @@ option spec is changed
 
 Signed-off-by: Qing He <qing.he@intel.com>
 
-diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/udhcp/dhcpc.c
---- busybox-1.17.3.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.17.3/networking/udhcp/dhcpc.c
-@@ -35,6 +35,9 @@
- #endif
+Updated to Busybox 1.19.3
+
+Signed-off-by: Anders Darander <anders@chargestorm.se>
+---
+ networking/udhcp/dhcpc.c |   27 ++++++++++++++++++++-------
+ 1 files changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
+index 4d755e6..eb80484 100644
+--- a/networking/udhcp/dhcpc.c
++++ b/networking/udhcp/dhcpc.c
+@@ -29,6 +29,9 @@
+ #include <netpacket/packet.h>
  #include <linux/filter.h>
  
 +/* option whether to down the interface when reconfiguring */
@@ -28,7 +41,15 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  /* struct client_config_t client_config is in bb_common_bufsiz1 */
  
  
-@@ -709,7 +712,8 @@
+@@ -82,6 +85,7 @@ enum {
+ 	OPT_x = 1 << 18,
+ 	OPT_f = 1 << 19,
+ 	OPT_B = 1 << 20,
++	OPT_D = 1 << 21,
+ /* The rest has variable bit positions, need to be clever */
+ 	OPTBIT_B = 20,
+ 	USE_FOR_MMU(             OPTBIT_b,)
+@@ -899,7 +903,8 @@ static void perform_renew(void)
  		state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -38,7 +59,7 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -733,7 +737,8 @@
+@@ -923,7 +928,8 @@ static void perform_release(uint32_t requested_ip, uint32_t server_addr)
  		bb_info_msg("Unicasting a release of %s to %s",
  				inet_ntoa(temp_addr), buffer);
  		send_release(server_addr, requested_ip); /* unicast */
@@ -48,24 +69,16 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	}
  	bb_info_msg("Entering released state");
  
-@@ -836,6 +841,7 @@
- 		OPT_o = 1 << 17,
- 		OPT_x = 1 << 18,
- 		OPT_f = 1 << 19,
-+		OPT_D = 1 << 20,
- /* The rest has variable bit positions, need to be clever */
- 		OPTBIT_f = 20,
- 		USE_FOR_MMU(             OPTBIT_b,)
-@@ -861,7 +867,7 @@
+@@ -1083,7 +1089,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  #endif
  		;
  	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
--	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:f"
-+	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fD"
+-	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
++	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -950,6 +956,9 @@
+@@ -1175,6 +1181,9 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -75,7 +88,7 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	/* Make sure fd 0,1,2 are open */
  	bb_sanitize_stdio();
  	/* Equivalent of doing a fflush after every \n */
-@@ -964,7 +973,8 @@
+@@ -1189,7 +1198,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  	srand(monotonic_us());
  
  	state = INIT_SELECTING;
@@ -85,7 +98,7 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1100,7 +1110,8 @@
+@@ -1341,7 +1351,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  				}
  				/* Timed out, enter init state */
  				bb_info_msg("Lease lost, entering init state");
@@ -93,9 +106,9 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
 +				if (allow_deconfig)
 +					udhcp_run_script(NULL, "deconfig");
  				state = INIT_SELECTING;
+ 				client_config.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
- 				packet_num = 0;
-@@ -1246,7 +1257,8 @@
+@@ -1489,7 +1500,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  						send_decline(xid, server_addr, packet.yiaddr);
  
  						if (state != REQUESTING)
@@ -104,8 +117,8 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
 +								udhcp_run_script(NULL, "deconfig");
  						change_listen_mode(LISTEN_RAW);
  						state = INIT_SELECTING;
- 						requested_ip = 0;
-@@ -1292,7 +1304,8 @@
+ 						client_config.first_secs = 0; /* make secs field count from 0 */
+@@ -1536,7 +1548,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
  				bb_info_msg("Received DHCP NAK");
  				udhcp_run_script(&packet, "nak");
  				if (state != REQUESTING)
@@ -115,3 +128,6 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  				change_listen_mode(LISTEN_RAW);
  				sleep(3); /* avoid excessive network traffic */
  				state = INIT_SELECTING;
+-- 
+1.7.7.1
+
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
similarity index 89%
rename from meta/recipes-core/busybox/busybox-1.18.5/defconfig
rename to meta/recipes-core/busybox/busybox-1.19.3/defconfig
index 5327a64..483b67a 100644
--- a/meta/recipes-core/busybox/busybox-1.18.5/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.16.2
-# Tue Oct 26 15:07:52 2010
+# Busybox version: 1.19.3
+# Tue Nov 22 14:13:55 2011
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -16,6 +16,7 @@ CONFIG_HAVE_DOT_CONFIG=y
 # CONFIG_EXTRA_COMPAT is not set
 # CONFIG_INCLUDE_SUSv2 is not set
 # CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_PLATFORM_LINUX=y
 CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 # CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
 # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
@@ -23,12 +24,23 @@ CONFIG_SHOW_USAGE=y
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 CONFIG_FEATURE_COMPRESS_USAGE=y
 # CONFIG_FEATURE_INSTALLER is not set
+# CONFIG_INSTALL_NO_USR is not set
 CONFIG_LOCALE_SUPPORT=y
-# CONFIG_FEATURE_ASSUME_UNICODE is not set
+# CONFIG_UNICODE_SUPPORT is not set
+# CONFIG_UNICODE_USING_LOCALE is not set
 # CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_SUBST_WCHAR=0
+CONFIG_LAST_SUPPORTED_WCHAR=0
+# CONFIG_UNICODE_COMBINING_WCHARS is not set
+# CONFIG_UNICODE_WIDE_WCHARS is not set
+# CONFIG_UNICODE_BIDI_SUPPORT is not set
+# CONFIG_UNICODE_NEUTRAL_TABLE is not set
+# CONFIG_UNICODE_PRESERVE_BROKEN is not set
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
 # CONFIG_FEATURE_CLEAN_UP is not set
+CONFIG_FEATURE_UTMP=y
+# CONFIG_FEATURE_WTMP is not set
 CONFIG_FEATURE_PIDFILE=y
 CONFIG_FEATURE_SUID=y
 CONFIG_FEATURE_SUID_CONFIG=y
@@ -63,9 +75,8 @@ CONFIG_NO_DEBUG_LIB=y
 # CONFIG_EFENCE is not set
 
 #
-# Installation Options
+# Installation Options ("make install" behavior)
 #
-# CONFIG_INSTALL_NO_USR is not set
 CONFIG_INSTALL_APPLET_SYMLINKS=y
 # CONFIG_INSTALL_APPLET_HARDLINKS is not set
 # CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
@@ -78,15 +89,19 @@ CONFIG_PREFIX="./_install"
 #
 # Busybox Library Tuning
 #
+CONFIG_FEATURE_SYSTEMD=y
+CONFIG_FEATURE_RTMINMAX=y
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SIZE_VS_SPEED=2
 CONFIG_FEATURE_FAST_TOP=y
 # CONFIG_FEATURE_ETC_NETWORKS is not set
+CONFIG_FEATURE_USE_TERMIOS=y
 CONFIG_FEATURE_EDITING=y
 CONFIG_FEATURE_EDITING_MAX_LEN=1024
 # CONFIG_FEATURE_EDITING_VI is not set
 CONFIG_FEATURE_EDITING_HISTORY=15
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+CONFIG_FEATURE_REVERSE_SEARCH=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 CONFIG_FEATURE_USERNAME_COMPLETION=y
 CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
@@ -94,6 +109,7 @@ CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
 CONFIG_FEATURE_NON_POSIX_CP=y
 # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
 CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_FEATURE_SKIP_ROOTFS=y
 CONFIG_MONOTONIC_SYSCALL=y
 CONFIG_IOCTL_HEX2STR_ERROR=y
 CONFIG_FEATURE_HWIB=y
@@ -105,12 +121,14 @@ CONFIG_FEATURE_HWIB=y
 #
 # Archival Utilities
 #
+CONFIG_FEATURE_SEAMLESS_XZ=y
 CONFIG_FEATURE_SEAMLESS_LZMA=y
 CONFIG_FEATURE_SEAMLESS_BZ2=y
 CONFIG_FEATURE_SEAMLESS_GZ=y
 CONFIG_FEATURE_SEAMLESS_Z=y
 CONFIG_AR=y
 # CONFIG_FEATURE_AR_LONG_FILENAMES is not set
+CONFIG_FEATURE_AR_CREATE=y
 CONFIG_BUNZIP2=y
 # CONFIG_BZIP2 is not set
 CONFIG_CPIO=y
@@ -134,19 +152,39 @@ CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
 # CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
 CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
 # CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
+# CONFIG_FEATURE_TAR_TO_COMMAND is not set
 # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
 # CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
+# CONFIG_FEATURE_TAR_SELINUX is not set
 # CONFIG_UNCOMPRESS is not set
 # CONFIG_UNLZMA is not set
 # CONFIG_FEATURE_LZMA_FAST is not set
+# CONFIG_LZMA is not set
+CONFIG_UNXZ=y
+CONFIG_XZ=y
 CONFIG_UNZIP=y
 
 #
 # Coreutils
 #
 CONFIG_BASENAME=y
-# CONFIG_CAL is not set
 CONFIG_CAT=y
+CONFIG_DATE=y
+# CONFIG_FEATURE_DATE_ISOFMT is not set
+# CONFIG_FEATURE_DATE_NANO is not set
+CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_ID=y
+CONFIG_GROUPS=y
+CONFIG_TEST=y
+# CONFIG_FEATURE_TEST_64 is not set
+CONFIG_TOUCH=y
+CONFIG_TR=y
+CONFIG_FEATURE_TR_CLASSES=y
+# CONFIG_FEATURE_TR_EQUIV is not set
+# CONFIG_BASE64 is not set
+CONFIG_WHO=y
+CONFIG_USERS=y
+# CONFIG_CAL is not set
 # CONFIG_CATV is not set
 CONFIG_CHGRP=y
 CONFIG_CHMOD=y
@@ -158,9 +196,6 @@ CONFIG_CHROOT=y
 CONFIG_CP=y
 # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
 CONFIG_CUT=y
-CONFIG_DATE=y
-# CONFIG_FEATURE_DATE_ISOFMT is not set
-CONFIG_FEATURE_DATE_COMPAT=y
 CONFIG_DD=y
 CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
 # CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
@@ -186,10 +221,8 @@ CONFIG_FALSE=y
 CONFIG_HEAD=y
 # CONFIG_FEATURE_FANCY_HEAD is not set
 # CONFIG_HOSTID is not set
-CONFIG_ID=y
 # CONFIG_INSTALL is not set
 # CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
-# CONFIG_LENGTH is not set
 CONFIG_LN=y
 CONFIG_LOGNAME=y
 CONFIG_LS=y
@@ -241,12 +274,6 @@ CONFIG_TAIL=y
 CONFIG_FEATURE_FANCY_TAIL=y
 CONFIG_TEE=y
 # CONFIG_FEATURE_TEE_USE_BLOCK_IO is not set
-CONFIG_TEST=y
-# CONFIG_FEATURE_TEST_64 is not set
-CONFIG_TOUCH=y
-CONFIG_TR=y
-CONFIG_FEATURE_TR_CLASSES=y
-# CONFIG_FEATURE_TR_EQUIV is not set
 CONFIG_TRUE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
@@ -258,7 +285,6 @@ CONFIG_USLEEP=y
 # CONFIG_UUENCODE is not set
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
 CONFIG_WHOAMI=y
 CONFIG_YES=y
 
@@ -286,6 +312,7 @@ CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 # Console Utilities
 #
 CONFIG_CHVT=y
+CONFIG_FGCONSOLE=y
 CONFIG_CLEAR=y
 CONFIG_DEALLOCVT=y
 CONFIG_DUMPKMAP=y
@@ -306,6 +333,12 @@ CONFIG_DEFAULT_SETFONT_DIR=""
 # CONFIG_SHOWKEY is not set
 
 #
+# Common options for loadfont and setfont
+#
+CONFIG_FEATURE_LOADFONT_PSF2=y
+CONFIG_FEATURE_LOADFONT_RAW=y
+
+#
 # Debian Utilities
 #
 CONFIG_MKTEMP=y
@@ -321,28 +354,30 @@ CONFIG_WHICH=y
 #
 # Editors
 #
-CONFIG_AWK=y
-# CONFIG_FEATURE_AWK_LIBM is not set
-CONFIG_CMP=y
-CONFIG_DIFF=y
-# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
-CONFIG_FEATURE_DIFF_DIR=y
-# CONFIG_ED is not set
 CONFIG_PATCH=y
-CONFIG_SED=y
 CONFIG_VI=y
 CONFIG_FEATURE_VI_MAX_LEN=1024
 CONFIG_FEATURE_VI_8BIT=y
 CONFIG_FEATURE_VI_COLON=y
 CONFIG_FEATURE_VI_YANKMARK=y
 CONFIG_FEATURE_VI_SEARCH=y
+# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
 CONFIG_FEATURE_VI_USE_SIGNALS=y
 # CONFIG_FEATURE_VI_DOT_CMD is not set
 # CONFIG_FEATURE_VI_READONLY is not set
 # CONFIG_FEATURE_VI_SETOPTS is not set
 # CONFIG_FEATURE_VI_SET is not set
 CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_ASK_TERMINAL=y
 CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_AWK=y
+# CONFIG_FEATURE_AWK_LIBM is not set
+CONFIG_CMP=y
+CONFIG_DIFF=y
+# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
+CONFIG_FEATURE_DIFF_DIR=y
+# CONFIG_ED is not set
+CONFIG_SED=y
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
@@ -384,6 +419,12 @@ CONFIG_XARGS=y
 #
 # Init Utilities
 #
+# CONFIG_BOOTCHARTD is not set
+# CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
+# CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
+CONFIG_HALT=y
+# CONFIG_FEATURE_CALL_TELINIT is not set
+CONFIG_TELINIT_PATH=""
 # CONFIG_INIT is not set
 # CONFIG_FEATURE_USE_INITTAB is not set
 # CONFIG_FEATURE_KILL_REMOVED is not set
@@ -393,33 +434,32 @@ CONFIG_FEATURE_KILL_DELAY=0
 # CONFIG_FEATURE_EXTRA_QUIET is not set
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
 # CONFIG_FEATURE_INITRD is not set
-CONFIG_HALT=y
-# CONFIG_FEATURE_CALL_TELINIT is not set
-CONFIG_TELINIT_PATH=""
+CONFIG_INIT_TERMINAL_TYPE=""
 # CONFIG_MESG is not set
+# CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
 
 #
 # Login/Password Management Utilities
 #
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
 # CONFIG_FEATURE_SHADOWPASSWDS is not set
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
-# CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-# CONFIG_DELGROUP is not set
-# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-# CONFIG_FEATURE_CHECK_NAMES is not set
 # CONFIG_ADDUSER is not set
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+# CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_FIRST_SYSTEM_ID=0
 CONFIG_LAST_SYSTEM_ID=0
+# CONFIG_ADDGROUP is not set
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
 # CONFIG_DELUSER is not set
+# CONFIG_DELGROUP is not set
+# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
 # CONFIG_GETTY is not set
-CONFIG_FEATURE_UTMP=y
-# CONFIG_FEATURE_WTMP is not set
 # CONFIG_LOGIN is not set
 # CONFIG_PAM is not set
 # CONFIG_LOGIN_SCRIPTS is not set
@@ -441,10 +481,12 @@ CONFIG_FEATURE_UTMP=y
 CONFIG_CHATTR=y
 CONFIG_FSCK=y
 # CONFIG_LSATTR is not set
+# CONFIG_TUNE2FS is not set
 
 #
 # Linux Module Utilities
 #
+# CONFIG_MODINFO is not set
 # CONFIG_MODPROBE_SMALL is not set
 # CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
 # CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
@@ -475,9 +517,12 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 #
 # Linux System Utilities
 #
+CONFIG_BLOCKDEV=y
+# CONFIG_REV is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKID is not set
+# CONFIG_FEATURE_BLKID_TYPE is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
 CONFIG_FBSET=y
@@ -486,22 +531,20 @@ CONFIG_FEATURE_FBSET_READMODE=y
 # CONFIG_FDFLUSH is not set
 # CONFIG_FDFORMAT is not set
 CONFIG_FDISK=y
-CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
 CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
 # CONFIG_FEATURE_SGI_LABEL is not set
 # CONFIG_FEATURE_SUN_LABEL is not set
 # CONFIG_FEATURE_OSF_LABEL is not set
+# CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
+# CONFIG_FLOCK is not set
 # CONFIG_FREERAMDISK is not set
 CONFIG_FSCK_MINIX=y
 # CONFIG_MKFS_EXT2 is not set
 CONFIG_MKFS_MINIX=y
-
-#
-# Minix filesystem support
-#
 CONFIG_FEATURE_MINIX2=y
 # CONFIG_MKFS_REISER is not set
 # CONFIG_MKFS_VFAT is not set
@@ -527,25 +570,6 @@ CONFIG_LOSETUP=y
 CONFIG_MKSWAP=y
 # CONFIG_FEATURE_MKSWAP_UUID is not set
 CONFIG_MORE=y
-CONFIG_FEATURE_USE_TERMIOS=y
-# CONFIG_VOLUMEID is not set
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
-# CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
-# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
@@ -573,13 +597,53 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 # Common options for mount/umount
 #
 CONFIG_FEATURE_MOUNT_LOOP=y
+CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
+# CONFIG_VOLUMEID is not set
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
+# CONFIG_FEATURE_VOLUMEID_HFS is not set
+# CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
+# CONFIG_FEATURE_VOLUMEID_NTFS is not set
+# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
+# CONFIG_FEATURE_VOLUMEID_UDF is not set
+# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 
 #
 # Miscellaneous Utilities
 #
+# CONFIG_CONSPY is not set
+CONFIG_LESS=y
+CONFIG_FEATURE_LESS_MAXLINES=9999999
+CONFIG_FEATURE_LESS_BRACKETS=y
+CONFIG_FEATURE_LESS_FLAGS=y
+# CONFIG_FEATURE_LESS_MARKS is not set
+# CONFIG_FEATURE_LESS_REGEXP is not set
+# CONFIG_FEATURE_LESS_WINCH is not set
+# CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
+# CONFIG_FEATURE_LESS_DASHCMD is not set
+# CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_NANDWRITE is not set
+# CONFIG_NANDDUMP is not set
+# CONFIG_SETSERIAL is not set
+# CONFIG_UBIATTACH is not set
+# CONFIG_UBIDETACH is not set
+# CONFIG_UBIMKVOL is not set
+# CONFIG_UBIRMVOL is not set
+# CONFIG_UBIRSVOL is not set
+# CONFIG_UBIUPDATEVOL is not set
 # CONFIG_ADJTIMEX is not set
 # CONFIG_BBCONFIG is not set
+# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
 # CONFIG_BEEP is not set
 CONFIG_FEATURE_BEEP_FREQ=0
 CONFIG_FEATURE_BEEP_LENGTH_MS=0
@@ -617,15 +681,6 @@ CONFIG_DC=y
 # CONFIG_LAST is not set
 # CONFIG_FEATURE_LAST_SMALL is not set
 # CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
-# CONFIG_FEATURE_LESS_MARKS is not set
-# CONFIG_FEATURE_LESS_REGEXP is not set
-# CONFIG_FEATURE_LESS_WINCH is not set
-# CONFIG_FEATURE_LESS_DASHCMD is not set
-# CONFIG_FEATURE_LESS_LINENUMS is not set
 # CONFIG_HDPARM is not set
 # CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
 # CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
@@ -642,6 +697,7 @@ CONFIG_MICROCOM=y
 # CONFIG_MT is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
+# CONFIG_RFKILL is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
 # CONFIG_SETSID is not set
@@ -658,6 +714,17 @@ CONFIG_TIME=y
 #
 # Networking Utilities
 #
+# CONFIG_NAMEIF is not set
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+# CONFIG_NBDCLIENT is not set
+CONFIG_NC=y
+# CONFIG_NC_SERVER is not set
+# CONFIG_NC_EXTRA is not set
+# CONFIG_NC_110_COMPAT is not set
+CONFIG_PING=y
+CONFIG_PING6=y
+CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_WHOIS is not set
 CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
@@ -689,6 +756,7 @@ CONFIG_HOSTNAME=y
 # CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
 # CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
 # CONFIG_FEATURE_HTTPD_PROXY is not set
+# CONFIG_FEATURE_HTTPD_GZIP is not set
 CONFIG_IFCONFIG=y
 CONFIG_FEATURE_IFCONFIG_STATUS=y
 # CONFIG_FEATURE_IFCONFIG_SLIP is not set
@@ -729,23 +797,16 @@ CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_IPCALC is not set
 # CONFIG_FEATURE_IPCALC_FANCY is not set
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
-# CONFIG_NAMEIF is not set
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-CONFIG_NC=y
-# CONFIG_NC_SERVER is not set
-# CONFIG_NC_EXTRA is not set
 CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
 CONFIG_NSLOOKUP=y
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
-CONFIG_PING=y
-CONFIG_PING6=y
-CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
+# CONFIG_TCPSVD is not set
 CONFIG_TELNET=y
 # CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
@@ -754,6 +815,10 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
 # CONFIG_TFTPD is not set
+
+#
+# Common options for tftp/tftpd
+#
 CONFIG_FEATURE_TFTP_GET=y
 CONFIG_FEATURE_TFTP_PUT=y
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
@@ -764,29 +829,31 @@ CONFIG_TRACEROUTE=y
 # CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
 # CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
 # CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
+# CONFIG_TUNCTL is not set
+# CONFIG_FEATURE_TUNCTL_UG is not set
 CONFIG_UDHCPD=y
 # CONFIG_DHCPRELAY is not set
 CONFIG_DUMPLEASES=y
 # CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+# CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
 CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
 CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
+# CONFIG_FEATURE_UDHCP_8021Q is not set
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+# CONFIG_UDPSVD is not set
 # CONFIG_VCONFIG is not set
 CONFIG_WGET=y
 CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
 CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
 # CONFIG_ZCIP is not set
-# CONFIG_TCPSVD is not set
-# CONFIG_TUNCTL is not set
-# CONFIG_FEATURE_TUNCTL_UG is not set
-# CONFIG_UDPSVD is not set
 
 #
 # Print Utilities
@@ -809,12 +876,21 @@ CONFIG_FEATURE_MIME_CHARSET=""
 #
 # Process Utilities
 #
+# CONFIG_IOSTAT is not set
+# CONFIG_MPSTAT is not set
+# CONFIG_NMETER is not set
+# CONFIG_PMAP is not set
+# CONFIG_POWERTOP is not set
+# CONFIG_PSTREE is not set
+# CONFIG_PWDX is not set
+# CONFIG_SMEMCAP is not set
+CONFIG_UPTIME=y
+# CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
 CONFIG_FREE=y
 CONFIG_FUSER=y
 CONFIG_KILL=y
 CONFIG_KILLALL=y
 # CONFIG_KILLALL5 is not set
-# CONFIG_NMETER is not set
 # CONFIG_PGREP is not set
 CONFIG_PIDOF=y
 # CONFIG_FEATURE_PIDOF_SINGLE is not set
@@ -835,7 +911,6 @@ CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
 # CONFIG_FEATURE_TOP_SMP_PROCESS is not set
 # CONFIG_FEATURE_TOPMEM is not set
 # CONFIG_FEATURE_SHOW_THREADS is not set
-CONFIG_UPTIME=y
 CONFIG_WATCH=y
 
 #
@@ -871,11 +946,9 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 #
 # Shells
 #
-CONFIG_FEATURE_SH_IS_ASH=y
-# CONFIG_FEATURE_SH_IS_HUSH is not set
-# CONFIG_FEATURE_SH_IS_NONE is not set
 CONFIG_ASH=y
 CONFIG_ASH_BASH_COMPAT=y
+# CONFIG_ASH_IDLE_TIMEOUT is not set
 CONFIG_ASH_JOB_CONTROL=y
 CONFIG_ASH_ALIAS=y
 CONFIG_ASH_GETOPTS=y
@@ -887,10 +960,13 @@ CONFIG_ASH_BUILTIN_TEST=y
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ASH_RANDOM_SUPPORT is not set
 CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_CTTYHACK is not set
 # CONFIG_HUSH is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
+# CONFIG_HUSH_BRACE_EXPANSION is not set
 # CONFIG_HUSH_HELP is not set
 # CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_SAVEHISTORY is not set
 # CONFIG_HUSH_JOB is not set
 # CONFIG_HUSH_TICK is not set
 # CONFIG_HUSH_IF is not set
@@ -898,16 +974,22 @@ CONFIG_ASH_EXPAND_PRMT=y
 # CONFIG_HUSH_CASE is not set
 # CONFIG_HUSH_FUNCTIONS is not set
 # CONFIG_HUSH_LOCAL is not set
-# CONFIG_HUSH_EXPORT_N is not set
 # CONFIG_HUSH_RANDOM_SUPPORT is not set
-# CONFIG_LASH is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_MODE_X is not set
 # CONFIG_MSH is not set
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+# CONFIG_FEATURE_BASH_IS_ASH is not set
+# CONFIG_FEATURE_BASH_IS_HUSH is not set
+CONFIG_FEATURE_BASH_IS_NONE=y
 CONFIG_SH_MATH_SUPPORT=y
 # CONFIG_SH_MATH_SUPPORT_64 is not set
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
-# CONFIG_CTTYHACK is not set
+CONFIG_FEATURE_SH_HISTFILESIZE=y
 
 #
 # System Logging Utilities
@@ -916,9 +998,12 @@ CONFIG_SYSLOGD=y
 CONFIG_FEATURE_ROTATE_LOGFILE=y
 CONFIG_FEATURE_REMOTE_LOG=y
 # CONFIG_FEATURE_SYSLOGD_DUP is not set
+CONFIG_FEATURE_SYSLOGD_CFG=y
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 CONFIG_FEATURE_IPC_SYSLOG=y
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
 CONFIG_LOGREAD=y
 CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
 CONFIG_KLOGD=y
+CONFIG_FEATURE_KLOGD_KLOGCTL=y
 CONFIG_LOGGER=y
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.19.3/get_header_tar.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/get_header_tar.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
similarity index 64%
rename from meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
index 7d532e6..1fe20d4 100644
--- a/meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch
+++ b/meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
@@ -19,11 +19,11 @@ diff -uNr busybox-1.15.3.orig//include/applets.src.h busybox-1.15.3/include/appl
 --- busybox-1.15.3.orig//include/applets.src.h	2009-12-12 22:13:28.000000000 +0100
 +++ busybox-1.15.3/include/applets.src.h	2010-04-30 15:35:40.000000000 +0200
 @@ -323,7 +323,7 @@
- IF_RPM(APPLET(rpm, _BB_DIR_BIN, _BB_SUID_DROP))
- IF_RPM2CPIO(APPLET(rpm2cpio, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RTCWAKE(APPLET(rtcwake, _BB_DIR_USR_BIN, _BB_SUID_DROP))
--IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_BIN, _BB_SUID_DROP, run_parts))
-+IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_USR_BIN, _BB_SUID_DROP, run_parts))
- IF_RUNCON(APPLET(runcon, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RUNLEVEL(APPLET(runlevel, _BB_DIR_SBIN, _BB_SUID_DROP))
- IF_RUNSV(APPLET(runsv, _BB_DIR_USR_BIN, _BB_SUID_DROP))
+ IF_RPM(APPLET(rpm, BB_DIR_BIN, BB_SUID_DROP))
+ IF_RPM2CPIO(APPLET(rpm2cpio, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_BIN, BB_SUID_DROP))
+-IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_BIN, BB_SUID_DROP, run_parts))
++IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_USR_BIN, BB_SUID_DROP, run_parts))
+ IF_RUNCON(APPLET(runcon, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_RUNLEVEL(APPLET(runlevel, BB_DIR_SBIN, BB_SUID_DROP))
+ IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, _BB_SUID_DROP))
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch b/meta/recipes-core/busybox/busybox-1.19.3/udhcpc-fix-nfsroot.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/udhcpc-fix-nfsroot.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch b/meta/recipes-core/busybox/busybox-1.19.3/udhcpscript.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/udhcpscript.patch
diff --git a/meta/recipes-core/busybox/busybox_1.18.5.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
similarity index 82%
rename from meta/recipes-core/busybox/busybox_1.18.5.bb
rename to meta/recipes-core/busybox/busybox_1.19.3.bb
index 17d583e..7a54789 100644
--- a/meta/recipes-core/busybox/busybox_1.18.5.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
@@ -7,6 +7,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
+           file://busybox-1.19.3-getty.patch \
            file://run-parts.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
@@ -25,7 +26,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://umount.busybox \
            file://defconfig"
 
-SRC_URI[tarball.md5sum] = "96dd43cc7cee4017a6bf31b7da82a1f5"
-SRC_URI[tarball.sha256sum] = "10954fcd5c48d8a262a3497b16227bf983a05658bf2bf661af2fdeca773f2fc0"
+SRC_URI[tarball.md5sum] = "c3938e1ac59602387009bbf1dd1af7f6"
+SRC_URI[tarball.sha256sum] = "a1a9a35732c719ef384f02b6e357c324d8be25bc154af91a48c4264b1e6038f0"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.7.7.3



