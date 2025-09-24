Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34EFCAC5B9
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:08:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10852.1758715721219662470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA306106F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:08:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 809963F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:08:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 7/7] clang: no need to install tblgen binaries in nativesdk-clang
Date: Wed, 24 Sep 2025 13:08:34 +0100
Message-ID: <20250924120834.2886320-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924120834.2886320-1-ross.burton@arm.com>
References: <20250924120834.2886320-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223973

These are only needed if cross-compiling clang, and if someone is
cross-compiling clang in a SDK they should build their own binaries as
these ones might not match the version of clang they're building.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 9ccb81a5308..53bca1c24f8 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -222,13 +222,11 @@ do_install:append:class-nativesdk () {
     if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
         install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
     fi
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}=
/clang-tblgen
+
     for f in `find ${D}${bindir} -executable -type f -not -type l`; do
         test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
     done
-    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
-    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
-    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
+
     rm -rf ${D}${datadir}/llvm/cmake
     rm -rf ${D}${datadir}/llvm
=20
--=20
2.43.0


