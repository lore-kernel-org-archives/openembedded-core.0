Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17045.1792789205332405938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 14:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JOS9nAsc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202610232100016c5dad8f640002079b-r_2ykr@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610232100016c5dad8f640002079b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 23:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=G/IGv74nGck4Y8PM9/yQ43Igx2+ZJWzLgJzMkXgSVDM=;
 b=JOS9nAscefl2R9rltKmqi0liFJ1bOYdTze9zMjJR3LGsSX3Gff12iq6JPyr1rLtAeDYszk
 Zgu9FCNG/c5d0YpqzjoZqVG9muKjvgLc+Jt3+161dYjTHWnV5NiHxxobgpAyP2her5M6Vkur
 PrK677hegQrJzaZiBC25eWF8dn0q+1BYxmePNF5Qea/5C0P9o8DLc3orioo27RJnLxR83+w9
 dhj8YNw3UU4K1M5brKYkDcPDEpUIm+A7ZhE0GqBoJfeedUt5QGxPPMWV2veaywEG8M+tINNn
 pAKv0j1Si+mea8a6rGxHGrLvOqCJCVbAajl9OtR6ABkD6wEW/MQ6PB6g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] glib-2.0: patch CVE-2026-16118
Date: Fri, 23 Oct 2026 22:59:32 +0200
Message-ID: <20261023205932.903606-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 21:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248567
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/files/CVE-2026-16118.patch       | 48 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch
new file mode 100644
index 0000000000..72a387079e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch
@@ -0,0 +1,48 @@
+From ca75aff83af9875ea2ad2bfbe48a85dfd99c2ce5 Mon Sep 17 00:00:00 2001
+From: Kashyap Ekbote <kashyap.ekbote@gmail.com>
+Date: Wed, 5 Aug 2026 20:50:10 +0530
+Subject: [PATCH] Fix CVE-2026-16118: heap-buffer-overflow in xdgmimemagic.c
+
+Fix out-of-bounds write in the byte-swap routine of
+_xdg_mime_magic_parse_magic_line(). On little-endian systems, the
+write side of the swap casts the base pointer to a wider type before
+adding the byte offset, causing pointer arithmetic to scale by
+sizeof(type) instead of 1. With value_length=4 and word_size=2, the
+loop writes 2 bytes past the allocated matchlet->value buffer at i=2.
+
+Parenthesize (ptr + i) before the cast so both the read and write
+sides use byte offsets.
+
+Upstream: https://gitlab.freedesktop.org/xdg/xdgmime/-/work_items/41
+
+CVE: CVE-2026-16118
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ca75aff83af9875ea2ad2bfbe48a85dfd99c2ce5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/xdgmime/xdgmimemagic.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gio/xdgmime/xdgmimemagic.c b/gio/xdgmime/xdgmimemagic.c
+index 98a1274c8..fe374eb4e 100644
+--- a/gio/xdgmime/xdgmimemagic.c
++++ b/gio/xdgmime/xdgmimemagic.c
+@@ -483,15 +483,15 @@ _xdg_mime_magic_parse_magic_line (FILE              *magic_file,
+ 	  for (i = 0; i < matchlet->value_length; i = i + matchlet->word_size)
+ 	    {
+ 	      if (matchlet->word_size == 2)
+-		*((xdg_uint16_t *) matchlet->value + i) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->value + i)));
++		*((xdg_uint16_t *) (matchlet->value + i)) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->value + i)));
+ 	      else if (matchlet->word_size == 4)
+-		*((xdg_uint32_t *) matchlet->value + i) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->value + i)));
++		*((xdg_uint32_t *) (matchlet->value + i)) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->value + i)));
+ 	      if (matchlet->mask)
+ 		{
+ 		  if (matchlet->word_size == 2)
+-		    *((xdg_uint16_t *) matchlet->mask + i) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->mask + i)));
++		    *((xdg_uint16_t *) (matchlet->mask + i)) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->mask + i)));
+ 		  else if (matchlet->word_size == 4)
+-		    *((xdg_uint32_t *) matchlet->mask + i) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->mask + i)));
++		    *((xdg_uint32_t *) (matchlet->mask + i)) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->mask + i)));
+ 
+ 		}
+ 	    }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7e7725f9bd..aec875a3df 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,6 +237,7 @@ SRC_URI += "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://CVE-2026-16118.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
