Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C927AC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 19:07:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.1881.1678302459015853817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 11:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f5LlMSWY;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so1784816wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678302457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1bU5PCSbhYWe81gvciRTZA9Y52sr6hno8SROhzE8ik=;
        b=f5LlMSWYNGbC30EbXq++36sYuWFa2GSkiKTVrN5vBAyX3d68y4T52z0cAYGypBSgga
         7wAfMawJycGhGvPedcm7KDfh4bT/Igdv7hrgb4AiCUQlLYFnHcQRQjThjzXpL10DUQrR
         gZJVK7noezJZznrQkqTaJkzPUSX9kn5S9zVUVyS5OoYSCcbYBaHp7vyp1+J5F+rMbBRf
         4tqqIKxy977JnDMuS6+12wgeqy7bgK9sJTQ5+pDhn13dPhT6+yeJsWBmJdFo96QPBGwl
         F100z3Cka20emnFSsElIqbQ0jSdfS28x5BFAp7HSK+ahzDkn1kzTZLC0o31B+dGBjjUq
         ITAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1bU5PCSbhYWe81gvciRTZA9Y52sr6hno8SROhzE8ik=;
        b=vnWFenegLGEhT/GLQPlc7Bqjiscfu2HW5UhBzoVn8PWtdcdhz2G/vxbatFOBIC9Bro
         10V0GAQnVDKD4MIbN/kE7j3ZeN5a4VPU/YV98SEyrONVDrW3QmGYpt9JT1v7+qT0yLA1
         i1sHfO8GvV/IM+Xc0XjlKu4JKI4LZ1sC22kU3q+IPApbG9PDxQyASng5XiDWd8WXlByj
         JSiz49paHGKF9cJUcCh3X5YCOlh9H4bZZABhkB3gQm0sf5nSssj14IqnLa5FG24SAv8N
         GZe06+9VZUgZaRKmocHKcfwGZplaw9TDf60jweJ4fel8EiyKjII/o4qaFu0M6TI1ehxi
         oVSQ==
X-Gm-Message-State: AO0yUKW+3/uqjRDLBOmWk0vWUc7yIANr3Hhmeln+qtiAyKGKwPhLl7oR
	uOeraLijKiOwQFkCD6xKw/UymqfXMuk=
X-Google-Smtp-Source: AK7set/mlWkoercpSVDK80X7es6JlydM+scb7+edTylO8R85DlgjfdKrBn47dTZxA4NfX3u7VzYemA==
X-Received: by 2002:a05:600c:470d:b0:3e8:f27b:a92c with SMTP id v13-20020a05600c470d00b003e8f27ba92cmr17309184wmo.32.1678302457495;
        Wed, 08 Mar 2023 11:07:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003db03725e86sm356177wmo.8.2023.03.08.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:07:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 2/5] bitbake.conf: do not set native opengl distro feature from target
Date: Wed,  8 Mar 2023 20:07:20 +0100
Message-Id: <20230308190723.2570522-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308190723.2570522-1-alex@linutronix.de>
References: <20230308190723.2570522-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 19:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178191

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
index e32c4aff85..74d8a1c23b 100644
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
@@ -263,7 +263,7 @@ class TestImage(OESelftestTestCase):
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


