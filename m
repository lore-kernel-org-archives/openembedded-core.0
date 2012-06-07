Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQO-00047k-N6
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733175"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:00 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbEnE006519 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:14 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbELB006518
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:14 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:36:52 -0700
Message-Id: <dcc390475507ca577523907926ac954d9d7abc8c.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 04/22] rpcbind: add and use startup script, move binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2012 23:47:33 -0000

From: Christopher Larson <kergoth@gmail.com>

- Add init script from debian, tweaked for us
- Move binaries from bindir to sbindir, as debian does

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-extended/rpcbind/rpcbind/init.d   |   85 ++++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb |   18 +++++-
 2 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/init.d

diff --git a/meta/recipes-extended/rpcbind/rpcbind/init.d b/meta/recipes-extended/rpcbind/rpcbind/init.d
new file mode 100644
index 0000000..5c756bb
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/init.d
@@ -0,0 +1,85 @@
+#!/bin/sh
+#
+# start/stop rpcbind daemon.
+
+### BEGIN INIT INFO
+# Provides:          rpcbind
+# Required-Start:    $network
+# Required-Stop:     $network
+# Default-Start:     S 2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: RPC portmapper replacement
+# Description:       rpcbind is a server that converts RPC (Remote
+#                    Procedure Call) program numbers into DARPA
+#                    protocol port numbers. It must be running in
+#                    order to make RPC calls. Services that use
+#                    RPC include NFS and NIS.
+### END INIT INFO
+
+test -f /sbin/rpcbind || exit 0
+
+OPTIONS=""
+if [ -f /etc/default/rpcbind ]
+then
+    . /etc/default/rpcbind
+elif [ -f /etc/rpcbind.conf ]
+then
+    . /etc/rpcbind.conf
+fi
+
+start ()
+{
+    echo -n "Starting rpcbind daemon..."
+    if pidof /sbin/rpcbind >/dev/null; then
+        echo "already running."
+        exit 0
+    fi
+    start-stop-daemon --start --quiet --exec /sbin/rpcbind -- "$@"
+    if [ $? -eq 0 ]; then
+        echo "done."
+    else
+        echo "failed."
+    fi
+}
+
+stop ()
+{
+    echo "Stopping rpcbind daemon..."
+    if ! pidof /sbin/rpcbind >/dev/null; then
+        echo "not running."
+        exit 0
+    fi
+    start-stop-daemon --stop --quiet --exec /sbin/rpcbind
+    if [ $? -eq 0 ]; then
+        echo "done."
+    else
+        echo "failed."
+    fi
+}
+
+case "$1" in
+    start)
+        start $OPTIONS
+        ;;
+    stop)
+        stop
+        ;;
+    force-reload)
+        stop
+        start $OPTIONS
+        ;;
+    restart)
+        stop
+        start $OPTIONS
+        ;;
+    status)
+        pidof /sbin/rpcbind >/dev/null
+        exit $?
+        ;;
+    *)
+        echo "Usage: /etc/init.d/rpcbind {start|stop|force-reload|restart|status}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index 62f6667..9fb4f51 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -11,12 +11,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
                     file://src/rpcinfo.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
+           file://init.d \
            file://fix_host_path.patch \
           "
 
 SRC_URI[md5sum] = "1a77ddb1aaea8099ab19c351eeb26316"
 SRC_URI[sha256sum] = "c92f263e0353887f16379d7708ef1fb4c7eedcf20448bc1e4838f59497a00de3"
 
-PR = "r2"
+PR = "r3"
 
-inherit autotools
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "rpcbind"
+INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
+
+do_install_append () {
+    mv ${D}${bindir} ${D}${sbindir}
+
+    install -d ${D}${sysconfdir}/init.d
+    sed -e 's,/etc/,${sysconfdir}/,g' \
+        -e 's,/sbin/,${sbindir}/,g' \
+        ${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
+    chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
+}
-- 
1.7.5.4



