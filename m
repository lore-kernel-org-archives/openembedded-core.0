Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5E3CE7A8F
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 13:04:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20092.1695474257259161284
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 06:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C29DA7;
	Sat, 23 Sep 2023 06:04:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70AE03F59C;
	Sat, 23 Sep 2023 06:04:16 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/5] oeqa/runtime/parselogs: select the correct machine-specific ignores early
Date: Sat, 23 Sep 2023 14:04:10 +0100
Message-Id: <20230923130411.766482-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923130411.766482-1-ross.burton@arm.com>
References: <20230923130411.766482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188149

From: Ross Burton <ross.burton@arm.com>

This has no impact to the execution, but makes the following changes
neater.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 3f205661ea9..3980582dda2 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -218,7 +218,11 @@ class ParseLogsTest(OERuntimeTestCase):
                 'Ordering cycle found, skipping',
                 ])
=20
-        cls.ignore_errors =3D ignore_errors
+        try:
+            cls.ignore_errors =3D ignore_errors[cls.td.get('MACHINE')]
+        except KeyError:
+            cls.logger.info('No ignore list found for this machine, usin=
g default')
+            cls.ignore_errors =3D ignore_errors['default']
=20
     # Go through the log locations provided and if it's a folder
     # create a list with all the .log files in it, if it's a file
@@ -268,13 +272,8 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd =3D grepcmd[:-1]
         grepcmd +=3D '" ' + str(log) + " | grep -Eiv \'"
=20
-        try:
-            errorlist =3D self.ignore_errors[self.td.get('MACHINE')]
-        except KeyError:
-            self.msg +=3D 'No ignore list found for this machine, using =
default\n'
-            errorlist =3D self.ignore_errors['default']
=20
-        for ignore_error in errorlist:
+        for ignore_error in self.ignore_errors:
             ignore_error =3D ignore_error.replace('(', r'\(')
             ignore_error =3D ignore_error.replace(')', r'\)')
             ignore_error =3D ignore_error.replace("'", '.')
--=20
2.34.1


