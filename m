Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Li.Wang@windriver.com>) id 1Tj3Ne-0005Cr-Ba
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 08:38:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBD7OJPn008321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 23:24:19 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 23:24:19 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 15:24:07 +0800
Message-ID: <1355383447-1138-2-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <1355383447-1138-1-git-send-email-li.wang@windriver.com>
References: <1355383447-1138-1-git-send-email-li.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cups CVE-2011-3170
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 07:38:55 -0000
Content-Type: text/plain

the patch come from:
http://cups.org/strfiles/3914/str3914.patch

The gif_read_lzw function in filter/image-gif.c in CUPS 1.4.8 and
earlier does not properly handle the first code word in an LZW stream,
which allows remote attackers to trigger a heap-based buffer overflow,
and possibly execute arbitrary code, via a crafted stream, a different
vulnerability than CVE-2011-2896.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3170

[YOCTO #3583]
[ CQID: WIND00299594 ]
Upstream-Status: Backport

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../cups/cups-1.4.6/cups-CVE-2011-3170.patch       | 54 ++++++++++++++++++++++
 meta/recipes-extended/cups/cups_1.4.6.bb           |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch

diff --git a/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch
new file mode 100644
index 0000000..fd1b958
--- /dev/null
+++ b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch
@@ -0,0 +1,54 @@
+cups CVE-2011-3170
+
+the patch come from:
+http://cups.org/strfiles/3914/str3914.patch
+
+The gif_read_lzw function in filter/image-gif.c in CUPS 1.4.8 and
+earlier does not properly handle the first code word in an LZW stream,
+which allows remote attackers to trigger a heap-based buffer overflow,
+and possibly execute arbitrary code, via a crafted stream, a different
+vulnerability than CVE-2011-2896.
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3170
+
+Integrated-by: Li Wang <li.wang@windriver.com>
+---
+ filter/image-gif.c |   14 +++++++++-----
+ 1 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/filter/image-gif.c b/filter/image-gif.c
+index 9542704..3857c21 100644
+--- a/filter/image-gif.c
++++ b/filter/image-gif.c
+@@ -654,11 +654,13 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+ 
+     if (code >= max_code)
+     {
+-      *sp++ = firstcode;
+-      code  = oldcode;
++      if (sp < (stack + 8192))
++	*sp++ = firstcode;
++
++      code = oldcode;
+     }
+ 
+-    while (code >= clear_code)
++    while (code >= clear_code && sp < (stack + 8192))
+     {
+       *sp++ = table[1][code];
+       if (code == table[0][code])
+@@ -667,8 +669,10 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+       code = table[0][code];
+     }
+ 
+-    *sp++ = firstcode = table[1][code];
+-    code  = max_code;
++    if (sp < (stack + 8192))
++      *sp++ = firstcode = table[1][code];
++
++    code = max_code;
+ 
+     if (code < 4096)
+     {
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 7cecd7f..75c23d3 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
 
-PR = "r8"
+PR = "r9"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -10,6 +10,7 @@ SRC_URI += " \
             file://0001-don-t-try-to-run-generated-binaries.patch \
             file://cups_serverbin.patch \
             file://cups-CVE-2011-2896.patch \
+            file://cups-CVE-2011-3170.patch \
             file://cups-CVE-2012-5519.patch \
 	"
 
-- 
1.7.11



