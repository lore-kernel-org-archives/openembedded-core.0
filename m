Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsArL-0003aE-Ai
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:27:20 +0100
Received: from mail-fa0-f72.google.com ([209.85.161.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 03:12:07 -0800
Received: by mail-fa0-f72.google.com with SMTP id s10so17846566fas.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=Kv+WzPTqd62Jp5F+rB6BjLFamvwieMtHLFwgtT1mt+s=;
	b=YiZvMqB90yCgwMrrvySQVyRXCmXq2/jFHAPxgZFMBK7vmW9e2Ffe8wdLbFXpAw12SD
	Zrm1QOdXp7CGdFDG1X1PZD85ibSgPQrjVuvvM170sOGn2cIfmlW9DIwts09Hl0TRAmeI
	l6Hkc43UEPP7ffK0ufk7pU3qd1LKLBEZ1X+AvloaobFaBky6OJLUGt0H9jHAK2ojPIzi
	quxzKhpCJb/CuwytGcsWAhSYjigAHqLZxVHKNGyC9bdXAvQCwoaLoKyy7sslt3tm7my2
	82t7/Rfyl9To06UKnMzJhmAUVSycFbrn5WaA6nayDbvhE+cSVLXG/qVmaNPf5wrayGvs
	c0vQ==
X-Received: by 10.180.20.109 with SMTP id m13mr8645276wie.16.1357557124745;
	Mon, 07 Jan 2013 03:12:04 -0800 (PST)
X-Received: by 10.180.20.109 with SMTP id m13mr8645259wie.16.1357557124613;
	Mon, 07 Jan 2013 03:12:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm12993779wia.10.2013.01.07.03.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:12:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:10:00 +0000
Message-Id: <1357557002-22183-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
References: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm/2JwjxEG0Mha5qvXrCk+5GYFJR1JNJJMWp99hLvDY+z7Whh+tvDWbFmog5cNPbrsoLIFO9Tph48bri4CW+xwU/pVbGpty6RF7iHS2/Hs0iMp17NItywA2Td5zkJ3yM+3KgNx5kDM6tUqdWaorkOOStgo2wydDD41KSbHYD9Ee0A9l4Glpt0y8+1p+bQhThol+281S
Subject: [PATCH 5/7] cups - CVE-2011-2896
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
X-List-Received-Date: Mon, 07 Jan 2013 11:27:38 -0000

From: Li Wang <li.wang@windriver.com>

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

(From OE-Core rev: 0742b7aecaada435f90f39f26914906a5eb1fd4f)

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cups/cups-1.4.6/cups-CVE-2011-2896.patch       |  140 ++++++++++++++++++++
 meta/recipes-extended/cups/cups_1.4.6.bb           |    3 +-
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
1.7.10.4



