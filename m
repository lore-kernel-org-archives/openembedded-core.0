Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72B0E71073
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:48:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17974.1695304117713351821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8416116F3;
	Thu, 21 Sep 2023 06:49:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E80B93F59C;
	Thu, 21 Sep 2023 06:48:36 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/8] oeqa/runtime/parselogs: inline single-caller functions
Date: Thu, 21 Sep 2023 14:48:29 +0100
Message-Id: <20230921134833.582827-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921134833.582827-1-ross.burton@arm.com>
References: <20230921134833.582827-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187999

From: Ross Burton <ross.burton@arm.com>

There's no need to have one-liner functions to get the MACHINE or
WORKDIR when they're only called once.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index e670df3cedd..6e5dc753060 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -223,12 +223,6 @@ class ParseLogsTest(OERuntimeTestCase):
         cls.log_locations =3D log_locations
         cls.msg =3D ''
=20
-    def getMachine(self):
-        return self.td.get('MACHINE', '')
-
-    def getWorkdir(self):
-        return self.td.get('WORKDIR', '')
-
     # Go through the log locations provided and if it's a folder
     # create a list with all the .log files in it, if it's a file
     # just add it to that list.
@@ -251,7 +245,7 @@ class ParseLogsTest(OERuntimeTestCase):
=20
     # Copy the log files to be parsed locally
     def transfer_logs(self, log_list):
-        workdir =3D self.getWorkdir()
+        workdir =3D self.td.get('WORKDIR')
         self.target_logs =3D workdir + '/' + 'target_logs'
         target_logs =3D self.target_logs
         if os.path.exists(target_logs):
@@ -278,7 +272,7 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd +=3D '" ' + str(log) + " | grep -Eiv \'"
=20
         try:
-            errorlist =3D ignore_errors[self.getMachine()]
+            errorlist =3D ignore_errors[self.td.get('MACHINE')]
         except KeyError:
             self.msg +=3D 'No ignore list found for this machine, using =
default\n'
             errorlist =3D ignore_errors['default']
--=20
2.34.1


