Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8383C77D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UFRgFw010213; 
	Thu, 30 Mar 2017 16:27:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eKzw_LRXWS9R; Thu, 30 Mar 2017 16:27:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UFRe4F010205
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 16:27:41 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctbzA-00075H-9y; Thu, 30 Mar 2017 16:27:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 16:27:37 +0100
Message-Id: <1490887659-27179-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] glibc-package: Allow 32 and 64 bit headers to exist on arm
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
X-List-Received-Date: Thu, 30 Mar 2017 15:27:45 -0000

With this change (combined with the previous linux-libc-header fix), a
combined sysroot for 32 and 64 bit arm works meaning our SDK works
correctly for that multilib setup.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 6e548cb..2ca5666 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -140,8 +140,25 @@ do_install_append_aarch64 () {
 				${D}/lib/ld-linux-aarch64_be.so.1
 		fi
 	fi
+	do_install_armmultilib
 }
 
+do_install_append_arm () {
+	do_install_armmultilib
+}
+
+do_install_armmultilib () {
+
+	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
+	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
+	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/string.h bits/typesizes.h
+
+	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
+
+	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
+}
+
+
 LOCALESTASH = "${WORKDIR}/stashed-locale"
 bashscripts = "mtrace sotruss xtrace"
 
-- 
2.7.4


