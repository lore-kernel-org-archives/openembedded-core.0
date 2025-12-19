Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE4AD7494E
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9483.1766114596186941262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IqUJkPGY;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a09d981507so9439285ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114595; x=1766719395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix8gH9ZPmCqL7Xh8TSaK1REyVINGz6Tf91/6AlI8qlA=;
        b=IqUJkPGY0wpphjDKaUHX450+v1JX2315oZlmUeMgXS1aZD1zYJLdNncNo1RC9qdefU
         MSNaHmHc8pRRJlCAc1Oexl7wMJIG8ciByr6ClG3qKDw+rYW5qKDzKwJSh/K70N1/mNXQ
         U0lwTcA/WkqulJP6rIu1GXNFArOKcg5TNf5DRD23edcYFbPe0DNBLbgDTuB9IZAeS6jF
         X5Q5PQ42DU9gLYgRvA3sU3oXipkdo4SnTUynmGzUDvZLLWSYONQJuduvuYdhHOL7nniG
         w8yicOVfHDspAIixZZKUkOb32AxE4+9W4i7NOPGkl3K/UIBEE2W23o/ZYUGPZvPjakPB
         Kc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114595; x=1766719395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ix8gH9ZPmCqL7Xh8TSaK1REyVINGz6Tf91/6AlI8qlA=;
        b=rgY9lSjFJSvskSOeiIH58euQuhZonRE0hhY2XAT7/Qyox0LPOmPrqpvklVTaz1J22u
         ksSySMa0VOizyTM8hvG4nHrLh0m5easVGwosw5nNDfVPtbQVeya4agNJWaZox+/KDviu
         d+QfJ0LqswU2aLUllc0JO3DGbdMZL+CRnut7WJw1z/HVhQ4aseYIBMdf9nnrJ799VoMq
         Lz2MvfK5PZRMGBzpdJzwC3UwXvfzcc6wUWZrkmYq7UWPZ+8mFz1CjlVMSILixIKBhAyt
         Gl7DMHTiVgP+ppML+AgzytAyjVocK3A/GVFaXT2PMwUStg/Rpv6p8vQVBUXbX8kKE3QI
         HyGQ==
X-Gm-Message-State: AOJu0Ywa2roBRQ43cP9wTXV1uzNbG4vcdsZ/ZatAqBUxcCQxNkQ1jYNK
	Pr2FSnXCoQqXdXRbbt3zFXmcNfpzYaDBDNeH6+Tb++/tMLQxxMj97vWNWzMBNw==
X-Gm-Gg: AY/fxX4Q/H8RDxuEc1bNR10j3I/ELvvj7ODeUviceWk+NrcQEKS8QWH3NJavhoQaZVx
	n+qhqTROJQh4698S7uot70sRS0B5dE9zvrPqGAj75z75m183MnQmIZK5F7l/OEZltRs6vlsyrRW
	HbFXXBCj0giWU6zRaLBDgaC7ZVZVdTeYtMtTILOn9EyEG8k/+wWUwY5swb1ALu/KBLGKVBqfQpl
	ljAEzQJNSfzF7oAYYPJWv1dP48ktMEQRxLo8Ac4aHorUos5UMTHjaHlVEhvhtrSC8aINmSzSD3w
	kMvZBfW5LeC1pMHozQbDOpJeTvHqetUhXwVzcMuattRAtjcRNI6F74oQmnQp7n/wMDbEFQJ/Ft7
	hlKJ46DABDxZS3ERAIMkcrtAh04GfJVqEXkPD42m5ynUjE6tebas+T4PbCYCR0T2V5qw9kNVI9W
	K8/B95CZ6x8bLNZOqWv5tb8WC+
X-Google-Smtp-Source: AGHT+IGHohG5Ymhts9PMbZzbP/a16Q7oh8jqz460Myr3bBSBsDz58SROXih7+gFK7kBwPF7/9dJrpw==
X-Received: by 2002:a17:902:dad0:b0:269:7840:de24 with SMTP id d9443c01a7336-2a2cab3259dmr41020985ad.21.1766114595381;
        Thu, 18 Dec 2025 19:23:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 22/29] mesa: upgrade 25.2.5 -> 25.2.8
Date: Fri, 19 Dec 2025 08:52:01 +0530
Message-ID: <20251219032209.960840-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228190

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Pick up the latest (and last) release from 25.2 branch, fixing several
issues with the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fb953ee296577db183733e9f21d8fc866ec4453)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3124db0986..cf2c2a57a0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
-PV = "25.2.5"
+SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
+PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

