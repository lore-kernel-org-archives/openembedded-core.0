Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.4815.1623291429810196938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 19:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QNTY++cV;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id c13so176308plz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 19:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8bsjGQoDdwc6vrenX3LGnVJDnvGtg7xvD/bVknW2mA=;
        b=QNTY++cVkSC718gQN4Z0PwPZiZQ/FfKgGYLZPXBEbMfo/vkE2Du6oxFzo4RcNoHyRG
         unhx8b5h1gOtHPUQaKc+hKgkCflnXRX1+gw5GH6hHLvDP77IvYot1NgpETXE7lBE6Dk/
         X3mlk3cw/ZtPleHWtcVmdZK3lh5CnH7C5qYcjUMFMHImpdgNRwNIt6US/v4ts7nY982r
         OfQdyNAZQMkkmrpHt7v2VzMfusrQ0bLVJ6HcTW20NpGc2OWFFNsx6amkGKIo/z/i65VM
         F5gtFafB+UHjppB9/iTPJxJcLUeKf01ubUgQGByClIYznG8DFm70oO6cBKzozWTTCCCJ
         h+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8bsjGQoDdwc6vrenX3LGnVJDnvGtg7xvD/bVknW2mA=;
        b=KEtXRAlpodwTbAcgdFOaAjiBUADOv3WZFThxbHJISX5S72iffcIq2oqHtCy9t5HJlW
         TgZIkVDm1dISY1iamQ3ikx4TtpZOtWFoYnOjwJJDitZT8WtzbefFbrMjyx0JhZIizz+L
         Rt+SxtbuSdix7Ze3pDFJ4OlxNr3wQjYFq4E8uJZRKNDo3veqtU5FImxRvEvlTBxVt7Hp
         I6Kdmn3neS/kiTXA11nc9K4RvF30MT2c0Fr5WBzXd7YrdIad/t6V0LkgnNmOsTkD0EJX
         CPKXbDevRgEueNfAQSM7/+AZDP2rWWjFe2BvOp4PqUalL1ueYp/PAfhHk4P6Iq+4wrR1
         5WHw==
X-Gm-Message-State: AOAM531ktBJUPQRocfk7IsiDEykTSwWa2Wwiu3uPo5pqG/Lkej1INrmg
	m340dIFvgmDRolFJxkEo4IuUVOJnkCB1tA==
X-Google-Smtp-Source: ABdhPJyfdTxdSiBEEBFttA0cJ7rbaZbXzbrllFDrbhxf0zw+rRObMDCcMq8naWGF7plv+1HNTQCkBA==
X-Received: by 2002:a17:90a:de15:: with SMTP id m21mr803309pjv.87.1623291428813;
        Wed, 09 Jun 2021 19:17:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id u68sm710660pfb.64.2021.06.09.19.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 19:17:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [PATCH] arch-armv4: Allow -march=armv4
Date: Wed,  9 Jun 2021 19:17:05 -0700
Message-Id: <20210610021705.3792040-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though it is deprecated in GCC 6 [1] it has not yet been
removed from gcc upstream. We do have active machines in OE
ecosystem which use armv4 ( SA11xx ) e.g. collie in meta-handheld
so until upstream gcc takes next step to remove them
lets support armv4 again, we are still carrying the relevant gcc patch
to support v4 BX fix.

[1] https://gcc.gnu.org/gcc-6/changes.html#arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index fac2bdf952..b71739c20a 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
-- 
2.32.0

