Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9B1C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 20:38:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1955.1666211897034839976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 13:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFD8614BF;
	Wed, 19 Oct 2022 13:38:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C73B3F792;
	Wed, 19 Oct 2022 13:38:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] scripts/oe-check-sstate: force build to run for all targets, specifically populate_sysroot
Date: Wed, 19 Oct 2022 21:38:08 +0100
Message-Id: <20221019203808.2275846-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019203808.2275846-1-ross.burton@arm.com>
References: <20221019203808.2275846-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171982

Since the commit "populate_sdk_base/images: Drop use of 'meta' class and
hence do_build dependencies"[1], builds of images or SDKs don't
recursively depend on the top-level do_build target.  This is typically
a good thing: images just depend on the packages themselves and those
dependencies already exist, but they don't need each recipes sysroot to
be populated.

However, eSDK generation is partly done via the script oe-check-sstate,
which does a 'dry-run' build of the target and collates all of the
sstate that is used.  With this commit the sstate that is used is a
fraction of what would be needed in the SDK, specifically there are no
sysroots populated during the build, so there are no sysroots in the
SDK.

This is obviously a problem, as the entire point of an eSDK is to
contain a sysroot.  Resolve this problem by forcing bitbake to run the
build task for all targets, so that all potentially needed sstate is
collated.

[YOCTO #14626]

[1] https://github.com/openembedded/openembedded-core/commit/41d7f1aa2cc9=
ef5dba4db38435402d4c9c0a63e1

Tested-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/oe-check-sstate | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 7f9f835da4c..4187e774581 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -50,7 +50,7 @@ def check(args):
             env['TMPDIR:forcevariable'] =3D tmpdir
=20
         try:
-            cmd =3D ['bitbake', '--dry-run'] + args.target
+            cmd =3D ['bitbake', '--dry-run', '--runall=3Dbuild'] + args.=
target
             output =3D subprocess.check_output(cmd, stderr=3Dsubprocess.=
STDOUT, env=3Denv)
=20
             task_re =3D re.compile('NOTE: Running setscene task [0-9]+ o=
f [0-9]+ \(([^)]+)\)')
--=20
2.34.1


