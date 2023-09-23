Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD50CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 13:04:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20090.1695474255907103958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 06:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D3DADA7;
	Sat, 23 Sep 2023 06:04:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 784933F59C;
	Sat, 23 Sep 2023 06:04:14 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/5] oeqa/runtime/parselogs: improve find call
Date: Sat, 23 Sep 2023 14:04:07 +0100
Message-Id: <20230923130411.766482-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923130411.766482-1-ross.burton@arm.com>
References: <20230923130411.766482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188146

From: Ross Burton <ross.burton@arm.com>

getLogList() uses remote find invocations to find the logs. Instead of
relying on shell expansion of wildcards and redundant use of -maxdepth
(pointless as the shell expansion means the find is passed the files to
return), invoke find idiomatically by telling it what directory to
search for and escape the glob so find processes it.

Also remove many pointless str() calls.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 6e5dc753060..93782b844b9 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -229,18 +229,18 @@ class ParseLogsTest(OERuntimeTestCase):
     def getLogList(self, log_locations):
         logs =3D []
         for location in log_locations:
-            status, _ =3D self.target.run('test -f ' + str(location))
+            status, _ =3D self.target.run('test -f %s' % location)
             if status =3D=3D 0:
-                logs.append(str(location))
+                logs.append(location)
             else:
-                status, _ =3D self.target.run('test -d ' + str(location)=
)
+                status, _ =3D self.target.run('test -d %s' % location)
                 if status =3D=3D 0:
-                    cmd =3D 'find ' + str(location) + '/*.log -maxdepth =
1 -type f'
+                    cmd =3D 'find %s -name \\*.log -maxdepth 1 -type f' =
% location
                     status, output =3D self.target.run(cmd)
                     if status =3D=3D 0:
                         output =3D output.splitlines()
                         for logfile in output:
-                            logs.append(os.path.join(location, str(logfi=
le)))
+                            logs.append(os.path.join(location, logfile))
         return logs
=20
     # Copy the log files to be parsed locally
--=20
2.34.1


