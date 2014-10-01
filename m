Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id F310365F77
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 13:30:20 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Wed, 1 Oct 2014
	15:30:14 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 73C23288D4E;
	Wed,  1 Oct 2014 15:30:14 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Oct 2014 15:29:48 +0200
Message-ID: <1412170188-50070-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH v2] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Wed, 01 Oct 2014 13:30:30 -0000
Content-Type: text/plain

Details of vulnerabilities are available below:
CVE-2014-3613: http://curl.haxx.se/docs/adv_20140910A.html
CVE-2014-3620: http://curl.haxx.se/docs/adv_20140910B.html

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 214 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |  54 ++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   2 +
 3 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2014-3613.patch b/meta/recipes-support/curl/curl/CVE-2014-3613.patch
new file mode 100644
index 0000000..e335826
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3613.patch
@@ -0,0 +1,214 @@
+From 545e322cc8c383ccdfb4ad85a1634c2b719a1adf Mon Sep 17 00:00:00 2001
+From: Tim Ruehsen <tim.ruehsen@gmx.de>
+Date: Tue, 19 Aug 2014 21:01:28 +0200
+Subject: [PATCH] cookies: only use full host matches for hosts used as IP address
+
+By not detecting and rejecting domain names for partial literal IP
+addresses properly when parsing received HTTP cookies, libcurl can be
+fooled to both send cookies to wrong sites and to allow arbitrary sites
+to set cookies for others.
+
+CVE-2014-3613
+
+Upstream-Status: Backport
+
+Bug: http://curl.haxx.se/docs/adv_20140910A.html
+
+Signed-off-by: Tim Ruehsen <tim.ruehsen@gmx.de>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+diff -Naur curl-7.37.1-orig/lib/cookie.c curl-7.37.1/lib/cookie.c
+--- curl-7.37.1-orig/lib/cookie.c	2014-06-11 19:52:29.000000000 +0200
++++ curl-7.37.1/lib/cookie.c	2014-09-30 15:14:50.230809427 +0200
+@@ -95,6 +95,7 @@
+ #include "strtoofft.h"
+ #include "rawstr.h"
+ #include "curl_memrchr.h"
++#include "inet_pton.h"
+ 
+ /* The last #include file should be: */
+ #include "memdebug.h"
+@@ -319,6 +320,28 @@
+   }
+ }
+ 
++/*
++ * Return true if the given string is an IP(v4|v6) address.
++ */
++static bool isip(const char *domain)
++{
++  struct in_addr addr;
++#ifdef ENABLE_IPV6
++  struct in6_addr addr6;
++#endif
++
++  if(Curl_inet_pton(AF_INET, domain, &addr)
++#ifdef ENABLE_IPV6
++     || Curl_inet_pton(AF_INET6, domain, &addr6)
++#endif
++    ) {
++    /* domain name given as IP address */
++    return TRUE;
++  }
++
++  return FALSE;
++}
++
+ /****************************************************************************
+  *
+  * Curl_cookie_add()
+@@ -439,24 +462,27 @@
+           }
+         }
+         else if(Curl_raw_equal("domain", name)) {
++          bool is_ip;
++
+           /* Now, we make sure that our host is within the given domain,
+              or the given domain is not valid and thus cannot be set. */
+ 
+           if('.' == whatptr[0])
+             whatptr++; /* ignore preceding dot */
+ 
+-          if(!domain || tailmatch(whatptr, domain)) {
+-            const char *tailptr=whatptr;
+-            if(tailptr[0] == '.')
+-              tailptr++;
+-            strstore(&co->domain, tailptr); /* don't prefix w/dots
+-                                               internally */
++          is_ip = isip(domain ? domain : whatptr);
++
++          if(!domain
++             || (is_ip && !strcmp(whatptr, domain))
++             || (!is_ip && tailmatch(whatptr, domain))) {
++            strstore(&co->domain, whatptr);
+             if(!co->domain) {
+               badcookie = TRUE;
+               break;
+             }
+-            co->tailmatch=TRUE; /* we always do that if the domain name was
+-                                   given */
++            if(!is_ip)
++              co->tailmatch=TRUE; /* we always do that if the domain name was
++                                     given */
+           }
+           else {
+             /* we did not get a tailmatch and then the attempted set domain
+@@ -968,6 +994,7 @@
+   time_t now = time(NULL);
+   struct Cookie *mainco=NULL;
+   size_t matches = 0;
++  bool is_ip;
+ 
+   if(!c || !c->cookies)
+     return NULL; /* no cookie struct or no cookies in the struct */
+@@ -975,6 +1002,9 @@
+   /* at first, remove expired cookies */
+   remove_expired(c);
+ 
++  /* check if host is an IP(v4|v6) address */
++  is_ip = isip(host);
++
+   co = c->cookies;
+ 
+   while(co) {
+@@ -986,8 +1016,8 @@
+ 
+       /* now check if the domain is correct */
+       if(!co->domain ||
+-         (co->tailmatch && tailmatch(co->domain, host)) ||
+-         (!co->tailmatch && Curl_raw_equal(host, co->domain)) ) {
++         (co->tailmatch && !is_ip && tailmatch(co->domain, host)) ||
++         ((!co->tailmatch || is_ip) && Curl_raw_equal(host, co->domain)) ) {
+         /* the right part of the host matches the domain stuff in the
+            cookie data */
+ 
+diff -Naur curl-7.37.1-orig/tests/data/test1105 curl-7.37.1/tests/data/test1105
+--- curl-7.37.1-orig/tests/data/test1105	2014-06-11 19:52:29.000000000 +0200
++++ curl-7.37.1/tests/data/test1105	2014-09-30 15:14:50.230809427 +0200
+@@ -59,8 +59,7 @@
+ # This file was generated by libcurl! Edit at your own risk.
+ 
+ 127.0.0.1	FALSE	/we/want/	FALSE	0	foobar	name
+-.127.0.0.1	TRUE	"/silly/"	FALSE	0	mismatch	this
+-.0.0.1	TRUE	/	FALSE	0	partmatch	present
++127.0.0.1	FALSE	"/silly/"	FALSE	0	mismatch	this
+ </file>
+ </verify>
+ </testcase>
+diff -Naur curl-7.37.1-orig/tests/data/test31 curl-7.37.1/tests/data/test31
+--- curl-7.37.1-orig/tests/data/test31	2014-06-11 19:52:30.000000000 +0200
++++ curl-7.37.1/tests/data/test31	2014-09-30 15:14:50.234809255 +0200
+@@ -95,34 +95,34 @@
+ # http://curl.haxx.se/docs/http-cookies.html
+ # This file was generated by libcurl! Edit at your own risk.
+ 
+-.127.0.0.1	TRUE	/silly/	FALSE	0	ismatch	this
+-.127.0.0.1	TRUE	/overwrite	FALSE	0	overwrite	this2
+-.127.0.0.1	TRUE	/secure1/	TRUE	0	sec1value	secure1
+-.127.0.0.1	TRUE	/secure2/	TRUE	0	sec2value	secure2
+-.127.0.0.1	TRUE	/secure3/	TRUE	0	sec3value	secure3
+-.127.0.0.1	TRUE	/secure4/	TRUE	0	sec4value	secure4
+-.127.0.0.1	TRUE	/secure5/	TRUE	0	sec5value	secure5
+-.127.0.0.1	TRUE	/secure6/	TRUE	0	sec6value	secure6
+-.127.0.0.1	TRUE	/secure7/	TRUE	0	sec7value	secure7
+-.127.0.0.1	TRUE	/secure8/	TRUE	0	sec8value	secure8
+-.127.0.0.1	TRUE	/secure9/	TRUE	0	secure	very1
+-#HttpOnly_.127.0.0.1	TRUE	/p1/	FALSE	0	httpo1	value1
+-#HttpOnly_.127.0.0.1	TRUE	/p2/	FALSE	0	httpo2	value2
+-#HttpOnly_.127.0.0.1	TRUE	/p3/	FALSE	0	httpo3	value3
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	FALSE	0	httpo4	value4
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	FALSE	0	httponly	myvalue1
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec	myvalue2
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec2	myvalue3
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec3	myvalue4
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec4	myvalue5
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec5	myvalue6
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec6	myvalue7
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec7	myvalue8
+-#HttpOnly_.127.0.0.1	TRUE	/p4/	TRUE	0	httpandsec8	myvalue9
+-.127.0.0.1	TRUE	/	FALSE	0	partmatch	present
++127.0.0.1	FALSE	/silly/	FALSE	0	ismatch	this
++127.0.0.1	FALSE	/overwrite	FALSE	0	overwrite	this2
++127.0.0.1	FALSE	/secure1/	TRUE	0	sec1value	secure1
++127.0.0.1	FALSE	/secure2/	TRUE	0	sec2value	secure2
++127.0.0.1	FALSE	/secure3/	TRUE	0	sec3value	secure3
++127.0.0.1	FALSE	/secure4/	TRUE	0	sec4value	secure4
++127.0.0.1	FALSE	/secure5/	TRUE	0	sec5value	secure5
++127.0.0.1	FALSE	/secure6/	TRUE	0	sec6value	secure6
++127.0.0.1	FALSE	/secure7/	TRUE	0	sec7value	secure7
++127.0.0.1	FALSE	/secure8/	TRUE	0	sec8value	secure8
++127.0.0.1	FALSE	/secure9/	TRUE	0	secure	very1
++#HttpOnly_127.0.0.1	FALSE	/p1/	FALSE	0	httpo1	value1
++#HttpOnly_127.0.0.1	FALSE	/p2/	FALSE	0	httpo2	value2
++#HttpOnly_127.0.0.1	FALSE	/p3/	FALSE	0	httpo3	value3
++#HttpOnly_127.0.0.1	FALSE	/p4/	FALSE	0	httpo4	value4
++#HttpOnly_127.0.0.1	FALSE	/p4/	FALSE	0	httponly	myvalue1
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec	myvalue2
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec2	myvalue3
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec3	myvalue4
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec4	myvalue5
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec5	myvalue6
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec6	myvalue7
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec7	myvalue8
++#HttpOnly_127.0.0.1	FALSE	/p4/	TRUE	0	httpandsec8	myvalue9
++127.0.0.1	FALSE	/	FALSE	0	partmatch	present
+ 127.0.0.1	FALSE	/we/want/	FALSE	2054030187	nodomain	value
+ #HttpOnly_127.0.0.1	FALSE	/silly/	FALSE	0	magic	yessir
+-.0.0.1	TRUE	/we/want/	FALSE	0	blexp	yesyes
++127.0.0.1	FALSE	/we/want/	FALSE	0	blexp	yesyes
+ </file>
+ </verify>
+ </testcase>
+diff -Naur curl-7.37.1-orig/tests/data/test8 curl-7.37.1/tests/data/test8
+--- curl-7.37.1-orig/tests/data/test8	2014-06-11 19:52:30.000000000 +0200
++++ curl-7.37.1/tests/data/test8	2014-09-30 15:14:50.234809255 +0200
+@@ -42,7 +42,8 @@
+ Set-Cookie: cookie=yes; path=/we;
+ Set-Cookie: cookie=perhaps; path=/we/want;
+ Set-Cookie: nocookie=yes; path=/WE;
+-Set-Cookie: blexp=yesyes; domain=.0.0.1; domain=.0.0.1; expiry=totally bad;
++Set-Cookie: blexp=yesyes; domain=%HOSTIP; domain=%HOSTIP; expiry=totally bad;
++Set-Cookie: partialip=nono; domain=.0.0.1;
+ 
+ </file>
+ <precheck>
diff --git a/meta/recipes-support/curl/curl/CVE-2014-3620.patch b/meta/recipes-support/curl/curl/CVE-2014-3620.patch
new file mode 100644
index 0000000..d8cb719
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3620.patch
@@ -0,0 +1,54 @@
+From fd7ae600adf23a9a1ed619165c5058bdec216e9c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 19 Aug 2014 21:11:20 +0200
+Subject: [PATCH] cookies: reject incoming cookies set for TLDs
+
+libcurl wrongly allows cookies to be set for Top Level Domains (TLDs), thus
+making them apply broader than cookies are allowed. This can allow arbitrary
+sites to set cookies that then would get sent to a different and unrelated
+site or domain.
+
+CVE-2014-3620
+
+Upstream-Status: Backport
+
+URL: http://curl.haxx.se/docs/adv_20140910B.html
+
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Reported-by: Tim Ruehsen <tim.ruehsen@gmx.de>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+diff -Naur curl-7.37.1-origin/lib/cookie.c curl-7.37.1/lib/cookie.c
+--- curl-7.37.1-origin/lib/cookie.c	2014-09-30 17:21:20.305412353 +0200
++++ curl-7.37.1/lib/cookie.c	2014-09-30 17:22:24.474668328 +0200
+@@ -463,6 +463,7 @@
+         }
+         else if(Curl_raw_equal("domain", name)) {
+           bool is_ip;
++          const char *dotp;
+ 
+           /* Now, we make sure that our host is within the given domain,
+              or the given domain is not valid and thus cannot be set. */
+@@ -472,6 +473,11 @@
+ 
+           is_ip = isip(domain ? domain : whatptr);
+ 
++          /* check for more dots */
++          dotp = strchr(whatptr, '.');
++          if(!dotp)
++            domain=":";
++
+           if(!domain
+              || (is_ip && !strcmp(whatptr, domain))
+              || (!is_ip && tailmatch(whatptr, domain))) {
+diff -Naur curl-7.37.1-origin/tests/data/test61 curl-7.37.1/tests/data/test61
+--- curl-7.37.1-origin/tests/data/test61	2014-06-11 19:52:30.000000000 +0200
++++ curl-7.37.1/tests/data/test61	2014-09-30 17:23:35.171645055 +0200
+@@ -23,6 +23,7 @@
+ Set-Cookie: test4=no; domain=nope.foo.com; path=/moo; secure
+ Set-Cookie: test5=name; domain=anything.com; path=/ ; secure
+ Set-Cookie: fake=fooledyou; domain=..com; path=/;
++Set-Cookie: supercookie=fooledyou; domain=.com; path=/;
+ Content-Length: 4
+ 
+ boo
diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index e2852e3..0f4aab9 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
+           file://CVE-2014-3613.patch \
+           file://CVE-2014-3620.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.9.1


