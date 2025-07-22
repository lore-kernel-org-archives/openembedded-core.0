Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6A0C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:41:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11597.1753188089840895460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5AE7152B
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 05:41:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC7AA3F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 05:41:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "systemd: add libblkid and libfdisk PACKAGECONFIG options"
Date: Tue, 22 Jul 2025 13:41:20 +0100
Message-ID: <20250722124120.3281157-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 12:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220740

The fdisk option is not enabled by default when it should be as that was
the existing behaviour.

Neither of the RDEPENDS are needed, as systemd doesn't call the tools
directly and the library dependencies will be generated automatically.

This reverts commit 4ec67113e1e7e1ecea9cde33ef4d3962dad5f2ad.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-co=
re/systemd/systemd_257.6.bb
index a104e2179ab..9092d02c510 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -75,7 +75,6 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', 'lin=
k-udev-shared', d)} \
     backlight \
     binfmt \
-    blkid \
     gshadow \
     hibernate \
     hostnamed \
@@ -136,7 +135,6 @@ PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3D=
disabled,audit"
 PACKAGECONFIG[apparmor] =3D "-Dapparmor=3Denabled,-Dapparmor=3Ddisabled,=
apparmor"
 PACKAGECONFIG[backlight] =3D "-Dbacklight=3Dtrue,-Dbacklight=3Dfalse"
 PACKAGECONFIG[binfmt] =3D "-Dbinfmt=3Dtrue,-Dbinfmt=3Dfalse"
-PACKAGECONFIG[blkid] =3D "-Dblkid=3Denabled,-Dblkid=3Ddisabled,util-linu=
x,util-linux-libblkid util-linux-blkid"
 PACKAGECONFIG[bpf-framework] =3D "-Dbpf-framework=3Denabled,-Dbpf-framew=
ork=3Ddisabled,clang-native bpftool-native libbpf,libbpf"
 PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Denabled,-Dbzip2=3Ddisabled,bzip2"
 PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredump=3Dfalse"
@@ -152,7 +150,6 @@ PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3D=
true -Ddefault-compression=3Dzst
 PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfals=
e -Dbootloader=3Ddisabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,=
elfutils,,libelf libdw"
-PACKAGECONFIG[fdisk] =3D "-Dfdisk=3Denabled,-Dfdisk=3Ddisabled,util-linu=
x,util-linux-libfdisk util-linux-fdisk"
 PACKAGECONFIG[fido] =3D "-Dlibfido2=3Denabled,-Dlibfido2=3Ddisabled,libf=
ido2"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Denabled,-Drepart=3Ddisabled"
--=20
2.43.0


