Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511DBC4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9378.1672830369815591871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DCL7VYG3;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bs20so30464727wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOmcHoLmIGVRLPS0Kk3NetBK1GRGguuwRmBbYKHiUGA=;
        b=DCL7VYG3+lU/lmcRn+lSMXHA0g1LHXupacZFtDG0Auz116nAKJRM3J8sI3lyRcojdj
         bOA9WV1yuFqF3YIUvgeY+hlRVhCwditqFz+0v4YRcRciecvKy7peLsVCbmVoUYg6smd+
         Hl352N77BlZqALXmoPu1Jp8xySuf6PpBAvszNpjs6iwP9acug9NVNTY64nRXIlgWDbsu
         NP3hu/qwm25rDzVs3Fvp4nLFD3G2Sr11Ea50ms/k31G5T+O90CDtxlh3l/0xHZ9RTVBZ
         bu+AbKN1Wzs4W3tgyJm9lXJu64OTIsR+4TG40/NH4H0VHWo1stSEFvNXDPHFgY8vZcX7
         SjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOmcHoLmIGVRLPS0Kk3NetBK1GRGguuwRmBbYKHiUGA=;
        b=FjyJI40jLz0/xJH5EZ+CjHMfgx0D1ktx53H+aQimspVG3ZHuIFA6IBlIUH76KevJO9
         S1C4IY4ciVTAIbBRbbaMbKvehmuc6ViCIfqmnYJLCer9xVjHV2H65N09t6dfJDg13wiF
         UQbopcVOTwM+dwkNhkg8JFiZ8PfR7jIPZy/ssy7zPeVEmnoS1m8VOILl4C2IBsb0d/RY
         HxZFItUyvaJhDbyrL8ncpQM2bwY1uaiURMaujdgTR5voZuk7k5kbzGmIlQuHtJX3aFk4
         2YRsvycu+UOGjgEo+fGFoAwfKapE+zw5QOSRxyijkEc4BQIahIJ2rdr9Ytv/9MnT/qGg
         10TA==
X-Gm-Message-State: AFqh2kpZYV9cjJDa8yD0hPJvqmYWj/q40quR3mWeVuNVyYW7Bdyrhild
	HM+1nl2gUroWJ5Br0m1xqFsYv11Nbvk=
X-Google-Smtp-Source: AMrXdXtXiZDFHW+5uCma4YnRHmIw+r6WN+UefNK/HDhXVq8d3O6MHru2NBQm4iarsQXWvK4lUFbNWw==
X-Received: by 2002:a5d:54ce:0:b0:242:486:5037 with SMTP id x14-20020a5d54ce000000b0024204865037mr30779470wrv.32.1672830402304;
        Wed, 04 Jan 2023 03:06:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 65/77] python3-pycairo: upgrade 1.21.0 -> 1.23.0
Date: Wed,  4 Jan 2023 12:05:36 +0100
Message-Id: <20230104110548.2537259-65-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175450

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pycairo_1.21.0.bb => python3-pycairo_1.23.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.21.0.bb => python3-pycairo_1.23.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.23.0.bb
index b692067809..5214a05d53 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b"
+SRC_URI[sha256sum] = "9b61ac818723adc04367301317eb2e814a83522f07bbd1f409af0dada463c44c"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.30.2


