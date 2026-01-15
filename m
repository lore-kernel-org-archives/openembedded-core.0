Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4FCD46617
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:12:07 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2724.1768504322669039901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJ6ZbMeZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-5014aa33881so1425871cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504322; x=1769109122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3JjWO2I/yU4/fYeFXwUYxulX8owBLXGRdFMgHPoRrM=;
        b=FJ6ZbMeZTDs5xX0Mrcxur/PJdvDbfLQsm3L6p/DmFX6Q86w8jSMO968MnUfS8O9Zta
         RsxYlXadcxfMM9QZoAjM4WtATzNcLkmCU8SqxzOcnqG9xJo8aGn0CvKm2dD9rz+foSMz
         NUZ7ZsbVP1MQSgK7f9EbMhh179QdD9xo0azP1CHGtG30CgiPUHCD2Op5iorIX+P96ERh
         AqjP9hV3t7d6ygbemLosEoZFN6/B+XcYTLq4rZyOVdetjAk2IU17IaNzu40LXprYCl6s
         RSdtPHxSME/X8AYa2VoEX00ZDx+qWj39bjFMI7i/5VYXWPO9ys3KuYKWWS4IdXUQeVup
         8i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504322; x=1769109122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3JjWO2I/yU4/fYeFXwUYxulX8owBLXGRdFMgHPoRrM=;
        b=bWRj5Bjay7eyyiB42LG7GWppASf7r5L4JBtm71vEGJxExNL71cZ8N/U9kS1P24a1ML
         B2OjBRP8ldIxakp6oqA4a5HDQWWgUsBRAWfOBTzkyuASFpqunhNNL8qaa7oQLoxnfS44
         I0cJ6sZXFAEgawZOlG3LtJjohASXmgCZVi2HUOlc7DBqYSiNiR1qjn46eKbDNtL+414G
         +7lGcDeucoNnrhChMuWeNoWHjfbaAEVe1QQP/K+Nh88dbdz8cX+0YXBlzaFl0fh75MNH
         1LU07QhadX4JQQxdlMirBrfl097QVzg+3pjfaoC6LyeR+M8d9F3knHuWqcrSafWtNNCl
         MjLw==
X-Gm-Message-State: AOJu0YzkgPynIF1075eDNm0UBoIIhRhliN5M4o3neLC7f0vl55E26ogZ
	ZbPZXzLSMyTok+nKiQjQdjxSe6tUM/9yRQEn2nbWSyUzgMiMZ700NGNuAWRhXVYIDb45aA==
X-Gm-Gg: AY/fxX5w9xiz0JDolpTjf6nMqp8jVDDnAOIjAuOtkCHqNjQzIllD+7wBTvXApoBATB3
	EfLZm3AI6y3KTI0c4e+QHa10UFNdhY6Yqd+4BSfMvHphNr/Tn+u+z/vIhM1tFrHewoMBNyerMcP
	gT7XpSaQRzHTKk4T783dvh9x1uOWNu7MpPCi1wndQpwJp/iTNe0xOlalQkyUXmgZXY8//VtdZDx
	d8quBrrF4mQwtY2vVd+MM5sZ4KKRyVz1uokM3Pv9bSnjFYlou2WY1oPHOxdGqE+a5GQzW4KwpDI
	unJgnb+5EMMcSVrT3t2cn7T6dYdGaEr3cZCcH4HVVdhPv2daM3p1xabawkb8e1OLze8c7pOJ2DO
	lMU3pz0MdolM06MxWUUtFi6y0pLxMXgcM5dA1qs10+vI82oVIyYVYxQt5r3TF1NowNzOIeNNElq
	aobMpMA1jp6Pq8k1gu3Osfzg/HIDena/uETIZWGB2Xj9pDsL955SLuLLU=
X-Received: by 2002:a05:620a:45a8:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8c6a670d0aemr48477585a.4.1768504321643;
        Thu, 15 Jan 2026 11:12:01 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ad820sm19228085a.10.2026.01.15.11.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:12:01 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 0/1] improve_kernel_cve_report: Add a bbclass support
Date: Thu, 15 Jan 2026 14:11:58 -0500
Message-ID: <20260115191159.2278346-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229434

Changes since v2:
- Fixed SRC_URI:append syntax (a space was missing with the append operator).
- Removed unused variable debug_source_path

Changes since v1:
- IMPROVE_KERNEL_CVE_SRC_URI and IMPROVE_KERNEL_CVE_SRCREV can be used to set a different source repository
or a deterministic revision.
- IMPROVE_KERNEL_CVE_NETWORK variable can be used to use this repo offline
based on existing fetch repo in DL_DIR.
- Add support for SPDX2.2 with a new bbclass improve_kernel_cve_report-spdx-2.2.bbclass.

ValentinBoudevin (1):
  improve_kerne_cve_report: Add a bbclass support

 ...improve_kernel_cve_report-spdx-2.2.bbclass | 116 ++++++++++++++++++
 .../improve_kernel_cve_report-spdx.bbclass    | 116 ++++++++++++++++++
 2 files changed, 232 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass


