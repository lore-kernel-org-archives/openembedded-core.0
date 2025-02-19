Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2667C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 20:18:25 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.32777.1739996296188483537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 12:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HQTH0dTB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202502192018131df20fa22cd615ddf5-qu8nvn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202502192018131df20fa22cd615ddf5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 21:18:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kJeod5CudS54H3kT3MfzvkktCYsX+uXjLzKfRQ6iKNo=;
 b=HQTH0dTBteA1llC+Mzk+d1QxpZDhDehGD7FvurzHOkBez6kwXVTcMbRIMCauxhsbTqtbAP
 PKxl5Dxas09t2wa6EJHAUJU+mZ41Kc0qsjsgMa0t6TP2Wwt3vsdfZw0Ei4FxHEndMvXkbBtL
 RTygriMr7CaspaLF85/gsXtZ2mj5dnJySNfpYPNOx4RqL4G5hl7ebY6yfw7UARTIlYo+844M
 2t11S5z4EmSxWcb1D3+YM5/dN6HpHUaUcVMEaO6rxV3pVGSrkmSmTupreDkgLFJF0uir0/sp
 ksQXoKJCwROYXRkm8n+170rd0W0HZvL17X/LkwnXWeh024nU4UT7oyag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/3] libxml2: patch CVE-2024-56171
Date: Wed, 19 Feb 2025 21:17:15 +0100
Message-Id: <20250219201716.3814140-2-peter.marko@siemens.com>
In-Reply-To: <20250219201716.3814140-1-peter.marko@siemens.com>
References: <20250219201716.3814140-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211733

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.12 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2024-56171.patch       | 42 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch b/meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch
new file mode 100644
index 0000000000..6c7b1c11e7
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch
@@ -0,0 +1,42 @@
+From 245b70d7d2768572ae1b05b3668ca858b9ec4ed4 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 10 Dec 2024 16:52:05 +0100
+Subject: [PATCH] [CVE-2024-56171] Fix use-after-free after
+ xmlSchemaItemListAdd
+
+xmlSchemaItemListAdd can reallocate the items array. Update local
+variables after adding item in
+
+- xmlSchemaIDCFillNodeTables
+- xmlSchemaBubbleIDCNodeTables
+
+Fixes #828.
+
+CVE: CVE-2024-56171
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/245b70d7d2768572ae1b05b3668ca858b9ec4ed4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ xmlschemas.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/xmlschemas.c b/xmlschemas.c
+index a089ebc5..18e35e75 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -23647,6 +23647,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 			}
+ 			if (xmlSchemaItemListAdd(bind->dupls, bind->nodeTable[j]) == -1)
+ 			    goto internal_error;
++                        dupls = (xmlSchemaPSVIIDCNodePtr *) bind->dupls->items;
+ 			/*
+ 			* Remove the duplicate entry from the IDC node-table.
+ 			*/
+@@ -23863,6 +23864,8 @@ xmlSchemaBubbleIDCNodeTables(xmlSchemaValidCtxtPtr vctxt)
+ 				goto internal_error;
+ 			}
+ 			xmlSchemaItemListAdd(parBind->dupls, parNode);
++		        dupls = (xmlSchemaPSVIIDCNodePtr *)
++                            parBind->dupls->items;
+ 		    } else {
+ 			/*
+ 			* Add the node-table entry (node and key-sequence) of
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 093a5b6590..2facf67ebd 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
            file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
+           file://CVE-2024-56171.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

