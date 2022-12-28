Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3F4C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.176140.1672213065295847384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IFcjlqnV;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j17so8858448wrr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr4VDoTWwjkr8bNz6xyUpyNvxFMr2DyBvp8JLMcFXnk=;
        b=IFcjlqnV86zxOL/gXqDniRVCZcqC0yHN2L2q88Po8D5xIr0pMZ3aJqs5FTJBIROFCW
         7TrdtDwxDVU0kf9L7N/enJ7jOU9VhaD9Au1xvuAMil08VZHpNBXTHhB18MS0j9UYevrV
         gzLJ/PI1jFmgejkGGzHu+7pmsOX+g/4P6blo2DO8JKhnZlsr2mWFMLvzxHKmfeSPNNfd
         2QIN/La4ATZIQYg0NEDaYkft0U1Obbn9SbL2zLQF8zHJMTyaJb98Zu252KwPDWgYEGCD
         e6lQ40QaKulrujxmZomeJBD9w9BcIzvE3DcTAKBOHJVY6GEuHSFIH6e+GE8XPgL2rgVO
         gPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr4VDoTWwjkr8bNz6xyUpyNvxFMr2DyBvp8JLMcFXnk=;
        b=rNai6jMsxEMQEypbya01XD68oNisJKucMi0yeKEfzCMqXuC6pCGgFIBGsHhvgot2EZ
         BcuppTqgwF+nEBwEL4Rr0CM1qW26nC6bal+MQUX06G02MX5D8dfjymWoVMhFXcrSeyLU
         EGV9IaZ4VVbKxB+Kob8TMR3AwbPAd1zHW4/jfb+rZPe1NRU60MvoftOw98EDNxJ03No3
         vZl9/oTH2Y6sLRfR3WIuOsEVfL4rNeqWPEm7Ik+/C+Li5IPjcu4uCwjU8dp9BhVslBZ1
         DXw6HL147T4UiIowiUI5JfqSu5L0LVwxAYCZTcaAjDSAsP4Vz/ksgTjS5mzFBtcZ3RcI
         DPAw==
X-Gm-Message-State: AFqh2kr9IT+xfLNPM3GUErLT14lBSCa+JkRu2l1Uyu6Sthjd+NAM/0fF
	OCYOcP35axjv3fRYCSRkc2kvpjq00mo=
X-Google-Smtp-Source: AMrXdXueR/W1gLfc2rgp9lKfH0lfuMEus2NRrs1IvvY06r2SibkWmcNuy0M6myZz7zLfvPLnsB+xJA==
X-Received: by 2002:a05:6000:80b:b0:274:c846:4211 with SMTP id bt11-20020a056000080b00b00274c8464211mr14972378wrb.54.1672213063830;
        Tue, 27 Dec 2022 23:37:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/25] python3-chardet: upgrade 5.0.0 -> 5.1.0
Date: Wed, 28 Dec 2022 08:37:17 +0100
Message-Id: <20221228073721.3454255-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175061

Transition to python_setuptools_build_meta.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-chardet_5.0.0.bb => python3-chardet_5.1.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-chardet_5.0.0.bb => python3-chardet_5.1.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-chardet_5.0.0.bb b/meta/recipes-devtools/python/python3-chardet_5.1.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-chardet_5.0.0.bb
rename to meta/recipes-devtools/python/python3-chardet_5.1.0.bb
index 80baed7986..9b2644e648 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.1.0.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://pypi.org/project/chardet/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "0368df2bfd78b5fc20572bb4e9bb7fb53e2c094f60ae9993339e8671d0afb8aa"
+SRC_URI[sha256sum] = "0d62712b956bc154f85fb0a266e2a3c5913c2967e00348701b32411d6def31e5"
 
 # setup.py of chardet needs this.
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PACKAGES =+ "${PN}-cli"
 FILES:${PN}-cli += " \
-- 
2.30.2


