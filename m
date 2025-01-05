Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7181E77197
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:43:41 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.33587.1736055818404615101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GKZDmYZZ;
 spf=pass (domain: mvista.com, ip: 209.85.166.42, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844dac0a8f4so1000587539f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055817; x=1736660617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCjqvHsQEuqQzKN6KiknbBPA3l0UdIXHNZQ/gykurYI=;
        b=GKZDmYZZv5MJ8xBYGSDyMw43MbPCW/jXDrD4jwF1Md9IE9b1wWel6JegeYF+WeWtmH
         +Koeaxxp3jDOobUzuZyQ6g0zZjQbYa526BHT6DSiQk3b+yQSYBjI4nFE/5xrtvvvHJau
         6kE2Sx8Zuky76hFXKShiclQHA3YpWkr0uGdz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055817; x=1736660617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCjqvHsQEuqQzKN6KiknbBPA3l0UdIXHNZQ/gykurYI=;
        b=SaalJ1ED6GjKJm6cAddlpzWmVmPpDMjSzhxvw1niP6lz52hFzXTCe61BsCC9UoHNOl
         tC0q2DnRX8mvFishDvkUs3LVFXsM2Q9J/1NDXccDiRLaAmvA8or893lJhGH6h3XHO1Rr
         Hrr6e9VdAPcISUBZZgKPO4wPsAPtvSmjW2/GX+EH/UnYguNnE854IXNDm08glKoAR7HL
         TABLiE08wbOnJHEzUhfrjlDxj6wdViTlujrsD5JwaxRo4lX5hyDeQZChP0E3jjx06oCD
         7HxXg55zDb2P+sbBVV1UtBr2+tf6fzwtKfKGn3Ina8YPZCPAZvupOkzLeq2leb1VjK2I
         Z7Jw==
X-Gm-Message-State: AOJu0YxPkO8Wx2oxGm4Rub53cvKMLNpnvxJywFektsNnVLsnLvA2+jY6
	pHBwSmt6eZTy1YnVhyjhfNXhqspwuA/Gh+LQXKB2x3Yr1gFDL8pVu4qSia2z9LDN/Vy3YI9VUCg
	O4Mg=
X-Gm-Gg: ASbGnculF4iJGaLJGq1wm/binfYLWzlFk8HFltSKIo3A7XrCXKQYISf14/uRrylTxaj
	JKw3S1TtFQX80qNY3EhXkhVvOmlgrejkebowfLtnJYdCMid7zxBjfbpFjroI0ekCVIwgKQDvxyj
	cRaoEZYy8YqWc8vW1YuWXT+wZkvEWAfUONZOV6QECSwJdTvbiIKibQBFqQsilpgbxSeZpLxhxYM
	c+BaO/0CwgNbCs9mkHZdRibeaKeuihEzh6qoKJYl7x4ZMvIGywuWHaeQWFMk+SMtqev0QY=
X-Google-Smtp-Source: AGHT+IFZP6jP6i4bN29fvwSbOoeNa16W2cANoTwHersOYozZQYWI3qtVDXQWCMrld53PCGJHGsIubQ==
X-Received: by 2002:a05:6602:13d0:b0:83b:a47c:dbfd with SMTP id ca18e2360f4ac-8499e628a14mr5649297939f.6.1736055817103;
        Sat, 04 Jan 2025 21:43:37 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:43:35 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 2/9] gstreamer1.0: Backport fix for CVE-2024-47606
Date: Sun,  5 Jan 2025 11:13:11 +0530
Message-Id: <20250105054318.222154-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209407

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/72af11b248b4cb60d3dfe4e9459eec0d20052c9b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../gstreamer1.0/CVE-2024-47606.patch         | 56 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.20.7.bb          |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/CVE-2024-47606.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/CVE-2024-47606.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/CVE-2024-47606.patch
new file mode 100644
index 0000000000..6334af4226
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/CVE-2024-47606.patch
@@ -0,0 +1,56 @@
+From 72af11b248b4cb60d3dfe4e9459eec0d20052c9b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 22:07:22 +0300
+Subject: [PATCH] allocator: Avoid integer overflow when allocating sysmem
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-166
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3851
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8044>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/72af11b248b4cb60d3dfe4e9459eec0d20052c9b]
+CVE: CVE-2024-47606
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gst/gstallocator.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/gst/gstallocator.c b/gst/gstallocator.c
+index f3cd20e..ff6dda4 100644
+--- a/gst/gstallocator.c
++++ b/gst/gstallocator.c
+@@ -430,8 +430,20 @@ _sysmem_new_block (GstMemoryFlags flags,
+   /* ensure configured alignment */
+   align |= gst_memory_alignment;
+   /* allocate more to compensate for alignment */
++  if (align > G_MAXSIZE || maxsize > G_MAXSIZE - align) {
++    GST_CAT_WARNING (GST_CAT_MEMORY,
++	"Allocating %" G_GSIZE_FORMAT " bytes with alignment %" G_GSIZE_FORMAT
++	"x overflows", maxsize, align);
++    return NULL;
++  }
+   maxsize += align;
+   /* alloc header and data in one block */
++  if (maxsize > G_MAXSIZE - sizeof (GstMemorySystem)) {
++    GST_CAT_WARNING (GST_CAT_MEMORY,
++	"Allocating %" G_GSIZE_FORMAT " bytes with alignment %" G_GSIZE_FORMAT
++	"x overflows", maxsize, align);
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
+2.25.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index cf81620833..b95c67f586 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
+           file://CVE-2024-47606.patch \
            "
 SRC_URI[sha256sum] = "1757184a07b9703219e8b1961f81cb1dd64320d147fc045ac8eb499efbea79be"
 
-- 
2.25.1


