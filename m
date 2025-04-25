Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867C4C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:43:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4612.1745581407444447260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2447168F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:43:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB72B3F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:43:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] libunwind: fix build when unused sections are garbage collected
Date: Fri, 25 Apr 2025 12:43:21 +0100
Message-ID: <20250425114322.718562-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425114322.718562-1-ross.burton@arm.com>
References: <20250425114322.718562-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215462

poky-tiny uses gcsections.inc to strip unused sections from the
binaries.  However, on qemuarm5/qemuarm64 with poky-tiny this appears to
result in too much being removed and the link fails:

  ld: .libs/Gtest-trace: hidden symbol `__aarch64_cas8_acq_rel' in
  libgcc.a(cas_8_4.o) is referenced by DSO

Work around this by disabling gcsections.inc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libunwind/libunwind_1.8.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.1.bb
index 38022569df2..b22cb30646e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -32,6 +32,10 @@ EXTRA_OECONF =3D "--enable-static"
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
=20
+# With qemuarm64 and poky-tiny:
+# ld: .libs/Gtest-trace: hidden symbol `__aarch64_cas8_acq_rel' in libgc=
c.a(cas_8_4.o) is referenced by DSO
+LDFLAGS_SECTION_REMOVAL =3D ""
+
 LDFLAGS +=3D "-Wl,-z,relro,-z,now"
=20
 SECURITY_LDFLAGS:append:libc-musl =3D " -lssp_nonshared"
--=20
2.43.0


