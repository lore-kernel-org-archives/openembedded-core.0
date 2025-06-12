Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2EEC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:20:45 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.14527.1749738038296259685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5owKdeq;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so1772692a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749738036; x=1750342836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmmvIgtPClHFH3tlH1Rz53g9p4N+mXUA1TK8Qtr2Mr8=;
        b=W5owKdeqTY5R65Q2P/KUJEWDWyETBFo7xQ/CNWyWmlaPSiMwkungp1Ny6QOG+nxUsO
         E6geiVu8ROHwKvIrfIwdEkhS83UVZ6Wx+Czy+VVSZCSFJUExgdT4c92+RCLrTWfKBam/
         FtKMfCBf2SnIT/F3o370eFSONYZ/qVDaKiexMbLIw68Vu56055Vf7btbYYQly9Iv3HrJ
         s7mMRnbTiuN9d5UU2SpRijwn/gfovl6erNlyz7gYJyvAl3U0nNIoq/Kb3MdHlBklAo3z
         0K555MndkEg4OEBiwWEHbFcyYozrbKCyAYBatdI59Ms2Nqe7Y404oxFTsZgI3bbYgsqe
         3jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738036; x=1750342836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmmvIgtPClHFH3tlH1Rz53g9p4N+mXUA1TK8Qtr2Mr8=;
        b=TFV82BzcAOge5RL9O3buUWgXqQlln/YDixG3tEKQMSAF31qniYFcA9D418K8J+6cZo
         9w1ktjY9OJe8CyizxW45IVOCqAgU10hnpdBrqmioFlmOeLUMnn+FCBPzHwXaIUFn8dKQ
         46Ti6GK5EuYZvQKc5SznDKJxxWlyIKA4OBWUUtSif7OrrGyssiiHh22s3u8dXT5XApEz
         ZAQ7DbJ/FPFv/Wy6s15GEZDT9KSJojyo1Qm/9Z1JmYmki4KLmMgColOXqUbU2r2nlXQ6
         WW+Sa7u1z2K5pA34OSE2vZy4KejRvPKeVGoObIoRr4a/nemJpIc0eBEXi29Qgl/wo2xJ
         hkJg==
X-Gm-Message-State: AOJu0YwxTELWD3QS9Ir6thQw44k4hy47bZL2wHPZgrLmTp4zyfkC6xvl
	Bp8ffFO0xgMxP3zNJWKW2mqHj3brO8piUJulE/P3/tyAK7/kHEcPJphqQfg/Zqzb
X-Gm-Gg: ASbGncvREFdg1L2IRuHtd9KvtB9Pf3ZjuOSYpFQ5egENYrdB0pyMTxb2NdD7xWhhLKY
	9I9TzE6dZFD1fU/cMUmdh5E03fjKycPAhS4wV47I07nd4dguA8EztXT/GKXD4ANTq9Ar5k/EZxC
	TXixePNR8THRbVnboo7DCTpOfogCPXg7AwbmWPvqXeHLk5SJH2yr15UT+AcZYR10hDtcgA/vChE
	zNZfxLJRP6697zpTxGm5sOzObslnE5rnltrkBhKYiryzZpfaQLgGUr2keNTHwWq7rRFCL8xb5Dr
	j2gOuGZ/O7eu92aozTyUu4OLbH9N8pFReS5BHE+yS79BEefmxzFi441U1n78H3wwHwsMJyB8QrZ
	tAQ==
X-Google-Smtp-Source: AGHT+IHqLnqbwRfn/0Fv5eub2279XwJTXPcQynUranel2sTjrIjDIo8u6SqTCz2S1K0O2nfOaGl8wQ==
X-Received: by 2002:a17:907:3d0b:b0:ad5:27b6:7fd1 with SMTP id a640c23a62f3a-ade89462d04mr715222766b.17.1749738036011;
        Thu, 12 Jun 2025 07:20:36 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4ce1cdsm140290366b.6.2025.06.12.07.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:20:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] weston: upgrade 14.0.1 -> 14.0.2
Date: Thu, 12 Jun 2025 16:20:34 +0200
Message-ID: <20250612142034.1807820-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218526

While at it, also add libpam as a dependency to the vnc pkgconf, to
avoid the following error:

| Run-time dependency pam found: NO (tried pkgconfig and cmake)
|
| ../weston-14.0.2/libweston/meson.build:95:15: ERROR: C shared or static library 'pam' not found

Changelog:
 - frontend: Fix crash in output resize handler
 - libweston: fix bitshift in weston_idalloc_get_id()
 - libweston: fix realloc in weston_idalloc
 - libweston: refactor update_lowest_free_bucket()
 - libweston-desktop: don't try to move child surfaces to not existing layer
 - libweston/input.c: Fix weston crash with the mouse event
 - windowed-output-api.h: Provide ARRAY_LENGH() for windowed-output-api
 - drm: Fix underlay test
 - compositor: Mark pnode accordingly when buffer type is direct
 - compositor: re-order paint node placeholder checks
 - gl-renderer: Take direct-display into consideration
 - shared: fix binding-modifier none
 - vnc: Allow neatvnc in version 0.9.0
 - compositor: Prevent startup crash when hdcp mode is set on display
 - libweston/desktop: Avoid a potential crash on invalid resource
 - libweston/desktop: Don't destroy the xdg_surface

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2:
- Remove libpam as RDEPENDS from vnc PACKAGECONFIG, and keep it only in DEPENDS

 .../wayland/{weston_14.0.1.bb => weston_14.0.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_14.0.1.bb => weston_14.0.2.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_14.0.1.bb
rename to meta/recipes-graphics/wayland/weston_14.0.2.bb
index 2a0a403d99..03b49d730e 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3"
+SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -92,7 +92,7 @@ PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
 PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
 # VNC remote screensharing
-PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc"
+PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
 
 
 do_install:append() {

