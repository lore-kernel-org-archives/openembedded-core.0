Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C4FC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 06:47:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.2078.1720766850664913480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 23:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MSjeZXg8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52caebc6137so1300553e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720766848; x=1721371648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qcbrK+o/zF9ZslnCnPuk7TSTUaKkG1qTIFniVgaGUrc=;
        b=MSjeZXg8MIkxQym5OrFB0T9JOmU5OOzknMXmLEifB98Okxl7dKziHN307J/PKkOhY0
         wqFc1NW11kOML1W/6ZGbn70xvr7xnuAJgrZJwdT3UY4xLhXfLH2Cxywi0GOvG2dOgFKt
         l+NfuQpnhzxNX+6WctWknpMxJ6AxZa4yMcr2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720766848; x=1721371648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcbrK+o/zF9ZslnCnPuk7TSTUaKkG1qTIFniVgaGUrc=;
        b=hGH0OrZV/s01i6vSRjMIvVbURguHQCPm6BUhLbCJPpdZbE8QvXuvf/7eNrRwTLQ4QS
         a3PIOnW3OgXs3Am7jjCKhHdj/HKXwBdgxwf9udRJNWv9G36ZcaYH1I9OzofWkSQeEsGP
         QSpJuMp5mJSUbLzgh9Aqq7RMt1w+Hq94mYdHXoovEij5gyuEeYn0GWBaVgB0bpdSj/n3
         iab6BROW/MZb70BRHVA6n0gQOJSgesLTiklI+bBavgmZfu52+IsxhbsgZdkrSh8dEdaS
         XR1R7/BzfN4TuurvnwxNbgaiHYLOleJ9q/llWL9JSublpNNoqUZJzJf74aNHeiVr9PMG
         AgVg==
X-Gm-Message-State: AOJu0YzqKESCWNrJTP9tJtsKe9+AH5pmjdZRRThU79f6Nv541FnAJO+T
	nbWiXLIad5K5mpVJv7aFwuLD0Salc+N4tEKbkkL2L0ZkNuLTH/Xj7cbnubuyZKAUn2ARKRC5MLV
	r
X-Google-Smtp-Source: AGHT+IHWJR7NUfgn9+i0ECc6c/YY0Vuy8y8M91pOsYyFL3ILIKtejf3nQHGMfR3DZAJRylacVy52Hg==
X-Received: by 2002:a05:6512:1051:b0:52e:9cb1:d265 with SMTP id 2adb3069b0e04-52eb99cc6f7mr6533090e87.51.1720766848123;
        Thu, 11 Jul 2024 23:47:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2448ebsm12139635e9.1.2024.07.11.23.47.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 23:47:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bitbake.conf: Drop obsolete debug compiler options
Date: Fri, 12 Jul 2024 07:47:24 +0100
Message-ID: <20240712064726.1448710-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201805

eliminate-unused-debug-types is a compiler default so we no longer
need to specify this. Drop the option. Also drop an obsolete comment
about another debug flag.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ef2deb088b..02fe872d2c4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -663,14 +663,13 @@ DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
+DEBUG_FLAGS ?= "-g ${DEBUG_PREFIX_MAP}"
 
-# Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types', '-O2', d)} -pipe"
+BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)} -pipe"
 BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 ##################################################################

