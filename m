Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26666C4829D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 18:49:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.1075.1707245385541011397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 10:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH8ZB1NA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d958e0d73dso8197565ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707245384; x=1707850184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbb+cPoA6tuqKnNpMmk9B/x07NrMCFpBP1ueE3pre+E=;
        b=NH8ZB1NAMf8YwEfrwdSjUTsXXoNISXfNe2fhhuJ+KmyLOam/efOwFllb9pgwEn6xFj
         sYKZSEPW0Jjcrltl7t0yZagZx2mnyaK2UPMGazBWBdc4ieNQGYFpKwpUVZtRmvDCV3Ym
         Zl8jh5x4LEsWdqayvh2hhriyarKvbZscrXtw5lKMjfj0gSj18ebLU8mraLXjelG8sckM
         WUyIPxpVlvrJIMDV8dbFljCYzFoWDTSCT0JsbPWxMBtREPqbQjPCOXNu1Rld0i7teer+
         ohtC+qYBEZn3Wv8h75CNxyAByPbbV3ISF0SBTj/tvEKQMujTqZLFJeS/iNQTrudhpcG5
         IgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245384; x=1707850184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbb+cPoA6tuqKnNpMmk9B/x07NrMCFpBP1ueE3pre+E=;
        b=ilnMST6Qt3GRHL4NMP3iLAkvqEEGG1/3D9QRgyHPrWFlJEOofKpZD007bimLZqA9HW
         /kQ8zzg1VhR931KuEfzmUNVk7xG7ggR9Fw8JmUh4Y//YVtIrOgNBnesUfD4pAQPhPVyo
         TV1+WoG8EJHzEfvPUJ9VMv3Xen3WX9/BxrUPwpXhjPD58uALZMwRz2/h626IsWjkzW0f
         JwJ7RHFhlwIOxrleCNxSZDCfGlxnjl9O5KTE3f3BTrX7mxxykc/osIg9bXUBRWMTcugB
         c0Srr1zj0fdIFgU0MW4IFk1cxYQICdpEMLaNliC8lzDw0ykNv0s0Q6bZm5g3LUGRRt7P
         ryIg==
X-Gm-Message-State: AOJu0YyghzY7cBIcBhFI9qP4sSN1Foe6VhS+tzF1wh2VJjU8D214T+I8
	wHgoamisJQnH2JXd+k2QMG1YgRGI/m024A0ICX4Cdnw/QzdMG0hYBt2zyHW8ezw=
X-Google-Smtp-Source: AGHT+IH1G4WiFv45A9gJl0v5Jf2pcBNbB48ckXCdd4Rc+2LaWkKEHcFSvU3LVEJGsAThGzZ53AoCfg==
X-Received: by 2002:a17:902:e802:b0:1d9:3edf:1e2 with SMTP id u2-20020a170902e80200b001d93edf01e2mr3785481plg.3.1707245384506;
        Tue, 06 Feb 2024 10:49:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id s13-20020a17090330cd00b001d70af5be17sm2212712plc.229.2024.02.06.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:49:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] kernel-devsrc: Add needed fixes for 6.1+ kernel build on target on RISCV
Date: Tue,  6 Feb 2024 10:49:37 -0800
Message-ID: <20240206184941.748116-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 18:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195016

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 9c3c09e7144..07a20feb8ef 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -224,10 +224,16 @@ do_install() {
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/build/
+	          # v6.1+
+	          cp -a --parents arch/riscv/kernel/asm-offsets.c $kerneldir/build/
             if [ -e arch/riscv/kernel/vdso/gen_vdso_offsets.sh ]; then
                     cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
             fi
-	    cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
+	          cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
+            if [ -e arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh ]; then
+                    cp -a --parents arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh $kerneldir/build/
+            fi
+	          cp -a --parents arch/riscv/kernel/compat_vdso/* $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	# include the machine specific headers for ARM variants, if available.
-- 
2.43.0


