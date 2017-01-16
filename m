Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.38])
	by mail.openembedded.org (Postfix) with ESMTP id EE06B700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:30:04 +0000 (UTC)
Received: from 1cT0nr-00065x-U6 by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cT0nr-00066p-VL
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jan 2017 22:30:03 -0800
Received: by emcmailer; Sun, 15 Jan 2017 22:30:03 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cT0nr-00065x-U6
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jan 2017 22:30:03 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Mon, 16 Jan 2017 07:30:03 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2017 07:30:00 +0100
Message-ID: <1484548200-47494-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][krogoth] expat: CVE-2012-6702, CVE-2016-5300
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
X-List-Received-Date: Mon, 16 Jan 2017 06:30:06 -0000
Content-Type: text/plain

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-5300
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2012-6702
http://www.openwall.com/lists/oss-security/2016/06/04/5

Reference to upstream fix:
https://bugzilla.redhat.com/attachment.cgi?id=1165210
Squashed backport against vanilla Expat 2.1.1, addressing:
* CVE-2012-6702 -- unanticipated internal calls to srand
* CVE-2016-5300 -- use of too little entropy

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch  | 123 +++++++++++++++++++++
 meta/recipes-core/expat/expat_2.1.0.bb             |   4 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch

diff --git a/meta/recipes-core/expat/expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch b/meta/recipes-core/expat/expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch
new file mode 100644
index 0000000..00cc731
--- /dev/null
+++ b/meta/recipes-core/expat/expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch
@@ -0,0 +1,123 @@
+From cb31522769d11a375078a073cba94e7176cb48a4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 16 Mar 2016 15:30:12 +0100
+Subject: [PATCH] Resolve call to srand, use more entropy (patch version 1.0)
+
+Squashed backport against vanilla Expat 2.1.1, addressing:
+* CVE-2012-6702 -- unanticipated internal calls to srand
+* CVE-2016-5300 -- use of too little entropy
+
+Since commit e3e81a6d9f0885ea02d3979151c358f314bf3d6d
+(released with Expat 2.1.0) Expat called srand by itself
+from inside generate_hash_secret_salt for an instance
+of XML_Parser if XML_SetHashSalt was either (a) not called
+for that instance or if (b) salt 0 was passed to XML_SetHashSalt
+prior to parsing.  That call to srand passed (rather litle)
+entropy extracted from the current time as a seed for srand.
+
+That call to srand (1) broke repeatability for code calling
+srand with a non-random seed prior to parsing with Expat,
+and (2) resulted in a rather small set of hashing salts in
+Expat in total.
+
+For a short- to mid-term fix, the new approach avoids calling
+srand altogether, extracts more entropy out of the clock and
+other sources, too.
+
+For a long term fix, we may want to read sizeof(long) bytes
+from a source like getrandom(..) on Linux, and from similar
+sources on other supported architectures.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1197087
+
+CVE: CVE-2012-6702
+CVE: CVE-2016-5300
+Upstream-Status: Backport
+
+Removed changes from CMakeLists.txt from original patch, since that code is
+not part of fix for these CVEs.
+Reference to the commit for CMakeLists.txt changes:
+https://sourceforge.net/p/expat/code_git/ci/37f7efb878660d55ff5fd67ad2cda1c103297df6
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -Nurp a/lib/xmlparse.c b/lib/xmlparse.c
+--- a/lib/xmlparse.c	2017-01-13 10:16:35.570784710 +0100
++++ b/lib/xmlparse.c	2017-01-13 11:22:20.522433486 +0100
+@@ -6,7 +6,14 @@
+ #include <string.h>                     /* memset(), memcpy() */
+ #include <assert.h>
+ #include <limits.h>                     /* UINT_MAX */
+-#include <time.h>                       /* time() */
++
++#ifdef COMPILED_FROM_DSP
++#define getpid GetCurrentProcessId
++#else
++#include <sys/time.h>                   /* gettimeofday() */
++#include <sys/types.h>                  /* getpid() */
++#include <unistd.h>                     /* getpid() */
++#endif
+ 
+ #define XML_BUILDING_EXPAT 1
+ 
+@@ -432,7 +439,7 @@ static ELEMENT_TYPE *
+ getElementType(XML_Parser parser, const ENCODING *enc,
+                const char *ptr, const char *end);
+ 
+-static unsigned long generate_hash_secret_salt(void);
++static unsigned long generate_hash_secret_salt(XML_Parser parser);
+ static XML_Bool startParsing(XML_Parser parser);
+ 
+ static XML_Parser
+@@ -691,11 +698,38 @@ static const XML_Char implicitContext[]
+ };
+ 
+ static unsigned long
+-generate_hash_secret_salt(void)
++gather_time_entropy(void)
++{
++#ifdef COMPILED_FROM_DSP
++  FILETIME ft;
++  GetSystemTimeAsFileTime(&ft); /* never fails */
++  return ft.dwHighDateTime ^ ft.dwLowDateTime;
++#else
++  struct timeval tv;
++  int gettimeofday_res;
++
++  gettimeofday_res = gettimeofday(&tv, NULL);
++  assert (gettimeofday_res == 0);
++
++  /* Microseconds time is <20 bits entropy */
++  return tv.tv_usec;
++#endif
++}
++
++static unsigned long
++generate_hash_secret_salt(XML_Parser parser)
+ {
+-  unsigned int seed = time(NULL) % UINT_MAX;
+-  srand(seed);
+-  return rand();
++  /* Process ID is 0 bits entropy if attacker has local access
++   * XML_Parser address is few bits of entropy if attacker has local access */
++  const unsigned long entropy =
++      gather_time_entropy() ^ getpid() ^ (unsigned long)parser;
++
++  /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
++  if (sizeof(unsigned long) == 4) {
++    return entropy * 2147483647;
++  } else {
++    return entropy * 2305843009213693951;
++  }
+ }
+ 
+ static XML_Bool  /* only valid for root parser */
+@@ -703,7 +737,7 @@ startParsing(XML_Parser parser)
+ {
+     /* hash functions must be initialized before setContext() is called */
+     if (hash_secret_salt == 0)
+-      hash_secret_salt = generate_hash_secret_salt();
++      hash_secret_salt = generate_hash_secret_salt(parser);
+     if (ns) {
+       /* implicit context only set for root parser, since child
+          parsers (i.e. external entity parsers) will inherit it
diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
index b958742..f814864 100644
--- a/meta/recipes-core/expat/expat_2.1.0.bb
+++ b/meta/recipes-core/expat/expat_2.1.0.bb
@@ -1,5 +1,9 @@
 require expat.inc
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/expat-2.1.0:"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
 
+SRC_URI += "file://CVE-2016-5300_CVE-2012-6702.patch \
+           "
 SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
 SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"
-- 
1.9.1


