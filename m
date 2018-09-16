Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58D2B600E3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 05:46:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8G5k6qi025322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 22:46:16 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 22:45:55 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Sep 2018 22:45:32 -0700
Message-ID: <20180916054532.1312-4-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180916054532.1312-1-hongzhi.song@windriver.com>
References: <20180916054532.1312-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the systemd-moun
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
X-List-Received-Date: Sun, 16 Sep 2018 05:46:25 -0000
Content-Type: text/plain

When using systemd, the systemd-fstab-generator would parse the
/etc/fstab and create the corresponding unit dynamically. So we don't
need to handle the ADD action for the partitions in /etc/fstab.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 4cb5db3a9b..665ad3e54c 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -36,6 +36,15 @@ done
 automount_systemd() {
 	name="`basename "$DEVNAME"`"
 
+        # Skip the partition which are already in /etc/fstab
+        grep "^[[:space:]]*$DEVNAME" /etc/fstab && return
+        for n in LABEL PARTLABEL UUID PARTUUID; do
+            tmp="$(lsblk -o $n $DEVNAME | sed -e '1d')"
+            test -z "$tmp" && continue
+            tmp="$n=$tmp"
+            grep "^[[:space:]]*$tmp" /etc/fstab && return
+        done
+
         ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
 
         # If filesystem type is vfat, change the ownership group to 'disk', and
-- 
2.11.0


