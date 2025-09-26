Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE80CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 13:10:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16964.1758892245776563898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 06:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42389168F
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 06:10:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 004353F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 06:10:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/cmake: unset LDFLAGS in toolchain-native.bbclass
Date: Fri, 26 Sep 2025 14:10:41 +0100
Message-ID: <20250926131041.3342321-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 13:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224080

If a recipe is using toolchain-native.cmake to build native portion in a
non-native build, the target LDFLAGS from the environment will leak into
the native build.

This was noticed as building a SDK with clang means that LDFLAGS contains
a --dynamic-loader argument, so native binaries were trying to use the
target loader.

There are several variables that are set from LDFLAGS[1] so instead of
setting them all, we can simply unset the environment variable in the
toolchain.

[1] https://cmake.org/cmake/help/latest/envvar/LDFLAGS.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cmake.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
index 2c83056273b..4f59966521e 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -212,11 +212,14 @@ set( CMAKE_LIBRARY_PATH ${STAGING_BASE_LIBDIR_NATIV=
E} ${STAGING_LIBDIR_NATIVE})
 list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATIVE=
})
 list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATI=
VE})
=20
-# We need to be sure that the environment variables exported by bitbake.=
conf
-# which are for the _target_ build are not respected, as otherwise you c=
an
-# end up mixing native and target flags.
+# The assignmens above override CFLAGS and CXXFLAGS from the environment=
 but
+# not LDFLAGS, which ends up in CMAKE_EXE_LINKER_FLAGS. This then means =
our
+# native builds use target flags, and can fail.
 #
-# https://cmake.org/cmake/help/latest/manual/cmake-env-variables.7.html#=
environment-variables-for-languages
+# As there are a number of variables that are set from LDFLAGS,
+# clear it at source.
+#
+# https://cmake.org/cmake/help/latest/envvar/LDFLAGS.html
 unset(ENV{LDFLAGS})
 EOF
 }
--=20
2.43.0


