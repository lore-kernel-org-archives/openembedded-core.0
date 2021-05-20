Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.141.1621530922367738778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 10:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F27A811B3
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 10:15:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0A43F719
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 10:15:15 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: enable branch protection by standard
Date: Thu, 20 May 2021 18:15:11 +0100
Message-Id: <20210520171511.3177430-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Pass --enable-standard-branch-protection.  This is an aarch64-specific
option (currently) which does nothing on other targets.  On aarch64 this
generates code uses BTI/PAC instructions to mitigate Return Orientated
Programming attacks.  This approach is backwards compatible and the code
size/performance impact is typically negliable.

More details can be found at
https://events.static.linuxfound.org/sites/events/files/slides/slides_23.=
pdf

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
index a64c4caf00..dc7f458b25 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -40,6 +40,7 @@ EXTRA_OECONF =3D "\
     ${@get_gcc_mips_plt_setting(bb, d)} \
     ${@get_gcc_ppc_plt_settings(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
+	--enable-standard-branch-protection \
 "
=20
 # glibc version is a minimum controlling whether features are enabled.=20
--=20
2.25.1

