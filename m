Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F35C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.19160.1713529201900213286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eD8MfCKu;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51ac9c6599bso535833e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529200; x=1714134000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blQ1KYyAnUkMDlDQ71LRYCeYeH9Jqj+vomuxTKAyw/o=;
        b=eD8MfCKuq/6SbRDe530g50w+m9yS1xwjhdYys3UmYJ4JMBUXNqRU8XOFn4b3DXpoAK
         O1Ce1OLYC1iHAnX4Y9IOZITc/+JCvdeff8FVIV3ABq+VpcycGTu+3zNtOA1wIqPETUQ3
         JTuxFVLsiTnjKJAPhl8GFC5ro51NZtvyggl6lsFqZ8jTK4UXGmochTd21Q9QV+q8gM6R
         7Bh0ZM7RXqQTMMaHffaNzm9z18iGQQzcaLgeXZPSDRmVvrcly8gGUzSXrUFhKNI4W0gV
         +GQ8hzfgUWdtWy2D1/WRRMcPQZnueV2AYOzq8fW4iSURPYWgyqY0EmqfWRKXMDAQ0+42
         CllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529200; x=1714134000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blQ1KYyAnUkMDlDQ71LRYCeYeH9Jqj+vomuxTKAyw/o=;
        b=XzsZnpSuYe5n5kSzQ9F/jqDC56Fb1pau0bPXSlhKBt6+4aUGS6dn+36iCc/+Lyt1qn
         A/8nBN0vT9RZDRaEZwVWxS41JnLu/2+PTKcodGqU0M28E9wm+vQ8vNfp4yaSviLTuG3v
         fCAzdLDrCvAvVIWnSrHDWXFVuEI1V86AfGa+5YzKfBi//Xr7hLjcm6nFzuVDzWEn2Rfe
         w2dFw/eUwYIlV/YfK/ddNjzRS4yT8ktMZnxzmILWyjW1yg4KU07/ZLxGPp2Yiav2UI9H
         tqFdqs8/WjkJ2a/WJDWa64ECPZCWxUtjlSHSt9R/zCf5e2najmWwq5oSWxd7uRLBe3dp
         cr8g==
X-Gm-Message-State: AOJu0YxZPF1VEwc7eGwczNf+Rk69qXdPDkuUjRR5r1MpSG/pMY/ZfxaA
	V0KaNX9OeQyLPGbiicQQKdWLPJIbwFXNoEN23CzXzqNAuekyENebA8Aqdw==
X-Google-Smtp-Source: AGHT+IHFuJEr0viSen6c1n8Vdv4PUf7fzk7j5zSZhGV87sNrf4eg/QO6mB3wMfOuc4cuBLhsnH3f/w==
X-Received: by 2002:a05:6512:e83:b0:519:b4f:51d7 with SMTP id bi3-20020a0565120e8300b005190b4f51d7mr1848841lfb.68.1713529199886;
        Fri, 19 Apr 2024 05:19:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/19] xinput-calibrator: mark upstream as inactive in a patch
Date: Fri, 19 Apr 2024 14:19:42 +0200
Message-Id: <20240419121945.1920944-16-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198544

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
index 86982924a81..de0862599d7 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last commits over a decade ago]
 
 From 14734a93bd3fc323325459e24b04795422e395e6 Mon Sep 17 00:00:00 2001
 From: Laurentiu Palcu <laurentiu.palcu@intel.com>
-- 
2.39.2


