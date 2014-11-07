Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 55EE77067B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2014 16:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989775"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:33 -0800
Message-Id: <562acf0d112ab68bf137c21aa99a2dd1e2fb592b.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 08/19] systemtap: Upgrade to 2.6 Git Version
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Remove backported patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../systemtap/tapset-linux-sendfile-syscall.patch  | 22 ----------------------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  5 ++---
 2 files changed, 2 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch b/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
deleted file mode 100644
index f945760..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-systemtap: Fixed probe syscall.sendfile failure
-
-compat_sendfile syscall is unavailable in kernels starting version 3.8.
-Hence systemtap scripts like 'probe syscall.* { if (target()==pid()) log(name." ".argstr) }' fail.
-This problem is solved by marking __syscall.compat_sendfile as optional in tapset/linux/syscalls2.stp
-
-Upstream-Status: Pending
-
-Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
-
-diff -Naur old/tapset/linux/syscalls2.stp new/tapset/linux/syscalls2.stp
---- old/tapset/linux/syscalls2.stp	2014-04-21 01:28:41.000000000 -0500
-+++ new/tapset/linux/syscalls2.stp	2014-04-21 01:38:14.961233914 -0500
-@@ -1953,7 +1953,7 @@
- # COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd,
- #		compat_loff_t __user *, offset, compat_size_t, count)
- #
--probe syscall.sendfile = __syscall.sendfile, __syscall.compat_sendfile
-+probe syscall.sendfile = __syscall.sendfile, __syscall.compat_sendfile ?
- {
- 	name = "sendfile"
- 	out_fd = __int32($out_fd)
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index f81e8ba..f9a19d9 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,12 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "8f0fcd995f7f650a2ee0a94539f90c99e6d19e1d"
-PV = "2.5+git${SRCPV}"
+SRCREV = "7682e51d2e11a35b2977ba9a85ab42f326b8ff8f"
+PV = "2.6+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://docproc-build-fix.patch \
            file://obsolete_automake_macros.patch \
            file://system_map_location.patch \
-           file://tapset-linux-sendfile-syscall.patch \
            file://configure-allow-to-disable-libvirt.patch \
           "
 
-- 
1.8.3.1


