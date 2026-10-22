Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14971.1792637744205481013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 19:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 22 Oct 2026 11:55:41 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.125 with ESMTP; 22 Oct 2026 11:55:41 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] musl: read ld-musl-$ARCH.path from /etc with usrmerge
Date: Thu, 22 Oct 2026 11:55:21 +0900
Message-ID: <20261022025520.234942-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 02:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248409
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Make the dynamic linker read /etc/ld-musl-$ARCH.path when PT_INTERP
points to /usr/lib.

Non-multilib builds do not notice the problem today. We are working
towards musl with multilib. There a 64-bit program with /usr/lib in
PT_INTERP loads the lib32 copy of a library from /usr/lib and fails
with "Exec format error".

With usrmerge the dynamic linker is /usr/lib/ld-musl-$ARCH.so.1, and
gcc and clang put this path into PT_INTERP. musl drops the last two
components of PT_INTERP and appends /etc/ld-musl-$ARCH.path to the
rest. This gives /usr/etc/ld-musl-$ARCH.path, which does not exist.

ld-musl-$ARCH.path is the musl counterpart of ld.so.conf. It lists the
directories where the dynamic linker looks for shared libraries after
LD_LIBRARY_PATH and RPATH, and when present it replaces the built-in
default path.

The musl recipe installs it in /etc with base_libdir and libdir of the
variant. The file name carries the architecture, so each multilib
variant has its own list, and a 64-bit program would search
/usr/lib64 only.

When the file is not found, musl falls back to its default path.
Patch 0002 sets it to syslibdir:libdir, see 2da79f021b ("musl: Create
default library search path based on configuration").

Reference: https://git.openembedded.org/openembedded-core/commit/?id=2da79f021b5525ea5b56a86563905a67fc958fa5

Without multilib the libraries are in /usr/lib, which the default path
covers, so nothing shows. A 64-bit multilib build gets
/usr/lib:/usr/lib64 and looks in /usr/lib first, so a 64-bit program
loads the lib32 copies of its libraries from there and fails.

Treat a /usr prefix as the root, so /usr/lib/ld-musl-$ARCH.so.1 reads
/etc/ld-musl-$ARCH.path like /lib/ld-musl-$ARCH.so.1 does. Without
usrmerge PT_INTERP starts with /lib, and nothing changes.

  PT_INTERP                        file musl opens
                                   before                                     after
  /usr/lib/ld-musl-aarch64.so.1    /usr/etc/ld-musl-aarch64.path (missing)    /etc/ld-musl-aarch64.path
  /lib/ld-musl-aarch64.so.1        /etc/ld-musl-aarch64.path                  /etc/ld-musl-aarch64.path

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...ath-file-from-etc-when-the-loader-is.patch | 35 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when-the-loader-is.patch

diff --git a/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when-the-loader-is.patch b/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when-the-loader-is.patch
new file mode 100644
index 0000000000..bcc0c71c3b
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when-the-loader-is.patch
@@ -0,0 +1,35 @@
+From 29727534313c4955d2231344711fddd1e93af1c2 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 21 Oct 2026 18:57:49 +0900
+Subject: [PATCH] ldso: read the .path file from /etc when the loader is in
+ /usr/lib
+
+musl looks for ld-musl-$ARCH.path in the etc directory next to the
+directory of the dynamic linker, as named by PT_INTERP. With usrmerge
+OE puts /usr/lib/ld-musl-$ARCH.so.1 into PT_INTERP, so musl opens
+/usr/etc/ld-musl-$ARCH.path while the file is installed in /etc.
+
+Treat a /usr prefix as the root, so /usr/lib/ld-musl-$ARCH.so.1 reads
+/etc/ld-musl-$ARCH.path like /lib/ld-musl-$ARCH.so.1 does.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ ldso/dynlink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ldso/dynlink.c b/ldso/dynlink.c
+index 0fdc9e7c..dfc772e3 100644
+--- a/ldso/dynlink.c
++++ b/ldso/dynlink.c
+@@ -1136,6 +1136,10 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
+ 					for (s=t=z=ldso.name; *s; s++)
+ 						if (*s=='/') z=t, t=s;
+ 					prefix_len = z-ldso.name;
++					/* With usrmerge the loader is /usr/lib/ld-musl-*,
++					 * but the .path file stays in /etc. */
++					if (prefix_len == 4 && !memcmp(ldso.name, "/usr", 4))
++						prefix_len = 0;
+ 					if (prefix_len < PATH_MAX)
+ 						prefix = ldso.name;
+ 				}
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 212bda1f29..f901b6e8da 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
+           file://0004-ldso-read-the-.path-file-from-etc-when-the-loader-is.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
