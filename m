Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B0CC5ACD8
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 16:21:49 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1301.1771604500309699964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 08:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aot6rU5o;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202602201621385c9482f72700020777-w05myw@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202602201621385c9482f72700020777
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 17:21:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pwX7e8lGhkKpqdOuI9bDFrsCXqg8dAIVfpca9xJxMdo=;
 b=aot6rU5oAnpVLjdI+5lLfhJ5hx7bS3xUHlkq4m4V3PI2hpVcSiYO7F1Em+UECSsEyT61u/
 1mCZ5dG7LwAD4mQMtc/lNUnS1+XcB212UTXnhtMBlNnv4hAIzGmae7TRXY0Dtst8sESn1Am0
 K+oYnDTj6TUZ6Myw6Byw78XmiMhC0HRVQMxwOcubnrESK+r9nPu/Gj8B54zQSiYJ8d5cVfVx
 jdQQvz4UczlyfyBzJpWodGUmavAUsqy6Uc8e2evqvlJlWqENw4fE0HykzxI7Vz3IUZODlQ6V
 QqS4Exh78mgldBeRULvDj6g1kINymnB6qFlbVpd3SP5xtJRhSsmGZNcw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/3] glib-2.0: patch CVE-2026-1484
Date: Fri, 20 Feb 2026 17:21:30 +0100
Message-Id: <20260220162132.8648-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 16:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231533

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3870
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  | 48 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  | 45 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
new file mode 100644
index 00000000000..c5c2f657ccf
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
+@@ -264,8 +264,9 @@ g_base64_encode (const guchar *data,
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
index 00000000000..a9cf855c6b9
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
+@@ -267,6 +267,7 @@ g_base64_encode (const guchar *data,
+   gint state = 0;
+   gint save = 0;
+   gsize outlen;
++  gsize allocsize;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
+@@ -274,10 +275,15 @@ g_base64_encode (const guchar *data,
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 97618d1d40b..43a28273e9d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -40,6 +40,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
            file://CVE-2026-0988.patch \
+           file://CVE-2026-1484-01.patch \
+           file://CVE-2026-1484-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

