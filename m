Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id AEBE07DFE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:21:42 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id b19so35896244iob.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0G5rAYcuB9dknzhhBaaX2qlsJc2GwhHFeOvI3q3J+4s=;
	b=VxJhFNcEyj6qMEsu0ss4DuFoJSfYWahutoGQ+BTGmfa7e7XZ/yxfuRlXQgLvYsrRKX
	VnWsQtnrfdiR421+fTcqdZg2FUNECfTcFTLHgVq2V0L4JEWVE/6nSqO4Vdnbk6L/psno
	7ONlxR6XjSusiuwvfXkXcWLBFFya3QzkCyqFbAcYqvJvUf4KIvspzcL9fydNzVGZmn6V
	jK0qzD0q/BE44lpTxe6HORsNYDay3Nu6o5u+kRCOCxGPPuJkHel3ztwRgjm+LN3eZKPi
	YONMJ1+7a0pqV2OqP9Zi3aHQuARfcSq6JqCQltsFIBb7i71grpX2v4hkKhdPVei5uzou
	1pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0G5rAYcuB9dknzhhBaaX2qlsJc2GwhHFeOvI3q3J+4s=;
	b=GT7sWnSBVmlSEzQ5QWybbFDBiA9xsSqjKTgReqIhcSoE1pjRrXs7WnIKdoODGJgfmF
	jqRUcI/h50QWz55Sng0Onk0WXCJV0i4sca/jgOsAkATI+zIv54Cw0/2k5xp1cG21Fpnw
	Zn9ZCSz707iZ3IbGxCVK2cQWfGiSuxlw9faq83GS4AdA0NK0jdWzaq47plqxcB3FeKUI
	j/HJUpKnmT71C7XcysWnAa+vMDb2a1/WgPXsafGMs7Kcf82I27vfqcOZWQi6Z5O6njoL
	nBwoVnVDQUEV4S4gYOWxR0+r57MD4LDjnbVE0JTzDBU3HvI4+YHvvFOeqIpn4icFlqVe
	d6lA==
X-Gm-Message-State: APjAAAUX0vN27ghQMfQSMSS/TPV7sy42QQdf47LGKNglqpf0ofuuuxeX
	kbAsPULtbycyH2e/2G3U+pUQtHj8
X-Google-Smtp-Source: APXvYqyqy3+GwUbUY8hkT/h64yUs3D/OhTEAjOs1IeY1qEhuCeD1UpVp5qikKYpU+FEMgdKsc7B3xQ==
X-Received: by 2002:a5d:8908:: with SMTP id b8mr690677ion.237.1569262903466;
	Mon, 23 Sep 2019 11:21:43 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	t24sm12166089ioi.44.2019.09.23.11.21.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 11:21:42 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 13:21:37 -0500
Message-Id: <20190923182137.30292-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: Test multiconfig parsing
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
X-List-Received-Date: Mon, 23 Sep 2019 18:21:42 -0000
Content-Transfer-Encoding: 8bit

Add a test to verify that when multiconfig conf files changed, recipes
are correctly reparsed.

[YOCTO #13541]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../multiconfig/multiconfig-test-parse.bb     | 11 +++++
 meta/lib/oeqa/selftest/case.py                | 17 ++++---
 meta/lib/oeqa/selftest/cases/multiconfig.py   | 45 ++++++++++++++-----
 3 files changed, 58 insertions(+), 15 deletions(-)
 create mode 100644 meta-selftest/recipes-test/multiconfig/multiconfig-test-parse.bb

diff --git a/meta-selftest/recipes-test/multiconfig/multiconfig-test-parse.bb b/meta-selftest/recipes-test/multiconfig/multiconfig-test-parse.bb
new file mode 100644
index 00000000000..6236697453f
--- /dev/null
+++ b/meta-selftest/recipes-test/multiconfig/multiconfig-test-parse.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Test Multiconfig Parsing"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_showvar() {
+    bbplain "MCTESTVAR=${MCTESTVAR}"
+}
+addtask do_showvar
+
diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index d207a0af0c0..ac3308d8a44 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -193,13 +193,20 @@ to ensure accurate results.")
         self.logger.debug("Adding path '%s' to be cleaned up when test is over" % path)
         self._track_for_cleanup.append(path)
 
