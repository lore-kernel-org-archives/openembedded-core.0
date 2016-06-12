Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 188D26FF5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C2KorU002043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:21:05 +0800
Message-ID: <10e55d79ebc6abf9826ec79fd4df6d5e4664f71c.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] tar: upgrade to 1.29
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:50 -0000
Content-Type: text/plain

Refresh remove-gets.patch for the latest version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/tar/tar/remove-gets.patch     | 21 ++++++++++++++-------
 .../tar/{tar_1.28.bb => tar_1.29.bb}                |  4 ++--
 2 files changed, 16 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/tar/{tar_1.28.bb => tar_1.29.bb} (73%)

diff --git a/meta/recipes-extended/tar/tar/remove-gets.patch b/meta/recipes-extended/tar/tar/remove-gets.patch
index 0b8be39..f24de92 100644
--- a/meta/recipes-extended/tar/tar/remove-gets.patch
+++ b/meta/recipes-extended/tar/tar/remove-gets.patch
@@ -3,20 +3,27 @@ ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ re
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: tar-1.27/gnu/stdio.in.h
-===================================================================
---- tar-1.27.orig/gnu/stdio.in.h	2013-06-29 08:54:26.000000000 +0300
-+++ tar-1.27/gnu/stdio.in.h	2013-10-16 15:22:46.977204737 +0300
-@@ -710,10 +710,12 @@
+---
+ gnu/stdio.in.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gnu/stdio.in.h b/gnu/stdio.in.h
+index ec43874..502e3ae 100644
+--- a/gnu/stdio.in.h
++++ b/gnu/stdio.in.h
+@@ -722,10 +722,12 @@ _GL_WARN_ON_USE (getline, "getline is unportable - "
  /* It is very rare that the developer ever has full control of stdin,
     so any use of gets warrants an unconditional warning; besides, C11
     removed it.  */
 +#if defined gets
  #undef gets
- #if HAVE_RAW_DECL_GETS
+ #if HAVE_RAW_DECL_GETS && !defined __cplusplus
  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
  #endif
 +#endif
  
- 
  #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
+ struct obstack;
+-- 
+2.8.3
+
diff --git a/meta/recipes-extended/tar/tar_1.28.bb b/meta/recipes-extended/tar/tar_1.29.bb
similarity index 73%
rename from meta/recipes-extended/tar/tar_1.28.bb
rename to meta/recipes-extended/tar/tar_1.29.bb
index 518e622..efce57d 100644
--- a/meta/recipes-extended/tar/tar_1.28.bb
+++ b/meta/recipes-extended/tar/tar_1.29.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI += "file://remove-gets.patch \
             file://musl_dirent.patch \
            "
-SRC_URI[md5sum] = "8f32b2bc1ed7ddf4cf4e4a39711341b0"
-SRC_URI[sha256sum] = "60e4bfe0602fef34cd908d91cf638e17eeb09394d7b98c2487217dc4d3147562"
+SRC_URI[md5sum] = "955cd533955acb1804b83fd70218da51"
+SRC_URI[sha256sum] = "236b11190c0a3a6885bdb8d61424f2b36a5872869aa3f7f695dea4b4843ae2f2"
 
 do_install_append_libc-musl() {
 	rm -f ${D}${libdir}/charset.alias
-- 
1.9.1


