Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1BAC46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.39802.1702889058288771178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0S2fn0f;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54c5d041c23so3039260a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889057; x=1703493857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ko7dfscRWyOYsoLBA2bq9GBOUV048i1Gtasxg3jLXw=;
        b=Z0S2fn0fq06lqNN3Dlrj9f7SQ53q8CCX/QMp66JGXeiNtzlrOzrKY++irSK3vp3KML
         wNMnQVV0gFckngzacFwnDp5SU0acX+1ZpZKt+SQzG9NsmukXhdeRSIpNSdIstkXAgupy
         jDtecfYeuA0OK5EFP+tkq31rRjHfQ3aFyZi5LErEsdBHJtWdtKEkD+ic/r+UDkdC+xWG
         vmhxfePMK/pl3YzhexywhYmxCmOh66ySRPzEyYnL+gZnlaLDXgzuQCZ5dAAzSjWWRLMR
         8h6p+neOIiq9UCuPlftw2HRa6xCk1V+F08YZhk15UgDCZxIDW9zy271t4tzXrSLn5NxK
         8ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889057; x=1703493857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ko7dfscRWyOYsoLBA2bq9GBOUV048i1Gtasxg3jLXw=;
        b=wqcG3luedlQ5k4N/gZlUlUpL74LgzZgUFFIvw0lrgwIuyoyrV8JUd7WSYCDkiQIfss
         iBW/7uKStumPxWq2a74BtB+cHlpboqq2WVygRiM66L9L0ediJiFy0NfaApW12qtyVGal
         M1yD8wDBFKBrQfM+QxIlzM7JlC0y2QCTDf0aTRgcw8m8yco83Gta6fs9Rq/C00u6RKwg
         LZK1Vso9s2q6sIoOOWhQYsRlhKZhbIdECTYogTZCXHknpbAtffR8sytn7JepaakilNxo
         Aee1gCDnEQmIF+cbDvVsNT5rLpXP4UAICQk+MDHZ1xmtmI9x4JCyIBs1ueBNwAskvDCf
         b8gw==
X-Gm-Message-State: AOJu0YxgG3hGXpPRdu7BCMYFeb3ICIE3tgoZD1uDqwAks6u72GU2GZB7
	a+1wMRv6ORqkhAsV74nl07yWKIHLinU=
X-Google-Smtp-Source: AGHT+IFgyTLbkEUSZ60wWMw0vjpKb9aVFOONJNS/59j+4iOyUkd3j02N2v87cNlQHyMjW1naMh7svg==
X-Received: by 2002:a17:906:5184:b0:a1d:b9d2:2aea with SMTP id y4-20020a170906518400b00a1db9d22aeamr3014480ejk.280.1702889056501;
        Mon, 18 Dec 2023 00:44:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] bitbake/runqueue: add debugging for find_siginfo() calls
Date: Mon, 18 Dec 2023 09:44:02 +0100
Message-Id: <20231218084403.599015-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218084403.599015-1-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192617

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 0fc26ccdf88..51959231b72 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1764,7 +1764,9 @@ class RunQueue:
         # Define recursion callback
         def recursecb(key, hash1, hash2):
             hashes = [hash1, hash2]
+            bb.debug(1, "Recursively looking for recipe {} hashes {}".format(key, hashes))
             hashfiles = bb.siggen.find_siginfo(key, None, hashes, self.cfgData)
+            bb.debug(1, "Found hashfiles:\n{}".format(hashfiles))
 
             recout = []
             if len(hashfiles) == 2:
@@ -1780,7 +1782,9 @@ class RunQueue:
             (mc, fn, taskname, taskfn) = split_tid_mcfn(tid)
             pn = self.rqdata.dataCaches[mc].pkg_fn[taskfn]
             h = self.rqdata.runtaskentries[tid].unihash
+            bb.debug(1, "Looking for recipe {} task {}".format(pn, taskname))
             matches = bb.siggen.find_siginfo(pn, taskname, [], self.cooker.databuilder.mcdata[mc])
+            bb.debug(1, "Found hashfiles:\n{}".format(matches))
             match = None
             for m in matches.values():
                 if h in m['path']:
-- 
2.39.2


