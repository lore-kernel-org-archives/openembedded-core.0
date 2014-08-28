Return-Path: <Muzaffar_Mahmood@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CE28870F06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:17:52 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XMwm8-0004qn-Hz from Muzaffar_Mahmood@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 03:17:52 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 28 Aug 2014 11:17:51 +0100
From: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 15:17:14 +0500
Message-ID: <1409221034-24748-1-git-send-email-muzaffar_mahmood@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
Subject: [PATCH] systemtap: Fixed probe syscall.sendfile failure
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
X-List-Received-Date: Thu, 28 Aug 2014 10:17:52 -0000
Content-Type: text/plain

From: Mikhail Durnev <mikhail_durnev@mentor.com>

Marked __syscall.compat_sendfile as optional

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
---
 .../systemtap/tapset-linux-sendfile-syscall.patch  |   12 ++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch b/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
new file mode 100644
index 0000000..b42ab3c
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
@@ -0,0 +1,12 @@
+diff -Naur old/tapset/linux/syscalls2.stp new/tapset/linux/syscalls2.stp
+--- old/tapset/linux/syscalls2.stp	2014-04-21 01:28:41.000000000 -0500
++++ new/tapset/linux/syscalls2.stp	2014-04-21 01:38:14.961233914 -0500
+@@ -1953,7 +1953,7 @@
+ # COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd,
+ #		compat_loff_t __user *, offset, compat_size_t, count)
+ #
+-probe syscall.sendfile = __syscall.sendfile, __syscall.compat_sendfile
++probe syscall.sendfile = __syscall.sendfile, __syscall.compat_sendfile ?
+ {
+ 	name = "sendfile"
+ 	out_fd = __int32($out_fd)
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 717d66f..3e1e80a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -6,6 +6,7 @@ PV = "2.5+git${SRCPV}"
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://docproc-build-fix.patch \
            file://obsolete_automake_macros.patch \
+           file://tapset-linux-sendfile-syscall.patch \
           "
 
 # systemtap doesn't support mips
-- 
1.7.9.5


