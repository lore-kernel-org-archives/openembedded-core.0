Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73D4D6BA22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:20:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2L3Ktbl018629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:20:55 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:20:52 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:10 -0400
Message-ID: <1553138356-85237-3-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] mdadm: add udev rules to create by-partuuid for MD devices
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
X-List-Received-Date: Thu, 21 Mar 2019 03:20:56 -0000
Content-Type: text/plain

installer use partuuid for boot and swap partition,
But the udev rules for MD devices do not have rules to create
by-partuuid under /dev/disk/, this will take 90s to wait until failed
add the rules to create by-partuuid to support boot from raid
disk with "root=PARTUUID=XXX"

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...ev.rules-create-by-partuuid-for-md-device.patch | 29 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-device.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-device.patch b/meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-device.patch
new file mode 100644
index 000000000000..c1f7b1cf8736
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-device.patch
@@ -0,0 +1,29 @@
+From 7d1fa6afba936edb3e211f0ccdb58b1472b4bbf4 Mon Sep 17 00:00:00 2001
+From: Liwei Song <liwei.song@windriver.com>
+Date: Tue, 26 Feb 2019 07:05:42 +0000
+Subject: [PATCH] udev.rules: create by-partuuid for md device
+
+Create by-partuuid for every md devices.
+
+Upstream-Status: sent to linux-raid@vger.kernel.org(https://www.spinics.net/lists/raid/msg62373.html)
+
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ udev-md-raid-arrays.rules | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/udev-md-raid-arrays.rules b/udev-md-raid-arrays.rules
+index c95ec7b1e4a9..e326414efcbc 100644
+--- a/udev-md-raid-arrays.rules
++++ b/udev-md-raid-arrays.rules
+@@ -30,6 +30,7 @@ IMPORT{builtin}="blkid"
+ OPTIONS+="link_priority=100"
+ OPTIONS+="watch"
+ ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{ID_FS_UUID_ENC}=="?*", SYMLINK+="disk/by-uuid/$env{ID_FS_UUID_ENC}"
++ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_PART_ENTRY_UUID}=="?*", SYMLINK+="disk/by-partuuid/$env{ID_PART_ENTRY_UUID}"
+ ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
+ 
+ ENV{MD_LEVEL}=="raid[1-9]*", ENV{SYSTEMD_WANTS}+="mdmonitor.service"
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 6b32f08abee1..db2b0b3c7873 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
 	   file://mdadm.init \
 	   file://mdmonitor.service \
            file://0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch \
+	   file://0001-udev.rules-create-by-partuuid-for-md-device.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
-- 
2.7.4


