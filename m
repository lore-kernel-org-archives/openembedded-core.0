Return-Path: <btv1==024bf9e6ca9==Terry.Boese@vecima.com>
X-Greylist: delayed 802 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Aug 2016 22:54:11 UTC
Received: from mx1.vecima.com (mx1.vecima.com [216.65.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3553E731FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 22:54:11 +0000 (UTC)
X-ASG-Debug-ID: 1470350448-0347d858c52225e0001-7zcVdP
Received: from ExchangeInt.corp.vcom.com (exchangeint.corp.vcom.com
	[192.168.50.125]) by mx1.vecima.com with ESMTP id
	Vuy440w6aGmgw6QP for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 16:40:48 -0600 (CST)
X-Barracuda-Envelope-From: Terry.Boese@vecima.com
Received: from PC2170.corp.vcom.com (192.168.216.92) by
	ExchangeInt.corp.vcom.com (192.168.50.125) with Microsoft SMTP Server
	id 14.3.279.2; Thu, 4 Aug 2016 16:40:48 -0600
From: Terry Boese <terry.boese@vecima.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2016 16:40:20 -0600
X-ASG-Orig-Subj: [PATCH] Update dnsmasq to version 2.76
Message-ID: <1470350420-19935-1-git-send-email-terry.boese@vecima.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.168.216.92]
X-Barracuda-Connect: exchangeint.corp.vcom.com[192.168.50.125]
X-Barracuda-Start-Time: 1470350448
X-Barracuda-URL: https://192.168.99.189:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 3823
X-Virus-Scanned: by bsmtpd at vecima.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=4.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.31757
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: [PATCH] Update dnsmasq to version 2.76
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
X-List-Received-Date: Thu, 04 Aug 2016 22:54:12 -0000
Content-Type: text/plain

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index cc7f9e3..9ef54fe 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -26,10 +26,10 @@ PACKAGECONFIG[conntrack] = ",,libnetfilter-conntrack"
 PACKAGECONFIG[lua] = ",,lua"
 PACKAGECONFIG[resolvconf] = ",,,resolvconf"
 EXTRA_OEMAKE = "\
-    'COPTS=${@base_contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
-           ${@base_contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
-           ${@base_contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
-           ${@base_contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
+    'COPTS=${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
     'CFLAGS=${CFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
 "
@@ -38,7 +38,7 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.
 
 do_compile_append() {
     # build dhcp_release
-    cd ${S}/contrib/wrt
+    cd ${S}/contrib/lease-tools
     oe_runmake
 }
 
@@ -53,19 +53,19 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
 
-    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
         install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     else
         install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     fi
 
-    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
+    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
 
-    if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
     fi
-    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/resolvconf/update.d/
         install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
 
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
deleted file mode 100644
index a11aabb..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI += "\
-    file://lua.patch \
-"
-
-SRC_URI[dnsmasq-2.75.md5sum] = "d99ac126d4fe910c679d88430559669b"
-SRC_URI[dnsmasq-2.75.sha256sum] = "f8252c0a0ba162c2cd45f81140c7c17cc40a5fca2b869d1a420835b74acad294"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
new file mode 100644
index 0000000..41573d9
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI += "\
+    file://lua.patch \
+"
+
+SRC_URI[dnsmasq-2.76.md5sum] = "6610f8233ca89b15a1bb47c788ffb84f"
+SRC_URI[dnsmasq-2.76.sha256sum] = "777c4762d2fee3738a0380401f2d087b47faa41db2317c60660d69ad10a76c32"
-- 
2.7.4


