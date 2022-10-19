Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CABC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 20:38:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1890.1666211896356443747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 13:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D8F01424;
	Wed, 19 Oct 2022 13:38:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E93D3F792;
	Wed, 19 Oct 2022 13:38:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] scripts/oe-check-sstate: cleanup
Date: Wed, 19 Oct 2022 21:38:07 +0100
Message-Id: <20221019203808.2275846-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171981

The scriptutils import isn't used, there's no need to run bitbake
in a shell environment, and invoke bitbake as a list instead of a
string.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/oe-check-sstate | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index f4cc5869de4..7f9f835da4c 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -18,7 +18,6 @@ import re
 scripts_path =3D os.path.dirname(os.path.realpath(__file__))
 lib_path =3D scripts_path + '/lib'
 sys.path =3D sys.path + [lib_path]
-import scriptutils
 import scriptpath
 scriptpath.add_bitbake_lib_path()
 import argparse_oe
@@ -51,11 +50,8 @@ def check(args):
             env['TMPDIR:forcevariable'] =3D tmpdir
=20
         try:
-            output =3D subprocess.check_output(
-                    'bitbake -n %s' % ' '.join(args.target),
-                    stderr=3Dsubprocess.STDOUT,
-                    env=3Denv,
-                    shell=3DTrue)
+            cmd =3D ['bitbake', '--dry-run'] + args.target
+            output =3D subprocess.check_output(cmd, stderr=3Dsubprocess.=
STDOUT, env=3Denv)
=20
             task_re =3D re.compile('NOTE: Running setscene task [0-9]+ o=
f [0-9]+ \(([^)]+)\)')
             tasks =3D []
--=20
2.34.1


