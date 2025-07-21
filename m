Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DB7C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:24:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40626.1753104273130286212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF67D153B
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26D1E3F6A8
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/5] cmake: remove CMAKE_SYSTEM_* from the native toolchain
Date: Mon, 21 Jul 2025 14:24:22 +0100
Message-ID: <20250721132426.3321928-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220687

If these variables are set explictly then CMake assumes that it is
cross-compiling[1]. We don't need to set them as the default values as
detected by CMake are correct for native.

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_CROSSCOMPILING.htm=
l

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cmake.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
index 449fe2bb443..0bb0f33a9ec 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -180,8 +180,6 @@ list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${=
includedir})
=20
 EOF
         cat > ${WORKDIR}/toolchain-native.cmake <<EOF
-set( CMAKE_SYSTEM_NAME ${@map_host_os_to_system_name(d.getVar('BUILD_OS'=
))} )
-set( CMAKE_SYSTEM_PROCESSOR ${@map_host_arch_to_uname_arch(d.getVar('BUI=
LD_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
--=20
2.43.0


