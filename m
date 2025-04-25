Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8647CC369D5
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:23:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4368.1745580235467699845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F53A106F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:23:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E0643F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:23:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libunwind: refresh ppc32/musl patch
Date: Fri, 25 Apr 2025 12:23:48 +0100
Message-ID: <20250425112350.3626731-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215454

There was a precedence order problem in the patch so update to the latest
version in the pull request.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libunwind/0005-Handle-musl-on-PPC32.patch          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on=
-PPC32.patch b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-=
on-PPC32.patch
index 7cad7a5b756..63d3c85de49 100644
--- a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.=
patch
+++ b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.=
patch
@@ -30,9 +30,9 @@ index 9444cbb8..5e94ed8a 100644
 =20
 +/* glibc and musl disagree over the layout of this struct */
 +#ifdef __GLIBC__
-+#define _UC_MCONTEXT_REGS(x) x->uc_mcontext.uc_regs
++#define _UCONTEXT_UC_REGS(uc) uc->uc_mcontext.uc_regs
 +#else
-+#define _UC_MCONTEXT_REGS(x) x->uc_regs
++#define _UCONTEXT_UC_REGS(uc) uc->uc_regs
 +#endif
 +
  static void *
@@ -43,7 +43,7 @@ index 9444cbb8..5e94ed8a 100644
    if ((unsigned) (reg - UNW_PPC32_R0) < 32)
  #if defined(__linux__)
 -    addr =3D &uc->uc_mcontext.uc_regs->gregs[reg - UNW_PPC32_R0];
-+    addr =3D _UC_MCONTEXT_REGS(&uc)->gregs[reg - UNW_PPC32_R0];
++    addr =3D &_UCONTEXT_UC_REGS(uc)->gregs[reg - UNW_PPC32_R0];
  #elif defined(__FreeBSD__)
      addr =3D &uc->uc_mcontext.mc_gpr[reg - UNW_PPC32_R0];
  #endif
@@ -52,7 +52,7 @@ index 9444cbb8..5e94ed8a 100644
         ((unsigned) (reg - UNW_PPC32_F0) >=3D 0) )
  #if defined(__linux__)
 -    addr =3D &uc->uc_mcontext.uc_regs->fpregs.fpregs[reg - UNW_PPC32_F0=
];
-+    addr =3D _UC_MCONTEXT_REGS(&uc)->fpregs.fpregs[reg - UNW_PPC32_F0];
++    addr =3D &_UCONTEXT_UC_REGS(uc)->fpregs.fpregs[reg - UNW_PPC32_F0];
   #elif defined(__FreeBSD__)
      addr =3D &uc->uc_mcontext.mc_fpreg[reg - UNW_PPC32_F0];
  #endif
@@ -61,7 +61,7 @@ index 9444cbb8..5e94ed8a 100644
          }
  #if defined(__linux__)
 -      addr =3D &uc->uc_mcontext.uc_regs->gregs[gregs_idx];
-+      addr =3D _UC_MCONTEXT_REGS(&uc)->gregs[gregs_idx];
++      addr =3D &_UCONTEXT_UC_REGS(uc)->gregs[gregs_idx];
  #elif defined(__FreeBSD__)
        addr =3D &uc->uc_mcontext.mc_gpr[gregs_idx];
  #endif
--=20
2.43.0


