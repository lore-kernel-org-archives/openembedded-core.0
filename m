Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D479CD13D9
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.27137.1694943551371207073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYvvqHt3;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bfd3790178so36940271fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943549; x=1695548349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I75PL7VgJt+NbiOmK3xFiDTGsRffpDgg3leyzFPIBWA=;
        b=hYvvqHt3xgthY8gcssb8SExsW4Z6Ze5jtPXEgtd5JvhUD1d/n4d1ty8N9EyHZh0zhf
         ihII7Ag6ijsw8C7bi+X5Rs6lJO72CO8RIDssZlIELx5mtJKr2lAB7O+voUy7vi+YgjOh
         EIFnK6l2xkEhzxxvR+J/2aiWddVFjCB6gNXP7fF1VYW/8slUvmu3Wd78z5LnqFHtkg/r
         FHRyuY4P591++TAQEt9ACpYOr8GTObidhxp960RKTvws9Ngch+i8FUeOb2jU2eoyiAU1
         29vDRZh9KixJir17cx1cLgR7DzSOEq0nCKToS+Y00ybAk5r5N4FDqUOLRi/rLgREBjmw
         ghCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943549; x=1695548349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I75PL7VgJt+NbiOmK3xFiDTGsRffpDgg3leyzFPIBWA=;
        b=avuhAqRI+Yc9reySDO6TJFu11q1OOcUxEB7xVbCAh5AAXvR/cwaaCoC71tKkj0xz9C
         wf2LoqRzLCDvUb5s68sDtOH7cyxB0nabZv96qRwn6FfXK4fAFB4mRYI4b3EZgDahJFv1
         8Q0i0X7td3ALKx6MLp8T3g5GukPJhnyfGLdUtOfOLEjb0RL7pv1tTfbbTOAw3uCWSUVc
         1IFhSd8ksGyd9C41Dc+Dd6ahWuA/o34xAxx7nWSYilvi+ofVpUCA9DV4x2B+IkcuCx5U
         7mqk+cmVo1ehnA9cATolyf9hxH2gVUU2OGc1lxtE6WWf43q25x0sm8CRABj3+xOoahal
         ieTg==
X-Gm-Message-State: AOJu0YxjSkZ/PW8Pk+pfp/HFLcpRpot+tcnuQ2iNlgR/dMfz6yi47uY6
	h7+VqL8k4Vkx5kwNAoamfKF9ccPkjUQ=
X-Google-Smtp-Source: AGHT+IEIp8yJSq0gXQu0vwVXrVzrQ5AiOIH9iOaKxs8R85mB309G/zfEfuswC/Hh5+Esv4qtDsDy8A==
X-Received: by 2002:a2e:1f11:0:b0:2bf:f497:52d6 with SMTP id f17-20020a2e1f11000000b002bff49752d6mr2640192ljf.22.1694943549248;
        Sun, 17 Sep 2023 02:39:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/29] perl: ensure all failures are caught
Date: Sun, 17 Sep 2023 11:38:39 +0200
Message-Id: <20230917093901.428214-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187780

Sed expression may miss some failures, and | obscures
the non-zero return code which would otherwise indicate them.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/files/run-ptest b/meta/recipes-devtools/perl/files/run-ptest
index dad4d429160..0547f818b22 100644
--- a/meta/recipes-devtools/perl/files/run-ptest
+++ b/meta/recipes-devtools/perl/files/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-cd t && PERL_BUILD_PACKAGING=1 ./TEST | sed -u -e 's|\(.*\) .* ok$|PASS: \1|' -e 's|\(.*\) .* skipped|SKIP: \1|' -e 's|\(.*\) \.\(.*\)|FAIL: \1|'
+{ cd t && PERL_BUILD_PACKAGING=1 ./TEST || echo "FAIL: perl" ; } | sed -u -e 's|\(.*\) .* ok$|PASS: \1|' -e 's|\(.*\) .* skipped|SKIP: \1|' -e 's|\(.*\) \.\(.*\)|FAIL: \1|'
-- 
2.30.2


