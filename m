Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C91E78870
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w122IFTt012315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:15 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:15 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:09 +0800
Message-ID: <1517537774-12847-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
References: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 2/7] libbsd: update to 0.8.7
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:14 -0000
Content-Type: text/plain

Drop 0001-Fix-for-older-GCCs-not-supporting-__has_include.patch as it
had been merged upstream.
Rebase 0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...r-older-GCCs-not-supporting-__has_include.patch | 31 -----------
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 65 +++++++++++++---------
 .../libbsd/{libbsd_0.8.6.bb => libbsd_0.8.7.bb}    |  5 +-
 3 files changed, 41 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.6.bb => libbsd_0.8.7.bb} (89%)

diff --git a/meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch b/meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch
deleted file mode 100644
index d13732b..0000000
--- a/meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2fbf47ce9b64f4e07be223bc2870348a68f19d86 Mon Sep 17 00:00:00 2001
-From: Adam Lackorzynski <adam@l4re.org>
-Date: Sat, 21 Oct 2017 23:08:31 +0200
-Subject: [PATCH] Fix for older GCCs not supporting __has_include*
-
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=103396]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- include/bsd/sys/cdefs.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/bsd/sys/cdefs.h b/include/bsd/sys/cdefs.h
-index 044f221..b4c8f30 100644
---- a/include/bsd/sys/cdefs.h
-+++ b/include/bsd/sys/cdefs.h
-@@ -25,10 +25,10 @@
-  */
- 
- #ifndef __has_include
--#define __has_include 1
-+#define __has_include(x) 1
- #endif
- #ifndef __has_include_next
--#define __has_include_next 1
-+#define __has_include_next(x) 1
- #endif
- 
- #ifdef LIBBSD_OVERLAY
--- 
-2.12.0
-
diff --git a/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch b/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
index e97e30e..54617b5 100644
--- a/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
+++ b/meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
@@ -4,6 +4,7 @@ Date: Sun, 6 Nov 2016 09:39:31 -0800
 Subject: [PATCH 1/3] Replace __BEGIN_DECLS and __END_DECLS
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
 Upstream-Status: Pending
 
@@ -13,14 +14,14 @@ Upstream-Status: Pending
  include/bsd/nlist.h          | 10 ++++++++--
  include/bsd/readpassphrase.h | 10 ++++++++--
  include/bsd/stdio.h          | 10 ++++++++--
- include/bsd/stdlib.h         | 10 ++++++++--
- include/bsd/string.h         | 10 ++++++++--
+ include/bsd/stdlib.h         | 12 +++++++++---
+ include/bsd/string.h         | 12 +++++++++---
  include/bsd/stringlist.h     | 10 ++++++++--
  include/bsd/unistd.h         | 10 ++++++++--
  include/bsd/vis.h            | 10 ++++++++--
  include/bsd/wchar.h          | 10 ++++++++--
  src/hash/sha512.h            | 10 ++++++++--
- 13 files changed, 104 insertions(+), 26 deletions(-)
+ 13 files changed, 106 insertions(+), 28 deletions(-)
 
 diff --git a/include/bsd/err.h b/include/bsd/err.h
 index 12fd051..43dfc32 100644
@@ -50,7 +51,7 @@ index 12fd051..43dfc32 100644
  
  #endif
 diff --git a/include/bsd/libutil.h b/include/bsd/libutil.h
