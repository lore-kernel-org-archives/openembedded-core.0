Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 460B678D3C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 02:50:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w722onwL011480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 19:50:49 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 1 Aug 2018 19:50:49 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 19:50:39 -0700
Message-ID: <20180802025039.15748-4-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180802025039.15748-1-hongzhi.song@windriver.com>
References: <20180802025039.15748-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the systemd-mount
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
X-List-Received-Date: Thu, 02 Aug 2018 02:50:49 -0000
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
index 816d975e5e..9796cd7b90 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -36,6 +36,15 @@ done
 automount_systemd() {
 	name="`basename "$DEVNAME"`"
 
+	# Skip the partition which are already in /etc/fstab
+	grep "^[[:space:]]*$DEVNAME" /etc/fstab && return
+	for n in LABEL PARTLABEL UUID PARTUUID; do
+		tmp="$(lsblk -o $n $DEVNAME | sed -e '1d')"
+		test -z "$tmp" && continue
+		tmp="$n=$tmp"
+		grep "^[[:space:]]*$tmp" /etc/fstab && return
+	done
+
         ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
         # Silent util-linux's version of mounting auto
         MOUNT="$MOUNT -o silent"
-- 
2.11.0


