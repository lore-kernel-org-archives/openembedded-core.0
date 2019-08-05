Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 756707F338
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:06:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,348,1559491200"; d="scan'208";a="72981505"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2019 15:06:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D00364CDFAB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 15:06:11 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019 15:06:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2019 15:05:29 +0800
Message-ID: <20190805070529.30659-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D00364CDFAB7.AB973
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCHv2] libnss-nis:upgrade 3.0 -> 3.1
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
X-List-Received-Date: Mon, 05 Aug 2019 07:06:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
 Removed since this is included in 3.1.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/libnss-nis/libnss-nis.bb     |   5 +-
 ...001-nis-hosts-Remove-use-of-RES_USE_INET6.patch | 162 ---------------------
 2 files changed, 2 insertions(+), 165 deletions(-)
 delete mode 100644 meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index 4fbd4b1..a1d914e 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,12 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.0+git${SRCPV}"
+PV = "3.1"
 
-SRCREV = "d4aea48657a8e90d7922574b8021ee03915a36cb"
+SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis \
-           file://0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch b/meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
deleted file mode 100644
index 348c8c9..0000000
--- a/meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From e41ddbd89a4bb042ac00469fa5880ba584c25c05 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 25 Jul 2019 12:10:56 -0700
-Subject: [PATCH] nis-hosts: Remove use of RES_USE_INET6
-
-Upstream glibc dropped it starting glibc 2.30
-see
-https://sourceware.org/git/?p=glibc.git;a=commit;h=3f8b44be0a658266adff5ece1e4bc3ce097a5dbe
-
-Fixes issue #6
-
-Upstream-Status: Submitted [https://github.com/thkukuk/libnss_nis/pull/7]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nis-hosts.c | 55 ++++++++++++-------------------------------------
- 1 file changed, 13 insertions(+), 42 deletions(-)
-
-diff --git a/src/nis-hosts.c b/src/nis-hosts.c
-index 307b46e..bd3c4ad 100644
---- a/src/nis-hosts.c
-+++ b/src/nis-hosts.c
-@@ -35,15 +35,12 @@
- #include "libc-lock.h"
- #include "nss-nis.h"
- 
--/* Get implementation for some internal functions. */
--#include "mapv4v6addr.h"
--
- #define ENTNAME         hostent
- #define DATABASE        "hosts"
- #define NEED_H_ERRNO
- 
--#define EXTRA_ARGS      , af, flags
--#define EXTRA_ARGS_DECL , int af, int flags
-+#define EXTRA_ARGS      , af
-+#define EXTRA_ARGS_DECL , int af
- 
- #define ENTDATA hostent_data
- struct hostent_data
-@@ -67,19 +64,8 @@ LINE_PARSER
-    /* Parse address.  */
-    if (af != AF_INET6 && inet_pton (AF_INET, addr, entdata->host_addr) > 0)
-      {
--       assert ((flags & AI_V4MAPPED) == 0 || af != AF_UNSPEC);
--       if (flags & AI_V4MAPPED)
--	 {
--	   map_v4v6_address ((char *) entdata->host_addr,
--			     (char *) entdata->host_addr);
--	   result->h_addrtype = AF_INET6;
--	   result->h_length = IN6ADDRSZ;
--	 }
--       else
--	 {
--	   result->h_addrtype = AF_INET;
--	   result->h_length = INADDRSZ;
--	 }
-+       result->h_addrtype = AF_INET;
-+       result->h_length = INADDRSZ;
-      }
-    else if (af != AF_INET
- 	    && inet_pton (AF_INET6, addr, entdata->host_addr) > 0)
-@@ -134,7 +120,7 @@ strong_alias (_nss_nis_sethostent, _nss_nis_endhostent)
- static enum nss_status
- internal_nis_gethostent_r (struct hostent *host, char *buffer,
- 			   size_t buflen, int *errnop, int *h_errnop,
--			   int af, int flags)
-+			   int af)
- {
-   char *domain;
-   if (yp_get_default_domain (&domain))
-@@ -203,7 +189,7 @@ internal_nis_gethostent_r (struct hostent *host, char *buffer,
- 	++p;
-       free (result);
- 
--      parse_res = parse_line (p, host, data, buflen, errnop, af, flags);
-+      parse_res = parse_line (p, host, data, buflen, errnop, af);
-       if (parse_res == -1)
- 	{
- 	  free (outkey);
-@@ -232,8 +218,7 @@ _nss_nis_gethostent_r (struct hostent *host, char *buffer, size_t buflen,
-   __libc_lock_lock (lock);
- 
-   status = internal_nis_gethostent_r (host, buffer, buflen, errnop, h_errnop,
--			((_res.options & RES_USE_INET6) ? AF_INET6 : AF_INET),
--			((_res.options & RES_USE_INET6) ? AI_V4MAPPED : 0 ));
-+			AF_INET);
- 
-   __libc_lock_unlock (lock);
- 
-@@ -244,7 +229,7 @@ _nss_nis_gethostent_r (struct hostent *host, char *buffer, size_t buflen,
- static enum nss_status
- internal_gethostbyname2_r (const char *name, int af, struct hostent *host,
- 			   char *buffer, size_t buflen, int *errnop,
--			   int *h_errnop, int flags)
-+			   int *h_errnop)
- {
-   uintptr_t pad = -(uintptr_t) buffer % __alignof__ (struct parser_data);
-   buffer += pad;
-@@ -318,7 +303,7 @@ internal_gethostbyname2_r (const char *name, int af, struct hostent *host,
-     ++p;
-   free (result);
- 
--  int parse_res = parse_line (p, host, data, buflen, errnop, af, flags);
-+  int parse_res = parse_line (p, host, data, buflen, errnop, af);
- 
-   if (parse_res < 1 || host->h_addrtype != af)
-     {
-@@ -351,8 +336,7 @@ _nss_nis_gethostbyname2_r (const char *name, int af, struct hostent *host,
-     }
- 
-   return internal_gethostbyname2_r (name, af, host, buffer, buflen, errnop,
--				    h_errnop,
--			((_res.options & RES_USE_INET6) ? AI_V4MAPPED : 0));
-+				    h_errnop);
- }
- 
- 
-@@ -360,18 +344,8 @@ enum nss_status
- _nss_nis_gethostbyname_r (const char *name, struct hostent *host, char *buffer,
- 			  size_t buflen, int *errnop, int *h_errnop)
- {
--  if (_res.options & RES_USE_INET6)
--    {
--      enum nss_status status;
--
--      status = internal_gethostbyname2_r (name, AF_INET6, host, buffer, buflen,
--					  errnop, h_errnop, AI_V4MAPPED);
--      if (status == NSS_STATUS_SUCCESS)
--	return status;
--    }
--
-   return internal_gethostbyname2_r (name, AF_INET, host, buffer, buflen,
--				    errnop, h_errnop, 0);
-+				    errnop, h_errnop);
- }
- 
- 
-@@ -433,9 +407,7 @@ _nss_nis_gethostbyaddr_r (const void *addr, socklen_t addrlen, int af,
-     ++p;
-   free (result);
- 
--  int parse_res = parse_line (p, host, data, buflen, errnop, af,
--			      ((_res.options & RES_USE_INET6)
--			       ? AI_V4MAPPED : 0));
-+  int parse_res = parse_line (p, host, data, buflen, errnop, af);
-   if (parse_res < 1)
-     {
-       if (parse_res == -1)
-@@ -532,8 +504,7 @@ _nss_nis_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
-   buflen -= pad;
- 
-   struct hostent host;
--  int parse_res = parse_line (result, &host, data, buflen, errnop, AF_UNSPEC,
--			      0);
-+  int parse_res = parse_line (result, &host, data, buflen, errnop, AF_UNSPEC);
-   if (parse_res < 1)
-     {
-       if (parse_res == -1)
--- 
-2.22.0
-
-- 
2.7.4




