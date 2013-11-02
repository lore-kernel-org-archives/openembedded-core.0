Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C56A96AD31
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 05:20:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA25L2fC007142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 22:21:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 22:21:00 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 13:22:00 +0800
Message-ID: <b82b60b4613392b22d586aca914841b96c5f722d.1383369426.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383369426.git.Qi.Chen@windriver.com>
References: <cover.1383369426.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysvinit: adjust boot sequence and remove hack from udev
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
X-List-Received-Date: Sat, 02 Nov 2013 05:20:59 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Adjust the boot sequence in sysvinit based systems.

The mountall.sh (mounting the local file system) needs to be started
before udev and bootlogd.

This patch makes mountall.sh start before udev and removes the hack of
mounting tmpfs in the udev init script.

This patch also adds some comments to the udev init script to make it
clear why we create the '/var/volatile/tmp' directory.

[YOCTO #5273]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/udev/udev.inc                    |    2 +-
 meta/recipes-core/udev/udev/init                   |    4 +++-
 .../modutils-initscripts/modutils-initscripts.bb   |    2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index c2998c3..2d58266 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -115,7 +115,7 @@ do_install () {
 	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
 	update-rc.d -r ${D} banner.sh start 02 S .
 	update-rc.d -r ${D} checkroot.sh start 06 S .
-	update-rc.d -r ${D} mountall.sh start 35 S .
+	update-rc.d -r ${D} mountall.sh start 03 S .
 	update-rc.d -r ${D} hostname.sh start 39 S .
 	update-rc.d -r ${D} mountnfs.sh start 45 S .
 	update-rc.d -r ${D} bootmisc.sh start 55 S .
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 2ff8f00..02cab3b 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -50,7 +50,7 @@ PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
-INITSCRIPT_PARAMS_udev = "start 03 S ."
+INITSCRIPT_PARAMS_udev = "start 04 S ."
 INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index e048a17..410a650 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -54,7 +54,9 @@ case "$1" in
     }
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
-    mount -a -t tmpfs 2>/dev/null
+    # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
+    # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
+    # /var/volatile/tmp directory to be available.
     mkdir -p /var/volatile/tmp
 
     # Cache handling.
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 89d38cf..594e554 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -7,7 +7,7 @@ SRC_URI = "file://modutils.sh \
 PR = "r6"
 
 INITSCRIPT_NAME = "modutils.sh"
-INITSCRIPT_PARAMS = "start 4 S ."
+INITSCRIPT_PARAMS = "start 05 S ."
 
 inherit update-rc.d
 
-- 
1.7.9.5


