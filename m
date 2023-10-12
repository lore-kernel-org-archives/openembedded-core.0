Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EC1CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 15:16:32 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.14695.1697123783692409083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 08:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DPV/qHRe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-775751c35d4so69093385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697123782; x=1697728582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qh1Ib9YFvIFSpKtnaw5Stq1lqdYc8ARVCkaDAhK9EXk=;
        b=DPV/qHRe1cyqwM2329TOYwQW51c8pCr7Qin1mtZQpLPLX0LP9k9i78QmdLbdEkxOu0
         qscBh2qanwe6emBrinOLAofzKvWCEiuMRPtjEKbJGleFlfPtkJCXbKCO5Jg+hXyKkOfg
         jhdgKbJY4V1ENmCMZJXEEwZPfcyVmPKXrwQe4fxmhjKu45u8nAcK7QbIkyzMqv2K60vF
         BChxN6xRHs2hYQxGN0YN92juELqbgW7sYTo7JYzEjPYh/rs2ezlAl3Jh8I8fNrInoUgb
         unZpJQIay0yT5qzqThiEs7DM8+pLUbre+JtTny88WcR6BMzuG2oxlYVajAkfYMI3Hewl
         L5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123782; x=1697728582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qh1Ib9YFvIFSpKtnaw5Stq1lqdYc8ARVCkaDAhK9EXk=;
        b=E9PYzOXoK0OE8hdROOj0Dgj6+ZWdRNOSZ6daXO8GTyhdsHKjiFiJ6bzaxcnucDXzMn
         +MMm9cNQ1GiX2RlCNgNfspjMQ839u91S93psBzhbVPf5W2yHODMC7zpKOygw2idEg6EM
         UGQFjQUFXVfqp951S78IbalNuCku6QcsGqBLgnRLs4mkO3vA3qm5IsFQ5byQ6fgFIuzi
         saio/tUEC8+qfZmAkJojhtNbIEMNWsfz3Gxb4IOHAtGJCy5+Nf6ZAEM30uHS/u5ld3xc
         8GzekwCpULF/pg1vE5neP42F4e6kLK6CfG3nZu+JbTGOfMFbczlayyhlEbA43aC++l7f
         nkmQ==
X-Gm-Message-State: AOJu0Yx+Z8QQ8qvcnoMFlyinJiixSpjVIeXQIywAa2iDgHwwKo/hfgLr
	wxo8VsvuybdqiY7k3G3llBxD5vPVupCVoBMKPM8=
X-Google-Smtp-Source: AGHT+IH8KyhUTPxJPwLkzAvLuQ799TiGT3rU8CNnOWpS/84F85e2HPuForSvQdnCEb8LNCrvFIelnw==
X-Received: by 2002:a05:620a:298e:b0:774:33ce:cfb6 with SMTP id r14-20020a05620a298e00b0077433cecfb6mr33955876qkp.30.1697123782218;
        Thu, 12 Oct 2023 08:16:22 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r4-20020a05620a03c400b0076ef004f659sm6121419qkm.1.2023.10.12.08.16.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 08:16:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: drop unreferenced patch
Date: Thu, 12 Oct 2023 11:16:16 -0400
Message-Id: <20231012151616.3900750-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 15:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189006

OE Commit a7176c3b2a7e2041b9be5dabb6b0f1e62f235f76 removed the reference
to this patch but did not remove the patch

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 ...w-nvme-fix-null-pointer-access-in-di.patch | 39 -------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch
deleted file mode 100644
index 731b0281f432..000000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 83dd3da9fac872fac9739b9dcb96232c93675824 Mon Sep 17 00:00:00 2001
-From: Klaus Jensen <k.jensen@samsung.com>
-Date: Tue, 8 Aug 2023 17:16:13 +0200
-Subject: [PATCH] CVE-2023-40360 hw/nvme: fix null pointer access in directive
- receive
-
-nvme_directive_receive() does not check if an endurance group has been
-configured (set) prior to testing if flexible data placement is enabled
-or not.
-
-Fix this.
-
-CVE: CVE-2023-40360
-Upstream-Status: Backport [https://gitlab.com/birkelund/qemu/-/commit/6c8f8456cb0b239812dee5211881426496da7b98]
-Cc: qemu-stable@nongnu.org
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1815
-Fixes: 73064edfb864 ("hw/nvme: flexible data placement emulation")
-Reviewed-by: Jesper Wendel Devantier <j.devantier@samsung.com>
-Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
----
- hw/nvme/ctrl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
-index 2097fb131..36a2846c3 100644
---- a/hw/nvme/ctrl.c
-+++ b/hw/nvme/ctrl.c
-@@ -6862,7 +6862,7 @@ static uint16_t nvme_directive_receive(NvmeCtrl *n, NvmeRequest *req)
-     case NVME_DIRECTIVE_IDENTIFY:
-         switch (doper) {
-         case NVME_DIRECTIVE_RETURN_PARAMS:
--            if (ns->endgrp->fdp.enabled) {
-+            if (ns->endgrp && ns->endgrp->fdp.enabled) {
-                 id.supported |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
-                 id.enabled |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
-                 id.persistent |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
--- 
-2.42.0
-
-- 
2.30.2


