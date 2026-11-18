Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9227.1794995391699939898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aUVGJ7ss;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24377C4CBDA;
	Wed, 18 Nov 2026 09:49:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B9105FE9B;
	Wed, 18 Nov 2026 09:49:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0E2111BC08DF;
	Wed, 18 Nov 2026 10:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794995388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1RV6QCTJbbPiJCc9407V/N7s/4rhc25dFEqSOtyckDA=;
	b=aUVGJ7ssaBbbV9boo9h5uHhlU2Xr/IebTSfb96wMdMb8SwY7rY8Lnh9CAJPXE6rly2rO/V
	93jiJjzh8iTyc5NNC2A/Alun/tAoXBE/dIvqa1R5esaDcmUF3vYSiIlKtIACg7fTjengbv
	q7W7sv0Ft83WOop4sDS4rXqhOYLLGeMnsI+WJijEEOSWKTivzkPkB77nggmzZdSse1Cx9L
	VDpuQeyXT0I3lgLShbYs9WyrEARV5qBHO9ODNI1+VC68OEq6Ym3B+VsxL6rrIYSQ05RBh6
	M3MGK0IAgPO2UqTcsU95qB0DXduYidd5gZm+3bSdAMZ00crdovEm/loUfNvglA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 18 Nov 2026 10:49:39 +0100
Subject: [PATCH] libfaketime: upgrade 0.9.13 -> 0.9.14
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-mathieu-libfaketime-0-9-14-v1-1-2b0aabe31766@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALJ0/WoC/x3MQQ7CIBAAwK+QPbsJi0TUr5gegC6y0VYDtWnS8
 HdJj3OZHSoX4Qp3tUPhVap85g46KYjZz09GGbvBaHMhoitOfsnCP3xLSP7Fi0yMGm9IFq3Vwbl
 EZx8D9OBbOMl25I+htT+aIPh9bAAAAA==
X-Change-ID: 20261118-mathieu-libfaketime-0-9-14-440b77f13acb
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Khem Raj <khem.raj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794995386; l=7708;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=3c0cqHzyMEeXBeuLRRzjEoXm9oD2TxjGWmEm4Nhc5zM=;
 b=PHUP+Nm0mE6eMpYek2H37PT4nbqg9QqrHZiwOpsfgdfnaiDX6axW60q4tdFNnY9UOEqJMrND5
 4cs7/rWaaWrCFizFi3+YWMVKqnchzrKGzUVpigDesz2LvLc9VIoblui
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250531

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...-Mark-write-only-real_-pointers-as-unused.patch | 22 ++++++++---
 ....c-do-not-declare-__time64-when-D_TIME_BI.patch | 46 ----------------------
 ...libfaketime_0.9.13.bb => libfaketime_0.9.14.bb} |  5 +--
 3 files changed, 19 insertions(+), 54 deletions(-)

diff --git a/meta/recipes-support/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch b/meta/recipes-support/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
index c7a854a19604..070789f7bf6f 100644
--- a/meta/recipes-support/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
+++ b/meta/recipes-support/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
@@ -1,4 +1,4 @@
-From d0fd7b4be89feb6a8809216b0dc1d84299bbad96 Mon Sep 17 00:00:00 2001
+From acbf2bfedc297118ec8c8459fd2b4c6e189c14fd Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Mon, 7 Sep 2026 19:27:57 -0700
 Subject: [PATCH] Mark write-only real_* pointers as unused
@@ -22,19 +22,23 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- src/libfaketime.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
+ src/libfaketime.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
 
 diff --git a/src/libfaketime.c b/src/libfaketime.c
-index e674883..2addaab 100644
+index f3acdbf37a42..9f783e9557e1 100644
 --- a/src/libfaketime.c
 +++ b/src/libfaketime.c
-@@ -337,26 +337,26 @@ static __thread bool dont_fake = false;
+@@ -355,7 +355,7 @@ static bool command_excluded = false;
  /* pointers to real (not faked) functions */
  static int          (*real_stat)            (const char *, struct stat *);
  static int          (*real_fstat)           (int, struct stat *);
 -static int          (*real_lstat)           (const char *, struct stat *);
 +static int          (*real_lstat)           (const char *, struct stat *) __attribute__((unused));
