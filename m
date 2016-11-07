Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AFF6F719DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 07:25:34 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n85so15381840pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2016 23:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ktnU6vwdNAwu1WTwzqESGl7KJYbaCvP+z5c+eEcYLJ0=;
	b=YusQE+qtnx2N8ikObWRZvSm+8gpYEgb4s9qt1EY/z/B2E9AepCuOuVxoVkl7/0NHok
	lUcgpW09Pgux7Wf/gpsvC3NBU5Fv/nICtwKP9UlX7aOtNY221DyibgkC51Yd4BHwc9C2
	ordhFv02xiW+szUNxTTa9538zpKrADXDBlufar3fgoWH3z4EjZHe2a8bGvl1JLjJ96S4
	C0lIHbt/4e0hlpOP/quvKyESPgYM2T/NkbqwK47XOwfphWAugHeX7ZvKzMyRHi9ddLb/
	gKyFdDM+LbzzVSTDCRlGbHMbn62g4rsJCf9ssiCIdUBnuZas4SGcUTK8iaS1iCtPhlHR
	Rajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ktnU6vwdNAwu1WTwzqESGl7KJYbaCvP+z5c+eEcYLJ0=;
	b=DFTXpDVb2A74LRkKPcFeqjq2hjGe0YimYAP0wm+mvmp4huzXSAs9GX4bTKpyX7MJkM
	YeB2VXD49R6JYnqPZq9VGxV3IctXadnKrj/02A2IbrctzoxQCsndU4A6jxysZG2CV4IY
	oueRvqxYMEdQtr0dF9xUdwp94Wl+kM3Sx6WnbZaudpW+VW7gwMiiLfE0LyPJ5G8m+xmu
	tsOwL+X4RX3jKFnXIJoJudkZJeP/OnKjW0cXvxg2eMcwLE2OMr2lMxg5Bl8BPAxMMlRp
	kqMFqUI4k6HrmZnkIkEeDF3ziGcyR258qTX6gBzK8KWbVbZx9y9PdwzE8xFcdEb6lDWe
	rD2A==
X-Gm-Message-State: ABUngveG/Rx7wU9TBMZQGP3s+wwVAj7gd5gguCCbj+RPa6KXZQ8z1T15a4n/8vhrg3xuEw==
X-Received: by 10.98.139.72 with SMTP id j69mr11095322pfe.158.1478503535727;
	Sun, 06 Nov 2016 23:25:35 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	cp2sm37636677pad.3.2016.11.06.23.25.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 23:25:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:25:26 -0800
Message-Id: <20161107072527.394-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 1/2] libbsd: Fix build with musl
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
X-List-Received-Date: Mon, 07 Nov 2016 07:25:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

a.out.h support is not across all architectures only
x86/x86_64 support is in linux/a.out.h, this patch
abstracts the minimum needed constructs into itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 363 +++++++++++++++++++++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  55 ++++
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch | 130 ++++++++
 meta/recipes-support/libbsd/libbsd_0.8.3.bb        |   5 +
 4 files changed, 553 insertions(+)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch

