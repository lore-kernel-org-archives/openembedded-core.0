Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D320C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503946"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503946"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298018"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/33] rust-cross: Replace TARGET_ARCH with
 TUNE_PKGARCH
Date: Thu,  9 Dec 2021 09:29:03 +0800
Message-Id: 
 <154a1117be4e566359cd35b702ad57d9dd0e6dc1.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159405

From: Pgowda <pgowda.cve@gmail.com>

rust-cross-* imported from meta-rust has incorrect signatures,
depending on MACHINEOVERRIDES making it effectively MACHINE_ARCH
as shown by sstate-diff-machines.sh:

openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc \
--machines="qemuarm64 qemuarm64copy" --targets=rust-cross-aarch64-glibc \
--analyze

 === Comparing signatures for task do_configure.sigdata between
 qemuarm64 and qemuarm64copy ===
ERROR: gcc-runtime different signature for task do_configure.sigdata
between qemuarm64 and qemuarm64copy
NOTE: Starting bitbake server...
Hash for dependent task gcc/gcc-runtime_11.2.bb:do_prepare_recipe_sysroot
changed from
da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 to
47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
Unable to find matching sigdata for
openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:
do_prepare_recipe_sysroot with hashes
da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 or
47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40

The following patch takes TUNE_PKGARCH into consideration instead
of TARGET_ARCH and results in signatures as expected.

[YOCTO #14613]

RP: Added maintainer.inc corresponding change
Signed-off-by: Pgowda <pgowda.cve@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bcf48766d1123cea41f80b0cb687584692c96158)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc  | 2 +-
 meta/recipes-devtools/rust/rust-cross.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a49a35576a..b3b7711a0c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -659,7 +659,7 @@ RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rustfmt = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-cross-${TARGET_ARCH}-${TCLIBC} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-cross-${TUNE_PKGARCH}-${TCLIBC} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 33be83bf5a..5f8671257e 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -32,7 +32,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
 DEPENDS += "rust-native"
 
 PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
+PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
 
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-- 
2.33.1


