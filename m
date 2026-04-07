Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D530BFF5123
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:23:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85448.1775579019702243968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XMKsW0zF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48A8A16F3
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 09:23:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7B523F641
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775579019; bh=V9hOQO4i0q0B7FzHj8rdG0BLIcTd+03KtKvxPuk19eA=;
	h=From:To:Subject:Date:From;
	b=XMKsW0zFkr2J5vqK4A7EHO0b2fZGBIk1p8vwGYF672eiwHAXlWRgV/AjDXLrTtNpG
	 PjZtRrrA0U9WoCg7XGkioVxlwFEwdlzgJj5ZSB5aOGzEY8Rqr1poQw/nwwAZMiM/lE
	 HIzQ0g05/0B+T8j0HkO/Gqvo8KIFaMx3MO36ETM4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] busybox: fix DISTRO_FEATURES detection
Date: Tue,  7 Apr 2026 17:23:37 +0100
Message-ID: <20260407162337.1227714-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234774

Changes to how DISTRO_FEATURES is evaluated meant that busybox was using
a partial DISTRO_FEATURES and thus disabling features it should not be.
This is due to the use of immediate assignments which are evaulated
before the final value is calculated (by anonymous Python in base.bbclass=
).

Remove entirely DO_IPv4/DO_IPv6 as they're used once, replacing with
inline bb.utils.contains_any().

Remove the immediate assignments to OE_FEATURES/OE_DEL so that they are
evaluated on use. The evaluation is expensive, but it only happens once.

[1] oe-core 159148f4de ("meta: Support opting out of any distro features"=
)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/busybox/busybox.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
index 355c019738..916ad11f80 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -101,10 +101,8 @@ def features_to_busybox_del(d):
=20
 configmangle =3D '/CONFIG_EXTRA_CFLAGS/d; \
 		'
-OE_FEATURES :=3D "${@features_to_busybox_conf(d)}"
-OE_DEL      :=3D "${@features_to_busybox_del(d)}"
-DO_IPv4 :=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}"
-DO_IPv6 :=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}"
+OE_FEATURES =3D "${@features_to_busybox_conf(d)}"
+OE_DEL      =3D "${@features_to_busybox_del(d)}"
=20
 python () {
   if "${OE_DEL}":
@@ -129,7 +127,8 @@ do_prepare_config () {
 	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
 		${S}/.config
 	sed -i -e '${configmangle}' ${S}/.config
-	if test ${DO_IPv4} -eq 0 && test ${DO_IPv6} -eq 0; then
+
+	if ! ${@bb.utils.contains_any('DISTRO_FEATURES', 'ipv4 ipv6', 'true', '=
false', d)}; then
 		# disable networking applets
 		mv ${S}/.config ${S}/.config.oe-tmp
 		awk 'BEGIN{net=3D0}
--=20
2.47.1


