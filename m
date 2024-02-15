Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D538C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.4906.1708035443814259821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GZuPuAwT;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3394bec856fso1522924f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035442; x=1708640242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suLHWl9GSRGMw4awROsfkgEvzIn5iBeK/oebUguDTTE=;
        b=GZuPuAwTi4y4IiLzgUCKNh0xjQe1Eo/KxIiki5MXKmbLy0reax0k3LtGLfBPLldccm
         FFNeCk8xnxkG3m/aDNqGnr3OrXlUOXa4g9Wpps6WNEWoGc1jpmrJulpFtnw7m64xIYhA
         eFEEu2PvMZ4HKnO6Eik2zc3Dkbxfdui5m5roCwbWgv0lMrCk0lsVMYOyIrs/bpES/7Py
         nJGs4R8tfG5aXzR94qNakHb3B53DpdURPczkJ9TmmVULWmt5WKMl2oj5JVUufVZqHEYc
         FLftTQR7ewEUHQkbpuSaPmA8HLSU6w8qXoLx/ZbTeceWg7Jtd+669gZ15Nb6hLj9cmu6
         WIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035442; x=1708640242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suLHWl9GSRGMw4awROsfkgEvzIn5iBeK/oebUguDTTE=;
        b=AuNvd/iT/gKZgSOjTAyhWBhqlNAOWHTCBgwAOZoSqEFDhZ2iK0XoK8pSKQPyDFJq79
         /PydTMC4ncNUT6xlaSlNlCHx9lIZ/cQooXZCGBQGhh+rk7d3a7NPRzeZW3QNoYISIGAl
         4M3oOR7Y5aACX6QHnKsNqrUwgTIM6oz1jEki5wzLJLPIwyHGKwICgb8qOORFxbqGPlcc
         uO1q7r+kx92g/sjv+cxIKpqNgITviJrTNSimHjgAgu41Gl5NbWmtW+rGvzOA9dCWtuFQ
         X/gUX5vvtJYkDYJihVfACMHnLLAA6cDFCifbbS8cAnJBR5lzdPyRkPcF+xRabllyOqKZ
         O3IA==
X-Gm-Message-State: AOJu0YymAfPQoAQ9fwckZW0CI7oi5IeQ70bNe28Ty+Xwv8sIuVHgx5YE
	fz7mrVR+r87yqG7ABsWEUFC3WAptfwc9FDuGmTzkN5P6dQ+IMC5OBHyqGEYsp0c=
X-Google-Smtp-Source: AGHT+IE/9YYGNSqMeJzDxScqEho89VApIgNzClTPDeZB1UTkisUvmpRkwbhCcuTNfHHkmItH8wgaVQ==
X-Received: by 2002:a5d:474d:0:b0:33c:e2de:acbe with SMTP id o13-20020a5d474d000000b0033ce2deacbemr2735987wrs.17.1708035442103;
        Thu, 15 Feb 2024 14:17:22 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:21 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 06/12] oeqa/selftest/recipetool: fix for python 3.12
Date: Thu, 15 Feb 2024 23:13:52 +0100
Message-ID: <20240215221711.332614-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195717

From: Adrian Freihofer <adrian.freihofer@gmail.com>

test_recipetool_create_github and test_recipetool_create_github_tarball
fail because the old meson version used by these tests cases does not
run on Python 3.12. The issue is in the dependencies.py which comes with
meson:
ERROR: build/tmp/work/recipetool-3z4osyl7/source/git/mesonbuild/
       dependencies.py:777: SyntaxWarning: invalid escape sequence '\.'

Use meson 1.3.1 (what is currently also used on master) as a reference
for these tests.

With this version of meson, recipetool creates recipes named
meson_git.bb or meson_1.3.1.bb. Since this looks more reasonable than
e.g. python3-meson_git.bb the test gets adapted.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 7374a8a2810a6cf027bfefefe87691a3529123ff

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index db8790b57b..db21325155 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -444,13 +444,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
+        srcuri = 'https://github.com/mesonbuild/meson;rev=1.3.1'
         result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=master'
-        inherits = ['setuptools3']
+        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=1.3'
+        inherits = ['python_setuptools_build_meta']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_setuptools(self):
@@ -476,15 +476,15 @@ class RecipetoolCreateTests(RecipetoolBase):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv = '0.32.0'
+        pv = '1.3.1'
         recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
+        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
         checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
-        inherits = ['setuptools3']
+        inherits = ['python_setuptools_build_meta']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def _test_recipetool_create_git(self, srcuri, branch=None):
-- 
2.43.1


