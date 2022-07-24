Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08817C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 17:22:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.18736.1658683326331141082
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 10:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n4/9EmHs;
 spf=pass (domain: linaro.org, ip: 209.85.208.180,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id r14so10679077ljp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81p5NcKCfbVjstDN6Z8rnDm1lci0jqUXtTDf56tDtj4=;
        b=n4/9EmHsNk58EH98Hwjqj7SvjKcWYBPmcRqmYm2TJ0MChGhM9Acuyvtawo1Oi7ziiV
         6Y2+GfyaZtRjm3TiXdWJD3LczfRnQI1mrjlrDNxIPg1mUFJeRhoLfAdBpidZyyXMNehi
         t1FF8wqmv3X4xkjMtIheOYZcZ2wk6DmIF94qfnfO3HO7RsryiTHeEp4VeaBQge64IihT
         o1Z53NiPUX5u6k0uiVPTEl7I7mP1Qu7SPeSQZKLkxrO9A9sSpCBHZDSD6AW4H42U6ZTJ
         kWqGwbD7jPjK/G2sALgFZCZAq15aG7lUvCquhp7l3jqpAfPIHwgiM4uAk0BkntGVb/mj
         Wmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81p5NcKCfbVjstDN6Z8rnDm1lci0jqUXtTDf56tDtj4=;
        b=HIYSxQT1b8XWHbxAl3QVNDZ6BMp58rA7gEoN+0OkhlL/E1SiHEx411S8ie2b17yjFE
         lU0NF9ZNrQwMDYG2UiyROE5OF4mDOlOlrOqdmTultBKsT1IOxiUzN0dI7V5EN/ibEkKJ
         pzT2NRuffiX8Q78BtDp8CgM3Bpgkpv5JFd8fGYY21Uz0+7jPejhZdXyBcRxCHJ1nk+th
         ZgySOnc06QdndauOFb2ccUt1pM1GfgLe5wFiL4mf7td85+G9+taDh8ODoTkv7gvF8ZZo
         wc7q2OScCk1ufIOU4EaxRALdL/jOqYWDR235VE5PldYTaV1jutcUKrv+XDNVd69gaQUP
         pzuQ==
X-Gm-Message-State: AJIora9OYI/mEbMxOtX7hS24523gpHDYsk8s7Zzcog9bV3UtpnSKD7sd
	z+IxIcxFz9gjFHsZkHYeo/ATC5XLSkPDVg==
X-Google-Smtp-Source: 
 AGRyM1sqsMO4v1uKInnmAGyoBbZihQZM1G5xesiWuuwXajiIf88xxMUrZxvyL+Tf19Wgr6JRCSAAag==
X-Received: by 2002:a2e:9bc4:0:b0:25d:fccc:5322 with SMTP id
 w4-20020a2e9bc4000000b0025dfccc5322mr2140642ljj.72.1658683324183;
        Sun, 24 Jul 2022 10:22:04 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 s16-20020a056512215000b0048a8a3ddb11sm311235lfr.75.2022.07.24.10.22.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 10:22:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firwmare: restore WHENCE_CHKSUM variable
Date: Sun, 24 Jul 2022 20:21:58 +0300
Message-Id: <20220724172158.372941-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 17:22:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168462

Restore WHENCE_CHKSUM variable which is used to hold the WHENCE file
checksum. It is necessary to allow easily overriding it from local.conf
if the devupstream version is selected:

PREFERRED_VERSION_linux-firmware = "1:20220708+git%"
SRCREV:class-devupstream = "${AUTOREV}"
WHENCE_CHKSUM:class-devupstream:pn-linux-firmware = "abf1077491eeb261ecdcb680a34fc059"

Without the WHENCE_CHECKSUM one would need to manually patch the
LIC_FILES_CHKSUM variable to change the checksum of WHENC (e.g. using
the anonymous python function or remove expression).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20220708.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
index bde71781647c..91c32e49d645 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
@@ -128,8 +128,11 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=def08711eb23ba967fb7e1f8cff66178 \
+                    file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
+# WHENCE checksum is defined separately to ease overriding it if
+# class-devupstream is selected.
+WHENCE_CHKSUM  = "def08711eb23ba967fb7e1f8cff66178"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
-- 
2.30.2


