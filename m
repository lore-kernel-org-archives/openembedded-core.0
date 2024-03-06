Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7688CC54E72
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.15038.1709739740740340502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TsYi5eXU;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso9873233a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739739; x=1710344539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1X44rjWBxZq6WiTPAgzPuXv4lkQPr6XcBNgb8rxrXg=;
        b=TsYi5eXUe3XT1K9vcmbujnsHwNF+g0eB0CGTTeB4/bwnj1AwFk0gzVPEEi4nP01+PQ
         El6QoyW9mCcky+goLwjkL1fbD0XkSogy/ilOPUpgjcqmLcZR+qqgvg8/3SF+6S5LfldD
         W/OBISohJLuxoEUBDR4WT7gIDjIyB7TO8my9asWEJBf991sQPOaZlicbGLnwkBgoaBm+
         d433ZiB6ktBv1vXFr5LFwVNa2TbQn6+XIHyt0DRJC2wwpkTf7L6wHUSWXMGTF6XYXEPD
         IaOoQ4dpOpGA7SqHsRPgVXd6W04aeYxlV8hNuoJjpfhAs19iSgkH7aBBsu4ozgJU69Lu
         pYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739739; x=1710344539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1X44rjWBxZq6WiTPAgzPuXv4lkQPr6XcBNgb8rxrXg=;
        b=NZEEvTN67Kh/lN3dsX0YWggnab3DdCYHpYK/oKA+X31gzuZ5bq049lSo/vqlIlc1Sd
         ndT0J1ZCwAwHVHyU+pBn2RQV1vQUnyDdT2Ii7E++hp7HzRaRj3+R7lOKnHpdQIkAH5C9
         ewW/70lMdSSsev/zvvzRUVWPeABKrtVCxPHBvdQDMrRLDsbozmBPTLHtW/RyI/30yX3A
         Sagz0IksRHLNsHIuzqG9bFYGnfCBG/AQab5Wx/bYpHkFlmF9w6GC4xgAteQtjgZXSCMq
         Es+VCtgJRAWiEF8hOoK8cJ3ZcoMN17/6C5DSqkGBN5QGp3reslmiqtt1nEcIG775/r1s
         8yJg==
X-Gm-Message-State: AOJu0YyV9ZeVjyivsmZdxOaJLAtQM61BSw2glmdUFpO2NtFPYatNxcXn
	/NEiq/qx8v6F2anljzP4W5xgs56wCiR/Qu2EVfhA/pBLfcIxLWozTK4dJfFl
X-Google-Smtp-Source: AGHT+IGmoDBzr1rtN9Wq2y1JdYZ6Sj9Zxpe3P9D7I5uCzLygf6BPPXdoFqVijpwGcr24Kd5L7ss2ZQ==
X-Received: by 2002:a17:906:d28f:b0:a45:110e:568f with SMTP id ay15-20020a170906d28f00b00a45110e568fmr5843680ejb.37.1709739739176;
        Wed, 06 Mar 2024 07:42:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/47] python3-dtschema: upgrade 2023.7 -> 2024.2
Date: Wed,  6 Mar 2024 16:41:38 +0100
Message-Id: <20240306154151.3741709-34-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196717

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-dtschema_2023.7.bb => python3-dtschema_2024.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.7.bb => python3-dtschema_2024.2.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb b/meta/recipes-devtools/python/python3-dtschema_2024.2.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-dtschema_2023.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.2.bb
index c1dc3e019aa..0e911dfb3d2 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.2.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
+SRC_URI[sha256sum] = "df4e5afb35bda93894209d2465e87fb7103f1a95a05909ebcb594fc4cf4fdd1e"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


