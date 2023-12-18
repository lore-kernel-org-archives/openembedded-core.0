Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F4DC46CD2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:24 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.39801.1702889057665910752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEWO9Es+;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2335d81693so217417166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889056; x=1703493856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yl0J49Lf+BNpHDbePEAizGhsMRxX2zjOOsRdhQrKtU=;
        b=PEWO9Es+LQ6mCwk1HtDOFpUU2roZj8X+owUCj93XjkoMFaCqXi0VewG81GxUxpK745
         w/fw1AcyQkykFxTimaF0MK8Ok0fI8cmz/mMhcxdHPbslvo56omLOnXymXmieEdJTiu7r
         bllRvmp9iUJKuV4fBZc/a4wvxRWDalmDGuDKs5EbjzpoPm36q4mW8EjNToiuCjIBWdTc
         llXgcNbznl2/wjpNRQxYxvuNcShCDyhqaQE5l22PX8qF6HxOrsj5yVkrZl9PpEpk1iwf
         Re3oLdIWNxlyAL1r6MUIVoUzy65E1KAK/U6StAIsaixrScePlVgcFRo+xvRUCzO+abbl
         KRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889056; x=1703493856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yl0J49Lf+BNpHDbePEAizGhsMRxX2zjOOsRdhQrKtU=;
        b=o6smxr3U6ofDaRMTpOKAqmkcGsd01O0MRkgD/rhD8Eakx8EDgfAFXEon3HKX3Kl1Z3
         I7PqKbc2u5csIwVEbbM9QIPOEhpkoU3jY6HHv+X1eqT3UhMutq/TLMH8QVoSUFLv8pgJ
         m/PmspyBsMIP2YT3HkKnv6mB9qyrb/NJ9yI3RO/wRytCY4oW/G/w4YMTyLQFngHUXtuc
         J6UU0fFJy6FeCntQbjOgRRfTwjY1HfuIgtN2YH9iIhj3Q1WGf3soRnqa7edWvrUKoSE7
         ovV2aWoOuEkvq5R8BrvBzt2Ulw3ADrVXxHzf9z3TaLwwyzVeDKM4C02KejJazAhZH9ym
         ecyQ==
X-Gm-Message-State: AOJu0YwddG1OlC1spcYUOQC8xaxpijnrbZgODi3CjSRg1QMBKecOTkoP
	Yoptv/NqQA7aNNQ8facdh3s1ahl/P3g=
X-Google-Smtp-Source: AGHT+IHpALCr+oKuc8BsP2qlD4kYCmquLsCUJs2Ym2oXXNpQ10Y0vC93Ivo077yvHQY3tjD/CCbpBg==
X-Received: by 2002:a17:906:225d:b0:a0f:c538:4612 with SMTP id 29-20020a170906225d00b00a0fc5384612mr14270375ejr.28.1702889056001;
        Mon, 18 Dec 2023 00:44:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] bitbake/runqueue: prioritize local stamps over sstate signatures in printdiff
Date: Mon, 18 Dec 2023 09:44:01 +0100
Message-Id: <20231218084403.599015-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218084403.599015-1-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192616

Even with the reworked printdiff code, sstate which is heavily used in parallel
can throw races at the tests: if a new matching, but otherwise unrelated
sstate signature appears between writing out local stamps and listing
matching sstate files, then that signature will be deemed 'the latest'
and the actual local stamp will be discarded. This change ensures
the scenario does not happen.

It also makes use of the reworked find_siginfo(), particularly the 'sstate'
entry in returned results.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 72d2feab27a..0fc26ccdf88 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1788,6 +1788,9 @@ class RunQueue:
             if match is None:
                 bb.fatal("Can't find a task we're supposed to have written out? (hash: %s tid: %s)?" % (h, tid))
             matches = {k : v for k, v in iter(matches.items()) if h not in k}
+            matches_local = {k : v for k, v in iter(matches.items()) if h not in k and not v['sstate']}
+            if matches_local:
+                matches = matches_local
             if matches:
                 latestmatch = matches[sorted(matches.keys(), key=lambda h: matches[h]['time'])[-1]]['path']
                 prevh = __find_sha256__.search(latestmatch).group(0)
-- 
2.39.2


