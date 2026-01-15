Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB66D44C69
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:34:24 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38645.1768491257841667452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 07:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DbYzEcCk;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-50148a1cc40so1178311cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 07:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768491257; x=1769096057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7s5ER4aLTSJK1J2ra9yMe2myNd9SKesT5moRbtoKhU=;
        b=DbYzEcCkiRytOh7eCfHAe+3cZTkfCoDhoY3uzA3KwDT+Fhby9Y4Wobya1ons7dSFMg
         oa9nCBfevHoKOz6cXq6OZ2hg8XUeyNWvytKM/AWgh2OGRzQyk90EzdlfPNeeLN/ctVbV
         Bl+Bt6LGV9AW7bzltRnf+R36LbMWMb23k0etY79OXcICmO9wD4CwINs3I8BdP9e2eik0
         jhBs17WUkyyovk0ZvD78iBlEMc/ER/R9enyx2QBpZ/ZHZ/8I5X8V8prM/OHLp3JJjxGF
         1v8809ZJvoalw46Nn3J8MKwoNigf5GbrfkjpaYAnmxJMm7Y+EqKXvUgjIgWc3L+uuo3c
         I0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768491257; x=1769096057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7s5ER4aLTSJK1J2ra9yMe2myNd9SKesT5moRbtoKhU=;
        b=dn8+vXyErZvCUd0je0gHojpVpSzvSbYe0pECg8b6N7zwU3ywnXR4tjtcvH8G9kvtE6
         UrF0Qhn4jYtsvoeJNW+Y9DVoJYre3bK8uSEa2GfWig5GHr64wiEhqTMk8xCojlHvZjCD
         lcS98K178Z4C14v7r53YADiilxtnbnICUo9itRpeq2KuMK0caJ/IsPxoPrEcewUN1oGn
         76YskYYZOfsk+t1GQ5HDmupvula7L/O7D/Ud9XmXH+pp71B5UoBZYfczo6T6nvtQ08pQ
         yOCaSCfWez8ZzkCYw823ptHcBPkWstxhEU5Nv/4zp5xmvQVAP8kUodB6hlyzYxKJWOGl
         KNBQ==
X-Gm-Message-State: AOJu0Yy/qNVLNQ1tV6930N0Uzdm8hgvaso/mSw79MQssaZGp5Y6Czi+b
	ODle6EsIQrlhkUpATfBNzNIAjubAG1+QCqfREwwP8Esjl+3tSsWm3VwuBhA+KRr4SGlnmw==
X-Gm-Gg: AY/fxX7KzLeYtforHzSNzlFfeQ/BmnkyqeZDqP4m1X36kyYUF70H52uLp7lLPzdyul7
	JfspsfE1gEoF6wqveoXCDmdeMbe3MA8B/p0V88G0tcQI7XviiKVOCVF7J4cd9X8jPMU70yianDE
	xD/Qlk2F0XgfQ049IwN//BvrCYUdR9NUJq1nGxPB6w8E9yOHPQVUDMFjLMjio5y+t9xwPdD7uR9
	5PEBxjjFWLFX8HKrtCvZxxYx5+Zz/W74SypcacGKcAzt3vwJAMC+X5thYlHg7Qc0yOUQ5CAlpJM
	tgR97OHFP7HsjDPrW0IREjTB51qslc6lDWY4UZpHZfkH8hSrh0nTuFS7I59ncsA0+m6hoV1hw2M
	fwr+HMf1c2AQza4Z9db/lNdwi1JWzxsnvw2wVoxTafr7wE7VOmkKR8aRir/WGo1MxyOkGtBlPmU
	4j/i3ugze0LZPP4zo42BzG1EWh+wcoHtv4NHWiFRvh11LW/qR/EWlTeHJoVaXwP+4b4w==
X-Received: by 2002:a05:622a:1a8d:b0:501:3ac5:1dc9 with SMTP id d75a77b69052e-5014824e9e4mr69922451cf.3.1768491256548;
        Thu, 15 Jan 2026 07:34:16 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm204173136d6.35.2026.01.15.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:34:16 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v2 0/1] improve_kerne_cve_report: Add a bbclass support
Date: Thu, 15 Jan 2026 10:34:10 -0500
Message-ID: <20260115153412.1454732-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 15:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229419

Changes since v1:
- IMPROVE_KERNEL_CVE_SRC_URI and IMPROVE_KERNEL_CVE_SRCREV can be used to set a different source repository
or a deterministic revision.
- IMPROVE_KERNEL_CVE_NETWORK variable can be used to use this repo offline
based on existing fetch repo in DL_DIR.
- Add support for SPDX2.2 with a new bbclass improve_kernel_cve_report-spdx-2.2.bbclass.

ValentinBoudevin (1):
  improve_kerne_cve_report: Add a bbclass support

 ...improve_kernel_cve_report-spdx-2.2.bbclass | 117 ++++++++++++++++++
 .../improve_kernel_cve_report-spdx.bbclass    | 117 ++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass


base-commit: 0ed4776533145c901611d7f4f942490e33481335
prerequisite-patch-id: a3e47db25577688655f52f1a0ebf3e53dd0107f5
prerequisite-patch-id: 1f3d87c0445772c79310afc8a1afbb25ee6e46d8
prerequisite-patch-id: 4667d64f5d65fb71a41df271d95f153e4928b54e
prerequisite-patch-id: d67350e38405171c8e2f05f6747a2e30199421b8

