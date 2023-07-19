Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3342EC001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:30:54 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.578.1689798648812766992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nsijtlSR;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b6f943383eso200531fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689798647; x=1692390647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZAntQMt7K+ESQgqNj9Gpq8fcthr6UBrsCRT3VhSs28=;
        b=nsijtlSRwV2ExuTQO+GCzi6lqATm9bMT0NjFmqWjR9fduMOSKn+bHiIKamBmMYHXSI
         URonKWvHmjEjv19AbymlJpG+D3Gd3gJlYDk/vM9ucPsqeMhYcsvLbHlXrKN0GwBnfmcC
         uiIum9ojDUji5MZHjj7Nq7cnCzGgi85CYivGIfJWpvGYmIqsgYsj8pzi9ItykeasvlNc
         mkndYR9feH83Yh2YjIXar8gg4s4J5cKEMoNBnB9zeCPgYxMSCpwBD9jiBir15lu7Vd6T
         hy/r746rqls+ewXrTxMOFHuH0P/EX1jGaQpr4C1DWBg38CIvYT7Zs2CTdMzg6D0NZFu2
         SZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689798647; x=1692390647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZAntQMt7K+ESQgqNj9Gpq8fcthr6UBrsCRT3VhSs28=;
        b=J9au7CRWOMIUlU1+wcYhsjKUbOxf62S4Ezb6vBzDaN00Mq9UOVjbcsKq7YwTY88aCv
         z+F3RXvz54YfYhX+Rd3yzrQ0GTqqvfCC0xSlGFwBn52EC5fn8R0MHvqVCjWzoeDjHexM
         Zc88j0/bQuq8g8orv/bOB3ieWAOTuHM5FS+jkHfpiQRVM5KvtJ+TrJRl9kTJkkFIpoi2
         WERToYNjY6YUEyWheaHaA7y8ylJ8ZOV36s534LFm3gXwkZGGQ+kk+oveewYnfj/JAe1N
         iQ9QGbBBzcTsusZQh4p7eX3sNPeA2SHw+TkmZwjrGl87E/b/ay+fCJpCCRX2olamDL9M
         gSWA==
X-Gm-Message-State: ABy/qLaO8p3EXiFj1GBC00ebzintPmNsNQZ2mRU08jjsU0LDByFoMxth
	PsBQ8QMzG5RhgM7nuub2qef8KKshNJ1N/w==
X-Google-Smtp-Source: APBJJlF7u9mZw7iSjg4aY/iTtJlmoUbjofP9F9Ytuu5GM2qMHy31wsapmf0edGBqgi5Qg7G6vgyCCg==
X-Received: by 2002:a2e:a28c:0:b0:2b4:45bc:7bd with SMTP id k12-20020a2ea28c000000b002b445bc07bdmr772733lja.4.1689798646797;
        Wed, 19 Jul 2023 13:30:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lf1-20020a170906ae4100b00988be3c1d87sm2776947ejb.116.2023.07.19.13.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 13:30:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] Revert "ptest-runner: Pull in parallel test fixes and output handling"
Date: Wed, 19 Jul 2023 22:30:42 +0200
Message-Id: <20230719203042.1513594-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184608

This has once again regressed glib/codegen test (which writes large amounts to stdout).
Further fixing is needed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 60918a38927..6f3104499f2 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "4148e75284e443fc8ffaef425c467aa5523528ff"
+SRCREV = "8259375d306a8129f6c5d8528314496fc6ae1ca3"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.30.2


