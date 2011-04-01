Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1G-0004v2-3A
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:34 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=CEpKniEUqhkS2PBn44A4XxvUHxK+qQS+UGmowg6eQYc=;
	b=AIK/SGJjp8uXnCaEFUyKHRxwAv+FQbB80R2pFEOS1IPoCaD6W5bsUxIJdjzF1GvFeI
	+MinqI4sc7v2PTEUV5MQOr8YXvoWDROOnLCM64MX7zh1Mp+98kIXfae/5/iOP0y5Xcnc
	BGretHug0oYP33byFMhFriBIHB550SsuoEJk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=j//Vl+L0KG/omM/r0pqtLIscTGdmx9D090lc/wNC5hkJUyl4fGlE0N92zw4NsvD0L5
	Dyuk9tl1dV4isCtJ17w5q2MyxpKrgHdIU0pmNKluDB5U9sCNpYNkL25GuJakw/yImGFR
	OXsTV1WMNV4GncXeMui92AnlOml8Y9RKkAru4=
Received: by 10.42.220.134 with SMTP id hy6mr528798icb.386.1301632175259;
	Thu, 31 Mar 2011 21:29:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 13sm1182426ibo.25.2011.03.31.21.29.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:26 -0700
Message-Id: <d6269e02c09499e0d603777a2315ff3600bc2489.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 24/46] elfutils_0.148.bb: Fix compilation issues on uclibc
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
X-List-Received-Date: Fri, 01 Apr 2011 04:34:22 -0000

* Add -luargp and -lintl to linker flags
* __mempcpy is not there on uclibc so define it to mempcpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils-0.148/mempcpy.patch          |   14 ++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    8 +++++---
 2 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
new file mode 100644
index 0000000..f4af7c4
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
@@ -0,0 +1,14 @@
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
index b2f700e..5ae4501 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -27,8 +27,8 @@ SRC_URI += "\
         file://testsuite-ignore-elflint.diff \
         file://elf_additions.diff \
 	file://elfutils-fsize.patch \
+	file://mempcpy.patch \
 "
-
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
 # along with the do_configure_prepend()
@@ -37,7 +37,6 @@ SRC_URI += "\
         file://i386_dis.h \
         file://x86_64_dis.h \
 "
-
 inherit autotools
 
 EXTRA_OECONF = "--program-prefix=eu-"
@@ -48,6 +47,9 @@ do_configure_prepend() {
 	cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
 
+# Only append ldflags for target recipe
+TARGET_LDFLAGS_libc-uclibc += "${@['', '-lintl -luargp']['${PN}' == '${BPN}']}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-- 
1.7.4.1



