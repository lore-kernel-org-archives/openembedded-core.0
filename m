Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49ECC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 16:52:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.8056.1635526348788079719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 09:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LAH1dZCY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id k7so17082570wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KlQGuTjO9G5LfWYYQjBQR3Nu8XT4uB7UboFb30LMAeQ=;
        b=LAH1dZCYi3+3EVeVOlmsIfbsKoW/YuVklmCadrzwY7+WpHihYEn+nijyk4p3tlzorJ
         7Ofk2xZRc4F+omMKto2sKdfqMSdV+yD8Ys3WxWHc8emp6KGoEzoeBjd6GMXdrlXHzrRz
         l0QqTKIKwVkYz20J0hYkw6FXSE4KdRCnmbKPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KlQGuTjO9G5LfWYYQjBQR3Nu8XT4uB7UboFb30LMAeQ=;
        b=cWIAkNhmUyxoYBk/U7fkh9Au1Jy9qU0A7RQn0SfsgxEkj/GH8S8qQ40+h+5FYYoKHp
         J0LJEYDc4cKhroUe4ngBOfTHsNz8PWZpO4NbdVISYxu5gftBofTzKmM5UkTnQaB7JPLB
         xzjs+QnWgLkyxNckD/UjOr+4Gco0LqDEKgolblyqgDhWOSsFWQshcXQS8pAWzcvMco6U
         Wmf4vUZEqSOoqaRliDW8DVPLmnzRibek//wqQdWLa9x72oI5O4fsP6NE7Moh92UjVGe+
         6DCajcTghbGPTcmbA0thNRkaa9frbppnsW+UM5acYewxlCbNk/JFjcGCyKOaVwQN4QSr
         V/Zw==
X-Gm-Message-State: AOAM5317DofWr5RXMViBP+BCDIjzym76oZaQNA20hP4QhZRWKDbdw6KY
	YIdWcfKIh5ONHHaXk5g7I60xcOwnA0RStw==
X-Google-Smtp-Source: 
 ABdhPJxBXL1kSZrWo+8tnrJlEkQLJ9PaHVA9D7HHixQNsD+hiRtSrma6m3Pu8sS5Yn72Vm4jzdtU8g==
X-Received: by 2002:a1c:e90a:: with SMTP id
 q10mr13064943wmc.108.1635526346820;
        Fri, 29 Oct 2021 09:52:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 l20sm10862013wmq.42.2021.10.29.09.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 09:52:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] archiver: Default to xz compresison instead of gz
Date: Fri, 29 Oct 2021 17:52:25 +0100
Message-Id: <20211029165225.3430572-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211029165225.3430572-1-richard.purdie@linuxfoundation.org>
References: <20211029165225.3430572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 16:52:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157626

We should default to xz or zstd instead of gz, pick xz for now as it is more
tested. Update tests to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass                | 2 +-
 meta/lib/oeqa/selftest/cases/archiver.py     | 6 +++---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 411d459ed02..549f3311e4c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -51,7 +51,7 @@ ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
 ARCHIVER_MODE[dumpdata] ?= "0"
 ARCHIVER_MODE[recipe] ?= "0"
 ARCHIVER_MODE[mirror] ?= "split"
-ARCHIVER_MODE[compression] ?= "gz"
+ARCHIVER_MODE[compression] ?= "xz"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 0194ae9f69c..75195241b79 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -163,21 +163,21 @@ class Archiver(OESelftestTestCase):
         Test that the archiver works with `ARCHIVER_MODE[src] = "patched"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-patched.tar.gz')
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-patched.tar.xz')
 
     def test_archiver_mode_configured(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] = "configured"`.
         """
 
-        self._test_archiver_mode('configured', 'selftest-ed-native-1.14.1-r0-configured.tar.gz')
+        self._test_archiver_mode('configured', 'selftest-ed-native-1.14.1-r0-configured.tar.xz')
 
     def test_archiver_mode_recipe(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[recipe] = "1"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-recipe.tar.gz',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-recipe.tar.xz',
                                  'ARCHIVER_MODE[recipe] = "1"\n')
 
     def test_archiver_mode_diff(self):
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index f99881758e3..651bb03c7e9 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -183,8 +183,8 @@ class ArchiverTest(OESelftestTestCase):
         deploy_dir_src = get_bb_var('DEPLOY_DIR_SRC')
         pkgs_path = g.glob(str(deploy_dir_src) + "/allarch*/xcurs*")
         src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
-        tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
-        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
+        tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.xz"
+        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.xz files under %s/allarch*/xcursor*" % deploy_dir_src)
 
 class ToolchainOptions(OESelftestTestCase):
     def test_toolchain_fortran(self):
-- 
2.32.0


