Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33ABC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 16:42:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16484.1707842545529152882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 08:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49045DA7
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:43:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96EDB3F5A1
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:42:24 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemuarm64: maximise the emulated CPU capabilities
Date: Tue, 13 Feb 2024 16:42:23 +0000
Message-Id: <20240213164223.263232-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 16:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195418

From: Ross Burton <ross.burton@arm.com>

Instead of emulating a Cortex-A57, just ask qemu to emulate everything
it knows how to (apart from Pointer Authentication, where we use qemu's
implementation-defined algorithm which is vastly faster to emulate).

This does not change the tune, so the generated code is identical. The
advantage of doing this is that it lets us verify that features such as
Branch Target Indentification, which requires hardware support, is
actually functional.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm=
64.conf
index a096d964db5..63af4cd346d 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -14,7 +14,7 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
 # For runqemu
 QB_SYSTEM_NAME =3D "qemu-system-aarch64"
 QB_MACHINE =3D "-machine virt"
-QB_CPU =3D "-cpu cortex-a57"
+QB_CPU =3D "-cpu max,pauth-impdef=3Don"
 QB_SMP ?=3D "-smp 4"
 QB_CPU_KVM =3D "-cpu host -machine gic-version=3D3"
 # For graphics to work we need to define the VGA device as well as the n=
ecessary USB devices
--=20
2.34.1


