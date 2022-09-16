Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA59BC6FA91
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.889.1663362504253682709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNIAMXeB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so598897wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=4QouynIEdwguzEa9cNa1oA9MVy4UJT6P7RW3jIe7K1w=;
        b=eNIAMXeB2775Pc+IyxkSngL8qNrH6TwhL3/s9K+sldrwaXd+Swwbc8riC58VYfmBc/
         6i1vYfGt7psclrCUbGJTH29Feb4b/1rfCjOWQen0ydhdOjd7GEgKQQtOn/Bh1NNvXTHs
         5H2ZpoF7vWIBGrzA9y9ebZoWHEvwBvS+CUuAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4QouynIEdwguzEa9cNa1oA9MVy4UJT6P7RW3jIe7K1w=;
        b=iRi2jJuPjkv9eWMaS/Qj8QkJqA1AOxgMHkuMfU0HzfT8YvfWEsOjazhK5VtxTpg7qD
         Bl32WP9iL9oJMNzfi37LMsVstiwXkeARvOfHrW63eEBo4WBRxD5jkydhHnnP94ES24Uz
         hX3F27PicfTJzfp/RUXpywwiVkoE9sp0ZgXFFLms4cdlMRcGfCmuzT2Ev2/HOOOltgzW
         +CjAb2P9VRhXH+kGvfw2J514Azk8APcjPjY1sooesUBRsE2Zz0xuWMSnqUbEx6WQsGvy
         gPw2p2na5h35qHrgmCmrNxFRvxj0gqT2iI3BMSoxai3h76O/e4ZKtXTjnv+EdUlXuDnr
         PTPA==
X-Gm-Message-State: ACgBeo1/CMoDaKYPQP4A5DBZ0885GcpvvxCGLyhko0BMVEHNE8w3vjWh
	c1spx2wjGmWsTOfDsJczfuRb3bWPnTgeJA==
X-Google-Smtp-Source: 
 AA6agR7Wmh5Bx4Vim4Cl9HvUuHN2tnE4yFIMJc3bna4kAc7SCxwLfTOQKIxjIXIy4NnVDYJOa+xKGA==
X-Received: by 2002:a7b:c389:0:b0:3b4:a67a:2ef7 with SMTP id
 s9-20020a7bc389000000b003b4a67a2ef7mr9352886wmj.180.1663362502454;
        Fri, 16 Sep 2022 14:08:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/24] btrfs-tools: upgrade 5.19 -> 5.19.1
Date: Fri, 16 Sep 2022 22:07:58 +0100
Message-Id: <20220916210818.1228761-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170802

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../btrfs-tools/{btrfs-tools_5.19.bb => btrfs-tools_5.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.19.bb => btrfs-tools_5.19.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb
index 4f116a85ace..db8026e0f09 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "96b83b16158f3b87037085761bf212e958473767"
+SRCREV = "e1d9dab326e043696e6648aba4ccf90874d1d3d1"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


