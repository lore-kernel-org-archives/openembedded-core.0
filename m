Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57593C47094
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.6059.1650450294370196807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=y0qxAGx5;
 spf=pass (domain: linaro.org, ip: 209.85.167.50,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id t25so2129647lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xf5Da8GZip4F76g8wr6ZBgdcN/pzzRsqDHFv90Iyoto=;
        b=y0qxAGx5uNoGUpucoM81etX4IR2ucw2y8egAOICO3GwRf8RsR50s7XgeyzoWyeQEqL
         W0hkJmwFmOQ24A/zA7ZwzguTyQ+AIflR1lGorWx9JsuwE61gog+/VUr26jW3ml5n5wFx
         cw/dKcHlEbwktkMjrrQNzEIJvAkjPATr7wsv8dCqxQhKm9l2imQzuhfnUT72i89ByJru
         tJO3NiNC6sv9DR7fm0sSvzZCIyN3C/x9fLvnh+agGUWFpZ/G1F4oGVXIpUnLsxDOGpLW
         lNFJZ+Vo2lNiIsmEFc9jJhAf6WzlP5x0cnH1mCOUX3iF1F8ffHBkLxSfAsp3IlvFTfb6
         FhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xf5Da8GZip4F76g8wr6ZBgdcN/pzzRsqDHFv90Iyoto=;
        b=ovziaQIrpCxF7fr3bvAPA8tvh16ZbtLWfTx3cHgmLcF9SjtwG/crIKbvMXVC1OeCfo
         l1dUjuy68sFcTdjptyVubCs4VcUaEP2C4uyBAjqoQ9JODekKM0KasCmRKX7JKZlJrHw/
         YLtOYO9LHkcrE2w9WeEOLYs4ibbgepzYW0IbuZTyi2DFk8x5yVQIqBw1eb4jra2AhTC2
         fQB8flILOIEMWO+prVAMe3Ziup3EXKCueDvKz92P2GK9sRYw/COTCh8RbwTAaGV+ORYW
         CQfHhhSgxHTrzvKS2LaMqijnbrS32w+tILQr//CeRwJ48ZwQakPwJQYT/3nQ+/B29jK2
         H8Ow==
X-Gm-Message-State: AOAM531xjHw4/kiscjAlPoy9FagshSJ4gp+pqk91SiuRnU6GmAejHS+K
	QIqY2VWuloZNyfbKQRsPmgF6JH32DdFxlA==
X-Google-Smtp-Source: 
 ABdhPJwXKjd1Sac8KWqqTHD+Z5fYcnVFrRusbw3VwEWf0UwMnek05fDWoytsd4viss2C2yWdPD/VGw==
X-Received: by 2002:a05:6512:3f92:b0:447:769c:1b2c with SMTP id
 x18-20020a0565123f9200b00447769c1b2cmr14527771lfa.387.1650450292221;
        Wed, 20 Apr 2022 03:24:52 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 w8-20020a05651c118800b0024cfc30001dsm1720537ljo.49.2022.04.20.03.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:24:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] arch-armv8-4a.inc: add tune include for armv8.4a
Date: Wed, 20 Apr 2022 13:24:51 +0300
Message-Id: <20220420102451.2962474-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164664

Add tune include for armv8.4a. This adds support only for bare armv8.4a
(and for crypto extension). There is no support for additional
instructions added by architecture extensions (except the main crypto
extension support).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../machine/include/arm/arch-armv8-4a.inc     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-4a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-4a.inc b/meta/conf/machine/include/arm/arch-armv8-4a.inc
new file mode 100644
index 000000000000..29feddb64c54
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-4a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-4a"
+
+TUNEVALID[armv8-4a] = "Enable instructions for ARMv8.4-a"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a', ' -march=armv8.4-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a', 'armv8-4a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8-4a armv8-4a-crypto"
+ARMPKGARCH:tune-armv8-4a                    ?= "armv8-4a"
+ARMPKGARCH:tune-armv8-4a-crypto             ?= "armv8-4a"
+TUNE_FEATURES:tune-armv8-4a                  = "aarch64 armv8-4a"
+TUNE_FEATURES:tune-armv8-4a-crypto           = "${TUNE_FEATURES:tune-armv8-4a} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-4a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-4a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-4a} armv8-4a-crypto"
+BASE_LIB:tune-armv8-4a                       = "lib64"
+BASE_LIB:tune-armv8-4a-crypto                = "lib64"
-- 
2.30.2


