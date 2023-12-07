Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7E0C46CA3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:14:01 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.107159.1701990839054991663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KPeLeA5i;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c699b44dddso1122384a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701990838; x=1702595638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBHQoiTfXYdGLFPKqS0yJ1hzC6CTRhLlWq0b5Im9Z30=;
        b=KPeLeA5i8rkg6Q5TaStyClMDIGtdNYg1I422F1LlzSi3nL08TB70sj4WkziUZFz7fj
         j5rlctf1dt44M0OvgiY4CCtSocz4ARyoecHQtjWhEYiYspEGl9bbsGb+nk1+jizzHBsy
         Z0PfuZ+P6+cd1FoANmh2VZHn9HWcFATR/obHaIgQ7QyHkswAawx3xgT61BQ/PqHoaW+L
         onNlG0qFMirsRz+rnjCv4zrZouidllJ2ScdUJn8F7k0yr/nmox4+Wsb5YNZfuWh2GZ/w
         SR2NMd8FV0Yh8++0/boHMzZLOxSOVaT0Ugpd/Z/w81YSPOAL0By5Wb623m1sAeiafgHL
         RNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701990838; x=1702595638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBHQoiTfXYdGLFPKqS0yJ1hzC6CTRhLlWq0b5Im9Z30=;
        b=mO8O3v4CfT0Bjp70Z3B7mBvz8bq9VFcnAr5ZFBauEqiJdKiFnMjitpCh5RO55Ac1sd
         C2C3Iwok48OhbEzhYxeqDdIykv5P0pMK5r8Fhup4e8EPD2PWzTincp2uut22nJyabavt
         p9qk0toGkv/DOQKhIWO21TOtdX5TIGsnKsqyf0qQ1Oxn/NxdqmQ/i681BiVDq6gOYIMO
         DFMkoyjqgQiTr3QUkvMncIlYS+0WBm+qSXGm5BgvUJJqwWwtx7juHqpKTdnaBE88DEgs
         c4561kWuhuojdXJg4Vrmw82GTduOEStfCRvh8/zNIFe7akPg705DDtA8nop8csWUW6N3
         4V7g==
X-Gm-Message-State: AOJu0Ywx5vIxMKI4bMD7FOEf2DsSyfV+vJIn6RfD6zzoCRhd6OuEAEx+
	yVFJHTbe0JDOT37H144gXMsPyfjx4LE=
X-Google-Smtp-Source: AGHT+IFfW/36ImfTL2S3e7WJKhdXJ4dromq0BOapqocPVapr9c513GQsuXflRr+XLro0H3PpobhqKw==
X-Received: by 2002:a05:6a20:1f2a:b0:18f:97c:4f66 with SMTP id dn42-20020a056a201f2a00b0018f097c4f66mr2152430pzb.114.1701990838159;
        Thu, 07 Dec 2023 15:13:58 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm349695pls.118.2023.12.07.15.13.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:13:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] recipetool: add python_maturin support
Date: Thu,  7 Dec 2023 15:13:21 -0800
Message-Id: <1c44ffa9837ab6c7a8ea24a2f69eafb38838fb45.1701989368.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701989368.git.tim.orling@konsulko.com>
References: <cover.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191985

Add the new python_maturin PEP-517 backend

Add selftest for 'pydantic-core' pypi package.

[YOCTO #15312]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py    | 34 +++++++++++++++++++
 .../lib/recipetool/create_buildsys_python.py  |  1 +
 2 files changed, 35 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 55cbba9ca74..ddcacaa73c7 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -611,6 +611,40 @@ class RecipetoolCreateTests(RecipetoolBase):
 
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
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '1eb13c211147496c1c9484ff7f8ac438'
+        checkvars['SRC_URI[sha1sum]'] = '0803a731aa793f3eaf4d52f656d7300408ca0b36'
+        checkvars['SRC_URI[sha256sum]'] = '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
+        checkvars['SRC_URI[sha384sum]'] = 'cca6d9f0ba72ff92e16aaf3d6c628b8df33bdf244cc39c9d59cff9d541f35d4e87ec136e60e4b040ad73c5c69b27cec6'
+        checkvars['SRC_URI[sha512sum]'] = 'e6c3081dfa58d9b59f8c33dfe80712d732ac3048a2f8240f9a0f5448d9bfc83e222c1e08b8bb49779b84f685c3bec3060cc935c113a818b1ab8aa955f3df2238'
+        inherits = ['python_maturin']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 9312e4abf13..9bebb3061b1 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -668,6 +668,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "poetry.core.masonry.api": "python_poetry_core",
         "flit_core.buildapi": "python_flit_core",
         "hatchling.build": "python_hatchling",
+        "maturin": "python_maturin",
     }
 
     # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
-- 
2.34.1


