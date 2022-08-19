Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79871C28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:44:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.50634.1660877037059821418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=C8bBjDtG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 s4-20020a17090a5d0400b001fabc6bb0baso3786230pji.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=McqRGTB/c0Ab2bd9gEfQwkV0zhFST+6RfgaLuV0EwhU=;
        b=C8bBjDtGAOneKF+CNeOd7vQbipsvI+L9gT7avogrIGpWpoMeYIGHgxkAo2aSPMq1d0
         qOQC7ZJ1bL88uZVNZiYZ+t0TFoI5D0rUGkzOuk+qdlI0pV4IxvCqW0xOEUO5ZpIRkTyi
         nssWgeeY7iipkrNMxJ3A1HtgDsf4KCrjY5+k1FANwOWILX2Dqveb3wA5HCIdpTlt75O+
         jL4JLVeESF05q2a7ejgYwTGCEAx92FKvF8DUhkoo1lzLq21XZQ8V52zQHBJKQFbt9Csx
         wkLKkO5Ypmy/t+RDzBA1dy26Ky7AG+vymlytbXmgJpoBYEybMGivwR537DCeQL+UuSOt
         gfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=McqRGTB/c0Ab2bd9gEfQwkV0zhFST+6RfgaLuV0EwhU=;
        b=1645OqNX7VALlMmrUQelkObNuUlP4j8/nB7mlHbbiJMAx3B2zwQpjOZIBqHuxXtzkn
         JhwmjFYMUzHQsfdIliz4LunE53/qZE4tcYVOupeRfiUPjeT4enF99aFaaVh6D5YxNOMa
         T8Qbzfb7tqiskv/51ax1j6/28SuoqT4lwhmDlftQN94Wpsm4cwr33bOi6k63EYZ4NE/k
         wtRhlJcO7upLOr+TOz0cT1QDgaH1GqgLoz2p32YA+qLzduhQBjmQdKLDLGMJeiEsEmQC
         7iElCsloWeA7HGCM71QHXqzIpfAlq1fSMK7dq0C9CpHUSZKEnK8QSY2gHJD1GKe6CSVf
         mvnw==
X-Gm-Message-State: ACgBeo0a6QSiIprOVoNTHGvB+9A9l3MN7jbaDwfR4yhRgZSQ8YOHDUuy
	9rnPhb+omy8uGG1iNZjU9mbw7TOLYFoTStQa
X-Google-Smtp-Source: 
 AA6agR5aD4fDvi65PVCeOM0Stzf9dIL61sGyBnv2YHksRJ0OUKnlhNlKN8kYS+fHn8g6zdwTE8OIww==
X-Received: by 2002:a17:903:120c:b0:172:728a:3b24 with SMTP id
 l12-20020a170903120c00b00172728a3b24mr5179053plh.61.1660877036133;
        Thu, 18 Aug 2022 19:43:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/26] selftest/wic: Tweak test case to not
 depend on kernel size
Date: Thu, 18 Aug 2022 16:42:45 -1000
Message-Id: 
 <a894fda2d0083d4aba80652946dec2c8f04f65f2.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169566

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The current test assumes the kernel size leaves a certain amount of whitespace
in the output. Improve this constraint so a slightly larger kernel doesn't fail
the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd60c44bef4a1b5d3c8fe77a9e6d3a8f43b0dea4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index de74c07a03..49fb6fe52c 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1420,7 +1420,7 @@ class ModifyTests(WicTestCase):
 
         # list directory content of the first partition
         result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
-        self.assertIn('\n%s        ' % kerneltype.upper(), result.output)
+        self.assertIn('\n%s ' % kerneltype.upper(), result.output)
         self.assertIn('\nEFI          <DIR>     ', result.output)
 
         # remove file. EFI partitions are case-insensitive so exercise that too
-- 
2.25.1


