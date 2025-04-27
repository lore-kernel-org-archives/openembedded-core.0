Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576CFC369D8
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:35:40 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.29342.1745771739580842444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JgR1+oT8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202504271635373ad6258723e6454fb0-xbqf5_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202504271635373ad6258723e6454fb0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 18:35:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pWDVURFs2x317Rxim0KNVfMTRnlYKxF3nfyEnMxrP9s=;
 b=JgR1+oT8Xd7+F3sYUAQRmEpL0DSszLzTBqTU6vPAk5Gd0x6tvfQ9Kn/9dAoNkD/nyMwzan
 7jWsDuFf3lHoQiQPBG73b89dEo/0i5qrPZw23DEIFYspX7d0/Jj72fcUPbJj5GZ0Fx2jgtGL
 QSrjQHIPDOl2JRacnyjWvVCInm4tmKWMgaKtBFLC28ZeDtuY+pkzfQJ6EjeGxr1lI/qK5Oqy
 YbqfwO3QaYuaK7Oi8nKqFfYmjlF2vKwDD0Xak6XW8VD8JpEb5lhV6fbIaGb0ZSFfTxUzPQxh
 XTBTvIlhqmxWmcEI5fivijjsVg8gvVbsnYFT//E3SVX3+llE2TvNa39w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] libxml2: patch CVE-2025-32415
Date: Sun, 27 Apr 2025 18:34:47 +0200
Message-Id: <20250427163447.994987-2-peter.marko@siemens.com>
In-Reply-To: <20250427163447.994987-1-peter.marko@siemens.com>
References: <20250427163447.994987-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215563

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.13 branch as 2.9 branch is unmaintained now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2025-32415.patch       | 39 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
new file mode 100644
index 0000000000..4f39bb824b
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
+@@ -23607,7 +23607,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 			j++;
+ 		    } while (j < nbDupls);
+ 		}
+-		if (nbNodeTable) {
++		if (bind->nbNodes) {
+ 		    j = 0;
+ 		    do {
+ 			if (nbFields == 1) {
+@@ -23657,7 +23657,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 
+ next_node_table_entry:
+ 			j++;
+-		    } while (j < nbNodeTable);
++		    } while (j < bind->nbNodes);
+ 		}
+ 		/*
+ 		* If everything is fine, then add the IDC target-node to
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index e281a39fd4..bd6dd88dee 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -38,6 +38,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-56171.patch \
            file://CVE-2025-24928.patch \
            file://CVE-2025-32414.patch \
+           file://CVE-2025-32415.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

