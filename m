Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3422C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 13:56:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.47241.1690206983895093882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 06:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X56PY0L5;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fde022de07so5488764e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690206982; x=1690811782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+U5Akg/pITrzh7YlaJYqvgOFzsEJ/tl45HsfAEZi10A=;
        b=X56PY0L5JVdTS4GfXihpPX6QtQukRA5Zk0+YI3wvgeb4arxLIob+iPF/Y1TRmvs9pr
         Bkxt2IZn9MCjSg4MNBd3KEtgNiNlspYx9OMpvTbnC44lHm1O+Xh208gQnNC5QXRune8E
         BLKSSwug8ps/wKHVQV3k5sXI5XbSOfwCEeeH4nvYkLsqTwkT8H6aZREalJMJ5mqFNrWs
         6UBvt9m6lTdkc+KvbZHqxyT3HxUnRO82BYgcbt/pV7/M+CU4SzgA1eUqDPm9ulLeam8o
         SZqEIeUcujgFHxAApjFsysWSnVMUnylEOkcuL+xCFAOsfQfMQz223uuLKaW0Ka8cme6T
         9miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206982; x=1690811782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+U5Akg/pITrzh7YlaJYqvgOFzsEJ/tl45HsfAEZi10A=;
        b=O6Fcl67Xrws7Do7N5ZKGkwCGFvLaP+mmeQKxefwG9h4puDLgcB1By4FGekFX9OX5H8
         eUbeEYK1HCY16I8dilELoHAB/dmfo6J4juol87Cay/Ue9U5crTKbMSUzi80tql/h13Ch
         vsaERjJY/qE0gHoOalQTtOvsxxXqYQooVZrCxcBjbsmNUtGIyeyZQrNySxYptmqX0GZx
         8dKMr6Nf1lqpPLphHR+h6l5HzNYwf8tR3TOd3bY5FnfLqmnmA1fITTqJq8PiqyZ7zjh2
         aG5BzNcDwuWvopfuIlGX4Oqb6it4mfqJDooFdB3gKRjLFviOu/Gg+gFryEWnYLjAIkwm
         xV+g==
X-Gm-Message-State: ABy/qLbLpPx2IfqtjkyHbfmAMPcsgknrUX5cffMTCjwWcWItzZXsC74c
	10lUwq6LJbzEBwDdxFBOYgraFqVH/3I9nMHQJIcD4Zod
X-Google-Smtp-Source: APBJJlG4Js24EG5Ihi8rLHPsrMIYqHa+rIwQO6sQj1q12nBQxwzqPG3vLFt8URtedViiMH6vK2u5nw==
X-Received: by 2002:a05:6512:292:b0:4f9:5396:ed1b with SMTP id j18-20020a056512029200b004f95396ed1bmr4970516lfp.28.1690205524908;
        Mon, 24 Jul 2023 06:32:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q11-20020ac25fcb000000b004f85d247069sm2201560lfg.218.2023.07.24.06.32.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 06:32:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: simplify overriding GALLIUMDRIVERS_LLVM
Date: Mon, 24 Jul 2023 16:32:00 +0300
Message-Id: <20230724133201.781898-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184788

Embedded devices might want to extend and/or override the
GALLIUMDRIVERS_LLVM variable (to change the set of gallium drivers
enabled for the particular device). Simplify this task by making the
GALLIUMDRIVERS_LLVM variable follow the rest of mesa.inc variables and
contain the leading comma.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 928899008e62..ade097d7cc5a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -163,7 +163,7 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
 GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
 GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
 # i686 is a 32 bit override for mesa-native
@@ -172,7 +172,7 @@ GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
 PACKAGECONFIG[r600] = ""
 PACKAGECONFIG[virgl] = ""
 
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
-- 
2.39.2


