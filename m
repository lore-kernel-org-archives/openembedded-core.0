Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA4FC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 04:12:00 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.24008.1701231111464620923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 20:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kqXVqxa7;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b8929269a0so494330b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 20:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701231110; x=1701835910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSTG3drXBcIxDWTE1MRpFkinv3JZzUmt9SxXe7YPWOI=;
        b=kqXVqxa7d+Y2xP6ebNsxlIJoLaN1S2Qk7GtnFYGulTAswbpIcTZ+ka+euQLGVa3IIz
         Y93NX9D9cDnWuybPf+HO4Jmq65B/6rugqzzPca5EUv9NOMt+x9OgzlcIASNmjVS96i5W
         jPS1W9l8e3lzGcya5wjJgXW8gMvhiUs+oRpgzOUHGDfKardIvMUH3EexzeViy7G1WQqt
         yA+pNqckagCBLv7ryVdZGbNki+cThQRwLFIHjvZyW9O/Hs3f2N0oTVxXoTJ2Qs07BgWS
         tYGDvSMhcbFtFZgfo49t2NQVT6KFjQoXBlURf+YGj4xV1FcOJaBhXtax/imYNBFU+5C5
         XRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701231110; x=1701835910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSTG3drXBcIxDWTE1MRpFkinv3JZzUmt9SxXe7YPWOI=;
        b=vWHkeZLvhkxkyA1cPOej+tGUCrUH/7kc7J1epzP0s7JuT6TlR5cfOAmxWJ9XeibgER
         bll/iSZttb+nEMDAIDJd4hoIWuSDucIODZvFF6oNK4pj5e5Vs5Qa2nxsbTTPqMbw0bXQ
         H/eS1V/2KnrhjJOM9n91f+mIfO3U5kBq5WGYTkNBRILYKMbo5rd7vH1lAfaNMHsF8pTJ
         19LWDs5sNBlsY9iPP6cpKWtChQLTYc8/o7P7+Gyic2NGHVj9qHdgTp7ZecE5cNcN3lJh
         Imm56Q4i8J/BMoixL0QN3KeghTDX6XmIuUceb1TGQ6+aCFoUw5fX9gSU1khObCOZWKA/
         yoqg==
X-Gm-Message-State: AOJu0YzMh2eQRM/nKmGCoj48e0X9ShMYgKYa0e6pyeu3BPJxgJVwKa0T
	0qNh0EsPf6hE0htv0unwqxG+WCtBsruQVQ==
X-Google-Smtp-Source: AGHT+IGaob2MGV8XuPC9Kwi20lFkgK7S3d82e6Oezy/c1iYyClkq46qK7EmQCL1pUfdeRIBCQbBwiQ==
X-Received: by 2002:a54:4499:0:b0:3b8:339a:85de with SMTP id v25-20020a544499000000b003b8339a85demr21136706oiv.13.1701231110355;
        Tue, 28 Nov 2023 20:11:50 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:cbf8:fa1a:a573:44e6])
        by smtp.gmail.com with ESMTPSA id q3-20020a056a00088300b006cb64908070sm9912716pfj.93.2023.11.28.20.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 20:11:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-cryptography-vectors: add RECIPE_NO_UPDATE_REASON
Date: Tue, 28 Nov 2023 20:11:36 -0800
Message-Id: <20231129041137.2280657-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 04:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191424

Comments in the recipe are insufficient to prevent folks from attempting
to upgrade the recipe without also upgrading python3-cryptography.

These two recipes MUST be upgraded in lock step to the exact same version.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-cryptography-vectors_41.0.5.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
index 44c67fdd76b..e304c4261a2 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
@@ -27,3 +27,5 @@ do_install:append () {
 BBCLASSEXTEND = "native nativesdk"
 
 UPSTREAM_CHECK_REGEX = ""
+
+RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-cryptography."
-- 
2.34.1


