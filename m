Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD5B6A456
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 02:43:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r572hkMC029410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 19:43:46 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 19:43:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 10:43:48 +0800
Message-ID: <ea78edb11987616daed3fb897b3057baea4189f8.1370572948.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370572948.git.rongqing.li@windriver.com>
References: <cover.1370572948.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] PPP: add default configuration file and fix hard-coded CFLAGS
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
X-List-Received-Date: Fri, 07 Jun 2013 02:43:43 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. Add three ppp configuration files, make "/etc/init.d/ppp start"
be able to work with little change. provider and pap are adopted from
Ubuntu. ppp_on_boot is adopted from http://www.wlug.org.nz.
2. Use build system CFLAGS when compiling

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../recipes-connectivity/ppp/ppp-2.4.5/copts.patch |   21 ++++++++++++
 meta/recipes-connectivity/ppp/ppp-2.4.5/pap        |   22 ++++++++++++
 .../recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot |   21 ++++++++++++
 meta/recipes-connectivity/ppp/ppp-2.4.5/provider   |   35 ++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |   16 ++++++++-
 5 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/pap
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/provider

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch
new file mode 100644
index 0000000..53ff06e
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch
@@ -0,0 +1,21 @@
+ppp: use build system CFLAGS when compiling
+
+Upstream-Status: Pending
+
+Override the hard-coded COPTS make variables with
+CFLAGS.  Add COPTS into one Makefile that did not
+use it.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/pppd/plugins/radius/Makefile.linux
++++ b/pppd/plugins/radius/Makefile.linux
+@@ -12,7 +12,7 @@ VERSION = $(shell awk -F '"' '/VERSION/ 
+ INSTALL	= install
+ 
+ PLUGIN=radius.so radattr.so radrealms.so
+-CFLAGS=-I. -I../.. -I../../../include -O2 -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
++CFLAGS=-I. -I../.. -I../../../include $(COPTS) -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
+ 
+ # Uncomment the next line to include support for Microsoft's
+ # MS-CHAP authentication protocol.
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/pap b/meta/recipes-connectivity/ppp/ppp-2.4.5/pap
new file mode 100644
index 0000000..093c326
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/pap
@@ -0,0 +1,22 @@
+# You can use this script unmodified to connect to sites which allow
+# authentication via PAP, CHAP and similar protocols.
+# This script can be shared among different pppd peer configurations.
+# To use it, add something like this to your /etc/ppp/peers/ file:
+#
+# connect "/usr/sbin/chat -v -f /etc/chatscripts/pap -T PHONE-NUMBER"
+# user YOUR-USERNAME-IN-PAP-SECRETS
+# noauth
+
+# Uncomment the following line to see the connect speed.
+# It will be logged to stderr or to the file specified with the -r chat option.
+#REPORT		CONNECT
+
+ABORT		BUSY
+ABORT		VOICE
+ABORT		"NO CARRIER"
+ABORT		"NO DIALTONE"
+ABORT		"NO DIAL TONE"
+""		ATZ
+OK		ATDT\T
+CONNECT		""
+
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot b/meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot
new file mode 100644
index 0000000..9793761
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot
@@ -0,0 +1,21 @@
+###!/bin/sh
+#
+#   Rename this file to ppp_on_boot and pppd will be fired up as
+#   soon as the system comes up, connecting to `provider'.
+#
+#   If you also make this file executable, and replace the first line
+#   with just "#!/bin/sh", the commands below will be executed instead.
+#
+
+# The location of the ppp daemon itself (shouldn't need to be changed)
+PPPD=/usr/sbin/pppd
+
+# The default provider to connect to
+$PPPD call provider
+
+# Additional connections, which would just use settings from
+# /etc/ppp/options.<tty>
+#$PPPD ttyS0
+#$PPPD ttyS1
+#$PPPD ttyS2
+#$PPPD ttyS3
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/provider b/meta/recipes-connectivity/ppp/ppp-2.4.5/provider
new file mode 100644
index 0000000..e74d71a
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/provider
@@ -0,0 +1,35 @@
+# example configuration for a dialup connection authenticated with PAP or CHAP
+#
+# This is the default configuration used by pon(1) and poff(1).
+# See the manual page pppd(8) for information on all the options.
+
+# MUST CHANGE: replace myusername@realm with the PPP login name given to
+# your by your provider.
+# There should be a matching entry with the password in /etc/ppp/pap-secrets
+# and/or /etc/ppp/chap-secrets.
+user "myusername@realm"
+
+# MUST CHANGE: replace ******** with the phone number of your provider.
+# The /etc/chatscripts/pap chat script may be modified to change the
+# modem initialization string.
+connect "/usr/sbin/chat -v -f /etc/chatscripts/pap -T ********"
+
+# Serial device to which the modem is connected.
+/dev/modem
+
+# Speed of the serial line.
+115200
+
+# Assumes that your IP address is allocated dynamically by the ISP.
+noipdefault
+# Try to get the name server addresses from the ISP.
+usepeerdns
+# Use this connection as the default route.
+defaultroute
+
+# Makes pppd "dial again" when the connection is lost.
+persist
+
+# Do not ask the remote to authenticate.
+noauth
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 6af4e98..39354ef 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -25,7 +25,11 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://ip-up \
            file://ip-down \
            file://08setupdns \
-           file://92removedns"
+           file://92removedns \
+           file://copts.patch \
+           file://pap \
+           file://ppp_on_boot \
+           file://provider "
 
 SRC_URI[md5sum] = "4621bc56167b6953ec4071043fe0ec57"
 SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230003505"
@@ -36,6 +40,11 @@ TARGET_CC_ARCH += " ${LDFLAGS}"
 EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
 EXTRA_OECONF = "--disable-strip"
 
+# Package Makefile computes CFLAGS, referencing COPTS.
+# Typically hard-coded to '-O2 -g' in the Makefile's.
+#
+EXTRA_OEMAKE += ' COPTS="${CFLAGS}"'
+
 do_install_append () {
 	make install-etcppp ETCDIR=${D}/${sysconfdir}/ppp
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
@@ -48,6 +57,11 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/ip-down ${D}${sysconfdir}/ppp/
 	install -m 0755 ${WORKDIR}/08setupdns ${D}${sysconfdir}/ppp/ip-up.d/
 	install -m 0755 ${WORKDIR}/92removedns ${D}${sysconfdir}/ppp/ip-down.d/
+	mkdir -p ${D}${sysconfdir}/chatscripts
+	mkdir -p ${D}${sysconfdir}/ppp/peers
+	install -m 0755 ${WORKDIR}/pap ${D}${sysconfdir}/chatscripts
+	install -m 0755 ${WORKDIR}/ppp_on_boot ${D}${sysconfdir}/ppp/ppp_on_boot
+	install -m 0755 ${WORKDIR}/provider ${D}${sysconfdir}/ppp/peers/provider
 	rm -rf ${D}/${mandir}/man8/man8
 	chmod u+s ${D}${sbindir}/pppd
 }
-- 
1.7.10.4


