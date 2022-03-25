Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B233C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 15:36:50 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.6967.1648222609638941468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 08:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nqGu2Nze;
 spf=pass (domain: linaro.org, ip: 209.85.160.174,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f174.google.com with SMTP id a11so6780829qtb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXUgefOlwkkiQ+dk3M+IspKjLzs2eQhvEOWOH/ynqXc=;
        b=nqGu2Nzepl9x7J9UZfG+cge9CBt2XZPyZfEsRZiOAVczHMVwQtOTZczkoUpzycSQD4
         UOfWcoiXwHW1QCiE1E2VMYvfgEBGStK+YdfHAf/J0ym3o4f78bxUy5Uoj8Zgl9e+PhgS
         wyD8yhep2F3qw9lP+JpuFZbpA7rdvcfX2nBdhp6J0OhLbquUj86o5AFR27MP8WdTs1L+
         2M+hJdKkQjf048f7fn6u614d4WhwqiE7c/rcHG+SD9aNpzV3lqbxsytIGy7wCRhOsc6g
         6KqxX/85dyKSE6ykpFWsbZJOHUTVE9Je/qqyKEZ1SXc0eMFwsrWq/SAG4mUge1kgFiZO
         AyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXUgefOlwkkiQ+dk3M+IspKjLzs2eQhvEOWOH/ynqXc=;
        b=al+RsaMAIIcdzkCf4MJpRjl680+RYE4TttJKtUNtuMx3vCGu5nUGA6mWsOd9k9o8aV
         pDVNNHVfysXbhaMGfSBFh0aNP/YRKROW+4ttjf4Ruo15TrQD+NU7J4QmV4jTd4Su8rQd
         VBl8hLmW38sR77iSdyMDAtNAAi3WxoACk8wkd83V3syzWhlwogFmYBu8j+UjX5m+pwX6
         msGL54WINi6vjhyrM4i/UDD9JJ0MUZxbs5uv+kLc719HQTlAVSWPdCe/Af8E1IW4Q3rG
         krzhnpQ8khm0znToTiH/fjquGOY43H+CfBG54ppFtrFIRHlPOEPyKRNStqKnhX8MvtKC
         uP/g==
X-Gm-Message-State: AOAM532qwhWZTNFzk0WI3BfjFeOFJc1n/IOdyF1loSsMBSpsnlVD+VAM
	ydfm7kqNuNXUpCJoCQYVmcVudbFflNyNOw==
X-Google-Smtp-Source: 
 ABdhPJyNUxEBAdO9mjn/rkKKYh1xx+dchwes2LQTmJUuSSx0JNU3PfISDEWbXfsgKnFs8WMVo09wQA==
X-Received: by 2002:a05:622a:11c7:b0:2e1:b594:cb1d with SMTP id
 n7-20020a05622a11c700b002e1b594cb1dmr9787227qtk.59.1648222608754;
        Fri, 25 Mar 2022 08:36:48 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05620a03cc00b0067d370e414esm3410532qkm.15.2022.03.25.08.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 08:36:48 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] libxml2: fix CVE-2022-23308 regression
Date: Fri, 25 Mar 2022 11:36:43 -0400
Message-Id: <20220325153643.2084784-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 15:36:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163644

The fix for the CVE in 2.9.13 caused a regression which
was addressed after 2.9.13.  We import that patch here.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
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


