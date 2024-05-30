Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD67C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:09:25 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.132.1717085355817261581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HP5xFGUO;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-24c9f630e51so536443fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717085354; x=1717690154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dht4exGBESnVyCznPNFtwWTTiAUZwdcKKWOjZcKxV3M=;
        b=HP5xFGUOiz2Zb26gO8qqGCrLcD6bv9f95Qy6S9YWl6dFnbHlitNftVXMuFyiBIHjfE
         glGuN6vO2oihIUu83QZkVNOa4l7gZKb4bEyByJQtthekd4cXOdTPrxkoRwvWUNwnewWy
         K/Vu20BRqSX2aYg1bIll+m314VigIJNbW55gD9lbEmmIwYc5RKs+EH3uC6QNBrk0C0ui
         sAY3m2tWzLwJwkOCunC3wAX4jbZai71aFDcNrKrQmmhFhaTZthhreI5UTVJ0IKUZT0MO
         WrTVm10lUZRlJGrY50ry+GMkdisz1b0BqkNSXng7XhrNWfN8xSPXtsAfot69SNZLez/c
         F7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717085354; x=1717690154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dht4exGBESnVyCznPNFtwWTTiAUZwdcKKWOjZcKxV3M=;
        b=kg/hroNARKvbznMoxvgpUcfXn1ZGFkv19XBDXJnUQ1ADKcirnpMi+0VOmPjiEVnoSA
         bmFHQZxqo8A7CmRgK7enKQ+U6zNSRx2ATD4GlHoukUPeeWTXTFvG3ID9NvH4zZZLGpPF
         GEuT1bMV/T+L4taFmO7a2/61z3GWvLxZIcKP2p8suTL7JFgHCX/x7V1M8YmfqHs8hwoI
         0zKK1Bg34+7VussXxTNAJ7cshBxNMzb43r17VxaBtaW4Zd7ciKGy/0n7q72O0xBjC71y
         znp2nnh1nwrSLJkrEafi+SAFdy+ZoZ7ImosF+76i4bCgFTV+Xj4hhKudXOkyBudGclcX
         oHLw==
X-Gm-Message-State: AOJu0YyM+tbqZJkC0u/1oOMMlU1iRHUBtKZ/f/F0/aiUGzftG03W7c8j
	Q9DxdHJmIzp5AlEtrJB6a4kA0ksBJpFug9Ol83SZ26ikBn10MYqcRUz2Zw==
X-Google-Smtp-Source: AGHT+IGpNV3oT5iwaaDOSsc5QE3/EukKkN1LCe9WUsM9LsC/uYeob3OLYiFyKVoexlcIHtLagnQ2+g==
X-Received: by 2002:a05:6870:2187:b0:250:725f:ed50 with SMTP id 586e51a60fabf-250725ffb63mr1878353fac.17.1717085354203;
        Thu, 30 May 2024 09:09:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::e759])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25028ce5f1asm1357591fac.28.2024.05.30.09.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:09:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Drop BB_HASHSERVE_MAX_PARALLEL
Date: Thu, 30 May 2024 10:09:10 -0600
Message-ID: <20240530160910.797813-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200028

Drops support for this variable since bitbake no longer supports
parallel queries to the hash equivalence server

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index a46e5502ab3..db3c409216f 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -327,7 +327,6 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
-        self.max_parallel = int(data.getVar('BB_HASHSERVE_MAX_PARALLEL') or 1)
         self.username = data.getVar("BB_HASHSERVE_USERNAME")
         self.password = data.getVar("BB_HASHSERVE_PASSWORD")
         if not self.username or not self.password:
-- 
2.43.2


