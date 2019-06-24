Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4607E539
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id cl9so6071029plb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0BMIxyQzRzmyi3UcpVG9xDV+PMTUuTIj2w8WQbYyO1A=;
	b=YNTJqAibX8qcOdYOd9ExiFLkbcxPsOHoiAixaQgmLtXz7Ds3yw/81jEgQCCe7mQ4fX
	KZ4qcKeq4jMbaigmBd+c1kvBTjimXDI7ZasiIZrnZWHl1ErWsLtm/w2hkws133r6GP3j
	xPGzWYNDEtWuqwHHBax8VSKekAeYisU4iUksBJLBKxMSvrl24gt5E3EaOOAkYn8MVvPH
	Dod6dYxoYKlkyZobdHdq42EUyAyHw1M/HxZO4tdypq4geFsQ5OqtEu/Hp+oPlsBIzuih
	L4bszg9MRDz36hUqOFtSjgPQe1i5g/+woy3O6iDM9mPqx/kLXiNi8rNpYFrQSzo5MiD6
	bC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0BMIxyQzRzmyi3UcpVG9xDV+PMTUuTIj2w8WQbYyO1A=;
	b=hB7WLc861uO/LHwV+xF49UKEDXQb45+6ABYKms9ynibQ9W/mIJiVz/ORFYwQYfFYPo
	Lg9nwxqCjn62hCJyxENRuguKJbZ7z1V/CWkv/PyOsaOHeblzsRnnw4vvfCI/B14sqbO8
	yeXFe6LdAwtX9L0dwBVRW49d1Ix6FptQ2qw/XGL8fIAU1xu6HbNn0EaSGgkYebTJOXYT
	MhFsoa3lcZeXwvRHWW1uJI9KMGnffTG9CX4IkVDMbiH9GXwnq6THOEQNjmS8YjFsvjCg
	usgufTt3F4hwLGL0MXSlWcoN/tjRzX1TGpYOZUNbDCeNWEwOOUACa+iRLLmY+a6zWTl8
	FORQ==
X-Gm-Message-State: APjAAAXgpqDIjVgwIJ//Rbd6C4z790rz5wQjkxBX7qLZIyKfdlVFYrVk
	5pUIk4M+AKzOtoUTKQqrYoU6TQ4uHUw=
X-Google-Smtp-Source: APXvYqyh5ema3UH62GC/76MjVMfAWEB8bwLy4BxXQMH1HTxBVYIXBhT85jXrN6WnuMf/7YhK+rl9qQ==
X-Received: by 2002:a17:902:5c2:: with SMTP id
	f60mr144771153plf.61.1561348468343; 
	Sun, 23 Jun 2019 20:54:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:05 -0700
Message-Id: <7bfc913b468d308bead91380dee089318b8e5a13.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 06/19] context.py: fix skipping function
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:27 -0000

From: Chen Qi <Qi.Chen@windriver.com>

The current codes to skip test cases are logically correct, but they
do not work correctly in reality. It does skip the tests as the command
line argument specifies, but the related information is wrong.
e.g.
$ oe-selftest -R archiver bblayers runtime_test
2019-06-17 09:24:53,764 - oe-selftest - WARNING - meta-selftest layer not found in BBLAYERS, adding it
2019-06-17 09:25:06,309 - oe-selftest - INFO - Adding layer libraries:
2019-06-17 09:25:06,310 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta/lib
2019-06-17 09:25:06,310 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-yocto-bsp/lib
2019-06-17 09:25:06,310 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-selftest/lib
2019-06-17 09:25:06,312 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
2019-06-17 09:25:10,521 - oe-selftest - INFO - Adding: "include selftest.inc" in /buildarea5/chenqi/SWAT/poky/build-selftest/conf/local.conf
2019-06-17 09:25:10,521 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2019-06-17 09:25:10,522 - oe-selftest - INFO - test_archiver_allows_to_filter_on_recipe_name (archiver.Archiver)
2019-06-17 09:25:10,522 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "runtime_test"'
2019-06-17 09:25:10,522 - oe-selftest - INFO - Skip by the command line argument "runtime_test"
2019-06-17 09:25:10,523 - oe-selftest - INFO - test_archiver_filters_by_type (archiver.Archiver)
2019-06-17 09:25:10,523 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "runtime_test"'
2019-06-17 09:25:10,523 - oe-selftest - INFO - Skip by the command line argument "runtime_test"

The archiver.Archiver.xxx tests should be skipped by 'archiver' command line
argument, not 'runtime_test'.

Change to use a function generator to achieve the desired effect. After the change,
the effect is as follows.

$ oe-selftest -R archiver bblayers runtime_test
2019-06-17 09:19:06,223 - oe-selftest - WARNING - meta-selftest layer not found in BBLAYERS, adding it
2019-06-17 09:19:19,598 - oe-selftest - INFO - Adding layer libraries:
2019-06-17 09:19:19,599 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta/lib
2019-06-17 09:19:19,599 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-yocto-bsp/lib
2019-06-17 09:19:19,599 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-selftest/lib
2019-06-17 09:19:19,602 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
2019-06-17 09:19:24,368 - oe-selftest - INFO - Adding: "include selftest.inc" in /buildarea5/chenqi/SWAT/poky/build-selftest/conf/local.conf
2019-06-17 09:19:24,368 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2019-06-17 09:19:24,369 - oe-selftest - INFO - test_archiver_allows_to_filter_on_recipe_name (archiver.Archiver)
2019-06-17 09:19:24,369 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,369 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,369 - oe-selftest - INFO - test_archiver_filters_by_type (archiver.Archiver)
2019-06-17 09:19:24,370 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,370 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,370 - oe-selftest - INFO - test_archiver_filters_by_type_and_name (archiver.Archiver)
2019-06-17 09:19:24,370 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,371 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,371 - oe-selftest - INFO - test_archiver_srpm_mode (archiver.Archiver)
2019-06-17 09:19:24,371 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,372 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,372 - oe-selftest - INFO - test_bitbakelayers_add_remove (bblayers.BitbakeLayers)
2019-06-17 09:19:24,373 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "bblayers"'
2019-06-17 09:19:24,373 - oe-selftest - INFO - Skip by the command line argument "bblayers"
2019-06-17 09:19:24,373 - oe-selftest - INFO - test_bitbakelayers_createlayer (bblayers.BitbakeLayers)
2019-06-17 09:19:24,373 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "bblayers"'
2019-06-17 09:19:24,374 - oe-selftest - INFO - Skip by the command line argument "bblayers"
[snip]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/context.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 0962704..5824489 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -9,6 +9,7 @@ import json
 import time
 import logging
 import collections
+import unittest
 
 from oeqa.core.loader import OETestLoader
 from oeqa.core.runner import OETestRunner
@@ -45,10 +46,14 @@ class OETestContext(object):
     def skipTests(self, skips):
         if not skips:
             return
+        def skipfuncgen(skipmsg):
+            def func():
+                raise unittest.SkipTest(skipmsg)
+            return func
         for test in self.suites:
             for skip in skips:
                 if test.id().startswith(skip):
-                    setattr(test, 'setUp', lambda: test.skipTest('Skip by the command line argument "%s"' % skip))
+                    setattr(test, 'setUp', skipfuncgen('Skip by the command line argument "%s"' % skip))
 
     def loadTests(self, module_paths, modules=[], tests=[],
             modules_manifest="", modules_required=[], filters={}):
-- 
2.7.4


