Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id C0B0D7F897
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:32:36 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id d83so2367562ilk.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XibxwKwc66rs7n1aQGPKYw3Mt14jCfNY74AXMAlsNnk=;
	b=DVmybKGeTbcOtlI6j12JK37Z7AouAl/0D9i1XfwRNpZ7oCdnKDPDnL9SlUvNmBUR2n
	DBoem21IeivlyqvQvR5wW3KBVCNGTSEA+zHSHc95VU16ILLQghx9neJNFVQqkX479SVw
	C1sR2KnYn6zQlRuyn0EoLJappaoP9bA6QnlBZw7g8/QBcgrIsUqaamZCSYS2Wt1gV1Ij
	iwjbbf+UHJpPjCEJQhz4PQrV/VF3MYuyX+oRmXNHgh5RSTCbrlCF/L7J0mW7xkI3OxA7
	2bXECc+cRak7iaVRXOEy7iQr85JfhH1OVpZjfDrbzxxPUUJqG6cLtaBd8Zu/HAkBt81N
	uzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XibxwKwc66rs7n1aQGPKYw3Mt14jCfNY74AXMAlsNnk=;
	b=tVFn9a0ytteQcAkDsw/0+c+MpnAp07a8uqIG7ogYZHmtrB15rADwFLAz2FCT9mQHru
	BhX02i/Jy3AWzG1KJXuJ3N/0JpjXY3IMvV6R5SVHen+PYeFRRAjxDcR7rqMUuqYhr1bw
	QBpbG686k0u7I8Bt6WvqGeQhxfLyoIhuxcx6fymYlkZJdPrbXtQvPQca9672KsDGGeoB
	7kmX9qx74ACo8FA/pNxGI0K49B45ZtQgukHp15jmjt+hTtDG3nFlr7CaSVQRIUkGku7D
	80xU/NMCDxJZR7NyQizSdC3DOQKeFMFh2Wol79p2YDJpuGzzxnGW+5tXsIxMlqzR+DtJ
	TwKw==
X-Gm-Message-State: APjAAAUT+w0jobrDneiJhz9zD4b6R5oA0FwN0kATMYdMAkmz8YY8aY/k
	6FGHWA8zwcEjxmdISfrk4vXbT4irf7s=
X-Google-Smtp-Source: APXvYqw4Jb4oSI0+yiSu+0daS75I16D4F6TcVn91X+JZRHG09FZfFZ/Q3Ek0OixWvsVKK0sS+uZmSg==
X-Received: by 2002:a92:ce92:: with SMTP id r18mr5549544ilo.265.1573144357625; 
	Thu, 07 Nov 2019 08:32:37 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id y5sm374753ill.86.2019.11.07.08.32.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 08:32:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 10:32:31 -0600
Message-Id: <20191107163231.2519813-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: reproducible: Add option to capture bad packages
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
X-List-Received-Date: Thu, 07 Nov 2019 16:32:37 -0000
Content-Transfer-Encoding: 8bit

Adds an option that can be used to copy the offending packages to a temp
directory for later evaluation. This is useful on the Autobuilder to
investigate failures.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index c235c139ed1..a9110565a94 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -5,11 +5,16 @@
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+import bb.utils
 import functools
 import multiprocessing
 import textwrap
 import json
 import unittest
+import tempfile
+import shutil
+import stat
+import os
 
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
@@ -74,6 +79,7 @@ def compare_file(reference, test, diffutils_sysroot):
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
     images = ['core-image-minimal']
+    save_results = False
 
     def setUpLocal(self):
         super().setUpLocal()
@@ -117,9 +123,18 @@ class ReproducibleTests(OESelftestTestCase):
         self.extrasresults['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
+    def copy_file(self, source, dest):
+        bb.utils.mkdirhier(os.path.dirname(dest))
+        shutil.copyfile(source, dest)
+
     def test_reproducible_builds(self):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
+        if self.save_results:
+            save_dir = tempfile.mkdtemp(prefix='oe-reproducible-')
+            os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
+            self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
+
         # Build native utilities
         self.write_config('')
         bitbake("diffutils-native -c addto_recipe_sysroot")
@@ -176,6 +191,11 @@ class ReproducibleTests(OESelftestTestCase):
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'same', result.same)
 
+                if self.save_results:
+                    for d in result.different:
+                        self.copy_file(d.reference, '/'.join([save_dir, d.reference]))
+                        self.copy_file(d.test, '/'.join([save_dir, d.test]))
+
                 if result.missing or result.different:
                     self.fail("The following %s packages are missing or different: %s" %
                             (c, ' '.join(r.test for r in (result.missing + result.different))))
-- 
2.23.0


