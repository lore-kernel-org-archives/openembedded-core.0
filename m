Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D42C6FD1F
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 19:07:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1879.1678302458631327455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 11:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QfJSF0G8;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1780380wmp.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678302457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8yghyqyGu/tx6039smy4Qk23+TdY491zJTNDBpEla5w=;
        b=QfJSF0G8cVwcsxkt8sG9/+4BXfvrfEg7CiJEgRRdQuqiN625f6K2jFVvBhw6a56aSB
         FVuqyalZ+cFUYBktIg2xnBG94sVe49Oo5Ms1vVTJEOjJ76smDKMnvPeWllHFLdB/WoZa
         FwtxZdZoWK0onZ0FoeAO5epbwOhutdPbBS8dMgW/FKRFmpaiKtXB09Zp6pSqw22c0QpV
         3EVLS5pNU2smKyttBptTsCZSRCkgCllX2QHw+hVdxRlU0hajAsFyL7+SV2rLVQ9NForD
         6R3marsRRTaG73dDQiIhVFt16/mMi3oG45/2DRhXG1IjoHVPcolyC06SkKI1c0Ir9App
         Z7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yghyqyGu/tx6039smy4Qk23+TdY491zJTNDBpEla5w=;
        b=FhPcbqyV1XstDKHSYitsVffzz7gwXtZWpi3eX0TvM6Wi5AU1xSGT6Z/10m2Xy+CuP2
         1ChVRCJc4/plLsEAlLT2ZIHHfdKoXk5DCP74BVcWDuIaCoNyhxYEqtcUl04iYeRyX4FS
         law6D5mD10j5nKvAfikxnlt80RL1xRmmvI6nG4itketKLPiOARMRwFY0eQFRazpg+gSF
         jwDpa5XUMgbFAMDfZOEjx6/+OpisH+exm6AZQ2K6V36iXCnfZUpjuRrs+eW46wcjFaPB
         AZdhugSW32SoeQbrRjdLLTPN3pju8dWzvbxJU+T5ZZh4nQN4Y901A+czvMNvSVDoC9nm
         Nhkw==
X-Gm-Message-State: AO0yUKUV5bln54z+pMKISlsNG858ewVp87yS7ommG7NFjXemjPwijlZt
	PExyoNtidxS9w2B1hwrtHXsfcmhHrN4=
X-Google-Smtp-Source: AK7set9zG6H8AVve3zVNAsA2gN+XHkO0FJtmKN7glkeQsc3WbtLmvPcO+jcYkp7xgdJHsWO4G06NNQ==
X-Received: by 2002:a05:600c:4f50:b0:3eb:2b88:5af2 with SMTP id m16-20020a05600c4f5000b003eb2b885af2mr16833131wmq.20.1678302456939;
        Wed, 08 Mar 2023 11:07:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003db03725e86sm356177wmo.8.2023.03.08.11.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:07:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/5] runqemu: direct mesa to use its own drivers, rather than ones provided by host distro
Date: Wed,  8 Mar 2023 20:07:19 +0100
Message-Id: <20230308190723.2570522-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 19:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178190

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


