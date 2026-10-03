Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1437CA5FE4
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 19:49:57 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11927.1791056995356202106
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 12:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=L7yItRGH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026100319495323030e8ef400020726-quygae@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026100319495323030e8ef400020726
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 21:49:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=klB4iq83/03Lo9SWw/iBQUtFCG4lsCj+xvN6BX+tLqg=;
 b=L7yItRGHzRiC1NQ3QEZXHmK1dWTbB4BCldULQEDL2bGwoRDh2q+/RlheWN4wkl+L1m31K2
 ZtmqIQWLPthoWFkJOoW6aT40SiYjYVAcUgBGJDVe/DT5AxU6VKVF3nKRYuBUhGQwDGmucl0p
 ZxloBhlcSaOST9Sh4Nt0donlY9EL5mRXAvXa6hX6I4Z3BwqM42j8koCVTiceTvzY79z8Dm3D
 EVv4fQnwQk6/8Q0PP1sjtSOUtFw/Jgy56EVhRBxUOgy5MxJ+4AsZpQ20CbexQqL6ck9w9rk0
 Ugbhjq0ogT/+5V5PBs5PVpRdo+ebBRyFXa0/d2pWBuKDMsbxAEdnCoCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] util-linux(-uuid): upgrade 2.41.5 -> 2.41.6
Date: Sat,  3 Oct 2026 21:49:36 +0200
Message-ID: <20261003194936.1818610-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 19:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247174

From: Peter Marko <peter.marko@siemens.com>

Backported two patches from v2.41 to fix builds.
Also backported patch to fix regression of CVE-2026-78408 fix.

Release notes [1]:

Security fixes:

 CVE-2026-76642 - mount(8) post-mount hooks execute after helper failure.
   When an external mount.<type> helper exits nonzero, post-mount hooks
   (X-mount.idmap, X-mount.owner/group/mode) still execute as if the
   mount had succeeded, allowing privileged operations on the
   pre-existing target filesystem.

 CVE-2026-78410 - mount(8) TOCTOU race on source path.
   In restricted (SUID, non-root) mode, the source path is
   canonicalized with realpath() as euid=0, following symlinks through
   user-writable directories.  Additionally, open_tree() follows
   symlinks in intermediate path components.  A local attacker can
   redirect a privileged mount or post-mount ownership change to an
   arbitrary path.

 CVE-2026-78408 - nsenter(1), unshare(1) file descriptor leak.
   File descriptors in nsenter and unshare were not created with
   O_CLOEXEC, potentially leaking them across exec.  Added O_CLOEXEC
   as defense in depth.

 wall(1), write(1) - hostname escape sequence injection.
   The CVE-2024-28085 fix sanitized only message bodies; the banner
   headers still interpolated the system hostname without sanitization.
   An unprivileged user can inject terminal escape sequences via a user
   namespace hostname.
   Additional fix for CVE-2024-28085.
   Reported-by: Skyler Ferrante

Changes between v2.41.5 and v2.41.6:

lib/fileutils:
    - add ul_openat_resolve() openat2 wrapper (by Karel Zak)

libmount:
    - skip post-mount hooks after failed mount helper [CVE-2026-76642] (by Karel Zak)
    - pin source path with openat2() for restricted users [CVE-2026-78410] (by Karel Zak)
    - restrict source path canonicalization for non-root users [CVE-2026-78410] (by Karel Zak)
    - add mnt_open_tree() helper for safe tree opening (by Karel Zak)

loopdev:
    - use openat2(RESOLVE_NO_SYMLINKS) for backing file (by Karel Zak)

nsenter, unshare:
    - add O_CLOEXEC to all open() calls [CVE-2026-78408] (by Karel Zak)

tests:
    - (lsfd) add a function checking the availability of UDPLite socket (by Masatake YAMATO)
    - (lsfd/option-inet) make UDPLite related test case skippable (by Masatake YAMATO)
    - (lsfd/mkfds-udp*) make UDPLite related test cases skippable (by Masatake YAMATO)

