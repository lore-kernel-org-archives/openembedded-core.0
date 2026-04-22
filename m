Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED27BFA1FED
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 19:44:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91263.1776887088063370306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 12:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fwTu+k8U;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC382F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 12:44:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D44AF3F23F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 12:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776887087; bh=An5nNDPNK5KiR1Z4oDxaEOZuwbxO7EA9WrGertazrxg=;
	h=From:To:Subject:Date:From;
	b=fwTu+k8UAg49qpINJBApkCjLqLbgId+jtqWaElANheqATSPj5Xcr7HCXTJmURF6i1
	 Jdenwp+r/rby1KBWpzcOdisHMegG9F3I6vR0m5XcPIOwIwHzg3lQzavm6N93loLP4k
	 6cRc9jAk5zYtdR9UPVIoi6xJtPRJtJ8p/B8UXMCo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: disable GTK+3 UI by default
Date: Wed, 22 Apr 2026 20:44:43 +0100
Message-ID: <20260422194443.1844401-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 19:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235736

Disable the GTK+ UI by default.  By having vim be always built with GTK+
by default installing vim results in the entire GTK+/X11 stack being
pulled into images, even if they would otherwise be non-graphical.

Also, real vim users run it in a terminal.

The PACKAGECONFIG remains and can be enabled. Maybe a future improvement
would be to split the recipe into non-X vim and GTK+-based gvim recipes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 6f9b31d868a..d6fdf457069 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -53,7 +53,7 @@ do_configure () {
=20
 PACKAGECONFIG ??=3D "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)}=
 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     nls \
 "
=20
--=20
2.43.0


