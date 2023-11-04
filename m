Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBFAC4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.17267.1699127827455551509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wFbA6cEY;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507ad511315so4572946e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127825; x=1699732625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otxhn2Jl1X3ri8RWahdxsoh5Mwuc/b5JstsbYxc8Njg=;
        b=wFbA6cEYSfbFdvi9Db3mQa4ktp2d8Pwy2x/Un36e/BA37eaNdnpqCw5JZRmV6s38d1
         Egu37k0N69wijw3Fk2Nstuy/rxv01XG4bpqcpqn3JXARc7Mx0oQUZm0oCGdBBvG9cNvx
         1n1hD0I+NYBG5zplvj95hp9GO7hcQf9aJUVyb62NJQcEC5kn52I8AfqZd3KS/i1eXqbv
         SSSoih4ATGukBM3LN6/MYwsqhlDBoifCRydLshullretbD1e8Zda6VmOvJcRxOydukbd
         VZEyqmiYHzT+e8wxhBElwLebvEfOnM+vZXALpVCT8wp6UQ1Ehae75qnaebWbdU0c3CdK
         jyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127825; x=1699732625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otxhn2Jl1X3ri8RWahdxsoh5Mwuc/b5JstsbYxc8Njg=;
        b=PB7mBZDgDJZ6f/yr5eYTifZvgRW3y9YEKOjs1mmgxKpFtwR1yynBBlftFUWPbZFTDc
         4+oO3Rk+lpSi2NIiKfAMV48E3oZkFPwLyjay2GLwBx4/SoBWpUViSOwgzOLQ47Y4YE5J
         b24dJugNPGw8PlLhTAYnzZuYtUATpMbvaYk+2dpQZtpEYW2EKa05l6bbI7+d5/zsX/aT
         fgJCs/qW5Fgsqt/xNHUY08ffz4jmOpWZOsuKEaOezMB30+jRrQpcImXmEibamk7DN8pP
         fMMfA/C3l52ia5Oyvg5H6H+n0J4wdtAdmNFazETp4drCn42l+q+nGQMZr0pTreQC0pGp
         nZQQ==
X-Gm-Message-State: AOJu0Ywiq+iOGg7aRz1eBLksOJS2K54A/wIMEpy1/ImqNWFRXpI2KLvN
	jlx0aqT9Px6pj+63WIOz5ayd31TKvjuuo+1lVMc=
X-Google-Smtp-Source: AGHT+IETgF0DEulYiLKNe7QZGRULj48bZUs1KacOrOGmovjvAv4vB8QwyDzXLO0077mph/befhcalQ==
X-Received: by 2002:a05:6512:e95:b0:509:4405:d5a8 with SMTP id bi21-20020a0565120e9500b005094405d5a8mr10008223lfb.68.1699127825169;
        Sat, 04 Nov 2023 12:57:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH 1/8] linux-firmware: upgrade 20230804 -> 20231030
Date: Sat,  4 Nov 2023 22:56:56 +0300
Message-Id: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190174

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20230804.bb => linux-firmware_20231030.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 0e8005bfc90a..efe8de12567f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -151,7 +151,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
+WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,7 +237,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
 
 inherit allarch
 
-- 
2.39.2


