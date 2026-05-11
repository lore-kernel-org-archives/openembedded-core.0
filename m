Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74521CD4F22
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:35 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60233.1778531132708429119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e8/9xkvX;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50e5ad864a6so48190281cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531132; x=1779135932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0whl8MpYKpfICuOgDhrv0CmVBpzXm1479gxIFkdOgO8=;
        b=e8/9xkvXu36yPz5tjcie+D7FsPersZQB4XLwRV0BEF8DXOLUgWD09Gf3QiRKF1q/+P
         urYVty0CC6lbi3vTOHb/sxVdeVdkDXRfZxdJs6WFJZPfqK2W2GYxrXALN50LgP9T6Iqa
         Qvtj1hByv4E1f8O29M2NLXrke2YGMetbaq80Th5sW8qB46d9v8V3kDbmczh4X1X5JufT
         al/iKIwu/8/36sPi/lgGk/TDNb/ycJoOuSuwME1gYug2Dc4DIAXpu3Hb+x3O+Oz4RzgX
         shwFo0bMesnaj/alqk1llB6iqIVbTYBMLhq1/emvLkA7U19q4h27f2fetRqoBVBEznb5
         wyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531132; x=1779135932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0whl8MpYKpfICuOgDhrv0CmVBpzXm1479gxIFkdOgO8=;
        b=nbM5uvZKkSpoAWCnqeOAIMgT5JgUulYdN7imJCPtWNFCNrXI01zi8pQdF2v1617poJ
         uGAx7l23k+W9gg7z68pAyUIH2g1X2zbckUhMIzcNQ6yC4ygQH8ELC9IQWY0qrg5CAiAN
         f71SLBEuzBBdSnYFLeTIXLX90MgI/RgZS1Fz59w/pWJM+txL4S+TvZ4VkBlk2gQmHjP2
         sn3lNnujayLeAlObA9HYh6ZUT67DBgT34t6TmjVK7w9lu7iYaay4JFq/wGQfKg50k50J
         AQjUYQyUMB7vz+7rXymYb+NmGgS+S/nx/2XA9fms4aE5BzrbzDQZqxOuFZva5aApumTh
         zRsw==
X-Gm-Message-State: AOJu0Yzgc9aYRos1vGXp3bCiDSZy00EpFpLablrJe7gqgD4Q/sXtFWBu
	i3NaDe37obAUkgfW6kbZzFrj+VEOva8RASYilAPqS92gAV/5QY+wMqnYaX30YGdN9/9RBg==
X-Gm-Gg: Acq92OFpPnzyZ/FZvWPO5F2MM6UYKk/UN7wrYML474sjTRHfEuDkwUAvJfe4xBh1EVe
	gPFFVSZAJ42pCE93MZ7u6RapgCQYFRzkG53l2Fer8OjeuYgx3A1a821yGf+cs+9JDt+Z+PqlIPE
	r2b32klZAtXqCiyoo8vaGXeG4f4m1SnpYKx2FM6P5ESdyNKnC0VO9piSG9kn9W/xPz6p4z2OXwv
	Zgt60ktetkfWf3w4dADLQl7F1fRv4NG9RF2gKa8WB3qDEBPDNn4LniKY7HtXTU9zd9KV1wpHoc3
	DATs3nKl6pYrSY4UHAXQTKg7JTEn/3livYaIUpKWAEZdfGdS/PoC+2STE0473hSQQehjTQUQsPg
	Oo/5RGlRqYjY/62C4vdVpzjzYrJj4mDoE9xYzVANyAsBxK+4YmaXat4JdSZPB504SxGgWfm/uKN
	VhpbkT7JEc4RvYFMqUX1VNESkWUUd3y3kvUAsVWIyvlrWUHBOnHrzXK3pmvCmrtql0CRRB+QYHY
	9vscczL5Pr7kjl+QTjMd1fVR7DgtGm+mAxISfrZMrXpzxAx2OK959zJGqI=
X-Received: by 2002:a05:622a:1495:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-514d20eaa21mr2678581cf.37.1778531131534;
        Mon, 11 May 2026 13:25:31 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 08/09] yocto-bsps: update to v6.18.26
Date: Mon, 11 May 2026 16:25:15 -0400
Message-ID: <20260511202517.1648910-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236833

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1fe06068166d4 Linux 6.18.26
    d5f59216650c5 Buffer overflow in drivers/xen/sys-hypervisor.c
    446ee446d9ae6 xen/privcmd: fix double free via VMA splitting

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 79cdb16..458089e 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "6ad892116f3c1cc17c0b9df907607b1b5fe02bb8"
+SRCREV_machine:genericarm64 ?= "a75037479dab2b35403aeda227894ee36cd39941"
-- 
2.43.0


