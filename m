Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FA7CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 11:44:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52543.1780919062878508786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 04:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=eCzKv/1U;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C2BD2381
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Jun 2026 04:44:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7F903F86F
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Jun 2026 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780919062; bh=YOgKe4HWUiiC2ZYQm/24W+ItPHGH8sINGlWZFpf0Lr8=;
	h=From:To:Subject:Date:From;
	b=eCzKv/1Ux3IALFF1GCmnFpOgSLIw8cLUIP8b5TXy7XdltbXFOHh5cbl3hnNmmZwMk
	 7zClpPUa9u4BydLgTfyrxGUZ2T0SNeCqqYVHK2ct2ZoMLK/4kwkty1JnY1UTl9UjhQ
	 jvVTLb6mX/4s1aXz1sr7IiTP01NHS5KCc0ZlBfWE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/recipeutils: make stable_upgrade argument optional in get_recipe_upstream_version()
Date: Mon,  8 Jun 2026 12:44:18 +0100
Message-ID: <20260608114418.1677413-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 11:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238231

The change[1] that added the stable_upgrade argument made it optional
for the high-level get_recipe_upgrade_status() function, but not
get_recipe_upstream_version().

This function is exposed API so be kind to users and also make it an
optional argument there.

[1] oe-core 1ed8fdda035 ("recipeutils: add optional stable_upgrade parame=
ter to get_recipe_upgrade_status")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 7c1df518a8d..64bf2f950f8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
=20
     return (pv, pfx, sfx)
=20
-def get_recipe_upstream_version(rd, stable_upgrade):
+def get_recipe_upstream_version(rd, stable_upgrade=3DFalse):
     """
         Get upstream version of recipe using bb.fetch2 methods with supp=
ort for
         http, https, ftp and git.
--=20
2.43.0


