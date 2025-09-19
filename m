Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2705CAC5A8
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:58:10 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web11.13180.1758278623680627835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DeQj8aR3;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4978; q=dns/txt;
  s=iport01; t=1758278623; x=1759488223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lM7RpMLfRutQwsVUXtauV7JFoP2HnUW29yoBTm/gu3I=;
  b=DeQj8aR32uGRHfO5+Nqn4LiKfttsajSnI0ayt+gRxZRX0bIh2fs5dU41
   oCMk3/Fxy8zBgOfgr4J35AvD+kRe6+PNhujdSmg1zYL/cIay5/4rNJ57h
   sCvCjmqe9RJ48IMdoYE//DLmdqQm+NAqTzoApmn4TJoHyRJJMh+98Flae
   qYwDZYa8W9KbIMWrcyTIa6AFeeiUYNv5ogLbH4LSi/UbF9Yfq3/60/6bH
   /DYO4Y1bgcxgh6jedeimmZDdB10glaeINlsvysI7HK7oer28Pi+cD2BlQ
   Ei0oFfZsSk2sUA3mj/cThqM/tUnMk+hXXTz9tO6ua2t9dvz9sQZU7Izbn
   g==;
X-CSE-ConnectionGUID: JwUbEC7nQCWMzZ0v795AgA==
X-CSE-MsgGUID: /2FJekEhSgSmgFbnjJvVBQ==
X-IPAS-Result: =?us-ascii?q?A0ADAAD5Ms1o/5L/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7WUNJjHCIaWyeHRSBaw8BAQEPP?=
 =?us-ascii?q?RQEAQGCE4J0jDkCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEqCwEYAS0sAwECWiMhgwIBgnIDEbYWGjeBeTOBAYMoA?=
 =?us-ascii?q?dx9gUkBjUxvAYR3JxsbgXKBFYE7gi2BBYFcBYEgBIZ9BIINFYECFIQOgiiJe?=
 =?us-ascii?q?n2BXiAUiU5IgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdgSeDYYEqhB0rT4UCh?=
 =?us-ascii?q?Gskaw8GgRWDWwaHG0ADCxgNSBEsNxQbBj5uB5YTgmNPMTIBFxMBKyKBW0CTH?=
 =?us-ascii?q?ZJGgTWfWQoog3SMHpU5GjOqa5kGjgiWUIRpgWg8gVlwFYMiCUkZD44tAQoLi?=
 =?us-ascii?q?HG/diYyAjoCBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:PChnlKh/XZOzTxBu1XEUlk8BX161VREKZh0ujC45NGQN5FlHY01je
 htvCG6Bb6uOajb9fdh0bd+2pEIDu5OAzdYySQI6ri4zFy1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOKn9CAmvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSPULOZ82QsaD9MuvvS8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU65dt9LEoR8
 8UzFxUfXEid2LPr6b2SH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9J4HUHJwIxh/Az
 o7A1yOjLDMXN/Gf8jW+932CjOnNvz3FcrtHQdVU8dYv2jV/3Fc7EhoNTh2xvOOljUiWUshab
 UcT/0IGqKEu9E2mU5/xQhe/oWXBtAQdUtxcO+c97x2Jy6yS6AGcbkAeTzVBYcYq8tcrXzAr2
 3eNntX0FTJorbuZQG6c8bHSqim9UQASNWIEaCoOQAcJ7tWmq4YpgzrLT81/C+iyltDzFDT6z
 jyGoSR4gK8c5fPnzI2h9lzBxjbprZ/TQ0ttt0PcX3mu6UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:7vbKA6H4m2CdBusWpLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:IQ/D4Gy53le63yNNBhPdBgU2Bf0vX1aCyk77HGqqOz53F+zIYFC5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ATJ183A8aI3XKN9l8uotFqNqQf4AyzYajC20Nqpo?=
 =?us-ascii?q?9vsaqPypyGSmjpg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="556115010"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Sep 2025 10:43:42 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 9BF0418000493;
	Fri, 19 Sep 2025 10:43:42 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 4350BCC1288; Fri, 19 Sep 2025 03:43:42 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] libxslt: apply patch for CVE-2025-7424
Date: Fri, 19 Sep 2025 03:43:37 -0700
Message-ID: <20250919104338.3468737-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223769

From: Ross Burton <ross.burton@arm.com>

This patch is taken from the upstream bug, and is used by Apple in their
build of WebKit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anil Dongare <adongare@cisco.com>
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
2.44.1


