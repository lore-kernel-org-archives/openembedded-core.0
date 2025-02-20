Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2968C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 08:25:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.45013.1740039941929714038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 00:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NiqiYALY;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5452c2805bcso790627e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 00:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740039940; x=1740644740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQlhAwYxzFzVfkPpVqTbG+V+W8wtQjGfeXuFogNj2ao=;
        b=NiqiYALYYj8l99/yZX5RQyzjBwTKoQV3+zAy1N/tkwJQgoLjeBM9fdpBxWNCIE625R
         f5o3vM6204w4Y2Png79RBSd2vrD+tnkqHFWUyr8LKlaMl2epzKKEHlsYsmklwMsg/5Iy
         E5OVqOkPN4I30QyjDfL+K3sGsPSYlHYujxsBg3Fjp/zNPmBN47s5bFz/3fUDtWMysg5v
         jwyw/tChDxiRyRl/AZnlGPyLUoniWbhV5chXphd+2XZHqe6HbxebaKAbW3805axiJePe
         h+/zbh/S3a0MO0OTUvZPNoZ2Mxm0JyjmM8jeQcfXFLpjM5sEMEJzxrMUtKJXHTZFyiKE
         hgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740039940; x=1740644740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQlhAwYxzFzVfkPpVqTbG+V+W8wtQjGfeXuFogNj2ao=;
        b=PFgDSRq8KqG+/+WkKtAQi0khN3Ihws3C0K3wOw1POgUVI109AF6aF8htI9U3S+S/yI
         jppQI2KPkTnznmr7IILtN/Vp1qWiM4LcByh9lE2gcjNakYtNWhotRwJWfE16MVCxC/+T
         OPIoGkV1+Eh3Ayn/N8FYJRyXPoZFcLHzFR2cJ26eCNMyuzgZ5ZnLIfNw8Rzl6L+tMIhg
         pAoZ1RHMbRmlu83nAzInNhuDrrNEvPtGkhRANwezgbvU5OMT/H2UdQx2g3un3BrqLor6
         PxtoBb11+JbQ496P9/dwrors9XoqwEAwCSZRvrfvCTp1QxyWZ5VmJi6mCzjlQyc2rBjR
         lYYg==
X-Gm-Message-State: AOJu0Yw1J0gSvbwBpC4l/ImNM2YeZ4i4HingPethZpabhXyhSB+KPhYL
	WnFf52lbc/eBsk98PzU+fAzi0EPzMPz1Yilc90/8w9+4c/6Eym4hzrBC0ybHmYyWKJUD6Iek0zE
	S
X-Gm-Gg: ASbGnct5e27LwnROK0wMSSPuFt4PByx3n02Err9+NyIpXU87eYsc9u+bLG12OG1gO0h
	oq98mVoTt62i4tEUou7A8rJulIegqaeW7Lhe5yQNflY+WIOoWUi5ZmZBnomFY8mqJeGDEeXwoYJ
	OY+Y5ZJo++WfP/J3oY/JSOKmZ0LrIChMn2x0fuSMA4kHC/WQLwiUu0IPhVwvDblcEkQiYTw652Z
	J92/6g6s4feG5v6pVZUcQrA1HI1b/U6DyhQLJi5KSPwi7bpOiDnnaW4DhnJ2jTP5mSt21VRZvTn
	B5mxzMKH871pyfDEvjAmFjuutIWIrxvZYnrGw6eaJ+xDWo3Sy35Nf1leiCJ9
X-Google-Smtp-Source: AGHT+IH3B50WwksUa2OXRzQf4zHj/+T20Nf+WOZWHDzYGegs9pXc2Gy02O+yb7jBk8ecx+sbvZxZFw==
X-Received: by 2002:a05:6512:4004:b0:545:e19:ba24 with SMTP id 2adb3069b0e04-5452fea60b5mr7775030e87.48.1740039939936;
        Thu, 20 Feb 2025 00:25:39 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5462bfe33f4sm630039e87.82.2025.02.20.00.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:25:38 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] psplash: fix typo in psplash-systemd.service
Date: Thu, 20 Feb 2025 10:25:16 +0200
Message-ID: <20250220082517.2065822-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211742

systemd ignores the typo and continues but startup fails later due to
missing fifo file. Fixes:

systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignoring.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/psplash/files/psplash-systemd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index f9aaa2db3d..b618be1ba6 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -5,7 +5,7 @@ After=psplash-start@fb0.service
 Requires=psplash-start@fb0.service
 RequiresMountsFor=/run
 ConditionFileIsExecutable=/usr/bin/psplash
-ConditionFileExists=/run/psplash_fifo
+ConditionPathExists=/run/psplash_fifo
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
-- 
2.43.0