+ #if defined(FAKE_STAT) && !defined(MACOS_DYLD_INTERPOSE)
+ static int          (*real_nftw)            (const char *,
+                                               int (*)(const char *, const struct stat *, int, struct FTW *),
+@@ -364,26 +364,26 @@ static int          (*real_nftw)            (const char *,
  #ifndef __ANDROID__
  static int          (*real_xstat)           (int, const char *, struct stat *);
  static int          (*real_fxstat)          (int, int, struct stat *);
@@ -46,11 +50,19 @@ index e674883..2addaab 100644
  #if !defined(__APPLE__) || !__DARWIN_ONLY_64_BIT_INO_T
  #ifndef __ANDROID__
 -static int          (*real_stat64)          (const char *, struct stat64 *);
+-static int          (*real_lstat64)         (const char *, struct stat64 *);
+-static int          (*real_fstat64)         (int, struct stat64 *);
+-static int          (*real_fstatat)         (int, const char *, struct stat *, int);
+-static int          (*real_fstatat64)       (int, const char *, struct stat64 *, int);
 -static int          (*real_xstat64)         (int, const char *, struct stat64 *);
 -static int          (*real_fxstat64)        (int, int , struct stat64 *);
 -static int          (*real_fxstatat64)      (int, int , const char *, struct stat64 *, int);
 -static int          (*real_lxstat64)        (int, const char *, struct stat64 *);
 +static int          (*real_stat64)          (const char *, struct stat64 *) __attribute__((unused));
++static int          (*real_lstat64)         (const char *, struct stat64 *) __attribute__((unused));
++static int          (*real_fstat64)         (int, struct stat64 *) __attribute__((unused));
++static int          (*real_fstatat)         (int, const char *, struct stat *, int) __attribute__((unused));
++static int          (*real_fstatat64)       (int, const char *, struct stat64 *, int) __attribute__((unused));
 +static int          (*real_xstat64)         (int, const char *, struct stat64 *) __attribute__((unused));
 +static int          (*real_fxstat64)        (int, int , struct stat64 *) __attribute__((unused));
 +static int          (*real_fxstatat64)      (int, int , const char *, struct stat64 *, int) __attribute__((unused));
diff --git a/meta/recipes-support/libfaketime/libfaketime/0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch b/meta/recipes-support/libfaketime/libfaketime/0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch
deleted file mode 100644
index 580e46b40ee5..000000000000
--- a/meta/recipes-support/libfaketime/libfaketime/0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6288d9367a17afef395ca898844ccbf4c0b58ef7 Mon Sep 17 00:00:00 2001
-From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
-Date: Wed, 2 Sep 2026 13:07:05 +0200
-Subject: [PATCH] libfaketime.c: do not declare __time64 when -D_TIME_BITS=64
- is used
-
-When _TIME_BITS macro is set to 64, __clock_gettime64(),
-__gettimeofday64() and __time64 will be defined in the glibc. There is
-no need to define these here.
-
-Upstream-Status: Submitted [https://github.com/wolfcw/libfaketime/pull/553]
-Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
----
- src/libfaketime.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/libfaketime.c b/src/libfaketime.c
-index e6748832fecb..7f3c65bf2bc9 100644
---- a/src/libfaketime.c
-+++ b/src/libfaketime.c
-@@ -1802,11 +1802,13 @@ int __lxstat (int ver, const char *path, struct stat *buf)
- #endif
- 
- #ifdef __GLIBC__
-+#if (_TIME_BITS != 64)
- int stat64 (const char *path, struct stat64 *buf)
- {
-   STAT64_HANDLER(stat64, buf, path, buf);
- }
- #endif
-+#endif
- 
- /* Contributed by Philipp Hachtmann in version 0.6 */
- #ifndef __ANDROID__
-@@ -3375,7 +3377,7 @@ int clock_gettime(clockid_t clk_id, struct timespec *tp)
- 
- #ifdef __GLIBC__
- /* This is used by glibc 32-bit architectures only. */
--#ifndef FAKETIME_TIME64_BUILD
-+#if (_TIME_BITS != 64)
- int __clock_gettime64(clockid_t clk_id, struct __timespec64 *tp64)
- {
-   struct timespec tp;
--- 
-2.47.3
-
diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb b/meta/recipes-support/libfaketime/libfaketime_0.9.14.bb
similarity index 88%
rename from meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
rename to meta/recipes-support/libfaketime/libfaketime_0.9.14.bb
index bcbf53181fb3..041b0b772919 100644
--- a/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
+++ b/meta/recipes-support/libfaketime/libfaketime_0.9.14.bb
@@ -4,12 +4,11 @@ HOMEPAGE = "https://github.com/wolfcw/libfaketime"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "86b37fde2fed7336ea2d0c17928e3015a55d9b4a"
+SRCREV = "c88b79b4e9cc1c94294037b4677b69185861c2a1"
 
 SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
-           file://0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch \
            file://0001-Mark-write-only-real_-pointers-as-unused.patch \
-"
+           "
 
 # The version script names the symbols that are defined with .symver
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"

---
base-commit: ea66eb396e2d3015315d5d364fe2197ab8905f63
change-id: 20261118-mathieu-libfaketime-0-9-14-440b77f13acb

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

