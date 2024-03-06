Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6983DC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:23:52 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.16306.1709742230443956868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gCW0jssS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512e39226efso7162334e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742228; x=1710347028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8XlA400S2T05Y3QDpKLTEYz5utdkqBiLkszfLQQIvs=;
        b=gCW0jssSDs+BR2h7YTf45okTtw1ALCx1QWmFj6pOoQt0op/yJioCmDwwyaOWFpW7pk
         3eKrXYEI808vINXW7CM/fajtLNLeLTc8vSruIyPe9bB7yl5tHr6DvMZhiPIoOaqEh2JO
         J8FKQgpZznXfJfe4ymJ6b6kzYgg6TFYtaaB/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742228; x=1710347028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8XlA400S2T05Y3QDpKLTEYz5utdkqBiLkszfLQQIvs=;
        b=kJAW8twlva3NtY41huXzSEo0gKDzVineSrSlSCOyXvhaJ/5OKI+lmpOvIL/+z7JNvF
         mA5266ZGY6pVwa15VSbe81lnBWtubpIqq5xJDqiGBMcUjNLcLhE3tI5XjwQita2BZ7nH
         9NVLmySXoiUfaWu9sj7XnOQzToxYXJSQW5ItxmGvv3GgsmN0dGeJObiBR633NXgGYZ3N
         LMYhs4TqdFnEn79yHx5EJuYnP3mfmVZjgnPSLBnnAKZDlmQnI6HhFNw2jQf7GmoQhpNT
         ve1+dYF3uupzK8c7AXpFvQdXD+YgS2aE3Fy7kF7PH+DATLHhyeT70AHPm8WpXRm7dYxH
         zgyA==
X-Gm-Message-State: AOJu0YxRd236Bvth01aIFcgwDjHghVde6En5sy9IwT/xOd88IwstEtZF
	oUt1IEwT4UTkmzAwXiJ/fytbiHD4f2kdvSJGEZtr5CdHI976kewDLCKBIxkEXCRgYHEH34a8FSt
	M
X-Google-Smtp-Source: AGHT+IFjbYtzk4+6I00+49xWJEmd5hwET3+QNTJ7etJtBYOtdfgiSIv5QOyXStjLGjVX/WpD4KtDbQ==
X-Received: by 2002:a05:6512:3da6:b0:513:3429:88f8 with SMTP id k38-20020a0565123da600b00513342988f8mr4592400lfv.68.1709742228508;
        Wed, 06 Mar 2024 08:23:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] testimage: Enable runtime 'login' screenshot tests
Date: Wed,  6 Mar 2024 16:23:38 +0000
Message-Id: <20240306162341.2267587-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196740

Enable the new runtime login screenshot tests which primarily test
whether sato images display a desktop correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index ed0d87b7a72..05bdfeecfe0 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -73,7 +73,7 @@ BASICTESTSUITE = "\
     ping date df ssh scp python perl gi ptest parselogs \
     logrotate connman systemd oe_syslog pam stap ldd xorg \
     kernelmodule gcc buildcpio buildlzip buildgalculator \
-    dnf rpm opkg apt weston go rust"
+    dnf rpm opkg apt weston go rust login"
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
 
-- 
2.40.1


