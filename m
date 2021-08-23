Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web09.20842.1629705162287242795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 00:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 17N7qdMr002477
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 09:52:40 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.58])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 17N7qdRC020524;
	Mon, 23 Aug 2021 09:52:39 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id DD328950A87;
	Mon, 23 Aug 2021 09:52:38 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] busybox: 1.33.1 -> 1.34.0
Date: Mon, 23 Aug 2021 09:51:05 +0200
Message-Id: <20210823075105.25991-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

- update to next stable version 1.34.0
- refresh defconfig
- remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...inittab_1.33.0.bb => busybox-inittab_1.34.0.bb} |   0
 ...iles-Use-C-locale-when-calling-sed-on-glo.patch |  28 ------
 ...-testsuite-check-uudecode-before-using-it.patch |   6 +-
 .../busybox/busybox-udhcpc-no_deconfig.patch       | 102 +++++----------------
 meta/recipes-core/busybox/busybox/defconfig        |  12 ++-
 .../{busybox_1.33.1.bb => busybox_1.34.0.bb}       |   3 +-
 6 files changed, 36 insertions(+), 115 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.33.0.bb => busybox-inittab_1.34.0.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
 rename meta/recipes-core/busybox/{busybox_1.33.1.bb => busybox_1.34.0.bb} (92%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.34.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.34.0.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch b/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
deleted file mode 100644
index e0a22c5bb3..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From bff7f16f7f41de8df67beb03722f235828ef2249 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 May 2021 15:48:19 -0700
-Subject: [PATCH] gen_build_files: Use C locale when calling sed on globbed files
-
-sort order is different based on chosen locale and also default shell
-being bash or dash
-
-This sets the environment variable LC_ALL to the value C, which will
-enforce bytewise sorting, irrespective of the shell
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- scripts/gen_build_files.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/scripts/gen_build_files.sh
-+++ b/scripts/gen_build_files.sh
-@@ -4,6 +4,8 @@
- # but users complain that many sed implementations
- # are misinterpreting --.
- 
-+export LC_ALL=C
-+
- test $# -ge 2 || { echo "Syntax: $0 SRCTREE OBJTREE"; exit 1; }
- 
- # cd to objtree
diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
index 25472f0bbd..d4bda3c12f 100644
--- a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
+++ b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
@@ -18,13 +18,13 @@ diff --git a/testsuite/tar.tests b/testsuite/tar.tests
 index d71a349..8c88567 100755
 --- a/testsuite/tar.tests
 +++ b/testsuite/tar.tests
-@@ -336,7 +336,7 @@ SKIP=
- cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
+@@ -339,7 +339,7 @@ cd .. || exit 1; rm -rf tar.tempdir 2>/d
+ fi
  
  mkdir tar.tempdir && cd tar.tempdir || exit 1
 -optional FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT LS
 +optional FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT LS UUDECODE
- testing "Symlink attack: create symlink and then write through it" '\
+ testing "tar Symlink attack: create symlink and then write through it" '\
  exec 2>&1
  uudecode -o input && tar xvf input; echo $?
 diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 35e981d6a2..d55a85420b 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -31,11 +31,11 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
  networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++------
  1 file changed, 21 insertions(+), 8 deletions(-)
 
-Index: busybox-1.32.0/networking/udhcp/dhcpc.c
+Index: busybox-1.34.0/networking/udhcp/dhcpc.c
 ===================================================================
---- busybox-1.32.0.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.32.0/networking/udhcp/dhcpc.c
-@@ -48,6 +48,8 @@ struct tpacket_auxdata {
+--- busybox-1.34.0.orig/networking/udhcp/dhcpc.c
++++ busybox-1.34.0/networking/udhcp/dhcpc.c
+@@ -48,6 +48,8 @@
  };
  #endif
  
@@ -44,47 +44,37 @@ Index: busybox-1.32.0/networking/udhcp/dhcpc.c
  
  /* "struct client_data_t client_data" is in bb_common_bufsiz1 */
  
-@@ -103,8 +105,10 @@
- 	OPT_x = 1 << 18,
- 	OPT_f = 1 << 19,
- 	OPT_B = 1 << 20,
-+	OPT_D = 1 << 21,
+@@ -100,8 +102,10 @@
+ 	OPT_x = 1 << 16,
+ 	OPT_f = 1 << 17,
+ 	OPT_B = 1 << 18,
++	OPT_D = 1 << 19,
  /* The rest has variable bit positions, need to be clever */
- 	OPTBIT_B = 20,
-+	OPTBIT_D = 21,
+ 	OPTBIT_B = 18,
++	OPTBIT_D = 19,
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1084,7 +1088,8 @@
- 		client_data.state = RENEW_REQUESTED;
- 		break;
- 	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
--		udhcp_run_script(NULL, "deconfig");
-+		if (allow_deconfig)
-+			udhcp_run_script(NULL, "deconfig");
- 	case REQUESTING:
- 	case RELEASED:
- 		change_listen_mode(LISTEN_RAW);
-@@ -1120,7 +1125,8 @@ static void perform_release(uint32_t server_addr, uint32_t requested_ip)
-  * Users requested to be notified in all cases, even if not in one
-  * of the states above.
-  */
--	udhcp_run_script(NULL, "deconfig");
+@@ -587,7 +591,8 @@
+ 
+ static void d4_run_script_deconfig(void)
+ {
+-	d4_run_script(NULL, "deconfig");
 +	if (allow_deconfig)
-+		udhcp_run_script(NULL, "deconfig");
++		d4_run_script(NULL, "deconfig");
+ }
  
- 	change_listen_mode(LISTEN_NONE);
- 	client_data.state = RELEASED;
-@@ -1238,7 +1244,7 @@
+ /*** Sending/receiving packets ***/
+@@ -1244,7 +1249,7 @@
  	/* Parse command line */
  	opt = getopt32long(argv, "^"
  		/* O,x: list; -T,-t,-A take numeric param */
--		"CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
-+		"CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
+-		"CV:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
++		"CV:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1349,6 +1355,10 @@
+@@ -1361,6 +1366,10
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -95,49 +85,3 @@ Index: busybox-1.32.0/networking/udhcp/dhcpc.c
  	/* Create pidfile */
  	write_pidfile(client_data.pidfile);
  	/* Goes to stdout (unless NOMMU) and possibly syslog */
-@@ -1357,7 +1367,8 @@
- 	srand(monotonic_us());
- 
- 	client_data.state = INIT_SELECTING;
--	udhcp_run_script(NULL, "deconfig");
-+	if (allow_deconfig)
-+		udhcp_run_script(NULL, "deconfig");
- 	change_listen_mode(LISTEN_RAW);
- 	packet_num = 0;
- 	timeout = 0;
-@@ -1530,7 +1541,8 @@
- 				}
- 				/* Timed out, enter init state */
- 				bb_simple_info_msg("lease lost, entering init state");
--				udhcp_run_script(NULL, "deconfig");
-+				if (allow_deconfig)
-+					udhcp_run_script(NULL, "deconfig");
- 				client_data.state = INIT_SELECTING;
- 				client_data.first_secs = 0; /* make secs field count from 0 */
- 				/*timeout = 0; - already is */
-@@ -1722,8 +1734,10 @@
- 							"(got ARP reply), declining");
- 						send_decline(/*xid,*/ server_addr, packet.yiaddr);
- 
--						if (client_data.state != REQUESTING)
--							udhcp_run_script(NULL, "deconfig");
-+						if (client_data.state != REQUESTING) {
-+							if (allow_deconfig)
-+								udhcp_run_script(NULL, "deconfig");
-+						}
- 						change_listen_mode(LISTEN_RAW);
- 						client_data.state = INIT_SELECTING;
- 						client_data.first_secs = 0; /* make secs field count from 0 */
-@@ -1792,8 +1806,10 @@
- 				/* return to init state */
- 				bb_info_msg("received %s", "DHCP NAK");
- 				udhcp_run_script(&packet, "nak");
--				if (client_data.state != REQUESTING)
--					udhcp_run_script(NULL, "deconfig");
-+				if (client_data.state != REQUESTING) {
-+					if (allow_deconfig)
-+						udhcp_run_script(NULL, "deconfig");
-+				}
- 				change_listen_mode(LISTEN_RAW);
- 				sleep(3); /* avoid excessive network traffic */
- 				client_data.state = INIT_SELECTING;
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 701d48d625..16c61a84b2 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.33.0
-# Wed Mar 10 13:29:25 2021
+# Busybox version: 1.34.0
+# Wed Aug 23 09:07:25 2021
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -207,11 +207,13 @@ CONFIG_CHOWN=y
 # CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
 CONFIG_CHROOT=y
 # CONFIG_CKSUM is not set
