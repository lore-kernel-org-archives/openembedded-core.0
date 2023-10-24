Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5389C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:40:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.149462.1698158428268560044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wfabYKJS;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40859c466efso25240175e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698158426; x=1698763226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy5zuMpicCozS0T/p7DwIkyVEA5KFMZFCqYTyDt2reY=;
        b=wfabYKJSo7bhbh/Aapf0LfBrGu4RoOXRM8iMD5dIrumqozJmZx+EF3Nk3u3rNYfccz
         xHyPsWfSN/eGsxEU0hCPPPUgnwOlHib0+q2FgsV8ulwUCw1i/dRtkfGVzeijCpivL2pa
         TFdpf2LgsYyN9siKvO20dIfUA6ZWBwD0BPboHQRJcIVMD62aLldn+aDNzt0YnDtB65EA
         L9aaqjJVJeYDWeWmjPiaKWkS6F5ud8WvgvfOfXreJ+GQnyjPg0tgflFzGo90XmwSSzKu
         3vMmAuVl4/7nnlwB7vRGP5Sq7FFQGpmorq3DBeIZr5DMDqymgMRgv695MvBF4KtxWvkZ
         mSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698158426; x=1698763226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy5zuMpicCozS0T/p7DwIkyVEA5KFMZFCqYTyDt2reY=;
        b=SaWjfDPo1vSdaKzBzWKXbMDtJ+SwNXeB//sV+FWS102Zf9kDSZstvyL7tiu4NvEejc
         IvOv6nqmEwb3729NXdfuxLPT5ZYBAQCk3bVBZf+7DVVpjOSC4l+bTY4M3j/jM0OW2gnP
         TV5j73vYWQnmhohR1BCNi08ReU8bhzbgJZx8z9Dkx/zyNT4DEfZmg4z6jyOZs7ozteL0
         xU30Gwk5L5jmpjevfDexV6k+A2ptDA86SFyfmb/chdwk617edTvtzq1r/iHocg/7YHJm
         QKwy40iyxWAZa9PCg4uZGNR0E9ySOsZri6hqiPMjlp3xJv7ftkZBCT8O+GDEeWh9fQMa
         c8ww==
X-Gm-Message-State: AOJu0YxwnzW87fXSIwiBE/5yKPO41ySwXcqUKIjiVMWLd6fWf5gZS5Pn
	b5LwPd8PAhRKlaW82hqOvGii84pFa5idBKqR/6jrhg==
X-Google-Smtp-Source: AGHT+IFIpdLosCaewKDrf26UR5n2l1oYqnhKk73Qkpcm9QyPXnq39QarsL3FfdTnegfaZx22nqO9eQ==
X-Received: by 2002:a05:600c:1c29:b0:408:3d91:8251 with SMTP id j41-20020a05600c1c2900b004083d918251mr9470917wms.5.1698158426324;
        Tue, 24 Oct 2023 07:40:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b00401e32b25adsm12387271wms.4.2023.10.24.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:40:26 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 1/4] scripts:recipetool:create_buildsys_python: prefix created recipes with python3-
Date: Tue, 24 Oct 2023 16:40:18 +0200
Message-ID: <20231024144022.1532605-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024144022.1532605-1-jstephan@baylibre.com>
References: <20231024144022.1532605-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189649

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


