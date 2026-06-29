Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1335C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:16:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38497.1782742565834343997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sumKoHwr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9CBD16A3
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:16:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 002A53F905
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782742565; bh=2H8fTXrunmek2i3KsRlWY3t387lSA6GNZnTNb4ES240=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sumKoHwrV2P5LRJaJbonM1bKirIgYsYbnX/BfJaD7HC0siY2p30q/nJfGHghiqRom
	 kwtjYK5HFXCBFSoddITVK3Y1swBoba7tXybMgW/RT34k66oP+E+HFkJPHpHElwyyFL
	 VCyvUJEeT8a1V0x4b3ZIUb/vsaWWt3OI3JTTYhmo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] systemd-systemctl-native: remove systemd-sysv-install logic
Date: Mon, 29 Jun 2026 15:15:59 +0100
Message-ID: <20260629141559.1305873-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629141559.1305873-1-ross.burton@arm.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239787

The use of systemd-sysv-install was removed before Wrynose[1], so we do
not need to install it in systemd-systemctl-native.

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility=
")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemd/systemd-systemctl-native_259.5.bb            | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb =
b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
index 351f78d173c..bf9c9f47763 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
@@ -17,12 +17,3 @@ EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=
=3D"
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#=
issuecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
-
-do_install:append() {
-	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
-	# (where it is normally installed) so systemctl can find it in $PATH.
-	# It is expected that the use of systemd-sysv-install will be removed
-	# with version 259 of systemd and then this, and everything that was
-	# added along with it, should be reverted.
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}$=
{bindir}/systemd-sysv-install
-}
--=20
2.43.0


