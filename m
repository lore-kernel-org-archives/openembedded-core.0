Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F95C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 11:09:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.10385.1663672186155768093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eIVRymSb;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id c11so3634221wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=I/JoZw3FHPta+hNuuEfl/CuF9QllYFOOJNnDZ+Fd2O4=;
        b=eIVRymSba+HDLKT4FRL5lTqdK/GeeaUdaP4d4FYaT/Ps/L5IRS4uNa1q0DcLCD1BqS
         WP5Oq1tPnodfofCW95tJUGANQARTeuYY9VUzBq7/h9ZAUe/EdwpqzcMJ75R5+Yu7b+Xo
         8uZnOTpCCgKxcygcgKwiFmLaxpJ48bE007XlNN56EjHpf4noK2zNZF3sgffqUvGEoV3m
         8xLpWmubV3Bwvr9EN9zO2bs5UnJLg+ePsyEK5XveUipBGNs7lS/7sB5ya7ABTLHj+Uh4
         nAaGdmMBBhSt8pxIDlTKEjlMI1+p93KfiXA9i+yuHCH4XA7vwOk+Ha4/QyULeAFpd3TD
         XRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=I/JoZw3FHPta+hNuuEfl/CuF9QllYFOOJNnDZ+Fd2O4=;
        b=XRCLDVwdlz2RCr7d3hK60B9zWmR83Dd9S2mo0QZ8QejSUrPDaIKEBFnRtff+lvohdA
         70YTtY+Y3dh1PnvnAqQ5g24eSO9zkWjnjBWIDWHfYaaWIpTzxqclzF9vXTv7a4M4Hi+t
         Qswrty0NB8gD+IehYWiGGAI8fL9K+wO6OFzmi+syH/eUWfUgS36MQo6VnV7pvn+ApNCw
         V+TmsitGXDV4XrNh3m56MgkkiKTbOiwIE4BSTC0ZOdQQkxGtiyksk5K+nt27NPnd6WJI
         aMzGHbVADOApXFCyE68Wvaxdu27uUiJFo4nwpovVsQ/soHZa1TYj+M5wp9m3fUe0wvSi
         5Rnw==
X-Gm-Message-State: ACrzQf2s8nFRCn/8+Y+pVCbSuQVjKDJgmDmjLZwNTkxaPtJkbnyVonQb
	RP71cwxI6SgOsucZw3YPs0M/ZNV4G7HAEw==
X-Google-Smtp-Source: 
 AMsMyM6w/0YB28rAD/suupP7kseJVRpbn4FUYJ8r0hNni3Ywk+APlfu6czA95bJZJ6BI9VRKd78WjA==
X-Received: by 2002:adf:ef52:0:b0:22a:6ec5:a0fd with SMTP id
 c18-20020adfef52000000b0022a6ec5a0fdmr14574215wrp.190.1663672184159;
        Tue, 20 Sep 2022 04:09:44 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([84.232.223.213])
        by smtp.gmail.com with ESMTPSA id
 iw18-20020a05600c54d200b003b492b30822sm2009905wmb.2.2022.09.20.04.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 04:09:43 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] expat: CVE-2022-40674
Date: Tue, 20 Sep 2022 14:08:58 +0300
Message-Id: <20220920110856.18019-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 11:09:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170894

Upstream-Status: Accepted
[https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b]

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 .../expat/expat/CVE-2022-40674.patch          | 56 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.4.8.bb        |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
new file mode 100644
index 0000000000..468811fefa
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
@@ -0,0 +1,56 @@
+From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
+From: Rhodri James <rhodri@wildebeest.org.uk>
+Date: Wed, 17 Aug 2022 18:26:18 +0100
+Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
+
+It is possible to concoct a situation in which parsing is
+suspended while substituting in an internal entity, so that
+XML_ResumeParser directly uses internalEntityProcessor as
+its processor.  If the subsequent parse includes some unclosed
+tags, this will return without calling storeRawNames to ensure
+that the raw versions of the tag names are stored in memory other
+than the parse buffer itself.  If the parse buffer is then changed
+or reallocated (for example if processing a file line by line),
+badness will ensue.
+
+This patch ensures storeRawNames is always called when needed
+after calling doContent.  The earlier call do doContent does
+not need the same protection; it only deals with entity
+substitution, which cannot leave unbalanced tags, and in any
+case the raw names will be pointing into the stored entity
+value not the parse buffer.
+
+CVE: CVE-2022-40674
+Upstream-Status: Accepted [https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b]
+
+Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
+---
+ lib/xmlparse.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e986156..eabe0fc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+   {
+     parser->m_processor = contentProcessor;
+     /* see externalEntityContentProcessor vs contentProcessor */
+-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_encoding,
+-                     s, end, nextPtr,
+-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
+-                     XML_ACCOUNT_DIRECT);
++    result = doContent(parser, parser->m_parentParser ? 1 : 0,
++                       parser->m_encoding, s, end, nextPtr,
++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
++                       XML_ACCOUNT_DIRECT);
++    if (result == XML_ERROR_NONE) {
++      if (! storeRawNames(parser))
++        return XML_ERROR_NO_MEMORY;
++    }
++    return result;
+   }
+ }
+ 
+-- 
+2.35.1
diff --git a/meta/recipes-core/expat/expat_2.4.8.bb b/meta/recipes-core/expat/expat_2.4.8.bb
index 980c488640..93a2f98b38 100644
--- a/meta/recipes-core/expat/expat_2.4.8.bb
+++ b/meta/recipes-core/expat/expat_2.4.8.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2022-40674.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.25.1


