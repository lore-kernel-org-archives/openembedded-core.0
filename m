Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13114C0219B
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.92298.1738600904772466615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GakcRwu2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso32034695e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600903; x=1739205703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvWZ4vveg+kajuEyfiKEo7FnpJpmiCRMo4jj/+hqu4Q=;
        b=GakcRwu2s35sDEZHHs5ik8VndjFvR+P4Ri/wdt0zlBFvfNKCLEsXPF+bG91oyQLuMY
         LxWs3Kj4e+VyXiSXnD/s3j0XlC5QtCLD7CjZegAH5R4bnSPS8wvoB8p8vVSoxeDUS9yh
         BcGzVHOs7Iwr7lx+Hk30mnYiNeB7AvaPzmaRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600903; x=1739205703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvWZ4vveg+kajuEyfiKEo7FnpJpmiCRMo4jj/+hqu4Q=;
        b=xSXlouRqml+r8RW2FN0qgnEDq45mcDAGoM3JnB2eovg9uwoniL+g6y7B2Wu3Iij0++
         1KOYoR7Dz1jKC3CIZmwSw7R1CFQPw2CwK/8UslNpyz925oPOD1O+KPAiH5THSmQJHM+g
         KXzO9xDGGe2sQhQvPEBLSrp6ruk9j+zOXDuyrN6YNYzBYZOPfvn9TNBrY0zG6eHshESg
         FTMz0MMAoqnDoNhGYhtFQ8J4bvU8Eg82tM/wapd9Dp8qZBKHZnJITdKutOSOiqrU10Ky
         R1W5bqktU34NFr4iHEZZjzpu7hw06Fyp9lKLz4bwgJmweIkJbH7QttaqKvv8DkLhaXII
         C1QQ==
X-Gm-Message-State: AOJu0YzJAgUgd7k+wYU70NjQQU5EYYib/fp2HUc69pr41XvqJRcvPbwn
	IAtPACHdFAEU05bj+agfIoXR4jzlSLDePqJR+gMGc3sAoOiXTsESUvIswI/HUhNKceFjT6AqN39
	B
X-Gm-Gg: ASbGnctwIFhwTnJUFWsVGaZ4ABbc2xp0IRtjObykjCVDelWY9SvISs5Dt0jTF2me2kO
	iRgJdHLi4VT9G84+803Df8d+eCSzmltExBchJ6/F8SGcq3lA49cSoxNx/glGjBSFpagwOe9dGbb
	MObTmfAHQuvNJ/CJ0Qszhjhq78U8AQ35hIarKL86XwTAABfBF/D2YVkLqiDN3Bkt5D0PVCESfa9
	rSbjmsPX/tIjGCK8Dm7gV3exiQTbXp+aEfVM15HXw5d3z6X3B30omBIB9VW6p9YZafoWS+zQjGH
	VXmbAiBCNpYDliJ5Km8f4VvfD6J1udzQJmF3PwuvwZkf
X-Google-Smtp-Source: AGHT+IGvXikimlf5XK1TuMERPWLe8Dzu1DjK5QIULZJmc4yVJEk5UHP41lohn76ce3SbI28znik84Q==
X-Received: by 2002:a5d:5987:0:b0:38a:6264:d13e with SMTP id ffacd0b85a97d-38c51946553mr18790775f8f.8.1738600902592;
        Mon, 03 Feb 2025 08:41:42 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/46] gstreamer1.0-vaapi: upgrade 1.24.10 -> 1.24.12
Date: Mon,  3 Feb 2025 16:40:56 +0000
Message-ID: <20250203164130.3403325-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210685

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-required-lines-accidentally-removed.patch | 33 -------------------
 ...24.10.bb => gstreamer1.0-vaapi_1.24.12.bb} |  6 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.10.bb => gstreamer1.0-vaapi_1.24.12.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
deleted file mode 100644
index 404ee5fb782..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 75730490d2c0416ae8ad4d3e2a47ccb66d260d9f Mon Sep 17 00:00:00 2001
-From: Nirbheek Chauhan <nirbheek@centricular.com>
-Date: Fri, 13 Sep 2024 14:37:10 +0530
-Subject: [PATCH] meson: Re-added required: lines accidentally removed
-
-Broke in e3f086c648171c3c993f5dd73e2d025480c3729e
-
-Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3801
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7512>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/577df3a02f7f26283b2749c58ae7738bbdf4be4c]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 1a8301f..6c61773 100644
---- a/meson.build
-+++ b/meson.build
-@@ -80,9 +80,9 @@ else
- endif
- 
- libva_dep = dependency('libva', version: libva_req)
--libva_drm_dep = dependency('libva-drm', version: libva_req)
--libva_wayland_dep = dependency('libva-wayland', version: libva_req)
--libva_x11_dep = dependency('libva-x11', version: libva_req)
-+libva_drm_dep = dependency('libva-drm', required: get_option('drm'), version: libva_req)
-+libva_wayland_dep = dependency('libva-wayland', required: get_option('wayland'), version: libva_req)
-+libva_x11_dep = dependency('libva-x11', required: get_option('x11'), version: libva_req)
- 
- libdrm_dep = dependency('libdrm', version: libdrm_req, required: get_option('drm'))
- libudev_dep = dependency('libudev', required: get_option('drm'))
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
index 31b4aa27e39..c634de7c6ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
@@ -9,11 +9,9 @@ REALPN = "gstreamer-vaapi"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
-           file://0001-meson-Re-added-required-lines-accidentally-removed.patch \
-           "
+SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "21593dbde5c6bcdcfe99195defbe3c3f4da01cb85f8ec10aae943887d39d8a4c"
+SRC_URI[sha256sum] = "39ab3d2a381c99a9e10f46182ed57c6baaeaa8be810bd2f84f162c8be299753c"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"

