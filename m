Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C1AC32772
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 15:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19159.1661181595214508316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 08:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FDA213D5;
	Mon, 22 Aug 2022 08:19:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F00A3F70D;
	Mon, 22 Aug 2022 08:19:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] oeqa/commands: add support for running cross tools to
 runCmd
Date: Mon, 22 Aug 2022 16:19:49 +0100
Message-Id: <20220822151950.2611880-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822151950.2611880-1-ross.burton@arm.com>
References: <20220822151950.2611880-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 15:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169677

If native_sysroot is passed, also support the caller passing in the
target_sys and add that to the path if so.  This allows runCmd() to be
used to invoke the cross tools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/commands.py | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/comman=
ds.py
index 024261410e0..f733fcdf3c8 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -168,15 +168,22 @@ class Result(object):
=20
=20
 def runCmd(command, ignore_status=3DFalse, timeout=3DNone, assert_error=3D=
True, sync=3DTrue,
-          native_sysroot=3DNone, limit_exc_output=3D0, output_log=3DNone=
, **options):
+          native_sysroot=3DNone, target_sys=3DNone, limit_exc_output=3D0=
, output_log=3DNone, **options):
     result =3D Result()
=20
     if native_sysroot:
-        extra_paths =3D "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
-                      (native_sysroot, native_sysroot, native_sysroot)
-        nenv =3D dict(options.get('env', os.environ))
-        nenv['PATH'] =3D extra_paths + ':' + nenv.get('PATH', '')
-        options['env'] =3D nenv
+        new_env =3D dict(options.get('env', os.environ))
+        paths =3D new_env["PATH"].split(":")
+        paths =3D [
+            os.path.join(native_sysroot, "bin"),
+            os.path.join(native_sysroot, "sbin"),
+            os.path.join(native_sysroot, "usr", "bin"),
+            os.path.join(native_sysroot, "usr", "sbin"),
+        ] + paths
+        if target_sys:
+            paths =3D [os.path.join(native_sysroot, "usr", "bin", target=
_sys)] + paths
+        new_env["PATH"] =3D ":".join(paths)
+        options['env'] =3D new_env
=20
     cmd =3D Command(command, timeout=3Dtimeout, output_log=3Doutput_log,=
 **options)
     cmd.run()
--=20
2.34.1


