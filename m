Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RgOMJ-000279-8t
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 23:21:59 +0100
Received: by yenm12 with SMTP id m12so7205448yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yrKaa+GVtkrrjgne6jFI9fZ8IaXtjEJ4ND5/QMzb3oU=;
	b=Q+v1KZg6xHv1z+l4ZiII2sinbgvEH+vPWihPyuHhSPVt45MuGYjnhiDW16vOYkG1vB
	sW3uhrxm4FiHS+1171tgANrK/cJS9fKW25IWy4XEbLkaiAFppAgIgYXcAv6VqH5xHiJ4
	00zOAEs3/kyNyhhpa5cpXyAR3/xGPQOIacEw8=
Received: by 10.236.190.137 with SMTP id e9mr48867896yhn.36.1325196880321;
	Thu, 29 Dec 2011 14:14:40 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id y58sm51985542yhi.17.2011.12.29.14.14.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 14:14:39 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 16:14:39 -0600
Message-Id: <1325196879-11092-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2] elfutils: fix for dso link change in recent ld
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
X-List-Received-Date: Thu, 29 Dec 2011 22:21:59 -0000

From: Christopher Larson <chris_larson@mentor.com>

This patch makes the link to the dependencies of libdw explicit, as recent ld
no longer implicitly links them. See
http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
a similar example of the error message you can encounter without this patch,
and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
details.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../elfutils/elfutils/dso-link-change.patch        |   32 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    5 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
new file mode 100644
index 0000000..d0cd3ed
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+# This patch makes the link to the dependencies of libdw explicit, as recent
+# ld no longer implicitly links them. See
+# http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
+# a similar example of the error message you can encounter without this patch,
+# and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
+# https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
+# details.
+
+--- elfutils-0.148.orig/src/Makefile.am
++++ elfutils-0.148/src/Makefile.am
+@@ -86,7 +86,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
+ libelf = ../libelf/libelf.a
+ else
+ libasm = ../libasm/libasm.so
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ endif
+ libebl = ../libebl/libebl.a
+--- elfutils-0.148.orig/tests/Makefile.am
++++ elfutils-0.148/tests/Makefile.am
+@@ -172,7 +172,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
+ libelf = ../libelf/libelf.a
+ libasm = ../libasm/libasm.a
+ else
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ libasm = ../libasm/libasm.so
+ endif
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 0f4e8ca..710959a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -29,7 +29,8 @@ SRC_URI += "\
 	file://elfutils-fsize.patch \
 	file://remove-unused.patch \
 	file://mempcpy.patch \
-	file://fix_for_gcc-4.7.patch\
+	file://fix_for_gcc-4.7.patch \
+	file://dso-link-change.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " ${@['', 'file://uclibc-support.patch']['${PN}' == '${BPN}']}"
-- 
1.7.8.rc4



