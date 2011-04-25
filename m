Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyo-0003op-FR
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:56 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1388561pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ESPVsiV9Q21ptSWeysvjuQ1dP+5mbxoFBr94d0Y7d9g=;
	b=Fm5/VKoS3bo6aGtPjzN2Z9jOC2MgPDTTG7LHiqlbCg5f4RTP+xGb1MZc6BYbI/1rdN
	9xSmSWSwz/wzr5TIpV3pJ53H8hpgzReTdgkY47H2M74HBHm/ZCC617p8eXWSzQJc/tJE
	Oyv7fL9innR4YgkAKA3hSQCL1FMDC/+ZRVtQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZGkT4A1e8YLfbwGRz/4iWfX6Zow4WiG5u6VNNt9NqawDeDkLdqcNITAd68vxh+o2xf
	uic/o5Tgbd3Ojjla0jsqvJ6NPKeBrVyBfPbdNyK+FddZd1I9Ry00VNwODLZg7BIycZSo
	VX4NB5CXrpu6CbiY7ULXlpug90JTR+spY7lNE=
Received: by 10.143.87.1 with SMTP id p1mr2634860wfl.271.1303757726236;
	Mon, 25 Apr 2011 11:55:26 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k7sm4608804wfa.2.2011.04.25.11.55.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:21 -0700
Message-Id: <0b3020f4f678ce33d421c608b694b9d0f8c5a5c0.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 12/17] elfutils_0.148.bb: Fix compilation issues on uclibc
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:56 -0000

* Add -luargp and -lintl to linker flags
* __mempcpy is not there on uclibc so define it to mempcpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils-0.148/mempcpy.patch          |   23 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    6 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
new file mode 100644
index 0000000..e1e4ad0
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
@@ -0,0 +1,23 @@
+uclibc does not export __mempcpy like glibc so we alias it here.
+This patch may make sense for upstream but elfutils uses more
+glibc specific features like obstack_printf which are missing in
+uclibc they need to be fixed along to make it work all the way
+
+Upstream-status: Inappropriate[Elfutils uses more glibc specific features]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: elfutils-0.148/libelf/elf_begin.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_begin.c
++++ elfutils-0.148/libelf/elf_begin.c
+@@ -68,6 +68,9 @@
+ #include "libelfP.h"
+ #include "common.h"
+ 
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
+ 
+ /* Create descriptor for archive in memory.  */
+ static inline Elf *
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index a55b98d..df933f6 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -28,8 +28,8 @@ SRC_URI += "\
         file://elf_additions.diff \
 	file://elfutils-fsize.patch \
 	file://remove-unused.patch \
+	file://mempcpy.patch \
 "
-
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
 # along with the do_configure_prepend()
@@ -38,7 +38,6 @@ SRC_URI += "\
         file://i386_dis.h \
         file://x86_64_dis.h \
 "
-
 inherit autotools
 
 EXTRA_OECONF = "--program-prefix=eu-"
@@ -49,6 +48,9 @@ do_configure_prepend() {
 	cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
 
+# Only append ldflags for target recipe
+TARGET_LDFLAGS_libc-uclibc += "${@['', '-lintl -luargp']['${PN}' == '${BPN}']}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-- 
1.7.4.1



