Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944C5CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:27:47 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.30185.1759742865555354525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Kp8U5lyy;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-782023ca359so4452205b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759742864; x=1760347664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gC4069pAStW7StPF4K65x/ZmJoHHnqc4Aw5ovl2uG7M=;
        b=Kp8U5lyy0DbVsKtbwxvSxgexxxs6swnoNNvePpgYUpigHgrurK6NCEBpxH9DpX64AF
         5F55L1redA/yh+3d3lc9hMPCUeOuh6VAtBtdPYU77MFQdZJhINggrSZyv/bX6Z93QvyC
         ynMOEnxVrKLECX5QWq8mi7sltLgOns34oBlSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742864; x=1760347664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gC4069pAStW7StPF4K65x/ZmJoHHnqc4Aw5ovl2uG7M=;
        b=X0NWMDUZSumVJWKiosfYf8SW2cgyUtC9uxYGhmu/uHyYkDUHvpfU7ZrCt/fDRgh6vP
         UE1W2IFIJe3MMP731XdmDMNDtbcfDCkGFD1uIyYSwllX1QL/fhtuoZmHiaz+VFGDdtg+
         NHYj5ybez8FOhHId5aXfiIdEETZf8t5hClY/f+BbHZd9X7onpus7ItTq9Asl2DBoBgtO
         9HAVy8qRlVB2JSl3fDx1xTYYt3sU2+CAZYk83xzQZPc7PQZY3iwizJJKHKJRVcMPhypO
         +t4/O2jGWcKb1HKNURhVfi+EbDD+VEmeff3GUSEm7o9c/TJHda3mTWdD6nYZBZOW+8nK
         3vtw==
X-Gm-Message-State: AOJu0Yw5ocSBxgqDcLdcuLTFldY+lYF8MYYnbPU0tz2cT9ey52hgwlX/
	D1Z5a/0gMJDxkLus38kJ9w052VyFULbOZ+aHmfvck2vmxkVfF09lVtDf9WaK6cB6wfbnf6BcZPW
	qTckjV7Y=
X-Gm-Gg: ASbGncssfQhjE2ln5s5u51on8Lwz3NRtfiCoPLTW7qPFy1ZeOm+KAcdAXYfhjdGoqK+
	u03kc+vqGeAKMFdnJ3OjGiTsWYZQLfw1ur6U06MiOImXew6dLcB/ZwNLispe6nsovDDg3pnKTSX
	Vb0mO4ZbwvKy2wHFqHWBJ79X5kKVSkJtJ3cllnV8UrI4ZMDKchLfx1H3wAQiwD8lnY6vcRA5QXJ
	x5UNQhLHeon45IhgU0DonqTt3AuPZfEbQlp1wJBsAfvW91LNBUBL9SuybMMGl5o6r49/SR4xhaI
	358jF8PV97b+8stP2xfqFk4yLypGEkQSfEOvjxny8Lrn4vuDV/cFbTZD0LDyQ3bfHpJ/n5Iat2d
	kt+x53wGObKkup5JhMJzmcCfHzdpLdEPcjBq00lu+Ikyx6AQEhulTd4SJ+RyOrlqwP/lfUbJEm8
	FrrOXL
X-Google-Smtp-Source: AGHT+IHySrjerJLKFupFFpFsUt5I9YoK+IwC7xR0lNgPtwBMZUUGALGSRQXoBDXq3P14zME5FtZJ+w==
X-Received: by 2002:a05:6a00:1301:b0:781:2069:1eea with SMTP id d2e1a72fcca58-78c98ce0384mr15198088b3a.24.1759742864204;
        Mon, 06 Oct 2025 02:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fce:10c0:180:2ced:64b:ed9b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9daf3sm12050579b3a.8.2025.10.06.02.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:27:43 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libxslt: Patch for CVE-2025-7424
Date: Mon,  6 Oct 2025 14:57:35 +0530
Message-Id: <20251006092735.1466707-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 09:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224470

From: Vijay Anusuri <vanusuri@mvista.com>

This patch is taken from the upstream bug, and is used by Apple in their
build of WebKit.

Origin: https://gitlab.gnome.org/-/project/1762/uploads/627ae84cb0643d9adf6e5c86947f6be6/gnome-libxslt-bug-139-apple-fix.diff

Ref: https://gitlab.gnome.org/GNOME/libxslt/-/issues/139

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


