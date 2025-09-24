Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC5CCAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:07:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10834.1758715671598047520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C79E497
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE6BD3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] classes/cmake: CMAKE_RANLIB needs to be a filename without arguments
Date: Wed, 24 Sep 2025 13:07:37 +0100
Message-ID: <20250924120745.2883969-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924120745.2883969-1-ross.burton@arm.com>
References: <20250924120745.2883969-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223964

CMAKE_RANLIB is the path to the binary without any arguments. However,
gcc-native.bbclass sets BUILD_RANLIB to "ranlib -D" which means that
CMake looks for a binary called "ranlib;-D".

This is expected behaviour upstream[1] and as there's no variable for
"ranlib flags", we should just set CMAKE_RANLIB to the first element of
the list.

[1] https://gitlab.kitware.com/cmake/cmake/-/issues/23554

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
index 1488d744d40..0dc8ea143b2 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -56,7 +56,7 @@ OECMAKE_NATIVE_C_COMPILER_LAUNCHER ?=3D "${@oecmake_map=
_compiler('BUILD_CC', d)[1]
 OECMAKE_NATIVE_CXX_COMPILER ?=3D "${@oecmake_map_compiler('BUILD_CXX', d=
)[0]}"
 OECMAKE_NATIVE_CXX_COMPILER_LAUNCHER ?=3D "${@oecmake_map_compiler('BUIL=
D_CXX', d)[1]}"
 OECMAKE_NATIVE_AR ?=3D "${BUILD_AR}"
-OECMAKE_NATIVE_RANLIB ?=3D "${BUILD_RANLIB}"
+OECMAKE_NATIVE_RANLIB ?=3D "${@d.getVar('BUILD_RANLIB').split()[0]}"
 OECMAKE_NATIVE_NM ?=3D "${BUILD_NM}"
=20
 # Native compiler flags
--=20
2.43.0


