Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D2BC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:03:25 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.3477.1745395401691565758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=W6S/B6IF;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30de488cf81so61078261fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745395400; x=1746000200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wY8bXYDaE/DimIPtmSu7MmZlSzDnkhFQb615lJNlis4=;
        b=W6S/B6IFiLKRmi4qABClacw6+0Od53k5bzChYNyD+83PBj2Vy3LonYdyjGtHqKKn3a
         Tm6rQv9JEgXoqEaCYXDoDHdP9LVZwibiZH5ayl2Yjd+FjLNNcGLqxTYpxqCsFXh0liXO
         6IQpWO9o4KyvOLI7AJ7z7M016SK+oOm/wdJX8jixQZ+agAkrxz2Lt1WRWa6OoVnPiY4N
         sCMaP1gLwAkT458Relgp//ue5w9d71kn5RGUozfHuJPZtcCwxbSC6UNMlZxl27azLf8b
         Z8zSIxad1lHtHjMRzY020eKXjlSPI+nx7OUGv1U5ggEppDQaWHxPfa1aI2EyXmHcHfaZ
         MamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395400; x=1746000200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY8bXYDaE/DimIPtmSu7MmZlSzDnkhFQb615lJNlis4=;
        b=MUC8ar8htOEVo//VzpVu70sgSxvm/nvqvKdnVw0jo6XEUEr98xkfewUpmqySocZc+a
         XI7negNm2K/pvJ3S8W7jIGTaHM7jfHR8svADEduKbnBoG3l89C6rjojeQeBK76wgVQkp
         kqTRWG5wRea8wE/B8AaKTn/t2SoLLeppqWedEvAN9o+qyK5MmmEOosDvO3bkaG1ylSic
         sqjmXWMbj9mbKm/WnHdAgRnyvNYiLRzmviUSgAAMlv3ensYTApuya/IUq3l14xCfl1Ip
         57McyL2z2Nz9AhccMO9IJGzNVznvfTIXG215NYg05OWDj/1fPQNd4e94SzFpYkqAyxeE
         Oq/g==
X-Gm-Message-State: AOJu0YxgFFMTVquQ5HBFaw+XjuUffuLcnE/L90HZ2NFe/uMFORDmAmpU
	g4hp4TtnjIkAfTzqjWqI/AENRbKKpsK5N91BDPciB0gB0XTlnH5PtKm4YiEHfP3G5wnjlyCDxkC
	Wa5g=
X-Gm-Gg: ASbGncu/6nhCLGFZn6wt46m0pnVPCk1ekxvAyapXiP29q5QKLH6Zy9sIn2skAdSmsGI
	759OV6tv36RztMlayyINcYzl/skxu9euMS6JM3U3DCmDlyWjQhPJ2j54dR4ewHZEcGaoU4aWWG5
	WL30jdidFmIV0IJIZm/0ElKifdhXYqBJoSu0872nKu57gh9CfsUzdBDeKBlyWa4YJqQ7F1ZewlX
	2U2X9W0z2dvw+hC4Vy54GJ6+32CV0NQQdEmGjMhl7QnUfq4Xev3TK4oraTGnsjBoKA44HV2vEy/
	NjY6+vCx1KoE7PLq4GWB++Ub/N8x0mpSuwGxbHTccU70O5wVUWMASoHjsn5vcCNJ3p+Hkdi/j9v
	aeQt5sGmB9Tsrlc3CBQ==
X-Google-Smtp-Source: AGHT+IFQbJKeHeGn5dtj/LY6zix/1o3NjCzq3M2zRfC3XIez4la0Jkca2LaSuGrA6cTxz9UTTbW+4Q==
X-Received: by 2002:a05:651c:1581:b0:308:df1e:24c4 with SMTP id 38308e7fff4ca-31090553ecbmr67551291fa.29.1745395399600;
        Wed, 23 Apr 2025 01:03:19 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075f2aesm16951581fa.23.2025.04.23.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:03:19 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: poky@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] kern-tools-native: update to support modular kernel builds
Date: Wed, 23 Apr 2025 11:02:44 +0300
Message-ID: <20250423080246.128723-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215264

After this update scc tool can compile options as modules
conditionally without duplicating config fragments when
the options contain a comment like:

CONFIG_LEDS_GPIO=y # OVERRIDE:$MODULE_OR_Y

Then "scc -DMODULE_OR_Y=m" converts these into

CONFIG_LEDS_GPIO=m

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 6dd19f1f09..20b1bcaf37 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "c8c1f17867d0cc7d04be225ba4901f2373428be2"
+SRCREV = "fe67c98d2e9b74af44d0c4b660fa18e3a95e7edd"
 PV = "0.3+git"
 
 inherit native
-- 
2.43.0


