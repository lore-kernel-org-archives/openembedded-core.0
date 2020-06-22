Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.1892.1592846361205732782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QK6T7CjO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q2so15042818wrv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F+hg+FlIrmBypq9kQsHmgnuZ60p0a4N0CFM1QXcpeCY=;
        b=QK6T7CjOWmyx0xFLs5FrGcJx7HOU+75WqEDBbYQr8yIktLctd/YTFYYOTjeAYEaNrr
         aO1oopDn48y4cJDe1fFoWQcHL8xE020KvNgHB02BW+wRi0b3mu5N0gyrtk4mCs1hyJgq
         E3lAMqnms5vdYsLoTOsJTpSOnzn2pygGxrCYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F+hg+FlIrmBypq9kQsHmgnuZ60p0a4N0CFM1QXcpeCY=;
        b=F0ekGaG68yDqk1OSWAm076cIOEeH9nsUVFJHA5Hm9CnI0qIAnGZlLvS6AV/VnurLqx
         jpayypKpnWaaSxWMLvH53GhA1tkq0wGOyjod0e1SqtYcza5pi/JqACdj5ziyuhoENhGG
         KYZcNXMJYs1PcKDyq1GgYl/3/mCsfdPbOGG7xZfA9brW1BAnII5BWvmubu/v1a6CXY7z
         kUEeqU/rTFdauDWxrky6Djo7K3zAa6U8psYoRrIKhi4DhhBeS8KLoi+j3T3ExMxrb/do
         CdmBj9x6FUsvhV9JxKPGzs7a/16OUgDD3YlTMocC5X05cjpJRKPZzSiQAJw7tKkxkjse
         RgPw==
X-Gm-Message-State: AOAM532pFh9pa+V+gBuWeH5ADBCf/nDLAVZbPSpkFSXisbZdhyv/lOCP
	JMCqbNFOzGOVBCX9uffeLXBxfV3ndduDiw==
X-Google-Smtp-Source: ABdhPJzpGseEoLtn2k7XKtU6b+pX4YTW1t1Eccbhxzn6uad5XZv/3TbSvEo6IpPIlxWI2qnePkfj4Q==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr19913517wru.78.1592846358951;
        Mon, 22 Jun 2020 10:19:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y17sm19571024wrd.58.2020.06.22.10.19.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:19:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Fix attr errors due to incorrect library resolution issues
Date: Mon, 22 Jun 2020 18:19:16 +0100
Message-Id: <20200622171916.550378-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 .../pseudo/files/xattr_version.patch          | 54 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch

diff --git a/meta/recipes-devtools/pseudo/files/xattr_version.patch b/meta/recipes-devtools/pseudo/files/xattr_version.patch
new file mode 100644
index 00000000000..a8b14bdd699
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
index 324ae9071fe..419bac19fec 100644
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
2.25.1

