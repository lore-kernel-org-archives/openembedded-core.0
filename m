Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3213EC77B71
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 19:29:23 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.19887.1681500562391403348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 12:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YwVZaYnB;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id e9so14474847qvv.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681500561; x=1684092561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MwOVqRJj7qLA6ZLRmGEkYNxXLcqUcVzKU2KLz/XVJdg=;
        b=YwVZaYnBdMbmcehxSU7MWFecZ7fwAOPvkpkDMtOQ+6j+tRcXfYO7ColsgS3qlWnZdA
         7rnvbMF869A/LXKT475ZFqK5gNEP/K7nNK3GNG3fXFX70ubBOOEBMid9vUwkoJp4Yt/J
         M/zQKspQLHCLxRR0iGaPitF9EOmP9AtlAfA60Epaa2IuBVG44cFpQV/FSEfAouw2QgN1
         nxI2vrdQSzJt2TeIOr/XQOxIsdaKDM5DY0d3bwy1ydadcNwU+nzUQJUhBj4MINjqvZ79
         Usu0f308uy0lR2kkpZLR9TUvCvZDsQP72ieMEYbwwV1b4VmQcogFKj//dj0i9T0+AbqA
         1rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681500561; x=1684092561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwOVqRJj7qLA6ZLRmGEkYNxXLcqUcVzKU2KLz/XVJdg=;
        b=hwb3Bz3HazGfC41eZJTuNs33eu+E7ThPOB4sJEv4tQ8zhggW4tGLownDot0vB5Su7z
         T2LoCbc80aaxh0Aii+jN3oWQR511fkZuAe4hCEsw9snNdEQGkxvBzFgfikVnbw9FYa8B
         krbrz2TTX7eshWZNjqkYkSHeT5YQ2E/aimDSTf5YTG5vC+5MEE03RvJO6W+QooUBAe2T
         VdKOy5MvsacHZ1LoNVarzCoZec7N3FG1sWKbyru02JogCI8NVOzkcsJOarhON/crlGJK
         vLdDvs++90LnzEXXEaaCJik7PS40FFXeZy6P4xNsBuU7zFHsvH7lfWTg0F0U2pv4OOd7
         x+7g==
X-Gm-Message-State: AAQBX9ct/MTLhs97a64XJzRpx3n2bFoi9BlUMkHYWo6oew58ljYe+b8D
	WJm9nrhvwbEgwieVfZIPz9antRSCc+v5DA==
X-Google-Smtp-Source: AKy350afQwbSLknZbueJNloaO2CzgW0wMcwOmpPcLD+kTgyKawUiDVDMQevkJ0udpeHEMJlSI9Oeqg==
X-Received: by 2002:a05:6214:27e9:b0:534:86f1:bcb5 with SMTP id jt9-20020a05621427e900b0053486f1bcb5mr5813631qvb.41.1681500561343;
        Fri, 14 Apr 2023 12:29:21 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r2-20020a0cf802000000b005ef5b1006c5sm434797qvn.38.2023.04.14.12.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 12:29:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: improve initramfs bundle processing time
Date: Fri, 14 Apr 2023 15:29:19 -0400
Message-Id: <20230414192919.1887564-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 19:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180005

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is a partial fix for bugzilla 15059 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=15059]

It has been noted by several people that when an initramfs is bundled:

  - a lot of the kernel is rebuilt
  - it takes a really long time

When looking at the logs, the second kernel compilation (that performs
the bundle) is not using the parallel make settings, and builds with
-j1.

We are already explicitly passing PARALLEL_MAKE when building kernel
modules, and by extending that explicit use to the main kernel
compilation, we ensure that we always get a parallel build.

Build times chnaged from more than 30 minutes for the bundle, to
3 minutes in local testing.

The question of whether or not too much is rebuilding during the
bundle step is still an open question, but with this tweak, at least
the build time is back in the realm of acceptable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index aefa0d21bc..e634eabd49 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -382,7 +382,7 @@ kernel_do_compile() {
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
 }
 
-- 
2.25.1


