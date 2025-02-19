Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA47C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 20:18:16 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.32770.1739996287655949534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 12:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SuMqVgtx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202502192018039e9729b152d04d5d21-ayjxhw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202502192018039e9729b152d04d5d21
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 21:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=w4xKwsc9u2jMHcW7XUSun1rWqMjRy+iJisNUq5JGrzs=;
 b=SuMqVgtxpE5t9Z/CGFmc5z+GGEuvj7OAS1ncdhj/2d/0Cu1+umbXnXfDIjusNpOHcPf5FI
 t3XPcRQ+VT1navlfW9wE4GwsFU+BHGGMU4zbmB6dkH3OQhVLkyKzlZmOiUgNjhKvoO3+reKn
 lIiaWVVUr7wAAkizPRI6Tu2SaIBFHv6imTYYrTkgyooCTH3qZXtoGuTMjvBMe5U2Ryr+0ZR+
 gfiHzbBumlXMluKXF/17CwpTf1XoWhJvW4lVCf5yZr/BFBJS7FuJcjflqxT/rcffVZmD8yGz
 bFSK3RjVrK4Rsd2CZx/mkwQu1UJ6e4JkGq6bUSPHDsDXPtzU3XTduMVA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/3] libxml2: fix compilation of explicit child axis in pattern
Date: Wed, 19 Feb 2025 21:17:14 +0100
Message-Id: <20250219201716.3814140-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211732

From: Peter Marko <peter.marko@siemens.com>

This was reported as sucurity fix in
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.10
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...x-compilation-of-explicit-child-axis.patch | 31 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch b/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
new file mode 100644
index 0000000000..932c0ec422
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
@@ -0,0 +1,31 @@
+From 503f788e84f1c1f1d769c2c7258d77faee94b5a3 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 13 Feb 2025 16:48:53 +0100
+Subject: [PATCH] pattern: Fix compilation of explicit child axis
+
+The child axis is the default axis and should generate XML_OP_ELEM like
+the case without an axis.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/503f788e84f1c1f1d769c2c7258d77faee94b5a3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pattern.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pattern.c b/pattern.c
+index 27e96946..3182794e 100644
+--- a/pattern.c
++++ b/pattern.c
+@@ -1178,10 +1178,10 @@ xmlCompileStepPattern(xmlPatParserContextPtr ctxt) {
+ 			    goto error;
+ 			}
+ 		    } else {
+-			PUSH(XML_OP_CHILD, token, URL);
++			PUSH(XML_OP_ELEM, token, URL);
+ 		    }
+ 		} else
+-		    PUSH(XML_OP_CHILD, name, NULL);
++		    PUSH(XML_OP_ELEM, name, NULL);
+ 		return;
+ 	    } else if (xmlStrEqual(name, (const xmlChar *) "attribute")) {
+ 		XML_PAT_FREE_STRING(ctxt, name)
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 94b3b510ae..093a5b6590 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-45322-2.patch \
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
+           file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

