Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A99C87FCC
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:51 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.14759.1753431165597431775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 01:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=XO7cfyb+;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.48, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae36e88a5daso351175066b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753431163; x=1754035963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+EK3RKasB15Sk+sq9F7OE/k69WCrB6GBWlF7lBk1rM=;
        b=XO7cfyb+t0cQ0pzLgJwb+AJe6+aF7bRgXQ7g44EyaE/Jq2pI4ARHnymG9boXHUeOZe
         SDf5wDIP2vniYzv5lvQxA6p08vfkydTpzsIR1jKaof+fjjW6ksSBx6Z8vwUku48VsK22
         iKKNmLLplragcSObu4i7TA87nESsT+MWnGTG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431163; x=1754035963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+EK3RKasB15Sk+sq9F7OE/k69WCrB6GBWlF7lBk1rM=;
        b=wJ5sBPX8ykC5WwVCFoH0aY85EQPspS7qR1Ww+6H4N3qRWiuijeK32NI/SPFi1/eiVB
         MsypPzL82+NXh2THXOtIzeD1KLILsjgcgmOY6FRpxn2UeL/n5pSJ76r+oGwwuIz41SOI
         GM2CO4cx/RYLiI4U4ndt+QUv5/to4+ICtlCplgtw92WfSL+RDf8TX5VMSwP+75lQuxQO
         JfuTGezxL2ybftaZKCAnbzw6cRl9heSMtKhzhJKJBrDV4b8/I94vlUbWK8f8xI+5ZZV1
         sD4kqmMqFbzhAE3WbFmeN5x9aYNZo2daDQqu6U2/VS/sESgB7Qi/jZs03YZWRAXTJ1JJ
         OzJQ==
X-Gm-Message-State: AOJu0YyWUH1r0kh9nGAjY4Yj434YeOUMx7cz3qjLCSunF1HMxIWVRVNW
	EQRfb6pzUK+4UYjEwOHNyIV1TIhnWc8Sf0cIvd2HydQ3SJOa0wIDDe2YLnSceiRZ31p2S3C+q+U
	XxAHZ
X-Gm-Gg: ASbGncu9xgGQVQBoH1Fg4z6pL90mCasuRWhPtY9N1xpogbsTatPk8nxxZs21t8rbN3W
	70WzujBl3LqWkTako/ZmHCnBojZ1X4QSgmVrsx7vjK/81uyGhFVC2IuZ8LZW5RwXGleE7e3qSQz
	0tgWwpMSqjGwlMhxpM+5fSjd+YaONypEaWWY+k2C5xS3ssGVZdV8YHeOevKG5bV4WRhi0SZNp0B
	kFzAeuf3wggJ7Qv2AKYcVyoRaB0vgR3ldv0fom6v0XrcRGx9Amd3hSFi8TlQ4TMs7r55kJadr/2
	DiJ6wr4QoZeazlaUJIXyAJWGQP4hU6U0EjN1sOOaoE0SKOygVLOGEORZncBqhQADQBbhlgwWupe
	l09btNtfwui03OPPZmWtJHFOMiB0hOpvPP5cyrcFwLT8imvQ2MGyJiiDJJ8039w==
X-Google-Smtp-Source: AGHT+IEDNvVw/P/LR2qQ3wG1nKArq0/+xtfVkiYORgwB8h1J45waC51hOMRqUJ5mY/HQgImF+fiVhw==
X-Received: by 2002:a17:907:1ca6:b0:ae0:c0b3:5648 with SMTP id a640c23a62f3a-af616d0569fmr99096866b.1.1753430831153;
        Fri, 25 Jul 2025 01:07:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([62.19.251.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44eaf5sm231414666b.80.2025.07.25.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 01:07:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH] mmc-utils: properly set sparse option
Date: Fri, 25 Jul 2025 10:06:55 +0200
Message-ID: <20250725080655.2704735-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221070

Commit [1] fixes the conditional invocation of sparse properly handling
the corresponding 'C' option. Hence, the related change in the
EXTRA_OEMAKE (i.e. C=0).

[1] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=a89cba2a0f8c6a19aa6b804877241170f5b6bdd2
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 5b6a5f377732..a0e0ec9c1144 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -12,7 +12,7 @@ PV = "1.0"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https;tag=v${PV}"
 
 DEPENDS = "python3-sphinx-native"
-EXTRA_OEMAKE = "C="
+EXTRA_OEMAKE = "C=0"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-- 
2.43.0


