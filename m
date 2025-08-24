Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB53CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 19:09:12 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.22900.1756062538249554132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 12:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WqOBjnLb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250824190856d08223831b7167e780-qxhtry@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250824190856d08223831b7167e780
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 21:08:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/gFRMfFnqbMxcEN5wTxOQWq8vOUJRMKDnDki2u8knZs=;
 b=WqOBjnLb4rHnQcs9hVGVS+EME63o2BX+xM1vUsveUt1ntmJ1XtO57fFlZ/MxcYLEgJ0wUS
 TzR0pjzQo3oHZ1fmmHhsmHRZzyWPvQhA62TJD0j3OpUSxAfxxlYJae0QiB95+LpIZvLxJk7z
 kTM7XasRqqd0oYIanp71h3H4NKdg4+i1tYEfYfwv4QGW7STo206ZEPD/hVj5eKjUllL3WX3Y
 wUALAvvdQPsNkGCUhh2+Ndm52ZW4NiA028M79oaaCwgywQyz+Fg6ZQhjZ0efi9QxRh4LTuUF
 KHbFDwAztYOSCm9btGjdMpSJzkx9f27jD3582UBpAPiVK5DNWjFFJVow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] glib-2.0: patch CVE-2025-7039
Date: Sun, 24 Aug 2025 21:08:02 +0200
Message-Id: <20250824190803.730828-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 19:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222392

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-7039

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-7039.patch     | 43 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch
new file mode 100644
index 0000000000..6e03700880
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch
@@ -0,0 +1,43 @@
+From 61e963284889ddb4544e6f1d5261c16120f6fcc3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Tue, 1 Jul 2025 10:58:07 -0500
+Subject: [PATCH] gfileutils: fix computation of temporary file name
+
+We need to ensure that the value we use to index into the letters array
+is always positive.
+
+Fixes #3716
+
+CVE: CVE-2025-7039
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/61e963284889ddb4544e6f1d5261c16120f6fcc3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gfileutils.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index c7d3339d1..286b1b154 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1532,9 +1532,9 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  gint64 value;
+-  gint64 now_us;
+-  static int counter = 0;
++  guint64 value;
++  guint64 now_us;
++  static guint counter = 0;
+ 
+   g_return_val_if_fail (tmpl != NULL, -1);
+ 
+@@ -1553,7 +1553,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      gint64 v = value;
++      guint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 53e0543045..c129be1328 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-06.patch \
            file://CVE-2025-4373-01.patch \
            file://CVE-2025-4373-02.patch \
+           file://CVE-2025-7039.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

