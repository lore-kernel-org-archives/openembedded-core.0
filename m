Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F3BC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 11:12:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.18622.1658920318450148317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 04:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663ABD6E;
	Wed, 27 Jul 2022 04:11:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC3F3F70D;
	Wed, 27 Jul 2022 04:11:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] wic: add target tools to PATH when executing native
 commands
Date: Wed, 27 Jul 2022 12:11:53 +0100
Message-Id: <20220727111155.101717-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 11:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168554

We might want to run a cross tool, such as objcopy, in wic.  These are
in a TARGET_SYS/ subdirectory under /usr/bin, so add that directory to
the search path too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/wic/misc.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 3bc165fd7d4..2b90821b305 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -141,11 +141,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, p=
seudo=3D""):
         cmd_and_args =3D pseudo + cmd_and_args
=20
     hosttools_dir =3D get_bitbake_var("HOSTTOOLS_DIR")
+    target_sys =3D get_bitbake_var("TARGET_SYS")
=20
-    native_paths =3D "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin:%s" % \
+    native_paths =3D "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/usr/bin/%s:%s/bi=
n:%s" % \
                    (native_sysroot, native_sysroot,
-                    native_sysroot, native_sysroot,
-                    hosttools_dir)
+                    native_sysroot, native_sysroot, target_sys,
+                    native_sysroot, hosttools_dir)
=20
     native_cmd_and_args =3D "export PATH=3D%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
--=20
2.34.1


