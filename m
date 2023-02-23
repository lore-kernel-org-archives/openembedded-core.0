Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE21C636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 06:58:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.5474.1677135500348683040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 22:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iqdAclBJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id b20so6332178pfo.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 22:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TzxXOAgvuHeK0gZF1k56SfQdGLWVDPd3GCwwNhmtnc=;
        b=iqdAclBJw2U0N83Z9tmAPSYxlN+9clpZy+zTFOdGcS3oX9mD7yHlP7060g7Y0zhSKb
         TKpXza4kdGijlOJ8tjx6BwTIgVhvD1CSaofGU2wzqPowNIKs/YmJTINvXFlg9B3GmJf4
         tJVi7x/ueJGCALl7kMsofzqBibU2BmexoqxQqKXPLyb2CqXmMpirqGavtVQJszdydVp3
         4OrrtSoKo5tvfkvpCUd6Nv5+el4UYjpL5jKTA20ZezBLLMAZXetBKUfVDtlMyrjnSwcP
         G1WQdvNVyqjgJU0dhk3mq6/8ubp0eQ81zNZBbYUChScRFIkSH808GVvlbKEkNZdwY4WP
         C1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TzxXOAgvuHeK0gZF1k56SfQdGLWVDPd3GCwwNhmtnc=;
        b=m8mKeeeF+mOBkjV9ncKch5iUjc8aVWOLBaSB8A8xQtlMZGEJrpkQBDQ8UneXhWr0oY
         2dcrO8d4tuABGkJGd7f/L7ZGDxATPSNOTPFln8aVINQQ8JOcjL7JfS8Q29x73KhTpa7Z
         aL9pcbjeOizFygkZEcHQ8NFTzKYe6CMpJn5XFw+ftOBK/ZHczaTSmho2Jxe1WH6so2Qd
         uG1LOS3Ei6yRbBoZcZPZzFQwjp4JY0MGpKFCaFzcavULfaA8VQhbo8Axu9MzHfCIDiXV
         3QJierqTtjzAhR7a0lheOKuVmBuaCAm2yJaiNpKeLrxpib1bzBY5tIS3Nih0CcWNpWMo
         B+FA==
X-Gm-Message-State: AO0yUKUQw4/dsduz0grKZAoUp2uUSAPeColiN68yXFq0wv6Xt8NqN9et
	TuRpEQ1QM3YgKoFcSlmrKXplpSuhMBA=
X-Google-Smtp-Source: AK7set+2NWiagnY7Ymsg2fLxey6tMTXciI1d305GvUn/6vgjoT4dmA/dmHoLVymOUM5r+6t32wldew==
X-Received: by 2002:a05:6a00:47:b0:5cd:d766:8a2b with SMTP id i7-20020a056a00004700b005cdd7668a2bmr6854563pfk.6.1677135499150;
        Wed, 22 Feb 2023 22:58:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id s23-20020aa78d57000000b00593225b379dsm690605pfe.106.2023.02.22.22.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 22:58:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Enable --enable-new-dtags
Date: Wed, 22 Feb 2023 22:58:16 -0800
Message-Id: <20230223065816.3151823-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177602

Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH is searched before
DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
DT_RUNPATH, this order ensures that injecting
malicious shared objects is way harder with DT_RUNPATH.

This is now default on major linux distributions already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index b2dbf241df..c69d29448f 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -96,6 +96,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
                 --enable-deterministic-archives \
                 --enable-plugins \
+                --enable-new-dtags \
                 --disable-gdb \
                 --disable-gdbserver \
                 --disable-libdecnumber \
-- 
2.39.2


