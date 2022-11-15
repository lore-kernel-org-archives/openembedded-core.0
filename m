Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB36C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 14:40:57 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web12.6245.1668523245824038638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 06:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=AbYp06Be;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id A543D4088A
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1668523242; x=
	1670337643; bh=EIvfCP5tEyOD7oU88+u8uPQfTWZNvhOyfw6FuKC5U1s=; b=A
	bYp06BeLoQ6zZwwJiE8nNm6hctOSdFnr9xHhuB3jLgzZBJWQPaK5f6sGhA3n2OiF
	EZFt2dtYBQaDI1Vi12CQ0LlWbiqr+drvWLPLvts9Dea4+V7ScJu5zXHqW8ngFTNW
	q9+NJITFtZDrxzsLCJDp0XE6DSET/dGeiN5TqqnXG4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PpNxcWTpOCt
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2022 17:40:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 4BBF3404CD
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 17:40:42 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 15 Nov 2022 17:40:42 +0300
Received: from localhost.localdomain (172.22.3.32) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 15 Nov
 2022 17:40:41 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] wic: implement bootloader --password
Date: Tue, 15 Nov 2022 17:40:31 +0300
Message-ID: <20221115144031.89678-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.3.32]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 14:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173346

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Currently the only way to specify a password for bootloader
is to supply a complete user-defined bootloader config file
to the build process.  This patch introduces a --password
paramenter in order to simplify bootloaders hardening.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 scripts/lib/wic/ksparser.py                         |  1 +
 scripts/lib/wic/plugins/source/bootimg-efi.py       |  6 +++++-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  7 ++++++-
 .../lib/wic/plugins/source/isoimage-isohybrid.py    | 13 +++++++++++--
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d1e546b12d..89bc897a5a 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -195,6 +195,7 @@ class KickStart():
                                 default=3D'msdos')
         bootloader.add_argument('--timeout', type=3Dint)
         bootloader.add_argument('--source')
+        bootloader.add_argument('--password')
=20
         include =3D subparsers.add_parser('include')
         include.add_argument('path', type=3Dcannedpathtype)
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
index 4b00913a70..3d84252796 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -86,7 +86,11 @@ class BootimgEFIPlugin(SourcePlugin):
             grubefi_conf +=3D "serial --unit=3D0 --speed=3D115200 --word=
=3D8 --parity=3Dno --stop=3D1\n"
             grubefi_conf +=3D "default=3Dboot\n"
             grubefi_conf +=3D "timeout=3D%s\n" % bootloader.timeout
-            grubefi_conf +=3D "menuentry '%s'{\n" % (title if title else=
 "boot")
+            if bootloader.password:
+                grubefi_conf +=3D "set superusers=3D\"root\"\n"
+                grubefi_conf +=3D "export superusers\n"
+                grubefi_conf +=3D "password root %s\n" % (bootloader.pas=
sword)
+            grubefi_conf +=3D "menuentry '%s' %s {\n" % (title if title =
else "boot", "--unrestricted" if bootloader.password else "")
=20
             kernel =3D get_bitbake_var("KERNEL_IMAGETYPE")
             if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") =3D=3D "1":
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/l=
ib/wic/plugins/source/bootimg-pcbios.py
index 32e47f1831..cbf4622cf9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -113,8 +113,13 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf =3D ""
             syslinux_conf +=3D "PROMPT 0\n"
             syslinux_conf +=3D "TIMEOUT " + str(bootloader.timeout) + "\=
n"
+            if bootloader.password:
+                syslinux_conf +=3D "MENU MASTER PASSWD " + str(bootloade=
r.password) + "\n"
+                syslinux_conf +=3D "ALLOWOPTIONS 0\n"
+                syslinux_conf +=3D "NOESCAPE 1\n"
+            else:
+                syslinux_conf +=3D "ALLOWOPTIONS 1\n"
             syslinux_conf +=3D "\n"
-            syslinux_conf +=3D "ALLOWOPTIONS 1\n"
             syslinux_conf +=3D "SERIAL 0 115200\n"
             syslinux_conf +=3D "\n"
             if splashline:
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scrip=
ts/lib/wic/plugins/source/isoimage-isohybrid.py
index 607356ad13..1d5099f954 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -63,8 +63,13 @@ class IsoImagePlugin(SourcePlugin):
         syslinux_conf =3D ""
         syslinux_conf +=3D "PROMPT 0\n"
         syslinux_conf +=3D "TIMEOUT %s \n" % (bootloader.timeout or 10)
+        if bootloader.password:
+            syslinux_conf +=3D "MENU MASTER PASSWD " + str(bootloader.pa=
ssword) + "\n"
+            syslinux_conf +=3D "ALLOWOPTIONS 0\n"
+            syslinux_conf +=3D "NOESCAPE 1\n"
+        else:
+            syslinux_conf +=3D "ALLOWOPTIONS 1\n"
         syslinux_conf +=3D "\n"
-        syslinux_conf +=3D "ALLOWOPTIONS 1\n"
         syslinux_conf +=3D "SERIAL 0 115200\n"
         syslinux_conf +=3D "\n"
         if splashline:
@@ -116,10 +121,14 @@ class IsoImagePlugin(SourcePlugin):
             grubefi_conf +=3D "--parity=3Dno --stop=3D1\n"
             grubefi_conf +=3D "default=3Dboot\n"
             grubefi_conf +=3D "timeout=3D%s\n" % (bootloader.timeout or =
10)
+            if bootloader.password:
+                grubefi_conf +=3D "set superusers=3D\"root\"\n"
+                grubefi_conf +=3D "export superusers\n"
+                grubefi_conf +=3D "password root %s\n" % (bootloader.pas=
sword)
             grubefi_conf +=3D "\n"
             grubefi_conf +=3D "search --set=3Droot --label %s " % part.l=
abel
             grubefi_conf +=3D "\n"
-            grubefi_conf +=3D "menuentry 'boot'{\n"
+            grubefi_conf +=3D "menuentry 'boot' %s {\n" % ("--unrestrict=
ed" if bootloader.password else "")
=20
             kernel =3D get_bitbake_var("KERNEL_IMAGETYPE")
             if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") =3D=3D "1":
--=20
2.37.2


