Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C219DC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 19:01:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48364.1745348460713867983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 12:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E76A51595;
	Tue, 22 Apr 2025 12:00:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF2333F5A1;
	Tue, 22 Apr 2025 12:00:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	bill.mills@linaro.org
Subject: [PATCH RFC walnascar 2/3] systemd: always depend on the explicit serial console units
Date: Tue, 22 Apr 2025 20:00:52 +0100
Message-ID: <20250422190053.3244331-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422190053.3244331-1-ross.burton@arm.com>
References: <20250422190053.3244331-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 19:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215243

The systemd-serialgetty recipe generates explicit units for consoles
that are defined in SERIAL_CONSOLES, and if that variable is not defined
then just produces an empty package.

Even when systemd has been configured to use the getty generator, if
there are explicit consoles defined then we should respect them.  Don't
conditionalise the dependency on systemd-serialgetty so that we always
pull in the explicit consoles.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-co=
re/systemd/systemd_257.4.bb
index f90308f0db0..5865c017e89 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -754,7 +754,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
=20
 RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck u=
til-linux-swaponoff util-linux-mkswap"
-RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty=
-generator', '', 'systemd-serialgetty', d)}"
+RDEPENDS:${PN} +=3D "systemd-serialgetty"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
 RRECOMMENDS:${PN} +=3D "${PN}-extra-utils \
--=20
2.43.0


