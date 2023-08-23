Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FBAEE49B5
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.13099.1692801440475480427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EjLtFWhZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf6ea270b2so24401895ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801439; x=1693406239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0bYS1+SivYXjXbRmVL1//fE2c72gaH4rRvy+X9XewE=;
        b=EjLtFWhZkD7UBrcW0KVDd1oh8Qs/jt0ji9bSkRU/gtCyB68tk9zwGJFFtL/gyzoq3E
         g1F0wqlLQoI3HtH6JGkuv0vnLuzaIouyexjpAhpoDOAAflek52a39j8WpzgQkFv5+2MT
         xtWUoWKEoiMTsa4P2ASs5m34L53dsQSFji47E7v2uBcP293EkvFOusZHHAJLjUF6WeAD
         GG2XobIl9Iduo2amsbOtJOZu23Voyt6etHZoz1vNtdKFWO8MdOX9bC/jcBmMHmUxDNvu
         YV3R9Q63Zz0w+/Fx4ycZtstJHvDptPYXWlhMbdYzFM4C51FelSRQCZ3ylPhgwb2QmSoJ
         4phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801439; x=1693406239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0bYS1+SivYXjXbRmVL1//fE2c72gaH4rRvy+X9XewE=;
        b=WRh1pU7TF5uRTVhmQSwWsmMjcPtiPQwL1xfl0Aqxkg+jZYFd4yhweg5/Y8WKmbcw4p
         wG7YwDKJA4uJjxFTvx9Lhqg2aKVo2j+4UMuxj1fl6DJgm1HP/iL7+cgRapZklyKzbvQr
         tNh5+dm1oSflF01TOTATneGYXq29Z+mvyAzLPH4nmUpuszhmf/w3dhgl3NWEuOKxM2/u
         NCvaAHEj2fCZHqKs4JsC9LrWw5eK89ZqGU6B/CqJC2dyy1GewC3jgxvkYPyoG52FjFAc
         3TX4jEfC/N/9gTp4SOZbPeOiQ4yNT1O+HAjDz4Z2wMRDo0QuCrICHwgcG3aKBDh/+ypM
         2KTA==
X-Gm-Message-State: AOJu0Yx4vSiW3xvLGjVjfDJJPsWa75HJaQ3yWWcH/ZpAunBOYaHQ6I3e
	+RQjZ4TAHdlCQAZEVT5Nr8+04H/7cpwr2wJjbdM=
X-Google-Smtp-Source: AGHT+IHny5eGklUvJ+zhnwTsg/LU63aPBJFABE80twydN3GjKJyEg1UYV0igTnLORUGnvnmiJAlCUA==
X-Received: by 2002:a17:902:e546:b0:1b8:7fd7:e022 with SMTP id n6-20020a170902e54600b001b87fd7e022mr11716293plf.28.1692801439567;
        Wed, 23 Aug 2023 07:37:19 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/36] selftest/cases/glibc.py: increase the memory for testing
Date: Wed, 23 Aug 2023 04:35:59 -1000
Message-Id: <060030ac9d00bf22ae3a2695d7ea060f0f69dfa8.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186610

From: Anuj Mittal <anuj.mittal@intel.com>

Some of the tests trigger OOM and fail. Increase the amount of memory
available so we dont run into these issues.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d22dba482cb19ffcff5abee73f24526ea9d1c2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 783c2d8541..fdda6f3ecf 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -61,7 +61,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic"))
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")
-- 
2.34.1


