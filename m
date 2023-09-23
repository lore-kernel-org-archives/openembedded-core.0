Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AECCE7A8B
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 13:04:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19766.1695474256582263521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 06:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D992CC15;
	Sat, 23 Sep 2023 06:04:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4A793F59C;
	Sat, 23 Sep 2023 06:04:15 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] oeqa/runtime/parselogs: move some variables out of global scope
Date: Sat, 23 Sep 2023 14:04:09 +0100
Message-Id: <20230923130411.766482-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923130411.766482-1-ross.burton@arm.com>
References: <20230923130411.766482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188148

From: Ross Burton <ross.burton@arm.com>

errors and log_locations can be trivially set in the class directly,
instead of being defined in the module and then copied into the class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 0262f574d1a..3f205661ea9 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -11,9 +11,6 @@ from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
=20
-#in the future these lists could be moved outside of module
-errors =3D ["error", "cannot", "can\'t", "failed"]
-
 common_errors =3D [
     "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
     "dma timeout",
@@ -201,17 +198,19 @@ ignore_errors =3D {
         ] + common_errors,
 }
=20
-log_locations =3D ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"=
]
-
 class ParseLogsTest(OERuntimeTestCase):
=20
+    # Which log files should be collected
+    log_locations =3D ["/var/log/", "/var/log/dmesg", "/tmp/dmesg_output=
.log"]
+
+    # The keywords that identify error messages in the log files
+    errors =3D ["error", "cannot", "can't", "failed"]
+
     @classmethod
     def setUpClass(cls):
-        cls.errors =3D errors
-
         # When systemd is enabled we need to notice errors on
         # circular dependencies in units.
-        if 'systemd' in cls.td.get('DISTRO_FEATURES', ''):
+        if 'systemd' in cls.td.get('DISTRO_FEATURES'):
             cls.errors.extend([
                 'Found ordering cycle on',
                 'Breaking ordering cycle by deleting job',
@@ -220,8 +219,6 @@ class ParseLogsTest(OERuntimeTestCase):
                 ])
=20
         cls.ignore_errors =3D ignore_errors
-        cls.log_locations =3D log_locations
-        cls.msg =3D ''
=20
     # Go through the log locations provided and if it's a folder
     # create a list with all the .log files in it, if it's a file
@@ -338,7 +335,9 @@ class ParseLogsTest(OERuntimeTestCase):
         self.write_dmesg()
         log_list =3D self.get_local_log_list(self.log_locations)
         result =3D self.parse_logs(log_list)
+
         errcount =3D 0
+        self.msg =3D ""
         for log in result:
             self.msg +=3D 'Log: ' + log + '\n'
             self.msg +=3D '-----------------------\n'
--=20
2.34.1


