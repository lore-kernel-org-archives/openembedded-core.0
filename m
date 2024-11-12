Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE82FD41D7C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 20:00:19 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.96417.1731441613682417698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 12:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NDKGSk3T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241112200010187d885f72a1b8a4de-zjnuc9@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241112200010187d885f72a1b8a4de
        for <openembedded-core@lists.openembedded.org>;
        Tue, 12 Nov 2024 21:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZUKOlaxpJ+8m9Isxh+AzQsMB2PteQ0Kq/2K0tepfuyI=;
 b=NDKGSk3TeciiZesFii2LHjgkwrlPVPUNdyLbqUWQwBrXWtx/fE2FvE09s+swIOcWFGZ+p1
 ynbdcrHj1qn+NaEWkcjmWUsQWhIsxbpB+UO4T5cgSJ65n/I+NJhCbblAuaalvfjUiHeeW/ze
 +VYTe1DiOZzfD2Pp4wjwlqjLsP6TtOcZNXFNB/Jx8ZjFnaiQpIjr/RkEaCa2Z1rE4fMFCS28
 zzKTcsLVqBiYZBfVFuTJSFWSgZ83e1U2ANwyQNqL8x41jBZBTgCla4qACS4ru6FX9jBOvo7e
 Tv7JOAx9dpXG311dhrh2SwLOxYpF7J4kJGVuaN6a1ARFIGY+a9cF6p+Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: patch regression of CVE-2023-32665
Date: Tue, 12 Nov 2024 20:59:21 +0100
Message-Id: <20241112195921.1587206-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 20:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207063

 From: Peter Marko <peter.marko@siemens.com>

Official CVE-2023-32665 patch introduced a regression for big-endian
architectures.
This code was backported in CVE-2023-32665-0003.patch

Reported in [1] and fixed by [2] where this patch is picked from.

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/2839
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3136

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...aliser-Convert-endianness-of-offsets.patch | 68 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch
new file mode 100644
index 0000000000..86cce768ed
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch
@@ -0,0 +1,68 @@
+From dc16dffed0480d0c8cdd6a05ede68263fc8723a9 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 15 Dec 2022 12:51:37 +0000
+Subject: [PATCH] gvariant-serialiser: Convert endianness of offsets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The array of offsets is little-endian, even on big-endian architectures
+like s390x.
+
+Fixes: ade71fb5 "gvariant: Don’t allow child elements to overlap with each other"
+Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/2839
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/dc16dffed0480d0c8cdd6a05ede68263fc8723a9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gvariant-serialiser.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 25c85b30b..e9b0eab2b 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -712,17 +712,19 @@ gvs_variable_sized_array_n_children (GVariantSerialised value)
+ /* Find the index of the first out-of-order element in @data, assuming that
+  * @data is an array of elements of given @type, starting at index @start and
+  * containing a further @len-@start elements. */
+-#define DEFINE_FIND_UNORDERED(type) \
++#define DEFINE_FIND_UNORDERED(type, le_to_native) \
+   static gsize \
+   find_unordered_##type (const guint8 *data, gsize start, gsize len) \
+   { \
+     gsize off; \
+-    type current, previous; \
++    type current_le, previous_le, current, previous; \
+     \
+-    memcpy (&previous, data + start * sizeof (current), sizeof (current)); \
++    memcpy (&previous_le, data + start * sizeof (current), sizeof (current)); \
++    previous = le_to_native (previous_le); \
+     for (off = (start + 1) * sizeof (current); off < len * sizeof (current); off += sizeof (current)) \
+       { \
+-        memcpy (&current, data + off, sizeof (current)); \
++        memcpy (&current_le, data + off, sizeof (current)); \
++        current = le_to_native (current_le); \
+         if (current < previous) \
+           break; \
+         previous = current; \
+@@ -730,10 +732,11 @@ gvs_variable_sized_array_n_children (GVariantSerialised value)
+     return off / sizeof (current) - 1; \
+   }
+ 
+-DEFINE_FIND_UNORDERED (guint8);
+-DEFINE_FIND_UNORDERED (guint16);
+-DEFINE_FIND_UNORDERED (guint32);
+-DEFINE_FIND_UNORDERED (guint64);
++#define NO_CONVERSION(x) (x)
++DEFINE_FIND_UNORDERED (guint8, NO_CONVERSION);
++DEFINE_FIND_UNORDERED (guint16, GUINT16_FROM_LE);
++DEFINE_FIND_UNORDERED (guint32, GUINT32_FROM_LE);
++DEFINE_FIND_UNORDERED (guint64, GUINT64_FROM_LE);
+ 
+ static GVariantSerialised
+ gvs_variable_sized_array_get_child (GVariantSerialised value,
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 35b51a3ec9..239099d568 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2024-34397_16.patch \
            file://CVE-2024-34397_17.patch \
            file://CVE-2024-34397_18.patch \
+           file://0001-gvariant-serialiser-Convert-endianness-of-offsets.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.30.2


