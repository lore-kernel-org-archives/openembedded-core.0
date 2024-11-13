Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BCCD462D0
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14818.1731513318602077058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 07:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0FA1474
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAC133F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/8] matchbox-terminal: add x-terminal-emulator RPROVIDES and alternative
Date: Wed, 13 Nov 2024 15:55:06 +0000
Message-Id: <20241113155511.1948551-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113155511.1948551-1-ross.burton@arm.com>
References: <20241113155511.1948551-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207115

Add a RPROVIDES for virtual-x-terminal-emulator, so that:
- Packages can RDEPEND on virtual-x-terminal-emulator and know that they
  have installed a terminal
- The x-terminal-emulator binary will (via alternatives) run a terminal

We don't bother with PROVIDES because nobody needs to DEPEND on a termina=
l,
the entire point of this is that the actual binary is interchangable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../matchbox-terminal/matchbox-terminal_0.2.bb             | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb=
 b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index f91c593f784..c9b01b3cfd9 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -16,6 +16,11 @@ PV =3D "0.2+git"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig features_check
+inherit autotools pkgconfig features_check update-alternatives
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+RPROVIDES:${PN} =3D "virtual-x-terminal-emulator"
+ALTERNATIVE:${PN} =3D "x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] =3D "${bindir}/matchbox-terminal=
"
+ALTERNATIVE_PRIORITY[x-terminal-emulator] =3D "20"
--=20
2.34.1


