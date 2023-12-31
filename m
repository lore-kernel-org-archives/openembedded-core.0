Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBF8C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:33 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.219007.1704025408944876929
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LldrmTeA;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55614bb435aso1066635a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025407; x=1704630207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qa5Xa6sUitJe22nJmZt25Zj+DakjnKv7foN0p1shACM=;
        b=LldrmTeAjpmRuYKt1KaLJWhe7F96k36vYTGtl1GoeQKX7DUXPhlIrXEIF4wWiegO79
         CSBzd6NCkYiQSSNaREWi9jV0fjtBqqQKpRYP4TCFQV/gqzc1p2a4P5gZjfFYHLAwalgx
         n6q1O5MiB6QVsHxhkGsl1eXf7K21DpeadL1G5VRrGrZ6/Rse0vSYTblrLiI6/d2HE4YT
         WA2cnOkKQIaUYMgtT3xuJAkd+bF4XLBDX2tT4HtWnN38JGmL/VyITXkyD+ikGyGp0157
         L7rCBt+wqw0JgTZjwz/mX+hoj/9pgcO/4LLuRUqyGKl5822rsR7pBEUJff2l8xswZQ73
         ChRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025407; x=1704630207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qa5Xa6sUitJe22nJmZt25Zj+DakjnKv7foN0p1shACM=;
        b=MarePvTPuKRZofQpEaqkeHZGd8/QavU7+dcQT2v1HRtt9yU8yNnAPw8KQqP/9EsFJS
         j79179jhRbtuUAnj4gE0tFD5/bGhFK5Q6C4FH0knkVIaQDWeLCfjkbR8h4K1BzAkWs6d
         N3EJv3d6sTEqJ8pAE3IcNgPIdVdV8zv+3nGuLzT0suUYnMk/f9Gmg62LwR63By8cstYL
         DmfgV/602XRfuS2rYWCNnymD27hY4RsJs784HcxKNj39sdpl4mn7ip2wub1QFYjIwE1Z
         VgXqSxTkqIILVxH/31SiE9844jne3zTu4Lt+6KjWV7fZiEvTu8HPQ5rWyfQdowskr8qJ
         GQZw==
X-Gm-Message-State: AOJu0YzAcui194D/f0Y3uQD69LSvkbS4DKKdPr0KX+KoLXmGj1hWqPyE
	CahS2SaTBqedWDRGrKn+oBy0E019PTY=
X-Google-Smtp-Source: AGHT+IF6niEolFcoN10qIaCQl2HLm5sXJRcvE84pWR3DBGGvKxD8o5E6BN7R46l1GaZHvO/ESOQ5Eg==
X-Received: by 2002:a17:906:c7c6:b0:a1c:a542:2fcb with SMTP id dc6-20020a170906c7c600b00a1ca5422fcbmr10890557ejb.31.1704025407031;
        Sun, 31 Dec 2023 04:23:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s15-20020a1709062ecf00b00a26e21e4aedsm6947220eji.73.2023.12.31.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] speexdsp: enable native variant
Date: Sun, 31 Dec 2023 13:23:22 +0100
Message-Id: <20231231122322.405204-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193089

Latest wireshark (4.2.0) is needed for python 3.12 support;
it also requires speexdsp unconditionally, and wireshark-native
for its own build helper tools in native versions.

So speexdsp needs a native version so that wireshark-native
builds without error.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-multimedia/speex/speexdsp_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
index 1e6d09ab92a..435b56bbb84 100644
--- a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
@@ -24,3 +24,5 @@ RCONFLICTS:${PN} = "speex (< 1.2rc2)"
 RCONFLICTS:${PN}-dbg = "speex-dbg (< 1.2rc2)"
 RCONFLICTS:${PN}-dev = "speex-dev (< 1.2rc2)"
 RCONFLICTS:${PN}-staticdev = "speex-staticdev (< 1.2rc2)"
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


