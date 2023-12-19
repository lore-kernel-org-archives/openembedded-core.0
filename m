Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA44CC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:48:49 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.13930.1702993723863548312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0EnmP8pt;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.53, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-203ab4be82aso1807024fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702993722; x=1703598522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5hkgD0rtn+cg6Aip0kaFvEhdZUisDU4HjeeVicDYfE=;
        b=0EnmP8ptAnEkQaCfca+ULtzvendRjhLZ4yQfsHyvi9qGrZDZvKHzG2uA1nXtkd3215
         3kMQ58v5SQINzCfwfieNABnNYWP62rjP6iNwDNdIez9kbQx1HT+QDg6LPfpmqu2hfrX5
         2DgKPCWdHXnJDa/JNpUn6p3nVtKCQOI/0GLpWjU3G78sNOoJ0PFeLWqg1UY9Hp23MgnZ
         oCiueEYk/y5b/t4S00UZF1r+8afaKDHtu3n4UyrRx4cWZ2SueJa+o6JL5R25SqnBACuF
         dmm1gFKCKh6N4y+JfXmRBPI9Wua7ur3ZldsPTBX4An3CAq4lrLUqeNYw4aIoCG73EcPB
         Bimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993722; x=1703598522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5hkgD0rtn+cg6Aip0kaFvEhdZUisDU4HjeeVicDYfE=;
        b=OBZEweNSEkR2CCZm43vhkLc3p2r66pU150LepZnHDk8jw6uf8Sn5ESatSpARqkiVIZ
         vybF7dEzVtu4kBvo0mpz2uh+JUd6X4sAqhB4xTn7ABBcpqD4/BCjn57ZWpx7SkPNF+ao
         bvG09d0o2EfkspaN5noyLBg+Njb3kxShpksyQTJX9/dyp+CMb3w58RUvsKJjcOpvfiXJ
         +Fg1C3wc77GETEzLrOJzy/hPWBDwTf+FXouPZ7YrTiuwAUfXjmzdSztEq9/ZVn26o9fK
         /0OXWr/nAuygN3FBanEBHNZm1bLdp3fwQsCtXKdx7V/85XSq9eBk8uSRANtipoiMi2VZ
         NQBg==
X-Gm-Message-State: AOJu0YwFh3Z4xz1Umj8xDVr0sDUOMwouqYqUVihePgfjc3Hn63/E2t9e
	EAGvayU8vHizBAZ222cZhf4OAr5dqcbAXLyccZpC+A==
X-Google-Smtp-Source: AGHT+IGcTQoSKS4Lfnq1g8Sn+OE0jwYVaft9K5DE0CZ97fD7kv7T/pFcPIe3e303ZjkZYsS4kAgVsw==
X-Received: by 2002:a05:6870:6491:b0:203:f7f2:ca8a with SMTP id cz17-20020a056870649100b00203f7f2ca8amr511512oab.110.1702993722316;
        Tue, 19 Dec 2023 05:48:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h4-20020a655184000000b0059d6f5196fasm16815398pgq.78.2023.12.19.05.48.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:48:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] libxml2: Backport fix for CVE-2021-3516
Date: Tue, 19 Dec 2023 03:48:23 -1000
Message-Id: <29c182375d91806d1e802b026f84b24e7c5d4b35.1702993573.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702993573.git.steve@sakoman.com>
References: <cover.1702993573.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192737

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2021-3516.patch        | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
new file mode 100644
index 0000000000..200f42091e
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
@@ -0,0 +1,35 @@
+From 1358d157d0bd83be1dfe356a69213df9fac0b539 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 21 Apr 2021 13:23:27 +0200
+Subject: [PATCH] Fix use-after-free with `xmllint --html --push`
+
+Call htmlCtxtUseOptions to make sure that names aren't stored in
+dictionaries.
+
+Note that this issue only affects xmllint using the HTML push parser.
+
+Fixes #230.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]
+CVE: CVE-2021-3516
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xmllint.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmllint.c b/xmllint.c
+index 6ca1bf54d..dbef273a8 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -2213,7 +2213,7 @@ static void parseAndPrintFile(char *filename, xmlParserCtxtPtr rectxt) {
+             if (res > 0) {
+                 ctxt = htmlCreatePushParserCtxt(NULL, NULL,
+                             chars, res, filename, XML_CHAR_ENCODING_NONE);
+-                xmlCtxtUseOptions(ctxt, options);
++                htmlCtxtUseOptions(ctxt, options);
+                 while ((res = fread(chars, 1, pushsize, f)) > 0) {
+                     htmlParseChunk(ctxt, chars, res, 0);
+                 }
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 5eac864098..aa17cd8cca 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -41,6 +41,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2023-39615-pre.patch \
            file://CVE-2023-39615-0001.patch \
            file://CVE-2023-39615-0002.patch \
+           file://CVE-2021-3516.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.34.1


