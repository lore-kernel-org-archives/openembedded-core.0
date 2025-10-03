Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AF6CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:08:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9945.1759504119165823512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 08:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99B141655
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Oct 2025 08:08:30 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E7033F66E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Oct 2025 08:08:38 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] runqemu: remove setting of mem on kernel command line for certain systems
Date: Fri,  3 Oct 2025 11:08:36 -0400
Message-ID: <20251003150837.39814-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 15:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224393

Some emulated hardware will not boot if mem is set on the kernel command
line.  Also, it is not necessary if the device tree file, as that
_should_ have the memory size specified in it.  Add a check for QB_DTB
and don't set it if specified.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 32c7a2aab3b5..a8144aa68c3d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -884,7 +884,7 @@ to your build configuration.
         self.set('QB_MEM', qb_mem)
=20
         mach =3D self.get('MACHINE')
-        if not mach.startswith(('qemumips', 'qemux86', 'qemuloongarch64'=
)):
+        if not mach.startswith(('qemumips', 'qemux86', 'qemuloongarch64'=
)) and self.get('QB_DTB') =3D=3D "":
             self.kernel_cmdline_script +=3D ' mem=3D%s' % self.get('QB_M=
EM').replace('-m','').strip() + 'M'
=20
         self.qemu_opt_script +=3D ' %s' % self.get('QB_MEM')
--=20
2.50.1 (Apple Git-155)