-index ebb6160..28b919d 100644
+index 45b3b15..9c936e5 100644
 --- a/include/bsd/libutil.h
 +++ b/include/bsd/libutil.h
 @@ -53,7 +53,10 @@ struct pidfh {
@@ -78,7 +79,7 @@ index ebb6160..28b919d 100644
  /* humanize_number(3) */
  #define HN_DECIMAL              0x01
 diff --git a/include/bsd/md5.h b/include/bsd/md5.h
-index 9a75fad..3531fd6 100644
+index 5f3ae46..5d80e5c 100644
 --- a/include/bsd/md5.h
 +++ b/include/bsd/md5.h
 @@ -30,7 +30,10 @@ typedef struct MD5Context {
@@ -103,14 +104,14 @@ index 9a75fad..3531fd6 100644
 +#endif
 +/* __END_DECLS */
  
- #endif /* _MD5_H_ */
+ #endif /* LIBBSD_MD5_H */
 diff --git a/include/bsd/nlist.h b/include/bsd/nlist.h
-index 2730237..0389ab7 100644
+index cb297e8..e63bbbd 100644
 --- a/include/bsd/nlist.h
 +++ b/include/bsd/nlist.h
-@@ -30,8 +30,14 @@
- #include <sys/cdefs.h>
- #include <a.out.h>
+@@ -88,8 +88,14 @@ struct nlist {
+ 
+ #define N_FORMAT	"%08x"	/* namelist value format; XXX */
  
 -__BEGIN_DECLS
 +/* __BEGIN_DECLS */
@@ -126,7 +127,7 @@ index 2730237..0389ab7 100644
  
  #endif
 diff --git a/include/bsd/readpassphrase.h b/include/bsd/readpassphrase.h
-index e1dacc3..76e0d33 100644
+index 14744b8..fa73361 100644
 --- a/include/bsd/readpassphrase.h
 +++ b/include/bsd/readpassphrase.h
 @@ -34,8 +34,14 @@
@@ -145,13 +146,13 @@ index e1dacc3..76e0d33 100644
 +#endif
 +/* __END_DECLS */
  
- #endif /* !_READPASSPHRASE_H_ */
+ #endif /* !LIBBSD_READPASSPHRASE_H */
 diff --git a/include/bsd/stdio.h b/include/bsd/stdio.h
-index 7697425..b5b3efd 100644
+index 4b69983..18645b7 100644
 --- a/include/bsd/stdio.h
 +++ b/include/bsd/stdio.h
-@@ -41,7 +41,10 @@
- #include <sys/cdefs.h>
+@@ -45,7 +45,10 @@
+ #endif
  #include <sys/types.h>
  
 -__BEGIN_DECLS
@@ -162,7 +163,7 @@ index 7697425..b5b3efd 100644
  const char *fmtcheck(const char *, const char *);
  
  /* XXX: The function requires cooperation from the system libc to store the
-@@ -69,7 +72,10 @@ FILE *funopen(const void *cookie,
+@@ -73,7 +76,10 @@ FILE *funopen(const void *cookie,
  #define fwopen(cookie, fn) funopen(cookie, NULL, fn, NULL, NULL)
  
  int fpurge(FILE *fp);
@@ -175,7 +176,7 @@ index 7697425..b5b3efd 100644
  #endif
  #endif
 diff --git a/include/bsd/stdlib.h b/include/bsd/stdlib.h
-index 0604cad..b9f0515 100644
+index ebc9638..c4b54b6 100644
 --- a/include/bsd/stdlib.h
 +++ b/include/bsd/stdlib.h
 @@ -46,7 +46,10 @@
@@ -189,8 +190,17 @@ index 0604cad..b9f0515 100644
 +#endif
  uint32_t arc4random(void);
  void arc4random_stir(void);
- void arc4random_addrandom(u_char *dat, int datlen);
-@@ -73,6 +76,9 @@ long long strtonum(const char *nptr, long long minval, long long maxval,
+ void arc4random_addrandom(unsigned char *dat, int datlen);
+@@ -67,7 +70,7 @@ int sradixsort(const unsigned char **base, int nmemb,
+                const unsigned char *table, unsigned endbyte);
+ 
+ void *reallocf(void *ptr, size_t size);
+-#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 26)
++#if defined(_GNU_SOURCE) && defined(__GLIBC__)
+ void *reallocarray(void *ptr, size_t nmemb, size_t size);
+ #endif
+ 
+@@ -75,6 +78,9 @@ long long strtonum(const char *nptr, long long minval, long long maxval,
                     const char **errstr);
  
  char *getbsize(int *headerlenp, long *blocksizep);
@@ -202,10 +212,10 @@ index 0604cad..b9f0515 100644
  
  #endif
 diff --git a/include/bsd/string.h b/include/bsd/string.h
-index ee2f953..fbf8c54 100644
+index 6798bf6..fa1193f 100644
 --- a/include/bsd/string.h
 +++ b/include/bsd/string.h
-@@ -36,13 +36,19 @@
+@@ -36,15 +36,21 @@
  #include <sys/cdefs.h>
  #include <sys/types.h>
  
@@ -219,7 +229,10 @@ index ee2f953..fbf8c54 100644
  char *strnstr(const char *str, const char *find, size_t str_len);
  void strmode(mode_t mode, char *str);
  
+-#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 25)
++#if defined(_GNU_SOURCE) && defined(__GLIBC__)
  void explicit_bzero(void *buf, size_t len);
+ #endif
 -__END_DECLS
 +#ifdef __cplusplus
 +}
@@ -228,7 +241,7 @@ index ee2f953..fbf8c54 100644
  
  #endif
 diff --git a/include/bsd/stringlist.h b/include/bsd/stringlist.h
-index e3c42e9..40d0a52 100644
+index ff30cac..4600f6b 100644
 --- a/include/bsd/stringlist.h
 +++ b/include/bsd/stringlist.h
 @@ -43,12 +43,18 @@ typedef struct _stringlist {
@@ -251,7 +264,7 @@ index e3c42e9..40d0a52 100644
 +#endif
 +/* __END_DECLS */
  
- #endif /* _STRINGLIST_H */
+ #endif /* LIBBSD_STRINGLIST_H */
 diff --git a/include/bsd/unistd.h b/include/bsd/unistd.h
 index 1f9c5f8..5b2f4c7 100644
 --- a/include/bsd/unistd.h
@@ -280,7 +293,7 @@ index 1f9c5f8..5b2f4c7 100644
  
  #endif
 diff --git a/include/bsd/vis.h b/include/bsd/vis.h
-index 835d2d6..63c951e 100644
+index 970dfdd..621d3c6 100644
 --- a/include/bsd/vis.h
 +++ b/include/bsd/vis.h
 @@ -74,7 +74,10 @@
@@ -305,7 +318,7 @@ index 835d2d6..63c951e 100644
 +#endif
 +/* __END_DECLS */
  
- #endif /* !_VIS_H_ */
+ #endif /* !LIBBSD_VIS_H */
 diff --git a/include/bsd/wchar.h b/include/bsd/wchar.h
 index 33a500e..aa70742 100644
 --- a/include/bsd/wchar.h
@@ -359,5 +372,5 @@ index 4f368a1..27ddc24 100644
  
  #endif /* !_SHA512_H_ */
 -- 
-2.10.2
+1.9.1
 
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.6.bb b/meta/recipes-support/libbsd/libbsd_0.8.7.bb
similarity index 89%
rename from meta/recipes-support/libbsd/libbsd_0.8.6.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.7.bb
index c88517f..552a85c 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.6.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.7.bb
@@ -36,15 +36,14 @@ SECTION = "libs"
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
     file://0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch \
-    file://0001-Fix-for-older-GCCs-not-supporting-__has_include.patch \
 "
 SRC_URI_append_libc-musl  = " \
     file://0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch \
     file://0002-Remove-funopen.patch \
 "
 
-SRC_URI[md5sum] = "4ab7bec639af17d0aacb50222b479110"
-SRC_URI[sha256sum] = "467fbf9df1f49af11f7f686691057c8c0a7613ae5a870577bef9155de39f9687"
+SRC_URI[md5sum] = "d9e6980fbfe44f94fd92b89a33cce67d"
+SRC_URI[sha256sum] = "f548f10e5af5a08b1e22889ce84315b1ebe41505b015c9596bad03fd13a12b31"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


