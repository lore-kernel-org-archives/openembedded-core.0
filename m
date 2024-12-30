Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9E7E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.66655.1735579750378786404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=s8Rl7xNs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202412301729089223bfe2a40676fd81-yxbi6s@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202412301729089223bfe2a40676fd81
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:29:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SgTZPSVGRMZoZ5eAxWUyItCgOdbHhxiIK2vU+/0IVPc=;
 b=s8Rl7xNsbllD9UzDr+4TJF3B7QAIn/seber9dtExqkgdxm98lKazVepg2sJLPJsTlRXAnX
 gQElFazJv/PJZFS05twkLkzIkNpvg9RwG6EhIsE+L4Q56g8bwsei4Xv/PtwW8Ug8V0LmS4Ev
 IvY9WckqHgNP25/7x9GJK/QW8Pyd16DR8mMw3FgryahtOeo2n0yqI8mHmRf32KvQEhobqyVm
 Uu5kxSubBAWXyYtsCjUWs5GtftCaUJ30NveYwCKutLH7FvjQ2zjStOCRzraL1cbn8yr+HWev
 W4CJ7Ac8wrI6zhUO2vQSsmE0Oi6ERoBrKChuv8uaJu3bLZ0MpekIDbUw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 12/16] gstreamer1.0-plugins-good: patch CVE-2024-47606
Date: Mon, 30 Dec 2024 18:27:19 +0100
Message-Id: <20241230172723.3644270-12-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209176

From: Peter Marko <peter.marko@siemens.com>

Pick commit related to gstreamer from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...integer-overflow-when-allocating-sys.patch | 56 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.22.12.bb         |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch
new file mode 100644
index 00000000000..5d8575711a7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch
@@ -0,0 +1,56 @@
+From f1cdc6f24340f6cce4cc7020628002f5c70dd6c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 22:07:22 +0300
+Subject: [PATCH] allocator: Avoid integer overflow when allocating sysmem
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-166
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3851
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032>
+
+CVE: CVE-2024-47606
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f1cdc6f24340f6cce4cc7020628002f5c70dd6c7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/gstallocator.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/gst/gstallocator.c b/gst/gstallocator.c
+index 996f5dc946..198cfe9523 100644
+--- a/gst/gstallocator.c
++++ b/gst/gstallocator.c
+@@ -430,8 +430,20 @@ _sysmem_new_block (GstMemoryFlags flags,
+   /* ensure configured alignment */
+   align |= gst_memory_alignment;
+   /* allocate more to compensate for alignment */
++  if (align > G_MAXSIZE || maxsize > G_MAXSIZE - align) {
++    GST_CAT_WARNING (GST_CAT_MEMORY,
++        "Allocating %" G_GSIZE_FORMAT " bytes with alignment %" G_GSIZE_FORMAT
++        "x overflows", maxsize, align);
++    return NULL;
++  }
+   maxsize += align;
+   /* alloc header and data in one block */
++  if (maxsize > G_MAXSIZE - sizeof (GstMemorySystem)) {
++    GST_CAT_WARNING (GST_CAT_MEMORY,
++        "Allocating %" G_GSIZE_FORMAT " bytes with alignment %" G_GSIZE_FORMAT
++        "x overflows", maxsize, align);
++    return NULL;
++  }
+   slice_size = sizeof (GstMemorySystem) + maxsize;
+ 
+   mem = g_slice_alloc (slice_size);
+@@ -481,6 +493,8 @@ _sysmem_copy (GstMemorySystem * mem, gssize offset, gsize size)
+     size = mem->mem.size > offset ? mem->mem.size - offset : 0;
+ 
+   copy = _sysmem_new_block (0, size, mem->mem.align, 0, size);
++  if (!copy)
++    return NULL;
+   GST_CAT_DEBUG (GST_CAT_PERFORMANCE,
+       "memcpy %" G_GSIZE_FORMAT " memory %p -> %p", size, mem, copy);
+   memcpy (copy->data, mem->data + mem->mem.offset + offset, size);
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index 8486e258d50..e5a820e1adb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch \
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
+           file://0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch \
            "
 SRC_URI[sha256sum] = "ac352f3d02caa67f3b169daa9aa78b04dea0fc08a727de73cb28d89bd54c6f61"
 
-- 
2.30.2


