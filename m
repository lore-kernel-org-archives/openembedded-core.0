Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627E8D597D9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:38 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.3470.1731467795545116647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tcuhOMxG;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e604425aa0so3705325b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467795; x=1732072595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5YuUcS/zmE6KJ5oEy76wD/Q7C436+T0DGBlIrK/Fzc=;
        b=tcuhOMxG+gfuJmViJlyjylJOLU5FRv+wzSXwD3BZ9W6DeO46oBpJCwhmOzRTbPdJqA
         JJ+YY1zuaLGXjGNqs+1lVK02nlRmUpgInzNjmWG7wYdGEaYNX4XZVdV+NGu77/SzR50i
         nlPd7/6zqzTY+j+cqrPWQcd7Si7/E9D2FN2EnvZ1qvJoKVcn3+ghEzsss8eBSUz+OuiA
         QwHTthWMrr1QJzE2HTOouRtZ3WHM8hWddhh2NxfN3F0WoO636C1Z9b0IhLky+xFwYzT/
         N4C1BG4bCWIgRXt9Kik0xsqtQNqCTi/w0rF9AANCxpvZnpRsg/jY8UIK34bJR3aOpMTl
         ngkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467795; x=1732072595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5YuUcS/zmE6KJ5oEy76wD/Q7C436+T0DGBlIrK/Fzc=;
        b=bxD/XZEcu0d1CiDLwq2F8PQT9j5vn8DdLlev1YXDlfOR8R2j8cEOb9kRpiQQdmPCY6
         Z9McDGTIAAy+2WEWzk79qRivXBtuMicgXqcnNH7FwUyP8GqRXGbjp7SkJ5sFUUn7dMst
         QmbftNSP2MsaOtNMxq94V3h2IgDKFF/qVrPIQ/bx7IqZbB9GXf1EDCo1yFdzNjk++h4x
         v7kte8kbkuLY3jbnm/t4NBpWbZy+Ma70F7S62M7pu0wRdFxcWd2q0OJv4albOfmefTIS
         rey0cx70chaqyM2FQZ2LPNbWsN8bTDMytNG87novJdrUWxDEc31BK/jp5ZLLUS4lkt5W
         9KjQ==
X-Gm-Message-State: AOJu0Yxr16cjrhAcQUGeDNE+68+8EA1hUM/t35tzvVHm1J0QSS0dIBZC
	CD4DNWLCoE6UXPsA2kF94ZGUHVKWD1hgLfme80hgEr5W+yAlHfmpmoAtpmLbPUnNxgqeg4bQ8Q2
	x
X-Google-Smtp-Source: AGHT+IHgtRjD5RCLtk3Yl4b9eyNROytBdYz7Avg2/6I45MAHXNHNYa95RVJ+QPbt9aavuqKSR1v7/Q==
X-Received: by 2002:a05:6808:120e:b0:3e6:d0:febd with SMTP id 5614622812f47-3e79475d863mr16793373b6e.35.1731467794681;
        Tue, 12 Nov 2024 19:16:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/19] pseudo: Switch back to the master branch
Date: Tue, 12 Nov 2024 19:16:03 -0800
Message-Id: <198ff9141f94c551d2a29f3a036c209e3e554a37.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207083

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OE is the main user of pseudo and we've had the changes in the oe-core branch
around long enough that we're going to run with them. Swicth back to directly
using the master branch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Luca: re-add 'branch' parameter to fix "does not set any branch parameter" warning]
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 00af809689..f40ad9f6f1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master \
            file://0001-configure-Prune-PIE-flags.patch \
            file://glibc238.patch \
            file://fallback-passwd \
-- 
2.34.1


