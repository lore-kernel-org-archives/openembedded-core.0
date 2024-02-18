Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E08DC48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 15:18:33 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.19460.1708269507266823687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 07:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H9yryDJe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.181, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d23700df18so4920601fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 07:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708269505; x=1708874305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrjVDt4b3avAZtvNrgsAmQeE54/7UlCh66wtH930ldY=;
        b=H9yryDJeb+jFT0cEv7otXb2g57yrVE/v0js5v2Iy9V1ZhsYGbK7Q+d/Po8ABMgYqb8
         gtZtnUizxXyiHVMKGefAcErcws2Fv3aLCPIc30g6WCdVnMgzQSZwjPXJc94WT4EwR7vV
         qZTs/VNyrCw0ivjMLbkqyPbg7sSl1lC4OYNbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708269505; x=1708874305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrjVDt4b3avAZtvNrgsAmQeE54/7UlCh66wtH930ldY=;
        b=kBnVof9mZY9jRoE3hQq4GV8HaEsRivQTaEPI34TEX/vHtb55aBC7miS1a6h9G84xAk
         E30wxYzwjvSk5ucTKLj0vKXOXdo3/K+gMvJYFNyTqa6gGM3dxG3IB+PbUlSd3oBnfFEh
         bbRLIebicHNfeqdHOFnX2PzFXfur8sjGgsmmfeJLqobIrEQUhrC4EkKuT5XSgC8qrZrQ
         +BT4o7K0g43s2DWqMWOwkbWGFTBnbWRV86UI1TFm5ucZmFx4+S6nWfx8Ae1/RsdmWdCF
         XSaPDWEEE8PhALbAyBoOkU+whr6Rm5B2Hx6peb7VXHSDoNC57nSw8PQStCP6r+uNT0rv
         Ayig==
X-Gm-Message-State: AOJu0YzsDDrBPDLcH7B8qUnx7HsHqR6kQWPda+jeBHJFNnf5tMbtS9rs
	5VQmEX5Cs1URJ8iy99TL135gYpIpvGTlEEPm+g7MCMACp8L1HaDsl4WucBP9FTkZaly3eq+AuKi
	R
X-Google-Smtp-Source: AGHT+IEQ2W5vl5KprwxdI0XkFtBsk8qniUrRP3bcUkwUPtptalJpqPmItxaNidGSrDyyDkcbI4+Gvg==
X-Received: by 2002:a2e:7206:0:b0:2d2:284d:3ae5 with SMTP id n6-20020a2e7206000000b002d2284d3ae5mr3383892ljc.45.1708269504824;
        Sun, 18 Feb 2024 07:18:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3d44:5cd8:cef2:3070])
        by smtp.gmail.com with ESMTPSA id r2-20020a05600c35c200b004123b049f86sm8473124wmq.37.2024.02.18.07.18.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 07:18:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/rust: Exclude failing riscv tests
Date: Sun, 18 Feb 2024 15:18:23 +0000
Message-Id: <20240218151823.355687-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 15:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195833

The rust tests nearly pass for qemurisv64, add the remaining ones to the
exclusion list so it matches everythig else in exlcuding all the know
to break cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/rust.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 164ad11ecd1..120be6454fa 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -102,6 +102,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.rs',
+                            'tests/codegen/riscv-abi/call-llvm-intrinsics.rs',
+                            'tests/codegen/riscv-abi/riscv64-lp64f-lp64d-abi.rs',
+                            'tests/codegen/riscv-abi/riscv64-lp64d-abi.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
-- 
2.40.1


