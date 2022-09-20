Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE9EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 10:41:27 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.10153.1663670482463544470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h+nZzE7g;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id s9so1280096qkg.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gSx/nMqjftK7E1Pbn5fENa1Y8CenSAgMCZ+kdNEmILw=;
        b=h+nZzE7ghdg8UO5MxVHNq5FQWT7FV/4x61+mgaGQHRfHfrJBoIb5Cf/AZiUPRIN1li
         MHfIYfNR0eaAmZp1+39hWvhEslwNDs2/uMWTblTLRtATWYHM+/GGgaZ1wmmngRxYaSr3
         wCSByigKLWHU0vDbarX/lPFDveyUROFxEPr19xwEDUEULiGG4kUq5nACKfBSSuwGuqOn
         iiD1HfKwpLYPki8A/IlQ4DremK45IuU3PFxnFdZvC0PCQcCchqI3YJZDbsGxFKvZZEtg
         Yquhr2Ixn6oG0A/5rsVsJu+lejYd5R26buEjsttFxwXwiaSS+B7iydYhvD59Du0hRAHK
         mydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gSx/nMqjftK7E1Pbn5fENa1Y8CenSAgMCZ+kdNEmILw=;
        b=Rey5n6QHmANTUg4hmYP1eF9909UfkpTlWydoW/IYg3VHlyewDwnS9Zb5N3sE29/c/p
         JoLDFrawR48M7z5qVRwCtcE3u9C7OACsshTnHh/9nwy9uwFhHIRz3svLpbtd2bbbI4T8
         e/NW8OHwwaqzAy4eMU0WAfUTJ3C+eoSgL9M2M1nt1tDyI6qBHVJsFzcFOL5RIO1B6U7c
         RaggTBM53RvyxXogJN9YnaJ98e7W/ASUT9DQpI566di2D/Xhi5XmYH83vujY2M/+6cTE
         xfWJkn9olZCdycyDnklD/UsUIUi3WTIkr2p5n0VG56y4Zrvr3RNjRN2iRqOzAGWo15+l
         8qQA==
X-Gm-Message-State: ACrzQf3sWOtLz9t+akrA3tbxqQ0zkGMmjbx6VRBP9xSwg8symXBlHRWT
	3fPNo62yi9EjbiG2P2ESqFn8eW96CCmHeA==
X-Google-Smtp-Source: 
 AMsMyM5dHO1Wn3SLi6V2DVmsDbrQoKl+PS9rrWuMSgmA6JspXXXsG84vPH67w7JLBGz1D454paxLIA==
X-Received: by 2002:a05:620a:2942:b0:6ce:6188:60d1 with SMTP id
 n2-20020a05620a294200b006ce618860d1mr14902997qkp.363.1663670481194;
        Tue, 20 Sep 2022 03:41:21 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([84.232.223.213])
        by smtp.gmail.com with ESMTPSA id
 cp4-20020a05622a420400b0035c11fd1b49sm636533qtb.80.2022.09.20.03.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:41:20 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [PATCH] expat: CVE-2022-40674
Date: Tue, 20 Sep 2022 13:39:56 +0300
Message-Id: <20220920103955.17640-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 10:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170892

Upstream-Status: Accepted
[https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b]

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 .../expat/expat/CVE-2022-40674.patch          | 57 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.4.8.bb        |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
new file mode 100644
index 0000000000..3164edbb49
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
@@ -0,0 +1,57 @@
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
+Signed-off-by: Florin Diaconescu <fdiaconescu@lenovo.com>
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
+
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


