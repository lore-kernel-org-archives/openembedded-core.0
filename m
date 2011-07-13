Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QgqzJ-00050g-GP
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 06:23:53 +0200
Received: by iym10 with SMTP id 10so5392633iym.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=i3tu7eEN5YoGS3n1e1D7AJuOwNImxIhYpcV8OPwpjn4=;
	b=nnph6i2ts36ILsFcgXbmRZgBfISf0bNtAMaBupPb4PwZQAO3xRefFE2PWIUnzQwUuU
	GkLOLOJJmvmaGtaunbwLy9kySZqWuFVGSUp53S8+ov1u8awLwyw2DObCFAeMSc8UOQQt
	hLYW2dx++fdF/eTGtUludUniR2zGFNHAGOrPs=
Received: by 10.231.114.104 with SMTP id d40mr561886ibq.114.1310530794831;
	Tue, 12 Jul 2011 21:19:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id ft12sm8672139ibb.19.2011.07.12.21.19.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 21:19:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 21:19:43 -0700
Message-Id: <1310530784-16538-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] strace: Define own sigmask macro if not defined already in signal.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 04:23:53 -0000

This is required especially on uclibc systems where BSD compatible
obsolete functions are disabled by kconfig. Therefore we check
if the macro is undefined then we define it. Therefore eglibc/glibc
builds should work as they use to.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace-4.5.20/sigmask.patch             |   21 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.5.20.bb      |    6 +++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch

diff --git a/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch b/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
new file mode 100644
index 0000000..f99abe9
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
@@ -0,0 +1,21 @@
+sigmask is a macro which is dropped if BSD compatibility is
+not enabled. So we check if the macro does not exist then
+we define it to __sigmask
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: strace-4.5.20/signal.c
+===================================================================
+--- strace-4.5.20.orig/signal.c	2010-02-23 13:26:16.000000000 -0800
++++ strace-4.5.20/signal.c	2011-07-12 21:08:58.628861476 -0700
+@@ -140,6 +140,10 @@
+ #endif
+ #endif /* LINUX */
+ 
++#ifndef sigmask
++/* Compute mask for signal SIG.  */
++#define sigmask(sig)   __sigmask(sig)
++#endif /* sigmask */
+ const char *const signalent0[] = {
+ #include "signalent.h"
+ };
diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
index 3dba59f..391669f 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
+           file://sigmask.patch \
+          "
 
 SRC_URI[md5sum] = "64dfe10d9db0c1e34030891695ffca4b"
 SRC_URI[sha256sum] = "ea8c059369eaa5ad90b246f34eab247d0ee48bfdee2670c7196320a4669ccabd"
-- 
1.7.5.1



