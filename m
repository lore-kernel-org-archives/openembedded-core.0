Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACB676A4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:14:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Aug 2015 09:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,425,1437462000"; d="scan'208";a="792932529"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.66])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2015 09:14:56 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 11:15:01 -0500
Message-Id: <1440778501-7754-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] systemd: Increase devices timeout in QEMU machines to avoid failures on serial-getty
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
X-List-Received-Date: Fri, 28 Aug 2015 16:15:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Systemd serial-getty is failing because dev-tty ends with timeout, systemd
uses a default timeout of 90 secs that it's reached on AB's production environment
due to high I/O loads (nfs).

When use QEMU is used without KVM support, the machine code is executed by TCG
(software code execution) that is dependent on devices layer and causes locks
 between TCG/Devices increasing the machine code execution time [1].

QEMU don't support configuration of device timeout always uses a default one that is
90 secs, so the next patch increases the device timeout to 240 secs [2] in order give
enough time to get devices ready. It ONLY applies on QEMU machines.

[YOCTO #8141]

[1] http://blog.vmsplice.net/2011/03/qemu-internals-overall-architecture-and.html
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8141#c10

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ....c-Change-the-default-device-timeout-to-2.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch

diff --git a/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch
new file mode 100644
index 0000000..c7e1711
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Inappropriate [Specific case QEMU/AB]
+
+From 7b8c4e0a67a79a75e1bd77df3a452a5497322108 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Thu, 27 Aug 2015 17:58:26 -0500
+Subject: [PATCH] core/device.c: Change the default device timeout to 240 sec.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ src/core/device.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/device.c b/src/core/device.c
+index e7efcf0..4ed8f08 100644
+--- a/src/core/device.c
++++ b/src/core/device.c
+@@ -110,7 +110,7 @@ static void device_init(Unit *u) {
+          * indefinitely for plugged in devices, something which cannot
+          * happen for the other units since their operations time out
+          * anyway. */
+-        u->job_timeout = u->manager->default_timeout_start_usec;
++        u->job_timeout = (240 * USEC_PER_SEC);
+ 
+         u->ignore_on_isolate = true;
+         u->ignore_on_snapshot = true;
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index e187cea..2326753 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/systemd/systemd-stable;branch=v219-stable;protocol=g
            file://init \
            file://run-ptest \
           "
+SRC_URI_append_qemuall = "file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


