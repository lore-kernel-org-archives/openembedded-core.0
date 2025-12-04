Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E669D24469
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:10:08 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50691.1764871801519413639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=F3+0TxQW;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b28f983333so126039285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871800; x=1765476600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhXVSms3IGraJR1AftbJj5A6wIbByeFMJyqlhT2Xiwg=;
        b=F3+0TxQWmjR8QZEE6MQKo/vAB6dFBczfD75J0T9ui6FlSSaxG05hOhsEAKMpm1zNzs
         Ssk1yx3ujafpOv2RF4Q7JIdfaipMjF+p5hNEOJ9Fb8bbaGOEmybfRngB+YaNqEiICj9P
         hkv3+6s/YkYN7frFBXpM8/G1yCfxFC+Cqvw5X2qukoIs4cyW2Xz3Xx0tpRDFxbyXi6kv
         0mTZO+UkQCRp+oWdYoN7ZeIVkpvPUCSiWt3P45ozzkMFmp2+DDf16xd4vpkivsevqGAA
         C7gOfgmiyKDRW5yx9z1w7Y9iFbhRRrXWQ3R5n8LLcPEvDeLpMOBIDAs5ssIyR0SbTQIk
         xvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871800; x=1765476600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zhXVSms3IGraJR1AftbJj5A6wIbByeFMJyqlhT2Xiwg=;
        b=g+U87WtQ94TRgxlP5rsrd7srMAVQH61bOz82M6x1Bn44zqutLSpNxG5f+S+Mz0e2Ox
         qLfc0jxz05sPVuTGCoH4T6wneBVQSkZrZhwFyfBPU1Mckdv8OLOgjIECQTkX8BwEemLt
         KXUJvnbpMMiOfaYnF0ebSznIS/0NXP6ihjc0NjIyJd2Cy4dEyWNetm8qPDmBjoZP5Mpq
         QrvuIqG/D8K8hVORiBiT46r+ovjW52tDcc4JMLzZ57MGgEYa6ULPcnmGBYD2calu7lzI
         KUeMxsbcyxC9RfzciQSKfVhtDv6TzYbGUdr9K32D+MoDOm3rgmbgPAdSlaZEJuz5QbKD
         pSmQ==
X-Gm-Message-State: AOJu0YyIaO0EOrozt0+D9I4z0LiOUq9vna0105AoFqTpjc3gbFqZ1VRS
	tzZgv2bnWeTVWVuQR27pcG8HXKD2awfk8oF5ZzasmkKdoXZ7YbPQkxHTpSOR5SFSMxrckvdJatK
	c9Tx6rQ8=
X-Gm-Gg: ASbGncuOF3H2B14t6IN6QSUKTQ8iHRx7ZmTXWEgxdYj6b4H9i4yBEtyv5D8s25t7oO+
	0kQ5zeJjT2CUVMU6NEG+3Rn0cB7W1KDhx2nb9z/6XQnR+X/DjOrzEZPWtEKWiy4Jk/YG8damAOt
	pziyliuFPnXRGo55T3P0G8I5vovOUEoMx2ZP12esxESsUbbXXDpAED/lsmP7eTbfvFiXDy6WwMm
	0yrlbNCIrUUswKLXdE8oi84Wj1NWMmKIuoQcVzgGx2mETlPFb4kEec007L9B9+hYaZkWZhq1ATd
	sZ/P86Vo9Jf/FNHzk0VO+0jldYC13olvZ6Bf8ZE2LFFDdsilzZ6gLcD6lwyn/ezXM4Hhx9VwxTe
	czHyeTk3t955klH+GGBm2jWw36Srq7l8IOA765PDb9jdK63zmTCYfzNxpnRmKrirmAxZp2rNBEd
	QZFqu6+qrdZ4xTFUbbS1LriSGpTQ==
X-Google-Smtp-Source: AGHT+IF5i9dPSxQesPd/yHKpXZrLbtvAIApWkAkkCXUt2+zLnKXBSAm7+B7mVGGyKZ7iOx4K4O8hKg==
X-Received: by 2002:a05:622a:1301:b0:4ef:bd1c:69ea with SMTP id d75a77b69052e-4f023ac7091mr57541941cf.65.1764871799920;
        Thu, 04 Dec 2025 10:09:59 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027669f3bsm13547891cf.6.2025.12.04.10.09.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:09:59 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] rpm: handle CMake Python paths in do_configure
Date: Thu,  4 Dec 2025 13:09:43 -0500
Message-ID: <20251204180945.3112334-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204180945.3112334-1-tgamblin@baylibre.com>
References: <20251204180945.3112334-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227319

With the Python 3.14.0 upgrade, rpm is finding the wrong paths with
CMake, leading to a QA issue for files that we have listed in FILES
already:

|ERROR: QA Issue: rpm: Files/directories were installed but not shipped in any package:
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm-4.20.1-py3.14.egg-info
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/_rpm.so
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/transaction.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/__init__.py
|Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
|rpm: 4 installed and not shipped files. [installed-vs-shipped]

Add a do_configure:prepend() step to make sure the right ones are found.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index ba967ec1fa..8aa63def61 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -101,6 +101,11 @@ WRAPPER_TOOLS = " \
 
 base_bindir_progs = "sed tar rm mv mkdir cp cat chown chmod gzip grep"
 
+do_configure:prepend() {
+    # Force CMake to use target Python paths, not native
+    sed -i 's|${Python3_SITEARCH}|${PYTHON_SITEPACKAGES_DIR}|g' ${S}/python/CMakeLists.txt
+}
+
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
-- 
2.52.0


