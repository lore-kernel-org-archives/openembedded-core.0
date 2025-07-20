Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6601C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 21:11:57 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.26189.1753045908078996020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 14:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EJDW6tE1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025072021114680c81d3aba92d441d5-fpex9g@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025072021114680c81d3aba92d441d5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Jul 2025 23:11:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8pKq0VmHUDGViRVnwCqWxn6ql/LdR1V6SegzqZyBBZk=;
 b=EJDW6tE1GQ4/SwR+XooZOPp9heNjZJrJOedU5ukxN4dQ1maoR8mNIl3bKMPQDPrBHniRgI
 dDReiCWmsWSfYvOhoBFjun7CkErfp4FL15K6/AsjZp4DooSGCVqty3de6uhn48wZzhEBUa4L
 DnkjqsuSoQUCS5A+6Z6xJjCQJb+mfMHXiPILtLQDj9Su/u0Fklz/M4Ok7Lo+yuGuDBIr9X+L
 zolfAzztHRA5qpWZsQPcJqt/H1eHqnGqKPaqBdItFPivTiL/RmOxWl9wH6I7IYrzY3cTyKU1
 +6kjU6unQgjMfW6QKe1Rvt7xV8HwztKHYdF6BF+HIB9rEFmql7+HaODw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] orc: set CVE_PRODUCT
Date: Sun, 20 Jul 2025 23:10:58 +0200
Message-Id: <20250720211058.2605038-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 21:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220641

From: Peter Marko <peter.marko@siemens.com>

There are new CVEs reported for this recipe which are not for this
componene, but for a component with same name from apache.

sqlite> select vendor, product, id, count(*) from products where product like 'orc' group by vendor, product, id;
apache|orc|CVE-2018-8015|1
apache|orc|CVE-2025-47436|4
gstreamer|orc|CVE-2024-40897|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/orc/orc_0.4.40.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.40.bb b/meta/recipes-devtools/orc/orc_0.4.40.bb
index e437831cd7a..ee96ca0a4c2 100644
--- a/meta/recipes-devtools/orc/orc_0.4.40.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.40.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "3fc2bee78dfb7c41fd9605061fc69138db7df007eae2f669a1f56e8bac
 
 inherit meson pkgconfig gtk-doc
 
+# distinguish from apache:orc
+CVE_PRODUCT = "gstreamer:orc"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = "enabled"
 GTKDOC_MESON_DISABLE_FLAG = "disabled"

