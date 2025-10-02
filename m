Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189F4CAC5BB
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:08:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.889.1759363697264243076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5354A40CC1;
	Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eX6TsM0jGSLn; Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1CDA840C8C;
	Thu,  2 Oct 2025 00:08:15 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 43DCB16401A;
	Wed,  1 Oct 2025 20:08:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC PATCH 3/5] musl: set compatibility a bit more flexible
Date: Wed,  1 Oct 2025 20:08:08 -0400
Message-Id: <20251002000810.226673-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251002000810.226673-1-denis@denix.org>
References: <20251002000810.226673-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224333

From: Denys Dmytriyenko <denys@konsulko.com>

Like musl Linux config, baremetal also uses musl as a libc, but
it has a different host triplet set. Hence adjust COMPATIBLE_HOST
to accomodate this use case by checking that musl is a preferred
provider of libc.

[YOCTO #15982]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-core/musl/bsd-headers.bb      | 2 +-
 meta/recipes-core/musl/libssp-nonshared.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/mu=
sl/bsd-headers.bb
index ad9ba81e4f..c6a3814a49 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -25,7 +25,7 @@ do_install() {
 #
 # We will skip parsing for non-musl systems
 #
+COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual=
/libc', 'musl', '.*', 'null', d)}"
=20
-COMPATIBLE_HOST =3D ".*-musl.*"
 DEV_PKG_DEPENDENCY =3D ""
 RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-co=
re/musl/libssp-nonshared.bb
index 4bcbaef7ea..6f12ff0c9b 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -29,7 +29,8 @@ do_install() {
 #
 # We will skip parsing for non-musl systems
 #
-COMPATIBLE_HOST =3D ".*-musl.*"
+COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual=
/libc', 'musl', '.*', 'null', d)}"
+
 RDEPENDS:${PN}-staticdev =3D ""
 DEV_PKG_DEPENDENCY =3D ""
 RRECOMMENDS:${PN}-dbg =3D "${PN}-staticdev (=3D ${EXTENDPKGV})"
--=20
2.25.1


