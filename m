Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AF3EE01F1
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:01:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.2312.1694624455109928469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wr9jhqfq;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64f3ad95ec0so325656d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694624454; x=1695229254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENKHqi1jrt2vdpPdsHvf//sU3P3sP8boT0QbJV8uFr0=;
        b=wr9jhqfqxqw8p12Hy3jNN4MPitufNIgJZhF13J0Znb5bb1SAA4BPlt6361uV9mOQSP
         PKv6G4IOuRNlqgjLmedUa6YFCz2BIlgnyPrF4WnKahQHJ7pArhzfNedvcjU6CFOAsIcR
         tBINOkB2YhNim/Bl0Y3b2haJ+UT8Ucb63MXCnsbSSYAcNdBkoVcXofL5FDhMEolzAp/7
         rH8RWSfYPapHF9v22FcYJh+pt0SltCbl6vmVkpyQJyrtp93FkBIGtDLts2o3w0wXuGHt
         W7C9+LbuGOHIoDGQ7GYy6e66ENiqPTF8H3/6ZirfwRe4uoDOUZk0Rv+ymZHQknwha3Bn
         ECXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624454; x=1695229254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENKHqi1jrt2vdpPdsHvf//sU3P3sP8boT0QbJV8uFr0=;
        b=uJy9sKIGrsNEmOkKNXV1XloA8JjpGb6bLkkDK5uy3BXPKEmq32jT63nEKbHZHsSBXl
         VfA4Uc5ExmfGBbrwD0ne+BI4AoNk2tZp1GI7lt1Ui78mT0ebK+eQF5b0dOExOa+5b3+n
         LCumzuackNgiEsLpbYrb7RLeHpiorCXjeiLzuKJ8fRPy0CrABhF6lQupcl5EQLPfdyDV
         sw9XhElkXFzWym22nW9XDlfUXQTU3O7sFMevFEJaQNWiTK7W+1dMaLoERXsKeo2+thlS
         jgcBheTy2yVfpSAc92+YdeqSEfVVwkNuN1fQblhJtQrJ6ADL+d4V1ZPOZpA+Q3B+Inhl
         jXLw==
X-Gm-Message-State: AOJu0Yyep/Cl9UeAxIniZHNiokZNRqD+mdZp4ldcWH6Jtg21eM32FWw+
	iyS0rgXnaH5qXlupMEf0mw0AkPCb1jPtQ/84P69oUw==
X-Google-Smtp-Source: AGHT+IEnccP8jCedyf2kVEYezLS6/h877BErP8ejuxTkhQI32uEGUK4JTbPNDhHq8ApdzgMUqRrKUQ==
X-Received: by 2002:ad4:5bc8:0:b0:655:ced0:bffe with SMTP id t8-20020ad45bc8000000b00655ced0bffemr4144571qvt.54.1694624454080;
        Wed, 13 Sep 2023 10:00:54 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l4-20020a0ce504000000b0064a5de64668sm4512014qvm.141.2023.09.13.10.00.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:00:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] patchtest: Add README.md for selftests
Date: Wed, 13 Sep 2023 13:00:49 -0400
Message-ID: <20230913170049.1622451-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913170049.1622451-1-tgamblin@baylibre.com>
References: <20230913170049.1622451-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187616

Add a short README describing how to setup patchtest's selftests for
oe-core.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/README.md | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/lib/patchtest/README.md

diff --git a/meta/lib/patchtest/README.md b/meta/lib/patchtest/README.md
new file mode 100644
index 0000000000..f66613c0c1
--- /dev/null
+++ b/meta/lib/patchtest/README.md
@@ -0,0 +1,20 @@
+# patchtest selftests for openembedded-core
+
+This directory provides a test suite and selftest script for use with the
+patchtest repository: https://git.yoctoproject.org/patchtest/
+
+To setup for use:
+
+1. Clone https://git.openembedded.org/openembedded-core (this repo) and https://git.openembedded.org/bitbake/
+2. Clone https://git.yoctoproject.org/patchtest
+3. Install the necessary Python modules: in meta/lib/patchtest or the patchtest
+   repo, do `pip install -r requirements.txt`
+4. Add patchtest to PATH: `export PATH=/path/to/patchtest/repo:$PATH`
+5. Initialize the environment: `source oe-init-build-env`
+6. Add meta-selftest to bblayers.conf: `bitbake-layers add-layer
+   /path/to/meta-selftest/` (the selftests use this layer's recipes as test
+   targets)
+7. Finally, run the selftest script: `./meta/lib/patchtest/selftest/selftest`
+
+For more information on using patchtest, see the patchtest repo at
+https://git.yoctoproject.org/patchtest/.
-- 
2.41.0


