Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11086CA0EC0
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 20:49:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.98025.1754081393573999524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 13:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB7061516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 13:49:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9226D3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 13:49:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] systemd: explicitly disable dbus
Date: Fri,  1 Aug 2025 21:49:24 +0100
Message-ID: <20250801204928.2580529-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 20:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221373

This is actually only used in a single test that we don't build, so
explicitly disable DBus instead of offering a PACKAGECONFIG that doesn't
do what you might expect (enable some systemd/dbus integration).

This doesn't change behaviour as this option wasn't enabled by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-co=
re/systemd/systemd_257.6.bb
index 9092d02c510..adc27f6cff1 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -147,7 +147,6 @@ PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Denabled,-Dtpm2=3Ddi=
sabled,tpm2-tss,tpm2-tss libtss2
 PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dtrue -Ddefault-compr=
ession=3Dlz4,,lz4"
 PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-compres=
sion=3Dxz,,xz"
 PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault-com=
pression=3Dzstd,,zstd"
-PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfals=
e -Dbootloader=3Ddisabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,=
elfutils,,libelf libdw"
 PACKAGECONFIG[fido] =3D "-Dlibfido2=3Denabled,-Dlibfido2=3Ddisabled,libf=
ido2"
@@ -251,6 +250,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dsystem-alloc-gid-min=3D101 \
                   -Dsystem-gid-max=3D999 \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
+                  -Ddbus=3Ddisabled \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
--=20
2.43.0


