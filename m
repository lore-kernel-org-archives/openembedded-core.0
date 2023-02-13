Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E6C6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 21:04:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.27352.1676322264216206333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 13:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qptmnPhR;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id b5so14891023plz.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym5EBd4sjP41UlVv3KBkQJzosD74X9x44x5+2IoKtYY=;
        b=qptmnPhRQZTwmGiXwLv352xJMzAbhlQZ949W3Dvnzh1mift5gtXBMReyIlfNm9occ1
         nuTJ5cvCh0WQp11Wk9xjT5FqOH+LitZXvXZ9scthyk2JqyQQdM9dYHjZyEhaMQasOKxs
         QBNRXLIbHGS0nKqJf3ugOyHdwBYKs7j36TxrzGvDvvyooSi5vEOLDlTrRyPaVWjwwsSQ
         4wT6GfyVgFqQVEmlRwMp/EcgN8G8m+uOs77tny713cEqbDOVUtBSjI2vrrWyZ2/U0j58
         s+NHBzoIYrNe8O9a6jPgxmJM94kAVpelS3a2ZVOwxQK/CpK1MSCpuqu0J/RhyCcd+kAC
         IyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ym5EBd4sjP41UlVv3KBkQJzosD74X9x44x5+2IoKtYY=;
        b=NIEAanrez/y2nKHhlbdCnTgH618SRKa/Ex2CkZhN2d1d4h3kSz1c1/e8RG9h3EYlyN
         bvItZn34KpNdiyqRCCS19FreMxwqwCKiLO9YF3MTrmwx/X73dRcDAoU8Y+ZqQk6/qG78
         0xGeIOFkndfXvHl5F/v4GaVAcFGZ6thtHu8F/qAcnJ3qzBuKfhpS4JkW2HedcIzdNqCb
         BZXl3Ib7AORRZxGq5eXS8JLPsUXqpQGtElJzc5yZ1KlESHGMwZu2GhOyH2Tpjbn+Wts6
         ViyTpBDEY6y9jg45ELBzqlhSelgnJZURurVHd25ajm+Y2v38q9QLOQvmu8bDC9Ejc2Ue
         yo4A==
X-Gm-Message-State: AO0yUKUPrnKl1DeBJTkh6ZnCCjgUZx9e5PbA6eNOtHuPzx2zweBVtWtn
	42qAVFWgwBsjWAvlTrxoPcpDF/LjpN8=
X-Google-Smtp-Source: AK7set86O9cd6WiHOalucEZ5VEejIO93q6Pv6hgpLDTs5hUyOrHoYV4347HeT67JnFkkQZ13O6aZKw==
X-Received: by 2002:a17:90b:4f88:b0:233:f447:1271 with SMTP id qe8-20020a17090b4f8800b00233f4471271mr6097965pjb.43.1676322263391;
        Mon, 13 Feb 2023 13:04:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090a4bc100b002311dbb2bc5sm6896493pjl.45.2023.02.13.13.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 13:04:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] gstreamer1.0-plugins-good: Fix build with musl
Date: Mon, 13 Feb 2023 13:04:19 -0800
Message-Id: <20230213210419.1152513-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213210419.1152513-1-raj.khem@gmail.com>
References: <20230213210419.1152513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177113

musl's definition of ioctl() API is different from glibc's and gst has
built upon definition from glibc which was being warned about but now
compilers can check signatures of funciton pointers, means it becomes an
error with clang16+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-ioctl_req_t-for-posix-linux-case.patch | 40 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.0.bb       |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
new file mode 100644
index 0000000000..fbbf029a2c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
@@ -0,0 +1,40 @@
+From 5ce1e410965ed047a03c09b17796162f0363e396 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Feb 2023 12:47:31 -0800
+Subject: [PATCH] v4l2: Define ioctl_req_t for posix/linux case
+
+this is an issue seen with musl based linux distros e.g. alpine [1]
+musl is not going to change this since it breaks ABI/API interfaces
+Newer compilers are stringent ( e.g. clang16 ) which can now detect
+signature mismatches in function pointers too, existing code warned but
+did not error with older clang
+
+Fixes
+gstv4l2object.c:544:23: error: incompatible function pointer types assigning to 'gint (*)(gint, ioctl_req_t, ...)' (aka 'int (*)(int, unsigned long, ...)') from 'int (int, int, ...)' [-Wincompatible-function-pointer-types]
+    v4l2object->ioctl = ioctl;
+                      ^ ~~~~~
+
+[1] https://gitlab.alpinelinux.org/alpine/aports/-/issues/7580
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3950]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sys/v4l2/gstv4l2object.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
+index 3a5c961..4f43008 100644
+--- a/sys/v4l2/gstv4l2object.h
++++ b/sys/v4l2/gstv4l2object.h
+@@ -76,6 +76,8 @@ typedef gboolean  (*GstV4l2UpdateFpsFunction) (GstV4l2Object * v4l2object);
+  * 'unsigned long' for the 2nd parameter */
+ #ifdef __ANDROID__
+ typedef unsigned ioctl_req_t;
++#elif defined(__linux__) && !defined(__GLIBC__) /* musl/linux */
++typedef int ioctl_req_t;
+ #else
+ typedef gulong ioctl_req_t;
+ #endif
+-- 
+2.39.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
index 85f8a247b1..ef4d82c598 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
-           "
+           file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
 SRC_URI[sha256sum] = "582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0"
 
-- 
2.39.1


