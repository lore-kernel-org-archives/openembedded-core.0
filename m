Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AB6C83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 21:09:58 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.26150.1753045794919724585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 14:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WWy689L/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250720210941e971c096801bbbadce-btsqis@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250720210941e971c096801bbbadce
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Jul 2025 23:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4ZQXSG0h5bZwrn6gbw/jkA5NGBODaC7xc7PEFwXitQI=;
 b=WWy689L/xBsb7562sHZJf37lNIC9q5pEAPHBoGOdn5rBNhnaRKc0Fk8ydrsovYHyrXd76d
 wbYv5soIKWBHYB5wLAfarzfEPosKg2TMdMKy555ixZ9lLCy5Cn9ji/SrJoVs7i4Hf9je1Rsj
 Uhma7Z/WruSjHGxbNBJuj4ZgXAf8kpnlmH+OoHqYAdYTIZiy2DCK7ohq8+Nab+pTVko4jkCs
 6YEHrMma0/kZzcIU5ctay+ExKWAeinyXB+5eu291jIALtMwI9OcLG3sk7JEK1jeNSqiQkLrX
 x81YKh2MFY2CuOEra7301fulJ23jqtQDxxuecJVMt9b6Teg4SzVla0dg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] orc: set CVE_PRODUCT
Date: Sun, 20 Jul 2025 23:08:53 +0200
Message-Id: <20250720210853.2604820-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 21:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220638

From: Peter Marko <peter.marko@siemens.com>

There are new CVEs reported for this recipe which are not for this
componene, but for a component with same name from apache.

sqlite> select vendor, product, id, count(*) from products where product like 'orc' group by vendor, product, id;
apache|orc|CVE-2018-8015|1
apache|orc|CVE-2025-47436|4
gstreamer|orc|CVE-2024-40897|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/orc/orc_0.4.41.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devtools/orc/orc_0.4.41.bb
index 491ff71067..60677577b0 100644
--- a/meta/recipes-devtools/orc/orc_0.4.41.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.41.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1fc19c08d98
 
 inherit meson pkgconfig gtk-doc
 
+# distinguish from apache:orc
+CVE_PRODUCT = "gstreamer:orc"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = "enabled"
 GTKDOC_MESON_DISABLE_FLAG = "disabled"

