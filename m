Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 6282A7CEBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:11:14 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F187E00529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f18:7e00:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id E5841220235;
	Thu,  7 Mar 2019 14:04:09 +0100 (CET)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 14:04:01 +0100
Message-Id: <20190307130401.15700-3-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307130401.15700-1-max+openembedded@blarg.de>
References: <20190307130401.15700-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 3/3] initrdscripts: merge multiple "mkdir" calls
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
X-List-Received-Date: Thu, 07 Mar 2019 13:11:14 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Reduce overhead.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 mode change 100644 => 100755 meta/recipes-core/initrdscripts/files/init-live.sh

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
old mode 100644
new mode 100755
index 65183d7eec..b20660b60a
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -28,8 +28,7 @@ udev_daemon() {
 _UDEV_DAEMON=`udev_daemon`
 
 early_setup() {
-    mkdir -p /proc
-    mkdir -p /sys
+    mkdir -p /proc /sys /run /var/run
     mount -t proc proc /proc
     mount -t sysfs sysfs /sys
     mount -t devtmpfs none /dev
@@ -37,9 +36,6 @@ early_setup() {
     # support modular kernel
     modprobe isofs 2> /dev/null
 
-    mkdir -p /run
-    mkdir -p /var/run
-
     $_UDEV_DAEMON --daemon
     udevadm trigger --action=add
 }
-- 
2.20.1


