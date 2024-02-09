Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9497BC4829C
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 09:37:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7873.1707471446375272921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 01:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IWQwUiBc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4101fc00832so6104535e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 01:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707471444; x=1708076244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1EbSNVP4H7lDQwQpNkeqHbX2Vhtc0ss4nB4wHfAiiY=;
        b=IWQwUiBcZXW4jeOPfmmp7MInD8HlljGHK8+f3PPhezPy9oGBKlKVMOwCUbGCHvZel9
         57sCelIgVgOHClxdJXF2r222vY430DErW2mCXYW6fRlfWFG2+lFHB2/I6CdEnna8RBjF
         JgVsAS49opbEcCcrNs6hnOpn98GxkXZwOlO9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707471444; x=1708076244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1EbSNVP4H7lDQwQpNkeqHbX2Vhtc0ss4nB4wHfAiiY=;
        b=mJuaNggalC3U67Li97WUTk+wnWA1tWaEau5GwHiYeZ2k864i+Y7sn9y6jvj+9/c35m
         uUWejrT4ihY4lMo0rWnc0Ec4ojQg1coUEu4LVVFQOkQ0pr8TmakAjbPiU4bT3KR6Tl1+
         gE6wTFLA0cnKtnNmCzWW0RDjdhTvfoRaOmlbbQRkyvSxlun/zjgf/n2uENboj9iN29uv
         cY19NpVCRxmNlXY5Xe8I+Z+dc20f+k2D+LpiS0rToORHXgSuk8YsxXjOhVzkskDY2eou
         ZIHE2bPT1vKOaMoCOzr7laOP7dCcz2R19Vyvs9OqauuueryNh/SuDYj9mz+xta4at2m/
         922g==
X-Gm-Message-State: AOJu0YzGmd7uj/wKCz+Im3M0pOPa1HoB9mHmbJJmiwfh9mWW1F7iLThN
	R9Kmotkk4+M/rrI9IDS/mfKKMnLblxa/Em8xfYEVqNtZUcXV4FFPO8qqhs99GVWRlav1YXXTeas
	1
X-Google-Smtp-Source: AGHT+IECCZtAfdA7blfaVnkeSkxq6z1xORFoxp0FFroH02niUWXHbcdFa8ZYWw1HcRa7ocM7nJYsVg==
X-Received: by 2002:a05:600c:310e:b0:40e:e6ce:71ff with SMTP id g14-20020a05600c310e00b0040ee6ce71ffmr736654wmo.41.1707471444104;
        Fri, 09 Feb 2024 01:37:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d554c000000b0033b5ee36963sm1330764wrw.23.2024.02.09.01.37.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:37:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] selftest/recipetool: Mark two extra tests as needing tomllib
Date: Fri,  9 Feb 2024 09:37:21 +0000
Message-Id: <20240209093722.3363011-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240209093722.3363011-1-richard.purdie@linuxfoundation.org>
References: <20240209093722.3363011-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 09:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195194

These two tests now fail if tomllib isn't present. Mark them accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 780e25b6c82..9deafcda0d9 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -451,6 +451,9 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github(self):
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
+
         # Basic test to see if github URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
@@ -675,6 +678,9 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github_tarball(self):
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
+
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-- 
2.40.1


