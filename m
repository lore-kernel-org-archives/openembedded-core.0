Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DC3C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:58 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9250.1635325677924190683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EIT10vvV;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d3so2858210wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IuvAPkQw6S+eBoEeexMs93+Nnfom8rFDlF+S/GiBkNQ=;
        b=EIT10vvVl0lx/SA5RDFa/xLoxnRlDFiVFHp+TBoMUiao317f5GsL57N95LjIYE70OH
         rIQsk4eZusPc0ol8jK/Bs8prOW1U0VW3f80c7CjKep/+f1U2p1z9dr90JhNZH5ksKtqJ
         xBqCwHFRVi50PTAXf0BdhbEH2UOn+sGMGIqslV9QJPT6GkBtLi38kbPEDp2to+Rj5r9Y
         +5wHQOrjEazN/LukJPNH83u5qqP5RakrGvORaJTsrJ6o05S35nVgnhBQgYJDW7pGmT8M
         tJwLFk7YDEVjiSjudL0Dj6LihtG4jRp8Rbkl32yOWwSSu4pD6/amuCwkdkHLnt9N+TBz
         Js9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IuvAPkQw6S+eBoEeexMs93+Nnfom8rFDlF+S/GiBkNQ=;
        b=5ij01yX12n4qm+z3QN2vIMldnccwc3aTVwo1X416NrnyyTTIfIGoaAQQnK7SnFSo8f
         789zvkjCytLlilc7W0A1oGZWF/Etzsv/IoiEVSj1qsRWt8VvhIS4ZNrKGDz0IXvTo5Fx
         vb4wnahQosgTHxaP9NKAUDaE5W0NzTaCrJPGLGM/RCTdIT1fj+mEzX5IXRYGZtnowelw
         x9UktTZd5cjZApjA/Gr8mYh28xab+VbhOv7xcicFribkjQqUFBXqsK0A+qb0xP+AdZzj
         AIgNVNhwL01dyQjki83409tNj7Gx8Q40Mabj+C/Oy0CvJeuYjGKgVDvhhwg9Y6lOX/74
         I5qw==
X-Gm-Message-State: AOAM531Hn69RaHKfRDEHLPwidw5G62iBA98KUoeKld96W6BV7mbC86Li
	WVItNqsfZl14joexlRTX4hxHHsVTrkY=
X-Google-Smtp-Source: 
 ABdhPJw00Lj2y1KgIjTLNFJlHHNuOgVOgW/Cp0wgvPBm9f5SruRTeSgP7sL/cJbJJnZO1iEU4HNASA==
X-Received: by 2002:adf:b1d7:: with SMTP id
 r23mr39283771wra.145.1635325676594;
        Wed, 27 Oct 2021 02:07:56 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/30] igt-gpu-tools: address meson 0.60 compatibility
Date: Wed, 27 Oct 2021 11:07:33 +0200
Message-Id: <20211027090736.2546759-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157503

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n.build-fix-meson-0.60-compatibility.patch | 24 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
new file mode 100644
index 0000000000..159425a643
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
@@ -0,0 +1,24 @@
+From b9a19aa4bdb21751c04c0e3ba8a9e2e35a10c953 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 25 Oct 2021 18:18:15 +0200
+Subject: [PATCH] lib/meson.build: fix meson 0.60 compatibility
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/meson.build b/lib/meson.build
+index 9929520e..1a525587 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -152,7 +152,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
+ 
+ lib_intermediates = []
+ foreach f: lib_sources
+-    name = f.underscorify(f)
++    name = f.underscorify()
+     lib = static_library('igt-' + name,
+ 	[ f, lib_version ],
+ 	include_directories: inc,
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 1a00eca7d3..7d912e4e4c 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -12,7 +12,9 @@ inherit meson pkgconfig
 SRCREV = "203def046b466fb2da67f9f15552d84e1c0b41f2"
 PV = "1.26"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
+           file://0001-lib-meson.build-fix-meson-0.60-compatibility.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


