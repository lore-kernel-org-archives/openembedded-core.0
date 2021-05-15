Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4466.1621074784064282485
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 06D6238C136F
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 4.5 FAILED
Message-ID: <MADEUP.167F36EDC7C75D2B.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151835
Content-Type: multipart/mixed; boundary="===============4219666188602416240=="

--===============4219666188602416240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap* to *4.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemtap-upgrade-4.4-4.5.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4219666188602416240==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-4.4-4.5.patch"

From 620811edd2ebacbbcf7cf23188da3bf7de9e2226 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 08:49:49 +0000
Subject: [PATCH] systemtap: upgrade 4.4 -> 4.5

---
 ...t-include-and-callsite-with-same-con.patch | 44 -------------------
 .../recipes-kernel/systemtap/systemtap_git.bb |  6 ++-
 .../systemtap/systemtap_git.inc               |  4 +-
 3 files changed, 7 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch b/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch
deleted file mode 100644
index efc79f6c0f..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From cbf27cd54071f788231e69d96dbaad563f1010d4 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Fri, 18 Dec 2020 13:15:08 -0500
-Subject: [PATCH] transport: protect include and callsite with same conditional
-
-transport.c has the following code block:
-
-  if (!debugfs_p && security_locked_down (LOCKDOWN_DEBUGFS))
-
-Which is protected by the conditional STAPCONF_LOCKDOWN_DEBUGFS.
-
-linux/security.h provides the definition of LOCKDOWN_DEBUGFS, and
-must be included or we have a compilation issue.
-
-The include of security.h is protected by #ifdef CONFIG_SECURITY_LOCKDOWN_LSM,
-which means that in some configurations we can get out of sync with
-the include and the callsite.
-
-If we protect the include and the callsite with the same #ifdef, we can
-be sure that they will be consistent.
-
-Upstream-status: Inappropriate (kernel-devsrc specific)
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- runtime/transport/transport.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/runtime/transport/transport.c b/runtime/transport/transport.c
-index bb4a98bd3..88e20ea28 100644
---- a/runtime/transport/transport.c
-+++ b/runtime/transport/transport.c
-@@ -21,7 +21,7 @@
- #include <linux/namei.h>
- #include <linux/delay.h>
- #include <linux/mutex.h>
--#ifdef CONFIG_SECURITY_LOCKDOWN_LSM
-+#ifdef STAPCONF_LOCKDOWN_DEBUGFS
- #include <linux/security.h>
- #endif
- #include "../uidgid_compatibility.h"
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index c4a6eef59a..1d8f1757a3 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,11 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch"
+SRC_URI += "git://sourceware.org/git/systemtap.git \
+           file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
+           file://0001-Install-python-modules-to-correct-library-dir.patch \
+           file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           "
 
 DEPENDS = "elfutils"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 016b423847..01f7fa7327 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "988f439af39a359b4387963ca4633649866d8275"
-PV = "4.4"
+SRCREV = "0eba8a46bc99c66e5dd274a9a4d661fe08ac4b8a"
+PV = "4.5"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.27.0


--===============4219666188602416240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb: Unable to get checksum for systemtap-uprobes SRC_URI entry 0001-transport-protect-include-and-callsite-with-same-con.patch: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-native_git.bb: Unable to get checksum for nativesdk-systemtap-native SRC_URI entry 0001-transport-protect-include-and-callsite-with-same-con.patch: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-native_git.bb: Unable to get checksum for systemtap-native SRC_URI entry 0001-transport-protect-include-and-callsite-with-same-con.patch: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb: Unable to get checksum for nativesdk-systemtap SRC_URI entry 0001-transport-protect-include-and-callsite-with-same-con.patch: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb: Unable to get checksum for systemtap SRC_URI entry 0001-transport-protect-include-and-callsite-with-same-con.patch: file could not be found
done.
Parsing of 825 .bb files complete (822 cached, 3 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-557c8998a29d3cf5e2216a2e8961557f4528b57c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:557c8998a29d3cf5e2216a2e8961557f4528b57c"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 215 Local 206 Network 0 Missed 9 Current 531 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 743 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1228 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemtap-4.5-r0: task do_fetch: Started
WARNING: systemtap-4.5-r0 do_fetch: Failed to fetch URL file://0001-transport-protect-include-and-callsite-with-same-con.patch, attempting MIRRORS if available
ERROR: systemtap-4.5-r0 do_fetch: Fetcher failure: Unable to find file file://0001-transport-protect-include-and-callsite-with-same-con.patch anywhere. The paths that were searched were:
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.5/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.5/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.5/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.5/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.5/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.5/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/
    /home/pokybuild/yocto-worker/auh/build/build/build/downloads
ERROR: systemtap-4.5-r0 do_fetch: Fetcher failure for URL: 'file://0001-transport-protect-include-and-callsite-with-same-con.patch'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemtap/4.5-r0/temp/log.do_fetch.3032127
NOTE: recipe systemtap-4.5-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb:do_fetch) failed with exit code '1'
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1551 tasks of which 1550 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb:do_fetch
Summary: There were 6 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4219666188602416240==--
