Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D8ACD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 19:30:55 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.36431.1694979048787331021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 12:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuyQaTkx;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9ad8bba8125so502251266b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 12:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694979047; x=1695583847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5sATXRj6L/T711doCcAe6E/Ks5yRZsgt5jYnV37HmA=;
        b=PuyQaTkx2P6ctN8HS6GDeDnodYyI74mT+BQgRtLhPk3zR85yilZz2jI459SC2D1kYZ
         iA4AzXyZAdSwaaiwzN3kV4p8zfFNqGbC1PXPfJyJI1orY7FiF4TTCb7mwCmHH70D0N02
         9mWlodKFAfSql0Gw8ugLWTw1+1EqjG38X3CskyrpP6mSvHbCMJ2gMQaWoSH2IR88KFZ4
         ASUxmHqZk7BJff7H0sY8IoeH/dJbNMzwjj3pzHUS6UJukc/a1LhJGfzA3kJ+6mUBrDql
         nQyGFxeFxOTEULh8/zxeqP2hlMbwM0ogyyqVZhMcg2zzh5TnFl/bkv2t1nEHGU3GFVH2
         r6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694979047; x=1695583847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5sATXRj6L/T711doCcAe6E/Ks5yRZsgt5jYnV37HmA=;
        b=ITALnVzk7VbJWBAsQjlrRsM0/356mCy/DY0xYZedBP1a3qSU4U688F760BDKHwxazA
         gWlt6eXLAitMOgmn+tnbmO3Yn7bKeIBE+mjwNY0s9EFIjgopFJ4Plw5KGE0BX9U9A6Ea
         2ATbQoRtlaSSsqQw7eyqeydTijO+HGPItNTF92xRyF1fKSquBiqCw8YX5j+z9Xyte4GB
         mK1I/EvWmXI47NoJziXa+sZ/qwys5flvAaxdYB8W0b2QxWvEcXK7lVREbG3a4wqWU2yf
         46+vf1Qc1GD625FewAFJfFOUc+cexZka90kl5J4O1SQeT2f4fx1DVVZHSCkZNycRKi5K
         1/qg==
X-Gm-Message-State: AOJu0Yz9jkLLxUkdUhelKFesafqagvE0NR0+x4vJhOJYi//H9zcRqqUM
	VZzdV0125flcNa6ICiFbyUCK6jdFAs4=
X-Google-Smtp-Source: AGHT+IHdhtQayvorDYXZrRgTxxsLzcIy2ELILclBSKTLJmP6jjuAAd2twTtPrT0NwzaqTGpQhsdeQw==
X-Received: by 2002:a17:906:5391:b0:9a2:185b:5376 with SMTP id g17-20020a170906539100b009a2185b5376mr7214022ejo.49.1694979046954;
        Sun, 17 Sep 2023 12:30:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063f9100b0099cbfee34e3sm5339361ejj.196.2023.09.17.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 12:30:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] igt-gpu-tools: do not write shortened git commit hash into binaries
Date: Sun, 17 Sep 2023 21:30:43 +0200
Message-Id: <20230917193043.513931-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 19:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187816

Shortened hashes are prone to collisions, and in this case git
lengthens the hash to resolve the collision. This in turn breaks
reproducibility, depending on whether the colliding hash is present
in the history or not. This has been observed here:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230917-br60if6q/packages/diff-html/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 74110b75d1b..529b374c7d7 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -24,7 +24,7 @@ PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
 PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/"
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/ -Dversion_hash=${PV}"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.30.2


