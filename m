Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF6AC5ACDA
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 16:21:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1274.1771604512168226912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 08:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f2U89oFa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260220162150f8f894356d00020772-lih1q_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260220162150f8f894356d00020772
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 17:21:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Yjz/xwRwmEI5TVJvUnEEtUcqx2BmSiWIEdpmMG18Up4=;
 b=f2U89oFaosIzkk5xaG91p8m/RaVxjcWTKeKsNCPU/VSAKT23UVocZYUAoFahv6iZzaBz79
 iZ35CNFi51W6T9nCUzP+vwjbZVn4wxS77/fW8f1bdUXBk0vS4oPPu6LzRbNr4X0Xck5cPAwX
 BCv8h0DjIqC7sJZC7lmsFrUAam6mcqu3Y1FdpGgg35l0//Zc74O89AfiwiKB6rZYLmoMRwuv
 X5guOPvXRG/0OKkWBd97S3cOuasQ2o6WSJWj/jUjbXraAXWwEekcEi0VWlfQMzVy7D7v59b5
 m1ZP6WoQsmiyeN/aP+dzWeyyEplctlMwn6C51j4LLs5GD95GVKRx3paA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/3] glib-2.0: patch CVE-2026-1484
Date: Fri, 20 Feb 2026 17:21:15 +0100
Message-Id: <20260220162117.8626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 16:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231536

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3870
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  | 48 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  | 45 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
new file mode 100644
index 00000000000..e3a232aa9f5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
@@ -0,0 +1,48 @@
+From 5ba0ed9ab2c28294713bdc56a8744ff0a446b59c Mon Sep 17 00:00:00 2001
+From: Marco Trevisan <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 18:48:30 +0100
+Subject: [PATCH] gbase64: Use gsize to prevent potential overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Both g_base64_encode_step() and g_base64_encode_close() return gsize
+values, but these are summed to an int value.
+
+If the sum of these returned values is bigger than MAXINT, we overflow
+while doing the null byte write.
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-168
+Closes: #3870
+
+
+(cherry picked from commit 6845f7776982849a2be1d8c9b0495e389092bff2)
+
+Co-authored-by: Marco Trevisan (Treviño) <mail@3v1n0.net>
+
+CVE: CVE-2026-1484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5ba0ed9ab2c28294713bdc56a8744ff0a446b59c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gbase64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gbase64.c b/glib/gbase64.c
+index 2ea4a4ef4..214b48911 100644
+--- a/glib/gbase64.c
++++ b/glib/gbase64.c
+@@ -262,8 +262,9 @@ g_base64_encode (const guchar *data,
+                  gsize         len)
+ {
+   gchar *out;
+-  gint state = 0, outlen;
++  gint state = 0;
+   gint save = 0;
++  gsize outlen;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
new file mode 100644
index 00000000000..d0956e62f8c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
@@ -0,0 +1,45 @@
+From 25429bd0b22222d6986d000d62b44eebf490837d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 20:09:44 +0100
+Subject: [PATCH] gbase64: Ensure that the out value is within allocated size
+
+We do not want to deference or write to it
+
+Related to: #3870
+
+CVE: CVE-2026-1484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/25429bd0b22222d6986d000d62b44eebf490837d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gbase64.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gbase64.c b/glib/gbase64.c
+index 214b48911..0141b3b07 100644
+--- a/glib/gbase64.c
++++ b/glib/gbase64.c
+@@ -265,6 +265,7 @@ g_base64_encode (const guchar *data,
+   gint state = 0;
+   gint save = 0;
+   gsize outlen;
++  gsize allocsize;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
+@@ -272,10 +273,15 @@ g_base64_encode (const guchar *data,
+      +1 is needed for trailing \0, also check for unlikely integer overflow */
+   g_return_val_if_fail (len < ((G_MAXSIZE - 1) / 4 - 1) * 3, NULL);
+ 
+-  out = g_malloc ((len / 3 + 1) * 4 + 1);
++  allocsize = (len / 3 + 1) * 4 + 1;
++  out = g_malloc (allocsize);
+ 
+   outlen = g_base64_encode_step (data, len, FALSE, out, &state, &save);
++  g_assert (outlen <= allocsize);
++
+   outlen += g_base64_encode_close (FALSE, out + outlen, &state, &save);
++  g_assert (outlen <= allocsize);
++
+   out[outlen] = '\0';
+ 
+   return (gchar *) out;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 7c0ed01f555..c6816f93fa8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -71,6 +71,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
            file://CVE-2026-0988.patch \
+           file://CVE-2026-1484-01.patch \
+           file://CVE-2026-1484-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

