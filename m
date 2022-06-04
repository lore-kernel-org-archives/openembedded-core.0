Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3307DCCA47E
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:40:28 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web08.7419.1654321225453560631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id BB2AA6401
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:40:22 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd80.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMWE-3SU9A30; Sat, 4 Jun 2022 07:40:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3 3/6] xdg-utils: allow to build for wayland
Date: Sat,  4 Jun 2022 07:39:56 +0200
Message-Id: <20220604053959.4810-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220604053959.4810-1-f_l_k@t-online.de>
References: <20220604053959.4810-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654321214-0143B811-16CA34EC/0/0 CLEAN NORMAL
X-TOI-MSGID: edc28c56-7fa9-43fe-9239-fe9380a6b669
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:40:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166542

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/re=
cipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 73acf6b744..ef698d9f09 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -31,8 +31,9 @@ UPSTREAM_CHECK_REGEX =3D "xdg-utils-(?P<pver>((\d+[\.\-=
_]*)+)((rc|alpha|beta)\d+)?
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep features_check
=20
-# The xprop requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
=20
 DEPENDS =3D "xmlto-native libxslt-native"
-RDEPENDS:${PN} +=3D "xprop"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[x11] =3D ",,,xprop"
--=20
2.25.1


