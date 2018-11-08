Return-Path: <sstrogin@cisco.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Nov 2018 09:44:24 UTC
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0CD79F12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3636; q=dns/txt; s=iport;
	t=1541670265; x=1542879865;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=buSYGf+oYGd1i97MKDDqP13GXcbuOt+1n6tRZZ8Urdk=;
	b=aRfhOMDBvaw5xU+ajA6LVP1j1SmjX/yP+k582GZSRinuuQEQbeaTZVNX
	q+/qC6TR3tYAo0NDZmFoUfO5UwW/teqWJdGS8dkhp54jwb86Lvcdglkmb
	2laAQEaSbEhRJRnCruXFE3WcCoAbXZEslpKxd+uPItpVevOGTf8o0/0bE g=;
X-IronPort-AV: E=Sophos;i="5.54,478,1534809600"; d="scan'208";a="198201527"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2018 09:34:54 +0000
Received: from vycislitel.cisco.com ([10.24.25.48]) (authenticated bits=0)
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPSA id wA89YR6V024418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Nov 2018 09:34:52 GMT
From: Stefan Strogin <sstrogin@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 11:36:31 +0200
Message-Id: <20181108093631.28934-1-sstrogin@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: sstrogin
X-Outbound-SMTP-Client: 10.24.25.48, [10.24.25.48]
X-Outbound-Node: rcdn-core-6.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] avahi: add ptest
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
X-List-Received-Date: Thu, 08 Nov 2018 09:44:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Stefan Strogin <sstrogin@cisco.com>
---
 meta/recipes-connectivity/avahi/avahi.inc       | 15 ++++++++++++++-
 meta/recipes-connectivity/avahi/avahi_0.7.bb    |  1 +
 meta/recipes-connectivity/avahi/files/run-ptest | 13 +++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/run-ptest

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 11846849f0..b354817d4d 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -35,7 +35,7 @@ PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
 
-inherit autotools pkgconfig gettext gobject-introspection
+inherit autotools pkgconfig gettext gobject-introspection ptest
 
 EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-stack-protector \
@@ -49,11 +49,13 @@ EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --enable-manpages \
              ${EXTRA_OECONF_SYSVINIT} \
              ${EXTRA_OECONF_SYSTEMD} \
+             ${EXTRA_OECONF_PTEST} \
            "
 
 # The distro choice determines what init scripts are installed
 EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
 EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
+EXTRA_OECONF_PTEST = "${@bb.utils.contains('PTEST_ENABLED','1','--enable-tests','',d)}"
 
 do_configure_prepend() {
     sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
@@ -66,6 +68,7 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
 }
 
+RDEPENDS_${PN}-ptest = "bash"
 RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
 
 do_install() {
@@ -75,3 +78,13 @@ do_install() {
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
 }
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/test/.libs
+    for t in dns-spin-test dns-test hashmap-test
+    do
+        install -m 0755 ${B}/avahi-core/$t ${D}${PTEST_PATH}/test/
+        sed -e 's/^relink_command=\"\(.*\)\"/relink_command=\"\"/' -i ${D}${PTEST_PATH}/test/$t
+        install -m 0755 ${B}/avahi-core/.libs/$t ${D}${PTEST_PATH}/test/.libs/lt-$t
+    done
+}
diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index 3d5f334a88..6e7767a27b 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://00avahi-autoipd \
            file://99avahi-autoipd \
            file://initscript.patch \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
+           file://run-ptest \
            "
 
 inherit update-rc.d systemd useradd
diff --git a/meta/recipes-connectivity/avahi/files/run-ptest b/meta/recipes-connectivity/avahi/files/run-ptest
new file mode 100644
index 0000000000..8b4875d5fd
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+cd ./test
+for t in *
+do
+	./$t
+	if [ $? -eq 0 ]
+	then
+		echo "PASS: $t"
+	else
+		echo "FAIL: $t"
+	fi
+done
-- 
2.19.1


