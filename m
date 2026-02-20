Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF32C5ACD3
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 16:21:59 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1304.1771604515336189111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 08:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Hr2xVHKg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202602201621536475041636000207ba-umjzfa@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202602201621536475041636000207ba
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 17:21:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QSXBdpmrU6epFGbjq1Gjg4LRxgdJ9MYN8llC/eXeeiU=;
 b=Hr2xVHKgW5AxvXL8gJPGvQ28GDbQNdcMGUCkoyfjDWOtsn2yx9FKNMQfPdPrgoWfr7hNCd
 D6Iv2g8Lh0bH5vgAXI4VAXeLqo0uktexM985LTxanT5wArgYacOdBbzFeYhrIrcVhH7mUou2
 q433+1EnnH+hR/PHZmuNasBEM7gLHFgRZxGJdcT9W2ni04REGJFArLur3ha7ys+wBuD9VDAA
 j9SEZhuNBTpX6YvMmg3SQQW9cELpb55L2AUnuL0Uk4QxdpmEY7cjjz3Qyst2YddMigYDmX+z
 IibNxIIHD+VRVDmO42URjkoy/uO3gVW92SL5DSmrzfQJyFJkO/bfPNGw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/3] glib-2.0: patch CVE-2026-1485
Date: Fri, 20 Feb 2026 17:21:16 +0100
Message-Id: <20260220162117.8626-2-peter.marko@siemens.com>
In-Reply-To: <20260220162117.8626-1-peter.marko@siemens.com>
References: <20260220162117.8626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 16:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231537

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3871
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4981

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-1485.patch     | 44 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
new file mode 100644
index 00000000000..6768a1d00c4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
@@ -0,0 +1,44 @@
+From ee5acb2cefc643450509374da2600cd3bf49a109 Mon Sep 17 00:00:00 2001
+From: Marco Trevisan <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 19:05:44 +0100
+Subject: [PATCH] gio/gcontenttype-fdo: Do not overflow if header is longer
+ than MAXINT
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In case the header size is longer than MAXINT we may read and write to
+invalid locations
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-169
+Closes: #3871
+
+
+(cherry picked from commit aacda5b07141b944408c79e83bcbed3b2e1e6e45)
+
+Co-authored-by: Marco Trevisan (Treviño) <mail@3v1n0.net>
+
+CVE: CVE-2026-1485
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ee5acb2cefc643450509374da2600cd3bf49a109]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gcontenttype.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/gcontenttype.c b/gio/gcontenttype.c
+index 230cea182..11323973a 100644
+--- a/gio/gcontenttype.c
++++ b/gio/gcontenttype.c
+@@ -1013,7 +1013,7 @@ tree_match_free (TreeMatch *match)
+ static TreeMatch *
+ parse_header (gchar *line)
+ {
+-  gint len;
++  size_t len;
+   gchar *s;
+   TreeMatch *match;
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index c6816f93fa8..37a5fd34a96 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -73,6 +73,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-0988.patch \
            file://CVE-2026-1484-01.patch \
            file://CVE-2026-1484-02.patch \
+           file://CVE-2026-1485.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

