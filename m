Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id E99A67FE04
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 19:48:12 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id v69so3662526ili.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 11:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bO1iDd/Id3aqThSe1u7V6ARJnItoEdWgNc3KIxqvpfI=;
	b=sg4orSdKjN9klalEDA71z/WBFegzpS6KVOR7cXTt1y/+rZANt13EjIkEGoLCPzcdys
	G+uQ83Eif0d1s6sFGsWkHZnjg1DeOqTvdIBUrI4WIneSzVxLwGeTqMEyiRfx/bmto9Rz
	s4RGopJQEYqkF0Osc+poiBgxaPt+XP+2SUjSRpkFtAmjSJUtPnj+qB0zmnAB10YWGaZI
	Hu6e71f7slNtN7yLZFRo9XtCxpr6qypgwDRIXw6UWa6mqfP4usgCh4esbDaDNzxjoH1w
	wdRe4eFaydbAWKUPss7XLNjuCS597TPfc0dASktLWcD5PmDVn7tT+tOQFLLkZj8WsHbN
	vkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bO1iDd/Id3aqThSe1u7V6ARJnItoEdWgNc3KIxqvpfI=;
	b=ikWOO6x1Fxwmo677L/RLcnlWaO0JQLtrXNiA6bO0LPMfZIsDF2+OjV8lzMmATxQb/N
	yl1zX1Z5Cr5vwpnF7u5X7NwZPf/6J37eB52N1mi3SHXw1Ezv9qGYd2O7PCJzo5/wlWVZ
	L8dTE70C3G+LZfVTS9JdwfHGF/hpqGH7sUDmP0XD+siiFY/h5iH8hfs1Xv/BfiL26cW6
	WOuMVH5b5SifWLS4X8itV2qtOdpi2p8l1Tr6xnVdTpu5R6qCpW3d6PuM33bxYKAeYAP3
	qcYVqOy/STqvkIqLStmqYfUbJe0VFyDYuZsz9Ztc0ALtx7EDUbFNXd2DFuTN2VLJBmdu
	5gPQ==
X-Gm-Message-State: APjAAAWlVKiRkD2ZY3O9b1lWK2Jq63fBn5BmjpTm3VMGCUGS98ugaTt7
	qIlzRQTIA24CYBpTKC+8BpBM+qxZ
X-Google-Smtp-Source: APXvYqwj0DF0UBCKHsRjh+18tk8j+YApzUxqtl+DNquW5VdhZxjkzt7aznV+gfX6ZBHmNti9zCOoiQ==
X-Received: by 2002:a92:5845:: with SMTP id m66mr5397195ilb.257.1578512893543; 
	Wed, 08 Jan 2020 11:48:13 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id e65sm1254348ilg.2.2020.01.08.11.48.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 11:48:12 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 13:48:07 -0600
Message-Id: <20200108194807.2748386-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] runqemu: Add network bridge support
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
X-List-Received-Date: Wed, 08 Jan 2020 19:48:13 -0000
Content-Transfer-Encoding: 8bit

Qemu supports attaching the virtual machine to an existing network
bridge interface via the qemu-bridge-helper program (as long as the
system is correctly configured to give the user permissions). Add
support for runqemu to do this also via the "bridge=<INTERFACE>"
argument. Note that for this to work correctly, the host
qemu-bridge-helper must be used, not the one that might have been built
by qemu-native. In order for qemu to correctly find this program, a
qemu-oe-bridge-helper program has been added to qemu-helper-native, and
runqemu will use this helper as the bridge helper. The helper will look
for the host qemu-bridge-helper first by looking in the
QEMU_BRIDGE_HELPER environment variable, then by search common paths
where the helper is installed.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../qemu/qemu-helper-native_1.0.bb            |  7 +++++-
 .../qemu/qemu-helper/qemu-oe-bridge-helper    | 25 +++++++++++++++++++
 scripts/runqemu                               | 13 ++++++++--
 3 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper

diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 372eebd8864..2fc07669dd4 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -5,7 +5,10 @@ PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
 
-SRC_URI = "file://tunctl.c"
+SRC_URI = "\
+    file://tunctl.c \
+    file://qemu-oe-bridge-helper \
+    "
 
 S = "${WORKDIR}"
 
@@ -18,6 +21,8 @@ do_compile() {
 do_install() {
 	install -d ${D}${bindir}
 	install tunctl ${D}${bindir}/
+
+    install -m 755 ${WORKDIR}/qemu-oe-bridge-helper ${D}${bindir}/
 }
 
 DEPENDS += "qemu-system-native"
diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
new file mode 100755
index 00000000000..f057d4eef09
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
@@ -0,0 +1,25 @@
+#! /bin/sh
+# Copyright 2020 Garmin Ltd. or its subsidiaries
+#
+# SPDX-License-Identifier: GPL-2.0
+#
+# Attempts to find and exec the host qemu-bridge-helper program
+
+# If the QEMU_BRIDGE_HELPER variable is set by the user, exec it.
+if [ -n "$QEMU_BRIDGE_HELPER" ]; then
+    exec "$QEMU_BRIDGE_HELPER" "$@"
+fi
+
+# Search common paths for the helper program
+BN="qemu-bridge-helper"
+PATHS="/usr/libexec/ /usr/lib/qemu/"
+
+for p in $PATHS; do
+    if [ -e "$p/$BN" ]; then
+        exec "$p/$BN" "$@"
+    fi
+done
+
+echo "$BN not found!" > /dev/stderr
+exit 1
+
diff --git a/scripts/runqemu b/scripts/runqemu
index c324982e8a8..dd0aa4b28f7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -165,6 +165,7 @@ class BaseConfig(object):
         self.kvm_enabled = False
         self.vhost_enabled = False
         self.slirp_enabled = False
+        self.net_bridge = None
         self.nfs_instance = 0
         self.nfs_running = False
         self.serialconsole = False
@@ -485,6 +486,8 @@ class BaseConfig(object):
                 self.vhost_enabled = True
             elif arg == 'slirp':
                 self.slirp_enabled = True
+            elif arg.startswith('bridge='):
+                self.net_bridge = '%s' % arg[len('bridge='):]
             elif arg == 'snapshot':
                 self.snapshot = True
             elif arg == 'publicvnc':
@@ -802,7 +805,7 @@ class BaseConfig(object):
     def check_and_set(self):
         """Check configs sanity and set when needed"""
         self.validate_paths()
-        if not self.slirp_enabled:
+        if not self.slirp_enabled and not self.net_bridge:
             check_tun()
         # Check audio
         if self.audio_enabled:
@@ -1020,6 +1023,10 @@ class BaseConfig(object):
 
         self.nfs_running = True
 
+    def setup_net_bridge(self):
+        self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
+            self.net_bridge, os.path.join(self.bindir_native, 'qemu-oe-bridge-helper')))
+
     def setup_slirp(self):
         """Setup user networking"""
 
@@ -1161,7 +1168,9 @@ class BaseConfig(object):
         if sys.stdin.isatty():
             self.saved_stty = subprocess.check_output(("stty", "-g")).decode('utf-8').strip()
         self.network_device = self.get('QB_NETWORK_DEVICE') or self.network_device
-        if self.slirp_enabled:
+        if self.net_bridge:
+            self.setup_net_bridge()
+        elif self.slirp_enabled:
             self.setup_slirp()
         else:
             self.setup_tap()
-- 
2.24.1


