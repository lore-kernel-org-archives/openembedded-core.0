Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C731BC00142
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 04:58:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.142544.1698641891208524179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 21:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFk7hivo;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc53d0030fso1853465ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698641890; x=1699246690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B66FUx0laQKk7fMNoZ4FDFYY6jAueJirkWN2EZEDf/4=;
        b=lFk7hivoFb5qtMcApswriOtKZXgK+yRFcptbt9e5aomZ2b4k6mPcUwhpN2E66f7VUa
         PKGthu6iayWyymXByuS6YENZ99dI7FeOxrsGAJN4n/GsFe6f5R3hNB24Xl3hwRpDk/l8
         y4+qq+Mu5aVJJtaYepCIGbg7g2/hzBcDM+k4IYNP9v+PMJrqv4inae7PjbiTUfY07OR9
         ggtTu5WC7C4LuL16jSc76uMfq1RCSpG5lN0t3k83NeeWRKu7lXvCuqnjd6tNiytpMzrp
         /hMbrQWzOWCjOtIQBnQPfbZHOtF0HF1rMvyDinK9wFZRw2Hbv4lpPsV4VMBuaBT1vE1o
         XJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698641890; x=1699246690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B66FUx0laQKk7fMNoZ4FDFYY6jAueJirkWN2EZEDf/4=;
        b=sYBJfZx3vpO6aEv7VHqMo1ejtisrRZ0KWkO50yt6GRfxqrU0v1vw4VPeDGSscWqUbt
         ablpcgBvy90QR5IbAG9Vrwr8894RVM4r4Y7ChJgnfwx5fY7x2TiLImqOR/5z0pY2BTsm
         t+XWPB0Kt5HRAheW3Az4GWD4FKffTr3K9b6ngpYj1JndzSe/WFISoZJIcH7mxQ2ijDz9
         WznxTg3M4hZIAimo76OyG0okVRkxC/eQgXYyTR9yXRFdlcBK4ACBTKoR4308Iu5jxwHC
         E+antGfj2ligAZlQFOtguVSthG7XI4YZPr56LJ6WWEAia1vYUgIL6IV7jXpkhu/G1ntF
         bo7Q==
X-Gm-Message-State: AOJu0Yyj5Z4kBwIHT5z6R8FQKPtlaMhQKKNosf6tWhMDi0PCTrZ+VQeT
	8KkRi23o4uC6eoK3Sq1Nal3EVnVTJeU=
X-Google-Smtp-Source: AGHT+IEaOzlT0k6C5MVqKwHOkN2xHRsg8r7Or1D8dOcRzNUV9HZiykSLn7zGhhub7hnUZYZHyq8h2g==
X-Received: by 2002:a17:903:230a:b0:1cc:436f:70c2 with SMTP id d10-20020a170903230a00b001cc436f70c2mr3959434plh.9.1698641890187;
        Sun, 29 Oct 2023 21:58:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709028eca00b001c9c5a1b477sm5110588plo.169.2023.10.29.21.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 21:58:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-urllib3: Upgrade to 2.0.7
Date: Sun, 29 Oct 2023 21:58:07 -0700
Message-ID: <20231030045807.591890-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 04:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189788

Addresses CVE-2023-45803 [1]

[1] https://github.com/urllib3/urllib3/commit/4e98d57809dacab1cbe625fddeec1a290c478ea9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
index cd2a9dd4ef1..c286838086f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "b19e1a85d206b56d7df1d5e683df4a7725252a964e3993648dd0fb5a1c157564"
+SRC_URI[sha256sum] = "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


