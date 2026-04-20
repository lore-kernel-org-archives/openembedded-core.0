Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E191F5A8B1
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:08:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1311.1776712076881667769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CyxAZvnm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E26DF22E6
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 314293F915
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776712076; bh=/dkCmsLUpPZR7uyV3smlAtVH/CrACEo+KHJHtzPXMzc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CyxAZvnmVvUn5IDPnvbNwD1POMKB3Lo24MMfo7zwFL2o5QTLSEA9SfEgWgx3kHCvk
	 +qmYcBH4NASnuT4JACVTUZfv0YufMmlElPTRx0xRp3pCdcRREhv/FjURHMzn/BvDwE
	 ofT4/v1EJxQMMDDfsTpx1QdOqVYJ3rDlcTL8Y4X8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] util-linux: fix CVE-2026-27456
Date: Mon, 20 Apr 2026 20:07:49 +0100
Message-ID: <20260420190749.1280090-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420190749.1280090-1-ross.burton@arm.com>
References: <20260420190749.1280090-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 19:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235586

Backport a patch from upstream to fix CVE-2026-27456:

  Prior to version 2.41.4, a TOCTOU (Time-of-Check-Time-of-Use)
  vulnerability has been identified in the SUID binary /usr/bin/mount
  from util-linux. The mount binary, when setting up loop devices,
  validates the source file path with user privileges via fork() +
  setuid() + realpath(), but subsequently re-canonicalizes and opens it
  with root privileges (euid=3D0) without verifying that the path has not
  been replaced between both operations. Neither O_NOFOLLOW, nor inode
  comparison, nor post-open fstat() are employed. This allows a local
  unprivileged user to replace the source file with a symlink pointing
  to any root-owned file or device during the race window, causing the
  SUID binary to open and mount it as root. Exploitation requires an
  /etc/fstab entry with user,loop options whose path points to a
  directory where the attacker has write permission, and that
  /usr/bin/mount has the SUID bit set (the default configuration on
  virtually all Linux distributions). The impact is unauthorized read
  access to root-protected files and block devices, including backup
  images, disk volumes, and any file containing a valid filesystem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-=
add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index deb9bfd0644..02358626669 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,6 +20,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock=
_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-h=
ard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
+           file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlin=
k-a.patch \
            "
=20
 SRC_URI[sha256sum] =3D "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed=
9b50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOO=
PDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch b/meta/recipes-core/util-linu=
x/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.pa=
tch
new file mode 100644
index 00000000000..0951c9f5fbe
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL=
_NOFOLLOW-to-prevent-symlink-a.patch
@@ -0,0 +1,114 @@
+From f55f9906b4f6eeb2b4a4120317df9de935253c10 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 13:59:46 +0100
+Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink att=
acks
+
+Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
+prevents symlink following in both path canonicalization and file open.
+
+When set:
+- loopcxt_set_backing_file() uses strdup() instead of
+  ul_canonicalize_path() (which calls realpath() and follows symlinks)
+- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
+
+The flag is set for non-root (restricted) mount operations in
+libmount's loop device hook. This prevents a TOCTOU race condition
+where an attacker could replace the backing file (specified in
+/etc/fstab) with a symlink to an arbitrary root-owned file between
+path resolution and open().
+
+Vulnerable Code Flow:
+
+  mount /mnt/point (non-root, SUID)
+    mount.c: sanitize_paths() on user args (mountpoint only)
+    mnt_context_mount()
+      mnt_context_prepare_mount()
+        mnt_context_apply_fstab()           <-- source path from fstab
+        hooks run at MNT_STAGE_PREP_SOURCE
+          hook_loopdev.c: setup_loopdev()
+            backing_file =3D fstab source path ("/home/user/disk.img")
+            loopcxt_set_backing_file()       <-- calls realpath() as ROO=
T
+              ul_canonicalize_path()         <-- follows symlinks!
+            loopcxt_setup_device()
+              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
+
+Two vulnerabilities in the path:
+
+1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
+   realpath() -- this follows symlinks as euid=3D0. If the attacker swap=
s
+   the file to a symlink before this call, lc->filename becomes the
+   resolved target path (e.g., /root/secret.img).
+
+2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
+   if canonicalization happened correctly, the file can be swapped to a
+   symlink between canonicalize and open.
+
+Addresses: https://github.com/util-linux/util-linux/security/advisories/=
GHSA-qq4x-vfq4-9h9g
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
+
+CVE: CVE-2026-27456
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ include/loopdev.h           | 3 ++-
+ lib/loopdev.c               | 7 ++++++-
+ libmount/src/hook_loopdev.c | 3 ++-
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/include/loopdev.h b/include/loopdev.h
+index e5ec1c98a..6bdb1393a 100644
+--- a/include/loopdev.h
++++ b/include/loopdev.h
+@@ -140,7 +140,8 @@ enum {
+ 	LOOPDEV_FL_NOIOCTL	=3D (1 << 6),
+ 	LOOPDEV_FL_DEVSUBDIR	=3D (1 << 7),
+ 	LOOPDEV_FL_CONTROL	=3D (1 << 8),	/* system with /dev/loop-control */
+-	LOOPDEV_FL_SIZELIMIT	=3D (1 << 9)
++	LOOPDEV_FL_SIZELIMIT	=3D (1 << 9),
++	LOOPDEV_FL_NOFOLLOW	=3D (1 << 10)	/* O_NOFOLLOW, don't follow symlinks=
 */
+ };
+=20
+ /*
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index 2359bf781..76685be70 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *=
lc, const char *filename)
+ 	if (!lc)
+ 		return -EINVAL;
+=20
+-	lc->filename =3D canonicalize_path(filename);
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		lc->filename =3D strdup(filename);
++	else
++		lc->filename =3D canonicalize_path(filename);
+ 	if (!lc->filename)
+ 		return -errno;
+=20
+@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+=20
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |=3D O_DIRECT;
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		flags |=3D O_NOFOLLOW;
+=20
+ 	if ((file_fd =3D open(lc->filename, mode | flags)) < 0) {
+ 		if (mode !=3D O_RDONLY && (errno =3D=3D EROFS || errno =3D=3D EACCES)=
)
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 444d69d6f..34351116c 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
+ 	}
+=20
+ 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
+-	rc =3D loopcxt_init(&lc, 0);
++	rc =3D loopcxt_init(&lc,
++			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
+ 	if (rc)
+ 		goto done_no_deinit;
+ 	if (mnt_opt_has_value(loopopt)) {
+--=20
+2.43.0
+
--=20
2.43.0


