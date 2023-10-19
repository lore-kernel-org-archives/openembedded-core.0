Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9D3CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 04:11:57 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.20314.1697688709668409629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 21:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FDOgpQUZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c9b70b9656so49355545ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 21:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697688709; x=1698293509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfOZSz7uh+hTqxIVtwTTALxHPJJ9DUBZ24sL7wq4Nhw=;
        b=FDOgpQUZDX2/kknfRLPmUMpDhZAOQFZ1Mb6fA8paAvqm8NxWS28so+XEwGPlSvXJyJ
         wQODObMiTmBAByqP3eSbqvHrxdZxzPcR/vsDDmNd3GclSGjO/cHtPM9BxI78mrpKQNpq
         urEs66pbcbUSWykUF9KKRS7RYoHQhXqfywEyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697688709; x=1698293509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfOZSz7uh+hTqxIVtwTTALxHPJJ9DUBZ24sL7wq4Nhw=;
        b=crZqt3VxscwxtoIHbZpc7sabd0HIJObz0VSeAiD9i8XWTWE4RyaluTd+B1/1VQf3kY
         m9ZqfodFPd99bTyAhwEpz66QYCZcBE79Lo6aGlG5Va4DCtnwHui6Qm4Sf25hA8YznwrW
         AtGVlW1eznsHdASBNNTg2O5j+2Fai2jSTIATbqhgvRoLkRdKuObU3ZPQd/tx6RYhgB//
         qwf/za3T16Ge264xWm4GJM4Qd44NyrcW8SXwU+N6sWK/F8gWWAT1SUNLrOF8N6w30Fz7
         DuLTuTGid5/nWyjeUZ9tmN8v/jiDs1lvjrzviZJDy8R4ASuYZJgJ0pro459NA48jiMHE
         jdlw==
X-Gm-Message-State: AOJu0YwB6ghA6ELR+JytELzg7Lf4HpbNRxaamU53bNpcNQJaZVs2op/c
	SoLDTk+xcQeoG26TG8LZYaw7I6a/v+wRdSC9ZoM=
X-Google-Smtp-Source: AGHT+IHv1+QmGRd5tXgBEivLerGsywqE66jcZgm6vUe2PK3xUvohMES25atJad4y8ff+3YLT0Q0wHw==
X-Received: by 2002:a17:902:face:b0:1ca:abe:a085 with SMTP id ld14-20020a170902face00b001ca0abea085mr922535plb.69.1697688708614;
        Wed, 18 Oct 2023 21:11:48 -0700 (PDT)
Received: from localhost.localdomain ([157.32.47.210])
        by smtp.gmail.com with ESMTPSA id y1-20020a170902ed4100b001c0ce518e98sm732178plb.224.2023.10.18.21.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 21:11:48 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Thu, 19 Oct 2023 09:41:37 +0530
Message-Id: <20231019041137.4943-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189424

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5535.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5e06866692..58025828f2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2009"
-SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
+PV .= ".2048"
+SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


