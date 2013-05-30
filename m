Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 55DB76A4FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:03:59 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k13so268352wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=hmr5Zj5u4K8Mc6AujsG1aeEthtpWPx5idjciiQsNBEA=;
	b=mlKkXJoHt+wdiS4ROfHDZqCUmZMuo5bXasJ5QACFem/9qaCbU4UFb3y6fP53MD6yPS
	Rt/RF6X97gkyRyP4WK3PlAfinwP3UNoNzS5/TXgxWWScq07HeV9ApFjujZxlC4tEwqmr
	RdQs//WVkwTni1Swlfkc1SgkN/IcfP37D9+wHtIbDAVzEKpvKbVlW+WZmSIpxUToSBAn
	8+O80iXtCXDoS9QEF1kTC9JPA4+uWuqyjxvRiiG97m+3OI2yQDnQdq9phT5oQ9yvHIx5
	ZC3uJLHGcL3k+JSTGLp44B/kMU6VTCREN1N/98jOC6HaQCrkL/oOMkpDeDpBv/SZgs0V
	6SzQ==
X-Received: by 10.180.212.3 with SMTP id ng3mr4905623wic.22.1369922639751;
	Thu, 30 May 2013 07:03:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id h8sm38208362wiz.9.2013.05.30.07.03.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 07:03:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 15:00:36 +0100
Message-Id: <ed9bc6364911cb9594e33c1bd253f3ef9cd6bb86.1369922325.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmam0uUg3tN7sUyrmdOwAhc5pg52D1VQQgK+RjhBNxA4Ofq87rcvPtfDErPp1qWA5On+FI3
Subject: [PATCH 3/4] weston-init: basic init script to start Weston on KMS/DRM
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
X-List-Received-Date: Thu, 30 May 2013 14:03:59 -0000

weston-init is a very basic init script to start Weston as root on KMS/DRM.

To re-iterate, this runs Weston as root.  This will be fixed to use
weston-launch shortly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston-init.bb   |   17 +++++++
 meta/recipes-graphics/wayland/weston-init/init |   56 ++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston-init.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/init

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
new file mode 100644
index 0000000..a3fe811
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "startup for weston"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+SRC_URI = "file://init"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}/${sysconfdir}/init.d
+	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+}
+
+inherit allarch update-rc.d
+
+INITSCRIPT_NAME = "weston"
+INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
new file mode 100644
index 0000000..3c73e7c
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: weston
+# Required-Start: $local_fs $remote_fs
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+killproc() {
+        pid=`/bin/pidof $1`
+        [ "$pid" != "" ] && kill $pid
+}
+
+read CMDLINE < /proc/cmdline
+for x in $CMDLINE; do
+        case $x in
+        weston=false)
+		echo "Weston disabled"
+		exit 0;
+                ;;
+        esac
+done
+
+case "$1" in
+  start)
+        . /etc/profile
+
+        # This is all a nasty hack
+        if test -z "$XDG_RUNTIME_DIR"; then
+                export XDG_RUNTIME_DIR=/var/run/user/root
+                mkdir --parents $XDG_RUNTIME_DIR
+                chmod 0700 $XDG_RUNTIME_DIR
+        fi
+
+        weston
+  ;;
+
+  stop)
+        echo "Stopping XServer"
+        killproc weston
+  ;;
+
+  restart)
+	$0 stop
+        sleep 1
+        $0 start
+  ;;
+
+  *)
+        echo "usage: $0 { start | stop | restart }"
+  ;;
+esac
+
+exit 0
-- 
1.7.10.4


