Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099F1C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:18 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.7845.1646406301644090728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=q0fEcoHb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id z2so7959230plg.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NrFuNB8fEPnlZoo6sufh0ZnuR8tRVkiQ4CDM9TrntF8=;
        b=q0fEcoHb4+dzFgmMsdrB8uLMzo/z5pFgbZR5aN1v7ClFMInSAThPoMT4oWKNrM3wC8
         5geLAwAv2INOe+dX6I92TXmpGMJQJ6X5N5ZxYJld6A3gH90m9o2q8mhLH7ktc6ZHA624
         f3UajwStLnnMw3lk0U0Yj8jR2WOVi4vYws2PROpGS/bRP8cZV1TIVvGJ6Aml4GFOLMK/
         3y1RIwjHbo95MqpWibkORiqkHKP+jIp95GR2SqtHQZbNFc4EXlD863gWQjZMkJNM9M8C
         4dzTCNq7CIEjnxVVCbOi68UWSthsqRD0xNP2twphGs4RP3x+AyfY317U3CXF8FoHlYKP
         iVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NrFuNB8fEPnlZoo6sufh0ZnuR8tRVkiQ4CDM9TrntF8=;
        b=zlpQ9rYRWTFqD9jW/PeLXeL5EP7yVJLJshS4P81cVbYzOFB4TEjvRDeWoSqfSOz8b6
         I73ir9wwZAa2AcMXxKsUEEMHlXWePoYQLAjFh79HOInATurUivFrJgQUeAQooEBJ4KHd
         Kwic739NtPlnRGbIkpHOXoHaA46QURJFoqFFfLHglUSg+BSnkiHoAMLoDBNNg6S8Q0Vo
         actMtMZ8ofeTekLdaCn2Uq/u2LcyDGFJEJdUuwhjunDbgHC/B/xw36GpbGNAzqj0CeDK
         XGFXC3p1EjCVFUqvEOrMMX22EWfbsP5xopCLcw7M+RpKj2OJfFZ0jefCOrL/9tdM64yK
         zg7g==
X-Gm-Message-State: AOAM5334RDw6DwADEDlc78vl6fwqQkNNQ8Bj/PMSV5J7ktHJ9JzVQaQR
	SMvJXPC3SQGBEwsiFnF7teUlXyoPO+KsYp/fmAU=
X-Google-Smtp-Source: 
 ABdhPJz75SPsCxGwBL9flOL9OUpw/ndo7YoOh3cBenMeHfvpNOhEE+A2rYJpmv6rEjzeaScof7Y94A==
X-Received: by 2002:a17:902:aa08:b0:151:a5ff:eca3 with SMTP id
 be8-20020a170902aa0800b00151a5ffeca3mr9923571plb.19.1646406300642;
        Fri, 04 Mar 2022 07:05:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.04.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/18] expat: fix CVE-2022-25314
Date: Fri,  4 Mar 2022 05:04:15 -1000
Message-Id: 
 <b92c33285c5f886c95a3734e61007b522b62a71f.1646406001.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/162726

In Expat (aka libexpat) before 2.4.5, there is an integer overflow in
copyString.

Backport patch from:
https://github.com/libexpat/libexpat/pull/560/commits/efcb347440ade24b9f1054671e6bd05e60b4cafd

CVE: CVE-2022-25314

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-25314.patch          | 32 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25314.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25314.patch b/meta/recipes-core/expat/expat/CVE-2022-25314.patch
new file mode 100644
index 0000000000..2f713ebb54
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25314.patch
@@ -0,0 +1,32 @@
+From efcb347440ade24b9f1054671e6bd05e60b4cafd Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Tue, 15 Feb 2022 11:56:57 +0000
+Subject: [PATCH] Prevent integer overflow in copyString
+
+The copyString function is only used for encoding string supplied by
+the library user.
+
+Upstream-Status: Backport
+https://github.com/libexpat/libexpat/pull/560/commits/efcb347440ade24b9f1054671e6bd05e60b4cafd
+
+CVE: CVE-2022-25314
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4b43e613..a39377c2 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7412,7 +7412,7 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+ 
+ static XML_Char *
+ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+-  int charsRequired = 0;
++  size_t charsRequired = 0;
+   XML_Char *result;
+ 
+   /* First determine how long the string is */
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 4d945a295e..dd8eeddf80 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-25236.patch \
            file://CVE-2022-25313.patch \
            file://CVE-2022-25313-regression.patch \
+           file://CVE-2022-25314.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


