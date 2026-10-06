Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D84CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 21:43:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.261.1791322978396544261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 14:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D1F540C85;
	Tue,  6 Oct 2026 21:42:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMbFnCK0mzVG; Tue,  6 Oct 2026 21:42:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 11E1A406B9;
	Tue,  6 Oct 2026 21:42:55 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 31A6C17E34E;
	Tue,  6 Oct 2026 17:42:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] Revert "tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF"
Date: Tue,  6 Oct 2026 17:42:54 -0400
Message-Id: <20261006214254.1556824-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 21:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247356

From: Denys Dmytriyenko <denys@konsulko.com>

While this change has good intentions, unfortunaly, it completely
breaks baremetal setup (at least for ARM arch).

The line this change removes seems to mask an underlying issue,
but until that issue is fully understood and resolved, let's
revert it and restore the working baremetal behavior.

For more details please see the following discussion:
https://lists.openembedded.org/g/openembedded-core/topic/121486589

This reverts commit 020d5f018616bc48eae3a23d5498dec3c78a1386.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/di=
stro/include/tclibc-baremetal.inc
index 6043cb6654..abea5a7162 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -18,6 +18,7 @@ USE_NLS ?=3D "no"
 IMAGE_LINGUAS =3D ""
 LIBC_DEPENDENCIES =3D ""
=20
+EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-headers"
 DEPENDS:remove:pn-meta-toolchain =3D "virtual/libc virtual/compilerlibs"
=20
 # certain compiler libs cannot be used without libc, avoid the dependenc=
e on compilerlibs
--=20
2.25.1


