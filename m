Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8AECAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 12:58:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12323.1757422686491530834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 05:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6F215A1
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 05:57:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B35B63F694
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 05:58:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libxslt: apply patch for CVE-2025-7424
Date: Tue,  9 Sep 2025 13:58:00 +0100
Message-ID: <20250909125800.3124174-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909125800.3124174-1-ross.burton@arm.com>
References: <20250909125800.3124174-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223109

This patch is taken from the upstream bug, and is used by Apple in their
build of WebKit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gnome-libxslt-bug-139-apple-fix.diff      | 103 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb |   3 +-
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/files/gnome-libxslt-bug-=
139-apple-fix.diff

diff --git a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-app=
le-fix.diff b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-ap=
ple-fix.diff
new file mode 100644
index 00000000000..c7220ab9545
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.=
diff
@@ -0,0 +1,103 @@
+From 345d6826d0eae6f0a962456b8ed6f6a1bad0877d Mon Sep 17 00:00:00 2001
+From: David Kilzer <ddkilzer@apple.com>
+Date: Sat, 24 May 2025 15:06:42 -0700
+Subject: [PATCH] libxslt: Type confusion in xmlNode.psvi between stylesh=
eet
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
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxslt/-/iss=
ues/139]
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
+=20
+ #ifdef WITH_XSLT_DEBUG
+ #define WITH_XSLT_DEBUG_FUNCTION
+@@ -125,7 +126,20 @@ xsltDocumentFunctionLoadDocument(xmlXPathParserCont=
extPtr ctxt,
+ 	    /*
+ 	    * This selects the stylesheet's doc itself.
+ 	    */
+-	    doc =3D tctxt->style->doc;
++	    doc =3D xmlCopyDoc(tctxt->style->doc, 1);
++	    if (doc =3D=3D NULL) {
++		xsltTransformError(tctxt, NULL, NULL,
++		    "document() : failed to copy style doc\n");
++		goto out_fragment;
++	    }
++	    xsltCleanupSourceDoc(doc); /* Remove psvi fields. */
++	    idoc =3D xsltNewDocument(tctxt, doc);
++	    if (idoc =3D=3D NULL) {
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
+     xmlNodePtr cur =3D (xmlNodePtr) doc;
+     void **psviPtr;
+diff --git a/libxslt/transformInternals.h b/libxslt/transformInternals.h
+new file mode 100644
+index 00000000..d0f42823
+--- /dev/null
++++ b/libxslt/transformInternals.h
+@@ -0,0 +1,9 @@
++/*
++ * Summary: set of internal interfaces for the XSLT engine transformati=
on part.
++ *
++ * Copy: See Copyright for the status of this software.
++ *
++ * Author: David Kilzer <ddkilzer@apple.com>
++ */
++
++void xsltCleanupSourceDoc(xmlDocPtr doc);
+--=20
+2.39.5 (Apple Git-154)
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipe=
s-support/libxslt/libxslt_1.1.43.bb
index 3fe32b584b6..3393be7ebe9 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -13,7 +13,8 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afb=
eb24026c9b03aecfeba458"
 SECTION =3D "libs"
 DEPENDS =3D "libxml2"
=20
-SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV=
}.tar.xz"
+SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV=
}.tar.xz \
+           file://gnome-libxslt-bug-139-apple-fix.diff"
=20
 SRC_URI[sha256sum] =3D "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea330306=
5231a6d403f0183a"
=20
--=20
2.43.0


