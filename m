Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03184CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 19:08:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.23021.1756062500229919982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 12:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GjanHEMQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202508241908143ac998db400983b8df-geqxcy@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202508241908143ac998db400983b8df
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 21:08:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=e3vNA25dI2q0L9knz0ZrxdX1jMxicbRNQF3bhQQr4NE=;
 b=GjanHEMQd+Oa17wq+CQsZ47loyNLifJrNC+vCwVh1vpLdVoo0U2YfaBtU+KqAeoY2wS5Ss
 LX/jlsgVDCU4I9b+NFnbnZwMcSuQHdvz4yw5/6nW2Wym1wmlbF99/cFWqXt1LYw75Fbbot2N
 2IEo3CZ3M15sHqRj0c2BrqB2IC4lG05oYLCbGcLaelOqKvM6v3JT8Xmnzc+uPRI3VoIEu2Ai
 2XpWzC19sNV6+0ZWRbucseQNhJcA+orIi8vcG1UUhuzrt2VeU2cIuv4tQxwb7J6YLltc4wuY
 EuLzidpy3JMq44J+h8hBT0Enk2TdejO0FFd0+cGXjePSulYqydDSzznQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: patch CVE-2025-7039
Date: Sun, 24 Aug 2025 21:07:24 +0200
Message-Id: <20250824190724.730776-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 19:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222391

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
Also pick commit which changed the same code before to apply it cleanly.

[1] https://security-tracker.debian.org/tracker/CVE-2025-7039

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-7039-01.patch  | 40 +++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-7039-02.patch  | 43 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  2 +
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
new file mode 100644
index 0000000000..cb096fca42
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
@@ -0,0 +1,40 @@
+From 285db475ecaa4d2cc39ce326b4c63aacb87ca6ad Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 22 Aug 2023 19:57:48 +0200
+Subject: [PATCH] glib/gfileutils.c: use 64 bits for value in get_tmp_file()
+
+On 32 bit systems 'long' value will overflow in 2038 and become negative.
+As it is used to index into letters array, and % operation preserves signs,
+data corruption will then occur.
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+CVE: CVE-2025-7039
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/285db475ecaa4d2cc39ce326b4c63aacb87ca6ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gfileutils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index 9646c696e..bd3cc179a 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1475,7 +1475,7 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  glong value;
++  gint64 value;
+   gint64 now_us;
+   static int counter = 0;
+ 
+@@ -1496,7 +1496,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      glong v = value;
++      gint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch
new file mode 100644
index 0000000000..37e32fefc3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch
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
+@@ -1475,9 +1475,9 @@ get_tmp_file (gchar            *tmpl,
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
+@@ -1496,7 +1496,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      gint64 v = value;
++      guint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 31b6c1fe98..7ba52b5c79 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -62,6 +62,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-06.patch \
            file://CVE-2025-4373-01.patch \
            file://CVE-2025-4373-02.patch \
+           file://CVE-2025-7039-01.patch \
+           file://CVE-2025-7039-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

