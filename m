Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD46C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:52:18 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.625.1638895936834301544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZVYXYcs3;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id gu12so13654651qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VK+1KqG3FMSLoY3Eg2/xMPYs/H2Fpb2FSLT0KCg5YI0=;
        b=ZVYXYcs3R01jiZqzhPoJeKjz0mbZRGo87hRtNZCU6g1HTiCM4YsxoaAX00iNXakeui
         FXXTNnTt+y14aDnHNxls+3fT/rTlSkgU+9NQ8bRk5kJh2TWf6XnYLHSwu/8a8IKDDiLe
         Y1XKZxkGI39AG+PeSl39QBFFLLHghV29PmhHm5Sz2k2DzLceU8CJvSffZPERdEMt19y/
         iDAbG5dyAhc+fAV5YvEeDp6PnrLRtOIPongGP5hZ3XFSTw646nNmHZENkV0m+3BFYCNd
         SCeNpCipUPNdFuctxSDJ+mr27UGY+9fTYRrcvM493o0AHDooQ7B5q9XoBO78RN75924m
         +66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VK+1KqG3FMSLoY3Eg2/xMPYs/H2Fpb2FSLT0KCg5YI0=;
        b=mdg440UBExLzmexhysUma0mZYNkbkROnxMIjcQEgXWyIplXvzlmuXB0y8ledYDPtNT
         gj1MUWYgmtEI2lCxFvWXSHhK5NeilPXE2WDsm7MlGyZaeDcGNLWwIgq0UuSEcR2mEA9S
         ZWVNBskQzzVDpTMHhcLBRB4Q87c2ZPkRc/jIHi3pnZAE58CWtRlx0EmoneZmV1e/5KxS
         HmvS8Mxf55SGLyJWDcSXvnfEHSU3dHIGcGID/RvcTiqn55YOAjC5RrfKLASKPUbiVxMD
         N0DmmQIZALAV3VgNUW9drY8r9jpzMsJADSuwnDXj9WI7TX3AlH/9HhzbLKoY1ri2/5l8
         nFAg==
X-Gm-Message-State: AOAM530y0nVy93dUJOBNYqXnD9/nude/D3VAQP5Pb+KNxwQh+zvksB5r
	TvxiQCGaJ25+g0ikvqDXbPhOrHYMwuskmg==
X-Google-Smtp-Source: 
 ABdhPJxpTLufK+yGPBb3MX2nIdQlMzJbsWDfH7l7/pIhKNSJagKSHHp0BnZOcuxefM3s6+Q5/EnbTw==
X-Received: by 2002:a05:6214:c81:: with SMTP id
 r1mr319680qvr.111.1638895935946;
        Tue, 07 Dec 2021 08:52:15 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v9sm57536qkf.90.2021.12.07.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:52:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto-dev: use versioned branch as default
Date: Tue,  7 Dec 2021 11:52:06 -0500
Message-Id: 
 <1af8b17226603e07d823e1e4d25127cd6fa14723.1638895732.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:52:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159321

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The -dev kernel used to only have standard/* branches, which were
managed similarly to linux-next. Which means, they are for testing
integration of patches, and are rebased as needed (typically on
version changes).

We now do some leading edge BSP development on the -dev kernel,
so the standard/* branches are not deleted, but are instead
archived with a version prefix v<kernel version>/standard/*

The branch renaming causes problems for maintained releases
(they'll jump forward to newer kernels), and for anything that
wants to specify a particular commit (-dev is AUTOREV by
design).

There's no reason why the branches can't start versioned at
this point, and that solves both problems. So we switch our
default branch to v5.16/standard/base now, and it will be
updated with each new version (we bump the version anyway).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 6b6ea9a7e8..80f62a0412 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "standard/base"
+KBRANCH ?= "v5.16/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


