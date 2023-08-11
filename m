Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4D0C04A94
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 08:30:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.38450.1691742636503603021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 01:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WNf+W9kO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1577122f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691742634; x=1692347434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YY3PHqk0I6Y88Gy7/k504Vc4edDltqtDIN05IK89+wo=;
        b=WNf+W9kOjAfwksRTgphU5BxuaBVGRwXWbIsAR7aanao2O17ZhKZG85cB+HNjrLEbdK
         PLJfhPRLvnS+mPdmDLSiUD95Ojpkdzp+eaA4//GJc6mq0H0aS2Xz7n6Ryc3XPNgGOaUP
         Xj2rAiJhu78It3Qt3Z4FYTQDNBt2UALYWBIoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691742634; x=1692347434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YY3PHqk0I6Y88Gy7/k504Vc4edDltqtDIN05IK89+wo=;
        b=GPnxY7ppKPbQgjOUHc9zCFz5J9vtLpoUiUGhGiAbKUnuL93ugepURVkiav0g0ZwTsY
         UXX2nPZ0UI371moduI7R38ykJFFU/H0c0kRSAnT5m5IqviBKdC3W1744SVxoLNEfyn6+
         X64xLePlA8vLV+/y3UmR3tIaTv5iay3fxV05WJEMl7Ve4JNOlNFbHsaeu/DrOsme9nhU
         Acroz6Um/EIJf5IkHWJnBzvfW8A+wQEdttgjoLmx1IBNz7UjK9k4o0L5yfIjrNu8GTop
         Sj+vLaU89gWYCd+pD6lBW/omXL2+7kpQHR8TJZxfuGJwKnR8X7xw9MeP6LHI7NZ5aCvz
         deWQ==
X-Gm-Message-State: AOJu0YzjEWE6hDU2TBD9RSwf7LSl4qT+zwl03SN2dUeWABDo2wg22NXY
	3nmtzHSQ0xLwlfM99tEFcr5MFj4ae7tswAbWpB8=
X-Google-Smtp-Source: AGHT+IGgyfrobqkg+YkguYoF++z8LTGwevm6M5u2zC45wUavHcv6gtyCbJJAzmlNjJmB7YT/MLsAxA==
X-Received: by 2002:a5d:5443:0:b0:313:ebf3:f817 with SMTP id w3-20020a5d5443000000b00313ebf3f817mr980054wrv.22.1691742634239;
        Fri, 11 Aug 2023 01:30:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d444d000000b00317f29ad113sm4638547wrr.32.2023.08.11.01.30.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 01:30:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemuboot: Update hardcoded path to match new layout
Date: Fri, 11 Aug 2023 09:30:33 +0100
Message-Id: <20230811083033.9243-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 08:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185832

Obviously this code is horrible and shouldn't hardcode it. Update it to match
the WORKDIR change to drop PE/PR for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 12d0a509f13..e30b380c3dc 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -143,7 +143,7 @@ python do_write_qemuboot_conf() {
         # contains all tools required by runqemu
         if k == 'STAGING_BINDIR_NATIVE':
             val = os.path.join(d.getVar('BASE_WORKDIR'), d.getVar('BUILD_SYS'),
-                               'qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/')
+                               'qemu-helper-native/1.0/recipe-sysroot-native/usr/bin/')
         else:
             val = d.getVar(k)
         if val is None:
-- 
2.39.2


