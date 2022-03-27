Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD600C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.780.1648399288645619675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7H9ZEA3x;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id w8so12845394pll.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JOxFewf5vjPJ/GdgGCqx0tayAjccwk9KV7VkpdU215w=;
        b=7H9ZEA3xzCbDmqgwsDF7ei8rKLBuRZq/rSDDRjtUX/oYEW91IdDeuV3Vm3MoipqYVq
         DKkT5fujIsLxhjYKc3UX5EFTnKykF2GHyT2B0/WzBFbGqfjetJ0GKn7NQ/7//OEIOEEo
         FArHLRdZa8JqTKpehrcCYRYam1IhsYgT6roiWZUPQveFbp2d+pkOw6AIROgsWw4aTxLK
         xtTJ2hFJrkXXnwM4yhe4tCHbBQzHvdrHBp8YY3pzoQUTEz1kLZiG0ZVHGcwlDqpuYmxD
         Zrk9bwjJ4z33vsl6xjVUJ5/ROM4zUtf7hGdZtYjo0Ux0gRhfXjg3L+75xRMoAYCcaczP
         ymfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOxFewf5vjPJ/GdgGCqx0tayAjccwk9KV7VkpdU215w=;
        b=zX5fk0Kxoih/Ksbn3vaFkqe3okCiaAxF1C0BK9Ocb7EO9kvqw5SOCd9fYRm9ahDR+7
         Uxx0c+k+/FH5y9sS9WkGmU0q6O2cOwH/SntlWBV9CTBBNPpUzksWHV4BKB60M+bT+ebI
         iEydM0deu4LuRsChdik+i6b8LbNDbGhIr/aIVPlFK5nLxMlj3eiCeBiFeWcQtZvgzrfR
         EMOZ4WR1dngXWulkP54px5GyV0Re1T6582AHYWinYpsXef+RlYX+3fDOVjGCR03q4Ts9
         MVPzlCLv3UzK30HVPcvTQ/Lv0Y2wIrwVzRMrkh/ZEjNqLM1zJSBhokjBQcz+M2rccZEQ
         MKHA==
X-Gm-Message-State: AOAM533vFkdTNw3c7aaSXVFwdN+IwvmhakEiZvGNEMiqfK9/476Mg+Ik
	CW99gwKrJHZIl9CeEMSJ0j05DT22oMrW20Sblmg=
X-Google-Smtp-Source: 
 ABdhPJx9SvCCGBhlvoI3WwBUvWKTNAZGBmUo83v8QhMsPpXm3VKzlXifAWhC1jya3NXMQ9AIFRaW7Q==
X-Received: by 2002:a17:902:74cc:b0:155:e153:6273 with SMTP id
 f12-20020a17090274cc00b00155e1536273mr11563947plt.55.1648399287750;
        Sun, 27 Mar 2022 09:41:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/10] libxml2: fix CVE-2022-23308 regression
Date: Sun, 27 Mar 2022 06:40:57 -1000
Message-Id: 
 <906ffe5bf83c0e587299aaedb9382ce04c3c7acf.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163673

From: Ralph Siemsen <ralph.siemsen@linaro.org>

The fix for the CVE in 2.9.13 caused a regression which
was addressed after 2.9.13.  We import that patch here.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2022-23308-fix-regression.patch       | 98 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
new file mode 100644
index 0000000000..7fc243eec1
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
@@ -0,0 +1,98 @@
+From 646fe48d1c8a74310c409ddf81fe7df6700052af Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 22 Feb 2022 11:51:08 +0100
+Subject: [PATCH] Fix --without-valid build
+
+Regressed in commit 652dd12a.
+---
+ valid.c | 58 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+---
+
+From https://github.com/GNOME/libxml2.git
+ commit 646fe48d1c8a74310c409ddf81fe7df6700052af
+
+CVE: CVE-2022-23308
+Upstream-Status: Backport
+
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+diff --git a/valid.c b/valid.c
+index 8e596f1d..9684683a 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,35 +479,6 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
+-/**
+- * xmlValidNormalizeString:
+- * @str: a string
+- *
+- * Normalize a string in-place.
+- */
+-static void
+-xmlValidNormalizeString(xmlChar *str) {
+-    xmlChar *dst;
+-    const xmlChar *src;
+-
+-    if (str == NULL)
+-        return;
+-    src = str;
+-    dst = str;
+-
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
+-}
+-
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2636,6 +2607,35 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ static int
+ xmlIsStreaming(xmlValidCtxtPtr ctxt) {
+     xmlParserCtxtPtr pctxt;
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index c45cf4423e..c4bb8f29e0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -29,6 +29,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2021-3518.patch \
            file://CVE-2021-3541.patch \
            file://CVE-2022-23308.patch \
+           file://CVE-2022-23308-fix-regression.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.25.1


