Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4yrK-0002yJ-EA
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:43:54 +0200
Received: from mail264-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Aug 2012 18:16:42 +0000
Received: from mail264-tx2 (localhost [127.0.0.1])	by
	mail264-tx2-R.bigfish.com (Postfix) with ESMTP id 2C88748E01ED	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 18:16:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail264-tx2 (localhost.localdomain [127.0.0.1]) by mail264-tx2
	(MessageSwitch) id 1345832199815559_12518;
	Fri, 24 Aug 2012 18:16:39 +0000 (UTC)
Received: from TX2EHSMHS026.bigfish.com (unknown [10.9.14.250])	by
	mail264-tx2.bigfish.com (Postfix) with ESMTP id BAE536860044	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 18:16:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS026.bigfish.com
	(10.9.99.126) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Aug 2012 18:16:39 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Fri, 24 Aug 2012 13:16:38 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7OIGcv2006904 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:16:38 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 13:16:37 -0500
Message-ID: <1345832197-3648-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 18:43:54 -0000
Content-Type: text/plain

kmod will fail to build with the following error because O_CLOEXEC is
not defined:

| libkmod/libkmod-module.c: In function 'kmod_module_get_initstate':
| libkmod/libkmod-module.c:1640: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-module.c:1640: error: (Each undeclared identifier is reported only once
| libkmod/libkmod-module.c:1640: error: for each function it appears in.)
| libkmod/libkmod-module.c: In function 'kmod_module_get_refcnt':
| libkmod/libkmod-module.c:1754: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-module.c: In function 'kmod_module_get_sections':
| libkmod/libkmod-module.c:1913: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-file.c: In function 'kmod_file_open':
| libkmod/libkmod-file.c:282: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-file.c:282: error: (Each undeclared identifier is reported only once
| libkmod/libkmod-file.c:282: error: for each function it appears in.)

Since we are only using kmod-native for depmod, and it's a non-threaded
user of this libary being built this should be safe to override O_CLOEXEC.

Keep in mind this is ONLY effecting the native builds and not what is
being shipped in the root file system.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: use patch instead of munging CFLAGS

 meta/recipes-kernel/kmod/kmod-native_git.bb        |    3 ++-
 .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        |   17 +++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index 96de8b8..8cbcdf8 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -4,7 +4,8 @@
 require kmod.inc
 inherit native
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+SRC_URI += "file://fix-undefined-O_CLOEXEC.patch"
 
 do_install_append (){
 	for tool in depmod insmod lsmod modinfo modprobe rmmod
diff --git a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
new file mode 100644
index 0000000..3177e9a
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Not applicable
+
+Index: git/libkmod/libkmod-private.h
+===================================================================
+--- git.orig/libkmod/libkmod-private.h
++++ git/libkmod/libkmod-private.h
+@@ -1,6 +1,10 @@
+ #ifndef _LIBKMOD_PRIVATE_H_
+ #define _LIBKMOD_PRIVATE_H_
+ 
++#ifndef O_CLOEXEC
++# define O_CLOEXEC 0
++#endif
++
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <syslog.h>
-- 
1.7.9.7




