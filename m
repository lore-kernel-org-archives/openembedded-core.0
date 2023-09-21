Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C496E71072
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:48:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17947.1695304122504079869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 375FF16A3;
	Thu, 21 Sep 2023 06:49:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BBDE3F59C;
	Thu, 21 Sep 2023 06:48:35 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/8] oeqa/runtime/parselogs: don't bother to show target hardware information
Date: Thu, 21 Sep 2023 14:48:27 +0100
Message-Id: <20230921134833.582827-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921134833.582827-1-ross.burton@arm.com>
References: <20230921134833.582827-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188005

From: Ross Burton <ross.burton@arm.com>

This information is pretty useless as we know what the target is from
the build configuration (be it a qemu machine or real hardware).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 29 ------------------------
 1 file changed, 29 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 8fd5a86e141..e62ab2c44ec 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -237,34 +237,6 @@ class ParseLogsTest(OERuntimeTestCase):
     def getWorkdir(self):
         return self.td.get('WORKDIR', '')
=20
-    # Get some information on the CPU of the machine to display at the
-    # beginning of the output. This info might be useful in some cases.
-    def getHardwareInfo(self):
-        hwi =3D ""
-        cmd =3D ('cat /proc/cpuinfo | grep "model name" | head -n1 | '
-               " awk 'BEGIN{FS=3D\":\"}{print $2}'")
-        _, cpu_name =3D self.target.run(cmd)
-
-        cmd =3D ('cat /proc/cpuinfo | grep "cpu cores" | head -n1 | '
-               "awk {'print $4'}")
-        _, cpu_physical_cores =3D self.target.run(cmd)
-
-        cmd =3D 'cat /proc/cpuinfo | grep "processor" | wc -l'
-        _, cpu_logical_cores =3D self.target.run(cmd)
-
-        _, cpu_arch =3D self.target.run('uname -m')
-
-        hwi +=3D 'Machine information: \n'
-        hwi +=3D '*******************************\n'
-        hwi +=3D 'Machine name: ' + self.getMachine() + '\n'
-        hwi +=3D 'CPU: ' + str(cpu_name) + '\n'
-        hwi +=3D 'Arch: ' + str(cpu_arch)+ '\n'
-        hwi +=3D 'Physical cores: ' + str(cpu_physical_cores) + '\n'
-        hwi +=3D 'Logical cores: ' + str(cpu_logical_cores) + '\n'
-        hwi +=3D '*******************************\n'
-
-        return hwi
-
     # Go through the log locations provided and if it's a folder
     # create a list with all the .log files in it, if it's a file
     # just add it to that list.
@@ -376,7 +348,6 @@ class ParseLogsTest(OERuntimeTestCase):
         self.write_dmesg()
         log_list =3D self.get_local_log_list(self.log_locations)
         result =3D self.parse_logs(self.errors, self.ignore_errors, log_=
list)
-        print(self.getHardwareInfo())
         errcount =3D 0
         for log in result:
             self.msg +=3D 'Log: ' + log + '\n'
--=20
2.34.1


