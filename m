Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F82C47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 19:26:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.1544.1705951589423901877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 11:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdkJ+Tbq;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d70b0e521eso25588555ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 11:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705951588; x=1706556388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfi3z+NxY4MTfrkaKV0HBco4l7kGJf0tejKHic7ns1o=;
        b=VdkJ+TbqIK/6/Q3DHJ6MUUpmF13XPqGP/4iffpODGv8TghTsg0kLOgHEhV9NpvF0gF
         c4Bjk3Bnms1C92RjjYo0GxrSLHgy7I8ZQRu6o9xIiUj6xxUAILNQCpBWYLrw8d1HXLO5
         FaYOpr490sUMwvqunKX7KVZyN2IuH0zyOJhvkEqvq0EAWKiH4EE8BBTdFvp7YzOFYkQq
         GONra+x1SvleOfQp3DWkk6YT/++TwFntN6yQltMk9kuY+UbqpMOo04l066gXStz7s0uO
         PFVZGErC6CP0Dk2Y033Bp9mBYXENB4FxPDyDGZLqc0XqMEEHxVSs3kl6CLOWKJFOAJQo
         BlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705951588; x=1706556388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfi3z+NxY4MTfrkaKV0HBco4l7kGJf0tejKHic7ns1o=;
        b=NhU+cBl8rzM3hy6S5STtBNYiVzFllFcuZjhM4+UVNjozUGPNiMXHLbAQy5OzdDqoiz
         CUTRZ0S+aq6dazAZHLDdM0L3uzZMNbf+nPO1mtp52AmMl65E8UrYk4+iqhfi3KfCah3W
         zbgZ+0pDJhTgR/+kFShS+wN5lYX1JSd+Elfb4WgpruNFm/ABtamp88u3cBq9x6XAxP5+
         5q2MkoIHU9joZPYAl+Ht/YWbGsfj7vHN65Zj2bCgPCCa9nMm2i0io/SvxTHWt9se5tUa
         NVQndASvC4Tpk8icwkgHWLyj4hBmHSQoBdrOGN9y6dzYsJLhUD8n6hRNChTD3VZ5+G33
         95cg==
X-Gm-Message-State: AOJu0YyHK7nNYLKPt5g0O2vsrdwU8gHCs9WDkFN/ShTw6HPfALXKsy89
	yXw4XtvUUtRnxgbTWwciQFhCk558C79FhKGm6gap78et3yiFsGXyF2V2G+z/WhA=
X-Google-Smtp-Source: AGHT+IHnw3PPx1sFBg8FwGoRGo8J2b+3h9m4WKKwGwuKQV66kzAqEVTUTK4mZ3V5sNuFPMPmOGlTjg==
X-Received: by 2002:a17:903:32ca:b0:1d7:48ce:2046 with SMTP id i10-20020a17090332ca00b001d748ce2046mr3504754plr.29.1705951588420;
        Mon, 22 Jan 2024 11:26:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d592])
        by smtp.gmail.com with ESMTPSA id b11-20020a655ccb000000b005cdfb0a11e1sm7669320pgt.88.2024.01.22.11.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 11:26:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Do not enable CET on 32bit x86
Date: Mon, 22 Jan 2024 11:26:25 -0800
Message-ID: <20240122192625.1758942-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 19:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194191

Support has been removed from 2.39+ see [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=25f1e16ef03a6a8fb1701c4647d46c564480d88c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 32ccb888f0f..417f0c8bd0c 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -83,7 +83,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
-EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3', '--disable-cet', '--enable-cet', d)}"
 EXTRA_OECONF:append:x86-64 = " --enable-cet"
 
 PACKAGECONFIG ??= "nscd memory-tagging"
-- 
2.43.0


