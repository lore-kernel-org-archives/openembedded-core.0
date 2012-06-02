Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaeBd-0000HH-DR
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 04:35:29 +0200
Received: by dalh21 with SMTP id h21so3630250dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tMzB3TyFEsMvzDmUEw6OCXor2y3a4kXMyCH5nC8qzd4=;
	b=NCHj9RGAlMPhKWclOxMFV/fdBC26YUZLygOsPlg3ermfc23W/PNioIm251GBTzlYqm
	Esx++VNFs+8vmkXNcYUZsGp5lsJEDhKD7rUp14cyKgE938k7naKD7GxJRfO4dxwJqs9d
	mhmC4xCm78LLK/UGMcJ4pxDUKuKDvCsdX3t6BeHiw1tkiB8b1ZWv3LrsmYdcArnGq+Rk
	oBldk08sC+XTWfz5ORoGQEppFD5v89SzGV32yxDTfpM3pdJUwcumHrYTlgicVGOF3EKh
	XD1jjiOwFBGGXUaU5XDfwxB0eQp37wdlY3D65XE79rCErMB37poz1DPALE+Ntvn/3gMI
	EBRQ==
Received: by 10.68.219.202 with SMTP id pq10mr15572254pbc.82.1338603906990;
	Fri, 01 Jun 2012 19:25:06 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id jv6sm4679509pbc.40.2012.06.01.19.25.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 19:25:06 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 19:24:53 -0700
Message-Id: <2b3b157998f7cbcfb3e1a7cbe7eb5ebaea651189.1338603853.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.10.3
In-Reply-To: <cover.1338603853.git.kergoth@gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
In-Reply-To: <cover.1338603853.git.kergoth@gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
Subject: [PATCH 1/2] rpcbind: add and use startup script, move binaries
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
X-List-Received-Date: Sat, 02 Jun 2012 02:35:29 -0000

- Add init script from debian, tweaked for us
- Move binaries from bindir to sbindir, as debian does

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind/init.d   |   85 ++++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb |   18 ++++-
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
1.7.10.3



