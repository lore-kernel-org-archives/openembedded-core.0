Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCDCC65C87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 09:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA39VRdx011959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 01:31:27 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 3 Nov 2014 01:31:26 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Nov 2014 17:31:25 +0800
Message-ID: <1415007085-2342-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] curl: Security Advisory - curl - CVE-2014-3620
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
X-List-Received-Date: Mon, 03 Nov 2014 09:31:28 -0000
Content-Type: text/plain

libcurl wrongly allows cookies to be set for Top Level Domains (TLDs), thus
making them apply broader than cookies are allowed. This can allow arbitrary
sites to set cookies that then would get sent to a different and unrelated site
or domain.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |   69 ++++++++++++++++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |    1 +
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
1.7.9.5


