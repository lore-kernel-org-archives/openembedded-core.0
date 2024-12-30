Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BFBE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 12:57:52 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.61496.1735563465737071215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 04:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BnryFlyz;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb94cceso82868315ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 04:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735563465; x=1736168265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9l8u0TdhoOWT8rwVQ1yp4oWGsP8NkgRTi3ScZmY1/Wo=;
        b=BnryFlyzhmfB4Ovwf+YmFwW++sUNlhgRP3F0SaFa5xEN5fbeHiBrexaQxzqtUd681F
         +npfot7tgNlG0KdLbN43Jq54ayKwTg+4rJPhCsQKFuraJ38fsRhsU89F3yGqQnRjAZ9h
         Bh7sjwTGHvbp895h/BKp4c7rjS9GI3bJA9TE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735563465; x=1736168265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l8u0TdhoOWT8rwVQ1yp4oWGsP8NkgRTi3ScZmY1/Wo=;
        b=wbDYIYG72kiiY7fJyxSozp9aVEge+Ex5YBVksdqamJHCGoGwyC3xgLx/A/fbJgGZan
         TqDmR2uDnLrcxmAUhahOXkMHvh4f+8pfDfLWE/pviRfDCnKklgUY6DvJvMGr4+x0d+Lp
         t3vsdrnmi/AtB3iHX+CY95ERxaDbsuKWBe4MsMsnU/TbwmW8B0uXWrLJDjs+owx/xFGU
         CtCtVdyLbukbpq9lPduMg5oh2iShs3rzjTGvchrtJQEAwYIkUkJcpr4ok280gHeZiJud
         HBeJzG9KBoWlhx0X+mqcoic15Q4eCsj+EMg4imIB41MvQTbASRqqiNem8ALpagxFwRdE
         BXBg==
X-Gm-Message-State: AOJu0Yx7PKsguiuYzktmewwsf0TPuIXieE48CHksihWguLLGSwa+Jrch
	me65BOQ8n6aBtPFm15QSyq7CWUGJ3o13un3nuHdoJ6uLmAHTbkHcXR8sq1vFaOAqS6rGZk6p4ny
	qeSI=
X-Gm-Gg: ASbGnctHToq5eC8RN4Rj1tz7kVZrl0Dgngn6GJt0t/teTEz6e8wwNsgwOefQBkEor86
	etG8kYp8WlJr5XUy1NQAYctasG7QDEz7RiwXFxGIDo2gmGy0OXs3K5uWZIMVFeUj8E4njkFVgmd
	ZtByiEMKAtt3S/SoFVF0tVjXBfQ9PFqD5cwr8yy0cCZggC/atH28nIDpErqaTHKBfCBs40yUf1k
	L4BdZQ6rdc+ZRXnWs6WOXWhbJj+pGHc0icbLZpPc9WJwmRVQvInaVqbjWAsimP07MylR0M=
X-Google-Smtp-Source: AGHT+IG7I3ysQ5c14zZMEE5EZz+nxgfefSIkIG/JkaOmjH7pgD6HXt1fcfgfn4fbqWJUvdNtymupjQ==
X-Received: by 2002:a17:903:22c6:b0:216:59ed:1aa3 with SMTP id d9443c01a7336-219e6ebc78bmr425836005ad.27.1735563464678;
        Mon, 30 Dec 2024 04:57:44 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:7146:d7b0:9c2f:42e8:7ef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde50sm177395235ad.154.2024.12.30.04.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:57:43 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gstreamer1.0: Backport fix for CVE-2024-47606
Date: Mon, 30 Dec 2024 18:27:33 +0530
Message-Id: <20241230125733.1724989-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 12:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209161

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/72af11b248b4cb60d3dfe4e9459eec0d20052c9b]

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
index 2c9c6944b0..8bc448b5eb 100644
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


