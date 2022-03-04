Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BF8C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:18 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.7803.1646406303882353744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WSZEqwEj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id a5so7823366pfv.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U1TIbtml1HETKNuzU4iacUno41/lHUdLWS3UHPKujEM=;
        b=WSZEqwEjRDjACLI/3Q4U+bX0Gitc4qsTnU9JiU0GCT8XIyEck3e6nG3N2vCDOJb8KH
         WGFPjiyEk1oQ5qkpXfZQs2VqXP2OuNGqNBOrlcS1UDRK8agUIO0MGQjo0cnecmroZizx
         0TVxmC8cldNfYl0zDo8ydaR29bHOZd3+3TTnnBXHvFG+2YGkZBSVWQr3P6Ij3/tjZMga
         QTErdJw6CpwUJM8jTwCFAf8vkKFIdcyJl2qGO8CV0IhASXJT0xu4VhMIfQoLs+afdSJK
         kmRV6T2+qeNCWbIIxDxwS0pDSsW9CcIHjMEPCscT+oUd20H/saE2j4mlaOvJDmtl0bV+
         ex6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U1TIbtml1HETKNuzU4iacUno41/lHUdLWS3UHPKujEM=;
        b=OoWqEw0sWD5k2pLE40u5OI1VQiFGNuVnFBQSDVlH0krnzfAc01tmEfuRSF1wcmWJdV
         AFfXVtDH+H/grhE+HXGE2aFcaiBQ8KTioQ4okR3iUFvq1NJB929mZZ3NeZ58xwkcnAL6
         VEGcLbT/0W7u6AY8CFBT7UBNDJ/A/uDqzgeZJF9C6INoDKcKomku7YNwhyf9UYAF4RbO
         ARUL0s5BF/gf2fnGcymAFqV3KQjB49cR5fGEFyc1Ws1P+kWroXSbHPdUi7bncJUzUbqz
         /UmasAYq7kxMS1KnSPrkRbxGsJO9H7uNdbYrAPpZJ9/HO5xBANRc/tDE/nztjYPUkm53
         mICw==
X-Gm-Message-State: AOAM533nrYuXo0hPP7zbwY7naB6lJqiGsiHvCKw0Wn6WW4l77FETBSjN
	0eLQLgInq+4zEBRcPqA15+mPgw5ogIH3YFPp+Y8=
X-Google-Smtp-Source: 
 ABdhPJyMqltM2OkG7cd1OqXcFs3t44tUBi2szo1VusclDyBZHw8ISGWh8z82osOGhJYNXJ/m88ZWRQ==
X-Received: by 2002:a05:6a00:22cc:b0:4e0:58dc:e489 with SMTP id
 f12-20020a056a0022cc00b004e058dce489mr43837050pfj.58.1646406302731;
        Fri, 04 Mar 2022 07:05:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/18] expat: fix CVE-2022-25315
Date: Fri,  4 Mar 2022 05:04:16 -1000
Message-Id: 
 <9cb21fd89de99abeeef1dd962e6019943de546a4.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162727

In Expat (aka libexpat) before 2.4.5, there is an integer overflow
in storeRawNames.

Backport patch from:
https://github.com/libexpat/libexpat/pull/559/commits/eb0362808b4f9f1e2345a0cf203b8cc196d776d9

CVE: CVE-2022-25315

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-25315.patch          | 145 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25315.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25315.patch b/meta/recipes-core/expat/expat/CVE-2022-25315.patch
new file mode 100644
index 0000000000..a39771d28a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25315.patch
@@ -0,0 +1,145 @@
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
+
+Upstream-Status: Backport
+https://github.com/libexpat/libexpat/pull/559/commits/eb0362808b4f9f1e2345a0cf203b8cc196d776d9
+
+CVE: CVE-2022-25315
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ lib/xmlparse.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
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
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index dd8eeddf80..f50e535922 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-25313.patch \
            file://CVE-2022-25313-regression.patch \
            file://CVE-2022-25314.patch \
+           file://CVE-2022-25315.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


