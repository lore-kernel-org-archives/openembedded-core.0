Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83206C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 02:05:21 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.2083.1702087520288031686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 18:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WAuCE/Yq;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b9ef61b6b8so688635b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 18:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702087519; x=1702692319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiKc4rBLrcIGcyhMyNV9dqqPfham/ZeuF2pD3FvKbzA=;
        b=WAuCE/YqdzAhuuh1rM/r9p312t0R4qCfV8l+AohQ/oVjlWEGZTHbrsJFTJoVD/eaXI
         6VpO+G34xTQivPilpjInrL4TmKn7X5ZUyzZQsMXMjeBth9xa7NQ4tNpBa2WcJlAN4bbz
         rKyejWVkGVv86Lns5723tuc74RQU0rsb4Y+wDvqPv5CaF5XdqMtkcFJg+0x9hwYOLd1R
         WaN0YG0lMB9Tk++NNaHENF3eT8x58GTygJ71EPdB8fLQkIl+TJBrl/SGYFTyNnbPaBDt
         fqRy0zq3prux8zVbFih6VynZ74KLg8EVmHMkqZNzVSRVbpCL7yG+kh7246HuGRsq0vWS
         wMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702087519; x=1702692319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiKc4rBLrcIGcyhMyNV9dqqPfham/ZeuF2pD3FvKbzA=;
        b=t/mgQUHMejWhCUgkNz73FqoYlWkDgGtdJBbPe8LW3VP5T1EDv73ZsrPxd5wgS+ucZH
         vm8JsJ9xSqfoMkkdu4lOqnnXZjrZpxzLeo294Ar9YmO2kOMHh9B6EpynivsjxTB9b0Is
         nyjgPYe2LwJ9SPjtiVCPUT4AQE00W1rlnf/lHTb3ldh8d5P9MLl0m0sqoetnzna+ClME
         6HAMduFTX1pMfXsFajZnng2C+qOLSCaR4cy92oR8OCyuvY8pI0fk7FY76TuCQSnQGCpq
         svKi4Wowux+qniyVfLmpMjk1LCH9lOeVhjY7CpUmE1jnCIkihu2SfkWuKN2mF+RQkoNi
         DCPg==
X-Gm-Message-State: AOJu0YwOoKICMOZnEgKVTv5m96KvulipvYKwG/2U7Z/4jTzMlWzZbYyx
	ur583wJ7/mhWYlK7wjUj8/FhMTtlYsI=
X-Google-Smtp-Source: AGHT+IHl09JqCw+RnWTu3hCfutLcnXO6NNRNH+nh3EfCj5X3dvmriKPD3tBx/vFuMT5CQDhF43X7PA==
X-Received: by 2002:a05:6808:ecb:b0:3b9:d903:9fa9 with SMTP id q11-20020a0568080ecb00b003b9d9039fa9mr1183459oiv.105.1702087518969;
        Fri, 08 Dec 2023 18:05:18 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:7aea:237e:f2fd:77b])
        by smtp.gmail.com with ESMTPSA id d17-20020a056a00245100b006cddecbf432sm2306298pfj.96.2023.12.08.18.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 18:05:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 4/6] recipetool: add python_maturin support
Date: Fri,  8 Dec 2023 18:02:24 -0800
Message-Id: <20231209020223.1221046-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1c44ffa9837ab6c7a8ea24a2f69eafb38838fb45.1701989368.git.tim.orling@konsulko.com>
References: <1c44ffa9837ab6c7a8ea24a2f69eafb38838fb45.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 02:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192096

Add the new python_maturin PEP-517 backend

Add selftest for 'pydantic-core' pypi package.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
 - drop all SRC_URI checksums except sha256sum (Peter's change)
   * requires "[PATCH v2] recipetool: pypi: do not clobber SRC_URI checksums"
 - drop SRC_URI (Julien's change)
 - add "inherit pypi" (Julien's change)

 meta/lib/oeqa/selftest/cases/recipetool.py    | 29 +++++++++++++++++++
 .../lib/recipetool/create_buildsys_python.py  |  1 +
 2 files changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index d10d61bc5b0..8d39f639acf 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -663,6 +663,35 @@ class RecipetoolCreateTests(RecipetoolBase):
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_pep517_maturin(self):
+        # This test require python 3.11 or above for the tomllib module
+        # or tomli module to be installed
+        try:
+            import tomllib
+        except ImportError:
+            try:
+                import tomli
+            except ImportError:
+                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+
+        # Test creating python3 package from tarball (using maturin class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'pydantic-core'
+        pv = '2.14.5'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['HOMEPAGE'] = 'https://github.com/pydantic/pydantic-core'
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c'
+        checkvars['SRC_URI[sha256sum]'] = '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
+        inherits = ['python_maturin', 'pypi']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index a2af41fdda8..60c59034504 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -735,6 +735,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "poetry.core.masonry.api": "python_poetry_core",
         "flit_core.buildapi": "python_flit_core",
         "hatchling.build": "python_hatchling",
+        "maturin": "python_maturin",
     }
 
     # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
-- 
2.34.1


