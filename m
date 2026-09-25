Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD886C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:58:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6431.1790337533600428134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TpYo0KXW;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C16F169C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 04:58:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C2653F86F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790337532; bh=Gh/xXS/J2wU5IDnAlDOIsE3juI1qebqOjuS5Apo25SE=;
	h=From:To:Subject:Date:From;
	b=TpYo0KXWp/Ml1mdlRlXxenntN32JK9XMyI9qah48GsV393tLO3+OgGzyRtlvswrEU
	 zvEU+EI4fMjaq9WcX3uaiwwYKRQ8qbToU4b3clazK50o1EYD08oz59p6xpeQPTlcVq
	 E0fe9bCQyL+punQai2izRS85Grh3XYcS+JxfXDe0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcr: remove now-redundant gnome_verdir() replacement
Date: Fri, 25 Sep 2026 12:58:48 +0100
Message-ID: <20260925115848.1858665-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 11:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246616

This recipe was the first inheriting gnomebase to have a four-part
version, and worked around the broken logic in gnome_verdir() in the
recipe instead of fixing gnomebase.

Now that gnomebase has been fixed[1], this replacement is not needed.

[1] oe-core 6daf319364d ("classes/gnomebase: improve gnome_verdir() logic=
")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gcr/gcr_4.4.1.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.1.bb b/meta/recipes-gnome/gcr=
/gcr_4.4.1.bb
index 93028d2497d..f2f7e5633d0 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.1.bb
@@ -45,12 +45,3 @@ ssh-add =3D '${bindir}/ssh-add'
 ssh-agent =3D '${bindir}/ssh-agent'
 EOF
 }
-
-# gnome_verdir is coming from gnomebase.bbclass, which seems to work
-# with gcr as long as its version has 3 sections (x.y.z).
-# This version is 4.4.0.1 - add a custom version parser, otherwise the
-# original parser constructs invalid download URL.
-# It can be removed with the next update, when/if the version has only
-# 3 sections again.
-def gnome_verdir(v):
-    return ".".join(v.split(".")[:2]) or v
--=20
2.43.0


