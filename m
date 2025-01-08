Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0163CE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 07:15:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.13806.1736320524255061944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 23:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGadiFll;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30219437e63so5227141fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 23:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736320522; x=1736925322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y89pLWdi1pTvoBvzubepW3XaDllLrfahaoYvXdf6cw8=;
        b=YGadiFllKvdJQo09xlIpYDAWVnvAaZQaw31AKOKT4pE7twB9Uwbg8s5F4wsSDygEph
         hVaKACACrjVKxGtwty6dWCa5NX0DYv0I1uHf2CFRswgjXAqd9Y99uyjPkiIH2fjZ6iBu
         Azt+xqpQdieRe4Ey029FmFwIwv66AyTNVA0yr7GXV1Rd1aLugXjtTtwubiGcX9SxIodb
         pWqjfaPOJA4axbZChlWXQprx59OKey3AC2qz4LFCLSSeDpx5+2jJ29BjjlV9j4kFgCph
         kVoB1FJeUnIwXyFrVgAzth+kFydkyTDOr9O8uurt7mVXtSn1GH54ujYKciip6yWa0Wlj
         ZpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736320522; x=1736925322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y89pLWdi1pTvoBvzubepW3XaDllLrfahaoYvXdf6cw8=;
        b=B02QY+gfqJWfxUDetWaO4OiySoRbEEM736j8NfU6Nl/JoNf4n62n8XV+7dZyfzDzB8
         Vs9nO7Arqu4zswhBhubMCHqosQQKGa61KUscdAcdV1XLRvw1fLr1aLZ+hX8MXaEjasdp
         sN6noQJYZqD7n19dwlkrqNIozXizcmFPU3hGok8zJD7UOVXCC6KDqHhuCAEcZhevvC2N
         svww/hrc50DM/vV1qxP/B/OXmgeByNy64SzmPR9jneMpcm7p3OTCjDSNDRQOh4qXR6Mb
         43+JPLZH6uiIKBre7AtSQZb+8ORUrujuPuOmoeZIgPXBZl4s0L6w7X9zr3FfxXY2+agT
         Rn1w==
X-Gm-Message-State: AOJu0YykR8ceHcyTKJEv3FlJCkplTOa59Gq8utESt6KGVHhPEQ+JFZER
	FnxlUbP+JEb+hs6E6OGhFGuete48T5WgQNAB5fwf2i6hC5hNT9D40FnJYw==
X-Gm-Gg: ASbGncs7UYxuhxSrPSLTVwgXzdYx3t+Iuvc+U15dJUteAqYE+fnb+LqtprJ6G+iu1zr
	+3XkezTQr79SxAgayWbc6uSg3J4wALsfexCwDSxCdsDzdlxfN091bsZx0mAfaeZJ8FUsMvz98VW
	vCj1KAu4E63DWY8byWXt7T8vowqYpz8nhoUpp5sziB1EsUo2YFWqvWPICxF4qdF/S2LJke81Bdh
	LZZLIan77dqZgXobmIighLzbPwO6QaanjG62Yx51Hp3siWah8uoEv6XaHGY
X-Google-Smtp-Source: AGHT+IE0rAnpK1kaETv5Z+CYYIrktYUJLy7fsc1DG1GIA6y9XBvr2sMED7CRMX44q33uGPmWHbvwdg==
X-Received: by 2002:a2e:a6a3:0:b0:302:49f7:1d72 with SMTP id 38308e7fff4ca-305f3c1a0eamr4798521fa.9.1736320522039;
        Tue, 07 Jan 2025 23:15:22 -0800 (PST)
Received: from ltbabn.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adab988sm61765641fa.51.2025.01.07.23.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:15:21 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH 1/4] multilib.conf: overwrite conf files for debs
Date: Wed,  8 Jan 2025 08:15:10 +0100
Message-ID: <20250108071513.2807528-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 07:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209517

From: Benjamin Bara <benjamin.bara@skidata.com>

Similar to OPKG, overwrite conf files for APT (deb files).

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/conf/multilib.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 7bdfcd56aa..979ae50c72 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -21,6 +21,7 @@ BBCLASSEXTEND:append = " ${MULTILIBS}"
 MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 
 OPKG_ARGS:append = " --force-maintainer --force-overwrite"
+APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--force-overwrite"
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-- 
2.47.1


