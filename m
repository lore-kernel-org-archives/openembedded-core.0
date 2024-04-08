Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B4FC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 11:55:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.104556.1712577300550483006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 04:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=elOXz4Jf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4165caf9b2dso10488475e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712577298; x=1713182098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmbXTpWN0A+6wjSRNsdpURDA95CYLT8q1xiyBp5xpJM=;
        b=elOXz4Jffe4WadYqacFwfuKxM4tTPu0XeVOVlZ01HhUfgYiXuFIrOI8f/3A3GuicIc
         0dgIpnGfpUgJoMNYIk7U2qOyPkVvKrEta6LNUOh1t78fubokuq3ov/E09gVpU2FOrmsi
         PHn3CP1tDR7uCBB1vYgZ2/nlXDjvgdOqjLVLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712577298; x=1713182098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmbXTpWN0A+6wjSRNsdpURDA95CYLT8q1xiyBp5xpJM=;
        b=e4IGN+r8AQXJQm7Vix9Cn8iLT5VwNSNiP8W5Ola2iBzUOHFmaIt8ayZHiOH1La47h2
         geiXQabWQNGXGlAsODwROS7gSTiHz+Mgw+e7yFab3vWO/7ED9yQgcb6o8jWTidmNaTtL
         aS4UrPGJkwlcJ2VxNsu/cdFy8BfVFDdVhljtGWVX83gldXYHJkOdfxPtcASfarTHWKT1
         tb33DvhDhXb/NvvIPkEqrZc/J+CC5ybT+zge1Vw4CUi2DGPJHeuhvK5gGu9zQITqcMK1
         p58kps0nUyYAVsGoDeOkY0llXTSjnY6ncleuM/tLGBPgdtCbydwLGKCQI91emKuut2s1
         hvSQ==
X-Gm-Message-State: AOJu0Yw3lDzlV6JlNAIyY/MvOaezcmmdF7XdVaUOc10ni3CovmR4GZDi
	J7dwACh79ow1vqCTlEnW9XIfb2k5aZWJfpafAas+KHW/oNBlp7dZqpCccchC0ljcS9EAKcKeJ4w
	b
X-Google-Smtp-Source: AGHT+IF0L3dzQCDzAXYfp0F5h6Wir3duecUclQJhvN7gXjFTTiHHMELcvmuMnvfRSTY9aSzJZ3Zk2A==
X-Received: by 2002:adf:e912:0:b0:343:d06e:51cf with SMTP id f18-20020adfe912000000b00343d06e51cfmr7273155wrm.15.1712577298401;
        Mon, 08 Apr 2024 04:54:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0d5:82ce:9fe1:f44f])
        by smtp.gmail.com with ESMTPSA id c19-20020adfa313000000b0034602f07dd5sm27159wrb.26.2024.04.08.04.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:54:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ovmf: update 202308 -> 202402
Date: Mon,  8 Apr 2024 12:54:57 +0100
Message-Id: <20240408115457.1739905-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 11:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198008

From: Alexander Kanavin <alex.kanavin@gmail.com>

RP: The upgrade covers these security issues:
CVE-2022-36763
CVE-2022-36764
CVE-2022-36765
CVE-2023-45229
CVE-2023-45230
CVE-2023-45231
CVE-2023-45232
CVE-2023-45233
CVE-2023-45234
CVE-2023-45235
CVE-2023-45236
CVE-2023-45237

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index f98cec8035f..97651faf62e 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0004-reproducible.patch \
            "
 
-PV = "edk2-stable202308"
-SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+PV = "edk2-stable202402"
+SRCREV = "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 CVE_PRODUCT = "edk2"
-- 
2.40.1