-    def write_config(self, data):
-        """Write to <builddir>/conf/selftest.inc"""
+    def write_config(self, data, multiconfig=None):
+        """Write to config file"""
+        if multiconfig:
+            multiconfigdir = "%s/conf/multiconfig" % self.builddir
+            os.makedirs(multiconfigdir, exist_ok=True)
+            dest_path = '%s/%s.conf' % (multiconfigdir, multiconfig)
+            self.track_for_cleanup(dest_path)
+        else:
+            dest_path = self.testinc_path
 
-        self.logger.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
-        ftools.write_file(self.testinc_path, data)
+        self.logger.debug("Writing to: %s\n%s\n" % (dest_path, data))
+        ftools.write_file(dest_path, data)
 
-        if self.tc.custommachine and 'MACHINE' in data:
+        if not multiconfig and self.tc.custommachine and 'MACHINE' in data:
             machine = get_bb_var('MACHINE')
             self.logger.warning('MACHINE overridden: %s' % machine)
 
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index d21bf0a4110..39b92f24391 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -3,16 +3,16 @@
 #
 
 import os
+import textwrap
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
-import oeqa.utils.ftools as ftools
 
 class MultiConfig(OESelftestTestCase):
 
     def test_multiconfig(self):
         """
-        Test that a simple multiconfig build works. This uses the mcextend class and the 
-        multiconfig-image-packager test recipe to build a core-image-full-cmdline image which 
+        Test that a simple multiconfig build works. This uses the mcextend class and the
+        multiconfig-image-packager test recipe to build a core-image-full-cmdline image which
         contains a tiny core-image-minimal and a musl core-image-minimal, installed as packages.
         """
 
@@ -28,20 +28,45 @@ DISTRO = "poky"
 TCLIBC = "musl"
 TMPDIR = "${TOPDIR}/tmp-mc-musl"
 """
+        self.write_config(muslconfig, 'musl')
 
         tinyconfig = """
 MACHINE = "qemux86"
 DISTRO = "poky-tiny"
 TMPDIR = "${TOPDIR}/tmp-mc-tiny"
 """
-
-        multiconfigdir = self.builddir + "/conf/multiconfig"
-        os.makedirs(multiconfigdir, exist_ok=True)
-        self.track_for_cleanup(multiconfigdir + "/musl.conf")
-        ftools.write_file(multiconfigdir + "/musl.conf", muslconfig)
-        self.track_for_cleanup(multiconfigdir + "/tiny.conf")
-        ftools.write_file(multiconfigdir + "/tiny.conf", tinyconfig)
+        self.write_config(tinyconfig, 'tiny')
 
         # Build a core-image-minimal
         bitbake('core-image-full-cmdline')
 
+    def test_multiconfig_reparse(self):
+        """
+        Test that changes to a multiconfig conf file are correctly detected and
+        cause a reparse/rebuild of a recipe.
+        """
+        config = textwrap.dedent('''\
+                MCTESTVAR = "test"
+                BBMULTICONFIG = "test"
+                ''')
+        self.write_config(config)
+
+        testconfig = textwrap.dedent('''\
+                MCTESTVAR_append = "1"
+                ''')
+        self.write_config(testconfig, 'test')
+
+        # Check that the 1) the task executed and 2) that it output the correct
+        # value. Note "bitbake -e" is not used because it always reparses the
+        # recipe and we want to ensure that the automatic reparsing and parse
+        # caching is detected.
+        result = bitbake('mc:test:multiconfig-test-parse -c showvar')
+        self.assertIn('MCTESTVAR=test1', result.output.splitlines())
+
+        testconfig = textwrap.dedent('''\
+                MCTESTVAR_append = "2"
+                ''')
+        self.write_config(testconfig, 'test')
+
+        result = bitbake('mc:test:multiconfig-test-parse -c showvar')
+        self.assertIn('MCTESTVAR=test2', result.output.splitlines())
-- 
2.21.0


