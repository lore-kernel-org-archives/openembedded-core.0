Return-Path: <jpewhacker@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A57561050
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:14:44 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id b141so324991ybg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 19:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ci2zEa+Hwu7ISBKAEjkO57D+4rue0XwrtbZRsH6YA8k=;
	b=Ux8XUq6htkXbHfnxmkBo9qimPBq3imyduF5LvWSjKW9QWg1EkaWrFsJNWetH1rzoJC
	+zDyc2xRaKu4Be/muZCYdNYpxRLweHqV5eY8PV6d7kFRTHRMqtWMzhp8Zc/693EXkKZu
	DyxSjMAJot5/mQJBuqWiHXbBeRLwjYAlRwAoyAZR6jgk0NwdU8XeUmZYoImydAAOBzC6
	043wzZIynhidrw6EDhYonnhY9DtDXyLoiA+WmL2wkZjSB1KSoQ0NwiO52ZX47OmjsuPZ
	r2o9IITkNLSjtgVviQ/eehFFAqVsbhiqLcJUgSP+jyefTCgrGxFc3dQSQJTSjU9kI8hr
	wnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ci2zEa+Hwu7ISBKAEjkO57D+4rue0XwrtbZRsH6YA8k=;
	b=QITlO5oA+C4dHo97v2yVATSDHYkwNY5yvFprFtL5kRz7Jc8Ihp2z4GI/c9PSDQj63J
	h6GXNm0iozObn6n+AEhiV0AfSf5cDYFM8CvYM1uyeeqtBb4KMe7QzTALT/wXMLF5yFWO
	gD4MHSNrD6YmcSYJT1DzMXT6npg1NTZnzmfgAFO7c6XcKp8x/4stsOz04wpQp/v89PiJ
	BVe7AoRa6DZBQw4PAcNcVBOpQJaQPPU8Bue5AV+Aumoqf3Y46TqXBPwWaBpH7k/PnORc
	uzDA5nXdw8hYRFqI9pBz4SFG8aBmfYb+H01zez/wEQgNpPj9+q3/ofJ/NkxlOcVDsuSd
	viow==
X-Gm-Message-State: APjAAAXflVJOvOTPfufU/vY2IN0uDylt5NufvH9mjk6j6UKXXT8+XmPz
	LkzlHj2vFBAdHUhetChMU7+YK6GM
X-Google-Smtp-Source: APXvYqzk918NKnRv5b8mzYNzCYEnU34+FJMemvpHMOKZZwD/Dsk8jQq66IEN//MzXE5Rqa0ZAA9ibA==
X-Received: by 2002:a25:d9cc:: with SMTP id q195mr1199718ybg.126.1581477285220;
	Tue, 11 Feb 2020 19:14:45 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:4f37:550:d1b1:6f01])
	by smtp.gmail.com with ESMTPSA id
	h193sm2677370ywc.88.2020.02.11.19.14.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 19:14:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 21:14:35 -0600
Message-Id: <20200212031435.792802-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200212031435.792802-1-JPEWhacker@gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] oeqa: reproducible: Run diffoscope on saved output
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
X-List-Received-Date: Wed, 12 Feb 2020 03:14:44 -0000
Content-Transfer-Encoding: 8bit

If there are differing packages and they are being saved for review,
automatically run diffoscope on them and include the output in the saved
output. The output is currently done in HTML format since these are
typically published on a webpage by the autobuilder.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 24 ++++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f6433c9a02b..d3fd8c392b8 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -1,7 +1,7 @@
 #
 # SPDX-License-Identifier: MIT
 #
-# Copyright 2019 by Garmin Ltd. or its subsidiaries
+# Copyright 2019-2020 by Garmin Ltd. or its subsidiaries
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
@@ -167,10 +167,16 @@ class ReproducibleTests(OESelftestTestCase):
         return d
 
     def test_reproducible_builds(self):
+        def strip_topdir(s):
+            if s.startswith(self.topdir):
+                return s[len(self.topdir):]
+            return s
+
         # Build native utilities
         self.write_config('')
-        bitbake("diffutils-native -c addto_recipe_sysroot")
+        bitbake("diffoscope-native diffutils-native -c addto_recipe_sysroot")
         diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
+        diffoscope_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffoscope-native")
 
         if self.save_results:
             os.makedirs(self.save_results, exist_ok=True)
@@ -206,18 +212,22 @@ class ReproducibleTests(OESelftestTestCase):
 
                 if self.save_results:
                     for d in result.different:
-                        self.copy_file(d.reference, '/'.join([save_dir, d.reference]))
-                        self.copy_file(d.test, '/'.join([save_dir, d.test]))
+                        self.copy_file(d.reference, '/'.join([save_dir, 'packages', strip_topdir(d.reference)]))
+                        self.copy_file(d.test, '/'.join([save_dir, 'packages', strip_topdir(d.test)]))
 
                 if result.missing or result.different:
                     fails.append("The following %s packages are missing or different: %s" %
                             (c, '\n'.join(r.test for r in (result.missing + result.different))))
 
-        if fails:
-            self.fail('\n'.join(fails))
-
         # Clean up empty directories
         if self.save_results:
             if not os.listdir(save_dir):
                 os.rmdir(save_dir)
+            else:
+                self.logger.info('Running diffoscope')
+                runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', '--html-dir', 'diff-html', 'reproducibleA', 'reproducibleB'],
+                        native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=os.path.join(save_dir, 'packages'))
+
+        if fails:
+            self.fail('\n'.join(fails))
 
-- 
2.23.0


