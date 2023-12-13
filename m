Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E176C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:57:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.32121.1702457849395039739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=rzsld2ei;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3363ebb277bso162427f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702457847; x=1703062647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3f1sVA518hyM9mF04/wjpquXObWruUxZOJBZ+rVwCI=;
        b=rzsld2eiNJGhqgBLcPBNZliL/KXPsRj+NrjaomdI/aNMsTYkVEGRkO+PswuUkCBeS8
         nmRQk1RUNzaE+dUlJA8x8iTGCycRqO+vLSmSQQcdMvimJf1eri3rmO3RoMLNVzSEjC5y
         9uXeCmxR/5Q/Sd+wZUOp5RtklgZj8I0f9AUuV5KXhEDgwsRdder9TXRx8WDf24XXpNcn
         IpwTqHIrVG6fXen5m5HimbSBcL8L9qAw69nqolAtqDfyI2v2neYBkKbC5trQOUVACIyD
         sSiTRaXXfCosK2meBo5cESrqCgtfqiDNudEB02yudU7O4Q7AhxgQAIhIj6sH0ZrVWXdu
         ry3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702457847; x=1703062647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3f1sVA518hyM9mF04/wjpquXObWruUxZOJBZ+rVwCI=;
        b=aA0UTO1WDClsl1o1d13AUqtBvN+6MPeh4qvVJiZs8YbDu+5wRBuITsupcjb2ontJR0
         QzYVcMa2TRArxtiWUBiKitUxst+Duvgan/KYoIcCJLhm+peAhUqcMCXBNLplumGNrzy6
         UNd96GW5KGNNrJ754I+mMNIKg5HyppdJWFWRYDl5Ohtv8gWjt8NQFFxZqXpfyO/VCJvf
         k19JtCQnFjNYp18wnjzXw8mV2XM9zUMVy7hYmK/cksDl0nR3VTI9IJs0X6ppH7Q58Uq8
         aZc/SvQZvOhJiLj+QXadXJrGKsPItJCp0Z2GcjSs6tagU5dPvzqigNnne9cgjxQdqfj4
         olQw==
X-Gm-Message-State: AOJu0YynGj3ptFMq/iBjXu+0rzEFIabPBkWDf4IRP85cghRKzXUTqsOM
	ZBLtFJluFQOJUhjVkd+T1Dqxq4PzT5UBy4BTSzA=
X-Google-Smtp-Source: AGHT+IEvxQBk18LbNGUB1KAAHRjMFWzHMcukvF+h7zEf42LS2HMmHUyes8KZUZlqSk3AkQAuvwgXxg==
X-Received: by 2002:a05:600c:1c05:b0:40c:3856:5e07 with SMTP id j5-20020a05600c1c0500b0040c38565e07mr3940425wms.9.1702457846983;
        Wed, 13 Dec 2023 00:57:26 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c0a0e00b0040b3867a297sm19859967wmp.36.2023.12.13.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 00:57:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v3] strace: Disable bluetooth support by default
Date: Wed, 13 Dec 2023 09:56:58 +0100
Message-Id: <20231213085657.2552223-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192274

The bluetooth support adds a bluez5 dependency (and,recursively, a lot
of other stuff). Disable it by default to avoid having to build all of
this when it is not needed.

This decrease the number of tasks run for a core-image-minimal build by
~1000 (-21%).

To re-enable bluetooth support in strace, add "bluez" to strace
PACKAGECONFIG. For example, in local.conf:
  PACKAGECONFIG:append:pn-strace = " bluez"

Fixes [YOCTO #15323]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Suggested-by: Ross Burton <ross.burton@arm.com>
---
v1->v2:
* Fixed local.conf example (thanks Tim)
* Added Suggested-by: Ross (thanks Ross)
* Removed an extra empty line
v2->v3:
* Added missing leading space in local.conf suggestion (thanks Martin)
---
 meta/recipes-devtools/strace/strace_6.6.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-devtools/strace/strace_6.6.bb
index a3de7941cf..eeffe477b3 100644
--- a/meta/recipes-devtools/strace/strace_6.6.bb
+++ b/meta/recipes-devtools/strace/strace_6.6.bb
@@ -22,10 +22,6 @@ inherit autotools ptest
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
 
-PACKAGECONFIG:class-target ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-"
-
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 
-- 
2.30.2


