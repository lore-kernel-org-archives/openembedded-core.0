Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC7CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 14:51:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.35778.1757947900947012035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 07:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47B611424
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 07:51:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BF8E3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 07:51:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] classes/cmake: don't put RPATHs to the build tree in binaries
Date: Mon, 15 Sep 2025 15:51:34 +0100
Message-ID: <20250915145134.192581-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223492

By default, CMake will compile binaries with an RPATH pointing at the
build path, and then on install will "relink" the binaries with an
RPATH pointing to the install path.

However, when CMake says "relink" it actually means "edit if possible",
using an internal copy of chrpath. This introduces non-determinism in
several ways:
- The build path is used to generate the build-id. We've worked around
  this previously by ensuring that RPATHs are relative to the binary[1].
- Not all upstreams respect this option, so some recipes need extra
  tweaking to stop them injecting absolute build-time RPATHs[2]
- Whilst the final RPATH may be empty, using chrpath is _not_ relinking
  so different length build paths can result in binaries with different
  amounts of now-redundant padding. These binaries are non-reproducible.

Instead of using relative build-time RPATHs and then dealing with other
issues one by one, we can just tell CMake to not use built-time RPATHs
at all. We don't execute binaries directly from the build tree, so they
don't serve any purpose and are just a source of non-determinism.

[1] oe-core 44e77d3f97a ("classes/cmake: Use relative RPATHs")
[2] oe-core d96e0458b69 ("lldb: don't build rpaths into binaries")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cmake.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
index 1488d744d40..18c26c196fa 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -163,10 +163,12 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
=20
 # We need to set the rpath to the correct directory as cmake does not pr=
ovide any
 # directory as rpath by default
+
 set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
=20
-# Use RPATHs relative to build directory for reproducibility
-set( CMAKE_BUILD_RPATH_USE_ORIGIN ON )
+# Don't build build RPATHS into the binaries, they're a source of non-de=
terminism
+# even when stripped out of the installed files
+set (CMAKE_SKIP_BUILD_RPATH ON)
=20
 # Use our cmake modules
 list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
--=20
2.43.0


