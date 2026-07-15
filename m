Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07310C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:44:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12560.1784133843704659236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZGv9tNWC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0C09152B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:43:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5CF73F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784133843; bh=BvXX71IE+mdgEFh+zYDA9s/k2xmlNQx+Atf5gMa6zhQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZGv9tNWCUheJogDBiMmq2Yms+uC+zrLeQMIsv+pP1AmyIhsbKtYVYOmb9lRjerwYl
	 Qh4wbxbH7ztH4YxyJ/XB2ot1qiO57W5dZWtgy3+sWLIFNOhiRWiCO4xLvE5wmeZUDI
	 27NRAb+9E5SiJI5SIVk9TOWgSNT7RhjjptauIGNk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] systemd: drop redundant runtime dependencies
Date: Wed, 15 Jul 2026 17:43:49 +0100
Message-ID: <20260715164351.903912-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715164351.903912-1-ross.burton@arm.com>
References: <20260715164351.903912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240990

The PACKAGECONFIGs have several items which add to RRECOMMENDS because
the libraries are not linked to at build time but dlopen()ed instead.

Previously we had to add dependencies manually (e.g. [1]), but this
is no longer needed since we now generate the dependencies based on ELF
notes[2].

[1] oe-core f7366f44fd7 ("systemd: recommend libelf, libdw for elfutils f=
lag")
[2] oe-core 905da779bcf ("systemd: extract dependencies from .note.dlopen=
 ELF segments")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
index 27722f97bbb..7cc62bde995 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -124,7 +124,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dt=
rue -Ddefault-compression=3Dlz4,,
 PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-compres=
sion=3Dxz,,xz"
 PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault-com=
pression=3Dzstd,,zstd"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfals=
e -Dbootloader=3Ddisabled,python3-pyelftools-native"
-PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,=
elfutils,,libelf libdw"
+PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,=
elfutils"
 PACKAGECONFIG[fido] =3D "-Dlibfido2=3Denabled,-Dlibfido2=3Ddisabled,libf=
ido2-initial"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Denabled,-Drepart=3Ddisabled"
@@ -141,8 +141,8 @@ PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Denabled,-Dlibcurl=3Ddisab=
led,curl"
 PACKAGECONFIG[kmod] =3D "-Dkmod=3Denabled,-Dkmod=3Ddisabled,kmod,libkmod=
"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldcon=
fig"
-PACKAGECONFIG[libidn] =3D "-Dlibidn=3Denabled,-Dlibidn=3Ddisabled,libidn=
,,libidn"
-PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Denabled,-Dlibidn2=3Ddisabled,lib=
idn2,,libidn2"
+PACKAGECONFIG[libidn] =3D "-Dlibidn=3Denabled,-Dlibidn=3Ddisabled,libidn=
"
+PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Denabled,-Dlibidn2=3Ddisabled,lib=
idn2"
 # Link udev shared with systemd helper library.
 # If enabled the udev package depends on the systemd package (which has =
the needed shared library).
 PACKAGECONFIG[link-udev-shared] =3D "-Dlink-udev-shared=3Dtrue,-Dlink-ud=
ev-shared=3Dfalse"
@@ -175,7 +175,7 @@ PACKAGECONFIG[polkit_hostnamed_fallback] =3D ",,,,dbu=
s-broker,polkit"
 PACKAGECONFIG[portabled] =3D "-Dportabled=3Dtrue,-Dportabled=3Dfalse"
 PACKAGECONFIG[pstore] =3D "-Dpstore=3Dtrue,-Dpstore=3Dfalse"
 PACKAGECONFIG[pni-names] =3D ",,,"
-PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Denabled,-Dqrencode=3Ddisabled,=
qrencode,,qrencode"
+PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Denabled,-Dqrencode=3Ddisabled,=
qrencode"
 PACKAGECONFIG[quotacheck] =3D "-Dquotacheck=3Dtrue,-Dquotacheck=3Dfalse"
 PACKAGECONFIG[randomseed] =3D "-Drandomseed=3Dtrue,-Drandomseed=3Dfalse"
 PACKAGECONFIG[resolved] =3D "-Dresolve=3Dtrue,-Dresolve=3Dfalse"
--=20
2.43.0


