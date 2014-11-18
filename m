Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 23CA07210C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:19:06 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id p10so4317985pdj.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mCHinLwhob64rHaYi9aHplEky9M2xtlA236xmEJmcDE=;
	b=Q/pZ/Xj9yqfPVuSNyRgJBfdSLmdiu11ZGVGMNgZdzD0pXHqluadQqG8EE8NNMTRDxz
	Qf4zbc1zPSvdO7TKwiq7DVo8rhywfVNPqD1E9w1zV3jMD3z3I2zBeZsTqYP2qI+bAa+t
	Linqmu7yI7WQOP5TQtk6rVznoYfdfhGgAPTlIe9gbNdYDjg7PQJGyT2jRMwTY2z0CLc2
	ZAWonEs4zCR46uDsEO8EiYbvYWzcIC3Gva/7r1Hj+J8XrlOt1m3Qm/kER1HZnegUXZSX
	OQ85zhESYB+ZvnAFf/rsHSjNk0YB7S018NJxSdF+R+Jscp077GEUbB6geSrpg56TWGIG
	8wMQ==
X-Received: by 10.69.31.138 with SMTP id km10mr38650118pbd.6.1416327546846;
	Tue, 18 Nov 2014 08:19:06 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ex4sm38470695pdb.17.2014.11.18.08.19.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Nov 2014 08:19:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Nov 2014 08:18:28 -0800
Message-Id: <126a4734b767f0a73b764c0759f2964e5652c63e.1416241492.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
Subject: [PATCH 3/6] curl: Security Advisory - curl - CVE-2014-3620
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
X-List-Received-Date: Tue, 18 Nov 2014 16:19:07 -0000

From: Chong Lu <Chong.Lu@windriver.com>

libcurl wrongly allows cookies to be set for Top Level Domains (TLDs), thus
making them apply broader than cookies are allowed. This can allow arbitrary
sites to set cookies that then would get sent to a different and unrelated site
or domain.

(From OE-Core rev: ddbaade8afbc9767583728bfdc220639203d6853)

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2014-3620.patch | 69 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2014-3620.patch b/meta/recipes-support/curl/curl/CVE-2014-3620.patch
new file mode 100644
index 0000000..d11f190
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2014-3620.patch
@@ -0,0 +1,69 @@
+From fd7ae600adf23a9a1ed619165c5058bdec216e9c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 19 Aug 2014 21:11:20 +0200
+Subject: [PATCH] cookies: reject incoming cookies set for TLDs
+
+Test 61 was modified to verify this.
+
+CVE-2014-3620
+
+Reported-by: Tim Ruehsen
+URL: http://curl.haxx.se/docs/adv_20140910B.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
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
index 1147675..8b854d7 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
            file://CVE-2014-3613.patch \
+           file://CVE-2014-3620.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.9.1


