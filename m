Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570DFCFD655
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:14:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8112.1767798889679132263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Cv9MB6gQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2032C1EC94
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 15:14:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE862606F8
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 15:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70FED103C8747;
	Wed,  7 Jan 2026 16:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767798887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TIkEkeCWh/h4g9LJuapLbwLzS1f/5gPnbppM+ls+xRQ=;
	b=Cv9MB6gQaclnNdOzmffG+avutHe19rqhKgcJzLJczHrguPjUmed+UCKtDGj8WWICXLO0sU
	CX3xvLo3Fui9KaWnXQFhc2LAh6F8AZfQ52piNvFyVj9IMoSbJ0pRP0TV3Em+cclGikLt3b
	96j7uV+w2W+tBK15pKrS/kfGrhOuNDwDUWLV5MUgTx1UknowiQUoz5rAeStDYPtc2p0PjA
	ZjtrZmxcBzGv9kDnPKuri0t2OBtJNf1xNRoLzeT5xJJGXjZI4DNQaTeB7hgua1X/zbO2Zs
	varexeGdw5ag5G6IvHSKMQaiaswynMJv07pm5TDBfKj0/SNvTuRW+edHBg2R4A==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 2/2] linux-yocto: relocate KERNEL_FEATURES_RISCV
Date: Wed,  7 Jan 2026 16:14:36 +0100
Message-ID: <20260107151436.964819-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
References: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229006

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

Move KERNEL_FEATURES_RISCV - along with the appends - to a new file:
linux-yocto-features.inc.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb     |  1 +
 .../linux/linux-yocto-features.inc               | 15 +++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb |  1 +
 .../linux/linux-yocto-tiny_6.12.bb               |  1 +
 .../linux/linux-yocto-tiny_6.16.bb               |  1 +
 .../linux/linux-yocto-tiny_6.18.bb               |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc        | 16 ----------------
 meta/recipes-kernel/linux/linux-yocto_6.12.bb    |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.16.bb    |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb    |  1 +
 12 files changed, 25 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-features.inc

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
index fb4e0864d2..a2e5b8308b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -10,6 +10,7 @@
=20
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-features.inc b/meta/re=
cipes-kernel/linux/linux-yocto-features.inc
new file mode 100644
index 0000000000..300add606b
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-features.inc
@@ -0,0 +1,15 @@
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_6.12.bb
index 9ac8507f9f..7dcf15a265 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -1,6 +1,7 @@
 KBRANCH ?=3D "v6.12/standard/preempt-rt/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_6.16.bb
index 1230e4e805..79ea0c5492 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -1,6 +1,7 @@
 KBRANCH ?=3D "v6.16/standard/preempt-rt/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_6.18.bb
index 32ed29f25e..ad6fa16bd3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -1,6 +1,7 @@
 KBRANCH ?=3D "v6.18/standard/preempt-rt/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 940561352c..d401934e97 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -4,6 +4,7 @@ LINUX_KERNEL_TYPE =3D "tiny"
 KCONFIG_MODE =3D "--allnoconfig"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ffa15b0c1b..4ab250bf70 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -4,6 +4,7 @@ LINUX_KERNEL_TYPE =3D "tiny"
 KCONFIG_MODE =3D "--allnoconfig"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 2afdc02467..661aad0a95 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -4,6 +4,7 @@ LINUX_KERNEL_TYPE =3D "tiny"
 KCONFIG_MODE =3D "--allnoconfig"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
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
index 84419f8c78..07b9084c05 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -1,6 +1,7 @@
 KBRANCH ?=3D "v6.12/standard/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..b823e13e8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -1,6 +1,7 @@
 KBRANCH ?=3D "v6.16/standard/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.18.bb
index 562a997020..e82edc27c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -1,6 +1,7 @@
 KBRANCH ?=3D "v6.18/standard/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
+require recipes-kernel/linux/linux-yocto-features.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion.inc
--=20
2.47.0


