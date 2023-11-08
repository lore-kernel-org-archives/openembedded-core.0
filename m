Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23136C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 11:26:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11254.1699442757809520509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 03:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C60F1477;
	Wed,  8 Nov 2023 03:26:41 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EDD03F703;
	Wed,  8 Nov 2023 03:25:56 -0800 (PST)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: diego.sueiro@arm.com,
	rahul.singh@arm.com
Subject: [PATCH] oeqa,ssh: Handle SSHCall timeout error code
Date: Wed,  8 Nov 2023 11:25:47 +0000
Message-Id: <20231108112547.3599563-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 11:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190319

The current code in ssh.py is terminating the ssh process that
does not finish its computation in a given timeout (when timeout
is passed), the SSHCall function is returning the process error
code.

The Openssl ssh before version 8.6_p1 is returning 0 when it is
terminated, from commit 8a9520836e71830f4fccca066dba73fea3d16bda
onwards (version >=3D 8.6_p1) ssh is returning 255 instead.

So for version of ssh older than 8.6_p1 when the SSHCall time out,
the return code will be 0, meaning success, which is wrong.

Fix this issue checking if the process has timeout (hence it's been
terminated) and checking if the returned code is 0, in that case
set it to 255 to advertise that an error occurred.

Add a test case exercising the timeout in the SSHTest, test_ssh
test function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta/lib/oeqa/core/target/ssh.py   | 21 ++++++++++++++++++++-
 meta/lib/oeqa/runtime/cases/ssh.py |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
index f22836d390ac..4fe763aaefba 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -224,6 +224,11 @@ class OESSHTarget(OETarget):
                 remoteDir =3D os.path.join(remotePath, tmpDir.lstrip("/"=
))
                 self.deleteDir(remoteDir)
=20
+
+class SSHCallTimeout(Exception):
+    pass
+
+
 def SSHCall(command, logger, timeout=3DNone, **opts):
=20
     def run():
@@ -232,9 +237,9 @@ def SSHCall(command, logger, timeout=3DNone, **opts):
         output_raw =3D b''
         starttime =3D time.time()
         process =3D subprocess.Popen(command, **options)
+        eof =3D False
         if timeout:
             endtime =3D starttime + timeout
-            eof =3D False
             os.set_blocking(process.stdout.fileno(), False)
             while time.time() < endtime and not eof:
                 try:
@@ -293,6 +298,11 @@ def SSHCall(command, logger, timeout=3DNone, **opts)=
:
                     pass
                 process.wait()
=20
+        # Process has timed out, raise exception here so that the proces=
s at
+        # this point is already terminated/killed
+        if not eof:
+            raise SSHCallTimeout
+
     options =3D {
         "stdout": subprocess.PIPE,
         "stderr": subprocess.STDOUT,
@@ -313,6 +323,15 @@ def SSHCall(command, logger, timeout=3DNone, **opts)=
:
=20
     try:
         run()
+    except SSHCallTimeout:
+        # Version of openssh before 8.6_p1 returns error code 0 when kil=
led by
+        # a signal, when the timeout occurs we will receive a 0 error co=
de
+        # because the process is been terminated and it's wrong because =
that
+        # value means success, but the process timed out.
+        # Afterwards, from version 8.6_p1 onwards, the returned code is =
255.
+        # Fix this behaviour by checking the return code
+        if process.returncode =3D=3D 0:
+            process.returncode =3D 255
     except:
         # Need to guard against a SystemExit or other exception ocurring
         # whilst running and ensure we don't leave a process behind.
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/c=
ases/ssh.py
index 13aac5439698..cdbef595008c 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -13,6 +13,9 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
+        (status, output) =3D self.target.run('sleep 20', timeout=3D2)
+        msg=3D'run() timed out but return code was zero.'
+        self.assertNotEqual(status, 0, msg=3Dmsg)
         (status, output) =3D self.target.run('uname -a')
         self.assertEqual(status, 0, msg=3D'SSH Test failed: %s' % output=
)
         (status, output) =3D self.target.run('cat /etc/controllerimage')

base-commit: 6806bd23499aa66942c2b6b8fbc52dbec8ff8483
--=20
2.34.1


