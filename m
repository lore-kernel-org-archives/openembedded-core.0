Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5083FCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.11859.1758807663401938979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XGnyTMHY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so1184160a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807663; x=1759412463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6ITK7dEn7G83QAe6+DZmKjWlFWE3/1vaCZhxUWG79k=;
        b=XGnyTMHY6jGf8iTjL2aDMOI3ZtWeqFtrb4/2h5HiZ3ji9vTXWHrhoCHuPF8ofylir5
         goX18Q6gwiXJNpKEGyfSHEwJqgySaNtBl+7ivNCLURGkh+oXvMwSKZxqvFI5DjY103mk
         8hj8ADn91YN+BN55QPvSGi5GmzMFTh1TDD3Me52P+kjG8kCbp+QmLyrbMgpvAbcCcGMK
         6vJcpDKIkH2HZagm+XsFLlQIutP6r7MjgnsD2zD+S7K/nQerLtZChVKftX9jsv4Gb6sJ
         NyTfKCSwqZJmvZFoJjMvhnCpjteXTj3dhyoY37V2lV83Wwnrwl3jLd1fBphwaxatHFAx
         Mcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807663; x=1759412463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6ITK7dEn7G83QAe6+DZmKjWlFWE3/1vaCZhxUWG79k=;
        b=Py+7pmRX1nqPljoMJZxQENRcuiPz8ro6+hfYqss+hPT0E+mk2ajHqYn8OoQ183APPj
         KTi0J/kLmM6yDaa7Bqv7ulwv4X+jBC7Osnuu/pcimwmFUAfnaRoG14V1E9hFa0jQO4ZL
         ZHyLP/tMwdN0F+wH1UiBf48kK0sGyoQgo97AG1mzl8pcxbu7HvNczQ07OhqmzAA+1ULj
         v+b6Ea63UO5p7urA1a72FGIClhXzw+LKCJclcn+EQ8208GNI0QrPEJHqtR615An9e/wy
         eUoMZv/7ebCvmB7NDIhQDnXSJFcyKuOFDtaRKxki5ULQqXv1YYBIVcvLkjDP17z+iOlt
         O3gA==
X-Gm-Message-State: AOJu0YzCva6MH05iU5tbyhVyYjy6q8qAUlYapcJ3HWgSzQ6mNsjaoSaA
	yqvnetjNY3aRdqMY6J69AG6fDzeHI7XHrwqXrZQKfny/wEtNdYJBjigiV2xCl+4l0J9Px6BEofp
	/5EYJ
X-Gm-Gg: ASbGncua9KgUxp1nj+DHig5Ydk2NCFmFjvkYOJTX4R9dF1rsl0xYbfQ77XS5qN5G6+Q
	aBcpKIF8rc5t9AcwZSThwUofyyzBlGKguwkrHngN1Zk10gjnVtDNol1gSInz0oHaE4DsDSMuUiv
	O6S/WGMOnleq2czp+YGNbx9cCxECPbOBoplTtetxGAswHw7Z8YVYXcZezkknXRbCb0nFlhahEz7
	+1f7GgXt20W11PnGTBDlIfPto3RB68hwAkeRsU7Wu61g4nZpXvR7R4zUU0taBj1j0LJucRHcffl
	H1RwyGG/lhErbomZe4S4iPylIP+YPinmh1lxWcadkJcx610W09BdJI4+qIS7c3khyxYGeq27vdq
	ISse4e9KyTcIFHA==
X-Google-Smtp-Source: AGHT+IFgBodlie3Ijq008GxGigLhuQpeevyXY/k1DDk5kl60HSJlLd28URxrueDCnC6tsTLagR0QxA==
X-Received: by 2002:a17:90b:4b8c:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-3342a2572f8mr4904623a91.15.1758807662425;
        Thu, 25 Sep 2025 06:41:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] libxslt: apply patch for CVE-2025-7424
Date: Thu, 25 Sep 2025 06:40:45 -0700
Message-ID: <f59e07fd9f6c437e30431607763672fde42511ad.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224019

From: Ross Burton <ross.burton@arm.com>

This patch is taken from the upstream bug, and is used by Apple in their
build of WebKit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnome-libxslt-bug-139-apple-fix.diff      | 103 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb |   3 +-
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff

