Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD85E7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:08:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.88.1736273328286915760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=25NAbRja;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b662090so205926975ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273327; x=1736878127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfm+1IetAO5FbyYntngtxtsV8xI3UkPLOaXaqlCzAsg=;
        b=25NAbRjajq1s0w90KcMF29UFvzJr6ZOPl1q1DEsUpQTN39/zkxBPb/ru5P3ymhz8v1
         VSS28K+pDU/GcMi/2g9jmua/BXXwpgvFrDfRkv+BjRYvDaqIfjTtBCbBw7FlexxfxhFq
         iKQSigx8eZNmkYEf9mi1+kRiC+6sCfXICrwnjEpDXtMXCqbJMy6Fln+w8I55P45AoQua
         eRtG+JnHxvOZI2JK3DqcLsPDCghGnp0G4HE6YLV4yp74WmU92oSmzkHLjx4Ob96XzEy6
         BSXb9EK0KbfOKbg658ChV+wGdteOtwtDE9viewZYLww+uI2xtLTYkuEl7MWyM4PLMAvM
         grXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273327; x=1736878127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfm+1IetAO5FbyYntngtxtsV8xI3UkPLOaXaqlCzAsg=;
        b=Osfhn7s99f8a8YxJcsGLh3oQ8e7DKvEbRUyPpOLeaytqK97Kfui1xozsS2rrIrlAfY
         bwR1tOV8zoH9f3PbXGTsBJbpBkjTCoyWoqw7DA3vwTgYPcmgmCu/iLC5NFUUtZH5QbRE
         iWms3e4UGpOFxxBFDdEWqCh6rHwV0tsS2ue8v54kynB4/h457KeO/QiSn9Rlhtt9e6oz
         rD4ahrPq4cIfWsryjas1ts5n2tpJBwNLfjJZw5TlYE1Yp+KXntLHjx52vAIJLNTY2dPU
         bfm0D9I0WI6DOVAIFLM0dzBipTrg8yT66bBrAuDw3LWbzr6GfpYmiqT7iJc9H5Yuw1JG
         fO2Q==
X-Gm-Message-State: AOJu0Yxm4+/dx0E6gCr2FuUO6gxS0xE98Nfy0nYuCT4MAs/j0cCbjfUj
	pyLoGzN94WivBKmCHalK/l9Zi8B2bJSMnpeIBfKQct+cu0xH+5+//ZqeqA9m8r3jx2TYvnke6Qu
	YzHk=
X-Gm-Gg: ASbGnct4r5p8d2CxFdKwVl313cCEe71xCJfLJv1Pa4RNZpcHdT/vWOZfvsa2HB0XP6m
	B6WBuQ8jIg/EeSga7tQwTkYT7hCSMBCHgjKnrKfp99myVRtFEyrxGA4TyFXRGCo4L1f1zLYr2F1
	4UcljtWwi/Ek3YNya1Mea9F7R6ApmMFQ/kuHcg9wP8I8sV50f3b0dXjEL5wHJpaU2gNoukNjh1w
	0gff9Ib+cBkOgHkYQIXC+qXoEMbJvJPDqoZpcVz/7IySw==
X-Google-Smtp-Source: AGHT+IGkrGzpURqlB157kZJKiGjEWg+aAw9SG3jV1zPLYsMazVenNpwGoDIMLrm4BU2XhqLYW0sZ3A==
X-Received: by 2002:a17:903:2342:b0:212:1ebf:9a03 with SMTP id d9443c01a7336-21a83f4b0c9mr183155ad.2.1736273327539;
        Tue, 07 Jan 2025 10:08:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/19] gstreamer1.0: Backport fix for CVE-2024-47606
Date: Tue,  7 Jan 2025 10:08:20 -0800
Message-ID: <de94acd8f8be37fbc6e0b16693dae8a7efb5910c.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209483

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/72af11b248b4cb60d3dfe4e9459eec0d20052c9b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


