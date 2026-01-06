Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AC0CD0423
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 14:37:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91155.1767710262425021824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 06:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=AN9qJpBW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0E954E41F9A
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 14:37:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A23C960739
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 14:37:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 172C8103C81A4;
	Tue,  6 Jan 2026 15:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767710260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KwWJr2izNcrbebsoBwNCzEgTIQgm51Qi+1m8+vSGgQ8=;
	b=AN9qJpBWaZnIVE/2NJ03EZCqDutCf9cKYFrgWBikoUDxBft33vUXrNsdBQVd0YMh8ycLNm
	UlWN8wGkCHNCtzDfuGUMEOgJozLEHOcoh+HUb2p7FV3GtkcOAQkYQdHDlT896l1PU/n9PX
	5WRpF03dIlGX+5sGWA5/jYhdeWtdfUdv+RdY45DO2L82E6dvAwcPodRf12odab8X6hcu+F
	SMBN5yppcQMjLYaPvDltca36z3DSsrNkaKB6REDeotR/38RE+Fpjkfln2FuY/pmm06IZiQ
	dWDWPdIGTtkMI81kxZkmgH5KIF7KsB8XxSEaT0iwNnTHEdm2H7ZBvk6e5HHm9w==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/2] linux-yocto/6.12: riscv: relocate KERNEL_FEATURES_RISCV into recipe
Date: Tue,  6 Jan 2026 15:37:12 +0100
Message-ID: <20260106143712.843971-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260106143712.843971-1-joaomarcos.costa@bootlin.com>
References: <20260106143712.843971-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228891

In a custom linux recipe that requires linux-yocto.inc, the metadata
files (*.scc) end up in KERNEL_FEATURES. However, the custom recipe's
FILESPATH does not contain the path to oe-core's linux-yocto directory
(as expected), which leads to the error below:

ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
Feature 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cause=
 configuration failures.
ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
Check the SRC_URI for meta-data repositories or directories that may be m=
issing

Move KERNEL_FEATURES_RISCV - along with the appends - out of the common
definitions.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc     | 16 ----------------
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
index 4d0a726bb6..389329030d 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -37,22 +37,6 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MAC=
HINE_FEATURES', 'efi', 'cfg/
 KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'n=
uma', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'v=
fat', 'cfg/fs/vfat.scc', '', d)}"
=20
-KERNEL_FEATURES_RISCV =3D "\
-    arch/riscv/tunes/riscv-isa-clear.scc \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv=
/tunes/riscv-isa-rv32i.scc',  '', d)} \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv=
/tunes/riscv-isa-rv64i.scc',  '', d)} \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv=
/tunes/riscv-isa-fpu.scc',    '', d)} \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv=
/tunes/riscv-isa-c.scc',      '', d)} \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv=
/tunes/riscv-isa-v.scc',      '', d)} \
-    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv=
/tunes/riscv-isa-zba.scc',    '', d)} \
-    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv=
/tunes/riscv-isa-zbb.scc',    '', d)} \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv=
/tunes/riscv-isa-zbc.scc',    '', d)} \
-    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv=
/tunes/riscv-isa-zicbom.scc', '', d)} \
-    "
-
-KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
-KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
-
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.12.bb
index 84419f8c78..22fa4ba5e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -76,4 +76,20 @@ KERNEL_FEATURES:append:powerpc64le =3D " arch/powerpc/=
powerpc-debug.scc"
 # ERROR: modpost: __ex_table+0x17a4 references non-executable section '.=
debug_loclists'
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
+KERNEL_FEATURES_RISCV =3D "\
+    arch/riscv/tunes/riscv-isa-clear.scc \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv=
/tunes/riscv-isa-rv32i.scc',  '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv=
/tunes/riscv-isa-rv64i.scc',  '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv=
/tunes/riscv-isa-fpu.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv=
/tunes/riscv-isa-c.scc',      '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv=
/tunes/riscv-isa-v.scc',      '', d)} \
+    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv=
/tunes/riscv-isa-zba.scc',    '', d)} \
+    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv=
/tunes/riscv-isa-zbb.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv=
/tunes/riscv-isa-zbc.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv=
/tunes/riscv-isa-zicbom.scc', '', d)} \
+    "
+
+KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
+KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
+
 INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
--=20
2.47.0


