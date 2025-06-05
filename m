Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68228C61CE8
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10967.1749137721973201451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFF71688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5162F3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/16] systemtap: put version in recipe filename
Date: Thu,  5 Jun 2025 16:35:07 +0100
Message-ID: <20250605153508.961682-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218051

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, drop the explicit PV, and set the tag
name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{systemtap-native_git.bb =3D> systemtap-native_5.2.bb}    | 3 +--
 .../systemtap/{systemtap_git.bb =3D> systemtap_5.2.bb}        | 0
 meta/recipes-kernel/systemtap/systemtap_git.inc             | 6 +++---
 3 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_git.bb =3D> syste=
mtap-native_5.2.bb} (77%)
 rename meta/recipes-kernel/systemtap/{systemtap_git.bb =3D> systemtap_5.=
2.bb} (100%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta=
/recipes-kernel/systemtap/systemtap-native_5.2.bb
similarity index 77%
rename from meta/recipes-kernel/systemtap/systemtap-native_git.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.2.bb
index 2690b259c8b..8befa7a7eac 100644
--- a/meta/recipes-kernel/systemtap/systemtap-native_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-native_5.2.bb
@@ -1,5 +1,4 @@
-
-require systemtap_git.bb
+require systemtap_${PV}.bb
=20
 inherit_defer native
=20
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_5.2.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap_git.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.2.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
index bbb2105b5ac..ccc987d0d91 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,14 +1,14 @@
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-SRCREV =3D "3a92ffe673c1621309a0b60892114495b651c9de"
-PV =3D "5.2"
=20
-SRC_URI =3D "git://sourceware.org/git/systemtap.git;branch=3Dmaster;prot=
ocol=3Dhttps \
+SRC_URI =3D "git://sourceware.org/git/systemtap.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Drelease-${PV} \
            file://0001-Do-not-let-configure-write-a-python-location-into=
-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.pat=
ch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-ro=
ot.patch \
            "
=20
+SRCREV =3D "3a92ffe673c1621309a0b60892114495b651c9de"
+
 COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|=
riscv64).*-linux'
 COMPATIBLE_HOST:libc-musl =3D 'null'
=20
--=20
2.43.0


