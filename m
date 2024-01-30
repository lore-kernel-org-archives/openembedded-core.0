Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA81C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 08:09:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.13798.1706602179420372009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 00:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOc5QJnU;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so516237566b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 00:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706602178; x=1707206978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enkstVwfOzgYHrPOviAdrg53wcJYJ8Jtinul6cO78qo=;
        b=AOc5QJnUqs/jtJnIjl3nZVA/PZPLonGafU+Kfr59epMLEo2/3VR7VZuJHJJ/c4DY0x
         qLx5Qko61TAhMSPoFRyTDdRPWa/bbiOdPZ77I0+5IH4pg6pQBV23Z+Tzn4ZtwpFKbfu0
         FZ7dl4puA9iYkgDwthrP5SmcVvHR8l6ulgNL1ujedysJ7nursh36funpt8kjYZoPp9S/
         u0hx79E6QhFC82+JWj2E5PpbuEAjP1jkgyPjGL1snPzXtE5L8/+ouME/ntGousgym51r
         tDmGi1vIZst4hA98iz+of46zVYc4nH5GECs0PleS6d8Zph5IypUUwUCYnbFArB9qBgDV
         bz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706602178; x=1707206978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enkstVwfOzgYHrPOviAdrg53wcJYJ8Jtinul6cO78qo=;
        b=SInL0kI2vYIHk0QEVAKZSw4zI5sFzN0hIDsFwqW/1zptWchditBWpcyaVfi+0++pzZ
         W1OfRyS/WlQ5kS+Tr08qMLaldTtADfW+N82a1xaUvpwcKYrNeveKk/cesfLHa5xi+mGG
         O5jzDmZ5HK9L2RzJbj9r6TIZJGbazbbFs6/FsS0pD78JxTHhCPL8lZsi/xK5HEh2D3jQ
         UR5LQODc5GTVFrjZ/OIhQpHLRC1URLxJHlL/kcQlDYoIMDboGiyh0/yLmg9eIejDnCge
         /ZNEQ81FMx0lXTD7En/afrRilhZ5bdTpQMkHJpLQZDMTVb8WeNPSRCqxj2EX+FheOpTh
         tCqQ==
X-Gm-Message-State: AOJu0YwHXCaa54kJd/26loestUyZcPVjgrCz4vOfft+U9GkKJl+XipPo
	cqj6aAIkW+BLt4NlMic8Ua1Evq6kZpy8Ry45g7oT3P1avmRT7M6IJQ4GC4bC
X-Google-Smtp-Source: AGHT+IHh7PPFHIS3cSox1d2PE4eIsRa5Gp5GUtsH7JBPdT+mQ9rAQZyEvnvW55TQOFdWYyqkToPBJw==
X-Received: by 2002:a17:906:aeda:b0:a35:eb83:252b with SMTP id me26-20020a170906aeda00b00a35eb83252bmr2409408ejb.36.1706602177636;
        Tue, 30 Jan 2024 00:09:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a30ed424e18sm4810762ejc.41.2024.01.30.00.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 00:09:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] setftest/cdn tests: check for exceptions also in fetcher diagnostics
Date: Tue, 30 Jan 2024 09:09:33 +0100
Message-Id: <20240130080933.2953994-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 08:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194491

Otherwise the output was cluttered with irrelevant lines that were
describing missing, but excepted cache objects.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index f7632286450..3a2d39ad0c4 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -923,7 +923,7 @@ class SStateMirrors(SStateBase):
                 else:
                     missing_objects -= 1
 
-            if "urlopen failed for" in l:
+            if "urlopen failed for" in l and not is_exception(l, exceptions):
                 failed_urls_extrainfo.append(l)
 
         self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}\nFetcher diagnostics:\n{}".format(missing_objects, "\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
-- 
2.39.2


