Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7402CC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:29:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2461.1667320153660010532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D51D41FB;
	Tue,  1 Nov 2022 09:29:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D5E93F5A1;
	Tue,  1 Nov 2022 09:29:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] oeqa/target/ssh: add ignore_status argument to run()
Date: Tue,  1 Nov 2022 16:29:04 +0000
Message-Id: <20221101162905.2007873-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 16:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172366

The underlying _run() method has an ignore_status argument and can
either return the exit code or raise an exception if it is non-zero.

Add the same argument to the run() method so that test cases can change
this value. It currently defaults to True as that is the existing
behaviour, but a follow-up patch will change this to False as test cases
should fail on errors unless told otherwise.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/target/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
index f956a7744f1..7a10ba97635 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -78,7 +78,7 @@ class OESSHTarget(OETarget):
=20
         return (status, output)
=20
-    def run(self, command, timeout=3DNone):
+    def run(self, command, timeout=3DNone, ignore_status=3DTrue):
         """
             Runs command in target.
=20
@@ -97,7 +97,7 @@ class OESSHTarget(OETarget):
         else:
             processTimeout =3D self.timeout
=20
-        status, output =3D self._run(sshCmd, processTimeout, True)
+        status, output =3D self._run(sshCmd, processTimeout, ignore_stat=
us)
         self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (com=
mand, status, output))
         if (status =3D=3D 255) and (('No route to host') in output):
             if self.monitor_dumper:
--=20
2.34.1