+CONFIG_CRC32=y
 # CONFIG_COMM is not set
 CONFIG_CP=y
 # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CP_REFLINK is not set
 CONFIG_CUT=y
+CONFIG_FEATURE_CUT_REGEX=y
 CONFIG_DATE=y
 # CONFIG_FEATURE_DATE_ISOFMT is not set
 # CONFIG_FEATURE_DATE_NANO is not set
@@ -316,7 +318,6 @@ CONFIG_TEST2=y
 CONFIG_FEATURE_TEST_64=y
 # CONFIG_TIMEOUT is not set
 CONFIG_TOUCH=y
-CONFIG_FEATURE_TOUCH_NODEREF=y
 CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
@@ -424,6 +425,7 @@ CONFIG_VI=y
 CONFIG_FEATURE_VI_MAX_LEN=1024
 CONFIG_FEATURE_VI_8BIT=y
 CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_COLON_EXPAND=y
 CONFIG_FEATURE_VI_YANKMARK=y
 CONFIG_FEATURE_VI_SEARCH=y
 # CONFIG_FEATURE_VI_REGEX_SEARCH is not set
@@ -437,6 +439,7 @@ CONFIG_FEATURE_VI_WIN_RESIZE=y
 CONFIG_FEATURE_VI_UNDO=y
 CONFIG_FEATURE_VI_UNDO_QUEUE=y
 CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=256
