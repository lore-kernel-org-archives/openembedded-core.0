Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C222C47258
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.8369.1705393477875875024
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKoeuaoY;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3366ddd1eddso7811846f8f.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393476; x=1705998276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEWwRhHea6E2hSam93xODS1zRKW8OD5WkexpkPcoYGQ=;
        b=GKoeuaoY7km43haFSlBPstuCC7W6RmFo3HWgFNllA+syrfqa0DFjwfzVLeZm6b3WBE
         qySUH2lWDvTBdaLXuBbWVo1SVchrNMe1WT1KXJHLYrW49UxqRX/2RgVrU/EWeT8we7xX
         1MBDuOQ0BI1hTuN1aK/XCx6Ap6XgrM1btE2EJfEJU4xOwvOA6Mt921pEWeMWpWpq98ur
         P81OzxOPfpeuMknIIven6yOgBHPpTHI+01DE14v6e1TWGXF1CGBazj0HnCjRY9OVsdkp
         3NV1QvKKCvmTvvVU+ANKCXjtWQDoy7JrxXEIonmNRI4X6im3bwG7jjc3r06QGZMkc6Kt
         W63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393476; x=1705998276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEWwRhHea6E2hSam93xODS1zRKW8OD5WkexpkPcoYGQ=;
        b=d1PYbAT8USOUEMHPDR89s0ZFqwLPTYLKv3M3zhhJOEAJCp0216CWo5YqssoGv5+Qhj
         9JAi7cFEKF8enSPYeZ1wAtCcU9AIkT4TNcagolePIpXWUI6qQYRZkyPCXRfsuJ/fvXPK
         zS2q47czZ4Agby3MSy1QlZxapqsg7L43UQHEnyySawAGUAZlyEiyazafE4cPJHF5kT5M
         1Vj2JdsVJAOVjKklt9FyUQIFbSCpDh9WZsQELoeWkGmp0IAefiGQqGyHlhgnT6MSP7Xs
         V2f3vBz8sU88b4VogAC/4azSpgodlZBw+CSOK6+tFKSPYffz7SbphBxDdVpP3uqImUwd
         27+g==
X-Gm-Message-State: AOJu0YyNPD+kZLShudskce9dqI6AwBVaxGibw5O6dyiiY94RN4lrLX2S
	xPJNi4g+Ff4xxXiFhyLk9GRA429H67jYeA==
X-Google-Smtp-Source: AGHT+IF+SyDF4YQsotJy7Mk07zEa07Rf7jEcunMH1cm0YzKbGOWSFZbqe8ABe/5mb6bd6GVHpOglZw==
X-Received: by 2002:a05:6000:12c1:b0:337:43c2:d17b with SMTP id l1-20020a05600012c100b0033743c2d17bmr1540155wrx.77.1705393475704;
        Tue, 16 Jan 2024 00:24:35 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:35 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 9/9] oeqa/selftest/recipetool: Add test coverage for local go modules
Date: Tue, 16 Jan 2024 09:23:27 +0100
Message-Id: <20240116082327.128990-9-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193832

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 83848d6170..0c296875b2 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -927,6 +927,61 @@ class RecipetoolCreateTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(deps_require_file))
         self._test_recipe_contents(deps_require_file, checkvars, [])
 
+    def test_recipetool_create_go_replace_modules(self):
+        # Check handling of replaced modules
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+
+        recipefile = os.path.join(temprecipe, 'openapi-generator_git.bb')
+        deps_require_file = os.path.join(temprecipe, 'openapi-generator', 'go-modules.inc')
+        lics_require_file = os.path.join(temprecipe, 'openapi-generator', 'go-licenses.inc')
+        modules_txt_file = os.path.join(temprecipe, 'openapi-generator', 'modules.txt')
+
+        srcuri = 'https://github.com/OpenAPITools/openapi-generator.git'
+        srcrev = "v7.2.0"
+        srcbranch = "master"
+        srcsubdir = "samples/openapi3/client/petstore/go"
+
+        result = runCmd('recipetool create -o %s %s -S %s -B %s --src-subdir %s' % (temprecipe, srcuri, srcrev, srcbranch, srcsubdir))
+
+        self.maxDiff = None
+        inherits = ['go-vendor']
+
+        checkvars = {}
+        checkvars['GO_IMPORT'] = "github.com/OpenAPITools/openapi-generator/samples/openapi3/client/petstore/go"
+        checkvars['SRC_URI'] = {'git://${GO_IMPORT};destsuffix=git/src/${GO_IMPORT};nobranch=1;name=${BPN};protocol=https',
+                                'file://modules.txt'}
+
+        self.assertNotIn('Traceback', result.output)
+        self.assertIn('No license file was detected for the main module', result.output)
+        self.assertTrue(os.path.isfile(recipefile))
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+        # make sure that dependencies don't mention local directory ./go-petstore
+        dependencies = \
+            [   ('github.com/stretchr/testify','v1.8.4', '', '', ''),
+                ('go.googlesource.com/oauth2','v0.10.0','golang.org/x/oauth2', '', ''),
+                ('github.com/davecgh/go-spew','v1.1.1', '', '', ''),
+                ('github.com/golang/protobuf','v1.5.3', '', '', ''),
+                ('github.com/kr/pretty','v0.3.0', '', '', ''),
+                ('github.com/pmezard/go-difflib','v1.0.0', '', '', ''),
+                ('github.com/rogpeppe/go-internal','v1.9.0', '', '', ''),
+                ('go.googlesource.com/net','v0.12.0','golang.org/x/net', '', ''),
+                ('github.com/golang/appengine','v1.6.7','google.golang.org/appengine', '', ''),
+                ('go.googlesource.com/protobuf','v1.31.0','google.golang.org/protobuf', '', ''),
+                ('gopkg.in/check.v1','v1.0.0-20201130134442-10cb98267c6c', '', '', ''),
+                ('gopkg.in/yaml.v3','v3.0.1', '', '', ''),
+            ]
+
+        src_uri = set()
+        for d in dependencies:
+            src_uri.add(self._go_urifiy(*d))
+
+        checkvars = {}
+        checkvars['GO_DEPENDENCIES_SRC_URI'] = src_uri
+
+        self.assertTrue(os.path.isfile(deps_require_file))
+        self._test_recipe_contents(deps_require_file, checkvars, [])
 
 class RecipetoolTests(RecipetoolBase):
 
-- 
2.35.1


