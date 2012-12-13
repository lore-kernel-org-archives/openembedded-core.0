Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Li.Wang@windriver.com>) id 1Tj3NZ-0005Co-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 08:38:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBD7OD72023210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 23:24:13 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 23:24:12 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 15:24:06 +0800
Message-ID: <1355383447-1138-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH 1/2] cups - CVE-2011-2896
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
X-List-Received-Date: Thu, 13 Dec 2012 07:38:51 -0000
Content-Type: text/plain

the patch come from:
http://cups.org/strfiles/3867/str3867.patch

The LZW decompressor in the LWZReadByte function in giftoppm.c
in the David Koblas GIF decoder in PBMPLUS, as used in the
gif_read_lzw function in filter/image-gif.c in CUPS before 1.4.7,
the LZWReadByte function in plug-ins/common/file-gif-load.c
in GIMP 2.6.11 and earlier, the LZWReadByte function in img/gifread.c
in XPCE in SWI-Prolog 5.10.4 and earlier, and other products,
does not properly handle code words that are absent from the
decompression table when encountered, which allows remote attackers to
trigger an infinite loop or a heap-based buffer overflow, and possibly
execute arbitrary code, via a crafted compressed stream, a related
issue to CVE-2006-1168 and CVE-2011-2895.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-2896

[YOCTO #3582]
[ CQID: WIND00299595 ]
Upstream-Status: Backport

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../cups/cups-1.4.6/cups-CVE-2011-2896.patch       | 140 +++++++++++++++++++++
 meta/recipes-extended/cups/cups_1.4.6.bb           |   3 +-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-2896.patch

diff --git a/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-2896.patch b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-2896.patch
new file mode 100644
index 0000000..7c6f75b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-2896.patch
@@ -0,0 +1,140 @@
+cups - CVE-2011-2896
+
+the patch come from:
+http://cups.org/strfiles/3867/str3867.patch
+
+The LZW decompressor in the LWZReadByte function in giftoppm.c
+in the David Koblas GIF decoder in PBMPLUS, as used in the
+gif_read_lzw function in filter/image-gif.c in CUPS before 1.4.7,
+the LZWReadByte function in plug-ins/common/file-gif-load.c
+in GIMP 2.6.11 and earlier, the LZWReadByte function in img/gifread.c
+in XPCE in SWI-Prolog 5.10.4 and earlier, and other products,
+does not properly handle code words that are absent from the
+decompression table when encountered, which allows remote attackers to
+trigger an infinite loop or a heap-based buffer overflow, and possibly
+execute arbitrary code, via a crafted compressed stream, a related
+issue to CVE-2006-1168 and CVE-2011-2895.
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-2896
+
+Integrated-by: Li Wang <li.wang@windriver.com>
+---
+ filter/image-gif.c |   46 ++++++++++++++++++++--------------------------
+ 1 files changed, 20 insertions(+), 26 deletions(-)
+
+diff --git a/filter/image-gif.c b/filter/image-gif.c
+index 3857c21..fa9691e 100644
+--- a/filter/image-gif.c
++++ b/filter/image-gif.c
+@@ -353,7 +353,7 @@ gif_get_code(FILE *fp,			/* I - File to read from */
+     * Read in another buffer...
+     */
+ 
+-    if ((count = gif_get_block (fp, buf + last_byte)) <= 0)
++    if ((count = gif_get_block(fp, buf + last_byte)) <= 0)
+     {
+      /*
+       * Whoops, no more data!
+@@ -582,19 +582,13 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+     gif_get_code(fp, 0, 1);
+ 
+    /*
+-    * Wipe the decompressor table...
++    * Wipe the decompressor table (already mostly 0 due to the calloc above...)
+     */
+ 
+     fresh = 1;
+ 
+-    for (i = 0; i < clear_code; i ++)
+-    {
+-      table[0][i] = 0;
++    for (i = 1; i < clear_code; i ++)
+       table[1][i] = i;
+-    }
+-
+-    for (; i < 4096; i ++)
+-      table[0][i] = table[1][0] = 0;
+ 
+     sp = stack;
+ 
+@@ -605,29 +599,30 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+     fresh = 0;
+ 
+     do
++    {
+       firstcode = oldcode = gif_get_code(fp, code_size, 0);
++    }
+     while (firstcode == clear_code);
+ 
+-    return (firstcode);
++    return (firstcode & 255);
+   }
+   else if (!table)
+     return (0);
+ 
+   if (sp > stack)
+-    return (*--sp);
++    return ((*--sp) & 255);
+ 
+-  while ((code = gif_get_code (fp, code_size, 0)) >= 0)
++  while ((code = gif_get_code(fp, code_size, 0)) >= 0)
+   {
+     if (code == clear_code)
+     {
+-      for (i = 0; i < clear_code; i ++)
+-      {
+-	table[0][i] = 0;
+-	table[1][i] = i;
+-      }
++     /*
++      * Clear/reset the compression table...
++      */
+ 
+-      for (; i < 4096; i ++)
+-	table[0][i] = table[1][i] = 0;
++      memset(table, 0, 2 * sizeof(gif_table_t));
++      for (i = 1; i < clear_code; i ++)
++	table[1][i] = i;
+ 
+       code_size     = set_code_size + 1;
+       max_code_size = 2 * clear_code;
+@@ -637,12 +632,11 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+ 
+       firstcode = oldcode = gif_get_code(fp, code_size, 0);
+ 
+-      return (firstcode);
++      return (firstcode & 255);
+     }
+-    else if (code == end_code)
++    else if (code == end_code || code > max_code)
+     {
+-      unsigned char	buf[260];
+-
++      unsigned char	buf[260];	/* Block buffer */
+ 
+       if (!gif_eof)
+         while (gif_get_block(fp, buf) > 0);
+@@ -652,7 +646,7 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+ 
+     incode = code;
+ 
+-    if (code >= max_code)
++    if (code == max_code)
+     {
+       if (sp < (stack + 8192))
+ 	*sp++ = firstcode;
+@@ -690,10 +684,10 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+     oldcode = incode;
+ 
+     if (sp > stack)
+-      return (*--sp);
++      return ((*--sp) & 255);
+   }
+ 
+-  return (code);
++  return (code & 255);
+ }
+ 
+ 
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 53dc149..7cecd7f 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
 
-PR = "r7"
+PR = "r8"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -9,6 +9,7 @@ SRC_URI += " \
             file://use_echo_only_in_init.patch \
             file://0001-don-t-try-to-run-generated-binaries.patch \
             file://cups_serverbin.patch \
+            file://cups-CVE-2011-2896.patch \
             file://cups-CVE-2012-5519.patch \
 	"
 
-- 
1.7.11



