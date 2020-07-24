Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.7601.1595601791757496575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aHvcmW0y;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id q7so10248000ljm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MAEaVUp/miUQY8wBaS1a8i90YHIL021BBsPnD6+F7SM=;
        b=aHvcmW0y3s3bhtd2D6IPClTz8GNyHsTVRF0eLCWoa0wkb551wJwtPctmfGyp2B0PZm
         8RWzUYAkVHXct1ZpWr9eREOuvlx/vA+MqJ/+kJeeis5SJtAej/iCXSrXV8c9qklYf1rx
         KiXVXwIUCvLCpYfZfSwD7pjEn9q7+AQW67BkbANYRism6eaIPDuVih7FOm4r5Y51zGFu
         sikbMYkQ3n+cdWdl794RBM/nFjc0b33gqGWtlyzKueV9ZHblmURDCzUCYbyWhqQcdiuL
         rCefAjIiBQQRJK5iqlXIoguP2r27eoqfGG4ymlkO8oobGG2EmZJ2nnm2E/69De2ycoq1
         2XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MAEaVUp/miUQY8wBaS1a8i90YHIL021BBsPnD6+F7SM=;
        b=RFgn9ayUPx6Wn+9SrlGp5Dwa9NoMPE5d0tY+YoFeN3z6Ah2ClAeNxa0xUclr44QTB3
         QlGbXn8Jh6OE065SqGecrPqS8RQbGHLGVoNcXU7MIzpbzOw8MuI40ZDJddAMa9I+/bCJ
         OC0AzQCnzRxGkcocIhW2/weQHAHBMiQi6MENRNrOPvFCF9wOfX+FUyUDC5INrnSB518z
         vo0pypUivno2Vs6quy/gvdWwYMpWtD/BpBnaT9+NR9kxSv+C/bMArnTTY/iM1S7Hyjwy
         L2xI3sMqj19WVlGYHutXI7mis5rYGmt/tPhHMgXbxawvP72sR99K9FMjvrfNiNc4JlGM
         VTug==
X-Gm-Message-State: AOAM532QlvGTyIoh1FGCYXTMuLPW3I99ic/7AFthE00ILi7cXoC6flLq
	W0WOgbHGpCGWNUlrLO84JQkeqvMphXc=
X-Google-Smtp-Source: ABdhPJx5Oo7T3NZNt5er70wmojAbTDgH7rU+63ZhebF0ljFK6HBPiWEDxPKhlg+7YCafj/aRpzgvkQ==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr4811755ljc.141.1595601789489;
        Fri, 24 Jul 2020 07:43:09 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from eriador.lan ([188.162.65.229])
        by smtp.gmail.com with ESMTPSA id h21sm290851ljk.31.2020.07.24.07.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 07:43:08 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/2] arch-armv8-2a.inc: add tune include for armv8.2a
Date: Fri, 24 Jul 2020 17:43:05 +0300
Message-Id: <20200724144306.4031060-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add tune include for armv8.2a. This adds support only for bare armv8.2a
(and for crypto extension). There is no support for additional
instructions added by architecture extensions (except the main crypto
extension support).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../machine/include/arm/arch-armv8-2a.inc     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-2a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
new file mode 100644
index 000000000000..1c095256d185
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-2a"
+
+TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '' ,d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8-2a armv8-2a-crypto"
+ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
+ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
+TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
+TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
+BASE_LIB_tune-armv8-2a                       = "lib64"
+BASE_LIB_tune-armv8-2a-crypto                = "lib64"
-- 
2.27.0

