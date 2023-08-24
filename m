Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7CCC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:14:46 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.11785.1692886479491746680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WfUmqHQ+;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a44cccbd96so4723294b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692886478; x=1693491278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cL+XUVhkHZn4rG3hGk04VTE2a7EkE/vGkljQuKItFds=;
        b=WfUmqHQ+1oPRZZc2GVxqfKo89ic6nI72VVK6XnESmPp+TxB7y9xEMt5r+J/kQ72cjJ
         I1OhvvuZNG3ImtWjeurktJdmd+BggHPqyfk+vMivvGmxokoElgPPoVJTiCzdP7VAFd5b
         c9vLRIj4o22OhLiOByQS7ulA8+Z/tap+DBAGiCaCiziJ8ocNvEM+cYiloQpCnYicrkTd
         Uxy5+XLv/+F9lfOfAXx0hHMvsSdPNvUWM+1xulTz/L6uZWGCTxFa2CU+8vExZTlivmZ6
         AK6FbG5yh/V3PAy5OpMlnvcPnJbiLRLCY5eA73Pmrn5htpxI1Ri/V7HNu+uNeHXA6J2M
         sk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692886478; x=1693491278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL+XUVhkHZn4rG3hGk04VTE2a7EkE/vGkljQuKItFds=;
        b=H+7LC+wjIxO9arss6ddB6CevPmpjCyeF5KIkkeAcxQXiIMfmJXJ+EIA9PXBvqY3NYz
         liUlgV+eSbvv2W3sflvEO/+4GpQNIi/lvNTwygav6otKXzyWVjLXukikhuJ8aygV/gLb
         LHM3Ojx0GW6X2yXhsB9grmWfHxBK+kTp7Jy9LTx4y9NuKvDCe7V+JTqCnXc4jfbsgfKR
         qT7MmI4p1Z89zuvGeOmTZHeLaqPsu8FuapUFqXL4m5UvueK9JKQ9QB2HNnBuqdNBiKS9
         VSIDtqnKr1KTKVNave2yw5aiprYN9W8w7LzRgCWQJAkFSwxHh1B3xdCrH7drArv8IFwH
         S7nw==
X-Gm-Message-State: AOJu0YxRjVXGyg8CkZTs7yTikp6u+pIbO9yL8k8rOYzBxF2PaPulG3Fr
	zmqAwsp44CGIIGPfTYzkXCqSz1l56sI=
X-Google-Smtp-Source: AGHT+IFOX73nts1OFkzRTR7WKUwCiYPdHonMu77nMfS8+nkal7dn6bpvDNEV8dppzvopcEHIvm66xQ==
X-Received: by 2002:a05:6808:2391:b0:3a4:35bb:edae with SMTP id bp17-20020a056808239100b003a435bbedaemr19813314oib.29.1692886478070;
        Thu, 24 Aug 2023 07:14:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::751c])
        by smtp.gmail.com with ESMTPSA id b1-20020aca1b01000000b003a9a35349b1sm86496oib.24.2023.08.24.07.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 07:14:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] buildtools-tarball: Add libacl
Date: Thu, 24 Aug 2023 08:14:30 -0600
Message-Id: <20230824141430.3487035-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186667

Hash equivalence need to include the ACLs in the output hash, and libacl
is used to do that so include the library in the buildtools-tarball.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 70d740b4e0e..6b679489fd5 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -30,6 +30,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-mtools \
     nativesdk-zstd \
     nativesdk-lz4 \
+    nativesdk-libacl \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.33.0


