Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B4CC25B7A
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 12:50:55 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.18802.1716295850484351713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 05:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWZMhoGi;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so858355566b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716295849; x=1716900649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDeRDH3BNgDINckt8pMwz02gLXShgQkUFfOys5ubdww=;
        b=JWZMhoGieiEkGA3GO0iXgo32FzxLSqvYcsMieGS+Sz32JqUU+0qsqzEBj24/Te8hEs
         H2mdEdWtgWwMMBEogSMNZoqO9wRsnidUUmwpRklGjrnKV5LIHN+ysR6LXJfVcW6AuG2Y
         QW2i8Q6WvCDYxUQ6tzw7WopJSKhd6fH2SVzUswplmFWSIY9xac4QwoOOH8Ct0C0nSYvT
         zSuUmDHOAdvdqR1EFG3cqAN2QN2ijnKf1HLuTLfNHHBmYxhuX2Ix8ultAFsXpyEk4fBM
         BwN24933jil30xEEoQuSFACWsP4ug6AyN4o3U3lCuRR4mf07OHPd2Yy9gyNQ1od0HvfB
         SduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716295849; x=1716900649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDeRDH3BNgDINckt8pMwz02gLXShgQkUFfOys5ubdww=;
        b=uJcVCNk3OSVhtC+R62jk1grOLlQ9xu9onYLJXla30GFAuxGyK5DR2jUT/m0zdTckLR
         8LouhvePF74WkklQzex1pETPV4HAlwB7w1X3JXH6I/Syq8fVxTNKXJ/hvJV0bALpzj4w
         rX/6+8/5oAQnmHoCdNWrHo1JTBd12vi1QTcHrXdlHgZeMqlKsN4WhHyeBdOCxkYnTxrK
         RLw2qxq1IpdFkDVATP8BeuN/BGukhluma+mVt6mC8uTGuuLZx72xeJ/bdU7bHFqR+Vbw
         TDya2zaM3nEWMh1rS+W/P7OqgIg+wlwbj0UqtbE/Un+pMldUFE+k7tX3fxac5e3SjLHc
         oDmg==
X-Gm-Message-State: AOJu0YwcDh+8PomIE7C0Vna85AkZ6gRr/zMEFa5jnCsEzNpRAR07jFqa
	My4NG59KvzCEy/TWuTR6w1wqc9xnAsquQIGSLwvDe/TZRSNP3gL9jNYLDQ==
X-Google-Smtp-Source: AGHT+IFVDpZEEZrCaVKRkbHx4YRO0dj8t9LhqD2SbaBbPBOKUzOcxcUqiLQskIPlUpHvatd6oVfKTQ==
X-Received: by 2002:a17:906:9e06:b0:a62:1b4f:6018 with SMTP id a640c23a62f3a-a621b4f60fcmr14733466b.54.1716295848678;
        Tue, 21 May 2024 05:50:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d294sm1595584166b.28.2024.05.21.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:50:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 5/5] selftest/rust: correctly form the PATH environment variable
Date: Tue, 21 May 2024 14:50:41 +0200
Message-Id: <20240521125041.3611820-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521125041.3611820-1-alex.kanavin@gmail.com>
References: <20240521125041.3611820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199636

From: Alexander Kanavin <alex@linutronix.de>

There were two issues here:

- the path to native python was not included, so the test
suite was running with host python, causing failures due to
host python being given native libraries:
https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/1711/steps/12/logs/stdio
(rust recipe uses native python throughout)

- tmp/hosttools was listead ahead of native-sysroot/usr/bin

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/rust.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ad14189c6df..4ccbe9867b5 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -210,9 +210,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             tmpdir = get_bb_var("TMPDIR", "rust")
 
             # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
-            cmd = " export PATH=%s/recipe-sysroot-native/usr/bin:$PATH;" % rustlibpath
-            cmd = cmd + " export TARGET_VENDOR=\"-poky\";"
-            cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
+            cmd = "export TARGET_VENDOR=\"-poky\";"
+            cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/python3-native:%s/recipe-sysroot-native/usr/bin:%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, rustlibpath, rustlibpath, tcpath, tmpdir)
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
-- 
2.39.2


