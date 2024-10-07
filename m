Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54CCCFB442
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:19 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.44006.1728266113735720576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hRLwcdcJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e082bf1c7fso2682986a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266113; x=1728870913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S7Hk/kCVnEm7iRGew4ev6PzgQTcKQmVHNuGd7xwMeI=;
        b=hRLwcdcJ7PgCjMNiWN0HbRM5xA6IX46t4H5YpeEtSDVeW2o0q6olxKKrjmQkvRhxbm
         V72+jf59s65NRaGDf6zzMnQSFofWCT3H0YTtSpRxdh1pgaK+InRdyBm7XpnMfKwBCLim
         0ptWSpavI/jyQyVxyR/E16wdkj3HFwhkt/0SuDf82p6lRbmb2KVJHc9jebXTS+p73zkS
         Rq6CQcFHIlDjWLpnnZAbZGPrNjLlPYdq2mXfw6yBczi+n34MsrkSde2pavOSJwhNo76c
         TVld6bX426f70EpRzcKPosvqzkdnMcjJ/C6sLl0eYOypp5xvRxKYZap6R1Bym0yojtOi
         +dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266113; x=1728870913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S7Hk/kCVnEm7iRGew4ev6PzgQTcKQmVHNuGd7xwMeI=;
        b=JuNUXuzskrgBfVkEjTJY79tQUu6fiZIpJl9O7fGJXN7Zc0SyBOWzjpoSj2/d31UgfY
         UpNTepXlPdm2V+x6ARAnmJ0KIfpBOauEma7iCmTj87dHpfYh1alUQSa1/L9g9yr75CU1
         Khr7Gv5qquIYN2y1mER7CecTQbtJDjud/JKqWl6MSgY9eikS1KosDErWle3UCEgpz2qa
         vC99DsRnlpuUOkCGQtzUOCltkIdyyab88AwuMHPBBsOgTpA3qHhGRyX3etNYXLNoXfOx
         TxL5WVe+Cp18gSCY6CapYRHGwkGvZm59/sLspj78pC/UXnxldkJ2hGxDoHENwMrzOraM
         rZUw==
X-Gm-Message-State: AOJu0YwSLPY+zoKD3IqrTu/oOps01Ffvg26mDDb+zn8jrJ3S+HFanwoD
	IO3stf9l13ch0BRctavTW0Gad7pT3qssoiouFWlaV/oIVn/5Qm8bpH6bnX/vZ0g7y2N6X7yIc7h
	nmO8=
X-Google-Smtp-Source: AGHT+IEMPp+8o9FXtm7IoJYvM4E5UkwHn7iMorREWjbe9skl9M9l8Gw1qLMIeqcdjPpbz2Wuzn3lCg==
X-Received: by 2002:a17:90a:458b:b0:2d3:d09a:630e with SMTP id 98e67ed59e1d1-2e1e6212e23mr13343924a91.1.1728266112944;
        Sun, 06 Oct 2024 18:55:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] openssh: Mark CVE-2023-51767 as wont-fix
Date: Sun,  6 Oct 2024 18:54:55 -0700
Message-Id: <9376c14f367477a8d02df1331908e3df3bd009b6.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205250

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 1b4bada6c003ef743df09283e45953e6d9ea4c5a)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3c507cf911..a8ba67e360 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -40,6 +40,7 @@ CVE_STATUS[CVE-2014-9278] = "not-applicable-platform: This CVE is specific to Op
 Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
+CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.34.1


