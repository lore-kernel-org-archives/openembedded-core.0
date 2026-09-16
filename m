Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5918C88E7F
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 19:31:06 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23442.1789587059636017671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 12:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=VUG6DOZx;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout08.t-online.de (Postfix) with SMTP id 821F3E221
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 21:30:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6vLL-0B29gG0; Wed, 16 Sep 2026 21:30:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] kernel-module-split: don't re-sign compressed kernel modules
Date: Wed, 16 Sep 2026 21:30:51 +0200
Message-ID: <20260916193051.56418-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789587056-F5FF89A7-1450DDB2/0/0 CLEAN NORMAL
X-TOI-MSGID: dfd00923-3b50-46a1-9ac7-9764d9a13636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789587057; i=f_l_k@t-online.de;
	bh=S0YMkyOpnlWy1RN2aRoAG9H2oFDbOOgvQoOYUelurx0=;
	h=From:To:Subject:Date;
	b=VUG6DOZxReqNxV2fGSyWEZ8uwf+QUEY61577Qc8njo4gjq5mW/D4zKXiESxtu0sHV
	 vSnJREXfduBHrYKeNzW+372YhCdb+88ffAkvzlBPZpiw6SKDcoqyrIuMrHQpOrM1bf
	 HCCMU7rGPGCFkbjEhLjcBtiwAO8l9HQyCBukFtvKFsTmKXag6MvNHR6b/RLQF7t/Ke
	 ramDv8c6ZOuDS7f40DeAE5riPkCWq6hLviogYH1AgpGsdWrqCeWbWqaECbPcY+EkK2
	 PPU/vfqQqSLmwzKZcfPXQkaebx2BBI+vcJZNBWZyhgRD1632MJF1fqbY6yz7lM/+zS
	 Tv+csAhveJbtw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 19:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245995

With CONFIG_MODULE_COMPRESS_ALL the kernel installs modules with a
compression suffix, and scripts/Makefile.modinst derives the compressed
file from the signed uncompressed one, which is removed afterwards.
The modules_sign target then has nothing to sign below ${PKGD} and
do_package fails in sign-file with an openssl "no such file" error.

Re-signing is not needed there either: compressed modules are not ELF
files, so package stripping leaves them alone and the signature made
during modules_install is still valid.

Found on a raspberrypi4-64 kernel, which enables both MODULE_SIG_ALL
and MODULE_COMPRESS_XZ. Tested by building linux-raspberrypi through
do_package, which now packages 1861 signed .ko.xz modules.

AI-Generated: Uses Claude Code
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/kernel-module-split.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
index 99c2d12962..9a7f04f37b 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -53,8 +53,15 @@ post_strip_kernel_modules_signing(){
     is_modules=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD=
_OUTPUT}/.config --state MODULES)"
     is_module_sig=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBU=
ILD_OUTPUT}/.config --state MODULE_SIG)"
     is_module_sig_all=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file $=
{KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
-
-    if [ "$is_modules" =3D "y" ] && [ "$is_module_sig" =3D "y" ] && [ "$=
is_module_sig_all" =3D "y" ]; then
+    is_module_compress_all=3D"$(${STAGING_KERNEL_DIR}/scripts/config --f=
ile ${KBUILD_OUTPUT}/.config --state MODULE_COMPRESS_ALL)"
+
+    # Compressed modules are not ELF files, so package stripping leaves =
them
+    # untouched and the signature made during modules_install is still v=
alid.
+    # Re-signing them is not only unnecessary but fails: with
+    # CONFIG_MODULE_COMPRESS_ALL the install targets carry the compressi=
on
+    # suffix, and the uncompressed module their rule depends on does not
+    # exist below ${PKGD}.
+    if [ "$is_modules" =3D "y" ] && [ "$is_module_sig" =3D "y" ] && [ "$=
is_module_sig_all" =3D "y" ] && [ "$is_module_compress_all" !=3D "y" ]; t=
hen
         # Sign modules under ${PKGD}, with M=3D if out-of-tree module.
         # Out-of-tree module Makefiles invoke the kernel Makefile by app=
ending M=3D (the module directory) to MAKEFLAGS.
         # However, they usually do not provide a modules_sign target. Th=
erefore, the kernel modules_sign target has to
--=20
2.55.0


