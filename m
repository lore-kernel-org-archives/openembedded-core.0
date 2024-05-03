Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE127C25B5F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:10:38 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.12366.1714741836588599647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dDnVr6c9;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-69b6d36b71cso46255106d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714741835; x=1715346635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQH1zNLKx9qtzbMLnbd9/4zzrAQ1yYYTPegK2snqZTU=;
        b=dDnVr6c9g2IITLA1uOTIiy5tyxufO0sB2TUBHZnKZ8yjHB49Tj+R9P1DPR9vRdxWI6
         PVQP2/qkBtyY53A9w3+6IKYotWh8L6kZa9PWVMdGt9jpVk7WBgm6U9Xx+8Diu0lGaaKW
         EDWH5MRPKoyLJvE1bqSPYe0h2IDT+W1uyyaAB4Wfqt+eorlyHmuqFBb4XVnReL0FRgXq
         CN4/3hc0m2SPFjv812V/MPUrOrAn5AGKyabbJfhLTieRQvYUmeXw1Fk91H4mEIgjM9vm
         kwyHCzLqGInVmlHP3wQVqBzfCq5AyaPmDJIctc0RMQ614iw9pyOTYzP0gsza4UPqFWZ5
         dtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741835; x=1715346635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQH1zNLKx9qtzbMLnbd9/4zzrAQ1yYYTPegK2snqZTU=;
        b=hWks1pHq8qPF8c/yLZ6d0cMgtNdnUp3AfDSBESkJGRD2AAMFptMOV9BK2bJ6yrSRlU
         ALR2M3VW/L9+9E6JpiTKWikXnKCNKjGRjozQKBtoWx6wJNNatGhR4QlAgfV7PrPBT81a
         6oGHVKKggWhBQ1wtEJM3/tyFdG3+5v3MhGV7XzYOTjOgHeISKRm3SrGbAETgFYJ5K2BB
         xtxW24aXCO8c7MsDXajw7VMJDOuugib3Me33IIYpZwX04UpF9jgo/yg8C/UWRrn7rUXm
         DfIQauGdSapuXTiSKF6eaX37ZSKYtSLRYwTuHzfyrApWuaW5aoY1BZns++h3c1ThQctU
         K+nQ==
X-Gm-Message-State: AOJu0Yysij9DD9QWjb2xILxhScsI8J2qaE+lGIC/eNhnmphaV1WB2OJ7
	DLg4rOL7Af9VwiHZuYaFc8KxzFolo2jxIt9jbt2leRcsBoxk6sXSmq3lcfgPdZNDVQAakZ2y7xu
	aDrI=
X-Google-Smtp-Source: AGHT+IGal5/9xAETMko8qOBtpVGN4RX/wAopLcpirsvE2TdgoQUBHzzc0KJrKhwx+GagKElVfQ5hig==
X-Received: by 2002:a05:6214:1944:b0:6a0:9371:9eeb with SMTP id q4-20020a056214194400b006a093719eebmr3581864qvk.8.1714741835441;
        Fri, 03 May 2024 06:10:35 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id jh20-20020a0562141fd400b006a0e94eb3e9sm1193510qvb.34.2024.05.03.06.10.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:10:35 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] patchtest: requirements.txt: add GitPython
Date: Fri,  3 May 2024 09:10:29 -0400
Message-ID: <20240503131033.1665297-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503131033.1665297-1-tgamblin@baylibre.com>
References: <20240503131033.1665297-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198986

GitPython provides some simple utilities for retrieving repo
configurations that can replace the manual work that patchtest currently
does. Add it to the requirements so that the source can make use of it.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/requirements.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/patchtest/requirements.txt b/meta/lib/patchtest/requirements.txt
index ba55ff905e2..4247b91f094 100644
--- a/meta/lib/patchtest/requirements.txt
+++ b/meta/lib/patchtest/requirements.txt
@@ -1,5 +1,6 @@
 boto3
 git-pw>=2.5.0
+GitPython
 jinja2
 pylint
 pyparsing>=3.0.9
-- 
2.44.0


