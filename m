Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F36CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 17:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3855.1759341495545281963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 10:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 234B8339
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Oct 2025 10:58:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01E3E3F66E
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Oct 2025 10:58:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tunes/arm: add support for newer arm64 cores
Date: Wed,  1 Oct 2025 13:58:14 -0400
Message-ID: <20251001175814.62654-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 17:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224317

Add tunes for cores that have been present since GCC 14.1.0.
These have been present in meta-arm since mid-July, and have all been
verified with fvp-base and testimage.  Of those present in meta-arm,
arch-armv8-9a.inc, arch-armv9-4a.inc, and arch-armv9-5a.inc have been
excluded from this commit, as there are currently issues compiling some
packages (but still present in meta-arm for those that want to use them
despite those issues).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-armv8-7a.inc | 14 ++++++++++++++
 meta/conf/machine/include/arm/arch-armv8-8a.inc | 14 ++++++++++++++
 meta/conf/machine/include/arm/arch-armv9-1a.inc | 13 +++++++++++++
 meta/conf/machine/include/arm/arch-armv9-2a.inc | 13 +++++++++++++
 meta/conf/machine/include/arm/arch-armv9-3a.inc | 13 +++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-7a.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-8a.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv9-1a.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv9-2a.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv9-3a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-7a.inc b/meta/conf/=
machine/include/arm/arch-armv8-7a.inc
new file mode 100644
index 000000000000..6039baca3568
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-7a.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?=3D "armv8-7a"
+
+TUNEVALID[armv8-7a] =3D "Enable instructions for ARMv8.7-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a'=
, ' -march=3Darmv8.7-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a',=
 'armv8-7a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "armv8-7a"
+ARMPKGARCH:tune-armv8-7a                    ?=3D "armv8-7a"
+TUNE_FEATURES:tune-armv8-7a                  =3D "aarch64 armv8-7a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-7a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-7a"
+BASE_LIB:tune-armv8-7a                       =3D "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv8-8a.inc b/meta/conf/=
machine/include/arm/arch-armv8-8a.inc
new file mode 100644
index 000000000000..5694330a1d22
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-8a.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?=3D "armv8-8a"
+
+TUNEVALID[armv8-8a] =3D "Enable instructions for ARMv8.8-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a'=
, ' -march=3Darmv8.8-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a',=
 'armv8-8a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "armv8-8a"
+ARMPKGARCH:tune-armv8-8a                    ?=3D "armv8-8a"
+TUNE_FEATURES:tune-armv8-8a                  =3D "aarch64 armv8-8a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-8a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-8a"
+BASE_LIB:tune-armv8-8a                       =3D "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv9-1a.inc b/meta/conf/=
machine/include/arm/arch-armv9-1a.inc
new file mode 100644
index 000000000000..f9e6dce77c82
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv9-1a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-1a"
+
+TUNEVALID[armv9-1a] =3D "Enable instructions for ARMv9.1-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a'=
, ' -march=3Darmv9.1-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a',=
 'armv9-1a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-1a"
+ARMPKGARCH:tune-armv9-1a                    ?=3D "armv9-1a"
+TUNE_FEATURES:tune-armv9-1a                  =3D "aarch64 armv9-1a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-1a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-1a"
+BASE_LIB:tune-armv9-1a                       =3D "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv9-2a.inc b/meta/conf/=
machine/include/arm/arch-armv9-2a.inc
new file mode 100644
index 000000000000..4b5cf3ed156a
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv9-2a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-2a"
+
+TUNEVALID[armv9-2a] =3D "Enable instructions for ARMv9.2-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a'=
, ' -march=3Darmv9.2-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a',=
 'armv9-2a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-2a"
+ARMPKGARCH:tune-armv9-2a                    ?=3D "armv9-2a"
+TUNE_FEATURES:tune-armv9-2a                  =3D "aarch64 armv9-2a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-2a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-2a"
+BASE_LIB:tune-armv9-2a                       =3D "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv9-3a.inc b/meta/conf/=
machine/include/arm/arch-armv9-3a.inc
new file mode 100644
index 000000000000..c345f1532c48
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv9-3a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-3a"
+
+TUNEVALID[armv9-3a] =3D "Enable instructions for ARMv9.3-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a'=
, ' -march=3Darmv9.3-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a',=
 'armv9-3a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-3a"
+ARMPKGARCH:tune-armv9-3a                    ?=3D "armv9-3a"
+TUNE_FEATURES:tune-armv9-3a                  =3D "aarch64 armv9-3a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-3a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-3a"
+BASE_LIB:tune-armv9-3a                       =3D "lib64"
--=20
2.50.1 (Apple Git-155)


