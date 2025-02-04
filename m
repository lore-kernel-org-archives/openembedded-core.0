Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B097C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:55:18 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.116789.1738677309486957672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sAo2WdyC;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540215984f0so6171941e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738677308; x=1739282108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=sAo2WdyCE0ZaxOVALZ2osA4+mfDUoLUT9YMQHJtKq6iompeI159bHmHhf0oFtxiMgp
         VpW7bhdmwS9lyQNhkGST1vc7Nt1rZzJfD9B4Y58EB3XqR+I30Z9YvZvlZBA8+FO040a5
         J+ylMhTsMYQwZHcFJVO8eCuZaJNoVd8y0pM6b28IRj9WIfuv0OYM1pcwxE/1yo7MKUA+
         WIxPxAZIxMYFCkISgYFScxRfDc2Tp4anP8rBUULzFKou8z7d4WaDbwuQ/6enAeSR0Wq7
         66tQQ6gOYZ/mufM9AAiwqNuFWkyqqsqRJuNlD8orE3p0LsZ0O1HX0XH2oRSNFpmKcNTo
         IDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677308; x=1739282108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=uGPn64In8SccRsbQBLq09g+8skm76jWDZyNovT30vtBnHCMeO+y5NxWHWr3knw/0qI
         jdfvZQWKO8V8EG1PQPndQvKpG2Q3IjjVUd0EYZTzdFd73TbrXR4vjUyg49FqjmPL7vOH
         TPO14odNLYak3P1QM3c4ZqWytneGqXLnYBdllFMjCRpTjrKRJ2AFcZXhUds8KtBma2Th
         cACk56nku8IeKbzpVZ8cmCVE2mWY2P+BnRwIPk4fu8RKdZHBJX5+mrafyOQs6oR3/8oA
         fMI2I2ZNbETrV9EdsPWb9HaIezKFWQSvlLuS7xBOupRcdEEiaSluz1efAa4iAljEQuF6
         +koA==
X-Gm-Message-State: AOJu0YxummZHJErSRuHDrQbUODUj0n9XyvY6lamYm4O2oQotkCb4qH/V
	0Ig9NNqz2Dh5IoGmNVoRojy9zgS5LXbE9S8z3d2OQYXUmohLubABSj4ilIGvPyiUh99TTZSgzA3
	4GkU=
X-Gm-Gg: ASbGncv+pTsi8Mc9nmKSrnPDd5s1CTGdDSOuP/BFuMITVvRFTBTZ01R7bxTDJSPijYj
	yehhRRWkmmztWuqh0PO3SiebhlPEEz8rb+V4EcksdQFZfHPE0ql9U4i2dnNUEKfvxAvNJQA17w4
	73mm4tTKLrU+wS2B1Po3IKYAqW+vrhWd8EbWe4ZhOHD/n/HW+o4mX747B9qvDdyVLAco7+xuuOq
	7gnWIollgwhYcLduMfG9qrArIEyBruXE+4xCJBXXcWrChRpCw49G1JLvBQeEv0GJiJCBopy7YPH
	gMohQkg7kQNGSvNlTs7gF66SGNvEpdBuyP+Mz7W0LL9+EksSqG9xiJgB81pO
X-Google-Smtp-Source: AGHT+IH8Zvb250oBUhKGjCuiV6sWReirQ1hbGohEhHTgcSTPliWum6DXVZDoEGYDNeVNEVOMDYvChg==
X-Received: by 2002:ac2:46ef:0:b0:543:c3d9:418d with SMTP id 2adb3069b0e04-543e4be9663mr7305297e87.22.1738677307555;
        Tue, 04 Feb 2025 05:55:07 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb07a0sm1578017e87.123.2025.02.04.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:55:05 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/3] systemd-boot-native: undelete but disable configure and compile tasks
Date: Tue,  4 Feb 2025 15:54:55 +0200
Message-ID: <20250204135457.1219477-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210797

The tasks were deleted and do_patch() was run after do_install()
which means that patches applied in SRC_URI were not in the
ukify.py binary installed. Mark the tasks as noexec since
they don't need to do anything.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 58db408dcf..5b4b63c294 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -2,13 +2,12 @@ require systemd.inc
 
 inherit native
 
-deltask do_configure
-deltask do_compile
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install () {
        install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
 }
-addtask install after do_unpack
 
 PACKAGES = "${PN}"
 
-- 
2.43.0


