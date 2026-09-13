Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3FBC88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:25 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6008.1789330337161101820
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QxOVcdD0;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so4199745e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330335; x=1789935135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pYmRu9Yofwvhqmmn7ZF1Sh5EN12SRWBr7kBoMdAj2aw=;
        b=QxOVcdD0SOvze65FTSVdPrA7fSqWpoeAfs9csdsmHr0iWE33SCuxc+aM91CO7jd9TB
         XsqbDtwJvIARJIWOiWIegzmS7PdaDGR1gDtmL33Xl5dTnjS41KSWAmo6kCSuID4cZGCZ
         e8kGpVPFVQRFuftkjY2VolThxmNB36OUEcXYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330335; x=1789935135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pYmRu9Yofwvhqmmn7ZF1Sh5EN12SRWBr7kBoMdAj2aw=;
        b=rX3POMTj4x7UHa+IsTR+c+F39vdWUeFKHQa2PsnV/OoImtWEh34IPj61U4fOBcYiIA
         vPi3hY+9KtL1QE44m+8k8ukaVs/js4QvozJWv82iArQ3MBPobtH4WK/zsQD+gg1jH/3h
         WsB9SR/ecp1TDW4h3xvnHzOwl0a2R1GmBD0+91wauZstRSD+9F7paoF+1Jx2tTtVc3uR
         LWxcihbS64KcKUmj6Y2fDr+hXMlMzAQkFDOtlVGcnWKon1sB5+gM+5YXg0cmlwKM+5tT
         My9XqspPWFcAdLn9TS7TKhvy7Jy1k2NFUL3vA+OpNw/EK6+PfuZEa7FVBcORSZqbgOWJ
         TFLA==
X-Gm-Message-State: AFuF++nvAcH9W2sRHSVK4g/s/jakg1fS9EdvhxW0PSwzzKRuLriGdcAA
	Y/kNA+RnkKyUP0L1HClD1vQ6/VsgHa9yxMI+znsj903puTQzM9sFok+BW5BJfGX/2ONUWIsbWgW
	kENJOMr4=
X-Gm-Gg: AYBFou1H3rJlfYoh7czEKLwPn5gbBfPwDxsiKaV1fOidJb4EBJEQsnvGBcTvQcsDlTN
	SshWL4bKUhcdAkd8l6Vdd0JST7028Yaokfgpz5IT/BRi+1aW5NV9XF9OoZ7uRiPA642E6w+/spZ
	yUO8ksZ5BpXgTu11IoDCEEkIh80LSH+n7UXEMP3IoxLTcRx/qA6GFIioGvGgNC2H2Adgqx+WqwS
	cq1iap3jNviezFcVpf8vK72jxo0/jQ+9fxMJkZwbPSNXITc4Scj0TnPy4IcCVMC9E0LOuX5kkjU
	bjU29c3IQkG6Vu+RVQhaWdcWbkwakvEVDSU0T0CLHCrt5asUzl+T1llAjjpZlkdjifglgiRhbUz
	uK4ypEFI/U8cqsOpaIdrBNonRRKJ+uRvyrb/xsQ1XSTuoyfb579Q/fwpyW1aAfZ7GUciy/QpU3o
	LXjkQbroDva4ZqrYpzKpPWquWMQ4ZUp6z5uEt8zoBOW4H4aVQrhWSe7gkMNpVB0lMKC98MAjzuW
	YABFL/mYEbUPWrsZ5/8ifg84dahFw==
X-Received: by 2002:a05:600c:6096:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49e7602c657mr42040505e9.4.1789330335440;
        Sun, 13 Sep 2026 13:12:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] python3-uv-build: upgrade 0.12.12 -> 0.12.13
Date: Sun, 13 Sep 2026 21:11:58 +0100
Message-ID: <20260913201158.687889-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245738

Python
    Add GraalPy 3.13.0 (#21431)

Enhancements
    Verify hashes when downloading PEP 658 metadata sidecars (#21563)

Preview features
    Respect ty exclusions when uv check automatically selects members of a virtual workspace (#21555)

Performance
    Avoid full wheel downloads during resolution by reusing supported hashes from direct URL fragments when metadata is available separately (#21279)

Bug fixes
    Edit Windows entry-point launcher resources in memory to support Nano Server and reduce antivirus contention (#18713)
    Prefer core-metadata over legacy aliases in JSON index responses (#21563)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-uv-build_0.12.12.bb => python3-uv-build_0.12.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.12.bb => python3-uv-build_0.12.13.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.12.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
index f75eab5ee8d..51e85d5a857 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "cbcfa5191898d5ca277faebdc6ca612dd4afb1fad25cd7948f43484a8da022c3"
+SRC_URI[sha256sum] = "46936ab24c8674be28df2784a9ca2878478a84a98e6ce3df5cb976102e99b8f1"
 
 require ${BPN}-crates.inc
 

