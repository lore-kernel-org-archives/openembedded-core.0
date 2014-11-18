Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6FF72153
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:19:02 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id z10so6275824pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=D0EL228Lhi06I7enPsANdeE31L2INyIm8+iiGfNuf9k=;
	b=tsGkTzMR03DrCDD0hh+PtxNPZsaUjS1YLJdXT8hcrEJwZgkWKjceMRKEKddORGZCqa
	0+iCSju4vG99zi6KZCo88t3ik8RrCIqcK63oIqh4SH9MKC351gqU9gdGDGMiz0EQPbq+
	T04R4KaBNNI3SqY44osDl1jiXTrF8oFCC5YKguCIBNYfVXIPN+ZwgkERaclI94iva39A
	aLgKO0+euwT8mtofaGFvNArRVC1bUVQLTm1CX5pBuMal/IDzpLZe27LeGZloHEn904xB
	THpac+4mgjOF5cbxxbfsU1Ab5MpFAcVLk/ydPZuC/CbiotwlmDwUaDSBiwJnPuiI7+wB
	WyMQ==
X-Received: by 10.70.63.9 with SMTP id c9mr38496806pds.104.1416327543039;
	Tue, 18 Nov 2014 08:19:03 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ex4sm38470695pdb.17.2014.11.18.08.19.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Nov 2014 08:19:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Nov 2014 08:18:27 -0800
Message-Id: <aaee15e27a6fa1236766d3df0c2ced0370f19c41.1416241492.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
Subject: [PATCH 2/6] curl: Security Advisory - curl - CVE-2014-3613
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
X-List-Received-Date: Tue, 18 Nov 2014 16:19:09 -0000

From: Chong Lu <Chong.Lu@windriver.com>

By not detecting and rejecting domain names for partial literal IP addresses
properly when parsing received HTTP cookies, libcurl can be fooled to both
sending cookies to wrong sites and into allowing arbitrary sites to set cookies
for others.

(From OE-Core rev: 985ef933208da1dd1f17645613ce08e6ad27e2c1)

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   1 +
 2 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2014-3613.patch b/meta/recipes-support/curl/curl/CVE-2014-3613.patch
new file mode 100644
index 0000000..3e2fee0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3613.patch
@@ -0,0 +1,269 @@
+From 545e322cc8c383ccdfb4ad85a1634c2b719a1adf Mon Sep 17 00:00:00 2001
+From: Tim Ruehsen <tim.ruehsen@gmx.de>
+Date: Tue, 19 Aug 2014 21:01:28 +0200
+Subject: [PATCH] cookies: only use full host matches for hosts used as IP
+ address
+
+By not detecting and rejecting domain names for partial literal IP
+addresses properly when parsing received HTTP cookies, libcurl can be
+fooled to both send cookies to wrong sites and to allow arbitrary sites
+to set cookies for others.
+
+CVE-2014-3613
+
+Bug: http://curl.haxx.se/docs/adv_20140910A.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
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
diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index 39ded80..1147675 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
+           file://CVE-2014-3613.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.9.1


