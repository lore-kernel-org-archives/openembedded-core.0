Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846BEC43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:50 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.13205.1668953746438080236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5A3QIrv3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id t17so7676728pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHEhuFCL56rDv7RhlSG0Qc4NkAl/5/CwuS0TRynQxg4=;
        b=5A3QIrv3h716AkxMrgS2eAHxRTmuwpK5CPE/sWT2ZNEC2YewFIk/8dweHPzlFy0j5g
         0QdgtDylKnlxywynD30Jfr9MULYSTQSd/u1bvmqatnPrhYJBdGCUlEzuaO11uO1ee3Cx
         Q8n1waBkor6bZZUt4zGzO2+48gsCPzptad5fGh+Aj7F0TntIHvL+V5QN3Uiw6oGWRTxg
         tpBQ4sK+M5r/FJOFZ2pTlQF9z8SNmSrLqHLn9tCewAyYb+4ONc5lYf4ZOgnWg0sfbDkk
         NhBwprmIz+7915c20HkTgqdaDBlFPoCKUfJTevIyLZKcKTrH27de4kgR693mE2XMH1rk
         5zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHEhuFCL56rDv7RhlSG0Qc4NkAl/5/CwuS0TRynQxg4=;
        b=2puzHFvlX9N2g+oEb6zsp1iPXBZPRvVt7ScyucoIb4PkfnvZBCK/mcj/FKRMm0r8gr
         xQjIvNSh44XXgSdBP9RsIrX7V3aIODS9pzNlxTBn1NIv6zrmlkbAhDPp1dTqa58ptUQZ
         ZGI7WLZrk6gcKOqtVcyYftkQasDd2MDfNXXEu2J/MjKNQfKVlJMdWs6oBMy+LHce7Zll
         WwlB8UIwXJBKwgQUe78l3/rkPJXpHF/GA9SomoLSGVp9iy48r2fg1tDcuODKDMLh48vZ
         jaw+y77u4007nodHwnvkwttBde+leaMB7ZvNv5af1N0yKMCVqNjxcev/QGx0qXass696
         e9zg==
X-Gm-Message-State: ANoB5pmA5uFXNqpq7DsjN+9Su1MGG2WLjtkerWxaD6ouLCMAabNAqaA6
	nznqLNkMxfTrgFn7mEKin5qO8MXyje7IJyzmbxo=
X-Google-Smtp-Source: AA0mqf4hWahdjqrrO8fR1mox8vcQx4s6yUPO7SANMK9xbHM9+uOFPuSPNYINRTAXajD2NnXpCBPc2g==
X-Received: by 2002:a17:902:c103:b0:186:7006:9a5f with SMTP id 3-20020a170902c10300b0018670069a5fmr219695pli.117.1668953745436;
        Sun, 20 Nov 2022 06:15:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/35] Revert "expat: backport the fix for CVE-2022-43680"
Date: Sun, 20 Nov 2022 04:14:54 -1000
Message-Id: <b633c648da57079c8a3b64127e5ed11643fb5438.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173605

Prepare for version bump which includes this fix

This reverts commit 791fe354e5887af3fa3d3f772fafacc5eaedca21.
---
 .../expat/expat/CVE-2022-43680.patch          | 33 -------------------
 meta/recipes-core/expat/expat_2.4.9.bb        |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-43680.patch b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
deleted file mode 100644
index 76c55edc76..0000000000
--- a/meta/recipes-core/expat/expat/CVE-2022-43680.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-CVE: CVE-2022-43680
-Upstream-Status: Backport [5290462a7ea1278a8d5c0d5b2860d4e244f997e4]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 5290462a7ea1278a8d5c0d5b2860d4e244f997e4 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Tue, 20 Sep 2022 02:44:34 +0200
-Subject: [PATCH] lib: Fix overeager DTD destruction in
- XML_ExternalEntityParserCreate
-
----
- expat/lib/xmlparse.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
-index aacd6e7fc..57bf103cc 100644
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -1068,6 +1068,14 @@ parserCreate(const XML_Char *encodingName,
-   parserInit(parser, encodingName);
- 
-   if (encodingName && ! parser->m_protocolEncodingName) {
-+    if (dtd) {
-+      // We need to stop the upcoming call to XML_ParserFree from happily
-+      // destroying parser->m_dtd because the DTD is shared with the parent
-+      // parser and the only guard that keeps XML_ParserFree from destroying
-+      // parser->m_dtd is parser->m_isParamEntity but it will be set to
-+      // XML_TRUE only later in XML_ExternalEntityParserCreate (or not at all).
-+      parser->m_dtd = NULL;
-+    }
-     XML_ParserFree(parser);
-     return NULL;
-   }
diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/expat/expat_2.4.9.bb
index 22f9845a99..cb007708c7 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.4.9.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7b3b078238d0901d3b339289117cb7fb"
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
-           file://CVE-2022-43680.patch \
            file://run-ptest \
            "
 
-- 
2.25.1


