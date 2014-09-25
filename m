Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4B7C2617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:36:38 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 13:36:38 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id DACFA2884E9;
	Thu, 25 Sep 2014 13:36:38 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Sep 2014 13:36:30 +0200
Message-ID: <1411644990-20122-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Thu, 25 Sep 2014 11:36:41 -0000
Content-Type: text/plain

Details of vulnerabilities are available below:
CVE-2014-3613: http://curl.haxx.se/docs/adv_20140910A.html
CVE-2014-3620: http://curl.haxx.se/docs/adv_20140910B.html

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |  73 ++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   2 +
 3 files changed, 344 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2014-3613.patch b/meta/recipes-support/curl/curl/CVE-2014-3613.patch
new file mode 100644
index 0000000..34c3236
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3613.patch
@@ -0,0 +1,269 @@
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
+ lib/cookie.c        | 50 ++++++++++++++++++++++++++++++++++++++----------
+ tests/data/test1105 |  3 +--
+ tests/data/test31   | 55 +++++++++++++++++++++++++++--------------------------
+ tests/data/test8    |  3 ++-
+ 4 files changed, 71 insertions(+), 40 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0590643..46904ac 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -93,10 +93,11 @@ Example set of cookies:
+ #include "curl_memory.h"
+ #include "share.h"
+ #include "strtoofft.h"
+ #include "rawstr.h"
+ #include "curl_memrchr.h"
++#include "inet_pton.h"
+ 
+ /* The last #include file should be: */
+ #include "memdebug.h"
+ 
+ static void freecookie(struct Cookie *co)
+@@ -317,10 +318,32 @@ static void remove_expired(struct CookieInfo *cookies)
+     }
+     co = nx;
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
+  *
+  * Add a single cookie line to the cookie keeping object.
+@@ -437,28 +460,31 @@ Curl_cookie_add(struct SessionHandle *data,
+             badcookie = TRUE; /* out of memory bad */
+             break;
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
+                is not a domain to which the current host belongs. Mark as
+                bad. */
+@@ -966,17 +992,21 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+   struct Cookie *newco;
+   struct Cookie *co;
+   time_t now = time(NULL);
+   struct Cookie *mainco=NULL;
+   size_t matches = 0;
++  bool is_ip;
+ 
+   if(!c || !c->cookies)
+     return NULL; /* no cookie struct or no cookies in the struct */
+ 
+   /* at first, remove expired cookies */
+   remove_expired(c);
+ 
++  /* check if host is an IP(v4|v6) address */
++  is_ip = isip(host);
++
+   co = c->cookies;
+ 
+   while(co) {
+     /* only process this cookie if it is not expired or had no expire
+        date AND that if the cookie requires we're secure we must only
+@@ -984,12 +1014,12 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+     if((!co->expires || (co->expires > now)) &&
+        (co->secure?secure:TRUE)) {
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
+         /* now check the left part of the path with the cookies path
+            requirement */
+diff --git a/tests/data/test1105 b/tests/data/test1105
+index 25f194c..9564775 100644
+--- a/tests/data/test1105
++++ b/tests/data/test1105
+@@ -57,10 +57,9 @@ userid=myname&password=mypassword
+ # Netscape HTTP Cookie File
+ # http://curl.haxx.se/docs/http-cookies.html
+ # This file was generated by libcurl! Edit at your own risk.
+ 
+ 127.0.0.1	FALSE	/we/want/	FALSE	0	foobar	name
+-.127.0.0.1	TRUE	"/silly/"	FALSE	0	mismatch	this
+-.0.0.1	TRUE	/	FALSE	0	partmatch	present
++127.0.0.1	FALSE	"/silly/"	FALSE	0	mismatch	this
+ </file>
+ </verify>
+ </testcase>
+diff --git a/tests/data/test31 b/tests/data/test31
+index 38af83b..dfcac04 100644
+--- a/tests/data/test31
++++ b/tests/data/test31
+@@ -49,11 +49,12 @@ Set-Cookie: nodomainnovalue
+ Set-Cookie:   nodomain=value; expires=Fri Feb 2 11:56:27 GMT 2035
+ Set-Cookie: novalue; domain=reallysilly
+ Set-Cookie: test=yes; domain=foo.com; expires=Sat Feb 2 11:56:27 GMT 2030
+ Set-Cookie: test2=yes; domain=se; expires=Sat Feb 2 11:56:27 GMT 2030
+ Set-Cookie: magic=yessir; path=/silly/; HttpOnly
+-Set-Cookie: blexp=yesyes; domain=.0.0.1; domain=.0.0.1; expiry=totally bad;
++Set-Cookie: blexp=yesyes; domain=127.0.0.1; domain=127.0.0.1; expiry=totally bad;
++Set-Cookie: partialip=nono; domain=.0.0.1;
+ 
+ boo
+ </data>
+ </reply>
+ 
+@@ -93,36 +94,36 @@ Accept: */*
+ <file name="log/jar31.txt" mode="text">
+ # Netscape HTTP Cookie File
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
+diff --git a/tests/data/test8 b/tests/data/test8
+index 4d54541..030fd55 100644
+--- a/tests/data/test8
++++ b/tests/data/test8
+@@ -40,11 +40,12 @@ Set-Cookie: mismatch=this; domain=%HOSTIP; path="/silly/";
+ Set-Cookie: partmatch=present; domain=.0.0.1; path=/w;
+ Set-Cookie: duplicate=test; domain=.0.0.1; domain=.0.0.1; path=/donkey;
+ Set-Cookie: cookie=yes; path=/we;
+ Set-Cookie: cookie=perhaps; path=/we/want;
+ Set-Cookie: nocookie=yes; path=/WE;
+-Set-Cookie: blexp=yesyes; domain=.0.0.1; domain=.0.0.1; expiry=totally bad;
++Set-Cookie: blexp=yesyes; domain=%HOSTIP; domain=%HOSTIP; expiry=totally bad;
++Set-Cookie: partialip=nono; domain=.0.0.1;
+ 
+ </file>
+ <precheck>
+ perl -e 'if ("%HOSTIP" !~ /\.0\.0\.1$/) {print "Test only works for HOSTIPs ending with .0.0.1"; exit(1)}'
+ </precheck>
+-- 
+2.1.0
+
diff --git a/meta/recipes-support/curl/curl/CVE-2014-3620.patch b/meta/recipes-support/curl/curl/CVE-2014-3620.patch
new file mode 100644
index 0000000..692bb33
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3620.patch
@@ -0,0 +1,73 @@
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
+ lib/cookie.c      | 6 ++++++
+ tests/data/test61 | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 46904ac..375485f 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -461,19 +461,25 @@ Curl_cookie_add(struct SessionHandle *data,
+             break;
+           }
+         }
+         else if(Curl_raw_equal("domain", name)) {
+           bool is_ip;
++          const char *dotp;
+ 
+           /* Now, we make sure that our host is within the given domain,
+              or the given domain is not valid and thus cannot be set. */
+ 
+           if('.' == whatptr[0])
+             whatptr++; /* ignore preceding dot */
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
+             strstore(&co->domain, whatptr);
+             if(!co->domain) {
+diff --git a/tests/data/test61 b/tests/data/test61
+index d2de279..e6dbbb9 100644
+--- a/tests/data/test61
++++ b/tests/data/test61
+@@ -21,10 +21,11 @@ Set-Cookie: test=yes; httponly; domain=foo.com; expires=Fri Feb 2 11:56:27 GMT 2
+ SET-COOKIE: test2=yes; domain=host.foo.com; expires=Fri Feb 2 11:56:27 GMT 2035
+ Set-Cookie: test3=maybe; domain=foo.com; path=/moo; secure
+ Set-Cookie: test4=no; domain=nope.foo.com; path=/moo; secure
+ Set-Cookie: test5=name; domain=anything.com; path=/ ; secure
+ Set-Cookie: fake=fooledyou; domain=..com; path=/;
++Set-Cookie: supercookie=fooledyou; domain=.com; path=/;^M
+ Content-Length: 4
+ 
+ boo
+ </data>
+ </reply>
+-- 
+2.1.0
+
diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index 8bcd9ba..94a17c6 100644
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


