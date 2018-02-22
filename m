Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D37C171B50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 14:16:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1MEG2To013687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:16:02 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 22 Feb 2018 06:15:41 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 09:15:37 -0500
Message-ID: <20180222141537.229103-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH v3] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Thu, 22 Feb 2018 14:16:01 -0000
Content-Type: text/plain

MountFlags's default value is shared in systemd-udevd.service. But upstream
sets MountFlags with slave just for keeping mounts done by udev private to
udevd, which causes block device mounted by udev unvisable but being busy for
host. So we revert it to shared to be propagated to host.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...evd-re-enable-mount-propagation-for-udevd.patch | 33 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch b/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
new file mode 100644
index 0000000000..fce7bdd796
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
index babc351cc8..42f4f1ec76 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -32,6 +32,7 @@ SRC_URI += " \
            file://0001-main-skip-many-initialization-steps-when-running-in-.patch \
            file://CVE-2017-18078.patch \
            file://0001-resolved-fix-loop-on-packets-with-pseudo-dns-types.patch \
+	   file://systemd-udevd-re-enable-mount-propagation-for-udevd.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.13.3


