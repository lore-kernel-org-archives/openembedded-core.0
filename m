Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B46C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:43:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9432.1783835014346641892
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=N+KhKM7e;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783835014; x=1815371014;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aDYtT8/jfcLLmwv+1aDKapiJJvB2U0MTe/DsKQ3ZhrU=;
  b=N+KhKM7eimlYeoD/K8U1QUCuP6vCdKWxFRzM7AmsWIDvYuq8C+ixVME/
   ZBCNw6hj64WbPlNLSLBcxy14csY+EiUy1T2JmMD56Fnpk8mZn+Re8XOj9
   oAPoFG0jpc7B4dv6DjSCEtlXnZmGriXAq0+1T9c6fJ5N6Z8of+1YwzHeX
   iA9mbw7jifCLcQA1/0wqxysENrCiilmMHoLyaAwTB4hq8/jiK7+U+msCl
   QkPNKltrSu7NwgHaZgnCL7gP6jmUWrZjubf0DHCYv5chqQSZ1wDpBbx2k
   05RVWw3ayvwI16LXM1baLXQth3mOYmZ4fHicKNLL7SB3ajV/s92XQU+13
   A==;
X-CSE-ConnectionGUID: MSDqG+2RS+eA0QUrM+XVNg==
X-CSE-MsgGUID: eAxN1AK9RtKMcQWg0WeTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94834019"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94834019"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 22:43:28 -0700
X-CSE-ConnectionGUID: fteSRbsYT2CCcptrA/U45w==
X-CSE-MsgGUID: Jnhb/47ZQ8ep2h5vWhnV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293448043"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 22:43:26 -0700
From: yogesh.tyagi@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] bindgen-cli: set CLANG_PATH in native and nativesdk wrappers to matching clang
Date: Sun, 12 Jul 2026 13:43:13 +0800
Message-ID: <20260712054313.2099693-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
References: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240725

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

bindgen uses the clang-sys crate to locate a 'clang' executable for
querying default include paths. clang-sys's search order is CLANG_PATH,
then libclang's directory, then 'llvm-config --bindir', then PATH.

When clang is used as the toolchain, the crossscripts llvm-config wrapper
honours YOCTO_ALTERNATE_EXE_PATH and reports the target sysroot bindir.
clang-sys's 'llvm-config --bindir' step then resolves to a target clang
that cannot execute on the build host, so bindgen fails with:

  could not run executable .../recipe-sysroot/usr/bin/clang-NN:
  No such file or directory (os error 2)

This is hit, for example, when building mesa with the rusticl/opencl
PACKAGECONFIG, whose do_compile runs the native bindgen against
rusticl_mesa_bindings.h, and when building rust-in-kernel via
kernel-yocto-rust.bbclass, which pulls in clang-native and
bindgen-cli-native.

Set CLANG_PATH to the clang that matches the wrapped libclang so
clang-sys uses the runnable binary first, short-circuiting the
llvm-config lookup. The wrapper already exports LIBCLANG_PATH the same
way.

The recipe is BBCLASSEXTEND = "native nativesdk", but only the native
variant had a wrapper. Add the equivalent nativesdk wrapper so an SDK
that runs bindgen (e.g. rust kernel-module development in the SDK) does
not hit the identical target-clang failure. The native wrapper uses
STAGING_*_NATIVE; the nativesdk wrapper uses the on-target ${libdir}/
${bindir} so create_wrapper's relocation rewrites the full path and the
shipped wrapper carries no build-time (TMPDIR) reference.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
v2:
 - Add the missing nativesdk bindgen wrapper (v1 only wrapped native),
   so an SDK that runs bindgen does not hit the same target-clang failure.
 - The nativesdk wrapper uses the on-target ${libdir}/${bindir} rather
   than STAGING_LIBDIR/STAGING_BINDIR: the latter include the recipe
   sysroot (TMPDIR) prefix, which create_wrapper's relocation does not
   strip, so the shipped wrapper failed do_package_qa with a buildpaths
   (reference to TMPDIR) error.

 .../bindgen-cli/bindgen-cli_0.72.1.bb         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 72dadfe52f..2ef797c156 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -11,8 +11,25 @@ SRCREV = "d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5"
 
 require ${BPN}-crates.inc
 
+# bindgen uses the clang-sys crate to locate a 'clang' executable for querying
+# default include paths. clang-sys's search order is: CLANG_PATH, libclang's dir,
+# 'llvm-config --bindir', then PATH. When clang is the toolchain, the crossscripts
+# llvm-config wrapper honours YOCTO_ALTERNATE_EXE_PATH and reports the target
+# sysroot bindir, so clang-sys's 'llvm-config --bindir' step resolves to a target
+# clang that cannot run on the build host (native bindgen then fails with
+# "could not run executable .../clang-NN: No such file or directory", e.g. when
+# building mesa with the rusticl/opencl PACKAGECONFIG). Set CLANG_PATH to the
+# native clang so the runnable host binary is used first.
 do_install:append:class-native() {
-	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
+	create_wrapper ${D}/${bindir}/bindgen \
+		LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}" \
+		CLANG_PATH="${STAGING_BINDIR_NATIVE}/clang"
+}
+
+do_install:append:class-nativesdk() {
+	create_wrapper ${D}/${bindir}/bindgen \
+		LIBCLANG_PATH="${libdir}" \
+		CLANG_PATH="${bindir}/clang"
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


