Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA936BA54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 06:43:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q6hgZK004979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:43:42 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 25 Aug 2013 23:43:41 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Aug 2013 14:43:55 +0800
Message-ID: <a2ff16e4b0c0ed3d04f1c6bc50d1b2a498e8020d.1377499381.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377499381.git.Qi.Chen@windriver.com>
References: <cover.1377499381.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] read-only-rootfs-hook.sh: check before bind mounting /var/lib
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
X-List-Received-Date: Mon, 26 Aug 2013 06:43:43 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

It's possible that /var/lib is on a separate writable partition. In such
situation, we should not bind mount /var/lib with tmpfs, becasue it's
already writable.

This patch fixes this problem by checking whether /var/lib is already
on a writable partition.

[YOCTO #4888]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   33 +++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 9cf0921..1a0328d 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -4,10 +4,35 @@
 
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
+is_on_read_only_partition () {
+	DIRECTORY=$1
+	dir=`readlink -f $DIRECTORY`
+	while true; do
+		if [ ! -d "$dir" ]; then
+			echo "ERROR: $dir is not a directory"
+			exit 1
+		else
+			for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
+				END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
+				[ "$flag" = "FOUND" ] && partition="read-write"
+				[ "$flag" = "ro" ] && { partition="read-only"; break; }
+			done
+			if [ "$dir" = "/" -o -n "$partition" ]; then
+				break
+			else
+				dir=`dirname $dir`
+			fi
+		fi
+	done
+	[ "$partition" = "read-only" ] && echo "yes" || echo "no"
+}
+
 if [ "$1" = "start" ] ; then
-	grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
-	mkdir -p /var/volatile/lib
-	cp -a /var/lib/* /var/volatile/lib
-	mount --bind /var/volatile/lib /var/lib
+	if [ `is_on_read_only_partition /var/lib` = "yes" ]; then
+		grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
+		mkdir -p /var/volatile/lib
+		cp -a /var/lib/* /var/volatile/lib
+		mount --bind /var/volatile/lib /var/lib
+	fi
 fi
 
-- 
1.7.9.5


