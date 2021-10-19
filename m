Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB8AC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11389.1634657686733011120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CY8OmfXg;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso3619811wms.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=14MoOie3dfwmEASpcrGvqeV99tbYPN+HQxsdw5VloIA=;
        b=CY8OmfXgJIehWmpei5jw9uyzyvT+ZryWF2QCIIsrgOtVsVyymed5EVPu5OUcW2+O8r
         TcUFr0QTV3oyZFDD0SfNlSy++tK7ptANs3P2V1hjSav7AWf8nGp/D+X0C0FOEtuDMz5q
         dNoS9JA+XeFAoFk+KPoGbVkQ4O6Fd7IoPYP86Q+4iH/5AOCI+63Oro/mv3OYvU6bftvg
         PThe9PfiIg4Pk0hCf3YZ0svet1R5bQGZQPo3nn+b2MZuacPtWKhXx8rbB3Seag35NFMq
         4qklDS3mK/JepsehM1/hNlBeGNU/yHPSTQVqYFiBqH9s5TVvNXSUZNX0bOx5RwZhFoXV
         g91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=14MoOie3dfwmEASpcrGvqeV99tbYPN+HQxsdw5VloIA=;
        b=rxZXl0LujOkuDC/9x2UJMtX4VhjUK0P95pJ71rpLtACmxxKbvr5A0dOPkzuoY8Wnan
         FFkQCXCPJB4l5aY/WmEidLIvX6fgxM7d/W6liwPUKR2oI6PI0MJ8SaUn1xIHfKkBisba
         n/h08yVTTGPm1ApleQE6dkfdN+GCFCCQSN6012R8HFjX9oSeUfJdSMqI7rwjHAof9uXW
         +96WRnlt99pLhENK+/5yf3sEyQ/SkGTy+O61tiv8eIfhv95ZAY1RBbcEhLHC3ApFiPX1
         VsYPCDk4KvOB4qhjOnPX+b/CpQqmgydzx6bhK1Lc3Q4kcOV/+XI02a8MknK7807gGVnt
         epIQ==
X-Gm-Message-State: AOAM532S7jIiP7qTt/cVCXSJ3T4u3UGt5al1jJgbz5cGpau+XzWoH3pG
	ZYkk5+8ooQP1vJdCcu9f2VfOnjyxcsY=
X-Google-Smtp-Source: 
 ABdhPJyQuaC5vzeu2Ud6mAwTJA7aOA+AkUaO98+vos+3Hxmp4++Sbhn1J7KMJopb6WNiFwJT97bUCw==
X-Received: by 2002:a5d:4563:: with SMTP id a3mr44185281wrc.198.1634657685358;
        Tue, 19 Oct 2021 08:34:45 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/65] createrepo-c: upgrade 0.17.5 -> 0.17.6
Date: Tue, 19 Oct 2021 17:33:44 +0200
Message-Id: <20211019153419.3319802-30-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157149

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.17.5.bb => createrepo-c_0.17.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.5.bb => createrepo-c_0.17.6.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.5.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.6.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.5.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.6.bb
index 60585fe580..f9fa8f52d3 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.5.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "ab96d490bc2f606570030fe50302d466fce8f346"
+SRCREV = "d764fe9b386aa8da1aca58b9bc3dc061f52e8f28"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


