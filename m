Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E976160102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:14:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I6Ek6D023099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 23:14:46 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 23:14:45 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 23:14:45 -0700
Message-ID: <20170718061445.19196-1-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [morty][PATCH] glibc: Fix CVE-2015-5180
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
X-List-Received-Date: Tue, 18 Jul 2017 06:14:45 -0000
Content-Type: text/plain

Backport upstream patch to fix NULL pointer dereference and process
crash in libresolv. (CVE-2015-5180)

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-5180.patch | 136 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb             |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-5180.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-5180.patch b/meta/recipes-core/glibc/glibc/CVE-2015-5180.patch
new file mode 100644
index 0000000000..638f652c4d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-5180.patch
@@ -0,0 +1,136 @@
+From a8476611d5bca2032a2d18c503996762ac26a489 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Sat, 31 Dec 2016 20:22:09 +0100
+Subject: CVE-2015-5180: resolv: Fix crash with internal QTYPE [BZ #18784]
+
+Also rename T_UNSPEC because an upcoming public header file
+update will use that name.
+
+(cherry picked from commit fc82b0a2dfe7dbd35671c10510a8da1043d746a5)
+
+Upstream-Status: Backport[master]
+CVE: CVE-2015-5180
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ ChangeLog                     | 11 +++++++++++
+ NEWS                          |  6 ++++++
+ include/arpa/nameser_compat.h |  6 +++---
+ resolv/nss_dns/dns-host.c     |  2 +-
+ resolv/res_mkquery.c          |  4 ++++
+ resolv/res_query.c            |  6 +++---
+ 6 files changed, 28 insertions(+), 7 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 0fbda9020e..180634e658 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,14 @@
++2017-03-07  Siddhesh Poyarekar  <siddhesh@sourceware.org>
++
++	[BZ #18784]
++	CVE-2015-5180
++	* include/arpa/nameser_compat.h (T_QUERY_A_AND_AAAA): Rename from
++	T_UNSPEC.  Adjust value.
++	* resolv/nss_dns/dns-host.c (_nss_dns_gethostbyname4_r): Use it.
++	* resolv/res_query.c (__libc_res_nquery): Likewise.
++	* resolv/res_mkquery.c (res_nmkquery): Check for out-of-range
++	QTYPEs.
++
+ 2016-01-28  Carlos O'Donell  <carlos@redhat.com>
+ 	    Alexey Makhalov <amakhalov@vmware.com>
+ 	    Florian Weimer <fweimer@redhat.com>
+diff --git a/NEWS b/NEWS
+index b0447e7169..366f602aac 100644
+--- a/NEWS
++++ b/NEWS
+@@ -71,6 +71,12 @@ Security related changes:
+   and exits.  Over time, this could result in a denial of service due to
+   memory exhaustion.  Reported by Matthias Schiffer.  (CVE-2016-5417)
+ 
++* The DNS stub resolver functions would crash due to a NULL pointer
++  dereference when processing a query with a valid DNS question type which
++  was used internally in the implementation.  The stub resolver now uses a
++  question type which is outside the range of valid question type values.
++  (CVE-2015-5180)
++
+ The following bugs are resolved with this release:
+ 
+   [1170] localedata: ne_NP: update Nepali locale definition file
+diff --git a/include/arpa/nameser_compat.h b/include/arpa/nameser_compat.h
+index 2e735ede4c..7c0deed9ae 100644
+--- a/include/arpa/nameser_compat.h
++++ b/include/arpa/nameser_compat.h
+@@ -1,8 +1,8 @@
+ #ifndef _ARPA_NAMESER_COMPAT_
+ #include <resolv/arpa/nameser_compat.h>
+ 
+-/* Picksome unused number to represent lookups of IPv4 and IPv6 (i.e.,
+-   T_A and T_AAAA).  */
+-#define T_UNSPEC 62321
++/* The number is outside the 16-bit RR type range and is used
++   internally by the implementation.  */
++#define T_QUERY_A_AND_AAAA 439963904
+ 
+ #endif
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+index 5f9e35701b..d16fa4b8ed 100644
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -323,7 +323,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
+ 
+   int olderr = errno;
+   enum nss_status status;
+-  int n = __libc_res_nsearch (&_res, name, C_IN, T_UNSPEC,
++  int n = __libc_res_nsearch (&_res, name, C_IN, T_QUERY_A_AND_AAAA,
+ 			      host_buffer.buf->buf, 2048, &host_buffer.ptr,
+ 			      &ans2p, &nans2p, &resplen2, &ans2p_malloced);
+   if (n >= 0)
+diff --git a/resolv/res_mkquery.c b/resolv/res_mkquery.c
+index 12f9730199..d80b5318e5 100644
+--- a/resolv/res_mkquery.c
++++ b/resolv/res_mkquery.c
+@@ -103,6 +103,10 @@ res_nmkquery(res_state statp,
+ 	int n;
+ 	u_char *dnptrs[20], **dpp, **lastdnptr;
+ 
++	if (class < 0 || class > 65535
++	    || type < 0 || type > 65535)
++	  return -1;
++
+ #ifdef DEBUG
+ 	if (statp->options & RES_DEBUG)
+ 		printf(";; res_nmkquery(%s, %s, %s, %s)\n",
+diff --git a/resolv/res_query.c b/resolv/res_query.c
+index 944d1a90f5..07dc6f6583 100644
+--- a/resolv/res_query.c
++++ b/resolv/res_query.c
+@@ -122,7 +122,7 @@ __libc_res_nquery(res_state statp,
+ 	int n, use_malloc = 0;
+ 	u_int oflags = statp->_flags;
+ 
+-	size_t bufsize = (type == T_UNSPEC ? 2 : 1) * QUERYSIZE;
++	size_t bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * QUERYSIZE;
+ 	u_char *buf = alloca (bufsize);
+ 	u_char *query1 = buf;
+ 	int nquery1 = -1;
+@@ -137,7 +137,7 @@ __libc_res_nquery(res_state statp,
+ 		printf(";; res_query(%s, %d, %d)\n", name, class, type);
+ #endif
+ 
+-	if (type == T_UNSPEC)
++	if (type == T_QUERY_A_AND_AAAA)
+ 	  {
+ 	    n = res_nmkquery(statp, QUERY, name, class, T_A, NULL, 0, NULL,
+ 			     query1, bufsize);
+@@ -190,7 +190,7 @@ __libc_res_nquery(res_state statp,
+ 	if (__builtin_expect (n <= 0, 0) && !use_malloc) {
+ 		/* Retry just in case res_nmkquery failed because of too
+ 		   short buffer.  Shouldn't happen.  */
+-		bufsize = (type == T_UNSPEC ? 2 : 1) * MAXPACKET;
++		bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * MAXPACKET;
+ 		buf = malloc (bufsize);
+ 		if (buf != NULL) {
+ 			query1 = buf;
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index b60b692723..a3bdba2190 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-build_local_scope.patch \
            file://0028-Bug-20116-Fix-use-after-free-in-pthread_create.patch \
+           file://CVE-2015-5180.patch \
 "
 
 SRC_URI += "\
-- 
2.11.0


