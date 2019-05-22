Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9187C132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:18:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458LVc4rpsz9W
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 20:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558549128;
	bh=Sfa1aZvWZpk5iWK9Terd9f4x/kjarIGnNyExeWdJ1Qk=;
	h=From:To:Subject:Date:From;
	b=Z6d47JgQ9Uh/ljZZZKNRkidHF2Nx4V6IDfUqt7mwkO2vQrRLA86oDr6xqkm/3JXTM
	YUTvbSZHhY2eXMnEMqmW0phgn6W56APPWCDHMd8JjR8VX30QQ+4DJlTPPfDF+9OZ8P
	gsT0TKOYCXeT48P46h8rRYPxAu5OMSbSX/F/cbwwRFBFaaKnrXjpaipshQpgONI27E
	x5JHXabTGn6g50bEF7XiRsVprCDP+AEqXsg9DqpiiBsg45CiVlvgFC5Tl8w6Z1QO7D
	movrAo7s45gvRc+tdkYURB8EHkCKHxKe3+RyujpZTDQRylnQIVkVWTnny4eHriiqWa
	r8afYSyMyYpgoRwlLc8mNXTkAhTNol5VAsv+Sh/NHciQ+vrSNtvToL4APHYE/h/JSa
	YpqYmctQcWuAxXd4xKRfQYSqnMR/XSc4QHQAuCKbmSQRPFk/uUusU+VEJDfc7qnrzW
	Lq8VgxgO0hTK3yX9+wGJeXA0huf8QhE+GIB56LCT5weSBKZrjwso50G8fuEvxhcOqU
	6S5gGWbDc4GwWgUGTdQkWqcJtqraIBSfTKMrZ2UaeexxSSjfPNumP2E9mSw3HcD9Od
	iksXSZXk35i2MT+1nf46CTK0pYUhTPrxHwXAurg4vzV9ECWMdoJ1XSF5Gu2EuLhSHA
	x/KuRyg1vC1B/bHHU0w7IafM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 21:18:47 +0300
Message-Id: <20190522181847.5131-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] m4/tar: Remove remove-gets.patch
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
X-List-Received-Date: Wed, 22 May 2019 18:18:49 -0000

When the original problem was fixed in gnulib the
patches were rebased on top of the upstream fix...

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc        |  1 -
 meta/recipes-devtools/m4/m4/remove-gets.patch | 24 ---------------
 .../tar/tar/remove-gets.patch                 | 29 -------------------
 meta/recipes-extended/tar/tar_1.32.bb         |  1 -
 4 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
 delete mode 100644 meta/recipes-extended/tar/tar/remove-gets.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index 81ed65edd9..a9b63c1bf6 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -8,7 +8,6 @@ inherit autotools texinfo ptest
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
-           file://remove-gets.patch \
            file://m4-1.4.18-glibc-change-work-around.patch \
            "
 SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
diff --git a/meta/recipes-devtools/m4/m4/remove-gets.patch b/meta/recipes-devtools/m4/m4/remove-gets.patch
deleted file mode 100644
index abe82f3b2d..0000000000
--- a/meta/recipes-devtools/m4/m4/remove-gets.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-eglibc has remove gets starting 2.16
-therefore check for its being there before 
-undefining it.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-diff --git a/lib/stdio.in.h b/lib/stdio.in.h
-index 5727452..f04a691 100644
---- a/lib/stdio.in.h
-+++ b/lib/stdio.in.h
-@@ -742,10 +742,12 @@ _GL_WARN_ON_USE (getline, "getline is unportable - "
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning; besides, C11
-    removed it.  */
-+#if defined gets
- #undef gets
- #if HAVE_RAW_DECL_GETS && !defined __cplusplus
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
- #endif
-+#endif
- 
- #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
- struct obstack;
diff --git a/meta/recipes-extended/tar/tar/remove-gets.patch b/meta/recipes-extended/tar/tar/remove-gets.patch
deleted file mode 100644
index f24de926a3..0000000000
--- a/meta/recipes-extended/tar/tar/remove-gets.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gnu/stdio.in.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gnu/stdio.in.h b/gnu/stdio.in.h
-index ec43874..502e3ae 100644
---- a/gnu/stdio.in.h
-+++ b/gnu/stdio.in.h
-@@ -722,10 +722,12 @@ _GL_WARN_ON_USE (getline, "getline is unportable - "
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning; besides, C11
-    removed it.  */
-+#if defined gets
- #undef gets
- #if HAVE_RAW_DECL_GETS && !defined __cplusplus
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
- #endif
-+#endif
- 
- #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
- struct obstack;
--- 
-2.8.3
-
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 7240fdb7e1..18f09b5711 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -7,7 +7,6 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
-           file://remove-gets.patch \
            file://musl_dirent.patch \
 "
 
-- 
2.17.1


