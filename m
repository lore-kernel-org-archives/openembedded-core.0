Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724D4C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:26:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13318.1721834759884258986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxEIkf2Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266f344091so51270385e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721834757; x=1722439557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXXeRNeEmoq/p3Ku0ko9Jhovzn3sLGnI24diyCyHrsQ=;
        b=NxEIkf2Zq9OaZiLQx1TgdRjg7bJ3fsGJcbQTClCvwmDAEJZnwuaX12KdI0kLscTpBI
         YDqs6GmMtAb4KzW3f8dFZjn/jJ8cQU9k8ME9bC5glBU/qDAkI/iuxmpX5e1YCKD36iJJ
         aIA5Vq4tCvoVZfHFlXqp8SxKKv8K+O/Pgn5fvTM0VYhvb6Op8elVPUNAejp3l5Hos3jE
         uDqADiagvhQDz62Q6QrwooTNKw6R3X/5rFUkuNqBXTez9sZblUBOHP1biMpnAcpHsNqD
         ofsBu05sXOmZoaeoQ3y/l82QUeR4R4zkjM1wTmOEd0DXaxELyTU8rpu2kI7V0jvHaVwJ
         hwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721834757; x=1722439557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXXeRNeEmoq/p3Ku0ko9Jhovzn3sLGnI24diyCyHrsQ=;
        b=OhoM7Jp6n4kBvY4CzUs4XqCZJFYJrGo3UBy7RhjLqKKw9x9C+Dk0rkPzKO9DKTNRJ4
         vslKfFj9BjQRctHnBiVc13auD9kKMor613SbqwoYzcw/KMK+EAQclgfCSvDC0+DLo8uq
         ms9Ca4UoPiwiFfmysJUwE7PtU4SZjBmQeR0/zZTOQM5clyYmCEjhVcicDaPQvuJy7lOp
         8bvHl8dEkKr978HacQHkOQQjLOVph2EXPYQu0c3V/TcdAXKZvaWUGFAzoZVgect+secw
         kSTAK6LCBt9GPyixhCTxNRAo4PGkhHaGP+zRN3f/0WHZ6wdTm60t7AqdGwtsBzSNnFvi
         wyOA==
X-Gm-Message-State: AOJu0YzQDiX1bNKOESZLtUnuWgAUgtHUN7jCtL8uxw7yWxuYTmzx9VtF
	anD4PWoTFxJP7T+d5urb2CT4d9i+8NiozOQudSoFWSPNflK8KUMaUF3Mqw==
X-Google-Smtp-Source: AGHT+IGpVnzl7HNZfYtYv+gqWyu4nBeyBuPbWMPHkNhEqYTr+TI43pIfbMymvyQoRDZJEKWczGzvCQ==
X-Received: by 2002:a05:600c:1ca2:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-427f7a151cdmr22032945e9.2.1721834757231;
        Wed, 24 Jul 2024 08:25:57 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e667bsm33636125e9.29.2024.07.24.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:25:56 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add deprecation notice
Date: Wed, 24 Jul 2024 17:25:30 +0200
Message-ID: <20240724152530.25856-5-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202452

This file contains CVE_STATUS without machine-readable information on which
recipe it applies to. All entries should be verified and, if appropriate,
moved to their corresponding recipes.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index fcef6a14fb..71c5bc31f8 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -1,3 +1,6 @@
+# THIS FILE IS DEPRECATED, DO NOT ADD NEW ENTRIES
+# All entries from this file should migrate to appropriate recipes.
+#
 # This file contains a list of CVE's where resolution has proven to be impractical
 # or there is no reasonable action the Yocto Project can take to resolve the issue.
 # It contains all the information we are aware of about an issue and analysis about
-- 
2.43.0