diff --git a/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch b/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
new file mode 100644
index 0000000..e97e30e
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
@@ -0,0 +1,363 @@
+From 88adbe1a855b7aa95bd925c80ed83c86f3fc42e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 09:39:31 -0800
+Subject: [PATCH 1/3] Replace __BEGIN_DECLS and __END_DECLS
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/bsd/err.h            | 10 ++++++++--
+ include/bsd/libutil.h        | 10 ++++++++--
+ include/bsd/md5.h            | 10 ++++++++--
+ include/bsd/nlist.h          | 10 ++++++++--
+ include/bsd/readpassphrase.h | 10 ++++++++--
+ include/bsd/stdio.h          | 10 ++++++++--
+ include/bsd/stdlib.h         | 10 ++++++++--
+ include/bsd/string.h         | 10 ++++++++--
+ include/bsd/stringlist.h     | 10 ++++++++--
+ include/bsd/unistd.h         | 10 ++++++++--
+ include/bsd/vis.h            | 10 ++++++++--
+ include/bsd/wchar.h          | 10 ++++++++--
+ src/hash/sha512.h            | 10 ++++++++--
+ 13 files changed, 104 insertions(+), 26 deletions(-)
+
+diff --git a/include/bsd/err.h b/include/bsd/err.h
+index 12fd051..43dfc32 100644
+--- a/include/bsd/err.h
++++ b/include/bsd/err.h
+@@ -42,7 +42,10 @@
+ 
+ #include <stdarg.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ void warnc(int code, const char *format, ...)
+ 	__printflike(2, 3);
+ void vwarnc(int code, const char *format, va_list ap)
+@@ -51,6 +54,9 @@ void errc(int status, int code, const char *format, ...)
+ 	__printflike(3, 4);
+ void verrc(int status, int code, const char *format, va_list ap)
+ 	__printflike(3, 0);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+diff --git a/include/bsd/libutil.h b/include/bsd/libutil.h
+index ebb6160..28b919d 100644
+--- a/include/bsd/libutil.h
++++ b/include/bsd/libutil.h
+@@ -53,7 +53,10 @@ struct pidfh {
+ 	ino_t	pf_ino;
+ };
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ int humanize_number(char *buf, size_t len, int64_t bytes,
+     const char *suffix, int scale, int flags);
+ int expand_number(const char *_buf, uint64_t *_num);
+@@ -66,7 +69,10 @@ int pidfile_close(struct pidfh *pfh);
+ int pidfile_remove(struct pidfh *pfh);
+ 
+ char   *fparseln(FILE *, size_t *, size_t *, const char[3], int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ /* humanize_number(3) */
+ #define HN_DECIMAL              0x01
+diff --git a/include/bsd/md5.h b/include/bsd/md5.h
+index 9a75fad..3531fd6 100644
+--- a/include/bsd/md5.h
++++ b/include/bsd/md5.h
+@@ -30,7 +30,10 @@ typedef struct MD5Context {
+ #include <sys/cdefs.h>
+ #include <sys/types.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ void	 MD5Init(MD5_CTX *);
+ void	 MD5Update(MD5_CTX *, const uint8_t *, size_t)
+ 		__attribute__((__bounded__(__string__,2,3)));
+@@ -49,6 +52,9 @@ char	*MD5FileChunk(const char *, char *, off_t, off_t)
+ char	*MD5Data(const uint8_t *, size_t, char *)
+ 		__attribute__((__bounded__(__string__,1,2)))
+ 		__attribute__((__bounded__(__minbytes__,3,MD5_DIGEST_STRING_LENGTH)));
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif /* _MD5_H_ */
+diff --git a/include/bsd/nlist.h b/include/bsd/nlist.h
+index 2730237..0389ab7 100644
+--- a/include/bsd/nlist.h
++++ b/include/bsd/nlist.h
+@@ -30,8 +30,14 @@
+ #include <sys/cdefs.h>
+ #include <a.out.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int nlist(const char *filename, struct nlist *list);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+diff --git a/include/bsd/readpassphrase.h b/include/bsd/readpassphrase.h
+index e1dacc3..76e0d33 100644
+--- a/include/bsd/readpassphrase.h
++++ b/include/bsd/readpassphrase.h
+@@ -34,8 +34,14 @@
+ #include <sys/cdefs.h>
+ #include <sys/types.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ char * readpassphrase(const char *, char *, size_t, int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif /* !_READPASSPHRASE_H_ */
+diff --git a/include/bsd/stdio.h b/include/bsd/stdio.h
+index 7697425..b5b3efd 100644
+--- a/include/bsd/stdio.h
++++ b/include/bsd/stdio.h
+@@ -41,7 +41,10 @@
+ #include <sys/cdefs.h>
+ #include <sys/types.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ const char *fmtcheck(const char *, const char *);
+ 
+ /* XXX: The function requires cooperation from the system libc to store the
+@@ -69,7 +72,10 @@ FILE *funopen(const void *cookie,
+ #define fwopen(cookie, fn) funopen(cookie, NULL, fn, NULL, NULL)
+ 
+ int fpurge(FILE *fp);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+ #endif
+diff --git a/include/bsd/stdlib.h b/include/bsd/stdlib.h
+index 0604cad..b9f0515 100644
+--- a/include/bsd/stdlib.h
++++ b/include/bsd/stdlib.h
+@@ -46,7 +46,10 @@
+ #include <sys/stat.h>
+ #include <stdint.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ uint32_t arc4random(void);
+ void arc4random_stir(void);
+ void arc4random_addrandom(u_char *dat, int datlen);
+@@ -73,6 +76,9 @@ long long strtonum(const char *nptr, long long minval, long long maxval,
+                    const char **errstr);
+ 
+ char *getbsize(int *headerlenp, long *blocksizep);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+diff --git a/include/bsd/string.h b/include/bsd/string.h
+index ee2f953..fbf8c54 100644
+--- a/include/bsd/string.h
++++ b/include/bsd/string.h
+@@ -36,13 +36,19 @@
+ #include <sys/cdefs.h>
+ #include <sys/types.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ size_t strlcpy(char *dst, const char *src, size_t siz);
+ size_t strlcat(char *dst, const char *src, size_t siz);
+ char *strnstr(const char *str, const char *find, size_t str_len);
+ void strmode(mode_t mode, char *str);
+ 
+ void explicit_bzero(void *buf, size_t len);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+diff --git a/include/bsd/stringlist.h b/include/bsd/stringlist.h
+index e3c42e9..40d0a52 100644
+--- a/include/bsd/stringlist.h
++++ b/include/bsd/stringlist.h
+@@ -43,12 +43,18 @@ typedef struct _stringlist {
+ 	size_t	  sl_cur;
+ } StringList;
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ StringList	*sl_init(void);
+ int		 sl_add(StringList *, char *);
+ void		 sl_free(StringList *, int);
+ char		*sl_find(StringList *, const char *);
+ int		 sl_delete(StringList *, const char *, int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif /* _STRINGLIST_H */
+diff --git a/include/bsd/unistd.h b/include/bsd/unistd.h
+index 1f9c5f8..5b2f4c7 100644
+--- a/include/bsd/unistd.h
++++ b/include/bsd/unistd.h
+@@ -45,7 +45,10 @@
+ #define S_ISTXT S_ISVTX
+ #endif
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int optreset;
+ 
+ #ifdef LIBBSD_OVERLAY
+@@ -68,6 +71,9 @@ void setproctitle(const char *fmt, ...)
+ 	__printflike(1, 2);
+ 
+ int getpeereid(int s, uid_t *euid, gid_t *egid);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+diff --git a/include/bsd/vis.h b/include/bsd/vis.h
+index 835d2d6..63c951e 100644
+--- a/include/bsd/vis.h
++++ b/include/bsd/vis.h
+@@ -74,7 +74,10 @@
+ 
+ #include <sys/cdefs.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ char	*vis(char *, int, int, int);
+ int	strvis(char *, const char *, int);
+ int	strvisx(char *, const char *, size_t, int);
+@@ -83,6 +86,9 @@ int	strunvis(char *, const char *);
+ int	strunvisx(char *, const char *, int);
+ ssize_t strnunvis(char *, const char *, size_t);
+ int	unvis(char *, int, int *, int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif /* !_VIS_H_ */
+diff --git a/include/bsd/wchar.h b/include/bsd/wchar.h
+index 33a500e..aa70742 100644
+--- a/include/bsd/wchar.h
++++ b/include/bsd/wchar.h
+@@ -43,12 +43,18 @@
+ #include <sys/cdefs.h>
+ #include <sys/types.h>
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ wchar_t *fgetwln(FILE *stream, size_t *len);
+ 
+ size_t wcslcat(wchar_t *dst, const wchar_t *src, size_t size);
+ size_t wcslcpy(wchar_t *dst, const wchar_t *src, size_t size);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif
+ #endif
+diff --git a/src/hash/sha512.h b/src/hash/sha512.h
+index 4f368a1..27ddc24 100644
+--- a/src/hash/sha512.h
++++ b/src/hash/sha512.h
+@@ -39,7 +39,10 @@ typedef struct SHA512Context {
+ 	unsigned char buf[128];
+ } SHA512_CTX;
+ 
+-__BEGIN_DECLS
++/* __BEGIN_DECLS */
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ void	SHA512_Init(SHA512_CTX *);
+ void	SHA512_Update(SHA512_CTX *, const void *, size_t);
+@@ -48,6 +51,9 @@ char   *SHA512_End(SHA512_CTX *, char *);
+ char   *SHA512_File(const char *, char *);
+ char   *SHA512_FileChunk(const char *, char *, off_t, off_t);
+ char   *SHA512_Data(const void *, unsigned int, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++/* __END_DECLS */
+ 
+ #endif /* !_SHA512_H_ */
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch b/meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
new file mode 100644
index 0000000..83ce7c8
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
@@ -0,0 +1,55 @@
+From 28fc66e8b848709a2e69dba7f07694248e0154e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 09:40:43 -0800
+Subject: [PATCH 2/3] Remove funopen()
+
+Musl doesnt have prerequisites for it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Inappropriate [musl specific]
+
+ man/Makefile.am  | 1 -
+ src/Makefile.am  | 1 -
+ test/Makefile.am | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index e4d6e4a..c701d94 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -29,7 +29,6 @@ dist_man_MANS = \
+ 	flopen.3 \
+ 	fmtcheck.3 \
+ 	fparseln.3 \
+-	funopen.3bsd \
+ 	getbsize.3 \
+ 	getmode.3 \
+ 	getpeereid.3 \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index ad83dbf..13225a3 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -76,7 +76,6 @@ libbsd_la_SOURCES = \
+ 	fmtcheck.c \
+ 	fparseln.c \
+ 	fpurge.c \
+-	funopen.c \
+ 	getbsize.c \
+ 	getpeereid.c \
+ 	hash/md5.c \
+diff --git a/test/Makefile.am b/test/Makefile.am
+index a75c8ff..e3a1d41 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -36,7 +36,6 @@ check_PROGRAMS = \
+ 	endian \
+ 	humanize \
+ 	fgetln \
+-	funopen \
+ 	fparseln \
+ 	fpurge \
+ 	md5 \
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch b/meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch
new file mode 100644
index 0000000..176d940
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch
@@ -0,0 +1,130 @@
+From a1b93c25311834f2f411e9bfe2e616899ba2122d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 10:23:55 -0800
+Subject: [PATCH 3/3] Fix build breaks due to missing a.out.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/bsd/nlist.h                     |  1 -
+ include/bsd/nlist.h => src/local-aout.h | 47 ++++++++++++++++++++++-----------
+ src/nlist.c                             |  9 +++++++
+ 3 files changed, 41 insertions(+), 16 deletions(-)
+ copy include/bsd/nlist.h => src/local-aout.h (63%)
+
+diff --git a/include/bsd/nlist.h b/include/bsd/nlist.h
+index 0389ab7..9c7e3d8 100644
+--- a/include/bsd/nlist.h
++++ b/include/bsd/nlist.h
+@@ -28,7 +28,6 @@
+ #define LIBBSD_NLIST_H
+ 
+ #include <sys/cdefs.h>
+-#include <a.out.h>
+ 
+ /* __BEGIN_DECLS */
+ #ifdef __cplusplus
+diff --git a/include/bsd/nlist.h b/src/local-aout.h
+similarity index 63%
+copy from include/bsd/nlist.h
+copy to src/local-aout.h
+index 0389ab7..2adb93e 100644
+--- a/include/bsd/nlist.h
++++ b/src/local-aout.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright © 2009 Guillem Jover <guillem@hadrons.org>
++ * Copyright © 2016 Khem Raj <raj.khem@gmail.com>
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -24,20 +24,37 @@
+  * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#ifndef LIBBSD_NLIST_H
+-#define LIBBSD_NLIST_H
++#ifndef LIBBSD_LOCAL_AOUT_H
++#define LIBBSD_LOCAL_AOUT_H
+ 
+-#include <sys/cdefs.h>
+-#include <a.out.h>
++#define N_UNDF  0
++#define N_ABS   2
++#define N_TEXT  4
++#define N_DATA  6
++#define N_BSS   8
++#define N_FN    15
++#define N_EXT   1
++#define N_TYPE  036
++#define N_STAB  0340
++#define N_INDR  0xa
++#define N_SETA  0x14    /* Absolute set element symbol.  */
++#define N_SETT  0x16    /* Text set element symbol.  */
++#define N_SETD  0x18    /* Data set element symbol.  */
++#define N_SETB  0x1A    /* Bss set element symbol.  */
++#define N_SETV  0x1C    /* Pointer to set vector in data area.  */
+ 
+-/* __BEGIN_DECLS */
+-#ifdef __cplusplus
+-extern "C" {
+-#endif
+-extern int nlist(const char *filename, struct nlist *list);
+-#ifdef __cplusplus
+-}
+-#endif
+-/* __END_DECLS */
++struct nlist
++{
++  union
++    {
++      char *n_name;
++      struct nlist *n_next;
++      long n_strx;
++    } n_un;
++  unsigned char n_type;
++  char n_other;
++  short n_desc;
++  unsigned long n_value;
++};
+ 
+-#endif
++#endif /* LIBBSD_LOCAL_AOUT_H */
+diff --git a/src/nlist.c b/src/nlist.c
+index 0cffe55..625d310 100644
+--- a/src/nlist.c
++++ b/src/nlist.c
+@@ -40,7 +40,11 @@ static char sccsid[] = "@(#)nlist.c	8.1 (Berkeley) 6/4/93";
+ 
+ #include <errno.h>
+ #include <fcntl.h>
++#ifdef __GLIBC__
+ #include <a.out.h>
++#else
++#define __NO_A_OUT_SUPPORT
++#endif
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+@@ -48,12 +52,17 @@ static char sccsid[] = "@(#)nlist.c	8.1 (Berkeley) 6/4/93";
+ #if !defined(__NO_A_OUT_SUPPORT)
+ #define _NLIST_DO_AOUT
+ #endif
++
+ #define _NLIST_DO_ELF
+ 
+ #ifdef _NLIST_DO_ELF
+ #include "local-elf.h"
+ #endif
+ 
++#ifdef _NLIST_DO_ELF
++#include "local-aout.h"
++#endif
++
+ #define SIZE_T_MAX 0xffffffffU
+ 
+ #ifdef _NLIST_DO_AOUT
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.3.bb b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
index 92121ef..b0336b7 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.3.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
@@ -36,6 +36,11 @@ SECTION = "libs"
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 "
+SRC_URI_append_libc-musl  = " \
+    file://0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch \
+    file://0002-Remove-funopen.patch \
+    file://0003-Fix-build-breaks-due-to-missing-a.out.h.patch \
+"
 
 SRC_URI[md5sum] = "e935c1bb6cc98a4a43cb1da22795493a"
 SRC_URI[sha256sum] = "934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8"
-- 
2.10.2


