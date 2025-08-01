Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08C5C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:58:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.86922.1754053112709674411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 05:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4259B16A3
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 05:58:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D17A83F66E
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 05:58:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libclc: do native build of prepare_builtins in a fresh environment
Date: Fri,  1 Aug 2025 13:58:27 +0100
Message-ID: <20250801125827.2349417-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 12:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221243

The environment has variables like LDFLAGS set which CMake will try and
use, so until our cmake class is comprehensive enough to nuke those in
the native toolchain file (if that is possible) do a build inside a
clean (apart from PATH) environment to avoid cross-contamination.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
index 04b76c55d26..e56cf2eb6c0 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -28,7 +28,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D " -DPREPARE_BU=
ILTINS=3D${B_NATIVE}/prepare_
 # Need to build a native prepare_builtins binary in target builds. The e=
asiest
 # way to do this is with a second native cmake build tree.
 do_build_prepare_builtins() {
-    cmake --fresh -G Ninja \
+    env -i PATH=3D$PATH cmake --fresh -G Ninja \
         -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
         -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain-native.cm=
ake \
         -DLIBCLC_TARGETS_TO_BUILD=3D
--=20
2.43.0


