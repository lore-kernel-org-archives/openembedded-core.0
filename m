Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91F836093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 08:36:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1M8aRBS010147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 00:36:27 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 22 Feb 2018 00:36:07 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 03:36:15 -0500
Message-ID: <1519288575-139362-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH v2] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Thu, 22 Feb 2018 08:36:26 -0000
Content-Type: text/plain

With MountFlags=slave, those mounts then become private to the systemd-udevd
namespace and are no longer accessible from outside the namespace, which is
not expected.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...evd-re-enable-mount-propagation-for-udevd.patch | 33 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch b/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
new file mode 100644
index 0000000..fce7bdd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
@@ -0,0 +1,33 @@
+From 11a3312d36109f5e5a7697ddb05c533c51e2cd75 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 19 Feb 2018 20:43:02 -0500
+Subject: [PATCH] systemd-udevd: re-enable mount propagation for udevd
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Change the mount propagation flag from MountFlags=slave to MountFlags=shared
+(default). Use shared to ensure that mounts and unmounts are propagated from 
+systemd's namespace to the service's namespace and vice versa, while use slave 
+to run processes so that none of their mounts and unmounts will propagate to 
+the host.
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ units/systemd-udevd.service.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/units/systemd-udevd.service.in b/units/systemd-udevd.service.in
+index fc037b5..841d7a8 100644
+--- a/units/systemd-udevd.service.in
++++ b/units/systemd-udevd.service.in
+@@ -24,7 +24,6 @@ ExecStart=@rootlibexecdir@/systemd-udevd
+ KillMode=mixed
+ WatchdogSec=3min
+ TasksMax=infinity
+-MountFlags=slave
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
+ RestrictAddressFamilies=AF_UNIX AF_NETLINK AF_INET AF_INET6
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index d12e94f..6aceafb 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0001-meson-update-header-file-to-detect-memfd_create.patch \
            file://0002-configure.ac-Check-if-memfd_create-is-already-define.patch \
            file://0003-fileio-include-sys-mman.h.patch \
+	   file://systemd-udevd-re-enable-mount-propagation-for-udevd.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.8.1


