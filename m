Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AF2EEB58D
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 10:46:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45193.1726137975704162964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 03:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94CD3DA7
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 03:46:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB0833F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 03:46:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add missing dependency on libkmod to udev
Date: Thu, 12 Sep 2024 11:46:09 +0100
Message-Id: <20240912104609.3197942-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204442

As of systemd 256, libsystemd-shared.so doesn't directly link to a number
of libraries but instead dlopen()'s them as needed to reduce the size of
the attack surface.

Instead the .so has a .note.dlopen segment that lists the libraries that
may be opened, with the intention that these are transformed into package
recommendation fields.

We don't yet have support for these (see #15595) so explicit dependencies
have been added to the systemd package itself. However, in an initramfs
with udev but without systemd and no recommendations you end up without
libkmod, so module loading is impossible.

Add an explicit hard dependency on libkmod to udev, because modules are
critical functionality.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-co=
re/systemd/systemd_256.5.bb
index db053b45428..dc799f682ae 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -743,6 +743,8 @@ INSANE_SKIP:libsystemd-shared +=3D "libdir"
 FILES:libsystemd-shared =3D "${rootlibdir}/systemd/libsystemd-shared*.so=
"
=20
 RPROVIDES:udev =3D "hotplug"
+# This can be removed when we parse .note.dlopen in the ELF
+RDEPENDS:udev +=3D "libkmod"
=20
 RDEPENDS:udev-bash-completion +=3D "bash-completion"
 RDEPENDS:udev-hwdb +=3D "udev"
--=20
2.34.1


