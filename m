Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87BAC77B76
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 09:16:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.8221.1681377371922597275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=AEUrhMlR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id e7so3425348wrc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681377370; x=1683969370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHzhmsWqktLrOA5BE240SCWGZ+llExqrezYIcVr/Xao=;
        b=AEUrhMlRYienIJdUmW9QFJWqdpFPiAprJRY5XqMawV7Y8scV18L22kImDLd6YlfmMm
         kV2dPLOGuYQZzpYSPkjmSxBalPk48vgDqA4RoVbBAG/EtQ5V2k2QkU0yHVLoGFThSVFQ
         FbpaW3nP4CHcb0LMgwrYqC7xfLpsnh6rLoNyCyfR5f2bJVo5hv0fowN26wwshRF9zS97
         JXauWp5ejqjzL0p1TXJvb/8F3qNo06nfhBKSSTqFHL4KjSDc6iRlebNchuG/P3IQaj7t
         PSRNTr5xfSSLyjcc/fhTcB7r23cLpHSMT4zs9ArJh4S5aV+RqzaTL0F/rUF5kxLKu5O4
         J6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377370; x=1683969370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHzhmsWqktLrOA5BE240SCWGZ+llExqrezYIcVr/Xao=;
        b=DDI1GHrktTDtx0MeqKwnFOZfbYExLlqyuJApUN76P2tAcZvGMZsrc4tLrF6pm/26zB
         UcABcnCMQNEQZ3YJK/Knpavo38rHpKob1vklcwOSBCqqzQxZyg2w1EPXlfbdcH2NpAQk
         5IThXhkPRrStAuuCPFAzu/A0IuoHAKTKFbpMzFrJkcMDY69Sbl4KNUChBUpr9uj7ongL
         bnfVvDJxsGJoVaiNvMxNcGvskVeXlUkiOV8mC6QQHbISbkhr9Ed3m8HAk+545FfzBqDT
         5PvV6lzYjf4367A5QDYY73aLV6nIQpU+g0r560GnsOMrlxIpPUNnI6Gjeng4/apMST7v
         BtkA==
X-Gm-Message-State: AAQBX9f7wQC9fKvmi1BRFnaAzBAiPntf3dgSNp3P7O61xWlrBAueWqAp
	3tnC0mR5mGtNBxtccQ/Q/v7LeQ==
X-Google-Smtp-Source: AKy350YuIn9I7Evu6S1C1L2mbS1axljreAGtf3k2xJ+doZ4W86qjQ/jHROF81L/c/FLQsY/Kcpu8hw==
X-Received: by 2002:adf:eb8b:0:b0:2f4:8e52:b603 with SMTP id t11-20020adfeb8b000000b002f48e52b603mr983113wrn.64.1681377370450;
        Thu, 13 Apr 2023 02:16:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm851479wru.20.2023.04.13.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:16:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 1/5] python3-pyproject-hooks: add missing run-time dependencies
Date: Thu, 13 Apr 2023 11:15:53 +0200
Message-Id: <20230413091557.10659-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413091557.10659-1-brgl@bgdev.pl>
References: <20230413091557.10659-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179962

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

JSON module is required at run-time by pyproject-hooks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
index 9aca5918ec..e3893d51cb 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
@@ -14,6 +14,8 @@ BBCLASSEXTEND = "native nativesdk"
 # Bootstrap the native build
 DEPENDS:remove:class-native = "python3-build-native"
 
+RDEPENDS:${PN} += "python3-json"
+
 do_compile:class-native () {
     python_flit_core_do_manual_build
 }
-- 
2.37.2


