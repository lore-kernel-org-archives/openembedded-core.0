Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.7851.1631274151848639714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 04:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wgq0LPRq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso1141912wmi.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EylURX3DwcsanK4gpKh6gHj7JumEvwQjWDevSswd7x0=;
        b=Wgq0LPRqG02m/gAYIc94pW/gNJ3suf/H44hgdEIKVNkC4wy2/Xwo4jPfNjumSdxX5+
         XUv9xl/TGwmi1UoIfwQLE9LeMAUJy89IRlpZufliY2BxpvGFk7eO5u1t7jdwR4xJYABB
         aRAPqKl88RlL5x2nNynmRK1C/RZaxpvgZjjyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EylURX3DwcsanK4gpKh6gHj7JumEvwQjWDevSswd7x0=;
        b=nvUPH6VkbbHeuylj87rYb7SJIvPHfoEzVieMcZMbbdj2+nwLq7e1aEFLMHoau0ULPr
         6IDoNJUiBAX3OKH9jMYnzjAs4TEORvfwP4RR69UXIngL+xxFQHGTdm+2w8lPpfkfCdkz
         ticd7sxgy+aUHvKFiCYuX15eeEgnzjPYALXfBDWWUAQvh9zbYCH65RvDD+GkNk/9NV+0
         3p95taa+VYOhEBIF2FIey9PcP689A7FirbGdYYArKJMZ57G9KKlNh8QzEvqEyMhx4ZSc
         q1j53iPoJoNOEgm7+4C+fHcX83hmXZs+0SJgDL0iX784oHXETgf0joq1Om5UpAw8lVF+
         v94w==
X-Gm-Message-State: AOAM533GRGQq6vR92TFqv45phkryQJpoewcMk8ecr6WKaVveN88ECYHM
	cy+etocFjCAFgQuzmWnOYgR0qx1tj7RTz1gd
X-Google-Smtp-Source: ABdhPJxxn2cNxR+whTenilNuUUpKiqEAOqU0SKqaUHYcVFF9+OIrd0Ex2lDivkS3AWg9eaX19TnfPQ==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr7686625wmj.151.1631274150053;
        Fri, 10 Sep 2021 04:42:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id d7sm4434771wrf.3.2021.09.10.04.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 04:42:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Add tests for bitbake shell/python task output
Date: Fri, 10 Sep 2021 12:42:28 +0100
Message-Id: <20210910114228.1253289-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've seen issues where shell/python tasks lose their log file entries
or output and also where output is duplicated. Add some tests to attempt
to spot regressions in this area in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/logging-test/logging-test.bb |  24 ++++
 meta/lib/oeqa/selftest/cases/bblogging.py     | 104 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 meta-selftest/recipes-test/logging-test/logging-test.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/bblogging.py

diff --git a/meta-selftest/recipes-test/logging-test/logging-test.bb b/meta-selftest/recipes-test/logging-test/logging-test.bb
new file mode 100644
index 00000000000..a6100123f9d
--- /dev/null
+++ b/meta-selftest/recipes-test/logging-test/logging-test.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Destined to fail"
+LICENSE = "CLOSED"
+
+deltask do_patch
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_shelltest() {
+        echo "This is shell stdout"
+        echo "This is shell stderr" >&2
+        exit 1
+}
+addtask do_shelltest
+
+python do_pythontest_exit () {
+    print("This is python stdout")
+    sys.exit(1)
+}
+addtask do_pythontest_exit
+
+python do_pythontest_fatal () {
+    print("This is python fatal test stdout")
+    bb.fatal("This is a fatal error")
+}
+addtask do_pythontest_fatal
diff --git a/meta/lib/oeqa/selftest/cases/bblogging.py b/meta/lib/oeqa/selftest/cases/bblogging.py
new file mode 100644
index 00000000000..ea6c3c8c77e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/bblogging.py
@@ -0,0 +1,104 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class BitBakeLogging(OESelftestTestCase):
+
+    def assertCount(self, item, entry, count):
+        self.assertEqual(item.count(entry), count, msg="Output:\n'''\n%s\n'''\ndoesn't contain %d copies of:\n'''\n%s\n'''\n" % (item, count, entry))
+
+    def test_shell_logging(self):
+        # no logs, no verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c shelltest -f", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertNotIn("This is shell stdout", result.output)
+        self.assertNotIn("This is shell stderr", result.output)
+
+        # logs, no verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c shelltest -f", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertCount(result.output, "This is shell stdout", 1)
+        self.assertCount(result.output, "This is shell stderr", 1)
+
+        # no logs, verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c shelltest -f -v", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # two copies due to set +x        
+        self.assertCount(result.output, "This is shell stdout", 2)
+        self.assertCount(result.output, "This is shell stderr", 2)
+
+        # logs, verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c shelltest -f -v", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # two copies due to set +x
+        self.assertCount(result.output, "This is shell stdout", 2)
+        self.assertCount(result.output, "This is shell stderr", 2)
+
+    def test_python_exit_logging(self):
+        # no logs, no verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_exit -f", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertNotIn("This is python stdout", result.output)
+
+        # logs, no verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_exit -f", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # A sys.exit() should include the output
+        self.assertCount(result.output, "This is python stdout", 1)
+
+        # no logs, verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_exit -f -v", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # python tasks don't log output with -v currently
+        #self.assertCount(result.output, "This is python stdout", 1)
+
+        # logs, verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_exit -f -v", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # python tasks don't log output with -v currently
+        #self.assertCount(result.output, "This is python stdout", 1)
+
+    def test_python_fatal_logging(self):
+        # no logs, no verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_fatal -f", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertNotIn("This is python fatal test stdout", result.output)
+        self.assertCount(result.output, "This is a fatal error", 1)
+
+        # logs, no verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_fatal -f", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # A bb.fatal() should not include the output
+        self.assertNotIn("This is python fatal test stdout", result.output)
+        self.assertCount(result.output, "This is a fatal error", 1)
+
+        # no logs, verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_fatal -f -v", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # python tasks don't log output with -v currently
+        #self.assertCount(result.output, "This is python fatal test stdout", 1)
+        self.assertCount(result.output, "This is a fatal error", 1)
+
+        # logs, verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_fatal -f -v", ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # python tasks don't log output with -v currently
+        #self.assertCount(result.output, "This is python fatal test stdout", 1)
+        self.assertCount(result.output, "This is a fatal error", 1)
+
-- 
2.32.0

