Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05478C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 18:42:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1399.1652467326220891378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 11:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18CB3113E;
	Fri, 13 May 2022 11:42:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93B953F73D;
	Fri, 13 May 2022 11:42:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] kernel-yocto.bbclass: say what SRC_URI entry is being dropped
Date: Fri, 13 May 2022 19:42:01 +0100
Message-Id: <20220513184201.2517163-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 18:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165586

If there is a defconfig set by KBUILD_DEFCONFIG and something that looks
like a defconfig in SRC_URI, the SRC_URI is dropped. This happens even
if the entry in SRC_URI is called my_defconfig_frag.cfg.

Arguably, this is a bug and the behaviour should be changed, but for now
if we're going to remove entries from SRC_URI we should make it clear
what entry is being removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
index fb30c7cc055..b276ded7751 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -192,7 +192,7 @@ do_kernel_metadata() {
 	if [ -n "$in_tree_defconfig" ]; then
 		sccs_defconfig=3D$in_tree_defconfig
 		if [ -n "$src_uri_defconfig" ]; then
-			bbwarn "[NOTE]: defconfig was supplied both via KBUILD_DEFCONFIG and =
SRC_URI. Dropping SRC_URI defconfig"
+			bbwarn "[NOTE]: defconfig was supplied both via KBUILD_DEFCONFIG and =
SRC_URI. Dropping SRC_URI entry $src_uri_defconfig"
 		fi
 	else
 		# if we didn't have an in-tree one, make our defconfig the one
--=20
2.25.1


