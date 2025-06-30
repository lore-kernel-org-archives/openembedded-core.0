Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5544C83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:48:30 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.42670.1751294900483004892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Jv9n+R16;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6face367320so25348296d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1751294899; x=1751899699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCPr7SDR9PEQP0UTq2Fv2Z4zNmCUztWDtWv8Y1/VCGo=;
        b=Jv9n+R16ldEZ2yZm5R0tJMosqWDoZOLIoldb5HZD653soiUsPGkt7wqVksAfEM2T2a
         1CtoNodZEkG8VCdgZnhw97cU4Ga8Aao5o16ucCR3gHLEWEnUnpIFnTz+Iq6TQbuRc7Rq
         CzVbTH5PLLPBIstWeUB0cB5LUhzVPcUME+v5za176MW0XuwpTrDzWZJSaznPwvBmikB6
         Hbd9N9+euPvK8vJNJYzMmm2rzGSHED/k8Y9pJheersaFt+VBK2Xy+9afYEHEs3vUU5AU
         To9GJ0dgvp9eRIU5Y7pgmeagz+VPKrRPrAPY0yOYCMVldU5Z4o4uxKFXKstJfFVtANc3
         heOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294899; x=1751899699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCPr7SDR9PEQP0UTq2Fv2Z4zNmCUztWDtWv8Y1/VCGo=;
        b=DfXEQrMjFjPRZ5+hH/AUr6F5hBSJJl3UqYK/7Cg7/Zp81I0BkIqcalFKTYNidEPCTx
         4UPq+uKFt6IPknsh73GWGnrwKdnX2TbOruGp4wMUv2X/xSwWUhlgxtjmwyrBOn0fyW/G
         zMeQRh21El18WwSf51+OoqElTJiUkJfVwoIYqw1C4Ajooqn+214312ZmQF4GXkstWnYV
         hpab/glGV2pH744BZG2Gme5+FYYOSXej2sZz6PgFLS03CzEh0EriOesB+KpN4my0vjKh
         kW217XbDu9CFVlCyFWiZjJ7IeahA+Q30qsckhfZ/e/NUWAePGDB6dh3klRrwsmvf6E9P
         2CQg==
X-Gm-Message-State: AOJu0YySOpZFwhL3QAvyit6Gv8vA4LV4Wt7KopsegungsGjqc2XYgWrp
	/JkfLZTT8UIqdfbcpCRyy/zrjFGvRwnFJOeryX8zc0zeTT+sfDph6g3meH9QHG8F+clBOTsa33x
	gtew=
X-Gm-Gg: ASbGncs+jWUhVvIab54b2MeYwQpjF9g9+oHmHzNBoRSDqdciDkg8nlb0bmh3GyMfvvt
	creqRXCZTVxyGYIv03MSv9HMZHPQbvcRbkBmqq+6NcCRjpsZCDo9Lu9kbSFUeWx6Wc3jEI/2eKE
	phndt2GWae3qiijUlB2KNpzrc3NBF0RBmorZAKmg8Ho57ucB1yv5Igxs+Rb8Ly3aROs9HrUZtGP
	9rUlidE3vsYiqtV5yXr3GLAcqOPIvIOpssvtm8DufBdm4JUXfrDOUySv6dIjYZrmsR5BaWw1Jf+
	17Patmyr0mbhGyiPjQNeqTLAWmbUW6CbM/LBySRfaEz4WeBTdqDvGg==
X-Google-Smtp-Source: AGHT+IGNbRz2YlWf0xfzzsH7ASDK1Ghneohd0k3uVExsi3fHloYzNWuZSsK6FJkCbfCtEO2gRGsZFg==
X-Received: by 2002:ad4:5cea:0:b0:6fa:ccb6:603d with SMTP id 6a1803df08f44-70001e5be39mr247620326d6.16.1751294898899;
        Mon, 30 Jun 2025 07:48:18 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d34csm68516706d6.19.2025.06.30.07.48.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:48:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libucontext: use hard/soft float
Date: Mon, 30 Jun 2025 10:48:14 -0400
Message-Id: <20250630144814.255656-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219524

From: Jon Mason <jon.mason@arm.com>

When building for qemuarm-secureboot in meta-arn with musl and clang,
the following compile error is seen:
- | ../sources/libucontext-1.3.2/arch/arm/swapcontext.S:23:11: error: unknown token in expression
- |  ldr r4, =#0x56465001
- |           ^

This is happening because 1.3 added ifdefs for assembly code for both
hard and soft float, and bcause neither is being defined, it is taking
this path with the issue.

Since we can tell if soft or hard float is being used via the TARGET_FPU
variable, use that and set the relevant makefile flag.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/recipes-core/musl/libucontext_1.3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
index 2362cba5c8a2..92001bbe7bb5 100644
--- a/meta/recipes-core/musl/libucontext_1.3.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
@@ -48,3 +48,6 @@ def map_kernel_arch(a, d):
 
 EXTRA_OEMESON = "-Dcpu=${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 inherit meson
+
+TARGET_CPPFLAGS:arm += "${@bb.utils.contains('TARGET_FPU', 'hard', '-DFORCE_HARD_FLOAT', '', d)}"
+TARGET_CPPFLAGS:arm += "${@bb.utils.contains('TARGET_FPU', 'soft', '-DFORCE_SOFT_FLOAT', '', d)}"
-- 
2.39.5


