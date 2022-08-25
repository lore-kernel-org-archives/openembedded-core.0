Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0B1C65C0D
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:36:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.24069.1661434594945376000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41CDAD6E;
	Thu, 25 Aug 2022 06:36:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A02F3F71A;
	Thu, 25 Aug 2022 06:36:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/6] wic: add target tools to PATH when executing native
 commands
Date: Thu, 25 Aug 2022 14:36:28 +0100
Message-Id: <20220825133630.1659896-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825133630.1659896-1-ross.burton@arm.com>
References: <20220825133630.1659896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:36:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169862

We might want to run a cross tool, such as objcopy, in wic.  These are
in a TARGET_SYS/ subdirectory under /usr/bin, so add that directory to
the search path too.

(From OE-Core rev: c523549141e5c31edc75281f581d97867b7d251d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/misc.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 3e118229960..a8aab6c524e 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -140,11 +140,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, p=
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


