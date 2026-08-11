Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CCCC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:51:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57566.1786463449771111817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 08:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Z+HIG8vQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E1101516
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:50:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6CD83F632
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786463449; bh=1JUdG8/C8zLBaXKu0y5nwHbiYFtzj0fCEYOz6WjbFFM=;
	h=From:To:Subject:Date:From;
	b=Z+HIG8vQ5vua/Ld4vBIlPneyqmjHITFPsQm7N76O1vmbkWK27w3jaPSnjSC6d2KYi
	 cPXNr3lDfWGNmM65W0BBUum0XTrS+PSAQ1JGhesYj1Ya48Pna8h6CYJzquQUokB79u
	 AtnfVl1KykrVjyL9V4wICGz2HBfj/9K7gAviK7So=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade 1.11.2 -> 1.12.0
Date: Tue, 11 Aug 2026 16:50:44 +0100
Message-ID: <20260811155044.171171-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 15:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243215

Upstream release notes:

- Custom dependency for atomic now works on MSVC
- Support for CACHEDIR.TAG specification
- New clippy-json Ninja Target For rust-analyzer
- Add a new default() function and object
- Delay install script errors to install time
- find_program() now respects --force-fallback-for
- fs.copyfile() now has a build_subdir argument
- Added depends kwarg to generator.process()
- Added msgfmt_args arg to i18n.gettext()
- include_directories object now has a to_list() method
- Added integer base conversions to str.to_int() and int.to_string()
- Multiple positional arguments for meson wrap install
- meson format allows --recursive with --check-diff
- New --subprojects option for meson format
- OpenHarmony (OHOS) is now recognized as an Android subsystem
- External programs as inputs and dependencies to custom targets
- External programs as dependencies to tests
- Support for Python 3.7, 3.8, and 3.9 dropped
- More types of generated files allowed by qt.preprocess()
- The Rust module includes a basic wrapper for cbindgen
- Non-default members of Cargo workspaces can now be built
- subproject() and meson.override_find_program() now support the native
  keyword argument
- meson test now accepts --exclude
- Vala cross compilation changes
- werror=3Dtrue now applies to the linker as well
- Added win_subsystem to shared_library() and shared_module()
- i18n.xgettext() recursive option now includes "private" dependencies

https://mesonbuild.com/Release-notes-for-1-12-0.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/meson/{meson_1.11.2.bb =3D> meson_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.11.2.bb =3D> meson_1.12.0.bb=
} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.11.2.bb b/meta/recipes-d=
evtools/meson/meson_1.12.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.11.2.bb
rename to meta/recipes-devtools/meson/meson_1.12.0.bb
index 5ac4d789b8a..ac69b63bde6 100644
--- a/meta/recipes-devtools/meson/meson_1.11.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.12.0.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "698feae069cef3ecd4d7aaf281d7df359bdfcf555a9a1564=
383d3b913fa8a736"
+SRC_URI[sha256sum] =3D "88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c=
6d7470c7d365886c"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.43.0


