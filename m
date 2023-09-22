Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52887CD4F32
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.16011.1695367493924863149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QPDKIfd+;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9adb9fa7200so439651966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367492; x=1695972292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5fkBNEYmOoneEh/hnOR6qW39QLX68kNCxjrCXp/RWw=;
        b=QPDKIfd+ftL0xung1oL4k/SAZLkK/XuqnmYQMBPK+uOczv6a1lxl/HhWqUwLPq3C3t
         UulydFpBigrD1UgcmyIA4z4DlOKjsZDbboU0qJdlsJxmegui6wfEcCehJh44B7VJ53g1
         hE2URFXRCK2nRsOhgdw9iji8ll3YrZXobaAyYAlnjJzBIAUJR79qKiWt7fVjbPpPqMgP
         1cfAWtFeeMxdXMGcRSxSrPxX6IUTVZloIDrpMANtxYnA8Zq8Bk1QD9SWIgWamn8i/mMa
         BvnuSYueXO9HrB1yaCM2tBEM1L7n1Cq5pn7xEjW2es76f5/aHhz1nLPxEQAZngHKiesV
         DZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367492; x=1695972292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5fkBNEYmOoneEh/hnOR6qW39QLX68kNCxjrCXp/RWw=;
        b=MqBYM7vO8qaOgZJQfotpLOSey3UKavylfu2FENjmaBRaknINnwxPrHxoYIr7H0TQ4l
         gvRdEzBl/gsfM17M5+03/HtJ4t6mkMO0VyT9Xf2ye+ofC4KuMx2T3NirQmzUyzr9Z2RP
         pZd28ouHlNkuZFqgwAiZlOFU74L4QMQ6FvJTUMOEqXLa3mJJTgSbvFYCxmJsph3odXN0
         VOk9hJsTXvQK3Im6NV6FlEL/16aByDDdBzWUQujfxUEo6usQPhfv16KL1ovjWJrdNs/5
         LzESGHnSTPAyla6Et52/mg31+lpfSFiP2IAg/Zs3KYhj55GlZu4ATzS3ookJrOuV1B/c
         oWLQ==
X-Gm-Message-State: AOJu0YzfM/pi60+4Lw2hJdFA1NmCjT7ncmAZ4He6vzFfbzU/6mVZDXWZ
	KKYGJjhKywJDQEI4i3l2XCbfQz/rR80=
X-Google-Smtp-Source: AGHT+IEnge3KZDv4SlF1BvPNnXWCNmA7fvtensRclQVgJaTWBjfXyFchXdgWLRPGgdcT2+t+TC3gZQ==
X-Received: by 2002:a17:907:2cd6:b0:9a1:ca55:d0cb with SMTP id hg22-20020a1709072cd600b009a1ca55d0cbmr2663219ejc.23.1695367492336;
        Fri, 22 Sep 2023 00:24:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/40] puzzles: upgrade to latest revision
Date: Fri, 22 Sep 2023 09:24:19 +0200
Message-Id: <20230922072431.1481743-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188071

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 04338a603b5..d7089ef95db 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
+SRCREV = "2d9e414ee316b37143954150016e8f4f18358497"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.30.2


