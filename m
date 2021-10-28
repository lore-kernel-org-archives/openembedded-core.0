Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08580C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 23:26:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.1794.1635463565602555811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 16:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RqevztZL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id m22so13063348wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQIFf5WGXMdr2QTKH/y7fO6TbAIEPBhMm/zKpx+RhPc=;
        b=RqevztZLWxktll4i/c8ozSxowqDhCazMoTvmxPtBE+iSaJif1R8owKt+Rh0Bqr0xbj
         aMi4DXLubg4jTjRiQnmDYiHW1X3/PfFiCNYQ9iy/qYc1nBOoT5DvTKUOc0CLmYAtdTTE
         nQmpFml0SfOpsEST9F1wQWZUpp3OM+B9TuJUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQIFf5WGXMdr2QTKH/y7fO6TbAIEPBhMm/zKpx+RhPc=;
        b=OEHTS93An9K9Aa+wbLz2VNWtVepqLf6zdGnvW6EbmWSX65Kwt4XFR5vMabU4M6hEti
         EnRZ9k3I/TUDPsKtJLmHHk/69EydGdsgrLVLfj8PhV8eZ1qsARekwkpYElgnTsjsak/N
         EguCybkXT3X+DVD5m246opa0npmrPOyaGHkYt9JIfzv/tVlpM8t4nYdzjPOP/vib2ynX
         tpuwO18IUEc/UfQs2BKOLX6kEBa0qZ5TeKiqhz4pqeQOgQXg1CStAbLUEfD2NnYfu2Oq
         u84xYI4ycG/ou5xohNc40CHnzJUtFQSv+ZE3ju0lyj96SuP5cYLQdYyyvpe/i+6PjnVy
         kzWA==
X-Gm-Message-State: AOAM531CBv2ubftcRkVvJBrWzBfXXulzRFZI90gXPsQJzqPAfCscOINq
	pVeU/IzuNG15V6nwp/GW3ctVWsvLEyggpg==
X-Google-Smtp-Source: 
 ABdhPJxaTbkRwAREPA2UOVuqGv+1DHVFoc18Bj0XtYmc1lA2nPoD1HZdstsNyj9zQyU+dBfyI6Fahw==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr9282934wrg.339.1635463563639;
        Thu, 28 Oct 2021 16:26:03 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 d8sm4271440wrv.80.2021.10.28.16.26.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 16:26:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] archiver: Default to xz compresison instead of gz
Date: Fri, 29 Oct 2021 00:26:01 +0100
Message-Id: <20211028232602.3402356-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 23:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157616

We should default to xz or zstd instead of gz, pick xz for now as it is more tested.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 411d459ed02..549f3311e4c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -51,7 +51,7 @@ ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
 ARCHIVER_MODE[dumpdata] ?= "0"
 ARCHIVER_MODE[recipe] ?= "0"
 ARCHIVER_MODE[mirror] ?= "split"
-ARCHIVER_MODE[compression] ?= "gz"
+ARCHIVER_MODE[compression] ?= "xz"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
-- 
2.32.0


