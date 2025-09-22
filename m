Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A25CA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:20:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58439.1758561636238087309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 10:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 504BD1424
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 10:20:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 295643F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 10:20:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] vte: skip gobject-introspection with clang on armv7
Date: Mon, 22 Sep 2025 18:20:22 +0100
Message-ID: <20250922172025.184116-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223833

For some as yet unknown reason, vte on armv7 (specifically, the qemuarm
and beaglebone-yocto machines at least) will fail during G-I code
generation (which runs the target binaries inside qemu-user):

    Bail out! VTE:ERROR:../sources/vte-0.80.3/src/vtegtk.cc:158:void
    style_provider_parsing_error_cb(GtkCssProvider *, void *, GError *):
    assertion failed (error =3D=3D NULL): Expected an identifier (gtk-css=
-parser-error-quark, 1)

    qemu: uncaught target signal 6 (Aborted) - core dumped

Until this can be root-caused, we can disable G-I for this edge case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vte/vte_0.80.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/vte/vte_0.80.3.bb b/meta/recipes-suppor=
t/vte/vte_0.80.3.bb
index 1eb95dd8274..17c4eb6c7e0 100644
--- a/meta/recipes-support/vte/vte_0.80.3.bb
+++ b/meta/recipes-support/vte/vte_0.80.3.bb
@@ -55,3 +55,8 @@ FILES:${PN}-prompt =3D " \
 "
=20
 FILES:${PN}-dev +=3D "${datadir}/glade/"
+
+# Causes failures at build time on eg qemuarm;
+# Bail out! VTE:ERROR:../sources/vte-0.80.3/src/vtegtk.cc:158:void style=
_provider_parsing_error_cb(GtkCssProvider *, void *, GError *): assertion=
 failed (error =3D=3D NULL): Expected an identifier (gtk-css-parser-error=
-quark, 1)
+# qemu: uncaught target signal 6 (Aborted) - core dumped
+GI_DATA_ENABLED:toolchain-clang:armv7ve =3D "False"
--=20
2.43.0


