Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9AAEB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 15:51:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.667.1689868313234524715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 08:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39566D75;
	Thu, 20 Jul 2023 08:52:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5489D3F738;
	Thu, 20 Jul 2023 08:51:52 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] oeqa/ltp: rewrote LTP testcase and parser
Date: Thu, 20 Jul 2023 16:51:50 +0100
Message-Id: <20230720155150.4048211-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720155150.4048211-1-ross.burton@arm.com>
References: <20230720155150.4048211-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184641

From: Ross Burton <ross.burton@arm.com>

The LTP test reporting appears to be a little fragile so I tried to make
it more reliable.

Primarily this is done by not passing -p to runltp, which results in
machine-readable logfiles instead of human-readable.  These are easier
to parse and have more context in, so we can also report correctly
skipped tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 17 +++++---
 meta/lib/oeqa/utils/logparser.py   | 62 +++++++++++++++++++-----------
 2 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/c=
ases/ltp.py
index a66d5d13d75..29c26d7d324 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -65,29 +65,34 @@ class LtpTest(LtpTestBase):
     ltp_groups +=3D ltp_fs
=20
     def runltp(self, ltp_group):
-            cmd =3D '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp=
/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
+            # LTP appends to log files, so ensure we start with a clean =
log
+            self.target.deleteFiles("/opt/ltp/results/", ltp_group)
+
+            cmd =3D '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/re=
sults/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
+
             starttime =3D time.time()
             (status, output) =3D self.target.run(cmd)
             endtime =3D time.time()
=20
+            # Write the console log to disk for convenience
             with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % =
ltp_group), 'w') as f:
                 f.write(output)
=20
+            # Also put the console log into the test result JSON
             self.extras['ltpresult.rawlogs']['log'] =3D self.extras['ltp=
result.rawlogs']['log'] + output
=20
-            # copy nice log from DUT
-            dst =3D os.path.join(self.ltptest_log_dir, "%s" %  ltp_group=
 )
+            # Copy the machine-readable test results locally so we can p=
arse it
+            dst =3D os.path.join(self.ltptest_log_dir, ltp_group)
             remote_src =3D "/opt/ltp/results/%s" % ltp_group=20
             (status, output) =3D self.target.copyFrom(remote_src, dst, T=
rue)
-            msg =3D 'File could not be copied. Output: %s' % output
             if status:
+                msg =3D 'File could not be copied. Output: %s' % output
                 self.target.logger.warning(msg)
=20
             parser =3D LtpParser()
             results, sections  =3D parser.parse(dst)
=20
-            runtime =3D int(endtime-starttime)
-            sections['duration'] =3D runtime
+            sections['duration'] =3D int(endtime-starttime)
             self.sections[ltp_group] =3D  sections
=20
             failed_tests =3D {}
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logpa=
rser.py
index 8054acc853b..496d9e0c903 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import sys
+import enum
 import os
 import re
=20
@@ -106,30 +106,48 @@ class PtestParser(object):
                     f.write(status + ": " + test_name + "\n")
=20
=20
-# ltp log parsing
-class LtpParser(object):
-    def __init__(self):
-        self.results =3D {}
-        self.section =3D {'duration': "", 'log': ""}
-
+class LtpParser:
+    """
+    Parse the machine-readable LTP log output into a ptest-friendly data=
 structure.
+    """
     def parse(self, logfile):
-        test_regex =3D {}
-        test_regex['PASSED'] =3D re.compile(r"PASS")
-        test_regex['FAILED'] =3D re.compile(r"FAIL")
-        test_regex['SKIPPED'] =3D re.compile(r"SKIP")
-
-        with open(logfile, errors=3D'replace') as f:
+        results =3D {}
+        # Aaccumulate the duration here but as the log rounds quick test=
s down
+        # to 0 seconds this is very much a lower bound. The caller can r=
eplace
+        # the value.
+        section =3D {"duration": 0, "log": ""}
+
+        class LtpExitCode(enum.IntEnum):
+            # Exit codes as defined in ltp/include/tst_res_flags.h
+            TPASS =3D 0  # Test passed flag
+            TFAIL =3D 1  # Test failed flag
+            TBROK =3D 2  # Test broken flag
+            TWARN =3D 4  # Test warning flag
+            TINFO =3D 16 # Test information flag
+            TCONF =3D 32 # Test not appropriate for configuration flag
+
+        with open(logfile, errors=3D"replace") as f:
+            # Lines look like this:
+            # tag=3Dcfs_bandwidth01 stime=3D1689762564 dur=3D0 exit=3Dex=
ited stat=3D32 core=3Dno cu=3D0 cs=3D0
             for line in f:
-                for t in test_regex:
-                    result =3D test_regex[t].search(line)
-                    if result:
-                        self.results[line.split()[0].strip()] =3D t
-
-        for test in self.results:
-            result =3D self.results[test]
-            self.section['log'] =3D self.section['log'] + ("%s: %s\n" % =
(result.strip()[:-2], test.strip()))
+                if not line.startswith("tag=3D"):
+                    continue
=20
-        return self.results, self.section
+                values =3D dict(s.split("=3D") for s in line.strip().spl=
it())
+
+                section["duration"] +=3D int(values["dur"])
+                exitcode =3D int(values["stat"])
+                if values["exit"] =3D=3D "exited" and exitcode =3D=3D Lt=
pExitCode.TCONF:
+                    # Exited normally with the "invalid configuration" c=
ode
+                    results[values["tag"]] =3D "SKIPPED"
+                elif exitcode =3D=3D LtpExitCode.TPASS:
+                    # Successful exit
+                    results[values["tag"]] =3D "PASSED"
+                else:
+                    # Other exit
+                    results[values["tag"]] =3D "FAILED"
+
+        return results, section
=20
=20
 # ltp Compliance log parsing
--=20
2.34.1


