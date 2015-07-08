Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE0E75D79
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 09:36:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 965205188046
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 10:35:55 +0100
Message-Id: <e381d47cd09ba3b95f9a1bcb15c5a864a0b0761e.1436347958.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436347958.git.joshua.lock@collabora.co.uk>
References: <cover.1436347958.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1436347958.git.joshua.lock@collabora.co.uk>
References: <cover.1436347958.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 1/1] systemd: fix immediate unmount of mountpoints not in fstab
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
X-List-Received-Date: Wed, 08 Jul 2015 09:36:14 -0000

Systemd 219 immediately unmounts any mounts which don't exist
in fstab. See FDo bug #89383:
https://bugs.freedesktop.org/show_bug.cgi?id=89383

Patch from Fedora:
http://pkgs.fedoraproject.org/cgit/systemd.git/commit/?h=f22&id=9bbe0e92dc59d5a42258c729b105a7d9901eb35e

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 ...-mount-add-dependencies-to-dynamically-mo.patch | 36 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch b/meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
new file mode 100644
index 0000000..d69cfe0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
@@ -0,0 +1,36 @@
+From eb7a760052667c5a35637901de9359c377263804 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Tue, 24 Feb 2015 10:12:28 -0500
+Subject: [PATCH] Revert "core/mount: add dependencies to dynamically mounted
+ mounts too"
+
+This reverts commit 06e97888883e2cc12eb6514e80c7f0014295f59b.
+
+This patch was imported from Fedora (http://pkgs.fedoraproject.org/cgit/systemd.git/commit/?h=f22&id=9bbe0e92dc59d5a42258c729b105a7d9901eb35e).
+
+It fixes an issue where mount points not listed in fstab are immediately
+unmounted after a call to mount.
+
+Upstream-Status: Inappropriate [fixed upstream]
+
+Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
+---
+ src/core/mount.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/mount.c b/src/core/mount.c
+index 40037e7..cddb5e2 100644
+--- a/src/core/mount.c
++++ b/src/core/mount.c
+@@ -295,7 +295,7 @@ static int mount_add_device_links(Mount *m) {
+ 
+         assert(m);
+ 
+-        p = get_mount_parameters(m);
++        p = get_mount_parameters_fragment(m);
+         if (!p)
+                 return 0;
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 6ed4fe0..bac2784 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stab
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://tmpfiles-pam.patch \
+           file://0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
2.1.4


