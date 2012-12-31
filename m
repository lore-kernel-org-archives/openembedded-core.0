Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TpaRp-0006by-Tr
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 09:10:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBV7tEjh012347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Dec 2012 23:55:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 30 Dec 2012 23:55:13 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Dec 2012 15:55:20 +0800
Message-ID: <53d2506b4fd5e55c7a3969ae456bea101f170633.1356940443.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356940443.git.Qi.Chen@windriver.com>
References: <cover.1356940443.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] init-live.sh: avoid duplicate mount points for the same filesystem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2012 08:10:21 -0000
X-List-Received-Date: Mon, 31 Dec 2012 08:10:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

A live system had duplicate mount points for the same filesystem
in the output of 'mount' command. That was because we didn't handle
the temporary mounts properly before switch_root.

This patch fixes this problem by moving the mount points of some
filesystems to the corresponding directories in the real root filesystem.

[YOCTO #3155]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index e8d7f70..0ae359d 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -59,10 +59,11 @@ read_args() {
 boot_live_root() {
     killall udevd 2>/dev/null
 
-    # use devtmpfs if available
-    if grep -q devtmpfs /proc/filesystems; then
-        mount -t devtmpfs devtmpfs $ROOT_MOUNT/dev
-    fi
+    # Move the mount points of some filesystems over to
+    # the corresponding directories under the real root filesystem.
+    mount -n --move /proc ${ROOT_MOUNT}/proc
+    mount -n --move /sys ${ROOT_MOUNT}/sys
+    mount -n --move /dev ${ROOT_MOUNT}/dev
 
     cd $ROOT_MOUNT
     exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
-- 
1.7.9.5



