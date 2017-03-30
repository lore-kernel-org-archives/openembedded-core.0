Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8645977D0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UFRgaU010212; 
	Thu, 30 Mar 2017 16:27:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id STHTF_qIhkvy; Thu, 30 Mar 2017 16:27:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UFRe4p010204
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 16:27:41 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctbzA-00075A-9F; Thu, 30 Mar 2017 16:27:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 16:27:36 +0100
Message-Id: <1490887659-27179-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] linux-libc-headers: Allow arm kernel headers to coexist on 32/64 bit
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
X-List-Received-Date: Thu, 30 Mar 2017 15:27:46 -0000

Its rather sad we need to do this but in order to make combined 32 and 64 bit
SDKs work, we need a common set of headers and this is the delta that
allows things to work. It only applies on arm.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../linux-libc-headers/linux-libc-headers.inc             | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 653a470..bb9a669 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -42,7 +42,7 @@ python __anonymous () {
         d.setVar("HEADER_FETCH_VER", "2.6")
 }
 
-inherit kernel-arch pkgconfig
+inherit kernel-arch pkgconfig multilib_header
 
 KORG_ARCHIVE_COMPRESSION ?= "xz"
 
@@ -68,6 +68,19 @@ do_install() {
 	find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
+do_install_append_aarch64 () {
+        do_install_armmultilib
+}
+
+do_install_append_arm () {
+	do_install_armmultilib
+}
+
+do_install_armmultilib () {
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
+	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
+}
+
 BBCLASSEXTEND = "nativesdk"
 
 #DEPENDS = "cross-linkage"
-- 
2.7.4