+CONFIG_FEATURE_VI_VERBOSE_STATUS=y
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
@@ -743,6 +746,7 @@ CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
 # Miscellaneous Utilities
 #
 # CONFIG_ADJTIMEX is not set
+CONFIG_ASCII=y
 # CONFIG_BBCONFIG is not set
 # CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
 # CONFIG_BC is not set
@@ -838,6 +842,7 @@ CONFIG_TS=y
 # CONFIG_UBIRENAME is not set
 # CONFIG_VOLNAME is not set
 # CONFIG_WATCHDOG is not set
+# CONFIG_FEATURE_WATCHDOG_OPEN_TWICE is not set
 
 #
 # Networking Utilities
@@ -976,6 +981,7 @@ CONFIG_TRACEROUTE=y
 CONFIG_WGET=y
 CONFIG_FEATURE_WGET_LONG_OPTIONS=y
 CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_FTP=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
 CONFIG_FEATURE_WGET_TIMEOUT=y
 CONFIG_FEATURE_WGET_HTTPS=y
diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb b/meta/recipes-core/busybox/busybox_1.34.0.bb
similarity index 92%
rename from meta/recipes-core/busybox/busybox_1.33.1.bb
rename to meta/recipes-core/busybox/busybox_1.34.0.bb
index 1e3e34e2a4..51df1df05f 100644
--- a/meta/recipes-core/busybox/busybox_1.33.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.34.0.bb
@@ -47,9 +47,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
-           file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            file://0001-mktemp-add-tmpdir-option.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28"
+SRC_URI[tarball.sha256sum] = "ec8d1615edb045b83b81966604759c4d4ac921434ab4011da604f629c06074ce"
-- 
2.11.0

