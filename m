Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CB4CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:30:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18368.1757687444647966875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 07:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5E31A25
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:30:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E35DB3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:30:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] clang: disable all test targets
Date: Fri, 12 Sep 2025 15:30:34 +0100
Message-ID: <20250912143038.3345369-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912143038.3345369-1-ross.burton@arm.com>
References: <20250912143038.3345369-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 14:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223314

We don't install the tests, or run them in the build tree, so tell cmake
not to generate the targets at all. This removes internal dependencies
which means we can turn off more components that we don't want.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index f53ecbfe398..09dda563bd3 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -120,6 +120,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
                   -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
                   -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
+                  -DLLVM_INCLUDE_TESTS=3DOFF \
 "
=20
 EXTRA_OECMAKE:append:class-nativesdk =3D "\
--=20
2.43.0


