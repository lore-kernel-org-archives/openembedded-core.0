Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 40BD97D088
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 17:15:18 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x15so14725430pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oepCRfGUZCzGdbvEz9QSP8IVN6Gk7OF+de6fAW35p7s=;
	b=BwlfJ08avA7iyHxqscvOr1G7cmZQy7Vu7JIPgualEMGAk6M4Rk7S4I+mRXbAy2sExG
	Kr8Uwvc3PLXaea67hqQ2GaJRClsWSMgFd40E0zW7FBrySNLzpugi5OhZ8H4x7bVnPgZM
	athKimvpFu1FbmczVehXe7ca25wLzoIj/f/mj5JCCr3q4oR6KWnJ0cm+JF6HqtcvZofh
	7UQZsUWnkGLwWYpx7MGTl3pEFsM4Ov4vyEVOXuVpZBOl0LXJWSu1Cq+GkFvCgirmWmYx
	s43nsgO3e6je2GNA/pc3dQJASDahj+cX2y4HeXWQeliM0iq6bX5sYCsOX+FeCyLxMFlT
	/Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oepCRfGUZCzGdbvEz9QSP8IVN6Gk7OF+de6fAW35p7s=;
	b=hQJ+Xb4SN9o51QThgva8ywXJWx5uFSMhIYeke7IV51QMhWh+KzbI8jvZMnYlPEufLA
	KCb4l9/w6ttCn8rwzuqo9DLuWXi+QhoRGT0e+3IZq0eODkXyfBOfMG2BNTeY56OH+08V
	7+pHbl5Q/h2tZ5chFvMuJ5LrjkX5/T8Az3qv56R178qTiF8ZoOc2BuQJ9z1RbLor5TxG
	UE1I0EN2zqNfn7BVwT76hAGaCvXwfCiAu3pihGP837r8naC/9Rph/D/N1XPSZ4mQHFmy
	BnQjZ6zaVr+2Ap/YekV8px83QQOk34Gi7j1R7VxqW5B2gZxW6meBZnP+d+LitUDGpgmJ
	Amow==
X-Gm-Message-State: APjAAAXvt7lkT02H95HQHx2N6UHW8vmQntJUv4Eo4Xg6OQbXBJfPOgQ1
	TJBDt+XxgY1p5zMHtm2VctqaQB4LzoQ=
X-Google-Smtp-Source: APXvYqy0Jfo7xKaNLY2qaO88seCq93HaOndfUAqrp09oORv61QMJP7oCm20Hqnfa4N+KoMuQ+poSYA==
X-Received: by 2002:a63:745e:: with SMTP id e30mr2820098pgn.73.1564161318705; 
	Fri, 26 Jul 2019 10:15:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p67sm62533159pfg.124.2019.07.26.10.15.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 10:15:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 10:15:08 -0700
Message-Id: <20190726171509.29091-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] libnss-nis: Fix build with glibc 2.30
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
X-List-Received-Date: Fri, 26 Jul 2019 17:15:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/libnss-nis/libnss-nis.bb |   1 +
 ...is-hosts-Remove-use-of-RES_USE_INET6.patch | 162 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index 47447acd6c..4fbd4b1f6a 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -18,6 +18,7 @@ PV = "3.0+git${SRCPV}"
 SRCREV = "d4aea48657a8e90d7922574b8021ee03915a36cb"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis \
