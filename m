Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E596E7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:22:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a15so13397242wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=023sk1BXl1kXjuT1LS530a5f2pdsH6gjz05kIkI1YIk=;
	b=UocRaKJBaddOwTJA1o347twnGLUBjkNUZ8HgEpXIr5rNHNQqxf8RrAIQftSsWDh8eQ
	0IVXRG+EauVqLHBikhlhOwA3PlQW5EE2SyuAw4GGkxzSqEfxb2vG5xscZHu6mmAmOiqt
	wWiHegcZms7hFN9No5yLLCCfH8T16Q2q1Ays0Olu5z7NNE0fCnDsG5kWv4CPnIeL+KNi
	o/1XTLV1pnAfHejjeZ8iZES8nkwUT4mmtOy4kvjEJinFzQVzpVbHtHhETj5IFnKAl9Ve
	RbEq2DnhXA8Kx7MP76oyjdGxPiv+qz7RvZD62hfDFDz2Hcr34fqg3OQbiFygFrYFzIgT
	tiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=023sk1BXl1kXjuT1LS530a5f2pdsH6gjz05kIkI1YIk=;
	b=Kd46V5F//24HDGDOiuMBDlF8sEmALG+AZxgnfxs/mCTcQGPltXA74WgG3WG2g6zHIZ
	rDXj/PCYOb2TG/dWpSdlOkXNxJf1u65xxJl+gT1NLx9Ebn6pywaLdIdGmcbqGDpHNB+m
	EmXdfMqGtxFWvl0Y+JE6urZGFd7kU4oNmgQvS28+Irhqi0o+ouej/9q4lfAdRhsO/YjF
	RyDd7GFRbcSPosiBREDWR2fy906BnjbUDZiKnW2Pw7k6y6g2KBh9WJw6l9whepyB42ag
	BfS2Ot8I56uAaIq//CbstwhCeV+Fr+hh3QhKuI5epGcFD80sh5vq338Z4QjqbhPrsD0s
	TTvQ==
X-Gm-Message-State: APjAAAXS2CgNUAxSbAEwRfC6vbIu8IagMNrgUwncWKxTMekPIj7F5lsg
	ofHrVArGCLNF6qhpWsVjW/rgqxbOWcU=
X-Google-Smtp-Source: APXvYqwBNZr2sZJ76E/mKCvfHaucwaX44MsyyWZovoQBS5v5eOzgtpHcamjLqMq6UvuyFvg+3an6Tw==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr15712826wmc.98.1561393357408;
	Mon, 24 Jun 2019 09:22:37 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c65sm10134570wma.44.2019.06.24.09.22.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 09:22:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 17:22:31 +0100
Message-Id: <20190624162231.3195-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] oeqa/buildoptions: check that Fortran code actually cross-compiles
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2019 16:22:37 -0000

Don't just test that we can build the cross-compiler, but test that it actually
can cross-compile some Fortran.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 3ad65b40341..860812754c6 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -162,17 +162,14 @@ class ArchiverTest(OESelftestTestCase):
         self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
 
 class ToolchainOptions(OESelftestTestCase):
-
     def test_toolchain_fortran(self):
         """
-        Test whether we can enable and build fortran and its supporting libraries
+        Test that Fortran works by building a Hello, World binary.
         """
 
         features = 'FORTRAN_forcevariable = ",fortran"\n'
-        features += 'RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"\n'
         self.write_config(features)
-
-        bitbake('gcc-runtime libgfortran')
+        bitbake('libgfortran fortran-helloworld')
 
 class SourceMirroring(OESelftestTestCase):
     # Can we download everything from the Yocto Sources Mirror over http only
-- 
2.11.0


