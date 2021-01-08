Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.26.1610114806970092419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6440211FB
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106AB3F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:47 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 7/7] ports/linux/xattr: add arm64 versions for xattr calls
Date: Fri,  8 Jan 2021 14:06:40 +0000
Message-Id: <20210108140640.1069133-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108140640.1069133-1-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The xattr functions need to use a specific version of the symbols to avoi=
d
calling into libattr.so, which on Tumbleweed causes failures[1].

However on arm64 systems the glibc version is different. This means that
searching for llistattr(GLIBC_2.3) fails to initially match the symbol in
libc.so, and instead if libattr.so is linked then the symbol in that libr=
ary
is used.  This is simply a wrapper that is intended to call the symbol in
libc.so but instead calls the symbol in pseudo, so infinite loops.

Using the just-added architecture overrides, add the right versions for
arm64 systems so the correct symbols in libc.so are found.

[ YOCTO #14133 ]

[1] b94fa2fc81cde25865ee223ca437d07377229a53

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ports/linux/xattr/wrapfuncs.in | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/ports/linux/xattr/wrapfuncs.in b/ports/linux/xattr/wrapfuncs=
.in
index b8e007d..09eba23 100644
--- a/ports/linux/xattr/wrapfuncs.in
+++ b/ports/linux/xattr/wrapfuncs.in
@@ -1,12 +1,12 @@
-ssize_t getxattr(const char *path, const char *name, void *value, size_t=
 size); /* flags=3D0, version=3D"GLIBC_2.3" */=20
-ssize_t lgetxattr(const char *path, const char *name, void *value, size_=
t size); /* flags=3DAT_SYMLINK_NOFOLLOW, version=3D"GLIBC_2.3" */
-ssize_t fgetxattr(int filedes, const char *name, void *value, size_t siz=
e); /* version=3D"GLIBC_2.3" */
-int setxattr(const char *path, const char *name, const void *value, size=
_t size, int xflags); /* flags=3D0, version=3D"GLIBC_2.3" */
-int lsetxattr(const char *path, const char *name, const void *value, siz=
e_t size, int xflags); /* flags=3DAT_SYMLINK_NOFOLLOW, version=3D"GLIBC_2=
.3" */
-int fsetxattr(int filedes, const char *name, const void *value, size_t s=
ize, int xflags); /* version=3D"GLIBC_2.3" */
-ssize_t listxattr(const char *path, char *list, size_t size); /* flags=3D=
0, version=3D"GLIBC_2.3" */
-ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=3D=
AT_SYMLINK_NOFOLLOW, version=3D"GLIBC_2.3" */
-ssize_t flistxattr(int filedes, char *list, size_t size); /* version=3D"=
GLIBC_2.3" */
-int removexattr(const char *path, const char *name); /* flags=3D0, versi=
on=3D"GLIBC_2.3" */
-int lremovexattr(const char *path, const char *name); /* flags=3DAT_SYML=
INK_NOFOLLOW, version=3D"GLIBC_2.3" */
-int fremovexattr(int filedes, const char *name); /* version=3D"GLIBC_2.3=
" */
+ssize_t getxattr(const char *path, const char *name, void *value, size_t=
 size); /* flags=3D0, version=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.1=
7" */
+ssize_t lgetxattr(const char *path, const char *name, void *value, size_=
t size); /* flags=3DAT_SYMLINK_NOFOLLOW, version=3D"GLIBC_2.3", version-a=
arch64=3D"GLIBC_2.17" */
+ssize_t fgetxattr(int filedes, const char *name, void *value, size_t siz=
e); /* version=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.17" */
+int setxattr(const char *path, const char *name, const void *value, size=
_t size, int xflags); /* flags=3D0, version=3D"GLIBC_2.3", version-aarch6=
4=3D"GLIBC_2.17" */
+int lsetxattr(const char *path, const char *name, const void *value, siz=
e_t size, int xflags); /* flags=3DAT_SYMLINK_NOFOLLOW, version=3D"GLIBC_2=
.3", version-aarch64=3D"GLIBC_2.17" */
+int fsetxattr(int filedes, const char *name, const void *value, size_t s=
ize, int xflags); /* version=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.17=
" */
+ssize_t listxattr(const char *path, char *list, size_t size); /* flags=3D=
0, version=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.17" */
+ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=3D=
AT_SYMLINK_NOFOLLOW, version=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.17=
" */
+ssize_t flistxattr(int filedes, char *list, size_t size); /* version=3D"=
GLIBC_2.3", version-aarch64=3D"GLIBC_2.17" */
+int removexattr(const char *path, const char *name); /* flags=3D0, versi=
on=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.17" */
+int lremovexattr(const char *path, const char *name); /* flags=3DAT_SYML=
INK_NOFOLLOW, version=3D"GLIBC_2.3", version-aarch64=3D"GLIBC_2.17" */
+int fremovexattr(int filedes, const char *name); /* version=3D"GLIBC_2.3=
", version-aarch64=3D"GLIBC_2.17" */
--=20
2.25.1