+           file://0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch b/meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
new file mode 100644
index 0000000000..348c8c94b6
--- /dev/null
+++ b/meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
@@ -0,0 +1,162 @@
+From e41ddbd89a4bb042ac00469fa5880ba584c25c05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 25 Jul 2019 12:10:56 -0700
+Subject: [PATCH] nis-hosts: Remove use of RES_USE_INET6
+
+Upstream glibc dropped it starting glibc 2.30
+see
+https://sourceware.org/git/?p=glibc.git;a=commit;h=3f8b44be0a658266adff5ece1e4bc3ce097a5dbe
+
+Fixes issue #6
+
+Upstream-Status: Submitted [https://github.com/thkukuk/libnss_nis/pull/7]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nis-hosts.c | 55 ++++++++++++-------------------------------------
+ 1 file changed, 13 insertions(+), 42 deletions(-)
+
+diff --git a/src/nis-hosts.c b/src/nis-hosts.c
+index 307b46e..bd3c4ad 100644
+--- a/src/nis-hosts.c
++++ b/src/nis-hosts.c
+@@ -35,15 +35,12 @@
+ #include "libc-lock.h"
+ #include "nss-nis.h"
+ 
+-/* Get implementation for some internal functions. */
+-#include "mapv4v6addr.h"
+-
+ #define ENTNAME         hostent
+ #define DATABASE        "hosts"
+ #define NEED_H_ERRNO
+ 
+-#define EXTRA_ARGS      , af, flags
+-#define EXTRA_ARGS_DECL , int af, int flags
++#define EXTRA_ARGS      , af
++#define EXTRA_ARGS_DECL , int af
+ 
+ #define ENTDATA hostent_data
+ struct hostent_data
+@@ -67,19 +64,8 @@ LINE_PARSER
+    /* Parse address.  */
+    if (af != AF_INET6 && inet_pton (AF_INET, addr, entdata->host_addr) > 0)
+      {
+-       assert ((flags & AI_V4MAPPED) == 0 || af != AF_UNSPEC);
+-       if (flags & AI_V4MAPPED)
+-	 {
+-	   map_v4v6_address ((char *) entdata->host_addr,
+-			     (char *) entdata->host_addr);
+-	   result->h_addrtype = AF_INET6;
+-	   result->h_length = IN6ADDRSZ;
+-	 }
+-       else
+-	 {
+-	   result->h_addrtype = AF_INET;
+-	   result->h_length = INADDRSZ;
+-	 }
++       result->h_addrtype = AF_INET;
++       result->h_length = INADDRSZ;
+      }
+    else if (af != AF_INET
+ 	    && inet_pton (AF_INET6, addr, entdata->host_addr) > 0)
+@@ -134,7 +120,7 @@ strong_alias (_nss_nis_sethostent, _nss_nis_endhostent)
+ static enum nss_status
+ internal_nis_gethostent_r (struct hostent *host, char *buffer,
+ 			   size_t buflen, int *errnop, int *h_errnop,
+-			   int af, int flags)
++			   int af)
+ {
+   char *domain;
+   if (yp_get_default_domain (&domain))
+@@ -203,7 +189,7 @@ internal_nis_gethostent_r (struct hostent *host, char *buffer,
+ 	++p;
+       free (result);
+ 
+-      parse_res = parse_line (p, host, data, buflen, errnop, af, flags);
++      parse_res = parse_line (p, host, data, buflen, errnop, af);
+       if (parse_res == -1)
+ 	{
+ 	  free (outkey);
+@@ -232,8 +218,7 @@ _nss_nis_gethostent_r (struct hostent *host, char *buffer, size_t buflen,
+   __libc_lock_lock (lock);
+ 
+   status = internal_nis_gethostent_r (host, buffer, buflen, errnop, h_errnop,
+-			((_res.options & RES_USE_INET6) ? AF_INET6 : AF_INET),
+-			((_res.options & RES_USE_INET6) ? AI_V4MAPPED : 0 ));
++			AF_INET);
+ 
+   __libc_lock_unlock (lock);
+ 
+@@ -244,7 +229,7 @@ _nss_nis_gethostent_r (struct hostent *host, char *buffer, size_t buflen,
+ static enum nss_status
+ internal_gethostbyname2_r (const char *name, int af, struct hostent *host,
+ 			   char *buffer, size_t buflen, int *errnop,
+-			   int *h_errnop, int flags)
++			   int *h_errnop)
+ {
+   uintptr_t pad = -(uintptr_t) buffer % __alignof__ (struct parser_data);
+   buffer += pad;
+@@ -318,7 +303,7 @@ internal_gethostbyname2_r (const char *name, int af, struct hostent *host,
+     ++p;
+   free (result);
+ 
+-  int parse_res = parse_line (p, host, data, buflen, errnop, af, flags);
++  int parse_res = parse_line (p, host, data, buflen, errnop, af);
+ 
+   if (parse_res < 1 || host->h_addrtype != af)
+     {
+@@ -351,8 +336,7 @@ _nss_nis_gethostbyname2_r (const char *name, int af, struct hostent *host,
+     }
+ 
+   return internal_gethostbyname2_r (name, af, host, buffer, buflen, errnop,
+-				    h_errnop,
+-			((_res.options & RES_USE_INET6) ? AI_V4MAPPED : 0));
++				    h_errnop);
+ }
+ 
+ 
+@@ -360,18 +344,8 @@ enum nss_status
+ _nss_nis_gethostbyname_r (const char *name, struct hostent *host, char *buffer,
+ 			  size_t buflen, int *errnop, int *h_errnop)
+ {
+-  if (_res.options & RES_USE_INET6)
+-    {
+-      enum nss_status status;
+-
+-      status = internal_gethostbyname2_r (name, AF_INET6, host, buffer, buflen,
+-					  errnop, h_errnop, AI_V4MAPPED);
+-      if (status == NSS_STATUS_SUCCESS)
+-	return status;
+-    }
+-
+   return internal_gethostbyname2_r (name, AF_INET, host, buffer, buflen,
+-				    errnop, h_errnop, 0);
++				    errnop, h_errnop);
+ }
+ 
+ 
+@@ -433,9 +407,7 @@ _nss_nis_gethostbyaddr_r (const void *addr, socklen_t addrlen, int af,
+     ++p;
+   free (result);
+ 
+-  int parse_res = parse_line (p, host, data, buflen, errnop, af,
+-			      ((_res.options & RES_USE_INET6)
+-			       ? AI_V4MAPPED : 0));
++  int parse_res = parse_line (p, host, data, buflen, errnop, af);
+   if (parse_res < 1)
+     {
+       if (parse_res == -1)
+@@ -532,8 +504,7 @@ _nss_nis_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
+   buflen -= pad;
+ 
+   struct hostent host;
+-  int parse_res = parse_line (result, &host, data, buflen, errnop, AF_UNSPEC,
+-			      0);
++  int parse_res = parse_line (result, &host, data, buflen, errnop, AF_UNSPEC);
+   if (parse_res < 1)
+     {
+       if (parse_res == -1)
+-- 
+2.22.0
+
-- 
2.22.0


