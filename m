Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70746C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:48:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14150.1751032133765073720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C9F1A00
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCFB43F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/9] go-mod.bbclass: Calculate GO_MOD_CACHE_DIR relative to ${UNPACKDIR}
Date: Fri, 27 Jun 2025 14:48:42 +0100
Message-ID: <20250627134850.152269-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219413

From: Peter Kjellerstedt <pkj@axis.com>

Adapt to the recent move of S from ${WORKDIR} to ${UNPACKDIR}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/go-mod.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
index 93ae72235ff..a15dda8f0ee 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -23,7 +23,7 @@ GOBUILDFLAGS:append =3D " -modcacherw"
 inherit go
=20
 export GOMODCACHE =3D "${S}/pkg/mod"
-GO_MOD_CACHE_DIR =3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVa=
r('WORKDIR'))}"
+GO_MOD_CACHE_DIR =3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVa=
r('UNPACKDIR'))}"
 do_unpack[cleandirs] +=3D "${GOMODCACHE}"
=20
 GO_WORKDIR ?=3D "${GO_IMPORT}"
--=20
2.43.0


