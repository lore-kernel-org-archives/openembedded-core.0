Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.7486.1593486268477607315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z9O2Q0OZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id w2so8448706pgg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CcLF+5358Y8WfvyGgG7KeMcrsGt5r8raK0ZKpztp6kA=;
        b=z9O2Q0OZeQGVYTZt2tFSoOKLJOYaslFz++Ed61ko+I2cbNIUgfdft2hWCH+g02pS2Q
         L/++H+DuXL+bow9ag/qrcBohSnEeGt5BbXdQm1Syf7HittwFAwJd/CxrhUTk8QFQJKBl
         Hzqq17gcsqETVS7nC5yLClhd7m3KfZ94t/eJsKzZTbLGFOKD51xUfIKTHMR/mGs/t8e1
         JW6UQDtpnK8pXhi2TrHd/P6MY9yDB/LvJM8ODPga3+JO3RKasUfjbSniAeBwsYRIFygV
         gAzSorW3VzICsRQkqvGymvPKJIotOc1GQ3rO7iO9qrIwWDxFTgNrQFHTxucJSl2grqms
         rhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CcLF+5358Y8WfvyGgG7KeMcrsGt5r8raK0ZKpztp6kA=;
        b=N+Q3Os6ZZMZ+z45bFteod3EnyXRJ+1NUkN4szSJk/w89W2RpHgWWE1+NNWKW5Op+vp
         yl/oTnjqBsRrPqjbqlH3+WdLwlmh4M9aFDhiyF7naaA3pch1EdQRvTzrM3j6QVkd3+i8
         iIZAzHjlPMd3qnSvzREzTseiUXl9JGFSUesKiAJCvmf81H0mdNzLTwNWBRFMDQoNI7ni
         IdMTfsj9wr7/fZWW6KA/OkaQiwWlU9kirwK0sIzwDYgBZcGAVj78+3r9kyQx5E4G40QA
         NM9grH2oK+OBmHJUnlNNi902RbTt9kkFuWBjzBJjWF4N7SOu9pGDkq5gjdeMf3dd0LIL
         +wBw==
X-Gm-Message-State: AOAM530epgRPxtGeFJGxmNg4FRN71kU3RjLB1owTypl9aisLxCbr064X
	rDIDC47DYiJiwoncE67kDvKtWQJ5twfNQQ==
X-Google-Smtp-Source: ABdhPJyNYkVtsBVFwfctJeovqqVQEZ6Bh5OBpjH1vmgbpBEQ/HJdIIFPD+ROQxYG5V6xejfMOwG8BA==
X-Received: by 2002:a63:778c:: with SMTP id s134mr12578630pgc.273.1593486267510;
        Mon, 29 Jun 2020 20:04:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/22] pseudo: Fix attr errors due to incorrect library resolution issues
Date: Mon, 29 Jun 2020 17:03:06 -1000
Message-Id: <60ae9e6d31dcfc06961fedf7622a204162d3f464.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On a tumbleweed system, "install X Y" was showing the error:

pseudo: ENOSYS for 'fsetxattr'.

which was being caused by dlsym() for that function returning NULL. This
appears to be due to it finding an unresolved symbol in libacl for this
symbol in libattr. It hasn't been resolved so its NULL. dlerror() returns
nothing since this is a valid symbol entry, its just not the one we want.

We can add the glibc version string for the symbol we actually want so we get
that version rather than the libattr/libacl one. The calls in libattr are just
wrappers around the libc version so our attaching to the libc versions should
intercept any accesses via these too.

[YOCTO #13952]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 82655cb26ad01de9587ef41eaef155c61c361f67)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/xattr_version.patch          | 54 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch

diff --git a/meta/recipes-devtools/pseudo/files/xattr_version.patch b/meta/recipes-devtools/pseudo/files/xattr_version.patch
new file mode 100644
index 0000000000..a8b14bdd69
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/xattr_version.patch
@@ -0,0 +1,54 @@
+On a tumbleweed system, "install X Y" was showing the error:
+
+pseudo: ENOSYS for 'fsetxattr'.
+
+which was being caused by dlsym() for that function returning NULL. This
+appears to be due to it finding an unresolved symbol in libacl for this 
+symbol in libattr. It hasn't been resolved so its NULL. dlerror() returns
+nothing since this is a valid symbol entry, its just not the one we want.
+
+We can add the glibc version string for the symbol we actually want so we get
+that version rather than the libattr/libacl one.
+
+To quote libattr:
+"""
+ These dumb wrappers are for backwards compatibility only.
+ Actual syscall wrappers are long gone to libc.
+"""
+and they are simply wrappers around the libc version so our attaching
+to the libc versions should intercept any accesses via these too.
+
+RP 2020/06/22
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+Upstream-Status: Pending [discussed with seebs on irc and appears the correct fix]
+
+
+Index: git/ports/linux/xattr/wrapfuncs.in
+===================================================================
+--- git.orig/ports/linux/xattr/wrapfuncs.in
++++ git/ports/linux/xattr/wrapfuncs.in
+@@ -1,12 +1,12 @@
+-ssize_t getxattr(const char *path, const char *name, void *value, size_t size); /* flags=0 */
+-ssize_t lgetxattr(const char *path, const char *name, void *value, size_t size); /* flags=AT_SYMLINK_NOFOLLOW */
+-ssize_t fgetxattr(int filedes, const char *name, void *value, size_t size);
+-int setxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=0 */
+-int lsetxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=AT_SYMLINK_NOFOLLOW */
+-int fsetxattr(int filedes, const char *name, const void *value, size_t size, int xflags);
+-ssize_t listxattr(const char *path, char *list, size_t size); /* flags=0 */
+-ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=AT_SYMLINK_NOFOLLOW */
+-ssize_t flistxattr(int filedes, char *list, size_t size);
+-int removexattr(const char *path, const char *name); /* flags=0 */
+-int lremovexattr(const char *path, const char *name); /* flags=AT_SYMLINK_NOFOLLOW */
+-int fremovexattr(int filedes, const char *name);
++ssize_t getxattr(const char *path, const char *name, void *value, size_t size); /* flags=0, version="GLIBC_2.3" */ 
++ssize_t lgetxattr(const char *path, const char *name, void *value, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
++ssize_t fgetxattr(int filedes, const char *name, void *value, size_t size); /* version="GLIBC_2.3" */
++int setxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=0, version="GLIBC_2.3" */
++int lsetxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
++int fsetxattr(int filedes, const char *name, const void *value, size_t size, int xflags); /* version="GLIBC_2.3" */
++ssize_t listxattr(const char *path, char *list, size_t size); /* flags=0, version="GLIBC_2.3" */
++ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
++ssize_t flistxattr(int filedes, char *list, size_t size); /* version="GLIBC_2.3" */
++int removexattr(const char *path, const char *name); /* flags=0, version="GLIBC_2.3" */
++int lremovexattr(const char *path, const char *name); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
++int fremovexattr(int filedes, const char *name); /* version="GLIBC_2.3" */
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 324ae9071f..419bac19fe 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://seccomp.patch \
            file://0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch \
            file://0001-pseudo_ipc.h-Fix-enum-typedef.patch \
+           file://xattr_version.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.17.1

