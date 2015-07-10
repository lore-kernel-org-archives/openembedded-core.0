Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D27D75CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:14:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7Ex5Q019101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:14:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:14:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:47 -0700
Message-ID: <383b3ca35ff1333a7b750d3a95b17052239ed2a1.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] elfutils 0.163: remove do_configure_prepend
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

It is derived from elfutils 0.148, but 0.162 doesn't need them, it
doesn't need i386_dis.h or x86_64_dis.h either, there are the same two
files in the source, so move elfutils/i386_dis.h to
elfutils-0.148/i386_dis.h and elfutils/x86_64_dis.h to
elfutils-0.148/x86_64_dis.h for elfutils 0.148 only.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{elfutils => elfutils-0.148}/i386_dis.h        |    0
 .../{elfutils => elfutils-0.148}/x86_64_dis.h      |    0
 meta/recipes-devtools/elfutils/elfutils_0.163.bb   |   10 ----------
 3 files changed, 10 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/i386_dis.h (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/x86_64_dis.h (100%)

diff --git a/meta/recipes-devtools/elfutils/elfutils/i386_dis.h b/meta/recipes-devtools/elfutils/elfutils-0.148/i386_dis.h
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/i386_dis.h
rename to meta/recipes-devtools/elfutils/elfutils-0.148/i386_dis.h
diff --git a/meta/recipes-devtools/elfutils/elfutils/x86_64_dis.h b/meta/recipes-devtools/elfutils/elfutils-0.148/x86_64_dis.h
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/x86_64_dis.h
rename to meta/recipes-devtools/elfutils/elfutils-0.148/x86_64_dis.h
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
index b34bfdd..c4fdabd 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
@@ -42,22 +42,12 @@ SRC_URI_append_libc-uclibc = " file://uclibc-support-for-elfutils-0.161.patch"
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
 # along with the do_configure_prepend()
 
-SRC_URI += "\
-        file://i386_dis.h \
-        file://x86_64_dis.h \
-"
 inherit autotools gettext
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
 EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
-do_configure_prepend() {
-	sed -i '/^i386_dis.h:/,+4 {/.*/d}' ${S}/libcpu/Makefile.am
-
-	cp ${WORKDIR}/*dis.h ${S}/libcpu
-}
-
 do_install_append() {
 	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
 		rm ${D}${bindir}/eu-objdump
-- 
1.7.9.5