wall, write:
    - sanitize hostname in banner header (by Karel Zak)

[1] https://github.com/util-linux/util-linux/blob/v2.41.6/Documentation/releases/v2.41.6-ReleaseNotes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...2.41.5.bb => util-linux-libuuid_2.41.6.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   5 +-
 ...sing-fileutils.h-include-to-hook_idm.patch |  38 ++++++
 ..._LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-.patch | 114 ++++++++++++++++++
 .../util-linux/CVE-2026-78408.patch           |  75 ++++++++++++
 ...l-linux_2.41.5.bb => util-linux_2.41.6.bb} |   0
 6 files changed, 231 insertions(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.5.bb => util-linux-libuuid_2.41.6.bb} (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idm.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.5.bb => util-linux_2.41.6.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.6.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.6.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index be49160eac..fc7722f267 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,9 +21,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
            file://CVE-2026-3184.patch \
+           file://0001-libmount-add-missing-fileutils.h-include-to-hook_idm.patch \
+           file://CVE-2026-78408.patch \
+           file://0001-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-.patch \
            "
 
-SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
+SRC_URI[sha256sum] = "e596083744e746be7d2823b62b43f4418dd7bf56303b4dc09e6fe8112fe3d7ed"
 
 CVE_PRODUCT = "util-linux"
 
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idm.patch b/meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idm.patch
new file mode 100644
index 0000000000..2beb9963c8
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idm.patch
@@ -0,0 +1,38 @@
+From 79c2881c27a0b40889cd5433d9f125689826d1d2 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 2 Sep 2026 13:32:27 +0200
+Subject: [PATCH] libmount: add missing fileutils.h include to hook_idmap.c
+
+The hook_idmap.c uses RESOLVE_NO_SYMLINKS (added by commit fb8e26535)
+but does not include fileutils.h, which provides the fallback #define
+for this constant.
+
+On Fedora (glibc 2.40+), this is masked because glibc's
+<bits/fcntl-linux.h> transitively includes <linux/openat2.h>, which
+defines RESOLVE_NO_SYMLINKS. On Ubuntu (and other distros with older
+glibc), <fcntl.h> does not pull in openat2.h, so the build fails:
+
+  hook_idmap.c:335:33: error: 'RESOLVE_NO_SYMLINKS' undeclared
+
+Fixes: fb8e26535 ("libmount: pin source path with openat2() for restricted users")
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 7e2e010874b10b3aabdc3c4c844c9ffc46a4a374)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/79c2881c27a0b40889cd5433d9f125689826d1d2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_idmap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
+index 97d8e0d1e..d4d7fbacc 100644
+--- a/libmount/src/hook_idmap.c
++++ b/libmount/src/hook_idmap.c
+@@ -23,6 +23,7 @@
+ 
+ #include "strutils.h"
+ #include "all-io.h"
++#include "fileutils.h"
+ #include "namespace.h"
+ 
+ #include "mountP.h"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-.patch b/meta/recipes-core/util-linux/util-linux/0001-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-.patch
new file mode 100644
index 0000000000..bff963a010
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-.patch
@@ -0,0 +1,114 @@
+From 233cf7321e9d0fd2cea901d0a97e565c725640ad Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 10:01:29 +0200
+Subject: [PATCH] libmount: use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap hook
+
+The idmap hookset was originally guarded by HAVE_MOUNTFD_API (kernel
+headers have the new mount syscalls) rather than
+USE_LIBMOUNT_MOUNTFD_SUPPORT (libmount is built with mountfd support).
+
+This was intentional (commit 9040c0900, 2022) -- the idea was to keep
+idmap working even with --disable-libmount-mountfd-support by calling
+the raw open_tree() syscall directly, while using an inner #ifdef
+USE_LIBMOUNT_MOUNTFD_SUPPORT to optionally reuse the sysapi fd_tree.
+
+This fine-grained approach broke when the CVE-2026-78410 fix replaced
+the raw open_tree() call with mnt_open_tree(), which is only available
+under USE_LIBMOUNT_MOUNTFD_SUPPORT. The build fails with
+--disable-libmount-mountfd-support because mnt_open_tree() is
+undeclared.
+
+Rather than maintaining two code paths for a feature that fundamentally
+depends on the new mount API, gate the entire idmap hookset on
+USE_LIBMOUNT_MOUNTFD_SUPPORT -- consistent with how hookset_mount is
+guarded. Remove the now-redundant inner #ifdef.
+
+Also add a note to mount.8 that X-mount.idmap requires the new
+fd-based mount API.
+
+Addresses: https://github.com/util-linux/util-linux/issues/4598
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e06799ac325a881a297d2ffd6fe568cacdcd00ab)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/233cf7321e9d0fd2cea901d0a97e565c725640ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_idmap.c | 6 ++----
+ libmount/src/hooks.c      | 2 +-
+ libmount/src/version.c    | 2 +-
+ sys-utils/mount.8.adoc    | 1 +
+ 4 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
+index d4d7fbacc..94c025097 100644
+--- a/libmount/src/hook_idmap.c
++++ b/libmount/src/hook_idmap.c
+@@ -32,7 +32,7 @@
+ # include <linux/nsfs.h>
+ #endif
+ 
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 
+ typedef enum idmap_type_t {
+ 	ID_TYPE_UID,	/* uidmap entry */
+@@ -317,7 +317,6 @@ static int hook_mount_post(
+ 	 * Once a mount has been attached to the filesystem it can't be
+ 	 * idmapped anymore. So create a new detached mount.
+ 	 */
+-#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	{
+ 		struct libmnt_sysapi *api = mnt_context_get_sysapi(cxt);
+ 
+@@ -327,7 +326,6 @@ static int hook_mount_post(
+ 			DBG(HOOK, ul_debugobj(hs, " reuse tree FD"));
+ 		}
+ 	}
+-#endif
+ 	if (fd_tree < 0)
+ 		fd_tree = mnt_open_tree(AT_FDCWD, target,
+ 			    OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC |
+@@ -544,4 +542,4 @@ const struct libmnt_hookset hookset_idmap =
+ 	.deinit = hookset_deinit
+ };
+ 
+-#endif /* HAVE_MOUNTFD_API && HAVE_LINUX_MOUNT_H */
++#endif /* USE_LIBMOUNT_MOUNTFD_SUPPORT */
+diff --git a/libmount/src/hooks.c b/libmount/src/hooks.c
+index 23eca4efd..5ae91edd7 100644
+--- a/libmount/src/hooks.c
++++ b/libmount/src/hooks.c
+@@ -45,7 +45,7 @@ static const struct libmnt_hookset *const hooksets[] =
+ 	&hookset_mount,
+ #endif
+ 	&hookset_mount_legacy,
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	&hookset_idmap,
+ #endif
+ 	&hookset_owner
+diff --git a/libmount/src/version.c b/libmount/src/version.c
+index 3b61618b5..5c70ebf8a 100644
+--- a/libmount/src/version.c
++++ b/libmount/src/version.c
+@@ -37,7 +37,7 @@ static const char *lib_features[] = {
+ #ifdef USE_LIBMOUNT_SUPPORT_NAMESPACES
+ 	"namespaces",
+ #endif
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	"idmapping",
+ #endif
+ #ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
+index add2914ae..4bc1bb0f9 100644
+--- a/sys-utils/mount.8.adoc
++++ b/sys-utils/mount.8.adoc
+@@ -790,6 +790,7 @@ Set _mountpoint_'s mode after mounting.
+ 
+ *X-mount.idmap*=__id-type__:__id-mount__:__id-host__:__id-range__ [__id-type__:__id-mount__:__id-host__:__id-range__], *X-mount.idmap*=__file__::
+ Use this option to create an idmapped mount.
++This feature requires the new file-descriptor-based mount API (available since Linux 5.2).
+ An idmapped mount allows to change ownership of all files located under a mount according to the ID-mapping associated with a user namespace.
+ The ownership change is tied to the lifetime and localized to the relevant mount.
+ The relevant ID-mapping can be specified in two ways:
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
new file mode 100644
index 0000000000..676e4a6fea
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
@@ -0,0 +1,75 @@
+From 485dbb67f1b6bb18e08b1b77f4aa2373ff3a705b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 12:17:14 +0200
+Subject: [PATCH] nsenter: close cgroup.procs fd after join to prevent
+ authority leak [CVE-2026-78408]
+
+The --join-cgroup option opens the target's cgroup.procs while running
+as root and writes nsenter's own PID to migrate itself. The descriptor
+was left open across subsequent namespace transitions, credential drops
+(setgroups/setgid/setuid) and execve().
+
+The kernel performs cgroup migration permission checks using the
+credentials captured at open time (file->f_cred). An open cgroup.procs
+descriptor therefore carries the opener's migration authority regardless
+of later privilege changes. A program executed inside the target
+namespace inherits root's cgroup migration capability even when running
+as an unprivileged user with no capabilities.
+
+Fix this by:
+
+ - closing the temporary /proc/PID/cgroup fd after reading the path
+ - adding O_CLOEXEC to the cgroup.procs open as defense in depth
+ - closing cgroup_procs_fd immediately after the self-migration write
+ - initializing the temporary cgroup fd to -1 instead of 0 to avoid
+   accidentally closing stdin via open_target_fd()
+
+The descriptor has no legitimate use after the single migration write.
+
+Introduced-by: b40650b71a74 ("nsenter: add option -c to join the cgroup of target process")
+References: b0cf1cf0d255 ("nsenter: close cgroup.procs fd after join to prevent authority leak")
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit afe067c979b9ba2cbe856f7c6411210120ea62aa)
+
+CVE: CVE-2026-78408
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/485dbb67f1b6bb18e08b1b77f4aa2373ff3a705b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sys-utils/nsenter.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/sys-utils/nsenter.c b/sys-utils/nsenter.c
+index 9d9d90a48..99f1da3a0 100644
+--- a/sys-utils/nsenter.c
++++ b/sys-utils/nsenter.c
+@@ -379,7 +379,7 @@ static int get_ns_ino(const char *path, ino_t *ino)
+ static void open_cgroup_procs(void)
+ {
+ 	char *buf = NULL, *path = NULL, *p;
+-	int cgroup_fd = 0;
++	int cgroup_fd = -1;
+ 	char fdpath[PATH_MAX];
+ 
+ 	open_target_fd(&cgroup_fd, "cgroup", optarg);
+@@ -387,6 +387,8 @@ static void open_cgroup_procs(void)
+ 	if (read_all_alloc(cgroup_fd, &buf) < 1)
+ 		err(EXIT_FAILURE, _("failed to get cgroup path"));
+ 
++	close(cgroup_fd);
++
+ 	p = strtok(buf, "\n");
+ 	if (p)
+ 		path = strrchr(p, ':');
+@@ -816,8 +818,11 @@ int main(int argc, char *argv[])
+ 	}
+ 
+ 	// Join into the target cgroup
+-	if (cgroup_procs_fd >= 0)
++	if (cgroup_procs_fd >= 0) {
+ 		join_into_cgroup();
++		close(cgroup_procs_fd);
++		cgroup_procs_fd = -1;
++	}
+ 
+ 	if (uid_gid_fd >= 0) {
+ 		struct stat st;
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.5.bb b/meta/recipes-core/util-linux/util-linux_2.41.6.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.5.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.6.bb

