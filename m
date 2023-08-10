Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37802C04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.21387.1691683520951815027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qTaiu59x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so812722b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683520; x=1692288320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F14c6wAjaimNNcnsFd8B35neOtE2RfCu1OoqvDDUyKM=;
        b=qTaiu59xqejvtxhq+5iPFzDtKSjwJbYXtcMI7xnJRlwovzr3xTOlDL4F9Q9DKeqUqX
         KzNd8MqjGMXRjj37xOrbsu+AK9bbF8SWpDvPwb4xrILM7qvy27UF4HgeUpKoosOA0yS7
         LYSKOEva082oThAwNkvQ4cjDF2MwzftKb4UcXEbhSybKFhLcPuylaQNzEUx19RPxTOpB
         cGBIE1w4mBCDAnKxhqmq9OrRWpQ5KK8eFFTYifHIGzyV5U/8Me0wQSl0h+5d1Wk7oRj9
         ubvkZNYlo/xxniC8q5MhancW8EbFsgJQmTP0lrbE44301n/Zy4ZbBEi+G9Pr+DZfShZ8
         Hj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683520; x=1692288320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F14c6wAjaimNNcnsFd8B35neOtE2RfCu1OoqvDDUyKM=;
        b=is4+6YPCoNOGuUo+fx/amaQPwAYvo7NxNk3TuxdURInbrdjH8Fo5TfqTa3ZuPWxOW+
         6CnDPHwDtymfe7lTrLlO3KRUsfce3giu2HBeaXWma2lgDe1mEgscFdOkCl5YueinKUR/
         OevtRtd7adMUHMYWJhBtKZpI2xdLrKfWKZj/9g3bRmd0vc9r2ZVx2HPLP4qVbB01RekL
         9SkL6e7so/WkKJkHIIfPtVNAk0vG7gi54a4YozP9cfFD4Hdh0cUTzvXY1mrn4Nyl+BkA
         KRm5jxU5RdPzARfORbbJ+UdGUXoNiMA7wfAsZo2Jj8SO7wgc16INmxaYemqPmS4Slqy3
         /znw==
X-Gm-Message-State: AOJu0YznFzM9nZ7+FpRWltAcvgQo7Xa8XmXeL6K1oAyQ2FL56MMUEaS2
	H43NGYBN3cNNsAcc+pTfKPvKy/k2sXqgKURKlbQ=
X-Google-Smtp-Source: AGHT+IG7uYcZOaQoLndRQapFareVqskeqBH0ktxZLSdGdAInqZG3nSSAEXkU6JXgbjm+7XDxW3zr8A==
X-Received: by 2002:a05:6a20:1455:b0:140:ef2a:9b75 with SMTP id a21-20020a056a20145500b00140ef2a9b75mr3050116pzi.61.1691683520005;
        Thu, 10 Aug 2023 09:05:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/37] ptest-runner: Pull in parallel test fixes and output handling
Date: Thu, 10 Aug 2023 06:04:15 -1000
Message-Id: <5eee7d7a25bceb94cc14a98bff5be1cee8e53b06.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185778

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in the commits:

    Flush stdout and stderr after test
    Remove _child_reader singleton
    Report test failure on timeout
    Only collect system state on timeout
    Revert "Change test timeout to be total elapsed time"
    Change test timeout to be total elapsed time
    Report if child dies from a signal
    Recreate pipe for each test
    Revert "runner: Correctly handle running parallel tests"
    runner: Correctly handle running parallel tests

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de47e5f3837a9c87c3cbf8dc45f9e90110eda1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 6f3104499f..60918a3892 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8259375d306a8129f6c5d8528314496fc6ae1ca3"
+SRCREV = "4148e75284e443fc8ffaef425c467aa5523528ff"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


