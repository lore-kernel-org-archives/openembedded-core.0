Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0CE46B204
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 07:33:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6G7XeNh019968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 00:33:40 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 00:33:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jul 2013 15:33:35 +0800
Message-ID: <2701823185a01c8b6e652ae6c28ba43ca2fb89db.1373954600.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373954600.git.hongxu.jia@windriver.com>
References: <cover.1373954600.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] udev-extraconf: allow users in disk group to write vfat filesystem
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
X-List-Received-Date: Tue, 16 Jul 2013 07:33:39 -0000
Content-Type: text/plain

If filesystem type is vfat, change the ownership group to 'disk', and grant it
with  w/r/x permissions.

The user which belongs to 'disk' group could write the storage.

[YOCTO #4004]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index d1419ed..327cfc6 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -27,6 +27,17 @@ automount() {
 		MOUNT="$MOUNT -o silent"
 	fi
 	
+	# If filesystem type is vfat, change the ownership group to 'disk', and
+	# grant it with  w/r/x permissions.
+	case $ID_FS_TYPE in
+	vfat|fat)
+		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+		;;
+	# TODO
+	*)
+		;;
+	esac
+
 	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
-- 
1.8.1.2


