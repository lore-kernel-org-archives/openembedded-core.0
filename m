Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E354879C42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:07:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9MC7cAo031625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 05:07:49 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 22 Oct 2018 05:07:28 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 19:58:40 +0800
Message-ID: <20181022115840.38029-4-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181022115840.38029-1-kexin.hao@windriver.com>
References: <20181022115840.38029-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] udev-extraconf: Skip the entry in /etc/fstab when using the systemd-mount
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
X-List-Received-Date: Mon, 22 Oct 2018 12:07:58 -0000
Content-Type: text/plain

When using systemd, the systemd-fstab-generator would parse the
/etc/fstab and create the corresponding unit dynamically. So we don't
need to handle the ADD action for the partitions in /etc/fstab.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index afb368dd6737..3ee67b13183a 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -38,6 +38,15 @@ done
 automount_systemd() {
     name="`basename "$DEVNAME"`"
 
+    # Skip the partition which are already in /etc/fstab
+    grep "^[[:space:]]*$DEVNAME" /etc/fstab && return
+    for n in LABEL PARTLABEL UUID PARTUUID; do
+        tmp="$(lsblk -o $n $DEVNAME | sed -e '1d')"
+        test -z "$tmp" && continue
+        tmp="$n=$tmp"
+        grep "^[[:space:]]*$tmp" /etc/fstab && return
+    done
+
     [ -d "/run/media/$name" ] || mkdir -p "/run/media/$name"
 
     MOUNT="$MOUNT -o silent"
-- 
2.14.4


