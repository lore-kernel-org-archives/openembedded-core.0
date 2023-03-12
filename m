Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F9DC6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.67839.1678632660069006938
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ctF6Ldp6;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x3so38951512edb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8yghyqyGu/tx6039smy4Qk23+TdY491zJTNDBpEla5w=;
        b=ctF6Ldp6EVd49VOL74VyqGIbw880Q4BQUQDqVrFeDIasYujtbMgNXJ4EgxH2Bacibt
         pibnCVgXqDm8ACew9WX+zsZCyljlXY1jkNvFngv4oP6TZEqPi9CYtKjqAjkGcBjGkqzp
         DxUiJg9g/P+S4bzKM8+GrI6VkWGM7dPIBzuyJh2Mk6VkCX6fIWS1H+6YcAMT9m85mzXN
         TjDIfZfa/1/++6lN5OwZqGFVTtL427QSJ1XiEtPZ3V29Lxc3u99Jfalckc4lSId1qt2E
         kUPCSIE4nqvUiboe+nNuRog0BkcMj8zm84NYKbInWnrQp/Kd2qpffD3YYEUWRvCHZEjn
         y83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yghyqyGu/tx6039smy4Qk23+TdY491zJTNDBpEla5w=;
        b=MdrpNse6W6gsHKIZORecRUBq8lPYWKIWX89bK1v8ppUBFXMN3MxQ68baPI/VdUrpKn
         KNnX5ucooRPlih3VKpS4J/FvxqFr1gpJRIe0gI7ni5nNQuxC6z53cyYE1UQjGSlCVYIQ
         I+WHFEZxDSpLhpoBSao5wSji3dGK64eTtZ0Zkws+ZNxHXhoUwCwHuUEmeu1/gJ7zDM0O
         nUn5RQtYrRGPITd9p/AUGBR5aXjq3D/FX1NMUH63YCGNvQIz8sAt0lKTpZvHyuJ84TFW
         4gpM39NvVxe6+3Amyn8aF/GgRBzsso1yqCRyUr5ltHXDJ6MaMfwY38qygdXDcwBoWTXW
         pGaQ==
X-Gm-Message-State: AO0yUKWQ9TJjyT9tM3zwmNw1Y0YSA+b1yRPP7FpTfkxxOfFH/V0S52gt
	BLyjp8oCG7PIcdpYqAtyoD8zfzkNlBU=
X-Google-Smtp-Source: AK7set/SgT1TwkHUBYv6dNbtmDyDCodYsH+RtOgt4rbuV+JKIoDGDrItZ0+DdH9m3G0sU7G8uQbbiA==
X-Received: by 2002:a17:907:2ce1:b0:8b1:32dd:3af with SMTP id hz1-20020a1709072ce100b008b132dd03afmr42579964ejc.28.1678632658052;
        Sun, 12 Mar 2023 07:50:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:50:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] runqemu: direct mesa to use its own drivers, rather than ones provided by host distro
Date: Sun, 12 Mar 2023 15:50:47 +0100
Message-Id: <20230312145053.1427377-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178392

With mesa 23.0, it is not longer possible to use the host drivers, as
mesa upstream has added strict checks for matching builds between
drivers and libraries that load them.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 58b0c191e1..8e915f3d4c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -447,30 +447,7 @@ class BaseConfig(object):
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
+        self.qemu_environ['LIBGL_DRIVERS_PATH'] = os.path.join(self.bindir_native, '../lib/dri')
 
     def check_args(self):
         for debug in ("-d", "--debug"):
-- 
2.30.2


