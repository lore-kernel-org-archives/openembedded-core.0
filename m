Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1998CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:37:40 +0000 (UTC)
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
 by mx.groups.io with SMTP id smtpd.web10.23315.1758742655542502100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=qM4nd2dZ;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.11, mailfrom: jeroen@myspectrum.nl)
Received: from submission7.mail.transip.nl (unknown [10.103.8.158])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4cX6Z50rw5zTPNN3;
	Wed, 24 Sep 2025 21:37:33 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission7.mail.transip.nl (Postfix) with ESMTPSA id 4cX6Z25M1Dz3cyj8k;
	Wed, 24 Sep 2025 21:37:30 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 3F5E720089;
	Wed, 24 Sep 2025 19:37:29 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 24 Sep 2025 21:37:28 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [walnascar][PATCH] libxslt: apply patch for CVE-2025-7424
Date: Wed, 24 Sep 2025 21:37:07 +0200
Message-ID: <20250924193707.1753206-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission7.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758742650; h=from:subject:to:cc:date:
 mime-version; bh=TJD7C7U2bSg5//v14mIAF54yjnsy6MwSq0akKoGH7f4=;
 b=qM4nd2dZbbW/gbxBz/71c+NDCuEAcbpKcw1gUUosUxx0/fdu0m9hpBG01XKO+QWX9BsQDE
 a0mWNAVs1XerQIYk6x2TwM1RfQIYM6wOjd0uStatpuEhixXG6sOgogqllK8h0jGr0Vjhen
 tpvnO2UIvMXdV7E+dSczVBYu8GJfIaLBxi2n+K/i4hMA5Ti2xup2ivP27UM9k6eRjg+x1g
 YTkekCZo9H1UZ9zDGHgXDQ1FJpyZvmqWcJvUXaTzvejkHjIKQhWX9CJdJU471hXjF+gfgD
 K9wcYRLFi/2ARTKe9v4wqUv3YhZkeUSXhK9J89jZXGuwhmXRwGaEdjfzHEa1oA==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 19:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223981

From: Ross Burton <ross.burton@arm.com>

This patch is taken from the upstream bug, and is used by Apple in their
build of WebKit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19122ccb05282e9b8803c4d1aaf06b61c22a1bab)
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
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
index 0000000000..c7220ab954
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
index d251fa8122..e08e92085d 100644
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


