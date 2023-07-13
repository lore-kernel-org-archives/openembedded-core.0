Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35EBEB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5599.1689246081945346789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D2841570;
	Thu, 13 Jul 2023 04:02:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F3A23F740;
	Thu, 13 Jul 2023 04:01:20 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] gcc: don't pass --enable-standard-branch-protection
Date: Thu, 13 Jul 2023 12:01:18 +0100
Message-Id: <20230713110119.3959009-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184237

From: Ross Burton <ross.burton@arm.com>

By changing the default code generation of GCC we're inadvertently
breaking the GCC test suite, which has ~120K+ more failures when run for
aarch64 compared to x86-64.

This was because the generated code fragments included the BTI
instructions, which the test case wasn't expecting.  We can't tell the
tests globally to run without branch protection, as that will break the
tests which also turn it on.

Remove the enabling of branch protection by standard in GCC, we'll
enable it in the tune files instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
index e4cdb73f0a4..dba25eb7543 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -40,7 +40,6 @@ EXTRA_OECONF =3D "\
     ${@get_gcc_mips_plt_setting(bb, d)} \
     ${@get_gcc_ppc_plt_settings(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
-	--enable-standard-branch-protection \
 "
=20
 # glibc version is a minimum controlling whether features are enabled.=20
--=20
2.34.1


