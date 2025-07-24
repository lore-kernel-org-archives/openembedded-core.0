Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C57C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 18:38:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1342.1753382337509403637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 11:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820C0176C
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:38:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99C3D3F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:38:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] clang: move get_clang_arch() functions to the common inc file
Date: Thu, 24 Jul 2025 19:38:48 +0100
Message-ID: <20250724183849.3546823-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 18:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220857

These functions are useful outside of just the clang recipe, so move
them to a common .inc file so they can be used by other clang-related
recipes.

Also make the function fail if it doesn't recognise the architecture,
instead of returning the empty string and causing mysterious fails later.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb     | 23 --------------------
 meta/recipes-devtools/clang/common-clang.inc | 23 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 60eb256e1ad..ad070b5a3e0 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -30,29 +30,6 @@ inherit cmake pkgconfig python3native python3targetcon=
fig multilib_header
=20
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
=20
-def get_clang_arch(bb, d, arch_var):
-    import re
-    a =3D d.getVar(arch_var)
-    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
-    elif re.match('arm$', a):                          return 'ARM'
-    elif re.match('armeb$', a):                        return 'ARM'
-    elif re.match('aarch64$', a):                      return 'AArch64'
-    elif re.match('aarch64_be$', a):                   return 'AArch64'
-    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match('riscv32$', a):                      return 'RISCV'
-    elif re.match('riscv64$', a):                      return 'RISCV'
-    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    elif re.match('loongarch64$', a):                  return 'LoongArch=
'
-    else:
-        bb.note("'%s' is not a primary llvm architecture" % a)
-    return ""
-
-def get_clang_host_arch(bb, d):
-    return get_clang_arch(bb, d, 'HOST_ARCH')
-
-def get_clang_target_arch(bb, d):
-    return get_clang_arch(bb, d, 'TARGET_ARCH')
-
 PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs lib=
clang-python \
                               ${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-lld', 'lld', '', d)} \
                               ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index b8f37daea24..6ac53125f09 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -21,4 +21,27 @@ LLVM_LIBDIR_SUFFIX =3D "${@d.getVar('baselib').replace=
('lib', '')}"
 # set the default pigz thread
 export PIGZ =3D "-p ${@oe.utils.cpu_count(at_least=3D2)}"
=20
+def get_clang_arch(bb, d, arch_var):
+    import re
+    a =3D d.getVar(arch_var)
+    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
+    elif re.match('arm$', a):                          return 'ARM'
+    elif re.match('armeb$', a):                        return 'ARM'
+    elif re.match('aarch64$', a):                      return 'AArch64'
+    elif re.match('aarch64_be$', a):                   return 'AArch64'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match('riscv32$', a):                      return 'RISCV'
+    elif re.match('riscv64$', a):                      return 'RISCV'
+    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
+    elif re.match('loongarch64$', a):                  return 'LoongArch=
'
+    else:
+        bb.fatal("Unhandled architecture %s" % arch_val)
+        return ""
+
+def get_clang_host_arch(bb, d):
+    return get_clang_arch(bb, d, 'HOST_ARCH')
+
+def get_clang_target_arch(bb, d):
+    return get_clang_arch(bb, d, 'TARGET_ARCH')
+
 require common.inc
--=20
2.43.0


