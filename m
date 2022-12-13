Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D84C25B04
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 16:14:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77684.1670948050374537846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 08:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48A512F4;
	Tue, 13 Dec 2022 08:14:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FD3B3F71E;
	Tue, 13 Dec 2022 08:14:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] meson: no need to rebuild on install
Date: Tue, 13 Dec 2022 16:14:07 +0000
Message-Id: <20221213161407.864859-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 16:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174539

On install, Meson will rebuild targets which don't define their
dependencies, as it can't know if they need to be rebuilt or not.

This includes gtk-doc, which can be slow to run.  As we control the
execution of meson we know that a rebuild isn't required, so we can pass
--no-rebuild and speed up the install task.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 1014bd058ea..3cc94c7584f 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -173,7 +173,7 @@ meson_do_compile() {
 }
=20
 meson_do_install() {
-    meson install --destdir ${D}
+    meson install --destdir ${D} --no-rebuild
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.34.1


