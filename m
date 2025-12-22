Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC89E6ADC3
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87797.1766434098499771442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hENWDwxp;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b76b5afdf04so633101166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434097; x=1767038897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSheDIEDDvfZoOVhirJOE4IaX9cfOJejg9ViVSUYKpU=;
        b=hENWDwxpklgdi1zJKcYVk75Xpyz5w83OFR94TEuBF+P0ShEcE1Swlaqck6y//kT8+S
         WlFutQHGD+uAjGRULvU5IyskfQ2clCy2GDUNr5vuSrsNPDND+AuVpTG/ZSlPxuftENyz
         ftm/ww46uBQ+jJMx0FDnXwGJcoTmO87CjOJbi3cASoWZoIZb+9hqwzctH4fQNMq3cQ5n
         bmPjIxlZnyCcXIplUv5EM3Q4bIhwbK868Kpl/5BOw64HrF4UZpXZ7gxdLRIs2ep+Cn/R
         h4y0CbsJlExeHkrbN0Ee8XVBWzKTcQgenpLAsiemyv9BahtRI3Bsy9WF00QOshLH5BQJ
         xNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434097; x=1767038897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSheDIEDDvfZoOVhirJOE4IaX9cfOJejg9ViVSUYKpU=;
        b=Vu7aFZb1ht9dSduVlspftpCAs6Erl3dK0X5DpLju3bj+w68aAul0nUMTS/cvBVKJS0
         Yu/oJpNoEYaIOW1HvU0unXKtNgUk4m3bRHOeRDbX3hzLq6lXY1knVWRz+68X5MDttQ58
         ANgyq0bD1WnnPvwrZid63Lhal2sXTU9QHTNhY3JySmKyaxh9ZSTvC4s/bUk6RIDBMSuc
         tnP1U1ZbFkb+alIZmmdkHNM2lqprufQflyqKtWPCZA4qk3a0G/NELs76dH1P01KSxmtl
         ORNia7ONhqgQtRWPgQeI5QlrzB+zoD5EX/2wAX7iIgvB29B/L/LxzUkzs9/mRitAlDJz
         15rQ==
X-Gm-Message-State: AOJu0Yx7XboGs+lU6lYE2wR/SjVFeJBlTW3lAnBPoMfNWAHY6aoHZw8F
	mbhDJz4eMp9Owd+h5LdSEsUhV412kWvyYwxXg930y9aE0XQrWBGUEjVPqhfZJg==
X-Gm-Gg: AY/fxX4ZfKkz8l50QyAnDxBNMZBqKa/Wf1ox0coUfB4NwMBwEP0i0uGoiB2bGRKF06H
	ZCNwIrGoivNuYirXhcIR6WxysbV3G+FW4SSDkAxjZm84AnH6+pGpGGA4oErt0KQZmoi/c2pti76
	lh8tfFsC9bqPrIs7614ocIXegOh6aD3i8WRQQ6TsA6Z9sf++tdy2RP4X5Hr1866lkF1RCQabeo0
	nwUT29SExcMfgL26IdHWDyHqFpVL79aqLAfPaRfBYW0QfVszIpnq9CwWABnwIQwQuFMPaxOPL18
	StoWVjpdj+Bwty56Zna1acViZqvP7r12DAUA972gNrcu9BLssLSwpyZ0gFa+qjpcerJ1PKyLKfE
	Rsczmrk7Xdz+uWueRC3dApXv1PyBRJcLadbElVD1w8eicu2l3DHd26rPPqAFPsWdNeR4UwnYnNu
	fcrhytHk9eB9m1pvgZOyO3ipPVOLHVBRt7ONh+urxAdRiNwJ0=
X-Google-Smtp-Source: AGHT+IGk+Onb5bhJw/R9ihuF0Nm9drkqgQ2z0GPRVVZnNRKLj69Mt8tDda5/hTBhF7NkTKD4tpFTbQ==
X-Received: by 2002:a17:907:86a4:b0:b7a:6eed:b590 with SMTP id a640c23a62f3a-b8036f2d024mr1318340466b.25.1766434096786;
        Mon, 22 Dec 2025 12:08:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 044/114] libxslt: upgrade 1.1.43 -> 1.1.45
Date: Mon, 22 Dec 2025 21:06:26 +0100
Message-ID: <20251222200739.2278706-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228369

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gnome-libxslt-bug-139-apple-fix.diff      | 103 ------------------
 .../{libxslt_1.1.43.bb => libxslt_1.1.45.bb}  |   5 +-
 2 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
 rename meta/recipes-support/libxslt/{libxslt_1.1.43.bb => libxslt_1.1.45.bb} (92%)

