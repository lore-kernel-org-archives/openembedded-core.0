Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ACB3D76F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 07:59:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t817xSh9028247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 00:59:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 1 Sep 2015 00:59:27 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Sep 2015 15:54:39 +0800
Message-ID: <1441094079-19289-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] lvm2: enable lvmetad
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
X-List-Received-Date: Tue, 01 Sep 2015 07:59:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

the systemd unit file of lvm2-monitor requires lvm2-lvmetad.socket which
asks to enable lvmetad, lvmetad is a metadata caching daemon for LVM. so
this fixed the below error:
  # systemctl start lvm2-monitor
  Failed to start lvm2-monitor.service: Unit lvm2-lvmetad.socket failed to load: No such file or directory.
  #

replace the installation of system unit file by make install_systemd_units

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 099164c..2b2d8ed 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -24,6 +24,7 @@ EXTRA_OECONF = "--with-user= \
                 --enable-udev_rules \
                 --enable-pkgconfig \
                 --enable-dmeventd \
+                --enable-lvmetad \
                 --with-udev-prefix= \
                 --with-usrlibdir=${libdir} \
 "
@@ -38,14 +39,13 @@ do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${B}/scripts/lvm2_monitoring_systemd_red_hat.service ${D}${systemd_unitdir}/system/lvm2-monitor.service
-    install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.socket ${D}${systemd_unitdir}/system/dm-event.socket
-    install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.service ${D}${systemd_unitdir}/system/dm-event.service
+    oe_runmake 'DESTDIR=${D}' install install_systemd_units
+    sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
 }
 
 SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "lvm2-monitor.service dm-event.socket dm-event.service"
+SYSTEMD_SERVICE_${PN} = "lvm2-monitor.service dm-event.socket dm-event.service lvm2-lvmetad.socket \
+                         lvm2-pvscan@.service blk-availability.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


