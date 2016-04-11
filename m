Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6B70605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B7TJqn020257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:19 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:05 -0700
Message-ID: <135333204d1613292c77a134a4f9d602fba946ff.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/14] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:19 -0000
Content-Type: text/plain

From: Javier Viguera <javier.viguera@digi.com>

This includes a proper D-Bus service file for obexd in systems that do
not support systemd.

(From OE-Core rev: 75c5dc8d4a5506bf5b89292a96c7b9f91e9d71c8)

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...-obexd-without-systemd-in-the-user-sessio.patch | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index df42c88..d1af31e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
new file mode 100644
index 0000000..2fde7bc
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
-- 
2.7.4


