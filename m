Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667EE108B919
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11415.1774009660588781904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4A8165C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D368C3F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] pkgconf: minimise wrapper
Date: Fri, 20 Mar 2026 12:27:28 +0000
Message-ID: <20260320122732.1630715-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233602

There's no need to look at the passed arguments and unset variables, we
want fdo's pkgconfig behaviour when called from the pkg-config wrapper
and this can be done by exporting PKG_CONFIG_FDO_SYSROOT_RULES.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/pkgconf/pkg-config-wrapper          | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper b/m=
eta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
index 695f349566d..89081672abd 100755
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
@@ -1,16 +1,7 @@
-#!/bin/sh
-# pkgconf wrapper to deal with pkg-config/pkgconf compatibility issues
-#
-# Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)
+#! /bin/sh
=20
-for arg; do
-    case "$arg" in
-        --variable|--variable=3D*)
-            # pkg-config doesn't sysroot-prefix user variables
-            unset PKG_CONFIG_SYSROOT_DIR
-            ;;
-    esac
-done
+# Tell pkgconf to use pkgconfig behaviour when dealing with the sysroot =
to ease
+# migration.
+export PKG_CONFIG_FDO_SYSROOT_RULES=3D"1"
=20
 exec pkgconf "$@"
--=20
2.43.0


