Return-Path: <Jibin.Xu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFCCA74D40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 09:34:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4I9YAeE009872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 02:34:11 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 May 2018 02:34:10 -0700
From: Jibin Xu <jibin.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2018 02:33:56 -0700
Message-ID: <20180518093356.148937-1-jibin.xu@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] wget: fix CVE-2018-0494
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
X-List-Received-Date: Fri, 18 May 2018 09:34:10 -0000
Content-Type: text/plain

Reference:https://nvd.nist.gov/vuln/detail/CVE-2018-0494
patch from https://github.com/mirror/wget.git
commit 8d793bf2ecca84a5ece167c750a83d6eadb4a16a

Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
---
 .../wget/wget/wget-CVE-2018-0494.patch             | 68 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.4.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/wget-CVE-2018-0494.patch

diff --git a/meta/recipes-extended/wget/wget/wget-CVE-2018-0494.patch b/meta/recipes-extended/wget/wget/wget-CVE-2018-0494.patch
new file mode 100644
index 0000000000..5eda9636e3
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/wget-CVE-2018-0494.patch
@@ -0,0 +1,68 @@
+From 1fc9c95ec144499e69dc8ec76dbe07799d7d82cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Fri, 27 Apr 2018 10:41:56 +0200
+Subject: [PATCH] Fix cookie injection (CVE-2018-0494)
+
+* src/http.c (resp_new): Replace \r\n by space in continuation lines
+
+Fixes #53763
+ "Malicious website can write arbitrary cookie entries to cookie jar"
+
+HTTP header parsing left the \r\n from continuation line intact.
+The Set-Cookie code didn't check and could be tricked to write
+\r\n into the cookie jar, allowing a server to generate cookies at will.
+
+Upstream-Status: Backport
+CVE: CVE-2018-0494
+
+Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
+---
+ src/http.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index c8960f1..77bdbbe 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -613,9 +613,9 @@ struct response {
+    resp_header_*.  */
+ 
+ static struct response *
+-resp_new (const char *head)
++resp_new (char *head)
+ {
+-  const char *hdr;
++  char *hdr;
+   int count, size;
+ 
+   struct response *resp = xnew0 (struct response);
+@@ -644,15 +644,23 @@ resp_new (const char *head)
+         break;
+ 
+       /* Find the end of HDR, including continuations. */
+-      do
++      for (;;)
+         {
+-          const char *end = strchr (hdr, '\n');
++          char *end = strchr (hdr, '\n');
++
+           if (end)
+             hdr = end + 1;
+           else
+             hdr += strlen (hdr);
++
++          if (*hdr != ' ' && *hdr != '\t')
++            break;
++
++          // continuation, transform \r and \n into spaces
++          *end = ' ';
++          if (end > head && end[-1] == '\r')
++            end[-1] = ' ';
+         }
+-      while (*hdr == ' ' || *hdr == '\t');
+     }
+   DO_REALLOC (resp->headers, size, count + 1, const char *);
+   resp->headers[count] = NULL;
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/wget/wget_1.19.4.bb b/meta/recipes-extended/wget/wget_1.19.4.bb
index fb7cce5a20..6ffcf8aa3b 100644
--- a/meta/recipes-extended/wget/wget_1.19.4.bb
+++ b/meta/recipes-extended/wget/wget_1.19.4.bb
@@ -1,6 +1,7 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-improve-reproducibility.patch \
+           file://wget-CVE-2018-0494.patch \
           "
 
 SRC_URI[md5sum] = "a2a2c1dc4ac5003fc25a8e60b4a9464e"
-- 
2.13.0


