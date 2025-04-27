Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD09C369D8
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:14:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.28949.1745770438252478073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Mvpah6fb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250427161355bb0c760c6d43492724-p1qcyt@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250427161355bb0c760c6d43492724
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 18:13:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eQ49MewFTe2SHgbWSMb5r0swT1A7hz54LN8XR7ZLKXs=;
 b=Mvpah6fbDJGOFw0zkHaPysFp+RKQn2naHMsGyOzvnJ0Z14GFEE75OenlJcbbh/o0VjrPAh
 iDbx9AjCDVDKvdBoPH2ElLZ/Kp4+yX7mbkJ+OdA6bvGqC8XCzwSGFhxYqPcm5GVfrIjiq4Wb
 b94zBhApoRzXWxXJ6tNBVTzGYJGQUcqh44zcSs+6pNuz0N/qTOr+Cce8RYhmvrY4tYbpC8QK
 z4OtPZi69m7ZRfuvL7oUKI9BGNIOr9UNdvlfeeBkPjpoXcBRKoB2pAz2GdUoVoKgYemmdsxh
 CVsfiW6Y/cCRc+avDjFm0aZczPJ2TWdgn1t+4/eEsJvEZjc84QTyADvg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/2] libxml2: patch CVE-2025-32415
Date: Sun, 27 Apr 2025 18:13:02 +0200
Message-Id: <20250427161302.4064196-2-peter.marko@siemens.com>
In-Reply-To: <20250427161302.4064196-1-peter.marko@siemens.com>
References: <20250427161302.4064196-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215561

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.13 branch as 2.12 branch is unmaintained now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2025-32415.patch       | 39 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
new file mode 100644
index 0000000000..d8ff654a23
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
@@ -0,0 +1,39 @@
+From 384cc7c182fc00c6d5e2ab4b5e3671b2e3f93c84 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 6 Apr 2025 12:41:11 +0200
+Subject: [PATCH] [CVE-2025-32415] schemas: Fix heap buffer overflow in
+ xmlSchemaIDCFillNodeTables
+
+Don't use local variable which could contain a stale value.
+
+Fixes #890.
+
+CVE: CVE-2025-32415
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/384cc7c182fc00c6d5e2ab4b5e3671b2e3f93c84]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ xmlschemas.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlschemas.c b/xmlschemas.c
+index 28b14bd4..428e3c82 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -23324,7 +23324,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 			j++;
+ 		    } while (j < nbDupls);
+ 		}
+-		if (nbNodeTable) {
++		if (bind->nbNodes) {
+ 		    j = 0;
+ 		    do {
+ 			if (nbFields == 1) {
+@@ -23375,7 +23375,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 
+ next_node_table_entry:
+ 			j++;
+-		    } while (j < nbNodeTable);
++		    } while (j < bind->nbNodes);
+ 		}
+ 		/*
+ 		* If everything is fine, then add the IDC target-node to
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 42672e35bd..2eea65732b 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -19,6 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://CVE-2025-32414.patch \
+           file://CVE-2025-32415.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

