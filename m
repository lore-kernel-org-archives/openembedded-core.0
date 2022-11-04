Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9471DC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.7201.1667530893771453705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZC/rAClo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so3530964pjd.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+dH/LW/6s0NUg9udavZ6egZUS850Y5y36wQIqmVMqU=;
        b=ZC/rACloSskwS11zIL+2czS9npp1PlygHkqYlXRJ2+vM3OXrFcizdlfA9R98EzZ1UE
         eCIlUijHhbHN2Z2nlMnWBAiuzPTz2BLdkWR7/WLhDAKN5tjNp2dnKwaazY3kM0PKr6SW
         Mqbjuj2eIqgaoKrLaFbLJThlcaElIzVQipgk3509Drahqvz8AFNP4Wp2lzL4Tjj1Sxij
         a6wNH+kY2blwNzJ5mKnXg8ZRrf+QVI7hdCFT0sd25RFqMUK6Mi29u8wAI+09aPiGv87E
         wA0o3UeSx2mEczv/jSGjHv6yrF8XU25QXHXaB0aRBNZh9g28Wn3NMxlseG9CSVzQnY91
         k8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+dH/LW/6s0NUg9udavZ6egZUS850Y5y36wQIqmVMqU=;
        b=TNVeyFm1Ur0S00MS+v9U/+1AJ+JKMw1bCP8L/JMnkhgpQCFqsRqAYvvigz5w46CrM0
         2GtXu3STD5azmUNXNh5pvuGVozTUckD1w+C6Wn7qxKZgyjWMtF9ogNao2+332ytv80BE
         H4MZ4BoItLw3QYUmQEww8Mrjn0FEEdBnW0BfPUgg5Z6bwTOG3dfJRGt3XAqk3SFhT8ZF
         LmYP8HZsIybPvvrjjd9SsbKk92o7AIqpGoQnW6CrJ0MTtT9J/j7Ql7FJhvDpJm7Iz8JO
         08W9lf2lgfW7f6nuo12qXvkLYDx5vTsDENKhbJlNAuTuH3sFi6Byz2oFHHRuY0WASx9K
         k+AA==
X-Gm-Message-State: ACrzQf0VvnPZIc2DRr+T2RVgZkriFK8wgwyp0dvPnctmTVAbHqNwXCok
	Vw10z67L+PL7AYczPEOiX4Saz2r7dVsAu8f7
X-Google-Smtp-Source: AMsMyM6dSkcmnRJaVA1X4S7cPpPG/5VxCCeHQzDZGKaQntgwlWaV1OXDdZ9go20++ZdSx6UObVTdFA==
X-Received: by 2002:a17:90a:bf11:b0:211:84c5:42d7 with SMTP id c17-20020a17090abf1100b0021184c542d7mr50679734pjs.122.1667530892807;
        Thu, 03 Nov 2022 20:01:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/31] expat: backport the fix for CVE-2022-43680
Date: Thu,  3 Nov 2022 17:00:42 -1000
Message-Id: <4368e86005ac07d63b835ea9808acbe6be5c2a8e.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172668

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-43680.patch          | 33 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.4.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-43680.patch b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
new file mode 100644
index 0000000000..76c55edc76
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-43680
+Upstream-Status: Backport [5290462a7ea1278a8d5c0d5b2860d4e244f997e4]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5290462a7ea1278a8d5c0d5b2860d4e244f997e4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 20 Sep 2022 02:44:34 +0200
+Subject: [PATCH] lib: Fix overeager DTD destruction in
+ XML_ExternalEntityParserCreate
+
+---
+ expat/lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index aacd6e7fc..57bf103cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1068,6 +1068,14 @@ parserCreate(const XML_Char *encodingName,
+   parserInit(parser, encodingName);
+ 
+   if (encodingName && ! parser->m_protocolEncodingName) {
++    if (dtd) {
++      // We need to stop the upcoming call to XML_ParserFree from happily
++      // destroying parser->m_dtd because the DTD is shared with the parent
++      // parser and the only guard that keeps XML_ParserFree from destroying
++      // parser->m_dtd is parser->m_isParamEntity but it will be set to
++      // XML_TRUE only later in XML_ExternalEntityParserCreate (or not at all).
++      parser->m_dtd = NULL;
++    }
+     XML_ParserFree(parser);
+     return NULL;
+   }
diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/expat/expat_2.4.9.bb
index cb007708c7..22f9845a99 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.4.9.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7b3b078238d0901d3b339289117cb7fb"
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
+           file://CVE-2022-43680.patch \
            file://run-ptest \
            "
 
-- 
2.25.1


