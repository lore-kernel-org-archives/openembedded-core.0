Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AAECF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:46 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.45583.1727661461982386749
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QJGFsAmm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e07b031da3so2841816a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661461; x=1728266261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxLeFtK3qzGnkI4cvD0UGMVXEWoQQPhOQ+gAhINsI8w=;
        b=QJGFsAmmchx+WRKbNMro8aYrGK1odUk0iWy4EQziOGia1IkBlp+0ch+cuXFIuxI2m9
         WuDA8RuUcpkY/nSOdyEZucu966RJRrcXkdAIK652XTgky4EqtrmCN/FtRS09PmqEUxhX
         ENyQ51tPQZ3pKqWY/eQR3Mtk0WKl/ZiwuXWH+ilhtmABdH6J9VHkntrGuiLOUWlyOFVO
         mNSVa9VXk0USyvbizlCbdj+GmhWfy3fQm3J11sdExGOid0CZQgZCeeJ4dYZ57wLXCnxN
         3mWMrY8gyf8FfJ77LepUZxXbn4Sv4vuJSMj43bwhBuMtwuVdcOcNxz8gEaKcwXPGPvbi
         N/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661461; x=1728266261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxLeFtK3qzGnkI4cvD0UGMVXEWoQQPhOQ+gAhINsI8w=;
        b=rFfDmIbYiFFddhijOBa+hAadhM1pf9Zvtt3/5piYrcNuwuxUSfnVXwRUR/WVy+OYWv
         xtVMzWPCmDR/4PwnsBQH+Vl6g6QxmTobt/Uhhlmuc7EqcegPPCiyRSBFh9vJ+JbXagVk
         d4rw/V/5/USw75+olEOd96Bx6qI1Um+uqdAoOjKb2ZhogtBo0rePbHVYtBfjRO1VuCrk
         +JXcLBaV9PAhatxDb5Vv6j32ap1KraWB85+u9QCnUqazHQBLU7CHAQe+uQUhVYFSaBy+
         yo7pOEJdUQLir4h0RAxEF2gypaq4O1QR60/TqQLyHIlxwxsyGBhEheArfK4LqZU6sL4S
         Ld5w==
X-Gm-Message-State: AOJu0YwQMtjJe0Y7naTHcuCf0aeEIE8wJHUZo5t3BaXO93TwyNLSA+vc
	YR/jklM48BBEBWGUAcGEMgDZrNXWPCScKD/Z6vGtsygW7O6UmiGlxwupywIbRXTmYL8mOmHnBPy
	E7CU=
X-Google-Smtp-Source: AGHT+IEtk+th8UGVDfqjwb89RaENirV5crdIL4zCRPzjBEaM7CGVR3Z8mX1fT9RSseiLokRbHe6FEA==
X-Received: by 2002:a17:90a:bd85:b0:2da:8c28:6561 with SMTP id 98e67ed59e1d1-2e0b8c4c097mr11950002a91.22.1727661461176;
        Sun, 29 Sep 2024 18:57:41 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/27] kernel-devsrc: remove 64 bit vdso cmd files
Date: Sun, 29 Sep 2024 18:57:02 -0700
Message-Id: <0a9e8fcd29cf6feae437d202baea52775eca5af9.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205069

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In a similar way to the other architectures, 64 bit arches
can also require vdso generation. If we leave the .cmd files
around, they'll be packaged and generate build errors:

   ERROR: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.10.0-yocto-standard/build/include/generated/.vdso64-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
So we add the file to our remove list and avoid the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0238a49f57c83600909b0f3773a1569bcd13551c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index fafab475f3..7724967151 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -134,6 +134,7 @@ do_install() {
         rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.compat_vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
+        rm -f $kerneldir/build/include/generated/.vdso64-offsets.h.cmd 
     )
 
     # now grab the chunks from the source tree that we need
-- 
2.34.1


