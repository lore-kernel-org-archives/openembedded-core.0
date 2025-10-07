Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3123CCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 10:43:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15491.1759833775384702876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 03:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC961424
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 03:42:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 897183F59E
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 03:42:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] classes/toolchain/clang: depend on llvm-native for tools, not clang
Date: Tue,  7 Oct 2025 11:42:47 +0100
Message-ID: <20251007104247.1530073-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007104247.1530073-1-ross.burton@arm.com>
References: <20251007104247.1530073-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 10:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224522

The relevant tools (objdump, strip, etc) are part of llvm-native now,
so trim dependencies and depend on that directly instead of clang-cross.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/toolchain/clang.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchai=
n/clang.bbclass
index f422a01988f..b4a1c180f6a 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -33,7 +33,7 @@ TUNE_CCARGS +=3D "${@bb.utils.contains("DISTRO_FEATURES=
", "usrmerge", " --dyld-pre
 LDFLAGS:append:class-nativesdk:x86-64 =3D " -Wl,-dynamic-linker,${base_l=
ibdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 =3D " -Wl,-dynamic-linker,${base_=
libdir}/ld-linux-aarch64.so.1"
=20
-# do_populate_sysroot needs STRIP
-POPULATESYSROOTDEPS:append:class-target =3D " ${MLPREFIX}clang-cross-${T=
ARGET_ARCH}:do_populate_sysroot"
+# do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
+POPULATESYSROOTDEPS:append:class-target =3D " llvm-native:do_populate_sy=
sroot"
=20
 TCOVERRIDE =3D "toolchain-clang"
--=20
2.43.0


