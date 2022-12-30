Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656B8C3DA7D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.25199.1672425547732704528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GgSyaYND;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so15677248wms.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LsQNqGjGUXboZDYyvDJl27Kzgh8P8GPJLJL2MUA+Ts=;
        b=GgSyaYND5MEc2NQ8rSx3ONFvIJ6A3nQnWjPE+cSNhicaWI2OAaGNlLrgs0da6+WS4b
         58rEDlUkK5ipJdT/UZo6oPDxrkRpX7cDiKFiZBK1AIb4ZQqkwJlQhFbtbKBKJ+jxBngy
         QMt/Mpow8JjvWNtOVlgGshPEq7kDekABRhi4AV/z74ZUDqTMu6iQcZtvOHO2/Le3exti
         EU2hrFr4fQuqIpumMW9kg7M1hqctRXFraj0puSdj6COqOunP32zoJp+CS2LaHHtzecaH
         lJlG8uGwzgHrMrMZXXzFyu6xeLgVX96f00Di+0bnewlENCOBdUBCr7Nr3IfGuR/B/nC7
         0cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LsQNqGjGUXboZDYyvDJl27Kzgh8P8GPJLJL2MUA+Ts=;
        b=pmW7/vqo6vRiNEBupMSKt/j18N2JB0oxuCD87EjTPPnz/I+IbOB5BQwTZoIZyVD4Fd
         iDh0S9PtOG54UyWYTU5z6M7ph3nS5JjQePetAwSAoe7mqMGs5qOycJqw5gHESJYLNZsV
         eIbrqJd1tGTjRVDHmXmFcyk1VVvNHTRUntAYfSimZgFFk/xvBTnpS8AriyB44Z5PCeVl
         /sMOqrjt5lkdJ1uqPlKbcfA18GR++3Z+yYAY2UHsYmazmQsyn5Kl2B8Wb+tP3OGo55zK
         mXMSZbfDjBRZEBjktbltNPq9eHiIXPpeEjHs//gtvIX/oixNdPIK7cKxNtZCKAgCJ8yT
         7Kag==
X-Gm-Message-State: AFqh2kqP6Yw5mgxbczr44AO9dSKT+AYu+k/JcaHXrSF+B+IEpCabmDSU
	IyhOv9Ud2X5WAOtGVujyw5wJRNxjp94=
X-Google-Smtp-Source: AMrXdXsKMrMK0D7Y62ag8u69aUYqcWSqf+JXM0npfOLw8haN/hEv+oGVSQbJqJqgOFJlWpHmIPo4Bg==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id n2-20020a05600c3b8200b003cf900cde6bmr23385591wms.15.1672425546324;
        Fri, 30 Dec 2022 10:39:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/11] qemu: disable sporadically failing test-io-channel-command
Date: Fri, 30 Dec 2022 19:38:49 +0100
Message-Id: <20221230183850.3089510-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175173

[YOCTO #14996]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b63c643dd8..b58719affd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,6 +80,8 @@ do_install_ptest() {
 	# Update SRC_PATH variable to the right place on target
 	sed -i -e "s#^SRC_PATH=.*#SRC_PATH=${PTEST_PATH}#g" $makfiles
 
+	# https://gitlab.com/qemu-project/qemu/-/issues/1403
+	rm ${D}${PTEST_PATH}/tests/unit/test-io-channel-command
 }
 
 # QEMU_TARGETS is overridable variable
-- 
2.30.2


