Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B15C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:16 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.2874.1643917875143484649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3fD1nmXs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d1so3101950plh.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=niGPfPgVV3KURFXrteM4Ns3wmwcOV96XStS7zWQ0zDY=;
        b=3fD1nmXsanPwlcBF+VUZYvrEiCL9t1hmgffsaForxZZwO+PhdZYuYiTiWaDyZ9lzfe
         prKnoRRzgi6ahgaKGyWBBEVI9q5q0oPT0LwSGj9aTYEAv+3wZyRYwQBBLNalMmWxhhwO
         7R4M1RN2fZ5+aq6fewZX9zFL5FL6p6E2/3qJOejYgZaHd835a3+QjG1z6t16vSlvQ6dT
         fWgLndLnoY3Meq8ElwiDl+zStL+6ztnM7uq3VfZR8fywnpuAey5Qq2MmO2OQqMCV1DM6
         8XI/z+MdQgBIdgDuiRMqmboV70DsszhhSS7BXrfFZsCkZ7mR4de33VAnVU/osokJENY/
         pJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niGPfPgVV3KURFXrteM4Ns3wmwcOV96XStS7zWQ0zDY=;
        b=XOgUw7Jr0e2EOL5HbLnhOybiofC8vnNdfzRldNkDIzbAaZ1aLZ0+fSQcGMVF9i/Pfh
         aTJyrw2BH+9kMiml02g1UCa9mL2pTqpORulj01jL+P+8fQsvkwasHrx023AhStYynDro
         FIMTuXmU9brWcNHgA6MLoGln3YjPZB+xEZxbQnPLA6Z7K5zGJ/A0R5+6PJioJMROMIFQ
         A2NOqHyCZ6fhqMS4n9s6hHrgLzqIiGy9gRXpvIYGZotQ91XgejSKigI1mFUnj6sMEv+U
         mJ124BImqIJfLx/BBcyDJCD49UNuWfCPw0/W+fy2GBkukdOHAtK/zARzUyHoBO0Ytq3q
         WS5g==
X-Gm-Message-State: AOAM531roR371kOWNIiFbnC3T7qh/60QiILJLwVK/PUUfWwNMApYmOwH
	CQJUQ58bQMk8O0d20DSjb8dd8XBTRmZcszp8
X-Google-Smtp-Source: 
 ABdhPJw/kgHVfLig21a2swXHNy9ZOzzWDe6HJ2K4gO2CA9dnE5ksDbpvxAa2920FtMKtO9Y5hBOmIw==
X-Received: by 2002:a17:90a:b107:: with SMTP id
 z7mr15670830pjq.38.1643917874194;
        Thu, 03 Feb 2022 11:51:14 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/20] expat: fix CVE-2022-23852
Date: Thu,  3 Feb 2022 09:50:30 -1000
Message-Id: 
 <af81bb9d10c0f1e9dcaffc1bbc18ef780eea7127.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161301

Expat (aka libexpat) before 2.4.4 has a signed integer overflow in XML_GetBuffer
for configurations with a nonzero XML_CONTEXT_BYTES.

Backport patch from:
https://github.com/libexpat/libexpat/commit/847a645152f5ebc10ac63b74b604d0c1a79fae40

CVE: CVE-2022-23852
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-23852.patch          | 33 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-23852.patch b/meta/recipes-core/expat/expat/CVE-2022-23852.patch
new file mode 100644
index 0000000000..41425c108b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-23852.patch
@@ -0,0 +1,33 @@
+From 847a645152f5ebc10ac63b74b604d0c1a79fae40 Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Sat, 22 Jan 2022 17:48:00 +0100
+Subject: [PATCH] lib: Detect and prevent integer overflow in XML_GetBuffer
+ (CVE-2022-23852)
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/commit/847a645152f5ebc10ac63b74b604d0c1a79fae40
+
+CVE: CVE-2022-23852
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index d54af683..5ce31402 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2067,6 +2067,11 @@ XML_GetBuffer(XML_Parser parser, int len) {
+     keep = (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buffer);
+     if (keep > XML_CONTEXT_BYTES)
+       keep = XML_CONTEXT_BYTES;
++    /* Detect and prevent integer overflow */
++    if (keep > INT_MAX - neededSize) {
++      parser->m_errorCode = XML_ERROR_NO_MEMORY;
++      return NULL;
++    }
+     neededSize += keep;
+ #endif /* defined XML_CONTEXT_BYTES */
+     if (neededSize
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 757c18c5fa..6a6d5c066f 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2021-45960.patch \
            file://CVE-2021-46143.patch \
            file://CVE-2022-22822-27.patch \
+           file://CVE-2022-23852.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


