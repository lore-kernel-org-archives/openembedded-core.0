Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF7FCCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:29 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.9238.1760038285179044806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JJuV2+nH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1341873b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038284; x=1760643084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2Dk3B6aFLb4eA3/NJvBvsLTdiNCn+Tb8GkJ3l4zIVA=;
        b=JJuV2+nHUd/xXjfGBaMKBewfsKVL7ETUtAlBir1056r/PdVN/wyksW1JXPOOB/7697
         9EdsNBwRNMVFFfKRBfUEBLQEMieJCYt3CBmRf+UlZgnupSHMU1Cel94Fey44Dkt97xoR
         VGKm+ldIv7K4n4LHO/RqyvePEFJRpXLf/0n1NDmaJTihs1f2D40+H3TlAMOLFq1UE3kX
         o5h4E0g/ClC16sJCd2iedV88RW9a9sEDCTvWC11rs7j4XDK3RW/JTkhemprZRGCR1LT7
         +2yak2ik3CINHOIJpyQ+hg/2ePhJ+peFk4hBqoMhLot/4T1AdXzUcOqIUjg/3P/NrOs+
         PRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038284; x=1760643084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2Dk3B6aFLb4eA3/NJvBvsLTdiNCn+Tb8GkJ3l4zIVA=;
        b=mvnXkx4rOVKdD3OHj6G5wixccvYahsxwF3qW3di1JqEKPFAFFxo6Yi5iKiaKRBvwMp
         46Ser9Dw2K574qgYCKwpAJp5NgTaKOALRLO9HEaz2PTjjzZYLmXII9EZBLMLqWehrd6i
         mfQO23xLdro0g6bmkxWV+jKJvH4gsZcIJNR4I+MIGgfs+qQ+eDE+JRIQz31QGDxTxNeF
         nFmjc8cZR0tWaQxoQDOKAxb3OODEg1q9s++0qviPJ8U09DMe6qG9FW4qvCeUHyCRCwol
         r8hhZt+cXQKhsQe51Vv5Vi878Zck7K/4DQGNa+ABwYr/7O9Ujk05dToaoOuAVQjmmPlx
         oyLg==
X-Gm-Message-State: AOJu0Yw/PQYHQwH1ub9pI3Yshj3mEbVR808cfWJh5tpY4YZpBhrkiYzt
	q+lUBy+FiEapIm/Ru+6DQryvgQk96ieD/zL/r6zuEjclcP83c9A+tufzsR92577Xsc51/jkF4cL
	RYBsl
X-Gm-Gg: ASbGnctxRe3He1RGMOhRbd7+SQOwS9GwpZ+qeU3Ptn4nD4+ePjbpWWB5Xj1wVVCJ+Fg
	vYCj0IbUId7Ir+myUomTCeAWWp+lDTcwoBKyzQAaKx5ROGCTdhapTymCOR8d8d+Cj9q5bNnzhhM
	YrMPs4Tm5NkqxJ154lDX84r2QPrwePdGV4CrauqyW1d/VHPBh+e9pPqfHCFQoJNo+xn4ERH5As8
	izsJsQGMn5d9xA85h1fkqvdfAkBwZzYnZOhHZcMrLD5TTdPVZBueOnWBQTXz8qmM4EnkKCFvqBs
	YRYPOsBjiuEijxHZtGkINsMy75WC83zmP6P5p0K/innY6rBoRla30Ljfwpkrw72f2r7P6g8FCPA
	6IC5EqHENOu7MUsoONosrXbha8t4cMayC4CSFpD1Zq7zIEpQ9
X-Google-Smtp-Source: AGHT+IHuPsxGzGXdMtcPICkd43eshWOOZtL+XD8/e39lNi76AwFw+oJO3LtlFkoepMQwvvcUkD7mnA==
X-Received: by 2002:a62:be0f:0:b0:77d:98ee:e1c5 with SMTP id d2e1a72fcca58-792323cfdbfmr11133242b3a.15.1760038284061;
        Thu, 09 Oct 2025 12:31:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/24] libxslt: Patch for CVE-2025-7424
Date: Thu,  9 Oct 2025 12:30:48 -0700
Message-ID: <2e2fa1ae7f24dadae9cb8371174aa7744aa42028.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224623

From: Vijay Anusuri <vanusuri@mvista.com>

This patch is taken from the upstream bug, and is used by Apple in their
build of WebKit.

Origin: https://gitlab.gnome.org/-/project/1762/uploads/627ae84cb0643d9adf6e5c86947f6be6/gnome-libxslt-bug-139-apple-fix.diff

Ref: https://gitlab.gnome.org/GNOME/libxslt/-/issues/139

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/libxslt/CVE-2025-7424.patch       | 105 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-7424.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2025-7424.patch b/meta/recipes-support/libxslt/libxslt/CVE-2025-7424.patch
new file mode 100644
index 0000000000..c6b234a818
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2025-7424.patch
@@ -0,0 +1,105 @@
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
+Origin: https://gitlab.gnome.org/-/project/1762/uploads/627ae84cb0643d9adf6e5c86947f6be6/gnome-libxslt-bug-139-apple-fix.diff
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxslt/-/issues/139]
+CVE: CVE-2025-7424
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libxslt/functions.c          | 16 +++++++++++++++-
+ libxslt/transform.c          |  3 ++-
+ libxslt/transformInternals.h |  9 +++++++++
+ 3 files changed, 26 insertions(+), 2 deletions(-)
+ create mode 100644 libxslt/transformInternals.h
+
+diff --git a/libxslt/functions.c b/libxslt/functions.c
+index da25c24..8a9bdc2 100644
+--- a/libxslt/functions.c
++++ b/libxslt/functions.c
+@@ -41,6 +41,7 @@
+ #include "numbersInternals.h"
+ #include "keys.h"
+ #include "documents.h"
++#include "transformInternals.h"
+ 
+ #ifdef WITH_XSLT_DEBUG
+ #define WITH_XSLT_DEBUG_FUNCTION
+@@ -152,7 +153,20 @@ xsltDocumentFunctionLoadDocument(xmlXPathParserContextPtr ctxt, xmlChar* URI)
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
+ 	    valuePush(ctxt, xmlXPathNewNodeSet(NULL));
+ 
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 7299eb5..6976a04 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -42,6 +42,7 @@
+ #include "xsltutils.h"
+ #include "pattern.h"
+ #include "transform.h"
++#include "transformInternals.h"
+ #include "variables.h"
+ #include "numbersInternals.h"
+ #include "namespaces.h"
+@@ -5753,7 +5754,7 @@ xsltCountKeys(xsltTransformContextPtr ctxt)
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
+index 0000000..d0f4282
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
+2.25.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 2291ed2cad..f1532a05c1 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
            file://CVE-2023-40403-003.patch \
            file://CVE-2023-40403-004.patch \
            file://CVE-2023-40403-005.patch \
+           file://CVE-2025-7424.patch \
           "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
-- 
2.43.0


