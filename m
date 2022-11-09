Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEC8C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 03:05:03 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.2074.1667963098025499655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 19:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JroXay9R;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id x15so9751928qtv.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/K4q9NcB8EulhRJNwWwTIY5rAGldyXj7vFFh5+7HRk=;
        b=JroXay9R2Ysm406cShfcoKd78iocB06KBhmIQqRTF30rSn+kcro7enCfEyADJ0RKGL
         7m36S2UoyIy8f7ay8CO1FlY8/fmCSc2i3V3Q89ImeUXeNA0GvnY2+34dYRp8Gs45JA+j
         n9PkrnaJiAywMoxbqD0XCD8R2UrQ00GtcTsKEFreGjhQR8MFBRlBtdjKGIGPCVyuGez/
         4TE3ZbUYjliWaycU+TNoW6HTUCbkX/EdgQu3XBMAiqynLOeJt4fEE9wqawNv0MIOLm4D
         6k1PsetoouDyFCv6hfCtAbsg2UTEy8W90Iv1/AVENVNXSwPaJtxtaks78xy4CMa4aZYM
         BiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/K4q9NcB8EulhRJNwWwTIY5rAGldyXj7vFFh5+7HRk=;
        b=hvSYuHtHKTiCa4+Mkz3K98HBoDjydqS7hlSqpEUHWrgrn5e3MBSFdUnGSeqRGlYfSH
         0EeBShL0SfKHdnn6nzgXIpISb1WA61fBjnqtH+oISAA8BWkHXZPeKmH06JVpvmhOf47w
         bBgtRMglD0hI3HBd3Fxn3lKEe5QLMyU5drglGYKjATpYQsMVJ+h6ASzYoc+NQngzZXiH
         EGKoEgFawA/CG+BiaEH8rv2zJOLSf9A9w2wpGg+Zi6opnRmhgNL8tWI4l6GYskfzId8C
         ALkoCww4LGaWxbUkJOWIse1bNzyqhOc27l2KG6k10q1iDZW/L8HyH2+PFwVD7hwt9+Yr
         +BUQ==
X-Gm-Message-State: ANoB5pk9QZhY/PfjA7c+U98hZBdEajGMdkOXwPucOU9tdk/QbiPfIGpJ
	dS66JTTQoJYXUSpFeMTHR1t2mrZhV3A=
X-Google-Smtp-Source: AA0mqf7RV/RnjMnQ26aEcrN27LaHesURPYR8nFTQYuJSQ18c0biz1m0FhjZuqqp6Abr7H3TVVkQ1EQ==
X-Received: by 2002:a05:622a:40d:b0:3a5:8b89:8258 with SMTP id n13-20020a05622a040d00b003a58b898258mr10964879qtx.664.1667963096903;
        Tue, 08 Nov 2022 19:04:56 -0800 (PST)
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id l19-20020a05622a175300b003a50c9993e1sm9273695qtk.16.2022.11.08.19.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 19:04:56 -0800 (PST)
From: maxime.roussinbelanger@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH] mesa: fix runpath with native llvm-config in target sysroot
Date: Tue,  8 Nov 2022 22:04:44 -0500
Message-Id: <20221109030444.2414546-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 03:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173009

From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

llvm-config is copied from native to target sysroot, it shouldn't be
allowed to use target shared libraries when it loads.

Remove all runpath so it uses shared library from host system since
native llvm-config is compiled with hosttools compiler.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 67cfb4f6c1..abc2c3f4c4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -61,6 +61,7 @@ do_configure:prepend () {
 	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
 		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
 		cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
+		chrpath -d ${STAGING_BINDIR}/llvm-config
 	fi
 }
 
-- 
2.36.0


