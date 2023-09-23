Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0E4CE7A8C
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 13:04:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20091.1695474256573897798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 06:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 394BB1007;
	Sat, 23 Sep 2023 06:04:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 247093F59C;
	Sat, 23 Sep 2023 06:04:15 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] oeqa/runtime/parselogs: don't pass around members
Date: Sat, 23 Sep 2023 14:04:08 +0100
Message-Id: <20230923130411.766482-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923130411.766482-1-ross.burton@arm.com>
References: <20230923130411.766482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188147

From: Ross Burton <ross.burton@arm.com>

There's no point in passing around member fields, just access them
directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 93782b844b9..0262f574d1a 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -263,19 +263,19 @@ class ParseLogsTest(OERuntimeTestCase):
         return logs
=20
     # Build the grep command to be used with filters and exclusions
-    def build_grepcmd(self, errors, ignore_errors, log):
+    def build_grepcmd(self, log):
         grepcmd =3D 'grep '
         grepcmd +=3D '-Ei "'
-        for error in errors:
+        for error in self.errors:
             grepcmd +=3D r'\<' + error + r'\>' + '|'
         grepcmd =3D grepcmd[:-1]
         grepcmd +=3D '" ' + str(log) + " | grep -Eiv \'"
=20
         try:
-            errorlist =3D ignore_errors[self.td.get('MACHINE')]
+            errorlist =3D self.ignore_errors[self.td.get('MACHINE')]
         except KeyError:
             self.msg +=3D 'No ignore list found for this machine, using =
default\n'
-            errorlist =3D ignore_errors['default']
+            errorlist =3D self.ignore_errors['default']
=20
         for ignore_error in errorlist:
             ignore_error =3D ignore_error.replace('(', r'\(')
@@ -292,17 +292,21 @@ class ParseLogsTest(OERuntimeTestCase):
=20
         return grepcmd
=20
-    # Grep only the errors so that their context could be collected.
-    # Default context is 10 lines before and after the error itself
-    def parse_logs(self, errors, ignore_errors, logs,
-                   lines_before =3D 10, lines_after =3D 10):
+    def parse_logs(self, logs, lines_before=3D10, lines_after=3D10):
+        """
+        Search the log files @logs looking for error lines (marked by
+        @self.errors), ignoring anything listed in @self.ignore_errors.
+
+        Returns a dictionary of log filenames to a dictionary of error l=
ines to
+        the error context (controlled by @lines_before and @lines_after)=
.
+        """
         results =3D {}
         rez =3D []
         grep_output =3D ''
=20
         for log in logs:
             result =3D None
-            thegrep =3D self.build_grepcmd(errors, ignore_errors, log)
+            thegrep =3D self.build_grepcmd(log)
=20
             try:
                 result =3D check_output(thegrep, shell=3DTrue).decode('u=
tf-8')
@@ -333,7 +337,7 @@ class ParseLogsTest(OERuntimeTestCase):
     def test_parselogs(self):
         self.write_dmesg()
         log_list =3D self.get_local_log_list(self.log_locations)
-        result =3D self.parse_logs(self.errors, self.ignore_errors, log_=
list)
+        result =3D self.parse_logs(log_list)
         errcount =3D 0
         for log in result:
             self.msg +=3D 'Log: ' + log + '\n'
--=20
2.34.1


