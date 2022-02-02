Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432EBC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:18 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.2285.1643826497385971760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NEn1vjNJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id u24so355929eds.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ATq7/HbYW9myQZM1uHyCtNddOu69qUarWJKcsMEiWk0=;
        b=NEn1vjNJJhGOGO8TJ5o0ihoomVSIiDf3gD9if53wQdqJ8s+BajVaXppDfotf+xlqzp
         ynwVP0nS3t5TtLEoUZatd8Xn8Jp4gP8VjmbbwN8e2zkw/D167H5F5A0/8fWf1f6kfgy1
         Kr9ZvbRz9wT0mhqIjP5apZ1NHy+8DeyTFqesIvv48cK0IWuhnTU+iQfKaA+CDgMjhxme
         IlRAXylU+0bgRoufL7egGOAMXs0Py4B7a3YFIu9zpyA/8ffiF0dGjJeXGe41+VF1GAsT
         dwfmJB2dkhY+Ze62TqAHirLxpjze+YH6lA8krTIFfy5y5QfcTGGiSYfKUYalGK1jdOY+
         7J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ATq7/HbYW9myQZM1uHyCtNddOu69qUarWJKcsMEiWk0=;
        b=M58MJApPRgj9dYPyyTLv5h2qJIQssM5EVaFzvXV+Zam2dfldQU5VMPZHFbHgWyE0l1
         z/tKiSmtf/Z44+A5zl1T4gnub9RoukMThBl1dgrzw+QlM/x0HcOKixQnfygU0XOLPVsi
         RiQ0anli77+bBJ2p8FZmgjIZ/Ze3qTCIiWkrY5P2HzJuV1ZuAWukwKmxU7Thpvyut4aD
         1QvJ2YNXobkdhqikrZD3gzAqCeFdQPi/PbIKfiCCSLmFUeD66KZhXFJPrur/xIbozCiY
         meNaAE+FTyyPX4obkMXp8ul81dFwGsLZ2KkkI00oY8YzJC+In+VIMmigYWllWTH+vrk+
         WfCg==
X-Gm-Message-State: AOAM5328DcrPznTrPr4AlIXeKQiUMSpihkaXqt/xPG+UGYiCwzTTHUuh
	4PdPTiQejGxKlSJE2cRZgLw42HPMRWA=
X-Google-Smtp-Source: 
 ABdhPJyAF1HXgxQLCL6TQmssL3Y2QsPIT4qnKEjugQ+X0ew78PYBeslN28dPBR50CxUAqM/GOLQqMg==
X-Received: by 2002:a05:6402:2052:: with SMTP id
 bc18mr31098389edb.63.1643826495914;
        Wed, 02 Feb 2022 10:28:15 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/33] ell: upgrade 0.47 -> 0.48
Date: Wed,  2 Feb 2022 19:27:40 +0100
Message-Id: <20220202182758.919991-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161240

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ell/{ell_0.47.bb => ell_0.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.47.bb => ell_0.48.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.47.bb b/meta/recipes-core/ell/ell_0.48.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.47.bb
rename to meta/recipes-core/ell/ell_0.48.bb
index 1db0065a37..737302a444 100644
--- a/meta/recipes-core/ell/ell_0.47.bb
+++ b/meta/recipes-core/ell/ell_0.48.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9"
+SRC_URI[sha256sum] = "9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.20.1


