Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D164C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.40952.1684291498820218794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SV8mJ/wz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ae4e49727eso3831565ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291498; x=1686883498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7t/Ch7tnJjB3lb1+DwlvX2xLzPzzO4Vh4D8+qEIF2DM=;
        b=SV8mJ/wzVqHvhOLHsIHZFbtyCxzt0c/AU5ALjZCQf9wSQFaKjogh7she2JQ8eGhqBT
         iFhog8YI9istMrfPwuD7eOPzYU6Ot7u00rWotnYhpOyv4/Sf0InG1y8LYBp2Da4J4vC9
         AXIX/CO2BmERUf1vaToyiBdoXQLHdJnm98drClNsLdQNAHsw/W7rW8vnowcHnc9g5sW8
         81hNWDiEhTBbCsADSR7qHHczMGRXXM1CVK9A+4zhP+L8dKyNTZISgFUIV+fYBs2OFogs
         8hqc6Pj2Gtp8FZtMoRBvUuNrS+sbgPhiczfXkGuWSn7S6EsZx+b9mgeYfCl7pX41vj6g
         4+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291498; x=1686883498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t/Ch7tnJjB3lb1+DwlvX2xLzPzzO4Vh4D8+qEIF2DM=;
        b=iw6da6VLtoREsunylwknaRIMm6IkQ9PTql/rpTPISOArPXBuZVitdN5VjqshGskEgH
         lf0icMr+i0evzKQ6B1Cl4hyPD6Y/dZqi4e3iWX/z2mcDD1JMmvl2//2KAeil6Nkr4AK0
         l9SsVqPmt+Ogu25X8bhZaElxnKggOFCGVN8TkQ64ptTrlkgX29eA/TyCpVChHqTYgyeO
         n3gzsRdvcXMzjF2mRt373pguCATo1hEyd/v0kedhRI/PZ3g4wSr2dmgOQTp5m3FD119o
         lkLhq5voEWYrK/deuMcmHRC6WM6c4GYpd+I987PEt0nhvNauyjN0GydEy2Y/6b6ft0lW
         SYTQ==
X-Gm-Message-State: AC+VfDw5LqPyKiYQlApzwuGoXM+0AfYP6gbJY1ZPA6FQTdWe+oHm9K4g
	7qug5Qn+q/hhnQkPPJLJF6bRN7Ub2yWOrf80qjo=
X-Google-Smtp-Source: ACHHUZ7vrO5nxDUP/Ml7bTaIUrp8wAyDK3vLe+WJep23CddceSHlQRFuOz9V4QwXmvKuI0R5UC/33A==
X-Received: by 2002:a17:903:2804:b0:1a6:d2af:5a3f with SMTP id kp4-20020a170903280400b001a6d2af5a3fmr34094686plb.3.1684291497932;
        Tue, 16 May 2023 19:44:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/13] python3targetconfig.bbclass: Extend PYTHONPATH instead of overwriting
Date: Tue, 16 May 2023 16:44:30 -1000
Message-Id: <cf31424aa7ce3308373899181aef0e503ead4776.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181436

From: Johannes Schrimpf <dev@loewen-email.de>

[YOCTO #15108] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15108

Since the latest change, the PYTHONPATH is overwritten instead of extended.
This leads to changed behavior and build errors of recipes where the PYTHONPATH
is set before setup_target_config is run.

Fixes: c9617c03bcee ("python3targetconfig.bbclass: use PYTHONPATH to point to the target config")
Signed-off-by: Johannes Schrimpf <dev@loewen-email.de>
[Luca: add Fixes: tag]
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2442ab92f8610784d28d8d83056b643bd95b0b4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 22305fe176..08bc619398 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,7 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
-        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata
+        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
 
-- 
2.34.1


