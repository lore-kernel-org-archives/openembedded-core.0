Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6815FC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 09:41:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.8407.1678959668858680714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 02:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NVzsCXB+;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id x3so4981462edb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678959667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjWwJ+HzMLGsNCsJYUyCfLocm52s4dHYJE75IWvJq9w=;
        b=NVzsCXB+eOiUHMakIAFjPF4WF13cpyIQ+wHzzeQ0woefMYu4FM13nnu8mbUbwWD84n
         w2zMmY4CXU6wMMEfp2nPJs/PoF3fb8C7J1xtVSg7uoMXTG3ovjSXI5hndSATkBgDbsc+
         EYMg55od2HvvXIFM9SmxlZ7FTUimNgzvpkiiEWXyWhCILxG4T72YFWvZq14AOV0VxleV
         qIBIKi4NMFixoOtMT3H799NjXnPzBoLRSvnNL6khyDbXBuWqTRizzFzjCQZwwQk9moAl
         9YhPNks58ZQI5OFrSYkEGF909oRPeZOOVevmXoVYiaFvQ2hpgdogUVYAnxvNieTpbXGu
         J2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjWwJ+HzMLGsNCsJYUyCfLocm52s4dHYJE75IWvJq9w=;
        b=7EzOT5NJuobkJSwPDQMm3sFaQpFAke+UL7TzOI7GbRoKVmtHkFVp6IhPSrK8oZwHF4
         LolnhsJqMgjk6KYIWwEqaw1gRbwzk8Fh12N1+z/oRcAuXLGORH8oaCJjVjiGSyJuio/m
         xN2d0n8CesO3U5pCOzass2kPvQuUTvN2FbJn4EPgZTc8qm6JpN9nG09vcq+CaXvxW4Cb
         yWqeipPtMXYGrM31q64ASb4pSEssZkSXKUEZaTw0+bZAW7Sl9Z4MzIUwRBHsWZICXwVE
         4yKWqX0xG+/rGsxtxTsrmuskGgpgB+8wcL9E+WErtNj26C/NHQ7Cwe2FcalV1xCIbZ/+
         hvZw==
X-Gm-Message-State: AO0yUKVQPQjGNZYmSTdjusLWZt1zlQ28EtPFZUyweLqD+2qYBfp+tZWy
	kjIdTh8a9ihVLE/RrgQvA2m10A97GVk=
X-Google-Smtp-Source: AK7set8UvyDRAxSbRW/95wUXZj/ur3teBnl5ZOePfk6pzcJFXqzqovYzLwofGfAlBDafEx735yr4Dw==
X-Received: by 2002:a17:907:1caa:b0:92c:138e:ff1f with SMTP id nb42-20020a1709071caa00b0092c138eff1fmr12373907ejc.18.1678959667190;
        Thu, 16 Mar 2023 02:41:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b00923221f4062sm3621661ejc.112.2023.03.16.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 02:41:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] runqemu: direct mesa to use its own drivers, rather than ones provided by host distro
Date: Thu, 16 Mar 2023 10:40:57 +0100
Message-Id: <20230316094102.2628727-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178691

With mesa 23.0, it is not longer possible to use the host drivers, as
mesa upstream has added strict checks for matching builds between
drivers and libraries that load them.

Add a check and a hint to runqemu so that there is a helpful error when
there is no native/nativesdk opengl/virgl support.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 38aa35fdd4..0240dd533c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -450,30 +450,16 @@ class BaseConfig(object):
             self.set("MACHINE", arg)
 
     def set_dri_path(self):
-        # As runqemu can be run within bitbake (when using testimage, for example),
-        # we need to ensure that we run host pkg-config, and that it does not
-        # get mis-directed to native build paths set by bitbake.
-        env = os.environ.copy()
-        try:
-            del env['PKG_CONFIG_PATH']
-            del env['PKG_CONFIG_DIR']
-            del env['PKG_CONFIG_LIBDIR']
-            del env['PKG_CONFIG_SYSROOT_DIR']
-        except KeyError:
-            pass
-        try:
-            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True, env=env)
-        except subprocess.CalledProcessError as e:
-            raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
-        self.qemu_environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
-
-        # This preloads uninative libc pieces and therefore ensures that RPATH/RUNPATH
-        # in host mesa drivers doesn't trick uninative into loading host libc.
-        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
-        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
-        if os.path.exists(uninative_path):
-            preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
-            self.qemu_environ['LD_PRELOAD'] = " ".join(preload_paths)
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


