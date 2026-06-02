Return-Path: <rl@karo-electronics.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C066CD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:22:17 +0000 (UTC)
Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26827.1780410130226350530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@karo-electronics.de header.s=kas202603021246 header.b=IR6rcdXg;
 spf=pass (domain: karo-electronics.de, ip: 85.13.167.58, mailfrom: rl@karo-electronics.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1780410116;
	bh=CfpzyDVrJCAkguXSY1Qw3RXRjbfz6IZrV93lKew+J40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=IR6rcdXg9SqFfzv1UCCeJa416jmqwkO7vfam4aQIyGzygkS5Pbs/rBe2hUT4Gho0v
	 fxOU2KkjjtqojO1N/GBr4byqtTtFfWvI8LHyhAhSOlgTibG3TGQe0BXtjmn2v9/AIL
	 e9InRnw4Sx/YDN9l2WvF48XhwafqQreHBLbKOws58NcMqn9VR3QNnCtBS9TNMKDuOF
	 xlYWWA2Mg03oRg5xEWIjGDy+pACSLN+AowaC/3nC1kLjB+oD6cQLgOXK9hn5r9Zj1+
	 5hEA8hvoP06KdxzNm6M75OMX+on56V2FwKwJexQUhiViSVD3HrBgC2/6sFo2L+Dow7
	 VplVU+K5Q37NA==
Received: from robin-MS-7E12.ka-ro.local (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 42FDC7722483;
	Tue,  2 Jun 2026 16:21:56 +0200 (CEST)
From: Robin Lintermann <rl@karo-electronics.de>
To: openembedded-core@lists.openembedded.org
Cc: Robin Lintermann <rl@karo-electronics.de>
Subject: [scarthgap][PATCH 2/5] busybox: add a DEPENDS on libpam when pam is selected in DISTRO_FEATURES
Date: Tue,  2 Jun 2026 16:21:29 +0200
Message-ID: <20260602142132.976138-2-rl@karo-electronics.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602142132.976138-1-rl@karo-electronics.de>
References: <20260602142132.976138-1-rl@karo-electronics.de>
MIME-Version: 1.0
X-Spamd-Bar: --
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238052

When 'pam' is in DISTRO_FEATURES and CONFIG_PAM is selected in busybox
the target-libpam is required to be installed before busybox can be
built. Add a build-time dependency for busybox on libpam to guarantee
this.
If CONFIG_PAM is not selected in busybox's .config, this dependency
would rather be unnecessary, but it doesn't hurt to have it anyhow.

Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
index f5d7c3f9c8..d5ab9eff6d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -4,6 +4,7 @@ HOMEPAGE =3D "https://www.busybox.net"
 BUGTRACKER =3D "https://bugs.busybox.net/"
=20
 DEPENDS +=3D "kern-tools-native virtual/crypt"
+DEPENDS +=3D "${@ bb.utils.contains('DISTRO_FEATURES','pam','libpam','',=
d)}"
=20
 # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 sourc=
e
 # the GPL is version 2 only
--=20
2.43.0


