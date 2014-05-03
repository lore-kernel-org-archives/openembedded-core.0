Return-Path: <joelf@ti.com>
X-Greylist: delayed 403 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 03 May 2014 22:35:00 UTC
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 44F066098C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 22:35:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s43MSIhi014930
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 May 2014 17:28:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s43MSHSv017921
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 May 2014 17:28:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 May 2014 17:28:17 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s43MSHsh006184;	Sat, 3 May 2014 17:28:17 -0500
Received: from joelboxx.am.dhcp.ti.com (joelboxx.am.dhcp.ti.com
	[128.247.71.22])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id s43MSHt24160;	Sat, 3 May 2014 17:28:17 -0500 (CDT)
From: Joel Fernandes <joelf@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 May 2014 18:39:03 -0400
Message-ID: <1399156743-14903-1-git-send-email-joelf@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sat, 03 May 2014 22:35:00 -0000
Content-Type: text/plain

In poky with systemd enabled, vt102 is selected for getty
causing user to experience a very crappy terminal. Default
TERM to linux.

Signed-off-by: Joel Fernandes <joelf@ti.com>
---
 .../systemd-serialgetty/serial-getty@.service      |    1 +
 meta/recipes-core/systemd/systemd_211.bb           |    1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 865de34..eb2280b 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -20,6 +20,7 @@ Before=getty.target
 IgnoreOnIsolate=yes
 
 [Service]
+Environment="TERM=linux"
 ExecStart=-/sbin/agetty --keep-baud %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 44b1965..f92efd0 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
+PR = "r1"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-- 
1.7.9.5


