Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E24BC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 06:26:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.6844.1651127210987215917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TO/ziMSt;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id p12so3481328pfn.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f5CgZVyJmvYRWXqgIvtbdGYclefVfVn2O7gVV/Ug9bc=;
        b=TO/ziMStzhPR333jiQwg5sZC7xLDy2/x2V7lFcSHFzUycqhMRSd6dPUATHnsXhR+op
         jNSu66nA82317csxx+eGAQdp6xSB7+Vd5Qh3RL91bqjqgZzRGMirkO/TVYYw/q9PJmzi
         bDdtmw68bAzUozW70mHo7y3/644RfeUwkIMM5gxXhLIIdcm+u+u2in22L5sczWu5BHhs
         AHdOVTbRnSMx/w2qWmumNVRVzsETpM4DcDxCtzG/FW9CjkTfyAPocES1OjHO5+7QFFhL
         2fxnstijnrkqPeY+Cq4ywCA4zEBHS3cwpoVOF6pGj3FsZx2Cy0SiPmWFXW7+wxIE9EJ2
         5feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f5CgZVyJmvYRWXqgIvtbdGYclefVfVn2O7gVV/Ug9bc=;
        b=wxL9vRk3AQ3XSr2dOH8ebDEkaahgmjUvUNITPjnp1U1wyWrmKchpDRwAgmdfm5tHJB
         2TsIGMHqTQC5yV1iSj1hPiPtawdlJtwYf43BvjCdzqPUGF4SUjISuM++buZgdac1C0sU
         G1YL8bY/iqy0zagi6wQt1hoGaz9hDraK543X/F306rJXjpNx6FCAYRQ0Yd24Psk0UUUJ
         cj7VY0kZ2skkozlKXQcxzn9UMEaTcwkf6L6JfN/riwQhwV3fJ/pngFmEExQa/ep5jhav
         wkddMdi/XAVtELPmf3s2rfYgGTqdSD0Tv4humH9DKca20vpkLndhETsaLWnrCRXLNnHP
         D4YQ==
X-Gm-Message-State: AOAM532or8SAQSfPgLh6gOl7kbHgia1peJOs6WDaY+YEHcoiuTjhzIVv
	R6nCkjZlo+WuKLgb1gYANjvuAK/ZcFXLjw==
X-Google-Smtp-Source: 
 ABdhPJwQeye5PD0kV7auivkhGO8PU+ZJpKFcAYsYvIQrBhF3MF82zHTzKgkm3r46S3qNQPeU+xgCyw==
X-Received: by 2002:a05:6a00:c93:b0:50d:9f6d:6499 with SMTP id
 a19-20020a056a000c9300b0050d9f6d6499mr885971pfv.37.1651127209889;
        Wed, 27 Apr 2022 23:26:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a62970a000000b0050d906ca9ebsm1774201pfe.196.2022.04.27.23.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 23:26:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] kmod: Enable xz support by default
Date: Wed, 27 Apr 2022 23:26:47 -0700
Message-Id: <20220428062647.2717638-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 06:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164932

RPi kernel has started building compressed kernel modules by default
starting 5.15, currenrly therefore meta-raspberrypi kernels are unable
to load kernel modules since kmod and kmod-native do not entertain xz
compressed modules. There is a fix proposed in meta-raspberrypi [1]
but the fix is needed for native and nativesdk recipes as well, perhaps
its best to enable it here for best out of box experience with
meta-raspberrypi

[1] https://github.com/agherzan/meta-raspberrypi/pull/1056

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
index 9b663490666..32dc49c1269 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-tools"
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "zlib xz"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
-- 
2.36.0


