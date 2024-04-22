Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E19C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 14:13:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.19608.1713795182567780043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 07:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1iDPQzB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41a4f291f9dso7734055e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713795180; x=1714399980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQMofiAtbCyRgQjAKxBm3ezu5LJLiqq8SFST1ViGFLI=;
        b=D1iDPQzBDWZNBqA/Gvu8F7G9VAGiOWChtqBpx44MexyGZX7yh9iQvMzmETHmcqvhAf
         IAB6+ivIWXNX7yM+GJe2XeL0/9kEwLzbMyZ0bVSWdIOUHSRPYlfD/qjWYQuOvMmSyaxY
         nzu2DjFQheQ8oE3yRFQaQ5qzf+qumWQtw5qc25lbdUBBWMb1FUByEoiNz4qmLHPIXoN4
         OgE3bFHy5FVZczdf457x3uNIHq+8MH/0giZUpPaP4T0UxS2iFwnV402gINrW78XIOhnX
         o1smXsfrF3d5mgaNcUuhX/5ov7tnY0V5R+YAbA98DemmAuWRaQGlNd2nxkYX0qkNf889
         N2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713795180; x=1714399980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQMofiAtbCyRgQjAKxBm3ezu5LJLiqq8SFST1ViGFLI=;
        b=Pz3YWzfgl31hzxNT8CkVX9XnATmiGJuDTznUDeneKgJtwoZC7Mh2rKfsr5PToewb6N
         acBLt/C1aOLexNaaLth9hO46Qeyx4drLUxpzHgQH5wDUuFTjUgDKZxJoc71m3JMRhsBQ
         GZ4aRJZPd3oOZqLzRGjzzCKj1w0DONNHY74EyhwJ5y38JgD/g7xOR+CZ0RdIBqWu+db4
         KQuHRwUeIrYxOLDBkVqyqP8xbgNRZwDxbTmkZ5JZn0I9c4NzrcRIq0NcBZPy6skU3Jh2
         Q1hK3XIjt4qL/Vx1UO15KuD6BSmlcdVtH3xT6F+tNvLwF5PWGUIk+jlxantM/wIwhLXy
         L73w==
X-Gm-Message-State: AOJu0YwqQ89toEVoT/NH4f/TzYM7y6bHDxNAHeRpsErFOrpS17cRM2uo
	NHywLzLze6mmMSfVPIFbI8s8etNFwlpO5D0fqDwV2DV9Q1sSyfJup3nUzg==
X-Google-Smtp-Source: AGHT+IHsu/jDX8Z5HCf+RR4zMN1geZ4CpwPYxoeqfxl/USdZyRoPI+gRMXo6hwBpJZG+Tu9ZCyO+Sg==
X-Received: by 2002:a05:600c:b8e:b0:41a:8035:af7e with SMTP id fl14-20020a05600c0b8e00b0041a8035af7emr1274499wmb.6.1713795179975;
        Mon, 22 Apr 2024 07:12:59 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id jz14-20020a05600c580e00b0041a68d4fe61sm1508840wmb.0.2024.04.22.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 07:12:59 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH] libinput: fix building with debug-gui option
Date: Mon, 22 Apr 2024 10:12:54 -0400
Message-Id: <20240422141254.3218594-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 14:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198588

From: Marc Ferland <marc.ferland@sonatest.com>

When building libinput with the 'gui' PACKAGECONFIG option, it fails
with:

| Run-time dependency x11 found: YES 1.8.9
| Run-time dependency wayland-client found: YES 1.22.0
| Run-time dependency wayland-protocols found: YES 1.34
| Program wayland-scanner found: NO
|
| ../git/meson.build:578:20: ERROR: Program 'wayland-scanner' not found or not executable
|
| A full log can be found at /home/marc/mnt/yocto-latest/build/tmp/work/core2-64-poky-linux/libinput/1.25.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.

Adding a build dependency on wayland-native fixes the issue.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta/recipes-graphics/wayland/libinput_1.25.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 517b247fed..894858e361 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -32,7 +32,7 @@ do_configure:append() {
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
-PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
+PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3 wayland-native"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,libcheck"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
-- 
2.34.1


