Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77764C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 20:40:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.14846.1644007232464254959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 12:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ik+HXkNF;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j25so12716896wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 12:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tm6VGxGS4iIB5hElzVQ85fxHFy1ar21JMJd19nDlKZ0=;
        b=Ik+HXkNFv7Rbn+hQumhmbjxe6CMVbh0xcSeKVESwRjZ5qVRlEzd8W/NKMiN3Izmr99
         Ap3tW8NLguHDjeV6iS1fnZzAHJhTGcLMrjsCUfCubQTODl/k0ofWOFrbT9+IMCuVRZt2
         WS4tzLimJqLr4Bfj/eUgRaMo301KqrjAGllN8Tg1NXaA21ZxaSnbg2BjVJiYOci46cjD
         YAs0nlLzzdZerg0U/SFAt/rSaPHEwUjfGV8BRVyvr2QkAz0N26gH8rfcjl7tJigox+Ml
         w86OQ9HyEQ/zcPjtpWKiHSTLwwc3Fj8q6kIk/+cJzflV9eo78qhTEbSUbW3XssJ3ln3Z
         H7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tm6VGxGS4iIB5hElzVQ85fxHFy1ar21JMJd19nDlKZ0=;
        b=GFu0c5LlE7P9cYDrkZwxwDAimNdezlalEYfC6cP2dGCGQV1vrjUNO9TVLuDyxvCEQU
         wWf+NJZEOg2RwLliv4MyLUsaX59FTe29kT4jhgPaUiTLt0GlZxxQJziKl8ibsGeYBf8c
         5JyrndDe7Ly6c1M6tHCctnx5o2xSfpeCFXcyMA2zHhYBJoYduEO63olfse/bemDcLA52
         LZf3orn0xOqNEXfKe5HZSEqJOjVirqR6j7XJilUeHsiBLz57FAGxuUD7U9F0H+UX4kBo
         dgQrb0Jrx7S6TdqtS3o2L/RJQ53Km9l1vR9WdHAWEocVv8JhT8AjXHHQbTzEyMPeMhhC
         szUw==
X-Gm-Message-State: AOAM533YdR1+V16td0VTWzxhHO7Gfh4T1MqDtZGd4d9dv5GZj9jPV6b+
	wIrD6KhiXdyAhZpdjXDucAXOO50nOw0=
X-Google-Smtp-Source: 
 ABdhPJz7MwLLXttiH6tEjAvjK8A/m3AWXXEyLCv9RhsbrJWviXQ37ZpJlc0J1Zp5LZrzWaUzA/bdng==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr484042wrd.711.1644007230610;
        Fri, 04 Feb 2022 12:40:30 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 11sm3328075wry.68.2022.02.04.12.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 12:40:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] runqemu: preload uninative libraries when host gl drivers are
 in use
Date: Fri,  4 Feb 2022 21:40:27 +0100
Message-Id: <20220204204027.2323845-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 20:40:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161382

Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
that tricks uninative loader into loading pieces of the host libc, if
the same pieces haven't been previously loaded by native binaries. Mixing
the two libc versions leads to failures.

This change ensures that the correct (uninative) versions are always in use.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/qemuboot.bbclass | 2 +-
 scripts/runqemu               | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index cc1cbce69d..229bd88527 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -109,7 +109,7 @@ def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
                 'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
                 'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
-                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
+                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
diff --git a/scripts/runqemu b/scripts/runqemu
index 4e05c1bb15..7d1f85f357 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -460,6 +460,10 @@ class BaseConfig(object):
         except subprocess.CalledProcessError as e:
             raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
+        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
+        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
+        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
+        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
 
     def check_args(self):
         for debug in ("-d", "--debug"):
-- 
2.20.1


