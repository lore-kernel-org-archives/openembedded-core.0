Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EAEFA374C
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8228.1667216864073397226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNAGTTw+;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id y16so15548650wrt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxfbVlbLYi+uzfUga4SKocqtw99lnj2f+xHloiv1tss=;
        b=WNAGTTw+G61Nn9wrEpSQZlF0oZfsGdEODrnzyUcqT01TKOYaCOgrNVEpnMV3Gw0HKa
         0nJ+/WJnhEpMC9n6o5GgjX66XjhOlc+owV0cglV7hL/1BXXXOxrh3GEC+381CIDR+dnn
         nQG0/0WVI+d+sSGuwq9+jmZjhjMgNG1jJ2zUAk2hII2ti27bGlnRN9gv3g9rtk1k25up
         epQ5iqGGtqP3mBRyrc30lEVrFqNEQSfFtajvgQS5I8h+FKq2ZXBiOOuScY68eJFvOozK
         kxf99IuruTrztxlDj9YZxujVlPQmn52yiRkixl0hqB54Ir3A35OgRlZD6aVmmv74rl0n
         FpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxfbVlbLYi+uzfUga4SKocqtw99lnj2f+xHloiv1tss=;
        b=4oQp9HsOIUVolzfkwfg4lMLPrqCZw6pkoE2NNTU0E4zkny0JzwRbHYm2awmdeIQfv8
         EwD1APjc1OrqKzEMJA02r6/jCh9cQOgRH2vOnusqSEQrcFFlig7VACdjzJxC2HTQ2Qp6
         8Vpluiu9/RrW6e5VYn3rCyMkPuBqB4v21IwjKdVjaw2VCpDHEDndSIkBUlNM8yAnOD6e
         MBYoNLzKybLYqgX3BDcAXhb/oFc9rzlNI9PvwkQC2EXly469Ej/5tjAOrdDKthKrlXOb
         sSy1rK0XINMdN+4V9uYrtrVzHcCSv/fLq9K8Q3ESTsvTzrUnd+m6CLOUmu/bJ0KbMXSD
         lEzw==
X-Gm-Message-State: ACrzQf0FVuknZ04d/IF1NHcu1mWe5zoSoXxL2uubPbb8yRdmU8MFqq88
	yo4n2azj1R0apI1gnH606NkvUdTeop4=
X-Google-Smtp-Source: AMsMyM7eWZng29X+HWBtRazxpOnrc7aD+n8+i1fH7wTcg4FoOXOj1ybzcyZMwJcWdebiDvuNhTN2aw==
X-Received: by 2002:a5d:50cf:0:b0:236:86df:257f with SMTP id f15-20020a5d50cf000000b0023686df257fmr7826052wrt.374.1667216862553;
        Mon, 31 Oct 2022 04:47:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/13] lttng-tools: submit determinism.patch upstream
Date: Mon, 31 Oct 2022 12:47:13 +0100
Message-Id: <20221031114719.2725967-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172309

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/lttng/lttng-tools/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
index b2ab880bd6..0a897a8e13 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
@@ -13,7 +13,7 @@ to me whether the tests need that or not.
 
 Fixes reproducibility issues for lttng-tools.
 
-Upstream-Status: Pending [needs discussion with upstream about the correct solution]
+Upstream-Status: Submitted [https://bugs.lttng.org/issues/1361 - needs discussion with upstream about the correct solution]
 RP 2021/3/1
 
 Index: lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
-- 
2.30.2


