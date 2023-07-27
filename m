Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0BFEB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 20:19:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.17566.1690489167433317352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 13:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PshseZMb;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bbd2761f1bso11026205ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690489167; x=1691093967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvqABs+MESbuRH9kehrcX7Eroq4YEpydwWjNkj2gtcM=;
        b=PshseZMbl6UwDdGtu2DoZ8A7CDqSwd5uI/yegmKTHVjFwT+AQ1TWbG4yDOQJiZh4Sp
         xqS4VGT2itaypww9fDaLMGb8iSzkMMQvd4GccsyG9rXxVkrBbE+XAidcLqWzDHQTQuat
         f3F65JNz9VcpxdZnBziPLX5/7K+oPQ5y22OGMCCM6uN22wlQYsYgEoRFPDUUIudUp5/2
         25/5ojBv2gKiyjLlvNBpblNxP6Q70i6lHGt0sQYLoPmr16zwgPn5F6Plak/Qj0G5jOA0
         cTgZQfQKl3pmEQPW6pPjdyCW4qjEn6p6Qc113Qq3y89LOrv/hvnM4lW+HpCdI9mC8+vQ
         Dwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690489167; x=1691093967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvqABs+MESbuRH9kehrcX7Eroq4YEpydwWjNkj2gtcM=;
        b=MJK1ILs3AMjvPMO0tF3oHDRNP7qVT+8j4E38F7N2AEiFK2upL/U25pMW0tKz2vm1ZE
         b2+lCx6yUZ1ChgCdgQJVydUJXf6mz4XbzQwYymSJFQlN3HpeZCZUxdQMyEeaM5Km5omA
         sDsLJtxj9t2kCOJGS0K3xUQrr42+L02zR33iTdWMA/wdNXsrE0M/NDg4GjzcYlGDZB61
         OjWyaXVjlrXEcUoWcRwXaVFZx2z141PQskvdRT+46Kzj8JIzgLZ2+3Z+gnA+oo6TVGlC
         iEkBavHtHOYx0vMAQ/CUl6VEV82WVOFB3DQEw4dkEQ0iIt/R4oyAk8+D+SwQm0ZAbiKn
         eHEg==
X-Gm-Message-State: ABy/qLYNvZQvBOP5Wr2BKMcQCsscIyenDU8muASznJcGoDSpnVJBpGOx
	wr/N6MCubxQ4FVvKGrXQPRNzBfknro78OQ==
X-Google-Smtp-Source: APBJJlGiRKwtyezeRgEWmZ6gU4YHM4yIo9F5PHc3gdLn1VLTRu6zkRdwWhYRLowVMuGXQK7dc4FL8Q==
X-Received: by 2002:a17:902:ef94:b0:1b8:8dbd:e1a0 with SMTP id iz20-20020a170902ef9400b001b88dbde1a0mr435706plb.13.1690489166608;
        Thu, 27 Jul 2023 13:19:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::5d37])
        by smtp.gmail.com with ESMTPSA id r11-20020a1709028bcb00b001bb8895848bsm2040221plo.71.2023.07.27.13.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 13:19:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Use bfd linker for KVM_LD as well when ld-is-lld
Date: Thu, 27 Jul 2023 13:19:23 -0700
Message-ID: <20230727201923.738765-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 20:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185003

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20230516.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
index e4ba3c68724..9c9acc6c145 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -48,7 +48,7 @@ LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-l
 # it fails with gold also a bit later when trying to use *-payload.bin
 # http://errors.yoctoproject.org/Errors/Details/663094/
 # work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
-KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.41.0


