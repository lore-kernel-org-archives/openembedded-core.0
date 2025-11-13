Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0105CD8C8F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 15:18:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26451.1763047084725216796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 07:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FF7B12FC
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 07:17:56 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D17423F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 07:18:03 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/2] runqemu: avoid setting "mem=" when using a DTB
Date: Thu, 13 Nov 2025 10:18:01 -0500
Message-ID: <20251113151802.366-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 15:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226250

Some emulated machines, such as the Raspberry Pi models, fail to boot
if a fixed "mem=3D" value is passed on the kernel command line. When a
DTB is used (QB_DTB is set), the memory size is already defined there,
so specifying it again is unnecessary and can cause issues.

Skip adding "mem=3D" to the kernel command line when QB_DTB is present.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2be7a0f2869f..370b45578137 100755
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


