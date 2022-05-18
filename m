Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDFEC4167B
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.3534.1652871532703452603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7Sji8Te;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id kq17so3054921ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1T3S+D1zkh5nratcijLpZ3nqxYuGSZLIysAJf9bZ04=;
        b=L7Sji8Te97dsIXfclZccCQuiEJQPYMlNUDj5g1aQXz9/1lpx6j9WilCkRqJGmq3GNt
         ObLweCMf1yqtJ0r8xM7rmFGxdLoDiR/2nCta5THAqXCm8qwufHtyAofN54YX/qi4RxJE
         cuwCQm5uuJOMwwc/IJViv0iGOltkFiL1Mp2pCF1k+ezUPS48AyWYLzWlhAia4NPT601E
         ziIG9wG2aI+Zn4yLkCRCGWrqUBv1DO7ex2EWYVc4ZVAdsfInS6qQ2h59SpKTVe29QsV5
         lDZgytGoAub9xQC/r7CdsbnrNEqJNIBQOeqyMB7NsIbnalZIzT3uFyE2eKeJqyCpZr7Z
         cQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1T3S+D1zkh5nratcijLpZ3nqxYuGSZLIysAJf9bZ04=;
        b=IyA3R7ELuciIjA0xvGvqX7OKFojXrUX+y5q33jC13WihpPnoBpFdRt0nTDHU5/kLAy
         F/hEtE4+xtTT19OT5+UGcFqoPRihopUuBsW9hMM6o7vVwXxiQfrO19ocvqVGbrG9a4Dq
         qgDBxClpAo6yIQ6psE5oPyRIgITEZhpTwYwd1AZZrKwUh7ZFfXT5WTmSwRZ/RpzoSKST
         VW3IZ2WJ7MuLzFfM4X4lYwJVYA+ChtUSRxEthVRC6Bgw0U2rpNvS1+OlOB0c9xVj5oi2
         QzHoMqs/5fkrjlXzDyPxyK/nnPX8T4PTfVHbjfJHTJX6y1D7c1Pv0lEiGx7+hU1i5iwk
         XU7Q==
X-Gm-Message-State: AOAM530bIGL1oEQcq/vXNi28gyEpidKLesNNhjUTyfvsPBbMYKjO/Ujp
	O7eOJK/lGcCitgojcF128c8n2d/1Gwc=
X-Google-Smtp-Source: 
 ABdhPJwn0UUUZ5dl+90nfi7Tv5q1MwK43K7MguNasXr3rO+8dPwzoHCIY8KfBVB4z6sH4g82uCGSCg==
X-Received: by 2002:a17:906:a5b:b0:6f4:55f6:78af with SMTP id
 x27-20020a1709060a5b00b006f455f678afmr23911289ejf.238.1652871561880;
        Wed, 18 May 2022 03:59:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/49] piglit: upgrade to latest revision
Date: Wed, 18 May 2022 12:58:28 +0200
Message-Id: <20220518105843.3299331-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165831

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 6635aa3c8e..28f76fed37 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "555617f7fb81afa75e3743dec7b7ce7c01dd6c7b"
+SRCREV = "65892137809f7d0d4d7d65dd84af59902b3e7f1e"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


