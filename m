Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BCDE77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.18148.1735998138519641677
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=maFxyUuo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b662090so161380695ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998138; x=1736602938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVxL26EVjtQktWCnLGkVfhyE6V5J0les96s7t06y/Qc=;
        b=maFxyUuoc2jUYJDAm3WkE4DnnVW3YUQHYODm9lQAMMLf6m5PTXYKlugapTikTeXBl9
         hh4XRBanTnZ/FWooyaQMMlONbON/aRFv4eF3aRjFEa5n6unJNS0iY/7VCi42vrWVMUBz
         clXWoW7KKSbBRYdBHb344hzTtW2irwvghRloBb1sLUldvF2qV65O5JPvyWH+5nKGYNXC
         5nsCNAkN6IqqnB7h4XpyvCjnRm1HfJm8SRamkxBdLl1l873QBaFR9l8D8NWkqR7JO57x
         loqP21L21gLlbt8p/81GiL5Fuxs5Y/bzDZjd/ZOl3e2+BKXkqycLdmnMeqcLPTlpfQoF
         FsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998138; x=1736602938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVxL26EVjtQktWCnLGkVfhyE6V5J0les96s7t06y/Qc=;
        b=w87Z9wMQOecDyKIEowfUMjrc5BTHf2kXcH2al1LIgW7NQv+6AJKVQz2MD+tBuzNznJ
         +QPWmMyu15/5MvfS0VHBFR9dTHF3JrqwK0hr/uLe9xLrS12SQr5X25vuxt3+gEEbBisr
         +d9xjFwpDjjEPBKutf9LDPpA2YJVFWkITdsDOdFZov+dhIY0IXsIPMedM2VKZ/aPgH9O
         NKDmermOcN8zuQIR090TMuWt5WusYEL8KJIbGLPZUZoIfVFh6os/9d+5meW8H4dlzQQE
         +It23y1MgstlfXV9n9+Q0eV7NEhvSHN7kzsfuhDX6kF4vks5NvWCwqySjdS/LiPR/9OE
         Lj7Q==
X-Gm-Message-State: AOJu0Yzgx8KZEOTwDnZUn+WTvGJLHE5Wh5wnBjXhfsU9Nk7/K3PKaxX5
	LJRCBSxMISdnRC1wBXglfIqpkUIA8nyCvUyaB/y5IKT/eFGc0T22jdarypzUHPG8tnLygwVXhvG
	R
X-Gm-Gg: ASbGncuvDM/1qfiTPOhaS6SdnhMq089ALGyi91hTD/7ffZ5QulGA2dXHRmCao4PN2zv
	v9L4ZXNZ2xxcpva4JdnywInzRS/mL4YZPYfRs+xvFjqit6NH9V24Dt+Vr8rTzrdOpt7L1BVzxvX
	Ts1rOq6SCRhPilIRJ1Ct4FM+Y4IRRRlyrWtdL3TohpHAxP7Q9dz4KbBika1sPoeBb4v+1HQ+KHy
	f1vh/SveGs876LGuI5qqT8jp014SFseJfDfbV8FmGbsRQ==
X-Google-Smtp-Source: AGHT+IE6q/aavuJ/umPQthaiUKG1izdAW69bGhI2Lm3qpqM6vWIGPcBiTylocNI35T8rldq1FYUflg==
X-Received: by 2002:a05:6300:7113:b0:1e6:5323:58cb with SMTP id adf61e73a8af0-1e653235b18mr22669148637.23.1735998137793;
        Sat, 04 Jan 2025 05:42:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/25] gstreamer1.0-plugins-good: patch CVE-2024-47606
Date: Sat,  4 Jan 2025 05:41:36 -0800
Message-ID: <d68a84dd3419811ec7f487907d7412c6105979d0.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209381

From: Peter Marko <peter.marko@siemens.com>

Pick commit related to gstreamer from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...integer-overflow-when-allocating-sys.patch | 56 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.22.12.bb         |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch
new file mode 100644
index 0000000000..5d8575711a
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
index 8486e258d5..e5a820e1ad 100644
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
2.43.0


