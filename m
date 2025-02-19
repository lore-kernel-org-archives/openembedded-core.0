Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3922C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 20:18:25 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.32923.1739996301848112873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 12:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Gd3h9MDX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202502192018192b89d72bc898ba73f2-mrm2z1@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202502192018192b89d72bc898ba73f2
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 21:18:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dnHcOGkxCndU2d+l06CDOL0Z7sHB1C7kTJwqoF9SGmw=;
 b=Gd3h9MDXiYwbXKotAChUczL7iagJOCPLmr7OmVdEujxXqN8QzCSbd3WTPiaSuoN4IdfR7f
 hroxCQ8PffI0opdsQzWmmQe6QrjFWplrY9V8msRAYYiYYO3tkK5KQtVt8BemuP/wL7viO216
 352udOFZVYJ0hNoY2oKsc4k46s3hQbE3itm9FnX6CyCtYl7/CnqcB5Kls7CyxvDowu28Wxyk
 seExZNvphDwNlQNWdlY3rUQRPJPjqVKVaRALwie2VV/UCuXDtEjw4epXcHEUaw54HW+z6N0r
 Rxm7vbVaM0K6iJT/QYVOjoAOEmGI1UqR4M42heD9L13MfuvdqXIwtU9w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] libxml2: patch CVE-2025-24928
Date: Wed, 19 Feb 2025 21:17:16 +0100
Message-Id: <20250219201716.3814140-3-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211734

From: Peter Marko <peter.marko@siemens.com>

Pick commit fomr 2.12 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2025-24928.patch       | 58 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch
new file mode 100644
index 0000000000..6da43f81a5
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch
@@ -0,0 +1,58 @@
+From 858ca26c0689161a6b903a6682cc8a1cc10a0ea8 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 11 Feb 2025 17:30:40 +0100
+Subject: [PATCH] [CVE-2025-24928] Fix stack-buffer-overflow in
+ xmlSnprintfElements
+
+Fixes #847.
+
+CVE: CVE-2025-24928
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/858ca26c0689161a6b903a6682cc8a1cc10a0ea8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ valid.c | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index ed3c8503..36a0435b 100644
+--- a/valid.c
++++ b/valid.c
+@@ -5259,25 +5259,26 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+ 	    return;
+ 	}
+         switch (cur->type) {
+-            case XML_ELEMENT_NODE:
++            case XML_ELEMENT_NODE: {
++                int qnameLen = xmlStrlen(cur->name);
++
++                if ((cur->ns != NULL) && (cur->ns->prefix != NULL))
++                    qnameLen += xmlStrlen(cur->ns->prefix) + 1;
++                if (size - len < qnameLen + 10) {
++                    if ((size - len > 4) && (buf[len - 1] != '.'))
++                        strcat(buf, " ...");
++                    return;
++                }
+ 		if ((cur->ns != NULL) && (cur->ns->prefix != NULL)) {
+-		    if (size - len < xmlStrlen(cur->ns->prefix) + 10) {
+-			if ((size - len > 4) && (buf[len - 1] != '.'))
+-			    strcat(buf, " ...");
+-			return;
+-		    }
+ 		    strcat(buf, (char *) cur->ns->prefix);
+ 		    strcat(buf, ":");
+ 		}
+-                if (size - len < xmlStrlen(cur->name) + 10) {
+-		    if ((size - len > 4) && (buf[len - 1] != '.'))
+-			strcat(buf, " ...");
+-		    return;
+-		}
+-	        strcat(buf, (char *) cur->name);
++                if (cur->name != NULL)
++	            strcat(buf, (char *) cur->name);
+ 		if (cur->next != NULL)
+ 		    strcat(buf, " ");
+ 		break;
++            }
+             case XML_TEXT_NODE:
+ 		if (xmlIsBlankNode(cur))
+ 		    break;
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 2facf67ebd..4c7d51ebe7 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-34459.patch \
            file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
            file://CVE-2024-56171.patch \
+           file://CVE-2025-24928.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

