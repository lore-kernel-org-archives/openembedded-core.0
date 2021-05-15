Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4569.1621074783776311507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 02B6338C1378
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-uprobes: upgrading to 4.5 SUCCEEDED
Message-ID: <MADEUP.167F36EDD8539F4E.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151833
Content-Type: multipart/mixed; boundary="===============9055637209712056976=="

--===============9055637209712056976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap-uprobes* to *4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemtap-uprobes-upgrade-4.4-4.5.patch
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

--===============9055637209712056976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/security-band-aids/cve-2011-4127.meta was added
  /usr/share/systemtap/examples/security-band-aids/cve-2011-4127.stp was added
  /usr/share/systemtap/runtime/linux/autoconf-get-kretprobe.c was added
  /usr/share/systemtap/runtime/linux/autoconf-kernel_read-new-args.c was added
  /usr/share/systemtap/runtime/linux/autoconf-lockdown-kernel.c was added
  /usr/share/systemtap/tapset/bpf/uconversions.stp was added
  /usr/share/systemtap/tapset/dyninst/errno.stpm was added
  /usr/share/systemtap/tapset/tls.stp was added
  /usr/share/systemtap/runtime/linux/autoconf-kernel_read_file_from_path-offset.c was removed
  /usr/share/systemtap/tapset/linux/tls.stp was removed

--===============9055637209712056976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 113 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'systemtap-uprobes'
systemtap-uprobes was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============9055637209712056976==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-systemtap-uprobes-upgrade-4.4-4.5.patch"

From 0bf13aaf95490398a8c7526499b6d3b017359136 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 08:48:46 +0000
Subject: [PATCH] systemtap-uprobes: upgrade 4.4 -> 4.5

---
 ...t-include-and-callsite-with-same-con.patch | 44 -------------------
 .../systemtap/systemtap_git.inc               |  5 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
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
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 016b423847..23ecc61987 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,12 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "988f439af39a359b4387963ca4633649866d8275"
-PV = "4.4"
+SRCREV = "0eba8a46bc99c66e5dd274a9a4d661fe08ac4b8a"
+PV = "4.5"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-transport-protect-include-and-callsite-with-same-con.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.27.0


--===============9055637209712056976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemtap: SRC_URI changed from "git://sourceware.org/git/systemtap.git file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://0001-transport-protect-include-and-callsite-with-same-con.patch file://0001-improve-reproducibility-for-c-compiling.patch" to "git://sourceware.org/git/systemtap.git file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://0001-improve-reproducibility-for-c-compiling.patch"
packages/core2-32-poky-linux/systemtap: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap: PKGV changed from 4.4 [default] to 4.5 [default]
Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/security-band-aids/cve-2011-4127.meta was added
  /usr/share/systemtap/examples/security-band-aids/cve-2011-4127.stp was added
  /usr/share/systemtap/runtime/linux/autoconf-get-kretprobe.c was added
  /usr/share/systemtap/runtime/linux/autoconf-kernel_read-new-args.c was added
  /usr/share/systemtap/runtime/linux/autoconf-lockdown-kernel.c was added
  /usr/share/systemtap/tapset/bpf/uconversions.stp was added
  /usr/share/systemtap/tapset/dyninst/errno.stpm was added
  /usr/share/systemtap/tapset/tls.stp was added
  /usr/share/systemtap/runtime/linux/autoconf-kernel_read_file_from_path-offset.c was removed
  /usr/share/systemtap/tapset/linux/tls.stp was removed
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGSIZE changed from 58136620 to 58275208 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-dev: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-doc: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGSIZE changed from 465784 to 466186 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-examples: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGSIZE changed from 1486917 to 1489510 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGSIZE changed from 85339 to 85210 (-0%)
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-python: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-python: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-src: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGSIZE changed from 2867440 to 2878371 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PKGV changed from 4.4 [default] to 4.5 [default]
packages/core2-32-poky-linux/systemtap/systemtap: PV changed from "4.4" to "4.5"
packages/core2-32-poky-linux/systemtap/systemtap: PKGSIZE changed from 8868693 to 8900862 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes: SRC_URI changed from "git://sourceware.org/git/systemtap.git file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://0001-transport-protect-include-and-callsite-with-same-con.patch" to "git://sourceware.org/git/systemtap.git file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch"
packages/qemux86-poky-linux/systemtap-uprobes: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PKGV changed from 4.4 [default] to 4.5 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PV changed from "4.4" to "4.5"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PKGV changed from 4.4 [default] to 4.5 [default]

--===============9055637209712056976==--
