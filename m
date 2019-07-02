Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 807 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jul 2019 08:19:53 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE587E9FF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:19:53 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6286QJ3001210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2019 10:06:26 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x6286PSE026841;
	Tue, 2 Jul 2019 10:06:26 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2BD1074B930;
	Tue,  2 Jul 2019 10:06:19 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 10:06:08 +0200
Message-Id: <20190702080608.25040-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: 1.30.1 -> 1.31.0
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
X-List-Received-Date: Tue, 02 Jul 2019 08:19:53 -0000

- update to last stable version 1.31.0
- remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...inittab_1.30.1.bb => busybox-inittab_1.31.0.bb} |  0
 ...ix-two-test-case-to-also-depend-on-DC_BIG.patch | 39 --------------
 .../busybox/busybox-udhcpc-no_deconfig.patch       | 60 +++++++++++-----------
 .../{busybox_1.30.1.bb => busybox_1.31.0.bb}       |  5 +-
 4 files changed, 32 insertions(+), 72 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.30.1.bb => busybox-inittab_1.31.0.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
 rename meta/recipes-core/busybox/{busybox_1.30.1.bb => busybox_1.31.0.bb} (89%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb b/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch b/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
deleted file mode 100644
index d22db4a663..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a4e03fbb4d82f91069d96005405f89c45b8fd157 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 17 Apr 2019 09:24:37 +0800
-Subject: [PATCH] dc.tests: fix two test case to also depend on DC_BIG
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2019-April/087205.html]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- testsuite/dc.tests | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/testsuite/dc.tests b/testsuite/dc.tests
-index 1708a48..8c3af41 100755
---- a/testsuite/dc.tests
-+++ b/testsuite/dc.tests
-@@ -41,6 +41,9 @@ testing "dc complex without spaces (multiple args)" \
- 	"16\n" \
- 	"" ""
- 
-+optional FEATURE_DC_BIG
-+# All tests below depend on FEATURE_DC_BIG
-+
- testing "dc read" \
- 	"dc -finput" \
- 	"2\n9\n1\n" \
-@@ -51,9 +54,6 @@ testing "dc read string" \
- 	"2\nstr\n1\n" \
- 	"1?2\nf" "[str]\n"
- 
--optional FEATURE_DC_BIG
--# All tests below depend on FEATURE_DC_BIG
--
- testing "dc '>a' (conditional execute string) 1" \
- 	"dc" \
- 	"1\n9\n" \
--- 
-2.7.4
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 76daaf1f02..2a0a40c512 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -31,10 +31,10 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
  networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++------
  1 file changed, 21 insertions(+), 8 deletions(-)
 
-Index: busybox-1.29.1/networking/udhcp/dhcpc.c
+Index: busybox-1.31.0/networking/udhcp/dhcpc.c
 ===================================================================
---- busybox-1.29.1.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.29.1/networking/udhcp/dhcpc.c
+--- busybox-1.31.0.orig/networking/udhcp/dhcpc.c
++++ busybox-1.31.0/networking/udhcp/dhcpc.c
 @@ -48,6 +48,8 @@
  };
  #endif
@@ -42,21 +42,21 @@ Index: busybox-1.29.1/networking/udhcp/dhcpc.c
 +/* option whether to down the interface when reconfiguring */
 +static int allow_deconfig = 1;
  
- /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
+ /* "struct client_data_t client_data" is in bb_common_bufsiz1 */
  
-@@ -103,8 +105,9 @@
+@@ -103,8 +105,10 @@
  	OPT_x = 1 << 18,
  	OPT_f = 1 << 19,
  	OPT_B = 1 << 20,
 +	OPT_D = 1 << 21,
  /* The rest has variable bit positions, need to be clever */
--	OPTBIT_B = 20,
+ 	OPTBIT_B = 20,
 +	OPTBIT_D = 21,
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1116,7 +1119,8 @@
- 		state = RENEW_REQUESTED;
+@@ -1124,7 +1128,8 @@
+ 		client_data.state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
 -		udhcp_run_script(NULL, "deconfig");
@@ -65,7 +65,7 @@ Index: busybox-1.29.1/networking/udhcp/dhcpc.c
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -1152,7 +1156,8 @@
+@@ -1160,7 +1165,8 @@
   * Users requested to be notified in all cases, even if not in one
   * of the states above.
   */
@@ -74,8 +74,8 @@ Index: busybox-1.29.1/networking/udhcp/dhcpc.c
 +		udhcp_run_script(NULL, "deconfig");
  
  	change_listen_mode(LISTEN_NONE);