diff --git a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
new file mode 100644
index 0000000000..c7220ab954
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
@@ -0,0 +1,103 @@
+From 345d6826d0eae6f0a962456b8ed6f6a1bad0877d Mon Sep 17 00:00:00 2001
+From: David Kilzer <ddkilzer@apple.com>
+Date: Sat, 24 May 2025 15:06:42 -0700
+Subject: [PATCH] libxslt: Type confusion in xmlNode.psvi between stylesheet
+ and source nodes
+
+* libxslt/functions.c:
+(xsltDocumentFunctionLoadDocument):
+- Implement fix suggested by Ivan Fratric.  This copies the xmlDoc,
+  calls xsltCleanupSourceDoc() to remove pvsi fields, then adds the
+  xmlDoc to tctxt->docList.
+- Add error handling for functions that may return NULL.
+* libxslt/transform.c:
+- Remove static keyword so this can be called from
+  xsltDocumentFunctionLoadDocument().
+* libxslt/transformInternals.h: Add.
+(xsltCleanupSourceDoc): Add declaration.
+
+Fixes #139.
+
+CVE: CVE-2025-7424
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxslt/-/issues/139]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libxslt/functions.c          | 16 +++++++++++++++-
+ libxslt/transform.c          |  3 ++-
+ libxslt/transformInternals.h |  9 +++++++++
+ 3 files changed, 26 insertions(+), 2 deletions(-)
+ create mode 100644 libxslt/transformInternals.h
+
+diff --git a/libxslt/functions.c b/libxslt/functions.c
+index 72a58dc4..11ec039f 100644
+--- a/libxslt/functions.c
++++ b/libxslt/functions.c
+@@ -34,6 +34,7 @@
+ #include "numbersInternals.h"
+ #include "keys.h"
+ #include "documents.h"
++#include "transformInternals.h"
+ 
+ #ifdef WITH_XSLT_DEBUG
+ #define WITH_XSLT_DEBUG_FUNCTION
+@@ -125,7 +126,20 @@ xsltDocumentFunctionLoadDocument(xmlXPathParserContextPtr ctxt,
+ 	    /*
+ 	    * This selects the stylesheet's doc itself.
+ 	    */
+-	    doc = tctxt->style->doc;
++	    doc = xmlCopyDoc(tctxt->style->doc, 1);
++	    if (doc == NULL) {
++		xsltTransformError(tctxt, NULL, NULL,
++		    "document() : failed to copy style doc\n");
++		goto out_fragment;
++	    }
++	    xsltCleanupSourceDoc(doc); /* Remove psvi fields. */
++	    idoc = xsltNewDocument(tctxt, doc);
++	    if (idoc == NULL) {
++		xsltTransformError(tctxt, NULL, NULL,
++		    "document() : failed to create xsltDocument\n");
++		xmlFreeDoc(doc);
++		goto out_fragment;
++	    }
+ 	} else {
+             goto out_fragment;
+ 	}
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 54ef821b..38c2dce6 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -43,6 +43,7 @@
+ #include "xsltlocale.h"
+ #include "pattern.h"
+ #include "transform.h"
++#include "transformInternals.h"
+ #include "variables.h"
+ #include "numbersInternals.h"
+ #include "namespaces.h"
+@@ -5757,7 +5758,7 @@ xsltCountKeys(xsltTransformContextPtr ctxt)
+  *
+  * Resets source node flags and ids stored in 'psvi' member.
+  */
+-static void
++void
+ xsltCleanupSourceDoc(xmlDocPtr doc) {
+     xmlNodePtr cur = (xmlNodePtr) doc;
+     void **psviPtr;
+diff --git a/libxslt/transformInternals.h b/libxslt/transformInternals.h
+new file mode 100644
+index 00000000..d0f42823
+--- /dev/null
++++ b/libxslt/transformInternals.h
+@@ -0,0 +1,9 @@
++/*
++ * Summary: set of internal interfaces for the XSLT engine transformation part.
++ *
++ * Copy: See Copyright for the status of this software.
++ *
++ * Author: David Kilzer <ddkilzer@apple.com>
++ */
++
++void xsltCleanupSourceDoc(xmlDocPtr doc);
+-- 
+2.39.5 (Apple Git-154)
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
index d251fa8122..e08e92085d 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -13,7 +13,8 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
+SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
+           file://gnome-libxslt-bug-139-apple-fix.diff"
 
 SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
 
-- 
2.43.0


