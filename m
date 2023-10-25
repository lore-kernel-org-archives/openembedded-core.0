Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B344C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 15:47:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.176911.1698248827540170585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 08:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zg8FOXwr;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso45967725e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698248825; x=1698853625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy5zuMpicCozS0T/p7DwIkyVEA5KFMZFCqYTyDt2reY=;
        b=zg8FOXwraThFdcfy+VV9Iy2YmOPQYWVBZMiQQzcYvzxxIubQc1HF738fdcWmPb35Go
         HoMuQQK0w/0Ra7sC5xcftwau7owhP76vdj/4YU+3CNFCxKxi/AK/zewJzqHvm8nGAglr
         ggrYvwMEMeH0YWmKwTbNLR3tHKApdYSyGc4mVXAtrpAsmkrRQBQoprdY7HFQW3kJZxXl
         P8qzG5jSgJyoNlznafeTlKFn0eWz54LJpWYLtL6pJvFw+CDgNVmkFJDTFilnZOFqCk1S
         JI5zV1ojv9rbjlDmY6+DT2iicJou27AVaNYC6vAN1xGykafQ8K0HysCAKfCsf/cxA/IV
         q4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248825; x=1698853625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy5zuMpicCozS0T/p7DwIkyVEA5KFMZFCqYTyDt2reY=;
        b=KAIrYR8bb2sGTHvG3UU99q8DLRqCCr3PMLCFM4DOB8W+UuKqaiiZsQ2MUUbrUzOIy/
         rRgt+MaCjOXsb2xuEbK02tD9l2FGgP7G/5jDy3iRTxOWQWrSHiPdtqn3JtoOR0rhdjvk
         FgFy7UbwUrnyxqO9qp8Kh3v+nSJNWBEWhulE1baZ1MvBUzXy4mnAOIZcR9pAugJNMUNi
         2Ald/6d2kMnMiSS/1fQQ83zq+O2c/5mKgscnLioMhAvHtgsrlYavUQUOgsJd7XMDOvmF
         IR/fy04MBXbOCqKS6jEri+pUQmZIRQIcZFX5tH0lp6OYKHJtwuib27ixxLew38DsJJIA
         bTtw==
X-Gm-Message-State: AOJu0YyjQ2kwjp65PU1I573YQu0a9BHIspS9c/5mf61jbUg8c12deMNo
	urMYDGCho50DjNBx9MKxB7Oof3g/+txuTErGUBYRAA==
X-Google-Smtp-Source: AGHT+IEj18AKMPn57CcgdVO1hoPxmrNpQuuoZOOQv4hGw3GPFuuoqLM/yalu/PvI/owz9S5UgVNbBQ==
X-Received: by 2002:a5d:67c5:0:b0:32d:b9c5:82fb with SMTP id n5-20020a5d67c5000000b0032db9c582fbmr10987535wrw.30.1698248825505;
        Wed, 25 Oct 2023 08:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b0032415213a6fsm12301964wrn.87.2023.10.25.08.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 08:47:05 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 2/5] scripts:recipetool:create_buildsys_python: prefix created recipes with python3-
Date: Wed, 25 Oct 2023 17:46:56 +0200
Message-ID: <20231025154659.2442373-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025154659.2442373-1-jstephan@baylibre.com>
References: <20231025154659.2442373-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189683

By convention, all python recipes start with "python3-" so update
create_buildsys_python to do this

This rule doesn't apply for packages already starting with "python"

Update recipetool's selftest accordingly

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py       | 4 ++--
 scripts/lib/recipetool/create_buildsys_python.py | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 48661bee6f2..d3aea74228f 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -445,7 +445,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         # Basic test to see if github URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'meson_git.bb')
+        recipefile = os.path.join(temprecipe, 'python3-meson_git.bb')
         srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
         result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
         self.assertTrue(os.path.isfile(recipefile))
@@ -479,7 +479,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pv = '0.32.0'
-        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
+        recipefile = os.path.join(temprecipe, 'python3-meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 321d0ba257d..502e1dfbc3d 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -297,6 +297,11 @@ class PythonRecipeHandler(RecipeHandler):
                 value = ' '.join(str(v) for v in values if v)
 
             bbvar = self.bbvar_map[field]
+            if bbvar == "PN":
+                # by convention python recipes start with "python3-"
+                if not value.startswith('python'):
+                    value = 'python3-' + value
+
             if bbvar not in extravalues and value:
                 extravalues[bbvar] = value
 
-- 
2.42.0


