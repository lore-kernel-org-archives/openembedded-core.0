Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A2C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 17:37:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.1474.1667497053183411194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 10:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B8YW9894;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v1so3824840wrt.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIKHOJKyexUu6qiibagK/kqfIQypTxzLUyWeEArKzQA=;
        b=B8YW9894l3/On0uYqcUCskyfto1cldalbt2G+fawRnPgWkRQ076LzXh5xFqIhPVxAx
         cNSEACQMqqUhMUZD+sDQMprwn1s1Xr2f9kqTDjgDTfVrCTLVEQ8PbLKRxJgfKIp1YHpE
         hoYKf+hdMCY6KVRByeG+ihjhqdi3jxnKteZJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIKHOJKyexUu6qiibagK/kqfIQypTxzLUyWeEArKzQA=;
        b=qRlk1EbpBh6W6rRDERkVe3yzGIyJ1/u852Al9pC3kz8LAqPiJKRLOdHMIG+agA7D7i
         hDRl10+zdRiJYReBbz4slvtUg5ZiPdbPp+2RcMV3jBqYIbJbOgOevgyv1fvPhe7yrsxs
         uWf0KkqzIJ6agc3EeV1z06EvBFRQrTUhQ/C86hyCB899H2JvPUhJI+y6aLdlTLKNM4Lv
         1L3H1URXkPJy77etI4vWTp+JOAq4Z8KrMF2r0Yjekp8BYlO6GCKOBpB4IJwDYZxHyNfE
         EOzxada/S3k8Lces9gngd++Z5/08Vb2xJ/B8BwRS0GwHVmabFIvIFZ5CpBIxqNDy8blc
         j1xg==
X-Gm-Message-State: ACrzQf0s7U+iODnaVaxfC4TLEW3dTgi4MGQt/nNSq+aDILfUcO9P465a
	bDrB/46xQHOiT0tbu5wkuHJ4IqxOHw7MuA==
X-Google-Smtp-Source: AMsMyM4kagWwq8aZDgmBwqnwwIkzqafYE5KG74xHBDv2GivVsSZ9Z7F74pHz7wqWkv4akWTe4Twkjg==
X-Received: by 2002:a05:6000:1e0b:b0:236:8a6e:8d with SMTP id bj11-20020a0560001e0b00b002368a6e008dmr19434144wrb.20.1667497051015;
        Thu, 03 Nov 2022 10:37:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b003b4ff30e566sm7676901wmq.3.2022.11.03.10.37.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:37:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
Date: Thu,  3 Nov 2022 17:37:29 +0000
Message-Id: <20221103173729.875233-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 17:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172646

Whilst SDE definitely needs to be exported, the fallback does not as
it is only used in our python code via the datastore.

It was introduced as an export in 9a1dde74e794362399193dc3f81c9685a83d0776
but even then it doesn't look like it needed to be, likely just a copy and
paste mistake.

Drop the export.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62cdd9aa9c2..a1f0f624e9c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -676,7 +676,7 @@ export PYTHONHASHSEED = "0"
 export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
-export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
 ##################################################################
-- 
2.34.1


