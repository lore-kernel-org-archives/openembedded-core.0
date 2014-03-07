Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 312E16F655
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 00:55:01 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so4003777wes.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XaoaPCsx8MYNKnXny0f78K3gsqGcuWx3+h/SQqScBPc=;
	b=f7zhRxiKa7YdPFvUIyCUS4kfXVvp/H4wX6EdDCFsewyJAWEYnLnStsQZ/z8PZEPCp2
	/AYsun1hq1ilE329LYl0yfT5bb8xX9J+k9WRsAV/h/+B1M7vbwlBa1VgHt43QmjEpRQc
	ijDA/Sc5Feh8EVsI45pga/HNnU9+vBZDGUIJh0p664vVpqMDPS6EH4JCDxVhrFgooqz0
	n5Vs4fJHHPrTMZCuiloJnGv8Zw69lacRvem+Fk1NrLUZisEBDawtWWcqG3kPHmx1T6yc
	HDLIDDq255oxYeBlEA4uvS/57JoKM8MuId65dYADjuBF2c1V6QPGuY/k8pHaSIA5rJ+g
	F3UQ==
X-Received: by 10.194.174.100 with SMTP id br4mr14344223wjc.83.1394153702386; 
	Thu, 06 Mar 2014 16:55:02 -0800 (PST)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginmedia.com.
	[81.110.75.141])
	by mx.google.com with ESMTPSA id q15sm905007wjw.18.2014.03.06.16.55.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Mar 2014 16:55:01 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 00:54:27 +0000
Message-Id: <1394153667-4247-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
References: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH] python3: Add ptest support
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
X-List-Received-Date: Fri, 07 Mar 2014 00:55:04 -0000

A run-ptest script written in python is added which defines a new TestRunner
subclass which prints test results in the required ptest format and then
executes python's built-in testsuite using this new TestRunner subclass.

The built-in testsuite is included in the python standard library and we ensure
we have the complete library by adding ${PN}-modules and ${PN}-misc to the
RDEPENDS for the ptest package. We also require libgcc for pthread support.

Tested on qemux86. Several tests fail and many skip; further investigation
should be done to check that the current status is acceptable. In addition, the
testsuite causes an out-of-memory crash when qemu is configured with 256 MB of
RAM. The testsuite completes without crashing with 1 GB RAM.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/python/python3/run-ptest | 56 ++++++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb  | 12 ++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/run-ptest

diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
new file mode 100644
index 0000000..bd3ea11
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -0,0 +1,56 @@
+#! /usr/bin/env python3
+
+from test import support
+from test import regrtest
+import unittest
+import sys
+
+# Define a test result class which outputs results in the desired format.
+class ptestResult(unittest.TestResult):
+    def __init__(self, runner):
+        super(ptestResult, self).__init__()
+        self.runner = runner
+
+    def addError(self, test, err):
+        super(ptestResult, self).addError(test, err)
+        self.runner.write("ERROR: %s: %s\n" % (str(test), str(err[1])))
+
+    def addSuccess(self, test):
+        super(ptestResult, self).addSuccess(test)
+        self.runner.write("PASS: %s\n" % str(test))
+
+    def addFailure(self, test, err):
+        super(ptestResult, self).addFailure(test, err)
+        self.runner.write("FAIL: %s: %s\n" % (str(test), str(err[1])))
+
+    def addSkip(self, test, reason):
+        super(ptestResult, self).addSkip(test, reason)
+        self.runner.write("SKIP: %s: %s\n" % (str(test), str(reason)))
+
+    def addExpectedFailure(self, test, err):
+        super(ptestResult, self).addExpectedFailure(test, err)
+        self.runner.write("XFAIL: %s\n" % (str(test)))
+
+    def addUnexpectedSuccess(self, test):
+        super(ptestResult, self).addUnexpectedSuccess(test)
+        self.runner.write("XPASS: %s\n" % str(test))
+
+# Define a test runner which uses the above output class.
+class ptestRunner:
+    def __init__(self, stream=sys.stderr):
+        self.stream = stream
+
+    def write(self, message):
+        self.stream.write(message)
+
+    def run(self, test):
+        result = ptestResult(self)
+        test(result)
+        return result
+
+# Replace the test runner in python's standard library 'test.support'.
+support.BasicTestRunner = ptestRunner
+
+# Run the python regression test suite - the replacement test runner will be
+# used.
+regrtest.main()
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index b6f6def..e405a25 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -35,6 +35,7 @@ SRC_URI += "\
             file://sysroot-include-headers.patch \
             file://unixccompiler.patch \
             file://avoid-ncursesw-include-path.patch \
+            file://run-ptest \
            "
 SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
 SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
@@ -209,6 +210,17 @@ FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
 PACKAGES += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 
+#inherit ptest after "require python-${PYTHON_MAJMIN}-manifest.inc" so PACKAGES doesn't get overwritten
+inherit ptest
+
+# This must come after inherit ptest for the override to take effect
+do_install_ptest() {
+    install -m 0755 -d ${D}/${libdir}/python3/ptest
+    install -m 0755 ${S}/../run-ptest ${D}/${libdir}/${PN}/ptest
+}
+
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-misc libgcc"
+
 # catch manpage
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
-- 
1.9.0


