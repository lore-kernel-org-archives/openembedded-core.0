Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC0ECD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 12:55:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90386.1781355350853147638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 05:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PAhQVL4V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef616daf6so1991720f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781355349; x=1781960149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6ep5Rwccm93ARzDa9gSQ2w9ftbLYDkQZtMY1G7aqUA=;
        b=PAhQVL4Voy6iqZL+NcWoAeLfZOnh7OGhDUd9sCkIBXufdfakpvEGYd45JZriQF9fpq
         4JFRorKQvPM44o/6vCU8uSoYfb8GpqotnG3U4zrlBVryyuoVNfMS/c/9tou3cpc2r7OG
         D5tndz5rfmKKMMNMqFy0iMfitqER1RGYxFHuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781355349; x=1781960149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6ep5Rwccm93ARzDa9gSQ2w9ftbLYDkQZtMY1G7aqUA=;
        b=OX1FxO5eEN60p7wnGAvJL+P+yMn8itSyOwcOLKDvVdp46V8IQziK9YI/n58zFOFHM0
         SMPVc/M3AU9hf4bWBd9ncqoBq01uBOCcko/0gXYzWvzgxpYNQTD5zsJqCwzBZOfutjDL
         CCsEGMMVX6BKxpF544FCYJGnhfRE3JFSEPixonXl1fzPJ90bfhvOnWlcPsQgBTQRtwy/
         E61r9iRQUF8pRRkw8BXN/oSzWhnp1hJRaNqZ3JmfMYqqUyTv1MmhJqhbqQlaG5MaEp3l
         i5nEfpjwiVLpW8+3lvJHT5PUBud8zJOrFszESPEguCCFSvT3DNUeZ9NbvhdmgDpyIq/+
         eiaQ==
X-Gm-Message-State: AOJu0YwlVgC2DHyxex/cZ26XfBlyosZImW8Boelh6Tu/9B6PObK/khT/
	TvllyQ8W/052M6J5nq89FM3XCp8Z+2kTmIYITlY3Kq+PwnBVcYtMWWIuUzXfI6ifimLoT3lSTYd
	0XRIi
X-Gm-Gg: Acq92OHLr3Cp2tI9TffREy8GkjRNHL+w46+UE3A6B1T7ab73otnksRZcwnXyd3RaKzK
	EH01I82JAEXqZZqNOzgocDkPuisxBGmX3h0jn8S8sy7Vnh3JP2Rc4fJlR3S02JGUrTijaNwDF8G
	Yk5u6m2WY/3vmhUEonFgja2Oob7IZqIalQ/bY4azi5D0H34Tp5gyHmAm/7vDTNzp64G5A62pafR
	FcWDlIa03uV33Kmtq8/EMFeX0G3mFos0w/JtfTiq8CZ7TMaJXJG9Ls4BpIIgq9UgDtjptRfSWH3
	+0jCS+UeO6uzQEAQYvOy0T/jalmIrtzPRUbq2DToERGKPcTvv6x4fN+AQGEmnDg6y64Cwac0jjs
	9tMtmAbLlVFj9ke+UOB6oxFe3+Vl4SyEd46Jo8pD61ztCSXJWBu+k+bLoD78lyXA9UT3ui/P1+J
	0sh8Y2Nxs5lR3qw5Ls5UkTbEZy24X69P1R7XQOYekvlWoY4CAKbID6
X-Received: by 2002:a05:6000:438a:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-4606dbad46dmr9824325f8f.25.1781355348853;
        Sat, 13 Jun 2026 05:55:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4437:5798:e78b:2888])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm15571002f8f.20.2026.06.13.05.55.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:55:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/maturin: Update dependency version
Date: Sat, 13 Jun 2026 13:55:46 +0100
Message-ID: <20260613125547.3358714-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 12:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238679

There are security issues in earlier versions of pyo3, update the minimum version
to avoid security warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
index 5c0c06db4bc..0bf83bb6c43 100644
--- a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
+++ b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
@@ -14,7 +14,7 @@ crate-type = ["cdylib"]
 rand = "0.9.0"
 
 [dependencies.pyo3]
-version = "0.27.2"
+version = "0.29.0"
 # "abi3-py39" tells pyo3 (and maturin) to build using the stable ABI with minimum Python version 3.9
 features = ["abi3-py39"]
 

