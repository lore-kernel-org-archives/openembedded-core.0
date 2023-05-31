Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F057C7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:18 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.2594.1685558949917341681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nKbe5JA0;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6261a1a7454so646106d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558949; x=1688150949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4Xe7CbG3coJJXi2548o4keK4eIHCQHsPKLtK+DV4CU=;
        b=nKbe5JA0X+k2dfnl2V5Me1y567spZypah9Y9q6KTDgrIOdI1CYj8VErQzRu6FbNBz5
         d5bsxBmmv41YFvPri9XJpaP1PBMpxWGQQ/B/TTwZSS/YhAA5cMf3b30kUk93FdZb0xYy
         Rl1M8zpKRtwbDnzZyru5y1JhPptMHcmdowdcaRD0OKv0z2jEAyjHm0qDtUDcUhu8FYGE
         H48Mo6m40PFPb2Y+ZO1i2aiSQzvwnMI3uUA9aT+CW0yr8QdQtX5NwPV2oHdNXmpvcgaD
         ua82i8CpDjKi0QKoG0imXylA2FeWM38N1htL3Df7ctZJiBQDD+R8Mbf9Bmu70RcmiyQH
         c0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558949; x=1688150949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4Xe7CbG3coJJXi2548o4keK4eIHCQHsPKLtK+DV4CU=;
        b=DdmOVj+ITbbBpALVVaAMJUh0gig19PKx9+snQDo8p6sZ8awNGFGKLBfIg7CMsIAC56
         6KnsRK1aLwE7+9fqLwSvMCvBtr2EzYqluoh1szvgw4YQfaa6oB5ny3prR5xnofMMcGJA
         GOWX+iCn4/HWXYhXqBsTWMwbFTX/pfcXG9yRDKU/U7IL1TzWUNSO+dEWOVF0rzyP8ovx
         Pz0gO1BXvIn8zSugriQJ3OesM1EKhFUcb83iFu+0xdPRm0E7ojtarQhSXuw15HOTOvid
         XT2WnefuRAp1OP6kAExiVfzbgMQpP6edukBN/BWbnh7WmuWoFWGJ9H8ChuZwoxZf32Dt
         hB5Q==
X-Gm-Message-State: AC+VfDxHFOqhwYxg5tIZCP2FCVSVQB0+VTEqoDgoPByxYFR6gvAbJLQG
	D5K6GqGnd8RIZOBut4KrpUz+ENnmrYuP+g==
X-Google-Smtp-Source: ACHHUZ7t/EV3X16HSWv+ZaeTBh1LUhjg7qP6eGCuchqK8AyX+We5GgEsdbmpFn7HNG91we2MtNYlpA==
X-Received: by 2002:a05:6214:d4a:b0:626:189e:55b5 with SMTP id 10-20020a0562140d4a00b00626189e55b5mr8111627qvr.43.1685558948911;
        Wed, 31 May 2023 11:49:08 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] kernel: don't force PAHOLE=false
Date: Wed, 31 May 2023 14:48:57 -0400
Message-Id: <7d971c1aa580fb99c2c44ba7d6ae474ac070514b.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182028

From: Bruce Ashfield <bruce.ashfield@gmail.com>

If a specific kernel provider or configuration wants to enable BTF
and pahole analysis, it isn't currently possible due to the explicit
definition to false in the base kernel build arguments.

pahole is now detected by the kernel built itself, so unless
pahole-native is enabled, the result is the same.

If a kernel does require an explicit disable of pahole, it is better
to carry PAHOLE=false in those specific recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 4bce64cf6a..51bc959dee 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -237,7 +237,7 @@ KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
-EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
+EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-- 
2.34.1