- 	state = RELEASED;
-@@ -1265,7 +1270,7 @@
+ 	client_data.state = RELEASED;
+@@ -1278,7 +1284,7 @@
  	/* Parse command line */
  	opt = getopt32long(argv, "^"
  		/* O,x: list; -T,-t,-A take numeric param */
@@ -84,7 +84,7 @@ Index: busybox-1.29.1/networking/udhcp/dhcpc.c
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1376,6 +1381,10 @@
+@@ -1389,6 +1395,10 @@
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -92,52 +92,52 @@ Index: busybox-1.29.1/networking/udhcp/dhcpc.c
 +		allow_deconfig = 0;
 +	}
 +
- 	/* Make sure fd 0,1,2 are open */
- 	bb_sanitize_stdio();
  	/* Create pidfile */
-@@ -1388,7 +1397,8 @@
+ 	write_pidfile(client_data.pidfile);
+ 	/* Goes to stdout (unless NOMMU) and possibly syslog */
+@@ -1397,7 +1407,8 @@
  	srand(monotonic_us());
  
- 	state = INIT_SELECTING;
+ 	client_data.state = INIT_SELECTING;
 -	udhcp_run_script(NULL, "deconfig");
 +	if (allow_deconfig)
 +		udhcp_run_script(NULL, "deconfig");
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1555,7 +1565,8 @@
+@@ -1570,7 +1581,8 @@
  				}
  				/* Timed out, enter init state */
- 				bb_error_msg("lease lost, entering init state");
+ 				bb_info_msg("lease lost, entering init state");
 -				udhcp_run_script(NULL, "deconfig");
 +				if (allow_deconfig)
 +					udhcp_run_script(NULL, "deconfig");
- 				state = INIT_SELECTING;
- 				client_config.first_secs = 0; /* make secs field count from 0 */
+ 				client_data.state = INIT_SELECTING;
+ 				client_data.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
-@@ -1748,8 +1759,10 @@
+@@ -1762,8 +1774,10 @@
  							"(got ARP reply), declining");
  						send_decline(/*xid,*/ server_addr, packet.yiaddr);
  
--						if (state != REQUESTING)
+-						if (client_data.state != REQUESTING)
 -							udhcp_run_script(NULL, "deconfig");
-+						if (state != REQUESTING) {
++						if (client_data.state != REQUESTING) {
 +							if (allow_deconfig)
 +								udhcp_run_script(NULL, "deconfig");
 +						}
  						change_listen_mode(LISTEN_RAW);
- 						state = INIT_SELECTING;
- 						client_config.first_secs = 0; /* make secs field count from 0 */
-@@ -1818,8 +1831,10 @@
+ 						client_data.state = INIT_SELECTING;
+ 						client_data.first_secs = 0; /* make secs field count from 0 */
+@@ -1832,8 +1846,10 @@
  				/* return to init state */
- 				bb_error_msg("received %s", "DHCP NAK");
+ 				bb_info_msg("received %s", "DHCP NAK");
  				udhcp_run_script(&packet, "nak");
--				if (state != REQUESTING)
+-				if (client_data.state != REQUESTING)
 -					udhcp_run_script(NULL, "deconfig");
-+				if (state != REQUESTING) {
++				if (client_data.state != REQUESTING) {
 +					if (allow_deconfig)
 +						udhcp_run_script(NULL, "deconfig");
 +				}
  				change_listen_mode(LISTEN_RAW);
  				sleep(3); /* avoid excessive network traffic */
- 				state = INIT_SELECTING;
+ 				client_data.state = INIT_SELECTING;
diff --git a/meta/recipes-core/busybox/busybox_1.30.1.bb b/meta/recipes-core/busybox/busybox_1.31.0.bb
similarity index 89%
rename from meta/recipes-core/busybox/busybox_1.30.1.bb
rename to meta/recipes-core/busybox/busybox_1.31.0.bb
index ba76755d74..f0185434aa 100644
--- a/meta/recipes-core/busybox/busybox_1.30.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.0.bb
@@ -44,9 +44,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
-           file://0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "4f72fc6abd736d5f4741fc4a2485547a"
-SRC_URI[tarball.sha256sum] = "3d1d04a4dbd34048f4794815a5c48ebb9eb53c5277e09ffffc060323b95dfbdc"
+SRC_URI[tarball.md5sum] = "cdba5d4458f944ceec5cdcf7c4914b69"
+SRC_URI[tarball.sha256sum] = "0e4925392fd9f3743cc517e031b68b012b24a63b0cf6c1ff03cce7bb3846cc99"
-- 
2.11.0


