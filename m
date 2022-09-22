Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB55FC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:48:08 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.1051.1663883287964025050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rOZAFUQw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id q3so11118509pjg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Zf9EoMkycth4OkcUJ5VwsOYMHk54tYnOeQqw2+pzk4g=;
        b=rOZAFUQwskmB9njRe+Ye9xtHAYOYYwTzf0kjM8PD0J4Cy1rc8SQekZH9YbY4YbdGuF
         XjONXLMYDh2knE1kZpR3wJLa6bN+a8amdNuEu8KVdCtzL1gfL2/StB2gIm6jI8hhq6rh
         /W5XPeKSSEavN63QfxBB/BJPbQ1toxwcCkyHbb8BE7gLUOLRbE4E/eVbw/tBjNR/Je4H
         nXJuK2lVLdyvKv/9rKjRCTbXFBr4NbhFxkGuDebhfQ80rjv8BgnpK29bFNv5e/OHWX+L
         p/XAars+xtIoGf8gMVRHXz+3D/6MxK70T49ff114yxVnR4G/2ZhTbRp6Cpcdw/L1ic2v
         NJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Zf9EoMkycth4OkcUJ5VwsOYMHk54tYnOeQqw2+pzk4g=;
        b=yM1aVBvBsIDe95J8JWaIBfBTqyAjT+Nj1FYblW3RnFauNUo0K1A8GLCealQyQng7UA
         jPvttcgWfDShVcN3yHDCDOdKiA/IwG7/Znlht7lHank3HZxDu0tsIA4LGiKpm/ICIRw/
         VM29VTZ1OkZkZmP7KCDYSDRtQZNaQcCDVbllweIlsdBjM1Ga4ymKaI6NsDskR5tKjirf
         kFVp/wWUNlspAfCEh2qj7zhHjiF3e3M3QyNT+rXZiYVmLoob8mzfAnNc7NLSLlW3NXDr
         m6KChXdwl+9e/X5fbGBAsno2qjFGH5o+ag918tudA1b5M6bcpeqe4eXbhUE9ZsTJy6o+
         qwMQ==
X-Gm-Message-State: ACrzQf2vMtDjnrpyZdymBSxlycJvXOFXUsBO7FgS+iE0SPqXg7i2D+67
	yorbOP/cfXnTRao7tAkDZzTQ6L/g+KpM1MT+
X-Google-Smtp-Source: 
 AMsMyM5cGROHa19xz9eSC9FcQmOGsDBpKoF82d6SO6bGgS62n6plVYMCYQmabW63RIdO3v5g/sZdMg==
X-Received: by 2002:a17:903:124f:b0:178:9234:370b with SMTP id
 u15-20020a170903124f00b001789234370bmr5321442plh.103.1663883286993;
        Thu, 22 Sep 2022 14:48:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902714400b0016ee4b0bd60sm4574813plm.166.2022.09.22.14.48.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:48:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] expat: Fix CVE-2022-40674
Date: Thu, 22 Sep 2022 11:47:48 -1000
Message-Id: 
 <4efa4490becea956a62d45e1476f7b602be53eee.1663883154.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663883154.git.steve@sakoman.com>
References: <cover.1663883154.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 21:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170992

From: Virendra Thakur <virendrak@kpit.com>

Add patch file to fix CVE-2022-40674

Link: https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-40674.patch          | 53 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
new file mode 100644
index 0000000000..8b95f5f198
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
@@ -0,0 +1,53 @@
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
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4a32da87e931ba54393d465bb77c40b5c33d343b]
+CVE: CVE-2022-40674
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ expat/lib/xmlparse.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+Index: expat/lib/xmlparse.c
+===================================================================
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5657,10 +5657,15 @@ internalEntityProcessor(XML_Parser parse
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
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index f50e535922..578edfcbff 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-25314.patch \
            file://CVE-2022-25315.patch \
            file://libtool-tag.patch \
+           file://CVE-2022-40674.patch \
          "
 
 SRCREV = "a7bc26b69768f7fb24f0c7976fae24b157b85b13"
-- 
2.25.1


