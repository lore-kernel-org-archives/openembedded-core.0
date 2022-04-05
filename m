Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD9AC43219
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.4378.1649153615647035200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=WMRHUhC+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-207-026-040.002.207.pools.vodafone-ip.de
 [2.207.26.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CC2BB83AEF;
	Tue,  5 Apr 2022 12:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1649153612;
	bh=zwNMsBgz1kkcmz7awv0j/xjKObcJdCgZ8mZYHeuHPwc=;
	h=From:To:Cc:Subject:Date:From;
	b=WMRHUhC+2L1duVTdzv19fIs0g7joMKI/493vNeq4bohQaWHpIkTKSyVL7bzfMSfjD
	 MhW3/2SDidQwUllXRLDLwQGoQmccQTwi4YQYqoTzTsJsGacw26uTcF1tVO3Rr34Epp
	 qERQGFYiEn0tAI+BFjELV6C5dNCImAfoRs8M8ywcAuY6ElcOZhgsziqVSIZ109vJoX
	 d2EqMDwOo5xP2ZNyH3Ed68ojX5O5sTyMZrJSuYpn0DzcxLFBm9zanlnJ2Lxl3iPWVN
	 3LE+zltMGHt2JIXQyd/+hNRd3nsMPaBaONSXUOJQav9vSnP2MgqeqaR5JEjhrHqgGh
	 dEDiXDr69sJfw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Claudius Heine <ch@denx.de>
Subject: [PATCH] os-release: add os-release-initrd package
Date: Tue,  5 Apr 2022 12:13:26 +0200
Message-Id: <20220405101326.7356-1-ch@denx.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164015

When systemd is used inside an initramfs, it uses the presence of
`/etc/initrd-release` to detect when the system is in the initrd phase.
Otherwise `/etc/initrd-release` has the same format as
`/etc/os-release`.

Add `os-release-initrd` package to provide `/etc/initrd-release` as a
symlink to the os-release file. To avoid adding this file to the
`os-release` package, explicitly only add `/etc/os-release` to the
`os-release` package.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/recipes-core/os-release/os-release.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
index 637d059e8b..caa2ed25aa 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -50,6 +50,11 @@ do_install () {
     install -d ${D}${nonarch_libdir} ${D}${sysconfdir}
     install -m 0644 os-release ${D}${nonarch_libdir}/
     ln -rs ${D}${nonarch_libdir}/os-release ${D}${sysconfdir}/os-release
+    ln -rs ${D}${nonarch_libdir}/os-release ${D}${sysconfdir}/initrd-rel=
ease
 }
=20
-FILES:${PN} +=3D "${nonarch_libdir}/os-release"
+FILES:${PN} =3D "${sysconfdir}/os-release ${nonarch_libdir}/os-release"
+
+PACKAGES +=3D "${PN}-initrd"
+FILES:${PN}-initrd =3D "${sysconfdir}/initrd-release"
+RDEPENDS:${PN}-initrd +=3D "${PN}"
--=20
2.33.1


