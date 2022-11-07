Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1065C4167D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4132.1667832923527943959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EliTCS3U;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id y16so16550496wrt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPJzqbaY6Hw9h3DmkQOQeHAiC5ybFw9920IEG9ZzQxE=;
        b=EliTCS3UzFV5G0Y8w+NIfm6nhmY4RHSByMzv1+JJSJD5tKXNZhMEsklePBfFW7auwv
         Py1S5X0zfCoCGOEQyjq0Hahqt7QixQxlfKqTBrWy6fXjs/ZyZ9KhOYqM4NNTjlLS4hCw
         YNHQlPn66TvL9ay9Ih6PrdI9jltFYPc+sJ9lQO6tyRTKmdvV7r5XbxdF4dHxVGptnpLp
         e1+tgkbBRfF06AOKWFMIRrcYz/7rc/L0EUmaSpe3KDsusYUV9xezEr9cH4IcPQNUxn0s
         cZ8jg/+0BL0BbZABHHKTpt+kz5F/e0IBBtLTNOuioeWN++KAUlun/zFTqZJLo9HjM+iU
         fpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPJzqbaY6Hw9h3DmkQOQeHAiC5ybFw9920IEG9ZzQxE=;
        b=LVWHdvSSn3r9nPrIWiQ+XpggsMeoX3VrGvBPjLADsrjuUWSG1Lti7C3l2aAx5l8WaV
         qn+S0TVsGL4W8c5jcSbCuvoj1kPCnoxKD3gtMINiBknjV4gXu68hnlaL62M4UiEvvTOa
         U+81g7VTYoSB0IpKNeFyKzVC4PlzgRthOVM8PfCRUBfvp7vIvhbRGd5TGomz1u2kfYq8
         bN+qpBxkyCtJkANkfB92nCUGgV/aPI+3DEZ3MPNvv8S0//bXI4/KFKijCJqSRr9or2FQ
         943YnR55ZxUa0/s2+3WfyoXqNRmdGA28Lp5/QDRZGGuu70KvrxHJTC/MPDbYW6Dxg/fC
         5PeA==
X-Gm-Message-State: ACrzQf2v3grpsA2AgE5Ii8h3iP+bvGyfGmYFAwIdS1hGN2w9DPfz+7HQ
	nOvP7aefJcToZFCU6iP1TeyidwbE0eo=
X-Google-Smtp-Source: AMsMyM6EZ/Ki27IacX4BlsesvGpdYy5TuHgHH5Ji55T2WwLNXEYtKHVPAB9zA+atcEA7zTOGIcvvig==
X-Received: by 2002:a5d:47ce:0:b0:236:76de:726c with SMTP id o14-20020a5d47ce000000b0023676de726cmr32773255wrc.510.1667832932995;
        Mon, 07 Nov 2022 06:55:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/48] python3-setuptools: upgrade 65.0.2 -> 65.5.0
Date: Mon,  7 Nov 2022 15:54:40 +0100
Message-Id: <20221107145508.1051404-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172870

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_65.0.2.bb => python3-setuptools_65.5.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_65.0.2.bb => python3-setuptools_65.5.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index c8c713c842..1b5f9c7577 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 42d349031cd952c12620fcf02cbab70a371f4b19 Mon Sep 17 00:00:00 2001
+From a0e0873a8ee6674d43e604d66bf66d94fc8eeb6f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_65.5.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_65.5.0.bb
index 1a639ea333..8198cbd104 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.5.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "101bf15ca723beef42c8db91a761f3748d4d697e17fae904db60c0b619d8d094"
+SRC_URI[sha256sum] = "512e5536220e38146176efb833d4a62aa726b7bbff82cfbc8ba9eaa3996e0b17"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


