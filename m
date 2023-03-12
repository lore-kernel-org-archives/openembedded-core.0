Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADB7C7618E
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.67634.1678632660279093737
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XPooPkwj;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id o12so39012830edb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfy/m96DG6ez6Iq+FjvGez6muQQ1jtnqLBaL861crpY=;
        b=XPooPkwjItqra50WtrDlhfIZPPZOLEqlcamSgplTuhz30ArsHyUEKstZJrSw5tFMRd
         KGWC84IQHTjx+BHJFVv+sNRqwb6+NyjA0KB3NdsiSQADclulhwouPsplyDDTgROPivlR
         hzxVG08G0f8ixMkHbc08IyDnq0GEUHMWNNOuarTKdhnYJ2VQo+kODphHtZfYhE6cCSUE
         2F+wSFjckNeU1bm6lGH6ULN+cBeg+FbPGlWpCKUeqmsjjFPMMYR7FF6qVls3brzGJEKe
         E3x6/ARiQuiDVTq5Kg/mNOHoFjPblCBl5z5zOEGbwF3U6nxMN7HSYAV2fe6smZbZ9nBU
         H7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfy/m96DG6ez6Iq+FjvGez6muQQ1jtnqLBaL861crpY=;
        b=Wbd9a0Hx60DejKpEWEuJeRQJJ4qKJ4WQku+YbqJbROw2IHq01DBL94601hqXWrIDmf
         WqfDxAJpITUF1cYR0dTKpu+AuZuybieHvlGFaB0H4Nh0yOZKFdF/A3sIq5sC0hjlPvLG
         dEodci6/+AkB8/t8FBGoCeN343/eNvFUYG/cAnGX5A6qWv69SeP62f0qksQ2PbBZ4NuE
         c8+deS6AUnTq1dXgV29743X6NjlWJrm4b+z5TBAvzpZAnWIY/6dxk5PWyFOVZieS8rlv
         swIUZWKhT3Sh/aHhpr1DKDWYcGIw9X8EmGvNjHd+Kow2VQinxS69WTr0abN4W5X1nH8G
         ITJA==
X-Gm-Message-State: AO0yUKW+t+NhbdBWZF9N+klF1nfLYF04eMfh4oXVRc6y8v/TQxAGh1F6
	rydLhDGBdwRjsL1+LoToBYmSMGXK8j8=
X-Google-Smtp-Source: AK7set+YTdgWFhadMkeUXSj4bwhrFHN5rWMrMUnMeFYX3z5YeJ12p5Bmk2USTo6BZOWI0LONOnEV4A==
X-Received: by 2002:a17:906:4fd5:b0:8b1:78b8:4208 with SMTP id i21-20020a1709064fd500b008b178b84208mr35790312ejw.1.1678632658555;
        Sun, 12 Mar 2023 07:50:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:50:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] bitbake.conf: do not set native opengl distro feature from target
Date: Sun, 12 Mar 2023 15:50:48 +0100
Message-Id: <20230312145053.1427377-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312145053.1427377-1-alex@linutronix.de>
References: <20230312145053.1427377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178393

This makes native opengl (and thus accelerated graphics in qemu) opt-in;
the reason is that latest mesa tightly couples hardware drivers with its libraries,
so we have to build both in mesa-native. Doing so significantly lengthens
the builds, and so cannot be imposed by default.

Add a check and a hint to runqemu so that there is a helpful error when
there is no native/nativesdk opengl/virgl support.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf                       |  4 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
 scripts/runqemu                              | 11 ++++++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f552..d1dc428583 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 81b8d056cc..661c09c109 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
         if 'sdl' not in qemu_packageconfig:
             features += 'PACKAGECONFIG:append:pn-qemu-system-native = " sdl"\n'
         if 'opengl' not in qemu_distrofeatures:
-            features += 'DISTRO_FEATURES:append = " opengl"\n'
+            features += 'DISTRO_FEATURES_NATIVE:append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
@@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'IMAGE_CLASSES += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
-            features += 'DISTRO_FEATURES:append = " opengl"\n'
+            features += 'DISTRO_FEATURES_NATIVE:append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
diff --git a/scripts/runqemu b/scripts/runqemu
index 8e915f3d4c..9f82aa12f1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -447,7 +447,16 @@ class BaseConfig(object):
             self.set("MACHINE", arg)
 
     def set_dri_path(self):
-        self.qemu_environ['LIBGL_DRIVERS_PATH'] = os.path.join(self.bindir_native, '../lib/dri')
+        drivers_path = os.path.join(self.bindir_native, '../lib/dri')
+        if not os.path.exists(drivers_path) or not os.listdir(drivers_path):
+            raise RunQemuError("""
+qemu has been built without opengl support and accelerated graphics support is not available.
+To enable it, add:
+DISTRO_FEATURES_NATIVE:append = " opengl"
+DISTRO_FEATURES_NATIVESDK:append = " opengl"
+to your build configuration.
+""")
+        self.qemu_environ['LIBGL_DRIVERS_PATH'] = drivers_path
 
     def check_args(self):
         for debug in ("-d", "--debug"):
-- 
2.30.2


