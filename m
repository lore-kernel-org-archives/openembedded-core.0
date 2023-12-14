Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A676C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.22364.1702561567667404765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amiWcX31;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336447f240cso769938f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561566; x=1703166366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfrRFhVZKOUjru69f1VLa+i4i9GFlZAaEcvcdFYqslc=;
        b=amiWcX31h+0+vXxvrU4rL8p6vUi4qn3HjqeR9e6OkIOHiYXs2I3eK85wxWUWydilIl
         m/V5v80ViuOGoSkTrkEFHs4kgnum2PwwURvUGtSA/4dwiYBrXpQgZpZG559ovWnRc+2W
         rsOfbkID2W+qiS3zmnmCcTCoWrt0Zp3AHM9izm3bneLwFsQ2nyWE5A6qFXMRLzxmATtN
         70Y7LnOa1y8k0JvoO598gWGdTRYaiZUtVzte+8diR9W9ZZtNZ88G9+waTTHcTv9CgkpU
         DGRHCCwt33FaNZWLUv+qNZS+L07BJ8C+TNM3FAtv/3Eg3/6aGF5Au/L9cXVI3FIYI/4/
         XzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561566; x=1703166366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfrRFhVZKOUjru69f1VLa+i4i9GFlZAaEcvcdFYqslc=;
        b=Uo8KeMEbnUfFcyffEXIj3qxX+8IbjAqsIVfb9taAwYUXZfGrNx47B5BuVRcSiGgQUa
         J0ANJd6oc9WWUSPqr1TGu9n+cw31vDOUGih9ba65E6TeoOrD/V2bgXQ3LrSc/s15Z0AC
         vaeJaq+tIUO3A8WLfqRdq1gULOUaarrWE55Zg8pFc+ucD6FhiTUReKbLHBPHiN6C3yLG
         zVLcw4CRveFDVF1SQpZs8wPHM2Qbq4xdwpWC0S15Vl+nA9MyHTbt0BOAMnXwGsiCPkIL
         93tL4AY3dYEKSO/k6FR+2FOcczbRIoksXKlIBCOyCHjejKAvZ7GpziGmGGrj95PBvpjZ
         /ryw==
X-Gm-Message-State: AOJu0Yzqv1C2FHvDVdOvlAP6/rSoQqtpazFH2pxeC/UEcNobbrMMcIW/
	4PfssdPHrXS0g3ZMMFblsgUVz1Opjfg=
X-Google-Smtp-Source: AGHT+IHJ6n0KLNtR2ZSWdWQb4+LLRh6FcS1FEmgxw7vfeAeFc1sY/kRuIvdIqottJKoddKdnZ6YP+Q==
X-Received: by 2002:a05:6000:b03:b0:336:4258:8dae with SMTP id dj3-20020a0560000b0300b0033642588daemr1161301wrb.21.1702561565930;
        Thu, 14 Dec 2023 05:46:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/9] gnu-config: delete do_compile task
Date: Thu, 14 Dec 2023 14:45:21 +0100
Message-Id: <20231214134528.1973602-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192372

noexec flag has an unfortunate side effect of not writing out the .siginfo
file into sstate (because that is done in sstate bbclass
from a task-completed event handler).

In the absence of the siginfo file, diffsigs code is unable to trace back
the change in task signatures if the change is really basic and
affects tasks coming ahead of gnu-config-native:do_compile.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 718f798a00e..7c5a34db4e3 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -19,7 +19,8 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 CLEANBROKEN = "1"
 
-do_compile[noexec] = "1"
+deltask do_compile
+addtask install after do_configure
 
 do_install () {
 	install -d ${D}${datadir}/gnu-config \
-- 
2.39.2


