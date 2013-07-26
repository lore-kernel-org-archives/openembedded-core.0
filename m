Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0546B3CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:39:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q7ddvi024581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:39:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 00:39:38 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 15:39:30 +0800
Message-ID: <d8a3e07546df15c56fc82119c1f0dbb98812e492.1374642547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374642547.git.Qi.Chen@windriver.com>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 3/9] udev: remove implicit dependency on initscripts
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
X-List-Received-Date: Fri, 26 Jul 2013 07:39:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

At some point, the udev was modified to source the functions from
initscripts or lsbinitscripts. This dependency is actually not needed.
If we use udev in a system where initscripts from oe-core is not available,
there will be errors.

This patch fixes this problem by removing the implicit dependency.

[YOCTO #4882]
[YOCTO #4103]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev/init |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 4e5094a..52c7925 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -9,8 +9,6 @@
 # Short-Description: Start udevd, populate /dev and load drivers.
 ### END INIT INFO
 
-. /etc/init.d/functions
-
 export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
@@ -31,6 +29,11 @@ readfiles () {
    done
 }
 
+kill_udevd () {
+    pid=`pidof -x udevd`
+    [ -n "$pid" ] && kill $pid
+}
+
 case "$1" in
   start)
     export ACTION=add
@@ -94,7 +97,7 @@ case "$1" in
     fi
 
     # make_extra_nodes
-    killproc udevd > "/dev/null" 2>&1
+    kill_udevd > "/dev/null" 2>&1
 
     # trigger the sorted events
     echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
@@ -119,7 +122,12 @@ case "$1" in
     $0 start
     ;;
   status)
-    status udevd
+    pid=`pidof -x udevd`
+    if [ -n "$pid" ]; then
+	echo "udevd (pid $pid) is running ..."
+    else
+	echo "udevd is stopped"
+    fi
     ;;
   *)
     echo "Usage: $0 {start|stop|status|restart}"
-- 
1.7.9.5


