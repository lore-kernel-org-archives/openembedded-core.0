Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D200CD44D7B
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.63119.1730946564054964564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BZyLJY2R;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b18da94ba9so50121885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946563; x=1731551363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3JwvaXD0RZeACIuLWWm+NunvZy6ijDmpNN6rDMIVIg=;
        b=BZyLJY2RjViPJ03QYC2ig1/Vuxb4dvHV5EVUVBFmA1ciiOW/EvHD0vzX1m3bgPr+0f
         s6iTbWU4hNO+PsHgsNhVMWHqXx152/9HseJyCZVIu3gxpWr0GfzyQTxS7gZLBBwYxyRQ
         qR1KziBZcAfnJin0aGyDKQddvkfB3iMke0o1pPrL5oKr4/ZMvKj7pfHQFCKS4305Ujgz
         s8leBzcIOzyG1ANo0UQFoFu+v9G9bzR7+gmV5gRit9WbDLNFe6nRnutnjFPoqelK8Qgd
         JRv21FoHqMCMebW9PVz6kZlcdxkLUgjZTV5COuKj62bITGwBSgEjY1Y+ws1Aea252U+m
         zI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946563; x=1731551363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3JwvaXD0RZeACIuLWWm+NunvZy6ijDmpNN6rDMIVIg=;
        b=mCAS6gHXBFbQpnNCK04lbyXBme3LgEveHOaz3zd+HKyNYr6lK0pWgu3yi/YPxUFklN
         qIlS3tjsvXB6XNbqKJIxbFvXLA/ORDvxCKzwGOwy9vZiUlmVQiW+imc3PA14TacmeGqR
         0gs6ZG7YE6j/dKuD1D3DCrpxseWOCTDCFBD3XrUrTLyKVU4ZB+1eGzygtKbLnQjwukOr
         PPSchvw/l4PG59b0RHlebUlGJ6K0ENOoCwSVGbBl5PcwbYY4zGD7f5hCs1xjkP0i20ra
         BlgGrJXG80RUC+uG0sTpUnICm2fJh9bgiQvRaWo8YuxuBk6Eqzan81rhkQLC1Y+nFdFI
         ZTiA==
X-Gm-Message-State: AOJu0YztqnXpCGEgNWZYW2MYABubMdanZ6UrOHpukNC/3iUkQJ7viiCz
	hdefGmOYdYnQioaS7pDASmttTdnMrs2JVslRlhpTR5slMYEb6g5b
X-Google-Smtp-Source: AGHT+IGjqKG+KWhtfl7h1X6oechRpZgpjYfxQvsDWYmlhPQZAEBl1+0vkyarvWIE5Wb2/GWoSTArrg==
X-Received: by 2002:a05:620a:19a7:b0:7ac:bc66:5efb with SMTP id af79cd13be357-7b32769cd87mr258967185a.27.1730946562927;
        Wed, 06 Nov 2024 18:29:22 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] kern-tools: allow .config to be recognized as a fragment
Date: Wed,  6 Nov 2024 21:29:07 -0500
Message-Id: <6469144a7c9eaabbb4ebb99f7960799c76e2f283.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206806

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

   Author: Paul Barker <paul@pbarker.dev>
   Date:   Wed Oct 2 10:01:29 2024 +0000

       spp: Allow .config extension for config fragments

       The config fragments present in the upstream Linux kernel use the
       .config extension, for example arch/riscv/configs/32-bit.config or
       kernel/configs/hardening.config.

       To allow these to be easily used without having to copy or rename them,
       extend spp to support both .cfg and .config file extensions.

       Signed-off-by: Paul Barker <paul@pbarker.dev>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8eff00821a..98dd89f585 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "7160ebe8b865dd6028aef278efa219433db93f7e"
+SRCREV = "cda23df1a86aa89cf1748af6aa5134160c1cca48"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


