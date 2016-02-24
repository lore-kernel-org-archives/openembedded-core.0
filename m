Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 384 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Feb 2016 18:18:49 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.196])
	by mail.openembedded.org (Postfix) with ESMTP id E1D1677197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:18:49 +0000 (UTC)
Received: from [216.82.242.37] by server-4.bemta-8.messagelabs.com id
	19/D3-03483-A82FDC65; Wed, 24 Feb 2016 18:12:26 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-10.tower-99.messagelabs.com!1456337539!12394018!8
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3454 invoked from network); 24 Feb 2016 18:12:26 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-10.tower-99.messagelabs.com with SMTP;
	24 Feb 2016 18:12:26 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 24 Feb 2016 19:12:25 +0100
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.266.1; Wed, 24 Feb 2016 19:12:25 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 19:12:21 +0100
Message-ID: <1456337541-4269-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.7.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: [PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Wed, 24 Feb 2016 18:18:50 -0000
Content-Type: text/plain

This includes a proper D-Bus service file for obexd in systems that do
not support systemd.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...-obexd-without-systemd-in-the-user-sessio.patch | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ff2bdcba62a4..f38eaa503598 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -19,6 +19,7 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     file://init \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
new file mode 100644
index 000000000000..2fde7bc06923
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
@@ -0,0 +1,63 @@
+From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.org>
+Date: Sat, 12 Oct 2013 17:45:25 +0200
+Subject: [PATCH] Allow using obexd without systemd in the user session
+
+Not all sessions run systemd --user (actually, the majority
+doesn't), so the dbus daemon must be able to spawn obexd
+directly, and to do so it needs the full path of the daemon.
+
+Upstream-Status: Denied
+
+Not accepted by upstream maintainer for being a distro specific
+configuration. See thread:
+
+http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
+
+Signed-off-by: Javier Viguera <javier.viguera@digi.com>
+---
+ Makefile.obexd                      | 4 ++--
+ obexd/src/org.bluez.obex.service    | 4 ----
+ obexd/src/org.bluez.obex.service.in | 4 ++++
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+ delete mode 100644 obexd/src/org.bluez.obex.service
+ create mode 100644 obexd/src/org.bluez.obex.service.in
+
+diff --git a/Makefile.obexd b/Makefile.obexd
+index 2e33cbc72f2b..d5d858c857b4 100644
+--- a/Makefile.obexd
++++ b/Makefile.obexd
+@@ -2,12 +2,12 @@
+ if SYSTEMD
+ systemduserunitdir = @SYSTEMD_USERUNITDIR@
+ systemduserunit_DATA = obexd/src/obex.service
++endif
+ 
+ dbussessionbusdir = @DBUS_SESSIONBUSDIR@
+ dbussessionbus_DATA = obexd/src/org.bluez.obex.service
+-endif
+ 
+-EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service
++EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service.in
+ 
+ obex_plugindir = $(libdir)/obex/plugins
+ 
+diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex.service
+deleted file mode 100644
+index a53808884554..000000000000
+--- a/obexd/src/org.bluez.obex.service
++++ /dev/null
+@@ -1,4 +0,0 @@
+-[D-BUS Service]
+-Name=org.bluez.obex
+-Exec=/bin/false
+-SystemdService=dbus-org.bluez.obex.service
+diff --git a/obexd/src/org.bluez.obex.service.in b/obexd/src/org.bluez.obex.service.in
+new file mode 100644
+index 000000000000..9c815f246b77
+--- /dev/null
++++ b/obexd/src/org.bluez.obex.service.in
+@@ -0,0 +1,4 @@
++[D-BUS Service]
++Name=org.bluez.obex
++Exec=@libexecdir@/obexd
++SystemdService=dbus-org.bluez.obex.service

