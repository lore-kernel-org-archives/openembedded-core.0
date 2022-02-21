Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBEEC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.4688.1645478666262853226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nYoH67lt;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id z2so5241385plg.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1dEeEM7O/kcVvEVIjSYLF/yWoBvDrNA8gSBfwiQVOSQ=;
        b=nYoH67ltsILMZnLETzGJOL0fjC5SV4Q0qEEoVJYiBeKPgOI999Esmm9lhXstoKxgJb
         7Px15sRS7BhMJgumnXSHJ62BNSLUnlpgTOdJqQOzS4jp2I2CfAiYtZcIBLXnWyFKCB+f
         knmwFTePr0+DgZ6uSGD/R9izw1oTmFoMEREjEI82VSrZ3KBmgDy4s0uJ4nCZ8i9aahbu
         IqFk11Ud1mhlzHf/emCbvE64lsMf5pI5yrvRGT44yrymkiHbHN2h/cayX6piJDejxnfk
         l+4MvFyOyOKZ1e6s5371AGtRAa4hu+l/HjPam5jlLNvNntkBKo2cH8Z3k5Pno1f6ks2m
         sCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dEeEM7O/kcVvEVIjSYLF/yWoBvDrNA8gSBfwiQVOSQ=;
        b=FGCas4Cx59/PBQYwlsO7QKqL0uUEeepgBrlE/bAGujNNou8v1FXhl0JEx2N5ZrIa/G
         D1pCQ6MlqDmzHh+6oGUI1THmedKKQoQ/uX5vJY7+K5pUNM2jQoRlnu9ckreZMRMGYeeS
         ZszyBjfntEBvUCBsEmL1aRD1caprEVqFJUKwotEWRu0KdaMg1Zed4V7rQtJgHjhb8lcc
         YskrTScPv2petA87S0HCDykR6Bu+85cHxAY0zBjN89H2kxbr3JEoZlTB0/ehA3FXOqRf
         uUx4kmMQFIiT8opRCISrvjlLxwGQv6n7IKlK0YlDFMblOrJP9jsBuRlntirn+RUJM453
         s3UA==
X-Gm-Message-State: AOAM53359BQnJ0wbB+qQ2o1rMd4dHQut2IgE2cMi3zwGTSAwmcKDydzH
	Vg7d11L7hITx6oaI+EK13x9k+AG7qf3uBA==
X-Google-Smtp-Source: 
 ABdhPJxRknd2qnHHrmLvOR6dLIw317T5H9xLc9TvSMwdUTwJ2BpIJUT+o4i87ixRGj0OMquEVeHr+w==
X-Received: by 2002:a17:90b:fd7:b0:1b8:c872:f98f with SMTP id
 gd23-20020a17090b0fd700b001b8c872f98fmr826701pjb.170.1645478665371;
        Mon, 21 Feb 2022 13:24:25 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 15/32] python3-pluggy: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:30 -0800
Message-Id: 
 <83fa9f1f76db0dbaec4e649bf19032496f5e1da3.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162091

Upstream provides a pyproject.toml which while it does not declare the
setuptools.build_meta backend is compatible with it.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pluggy_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
index 14a7ccb0b0d..73bbcb02697 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
                    ${PYTHON_PN}-more-itertools \
 "
 
-inherit pypi ptest setuptools3
+inherit pypi ptest setuptools_build_meta
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.30.2