diff --git a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
deleted file mode 100644
index c7220ab954..0000000000
--- a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
+++ /dev/null
@@ -1,103 +0,0 @@
-From 345d6826d0eae6f0a962456b8ed6f6a1bad0877d Mon Sep 17 00:00:00 2001
-From: David Kilzer <ddkilzer@apple.com>
-Date: Sat, 24 May 2025 15:06:42 -0700
-Subject: [PATCH] libxslt: Type confusion in xmlNode.psvi between stylesheet
- and source nodes
-
-* libxslt/functions.c:
-(xsltDocumentFunctionLoadDocument):
-- Implement fix suggested by Ivan Fratric.  This copies the xmlDoc,
-  calls xsltCleanupSourceDoc() to remove pvsi fields, then adds the
-  xmlDoc to tctxt->docList.
-- Add error handling for functions that may return NULL.
-* libxslt/transform.c:
-- Remove static keyword so this can be called from
-  xsltDocumentFunctionLoadDocument().
-* libxslt/transformInternals.h: Add.
-(xsltCleanupSourceDoc): Add declaration.
-
-Fixes #139.
-
-CVE: CVE-2025-7424
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxslt/-/issues/139]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libxslt/functions.c          | 16 +++++++++++++++-
- libxslt/transform.c          |  3 ++-
- libxslt/transformInternals.h |  9 +++++++++
- 3 files changed, 26 insertions(+), 2 deletions(-)
- create mode 100644 libxslt/transformInternals.h
-
-diff --git a/libxslt/functions.c b/libxslt/functions.c
-index 72a58dc4..11ec039f 100644
---- a/libxslt/functions.c
-+++ b/libxslt/functions.c
-@@ -34,6 +34,7 @@
- #include "numbersInternals.h"
- #include "keys.h"
- #include "documents.h"
-+#include "transformInternals.h"
- 
- #ifdef WITH_XSLT_DEBUG
- #define WITH_XSLT_DEBUG_FUNCTION
-@@ -125,7 +126,20 @@ xsltDocumentFunctionLoadDocument(xmlXPathParserContextPtr ctxt,
- 	    /*
- 	    * This selects the stylesheet's doc itself.
- 	    */
--	    doc = tctxt->style->doc;
-+	    doc = xmlCopyDoc(tctxt->style->doc, 1);
-+	    if (doc == NULL) {
-+		xsltTransformError(tctxt, NULL, NULL,
-+		    "document() : failed to copy style doc\n");
-+		goto out_fragment;
-+	    }
-+	    xsltCleanupSourceDoc(doc); /* Remove psvi fields. */
-+	    idoc = xsltNewDocument(tctxt, doc);
-+	    if (idoc == NULL) {
-+		xsltTransformError(tctxt, NULL, NULL,
-+		    "document() : failed to create xsltDocument\n");
-+		xmlFreeDoc(doc);
-+		goto out_fragment;
-+	    }
- 	} else {
-             goto out_fragment;
- 	}
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 54ef821b..38c2dce6 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -43,6 +43,7 @@
- #include "xsltlocale.h"
- #include "pattern.h"
- #include "transform.h"
-+#include "transformInternals.h"
- #include "variables.h"
- #include "numbersInternals.h"
- #include "namespaces.h"
-@@ -5757,7 +5758,7 @@ xsltCountKeys(xsltTransformContextPtr ctxt)
-  *
-  * Resets source node flags and ids stored in 'psvi' member.
-  */
--static void
-+void
- xsltCleanupSourceDoc(xmlDocPtr doc) {
-     xmlNodePtr cur = (xmlNodePtr) doc;
-     void **psviPtr;
-diff --git a/libxslt/transformInternals.h b/libxslt/transformInternals.h
-new file mode 100644
-index 00000000..d0f42823
---- /dev/null
-+++ b/libxslt/transformInternals.h
-@@ -0,0 +1,9 @@
-+/*
-+ * Summary: set of internal interfaces for the XSLT engine transformation part.
-+ *
-+ * Copy: See Copyright for the status of this software.
-+ *
-+ * Author: David Kilzer <ddkilzer@apple.com>
-+ */
-+
-+void xsltCleanupSourceDoc(xmlDocPtr doc);
--- 
-2.39.5 (Apple Git-154)
-
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
similarity index 92%
rename from meta/recipes-support/libxslt/libxslt_1.1.43.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.45.bb
index 3393be7ebe..c3440a99d4 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
+SRC_URI[sha256sum] = "9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee5d216e"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.3


