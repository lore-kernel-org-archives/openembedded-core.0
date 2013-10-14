Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7BE6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:42:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2013 08:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,493,1378882800"; d="scan'208";a="410682305"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.188])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2013 08:42:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2013 16:42:39 +0100
Message-Id: <1381765359-6786-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Nick Glynn <n.s.glynn@gmail.com>
Subject: [meta-webserver][PATCH v3] sthttpd: add systemd service
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
X-List-Received-Date: Mon, 14 Oct 2013 15:42:42 -0000

From: Nick Glynn <n.s.glynn@gmail.com>

Signed-off-by: Nick Glynn <n.s.glynn@gmail.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---

Fixes since v2:
* Make it apply properly on top of master
* Avoid hardcoded paths in service file
* Tidy up commit message

 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service | 10 ++++++++++
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb      | 11 ++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
new file mode 100644
index 0000000..e2dae61
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Tiny/Turbo/Throttling Web Server
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/thttpd -d @@SRVDIR -c cgi-bin/* -i /var/run/thttpd.pid
+PIDFile=/var/run/thttpd.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
index ba2f047..0abd131 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
 
 SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+           file://thttpd.service \
            file://init"
 
 SRC_URI[md5sum] = "e645a85a97d3cb883011a35bc2211815"
@@ -12,7 +13,7 @@ SRC_URI[sha256sum] = "78e87979140cbda123c81b4051552242dbbffb5dec1a17e5f95ec4826b
 
 S = "${WORKDIR}/sthttpd-${PV}"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
 
@@ -21,11 +22,19 @@ do_install_append () {
     install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
     sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${sysconfdir}/init.d/thttpd
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
+    sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${systemd_unitdir}/system/thttpd.service
 }
 
 INITSCRIPT_NAME = "thttpd"
 INITSCRIPT_PARAMS = "defaults"
 
+SYSTEMD_SERVICE_${PN} = "thttpd.service"
+
 FILES_${PN} += "${servicedir}"
 FILES_${PN}-dbg += "${servicedir}/www/cgi-bin/.debug"
 
-- 
1.8.1.2


