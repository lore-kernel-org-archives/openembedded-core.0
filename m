Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DC2C54798
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:53 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.502.1708544447923645514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3eZx1YD;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d18931a94so842167f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544446; x=1709149246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=takw75URpKotd/VH8XlPoU8IBBDfkdICzITwRAppyOY=;
        b=M3eZx1YDBjga5wYdaJr9WXVwlexaIqHyYPqt7ZJi097HN+oZXWxdzm72sUBOseg663
         rejsGx7E2l6a1H0cU6sK38k0ZxWCOAa4bQHFfSpe04Uy9DtTRbdfOO34w2E9/IpMEQ1u
         4uvr7kh3UJQPeAbDKr8zwP4mbuZ55PdjwjfQK6Zi58GZ5PiG4+ClIYs5Iq7oc2TMnu6B
         iwYEwWF3zgkuKKw0JhVBfcTj17po6/vXXqANtxpw54ZdFTSK50WzIAkKHsoS8xbob2oz
         edvr3Uwfx0kHbu6/vtv7O55GTCIbITWOJOudZMza/sC3AVllq878ecPw5VL75mskN7/F
         7zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544446; x=1709149246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=takw75URpKotd/VH8XlPoU8IBBDfkdICzITwRAppyOY=;
        b=vPzyGvVgEG2FO4I6eL1HCxA8hIYKEeRsvuTVDnottqDFx57/wUlFrBUpUb9NYVz9Wy
         txhf/JY+blWtA8xgBl4hVjyLRK+pbpeh4GdqGMfH2AieVf+iuo+vS9YNsH+IILieouM3
         mhRTgWirJCNTQBRp+HrtM/gfGetosRcvYwCf0Ji8g10iym9feXqPn5HHU4EAFxvHMLEA
         NZ43lJY57j0VlZKXXcb87JfiqZF6OK6YIfg+4dB//ax341t+4MP/23XAbaYlqoG0aQQv
         gn6W/nwe9e9T/91SRYgFSDeYb3c9tXjfZmOy6s5StGK5SSaso4HtM91R3FgkyFFAGX6+
         jxuA==
X-Gm-Message-State: AOJu0YzRG4FttlF/MjY/J0WvKmH57q+UCmoNKztMHzPC5mXgYCwJTwiw
	FGy0FAcVCbdw2spqsP/lb1DlmBA4f1WKXd7m6VJx/g2MyKNajCNjRwdj/DKw
X-Google-Smtp-Source: AGHT+IGzL+VXPNqJBaBBKg34rsl1QKXQfQ8ZGt3S8OmVZn0gfU4DzhMHAFnqLjKh/pAUDGdTt3/qAQ==
X-Received: by 2002:a5d:540a:0:b0:33d:2f2e:ad1a with SMTP id g10-20020a5d540a000000b0033d2f2ead1amr8216646wrv.2.1708544446136;
        Wed, 21 Feb 2024 11:40:46 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:45 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 07/13] oeqa/selftest/recipetool: downgrade meson version to not use pyproject.toml
Date: Wed, 21 Feb 2024 20:36:59 +0100
Message-ID: <20240221194036.1804463-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195991

From: Ross Burton <ross.burton@arm.com>

recipetool's pyproject.toml parsing needs tomllib (python 3.11+) or
tomli (not a hard dependency), so is prone to failing depending on the
host configuration.

Downgrade the Meson release used for the checks to 0.52.1, which was the
last release before moving to pyproject.toml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 6dfe573d83687e5431841f062442b54b9fa22ff3

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 29 ++++++++++++----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index db21325155..c888770533 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -440,17 +440,19 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github(self):
-        # Basic test to see if github URL mangling works
+        # Basic test to see if github URL mangling works. Deliberately use an
+        # older release of Meson at present so we don't need a toml parser.
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson;rev=1.3.1'
-        result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
-        self.assertTrue(os.path.isfile(recipefile))
+        recipefile = os.path.join(temprecipe, 'python3-meson_git.bb')
+        srcuri = 'https://github.com/mesonbuild/meson;rev=0.52.1'
+        cmd = ['recipetool', 'create', '-o', temprecipe, srcuri]
+        result = runCmd(cmd)
+        self.assertTrue(os.path.isfile(recipefile), msg="recipe %s not created for command %s, output %s" % (recipefile, " ".join(cmd), result.output))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=1.3'
-        inherits = ['python_setuptools_build_meta']
+        checkvars['LICENSE'] = set(['Apache-2.0', "Unknown"])
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=0.52'
+        inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_setuptools(self):
@@ -473,18 +475,19 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github_tarball(self):
-        # Basic test to ensure github URL mangling doesn't apply to release tarballs
+        # Basic test to ensure github URL mangling doesn't apply to release tarballs.
+        # Deliberately use an older release of Meson at present so we don't need a toml parser.
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv = '1.3.1'
-        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
+        pv = '0.52.1'
+        recipefile = os.path.join(temprecipe, 'python3-meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
+        checkvars['LICENSE'] = set(['Apache-2.0'])
         checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
-        inherits = ['python_setuptools_build_meta']
+        inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def _test_recipetool_create_git(self, srcuri, branch=None):
-- 
2.43.1


