Return-Path: <joel@jms.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0CDC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 02:56:42 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.19615.1664938594566672296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 19:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kI86Crkv;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: joel.stan@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id r18so1138083pgr.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 19:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=eUpr6W9z2VANCeNwBoI1qH+3XaeIaG80KhK2f5gUlp0=;
        b=kI86CrkvK6DLz2gurhvIxLaNNx+b6NvbteBhj7JoGJopRRyJ0nhGUQTLsujU/ATtGp
         N1op4QuIl6tWHx0sGrMpiJDPWY/cUkXtnSXVRVndPD23yTcSwr+UZ5g8sLtkQmKb1q7p
         xAyVbKKFj2UrZ5jJeCguyq/LeRgVERYMFJbU1mOnUmozsXJfW3sgPO8nNHxKAo5AMbvK
         0uBztVMlxJ0ZZHMgXzW+F9nCEPI56Jrg4cFVvykWBiKS4Is8tczMXlIweOoKWyHvpZFS
         bfrORUbxislvcP1HcvlzS2Sf+EsTPNxUgBCGluLhZcKFa6MqyIzmsXCMvCApGov54KBr
         Ho+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=eUpr6W9z2VANCeNwBoI1qH+3XaeIaG80KhK2f5gUlp0=;
        b=48yvyxF23rug07lrp4RtSH4zeERXNsCkxee8cFDSfHkfno/ieucRC/PeqsMbEhEpUN
         7Fd6SvUCddPE22t/x0Ma9tmztHoM/GiLtvtBJRTm4B46XMNSx1MPDW16ExDiiChYkZuJ
         eEc/kWAEdXzH0ciA1V9zd6axDq/n60ufKXnb0Kts9BkgyPJjE9aWLfRarz13HpwYpA/a
         oITVyTW2pHgcxig1f0XG8ifLHPnnClb0GRE41gN2dQJzXjD7ssJSRBoqWJIMVr2dLTsv
         AYoAvAtqyWCQfM62/JuEFY6TloEebw8TZQCvU/21J+fu6VJRxvXnNuTuaT0MLe1W+Gqt
         PWWg==
X-Gm-Message-State: ACrzQf1PPXsStiDMxDE8pELco/dF+U8lU7zWlS4oqanyYCivy8x5yttx
	8yDlamfErojTbUFeJfu2hcWEYML0aKo=
X-Google-Smtp-Source: 
 AMsMyM5EEZEwzfFbE3l8weTEydQtqj2yiBiLgJk3ZhMRPKRYpYAl6NEZ1MfhZYHh3a4zNhZro8nDAg==
X-Received: by 2002:a05:6a00:1141:b0:561:e46e:ffa8 with SMTP id
 b1-20020a056a00114100b00561e46effa8mr4311629pfm.41.1664938593354;
        Tue, 04 Oct 2022 19:56:33 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id
 s13-20020a170902ea0d00b0016d72804664sm9604242plg.205.2022.10.04.19.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 19:56:32 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH] perf: Depend on setuptools
Date: Wed,  5 Oct 2022 13:26:25 +1030
Message-Id: <20221005025625.64000-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 02:56:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171437

Linux 6.0 requires setuptools for building the perf Python bindings.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index edb133515423..c87880b2c14c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native setuptools3', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.35.1


