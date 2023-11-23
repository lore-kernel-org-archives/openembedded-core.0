Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0090C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 04:40:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.84965.1700714416673730809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 20:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mKiqLZQB;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ce95f96edcso3688035ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 20:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700714416; x=1701319216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SywiQx2z8nMCQPKRYgo3+PWOQkstEE7SkjfYLyz7O4=;
        b=mKiqLZQBU4weQFsmPSjwc5MKX5nXU0YRlUKsVZhzOr0A7BZtEi9kW6qVaJJCL8PT1Y
         nnvt7g4kCrXtwmkhnjpW1zpP4QPP8wP8kZR/qvJdVhsqv9FeoKbT4PXHj1otUtELKmvg
         RIyWTmiXngmcBC6HaaIqbL/UeErVyhz1NioGaUxh+8cghnBi+8/CRURVrjhakE/x5EW4
         dLMQoy8ePVk5LxB3x4Thi7JEyhK2Yi8bfkdUd5zvHk29jh1J36osn1hwt4TpdgaDpsmh
         3QH6p65B7LIs+DcOiZM0OHG6jhTLCRyKvD3v3DCmLcz5dlvuXqhrpCVdPckUP0IoxyTl
         sUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700714416; x=1701319216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SywiQx2z8nMCQPKRYgo3+PWOQkstEE7SkjfYLyz7O4=;
        b=GBFIyhkz9wSBowiMGiqKTQFnFs83JDWjyH0nSu5tTUNIoSj0uQFCKCj3mBxKazDfpU
         RTDA/tc5670P2Q/e1q8H/r4aEL5mdMewio7G3ra8X/nuzULpUimQlkUtTCn0lboITA1j
         aw9RV5ybkq7swVlAnR7wwa8Mj20l4NkjjwNehyuKPRnaChtC9/9ZLto2L3krtLMAa23x
         7vvilMIbtHnA3kbl8UbYTly/wpBceIXl8iDm2J7P/dXfIWBqfLuWT6v1ADFiEF+h8n01
         AVBkigH5RI2oE6L3mvYiAaAGqjhILv9wnflQxRVHcjmX2Ql3Z/UY/zrHkq2XzjzqjFDf
         wk6g==
X-Gm-Message-State: AOJu0YwchM4QBK5FN7wZ4FBsgjmCP1CIvHOGSQhyWLQWRkENlARZiyBI
	UPydIhXih8wGnW0hoz/9Ub6k6rfKkpoy5Q==
X-Google-Smtp-Source: AGHT+IH1rJDcOPajrGohh0xHGcElIWjUlaIQgXYOaM+DfMqQ9L6kRmc0xD4q4S40WLTtI9g55Bt1kw==
X-Received: by 2002:a17:902:aa8b:b0:1cc:b460:e6cc with SMTP id d11-20020a170902aa8b00b001ccb460e6ccmr3779672plr.12.1700714415564;
        Wed, 22 Nov 2023 20:40:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902c38d00b001c0a414695bsm277050plg.43.2023.11.22.20.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 20:40:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Enable utmp support on musl systems
Date: Wed, 22 Nov 2023 20:40:12 -0800
Message-ID: <20231123044012.3195838-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 04:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191134

runlevel misc applet is enabled when using init feature from busybox
however this applet does not build right now because it depends on utmp
feature and its disabled for musl systems. runlevel is used by
update-rd.d tool during system maintenance e.g. opkg upgrade etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox/musl.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/musl.cfg b/meta/recipes-core/busybox/busybox/musl.cfg
index 6fffc91098b..ba63def1ba8 100644
--- a/meta/recipes-core/busybox/busybox/musl.cfg
+++ b/meta/recipes-core/busybox/busybox/musl.cfg
@@ -7,5 +7,4 @@
 # CONFIG_FEATURE_INETD_RPC is not set
 # CONFIG_SELINUXENABLED is not set
 # CONFIG_FEATURE_MOUNT_NFS is not set
-# CONFIG_FEATURE_UTMP is not set
 
-- 
2.43.0


