Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467BEC54E55
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:30:47 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.4489.1709145042194907560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 10:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIKRpYXY;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d28051376eso483831fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 10:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145040; x=1709749840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU0pW8Wpp4LjRTD4CLOOSE2bnKFMFZrAJCKPBJZDC4s=;
        b=OIKRpYXYweqiDdrYu9JqZaX81t8C2Jm0nYV3G/40ZUkDHU+IYydPzWP5U6BWUED7bw
         7wdygj1ooRKnypf/AaCpl5GslVQX/zzp0Zax0oFrKELA7yQ4kd38rODW8Ni/yMYZjBG+
         7jHhuP+bbZ0/qUscUheugy/fY+ECvs5pCg8yzBUiWqa/NaZds+78CxPprS4xeIDVy8MN
         76sfVetd4ZYRTMbB/hL8kM7iuMvwqHoBcrvo/lfhaZNiwwTei/OGIBEF0kBynaP8aoqR
         fgpIa13BUsC+Zt7IW0UthhqCpfbAYjMiYz04gbChx/dlgpL80JqcRfuxY9I//ELbjykr
         htqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145040; x=1709749840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU0pW8Wpp4LjRTD4CLOOSE2bnKFMFZrAJCKPBJZDC4s=;
        b=a4OazXXZ6MNXC+wiDXCF308dvGecweK6pODdCf3qp7xdE6x4h5DgGVtLI5WLj3OJIf
         pJpSI0BVNjX+5IZT/NspLLIcS+lMvabJuMSMJcefUkxhhoqk3SLCzwTagoLYWRxBB4Pi
         SXQzHlgsG9U7DrW5I5KZ+atdEb4G9qPjjRgI27nlR+K6XCpZuJ2yyjyXkJH1/ph+7Lg6
         8tIrt9R0UbtflfGVH0X4aYSaMhnfcPxPlMlx2bKYP2xhjZx/G+GWGfaURJJjiBZiLyu6
         opG7GOHI42S9Xu/62WDFf0BluY+znsl/LqoaRCZMw2NSdCH+tC0v8OFyR/6pp6ddz1v6
         82Ag==
X-Gm-Message-State: AOJu0YzK3RVpwcFkdfZ1SkeceV1h8Yj6zPSFQ1eLekowQSIEmrwlmV5c
	SdAH5Wxpx0faqssBGUSJ2bQwJGMhl3vBy9Y6ebqK9Aj0szqB7T3fa25BF8Zl
X-Google-Smtp-Source: AGHT+IF3ZG2I5PszqkXulKJ2f5U61zFcplYmfkB0rkBqtthTDKYdVYXK5sH+UV9t6oALS9DyKE0/2A==
X-Received: by 2002:a2e:a0d7:0:b0:2d2:9f41:2fc4 with SMTP id f23-20020a2ea0d7000000b002d29f412fc4mr3470609ljm.27.1709145039693;
        Wed, 28 Feb 2024 10:30:39 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056000061500b0033e033898c5sm2005454wrb.20.2024.02.28.10.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:30:39 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH v2 4/7] oeqa/gotoolchain: set GOPROXY
Date: Wed, 28 Feb 2024 18:30:08 +0000
Message-ID: <20240228183011.1495807-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228183011.1495807-1-jose.quaresma@foundries.io>
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196403

Since go-1.21 GOPROXY needs to be set explicitly, otherwise it fails with:
- GOPROXY list is not the empty string, but contains no entries

This fixes the selftest

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 74c1c48117..ee2cf4b09a 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -54,6 +54,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         cmd = cmd + "export GOPATH=%s; " % self.go_path
         cmd = cmd + "export GOFLAGS=-modcacherw; "
         cmd = cmd + "export CGO_ENABLED=1; "
+        cmd = cmd + "export GOPROXY=https://proxy.golang.org,direct; "
         cmd = cmd + "${CROSS_COMPILE}go %s" % gocmd
         return runCmd(cmd).status
 
-- 
2.44.0


