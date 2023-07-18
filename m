Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F38EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:42:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.6521.1689684146482204448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ITUN+kOw;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-403af7dfa3aso46263741cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689684145; x=1690288945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoeEsAlcUCMbseZFDS7iqfZppJqx0gvoTithYLMWHm0=;
        b=ITUN+kOwGCV2Pwq7ycHCBAr50deaxdvEF4UQoQ9xkTE5Kd6UvRCoY8b2F8rNrBLrhk
         6PQwcmUEkC5rYdBo7K19jq9a1fRw2Gb6+3v4ML2UFo8zoBhWE0eoHghUn1KfW7KgCygW
         YgUeyAQfF6fVTWFt+/2PtnHNkVE0OA+lNqQK5g63uDTIEwXDbglNNBK90iJUnaIW6or2
         5ynavu4NdDADmDCI2s8NyS14uXN1en2533CPOQGmDkXJLiPFFTunk4uqTuz1BifcZH0i
         CN5BgkTYzACokuB9BUDzXdS6077ncbFOaVleOpCt143WcWdWCTHZEjYAy8VK35s23nXC
         LdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684145; x=1690288945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoeEsAlcUCMbseZFDS7iqfZppJqx0gvoTithYLMWHm0=;
        b=elNnAmEmhhJCg32GZhP4iF35m92TsV5U2pjIqwB+gMWncES+G+KQ+hkr616W80a6D4
         w5PzZoAO0pHv7DfvmYg7pC159ucYy6FON0VgpiIF4JaC8rsh4/ZJBLPd8dfja3xqsUhb
         p7BLZNddOW2rWOv+4EnLItQsBRZliuHHHvGYpK7E5vcQvoFeWgpiF/+vX4EYXqOwDS6H
         5uK9NXEr/mvh6Tlucj1nJKdQJ/B9/mXXiw8eurRqH+ToXPuYzjWCx8R6/e250nUluWF+
         dMR/V7lqpqLudr3YRLulqMxioHRgy5B6dedKNfSrXaHGrsOBtW3yMAo/gw3ZfxAr03sS
         Mc8Q==
X-Gm-Message-State: ABy/qLaFVHA+Mwc14ZrPN7A+2w+Z1q4P660zqsfLskq3FYero05YhrWk
	L8wAPqdo253zxaCxRbvNwITpQ19CpxkozJNXkIQ=
X-Google-Smtp-Source: APBJJlFtPDqFkuj9BYUWPuRgkFFWkOM4Q5z+BCzdbNg9YRsDhRvOFDXmhOVkcD5QoVTN6nWW1XvktA==
X-Received: by 2002:ac8:5a49:0:b0:403:b395:b450 with SMTP id o9-20020ac85a49000000b00403b395b450mr19295230qta.2.1689684145093;
        Tue, 18 Jul 2023 05:42:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id s13-20020ae9f70d000000b00767e20c4267sm555366qkg.61.2023.07.18.05.42.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:42:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: ensure ptest regression capture
Date: Tue, 18 Jul 2023 08:42:23 -0400
Message-ID: <20230718124223.2040772-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 12:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184501

Add a conditional echo statement to make sure that there is a
FAIL emitted when python3 ptests regress in a way sed doesn't
catch.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index ee1130284b..efa84555a5 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v -j 4 | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+{ SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v -j 4 || echo "FAIL: python3" ; } | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
-- 
2.41.0


