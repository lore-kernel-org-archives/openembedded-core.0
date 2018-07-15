Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C244B75534
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:37:01 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c14-v6so2477717wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yEveh6GJACOteY3qLQgDDRK81cJ6w8Y1hcemigH5qao=;
	b=OwusYOmYzeyIHI3FQn5avf4C5PjKLn99P2PiZ458+x9gDUNeQvHVIbix3doU8v7PPZ
	JjZlK97QvuIpGAwaYmo4AQ3ndALHdepfqfXlgtzPxU4dCIiV5xOc0R6PC55/hExo1C/I
	mgBDJ/U86SGL6XFufOHYvKqURf28huiHJTjAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yEveh6GJACOteY3qLQgDDRK81cJ6w8Y1hcemigH5qao=;
	b=hJ4z9uKLfb8DlEO8c4pyb/FSJ+kcUS8KfEyAaPPEqe4/4Or+qOJ47TeoFb/iFqVGdN
	Kr6X2knCgSZ+W0WPLkHjN1uPM5FvUCKwCJJ/25ChA86J/6tPc+YxTreRl6ri9KEcDeDk
	hKQdrldOHfgYR+hvqEOi20UwCEje0tNTXkNb8NDt5Lxojm1ciCRBZX0ZWa2QqWMD/hbF
	LJ8s5LSFCdVGbDCG+dBQAoqAKQowMphcPMr/CoeNtMi330CtG1lwAmYsIeZAGSFdna+E
	w1CPHf+HF59RXw4GJXmOBBMoTcqtc59972ShU5gu/S6eVre/OdvRZsm7a/SPtWj5RUhm
	ioew==
X-Gm-Message-State: AOUpUlH1y+Y3kbpCfmBIkaVxt+XsvDYrgbnqJVCwxj+qvxfZezuJsDOJ
	/fxgRW0lfBh1vxdhWVFzwc7BTBzMZ5o=
X-Google-Smtp-Source: AAOMgpcuRjqwP0JY1oeHgjdVory6VjmBM5RJTXb4NTnF3RhB8crDUj+z3bbXbRUvX09SVYec5wOwaA==
X-Received: by 2002:a1c:d750:: with SMTP id
	o77-v6mr7586789wmg.67.1531669022337; 
	Sun, 15 Jul 2018 08:37:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.37.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:37:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:41 +0100
Message-Id: <20180715153641.21029-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/12] oeqa/selftest/wic: Split tests into two class groups
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
X-List-Received-Date: Sun, 15 Jul 2018 15:37:02 -0000

This improves test parallelism.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 2771af63674..ba4d3be7a86 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -61,7 +61,7 @@ def only_for_arch(archs, image='core-image-minimal'):
     return wrapper
 
 
-class Wic(OESelftestTestCase):
+class WicTestCase(OESelftestTestCase):
     """Wic test class."""
 
     image_is_ready = False
@@ -71,7 +71,7 @@ class Wic(OESelftestTestCase):
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = self.builddir + "/wic-tmp/"
-        super(Wic, self).setUpLocal()
+        super(WicTestCase, self).setUpLocal()
         if not self.native_sysroot:
             Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'wic-tools')
 
@@ -92,7 +92,9 @@ class Wic(OESelftestTestCase):
     def tearDownLocal(self):
         """Remove resultdir as it may contain images."""
         rmtree(self.resultdir, ignore_errors=True)
-        super(Wic, self).tearDownLocal()
+        super(WicTestCase, self).tearDownLocal()
+
+class Wic(WicTestCase):
 
     @OETestID(1552)
     def test_version(self):
@@ -522,6 +524,8 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+class Wic2(WicTestCase):
+
     @OETestID(1496)
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
@@ -679,7 +683,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         Test creation of a simple image with partition size controlled through
         --fixed-size flag
         """
-        wkspath, wksname = Wic._make_fixed_size_wks(200)
+        wkspath, wksname = Wic2._make_fixed_size_wks(200)
 
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
                                    % (wkspath, self.resultdir)).status)
@@ -711,7 +715,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         --fixed-size flag. The size of partition is intentionally set to 1MiB
         in order to trigger an error in wic.
         """
-        wkspath, wksname = Wic._make_fixed_size_wks(1)
+        wkspath, wksname = Wic2._make_fixed_size_wks(1)
 
         self.assertEqual(1, runCmd("wic create %s -e core-image-minimal -o %s" \
                                    % (wkspath, self.resultdir), ignore_status=True).status)
-- 
2.17.1


