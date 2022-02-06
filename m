Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7890C4321E
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.14366.1644184405285969411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d4LnGHqd;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id og43so12519245ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQU8DYNZ7xjQxdMFYZDNqNdvCM+07b5LD8ImkErQ6qo=;
        b=d4LnGHqdt2gmV9/XJs+FM+S3ZbdTy3LbCbKiBDHszAtmU7xt16XtqBB+kilQ9F9gBK
         k41ngT6iEX/TFlrLq+H7Bx2XCstDyASMjPGRKo/6pW25CvsgWE94wo8QP7L5YlsyB6BB
         Ycx1oD8HvAzLscKrW8aZlsUbZ7RKUcN+bU5J21Fx/X9u35wSLH+doLtCFM26GQuIGnL8
         px+iX/NWyfsgBByPsQ4tzjxVsz+/JI+90i1nYOl14v93w6VxP42WJ9nhCR/g0pu4j2+T
         4B+Am0O08uLdCSUc95NyjWFtBc0PCkvbqzbw+LTE85I41I9pCFqnJk8tcYfyQhYfnt5A
         4dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQU8DYNZ7xjQxdMFYZDNqNdvCM+07b5LD8ImkErQ6qo=;
        b=nnN1oyOSVneyMQLvmoLTIIe/HzHrxyX36k0pBU34gvgr8cj6ONeCVs26yGNQl7vDIS
         4f65pNPXI8REMCV1MIwUlCz5CgWXSD0b7lCo2MTkdVCgEiAUda6I8SUBsxTEfpxtMbCW
         45XYQe8tHiuR9n6kLVQkOyZSSL17+yVFlsm+432BrBWfUslNBUFQ9w2h7c+dT2XRabom
         rhdfM6zy/+9++5JuJd79OmFfv/Z7ISPPHsJc6fJNfxCUXy+S9xINvCcsE1FDUs4y3mWG
         xmv9PdxnVXiwCsqKNaZwGzJiCYKCxrNeuANjMwwefyKZsqTGq0OqP+888uzOa6HICME3
         L5Bw==
X-Gm-Message-State: AOAM5331ZMY36mYbbr68lDe4H1/KQh2YOAjoLVEG/wG+sYNhwXAWVoNU
	20vuuRpz2Z4laUJkWs9qngI7vuaT6OM=
X-Google-Smtp-Source: 
 ABdhPJyoOv+ehXsQ8e4JKrKFuKGmIz5DQZ5Pla+BC460gF6r1H2cWowGEoYnsOHVEihgd2ajAs/QsA==
X-Received: by 2002:a17:907:1b1a:: with SMTP id
 mp26mr7503633ejc.450.1644184403854;
        Sun, 06 Feb 2022 13:53:23 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] runqemu: preload uninative libraries when host gl drivers
 are in use
Date: Sun,  6 Feb 2022 22:53:14 +0100
Message-Id: <20220206215316.367469-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206215316.367469-1-alex@linutronix.de>
References: <20220206215316.367469-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161418

Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
that tricks uninative loader into loading pieces of the host libc, if
the same pieces haven't been previously loaded by native binaries. Mixing
the two libc versions leads to failures.

This change ensures that the correct (uninative) versions are always in use.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/qemuboot.bbclass | 2 +-
 scripts/runqemu               | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index 4e05c1bb15..d60cb2e152 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -461,6 +461,14 @@ class BaseConfig(object):
             raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
 
+        # This preloads uninative libc pieces and therefore ensures that RPATH/RUNPATH
+        # in host mesa drivers doesn't trick uninative into loading host libc.
+        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
+        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
+        if os.path.exists(uninative_path):
+            preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
+            os.environ['LD_PRELOAD'] = " ".join(preload_paths)
+
     def check_args(self):
         for debug in ("-d", "--debug"):
             if debug in sys.argv:
-- 
2.20.1


