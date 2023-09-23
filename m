Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C44CE7A91
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 13:04:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19768.1695474257889924598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 06:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E5F1007;
	Sat, 23 Sep 2023 06:04:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D1E03F59C;
	Sat, 23 Sep 2023 06:04:17 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] oeqa/runtime/parselogs: parse the logs with Python, not grep
Date: Sat, 23 Sep 2023 14:04:11 +0100
Message-Id: <20230923130411.766482-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923130411.766482-1-ross.burton@arm.com>
References: <20230923130411.766482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188150

From: Ross Burton <ross.burton@arm.com>

Instead of constructing huge grep statements, we can simply open the logs
in Python and do the relevant string operations directly.

The trick is to remember to casefold() all of the strings, so that the
"in" operator can be used.

Just one of the ignores needs to be adjusted because it uses a regular
expression and the new logic doesn't support that.  This is handled
by simply reducing the size of the ignore match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 91 +++++++++++-------------
 1 file changed, 41 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 3980582dda2..a805edd79dd 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -4,9 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import collections
 import os
=20
-from subprocess import check_output
 from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
@@ -64,6 +64,7 @@ common_errors =3D [
     "xf86OpenConsole: Switching VT failed",
     "Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Opera=
tion not supported",
     "Failed to read LoaderEntryOneShot variable, ignoring: Operation not=
 supported",
+    "invalid BAR (can't size)",
     ]
=20
 x86_common =3D [
@@ -97,16 +98,13 @@ ignore_errors =3D {
     'default' : common_errors,
     'qemux86' : [
         'Failed to access perfctr msr (MSR',
-        'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t=
 size)',
         ] + qemux86_common,
     'qemux86-64' : qemux86_common,
     'qemumips' : [
         'Failed to load module "glx"',
-        'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t=
 size)',
         'cacheinfo: Failed to find cpu0 device node',
         ] + common_errors,
     'qemumips64' : [
-        'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t=
 size)',
         'cacheinfo: Failed to find cpu0 device node',
          ] + common_errors,
     'qemuppc' : [
@@ -218,11 +216,13 @@ class ParseLogsTest(OERuntimeTestCase):
                 'Ordering cycle found, skipping',
                 ])
=20
+        cls.errors =3D [s.casefold() for s in cls.errors]
+
         try:
-            cls.ignore_errors =3D ignore_errors[cls.td.get('MACHINE')]
+            cls.ignore_errors =3D [s.casefold() for s in ignore_errors[c=
ls.td.get('MACHINE')]]
         except KeyError:
             cls.logger.info('No ignore list found for this machine, usin=
g default')
-            cls.ignore_errors =3D ignore_errors['default']
+            cls.ignore_errors =3D [s.casefold() for s in ignore_errors['=
default']]
=20
     # Go through the log locations provided and if it's a folder
     # create a list with all the .log files in it, if it's a file
@@ -263,30 +263,33 @@ class ParseLogsTest(OERuntimeTestCase):
         logs =3D [f for f in dir_files if os.path.isfile(f)]
         return logs
=20
-    # Build the grep command to be used with filters and exclusions
-    def build_grepcmd(self, log):
-        grepcmd =3D 'grep '
-        grepcmd +=3D '-Ei "'
-        for error in self.errors:
-            grepcmd +=3D r'\<' + error + r'\>' + '|'
-        grepcmd =3D grepcmd[:-1]
-        grepcmd +=3D '" ' + str(log) + " | grep -Eiv \'"
+    def get_context(self, lines, index, before=3D6, after=3D3):
+        """
+        Given a set of lines and the index of the line that is important=
, return
+        a number of lines surrounding that line.
+        """
+        last =3D len(lines)
=20
+        start =3D index - before
+        end =3D index + after + 1
=20
-        for ignore_error in self.ignore_errors:
-            ignore_error =3D ignore_error.replace('(', r'\(')
-            ignore_error =3D ignore_error.replace(')', r'\)')
-            ignore_error =3D ignore_error.replace("'", '.')
-            ignore_error =3D ignore_error.replace('?', r'\?')
-            ignore_error =3D ignore_error.replace('[', r'\[')
-            ignore_error =3D ignore_error.replace(']', r'\]')
-            ignore_error =3D ignore_error.replace('*', r'\*')
-            ignore_error =3D ignore_error.replace('0-9', '[0-9]')
-            grepcmd +=3D ignore_error + '|'
-        grepcmd =3D grepcmd[:-1]
-        grepcmd +=3D "\'"
+        if start < 0:
+            end -=3D start
+            start =3D 0
+        if end > last:
+            start -=3D end - last
+            end =3D last
=20
-        return grepcmd
+        return lines[start:end]
+
+    def test_get_context(self):
+        """
+        A test case for the test case.
+        """
+        lines =3D list(range(0,10))
+        self.assertEqual(self.get_context(lines, 0, 2, 1), [0, 1, 2, 3])
+        self.assertEqual(self.get_context(lines, 5, 2, 1), [3, 4, 5, 6])
+        self.assertEqual(self.get_context(lines, 9, 2, 1), [6, 7, 8, 9])
=20
     def parse_logs(self, logs, lines_before=3D10, lines_after=3D10):
         """
@@ -296,31 +299,19 @@ class ParseLogsTest(OERuntimeTestCase):
         Returns a dictionary of log filenames to a dictionary of error l=
ines to
         the error context (controlled by @lines_before and @lines_after)=
.
         """
-        results =3D {}
-        rez =3D []
-        grep_output =3D ''
+        results =3D collections.defaultdict(dict)
=20
         for log in logs:
-            result =3D None
-            thegrep =3D self.build_grepcmd(log)
-
-            try:
-                result =3D check_output(thegrep, shell=3DTrue).decode('u=
tf-8')
-            except:
-                pass
+            with open(log) as f:
+                lines =3D f.readlines()
=20
-            if result is not None:
-                results[log] =3D {}
-                rez =3D result.splitlines()
+            for i, line in enumerate(lines):
+                line =3D line.strip()
+                line_lower =3D line.casefold()
=20
-                for xrez in rez:
-                    try:
-                        cmd =3D ['grep', '-F', xrez, '-B', str(lines_bef=
ore)]
-                        cmd +=3D ['-A', str(lines_after), log]
-                        grep_output =3D check_output(cmd).decode('utf-8'=
)
-                    except:
-                        pass
-                    results[log][xrez]=3Dgrep_output
+                if any(keyword in line_lower for keyword in self.errors)=
:
+                    if not any(ignore in line_lower for ignore in self.i=
gnore_errors):
+                        results[log][line] =3D "".join(self.get_context(=
lines, i, lines_before, lines_after))
=20
         return results
=20
@@ -342,9 +333,9 @@ class ParseLogsTest(OERuntimeTestCase):
             self.msg +=3D '-----------------------\n'
             for error in result[log]:
                 errcount +=3D 1
-                self.msg +=3D 'Central error: ' + str(error) + '\n'
+                self.msg +=3D 'Central error: ' + error + '\n'
                 self.msg +=3D  '***********************\n'
-                self.msg +=3D  result[str(log)][str(error)] + '\n'
+                self.msg +=3D  result[log][error] + '\n'
                 self.msg +=3D  '***********************\n'
         self.msg +=3D '%s errors found in logs.' % errcount
         self.assertEqual(errcount, 0, msg=3Dself.msg)
--=20
2.34.1


