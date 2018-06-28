Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDED745A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:40:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5S7eRdN009869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 00:40:27 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 28 Jun 2018 00:40:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 15:39:47 +0800
Message-ID: <1530171589-21641-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
References: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 2/4] libbsd: update to 0.9.1
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
X-List-Received-Date: Thu, 28 Jun 2018 07:40:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

License-Update: update COPYING file format

Drop 0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch and
0002-Remove-funopen.patch since they are already fixed upstream.

Backport 0001-flopen-Add-missing-fcntl.h-include.patch to fix build with
musl.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 376 ---------------------
 .../0001-flopen-Add-missing-fcntl.h-include.patch  |  46 +++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  52 ---
 .../libbsd/{libbsd_0.8.7.bb => libbsd_0.9.1.bb}    |  19 +-
 4 files changed, 53 insertions(+), 440 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.7.bb => libbsd_0.9.1.bb} (72%)

diff --git a/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch b/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
deleted file mode 100644
index 54617b5..0000000
--- a/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
+++ /dev/null
@@ -1,376 +0,0 @@
-From 88adbe1a855b7aa95bd925c80ed83c86f3fc42e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Nov 2016 09:39:31 -0800
-Subject: [PATCH 1/3] Replace __BEGIN_DECLS and __END_DECLS
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
-Upstream-Status: Pending
-
- include/bsd/err.h            | 10 ++++++++--
- include/bsd/libutil.h        | 10 ++++++++--
- include/bsd/md5.h            | 10 ++++++++--
- include/bsd/nlist.h          | 10 ++++++++--
- include/bsd/readpassphrase.h | 10 ++++++++--
- include/bsd/stdio.h          | 10 ++++++++--
- include/bsd/stdlib.h         | 12 +++++++++---
- include/bsd/string.h         | 12 +++++++++---
- include/bsd/stringlist.h     | 10 ++++++++--
- include/bsd/unistd.h         | 10 ++++++++--
- include/bsd/vis.h            | 10 ++++++++--
- include/bsd/wchar.h          | 10 ++++++++--
- src/hash/sha512.h            | 10 ++++++++--
- 13 files changed, 106 insertions(+), 28 deletions(-)
-
-diff --git a/include/bsd/err.h b/include/bsd/err.h
-index 12fd051..43dfc32 100644
---- a/include/bsd/err.h
-+++ b/include/bsd/err.h
-@@ -42,7 +42,10 @@
- 
- #include <stdarg.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- void warnc(int code, const char *format, ...)
- 	__printflike(2, 3);
- void vwarnc(int code, const char *format, va_list ap)
-@@ -51,6 +54,9 @@ void errc(int status, int code, const char *format, ...)
- 	__printflike(3, 4);
- void verrc(int status, int code, const char *format, va_list ap)
- 	__printflike(3, 0);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
-diff --git a/include/bsd/libutil.h b/include/bsd/libutil.h
-index 45b3b15..9c936e5 100644
---- a/include/bsd/libutil.h
-+++ b/include/bsd/libutil.h
-@@ -53,7 +53,10 @@ struct pidfh {
- 	ino_t	pf_ino;
- };
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- int humanize_number(char *buf, size_t len, int64_t bytes,
-     const char *suffix, int scale, int flags);
- int expand_number(const char *_buf, uint64_t *_num);
-@@ -66,7 +69,10 @@ int pidfile_close(struct pidfh *pfh);
- int pidfile_remove(struct pidfh *pfh);
- 
- char   *fparseln(FILE *, size_t *, size_t *, const char[3], int);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- /* humanize_number(3) */
- #define HN_DECIMAL              0x01
-diff --git a/include/bsd/md5.h b/include/bsd/md5.h
-index 5f3ae46..5d80e5c 100644
---- a/include/bsd/md5.h
-+++ b/include/bsd/md5.h
-@@ -30,7 +30,10 @@ typedef struct MD5Context {
- #include <sys/cdefs.h>
- #include <sys/types.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- void	 MD5Init(MD5_CTX *);
- void	 MD5Update(MD5_CTX *, const uint8_t *, size_t)
- 		__attribute__((__bounded__(__string__,2,3)));
-@@ -49,6 +52,9 @@ char	*MD5FileChunk(const char *, char *, off_t, off_t)
- char	*MD5Data(const uint8_t *, size_t, char *)
- 		__attribute__((__bounded__(__string__,1,2)))
- 		__attribute__((__bounded__(__minbytes__,3,MD5_DIGEST_STRING_LENGTH)));
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif /* LIBBSD_MD5_H */
-diff --git a/include/bsd/nlist.h b/include/bsd/nlist.h
-index cb297e8..e63bbbd 100644
---- a/include/bsd/nlist.h
-+++ b/include/bsd/nlist.h
-@@ -88,8 +88,14 @@ struct nlist {
- 
- #define N_FORMAT	"%08x"	/* namelist value format; XXX */
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- extern int nlist(const char *filename, struct nlist *list);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
-diff --git a/include/bsd/readpassphrase.h b/include/bsd/readpassphrase.h
-index 14744b8..fa73361 100644
---- a/include/bsd/readpassphrase.h
-+++ b/include/bsd/readpassphrase.h
-@@ -34,8 +34,14 @@
- #include <sys/cdefs.h>
- #include <sys/types.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- char * readpassphrase(const char *, char *, size_t, int);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif /* !LIBBSD_READPASSPHRASE_H */
-diff --git a/include/bsd/stdio.h b/include/bsd/stdio.h
-index 4b69983..18645b7 100644
---- a/include/bsd/stdio.h
-+++ b/include/bsd/stdio.h
-@@ -45,7 +45,10 @@
- #endif
- #include <sys/types.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- const char *fmtcheck(const char *, const char *);
- 
- /* XXX: The function requires cooperation from the system libc to store the
-@@ -73,7 +76,10 @@ FILE *funopen(const void *cookie,
- #define fwopen(cookie, fn) funopen(cookie, NULL, fn, NULL, NULL)
- 
- int fpurge(FILE *fp);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
- #endif
-diff --git a/include/bsd/stdlib.h b/include/bsd/stdlib.h
-index ebc9638..c4b54b6 100644
---- a/include/bsd/stdlib.h
-+++ b/include/bsd/stdlib.h
-@@ -46,7 +46,10 @@
- #include <sys/stat.h>
- #include <stdint.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- uint32_t arc4random(void);
- void arc4random_stir(void);
- void arc4random_addrandom(unsigned char *dat, int datlen);
-@@ -67,7 +70,7 @@ int sradixsort(const unsigned char **base, int nmemb,
-                const unsigned char *table, unsigned endbyte);
- 
- void *reallocf(void *ptr, size_t size);
--#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 26)
-+#if defined(_GNU_SOURCE) && defined(__GLIBC__)
- void *reallocarray(void *ptr, size_t nmemb, size_t size);
- #endif
- 
-@@ -75,6 +78,9 @@ long long strtonum(const char *nptr, long long minval, long long maxval,
-                    const char **errstr);
- 
- char *getbsize(int *headerlenp, long *blocksizep);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
-diff --git a/include/bsd/string.h b/include/bsd/string.h
-index 6798bf6..fa1193f 100644
---- a/include/bsd/string.h
-+++ b/include/bsd/string.h
-@@ -36,15 +36,21 @@
- #include <sys/cdefs.h>
- #include <sys/types.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- size_t strlcpy(char *dst, const char *src, size_t siz);
- size_t strlcat(char *dst, const char *src, size_t siz);
- char *strnstr(const char *str, const char *find, size_t str_len);
- void strmode(mode_t mode, char *str);
- 
--#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 25)
-+#if defined(_GNU_SOURCE) && defined(__GLIBC__)
- void explicit_bzero(void *buf, size_t len);
- #endif
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
-diff --git a/include/bsd/stringlist.h b/include/bsd/stringlist.h
-index ff30cac..4600f6b 100644
---- a/include/bsd/stringlist.h
-+++ b/include/bsd/stringlist.h
-@@ -43,12 +43,18 @@ typedef struct _stringlist {
- 	size_t	  sl_cur;
- } StringList;
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- StringList	*sl_init(void);
- int		 sl_add(StringList *, char *);
- void		 sl_free(StringList *, int);
- char		*sl_find(StringList *, const char *);
- int		 sl_delete(StringList *, const char *, int);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif /* LIBBSD_STRINGLIST_H */
-diff --git a/include/bsd/unistd.h b/include/bsd/unistd.h
-index 1f9c5f8..5b2f4c7 100644
---- a/include/bsd/unistd.h
-+++ b/include/bsd/unistd.h
-@@ -45,7 +45,10 @@
- #define S_ISTXT S_ISVTX
- #endif
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- extern int optreset;
- 
- #ifdef LIBBSD_OVERLAY
-@@ -68,6 +71,9 @@ void setproctitle(const char *fmt, ...)
- 	__printflike(1, 2);
- 
- int getpeereid(int s, uid_t *euid, gid_t *egid);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
-diff --git a/include/bsd/vis.h b/include/bsd/vis.h
-index 970dfdd..621d3c6 100644
---- a/include/bsd/vis.h
-+++ b/include/bsd/vis.h
-@@ -74,7 +74,10 @@
- 
- #include <sys/cdefs.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- char	*vis(char *, int, int, int);
- int	strvis(char *, const char *, int);
- int	strvisx(char *, const char *, size_t, int);
-@@ -83,6 +86,9 @@ int	strunvis(char *, const char *);
- int	strunvisx(char *, const char *, int);
- ssize_t strnunvis(char *, const char *, size_t);
- int	unvis(char *, int, int *, int);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif /* !LIBBSD_VIS_H */
-diff --git a/include/bsd/wchar.h b/include/bsd/wchar.h
-index 33a500e..aa70742 100644
---- a/include/bsd/wchar.h
-+++ b/include/bsd/wchar.h
-@@ -43,12 +43,18 @@
- #include <sys/cdefs.h>
- #include <sys/types.h>
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- wchar_t *fgetwln(FILE *stream, size_t *len);
- 
- size_t wcslcat(wchar_t *dst, const wchar_t *src, size_t size);
- size_t wcslcpy(wchar_t *dst, const wchar_t *src, size_t size);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif
- #endif
-diff --git a/src/hash/sha512.h b/src/hash/sha512.h
-index 4f368a1..27ddc24 100644
---- a/src/hash/sha512.h
-+++ b/src/hash/sha512.h
-@@ -39,7 +39,10 @@ typedef struct SHA512Context {
- 	unsigned char buf[128];
- } SHA512_CTX;
- 
--__BEGIN_DECLS
-+/* __BEGIN_DECLS */
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- void	SHA512_Init(SHA512_CTX *);
- void	SHA512_Update(SHA512_CTX *, const void *, size_t);
-@@ -48,6 +51,9 @@ char   *SHA512_End(SHA512_CTX *, char *);
- char   *SHA512_File(const char *, char *);
- char   *SHA512_FileChunk(const char *, char *, off_t, off_t);
- char   *SHA512_Data(const void *, unsigned int, char *);
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+/* __END_DECLS */
- 
- #endif /* !_SHA512_H_ */
--- 
-1.9.1
-
diff --git a/meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch b/meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
new file mode 100644
index 0000000..8abb876
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
@@ -0,0 +1,46 @@
+From 13c32916b4baab58d93940d57fea9ff0777f1931 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 5 Jun 2018 19:21:46 +0300
+Subject: [PATCH] flopen: Add missing <fcntl.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 993828d84ee (Add flopenat() function from FreeBSD) dropped the
+fcntl.h header. This breaks the build with musl libc:
+
+flopen.c: In function ‘vflopenat’:
+flopen.c:60:14: error: ‘O_CREAT’ undeclared (first use in this function)
+  if (flags & O_CREAT) {
+              ^~~~~~~
+
+Restore the fcntl.h header include to fix the build.
+
+Fixes: commit 993828d84eed0468c6c15b2818e534e6b134b8e4
+Submitted-also-by: parazyd <parazyd@dyne.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Guillem Jover <guillem@hadrons.org>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/libbsd/libbsd/commit/13c32916b4baab58d93940d57fea9ff0777f1931]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/flopen.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/flopen.c b/src/flopen.c
+index b9972c9..ff20d07 100644
+--- a/src/flopen.c
++++ b/src/flopen.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <unistd.h>
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch b/meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
deleted file mode 100644
index 60da15e..0000000
--- a/meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 28fc66e8b848709a2e69dba7f07694248e0154e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Nov 2016 09:40:43 -0800
-Subject: [PATCH 2/3] Remove funopen()
-
-Musl doesnt have prerequisites for it.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Inappropriate [musl specific]
-
- man/Makefile.am  | 1 -
- src/Makefile.am  | 1 -
- test/Makefile.am | 1 -
- 3 files changed, 3 deletions(-)
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index 28192c0..a22787d 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -168,7 +168,6 @@ dist_man_MANS = \
- 	fmtcheck.3bsd \
- 	fparseln.3bsd \
- 	fpurge.3bsd \
--	funopen.3bsd \
- 	getbsize.3bsd \
- 	getmode.3bsd \
- 	getpeereid.3bsd \
-diff --git a/src/Makefile.am b/src/Makefile.am
-index ad83dbf..13225a3 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -76,7 +76,6 @@ libbsd_la_SOURCES = \
- 	fmtcheck.c \
- 	fparseln.c \
- 	fpurge.c \
--	funopen.c \
- 	getbsize.c \
- 	getpeereid.c \
- 	hash/md5.c \
-diff --git a/test/Makefile.am b/test/Makefile.am
-index d86539a..b32ed2e 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -36,7 +36,6 @@ check_PROGRAMS = \
- 	endian \
- 	humanize \
- 	fgetln \
--	funopen \
- 	fparseln \
- 	fpurge \
- 	md5 \
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.7.bb b/meta/recipes-support/libbsd/libbsd_0.9.1.bb
similarity index 72%
rename from meta/recipes-support/libbsd/libbsd_0.8.7.bb
rename to meta/recipes-support/libbsd/libbsd_0.9.1.bb
index 552a85c..2a1cd64 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.7.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.9.1.bb
@@ -9,16 +9,14 @@ DESCRIPTION = "This library provides useful functions commonly found on BSD syst
 
 HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 # There seems to be more licenses used in the code, I don't think we want to list them all here, complete list:
-# OE @ ~/projects/libbsd $ grep ^License: COPYING  | sort
-# License: BSD-2-clause
+# OE @ ~/projects/libbsd $ grep ^License: COPYING  | sort -u
 # License: BSD-2-clause
 # License: BSD-2-clause-NetBSD
 # License: BSD-2-clause-author
 # License: BSD-2-clause-verbatim
 # License: BSD-3-clause
-# License: BSD-3-clause
-# License: BSD-3-clause
-# License: BSD-3-clause-Peter-Wemm
+# License: BSD-3-clause-author
+# License: BSD-3-clause-John-Birrell
 # License: BSD-3-clause-Regents
 # License: BSD-4-clause-Christopher-G-Demetriou
 # License: BSD-4-clause-Niels-Provos
@@ -30,20 +28,17 @@ HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 # License: public-domain
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-4-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=08fc4e66be4526715dab09c5fba5e9e8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b552602fda69e34c753d26de383f33c5"
 SECTION = "libs"
 
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
     file://0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch \
-"
-SRC_URI_append_libc-musl  = " \
-    file://0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch \
-    file://0002-Remove-funopen.patch \
+    file://0001-flopen-Add-missing-fcntl.h-include.patch \
 "
 
-SRC_URI[md5sum] = "d9e6980fbfe44f94fd92b89a33cce67d"
-SRC_URI[sha256sum] = "f548f10e5af5a08b1e22889ce84315b1ebe41505b015c9596bad03fd13a12b31"
+SRC_URI[md5sum] = "a74b80c4143afa032c90226a4518fffe"
+SRC_URI[sha256sum] = "56d835742327d69faccd16955a60b6dcf30684a8da518c4eca0ac713b9e0a7a4"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


