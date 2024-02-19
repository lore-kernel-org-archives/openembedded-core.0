Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72889C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:31:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.84.1708363858442442616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSNEvZXG;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d731314e67so31803025ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708363857; x=1708968657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jj7O0PQTcwnnjLmMcHYD555sADhopHJCguYmiVwmBI=;
        b=NSNEvZXGdi35zk43OXriYFKGqc1mirXYSJ4a4Exaw7NdPPlqt4coEXevRP+EqWyJUc
         XiBkoP5Sw0oAOKZ0Y/ubeDsMoT1EQUSa1mPCVF0+e6Cj/kXXLU5IMzmLY7acVwsOP2sa
         Nf2NL5II00hwxMJNv3quF8zqvwli1sNW5CYfIZIPBSWjMYwbcDpzzOGTIvoJJcrkEG8Q
         92C+632qFDNu7FhbemwHpKIus/YWZMJ682G/+XYn20rvTaTYBNn8P7FqjwL1jHMaI6Rm
         o675HxyiHiKnvqdjwhDxZuiqI6Kc0FZhSu2Vel6ggDQFjpiKGpCn8Wuj17gobK8yzUxY
         saJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363857; x=1708968657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jj7O0PQTcwnnjLmMcHYD555sADhopHJCguYmiVwmBI=;
        b=m5vOtHJTGT89YZqn31/vSsoU+qwmF9DG33qV96silyQ55vqZxC+M5/8uXNfHYo8ouL
         M9sAVSjij+G4+zYeOVJaKI9mE2A3x3akL2peyhbrAC3FAbf9GkXRUob+39Tb16R+PTz5
         RFWwyCYC1UcbE5KcjtLN0oWURVtUhQqYeAxyNDKUgjNJjLhJlSrISTGZYlG4aPzXozQW
         pTw6UAphCMGCNQgm1a90UQqQ+sS3dCI8NXSWWOvsOXPCBbT/ghwpiMqGnoCQToU+tzJH
         z5XDkUWH4y/38PX5C130QDgsUqjBYnf/+A4bAFPlAUu3UKN8vRr87u8OXQduYJngFksi
         FRdQ==
X-Gm-Message-State: AOJu0YzEphfASSmOAymufxHaUJIs1Ww7z8OofWaMyhSlg7HU5FKto1td
	bqW8v2NnEunwaZr682BJtGxwJAJBk5eXYASg8ep3+DRwcUTZy7jpEaq11YMO
X-Google-Smtp-Source: AGHT+IGMw5Ecm5V//4NPWFPZeMP61S4CPdXfaK5sVmrpDbj5CvmVNJAJXKpvHINotwQn3BIL6jCaMA==
X-Received: by 2002:a17:903:2445:b0:1db:f965:470d with SMTP id l5-20020a170903244500b001dbf965470dmr3088476pls.24.1708363857304;
        Mon, 19 Feb 2024 09:30:57 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001d965e737f2sm4630428plc.268.2024.02.19.09.30.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:30:56 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] recipetool; add support for python_mesonpy class
Date: Mon, 19 Feb 2024 09:30:24 -0800
Message-Id: <90d06d324635b0439b4f5d31b525d3eabfac5d96.1708363628.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708363628.git.tim.orling@konsulko.com>
References: <cover.1708363628.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 17:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195895

* Add support to detect the "mesonpy" build-backend for recipetool create.
* Add oe-selftest case for creating a recipe for "siphash24" from pypi.
  https://pypi.org/project/siphash24/

This is by far the simplest recipe using the mesonpy build backend.

Upstream does not provide LICENSE file(s) and we do not detect the
LICENSE so don't check for that result in the test. Likewise, upstream
does not define HOMEPAGE, so skip that result.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py    | 19 +++++++++++++++++++
 .../lib/recipetool/create_buildsys_python.py  |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 83361814dfd..2eca1800de1 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -676,6 +676,25 @@ class RecipetoolCreateTests(RecipetoolBase):
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_pep517_mesonpy(self):
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
+
+        # Test creating python3 package from tarball (using mesonpy class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'siphash24'
+        pv = '1.4'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/c2/32/b934a70592f314afcfa86c7f7e388804a8061be65b822e2aa07e573b6477/%s-%s.tar.gz' % (pn, pv)
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SRC_URI[sha256sum]'] = '7fd65e39b2a7c8c4ddc3a168a687f4610751b0ac2ebb518783c0cdfc30bec4a0'
+        inherits = ['python_mesonpy', 'pypi']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs.
         # Deliberately use an older release of Meson at present so we don't need a toml parser.
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index a589343cfbf..a807dafae52 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -739,6 +739,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "flit_core.buildapi": "python_flit_core",
         "hatchling.build": "python_hatchling",
         "maturin": "python_maturin",
+        "mesonpy": "python_mesonpy",
     }
 
     # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
@@ -779,6 +780,8 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "python3-poetry-core-native",
         # already provided by python_flit_core.bbclass
         "python3-flit-core-native",
+        # already provided by python_mesonpy
+        "python3-meson-python-native",
     ]
 
     # add here a list of known and often used packages and the corresponding bitbake package
@@ -790,6 +793,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "setuptools-scm": "python3-setuptools-scm",
         "hatchling": "python3-hatchling",
         "hatch-vcs": "python3-hatch-vcs",
+        "meson-python" : "python3-meson-python",
     }
 
     def __init__(self):
-- 
2.34.1


