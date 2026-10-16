Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FBFCCF2CA
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15614.1792131565447869150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U0/h6jk2;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10927; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/EMs+dqU/a7vzaXvx+ghWY3EFFrORw/NlTsWuC1UbJ8=;
  b=U0/h6jk2BISLtQd4XDen56MkKu/IHrBAEg+pozVKHJ+KKK8turFcPrvg
   HTj1e6BrDnwAq7JpyAHiV3/q4+tl+Q0BMI3g3tUoTMFd5TQpqdhkpFKAl
   V3HXKaWqi4YpCovg1nRyVNzkxPSS2FWFLVSdhm1TTpzZvcgG++aNfzmzf
   xpMFK3ukdht5JYFeMB+P9iWD6VGSedahU5wcDVPWTBT9X6a4uPrCO49ww
   rL1NH1yqGhT5GRjHcmoYuq0fOEiD1MY72n8qLzo0+/SojSVF46FizwuKh
   G+78ArczqgxPXbJ1MeGRGxsDg3QC7CSpyLuECYaFtkrINe03YQCISzyPp
   A==;
X-CSE-ConnectionGUID: 6e+muBu0RYi26V34w9BrRg==
X-CSE-MsgGUID: Ab+SqDnASmSfxzhQIykWaw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDpwNFq/5T/Ja1aH4I6gld1YENJlCmCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8doF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEglWBYycbgUlEgRWDaYEFg?=
 =?us-ascii?q?VwBAYEnhn4EgxwSgVp+aIZTjQ5IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5IUHoIYTVgcBxMBByQXP4EnUxYUkAuCXAEBkB2CIaEPhCiMIpU6GjOEBIFXk?=
 =?us-ascii?q?kCSVAuYfY4KlTM0aIRpgWg8gUcLBzMaCBsVgyIJShkPjjmDa4F/glGBFMh2J?=
 =?us-ascii?q?zICCTIBAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:oQHOKa54xlYJFyUbgkQwNgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jYWD2zQaKyMNGagf9wgPdi/pEoPvJPRn9JgSwduq3w0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eY4Bb//tdHDl0x
 P1Cdg5WMg/SrfiMz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwaoCNI4PTGZQ9ckCwj
 2iFxH3VBDghMeeR2SiFy1O9hdDGgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:uH2m9Kru0AHp3RxufxqaaBcaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A9AMZJWsExB8aF5otTMRz4Ede6It7fz7Y0V3Ne3W?=
 =?us-ascii?q?JCDw3dubJVg664plrxp8=3D?=
X-Talos-MUID: 9a23:1Hgk/wQLWvSRKtODRXTFjnJZLetuyp+rM04dg5U/mtiHCiVvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522017149"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id F18C118000140
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 3AB75CBEFAA; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 19/27] python3-git: fix CVE-2026-76222
Date: Thu, 15 Oct 2026 23:19:14 -0700
Message-Id: <20261016061922.843414-20-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247988

This patch applies the upstream fix as referenced in [4],
using the commit shown in [1], regression fix in [2] and
follow-up fix in [3].

[1] https://github.com/gitpython-developers/GitPython/commit/e4b8e7d026ca6abb4cf604f8e77093432ce23c06
[2] https://github.com/gitpython-developers/GitPython/commit/b324c831cbc02c82b99c18113b622d03539d23cd
[3] https://github.com/gitpython-developers/GitPython/commit/4299c990e1ca21896f9485277caf7bb0ae5b404c
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-76222

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-76222-regression.patch           |  35 +++++
 .../python3-git/CVE-2026-76222_p1.patch       | 123 ++++++++++++++++++
 .../python3-git/CVE-2026-76222_p2.patch       |  49 +++++++
 .../python/python3-git_3.1.42.bb              |   3 +
 4 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
new file mode 100644
index 0000000000..725403d1bb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
@@ -0,0 +1,35 @@
+From a82b22c137622eb76112d5ec04e86b246e57eab3 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 11:07:02 +0200
+Subject: [PATCH] Initialize submodule repository before handled failures
+
+Direct recursive updates with keep_going could swallow an invalid-name
+validation error and then access mrepo before assignment. Initialize
+mrepo before validation so recursion is safely skipped.
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/b324c831cbc02c82b99c18113b622d03539d23cd]
+
+Backport Changes:
+- Omitted `test/test_submodule.py` because the PyPI source archive omits
+  tests, which are outside this recipe's test surface.
+- Omitted `.basedpyright/baseline.json` because it is development-only
+  static-analysis metadata absent from the source archive.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit b324c831cbc02c82b99c18113b622d03539d23cd)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index ec0a534f..45fc4551 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -640,3 +640 @@ class Submodule(IndexObject, TraversableIterableObj):
+-        # To keep things plausible in dry-run mode.
+-        if dry_run:
+-            mrepo = None
++        mrepo = None
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
new file mode 100644
index 0000000000..77e47a8497
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
@@ -0,0 +1,123 @@
+From 190b90a1932cb548b0b95f5c2751377012c37d42 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sat, 1 Aug 2026 04:47:40 +0200
+Subject: [PATCH 27/38] Validate submodule names before filesystem operations
+
+<!-- agent -->
+Submodule names read from .gitmodules can influence the separate Git directory
+path. Reject empty names, absolute or drive-qualified names, and parent
+components with either path separator.
+
+Validate before constructing module paths and before opening or mutating
+existing checkouts, so a repository initialized by an older vulnerable version
+cannot bypass the guard. Validate programmatic add and rename inputs before
+making changes as well.
+
+Advisory: GHSA-hmq2-w58f-27jc
+
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e4b8e7d026ca6abb4cf604f8e77093432ce23c06]
+
+Backport Changes:
+- Omit upstream regression test changes because the Scarthgap PyPI source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit e4b8e7d026ca6abb4cf604f8e77093432ce23c06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+
+---
+ git/objects/submodule/base.py |   23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 4fe2ff3f..84d6bcdc 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -4,6 +4,7 @@
+ import gc
+ from io import BytesIO
+ import logging
++import ntpath
+ import os
+ import os.path as osp
+ import stat
+@@ -267,10 +268,21 @@ class Submodule(IndexObject, TraversableIterableObj):
+         parser.set_submodule(self)
+         return SectionConstraint(parser, sm_section(self.name))
+ 
++    @classmethod
++    def _validated_name(cls, name: str) -> str:
++        if (
++            not name
++            or name.startswith(("/", "\\"))
++            or ntpath.splitdrive(name)[0]
++            or ".." in name.replace("\\", "/").split("/")
++        ):
++            raise ValueError("Invalid submodule name %r" % name)
++        return name
++
+     @classmethod
+     def _module_abspath(cls, parent_repo: "Repo", path: PathLike, name: str) -> PathLike:
+         if cls._need_gitfile_submodules(parent_repo.git):
+-            return osp.join(parent_repo.git_dir, "modules", name)
++            return osp.join(parent_repo.git_dir, "modules", cls._validated_name(name))
+         if parent_repo.working_tree_dir:
+             return osp.join(parent_repo.working_tree_dir, path)
+         raise NotADirectoryError()
+@@ -430,6 +442,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise InvalidGitRepositoryError("Cannot add submodules to bare repositories")
+         # END handle bare repos
+ 
++        cls._validated_name(name)
+         path = cls._to_relative_path(repo, path)
+ 
+         # Ensure we never put backslashes into the URL, as some operating systems
+@@ -629,6 +642,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END init mrepo
+ 
+         try:
++            self._validated_name(self.name)
++
+             # ENSURE REPO IS PRESENT AND UP-TO-DATE
+             #######################################
+             try:
+@@ -880,6 +895,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("You must specify to move at least the module or the configuration of the submodule")
+         # END handle input
+ 
++        self._validated_name(self.name)
+         module_checkout_path = self._to_relative_path(self.repo, module_path)
+ 
+         # VERIFY DESTINATION
+@@ -1002,6 +1018,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Need to specify to delete at least the module, or the configuration")
+         # END handle parameters
+ 
++        self._validated_name(self.name)
+         # Recursively remove children of this submodule.
+         nc = 0
+         for csm in self.children():
+@@ -1211,6 +1228,9 @@ class Submodule(IndexObject, TraversableIterableObj):
+         if self.name == new_name:
+             return self
+ 
++        self._validated_name(self.name)
++        self._validated_name(new_name)
++
+         # .git/config
+         with self.repo.config_writer() as pw:
+             # As we ourselves didn't write anything about submodules into the parent .git/config,
+@@ -1254,6 +1274,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+         :raise InvalidGitRepositoryError: If a repository was not available. This could
+             also mean that it was not yet initialized.
+         """
++        self._validated_name(self.name)
+         module_checkout_abspath = self.abspath
+         try:
+             repo = git.Repo(module_checkout_abspath)
+-- 
+2.35.6
+(cherry picked from commit e4b8e7d026ca6abb4cf604f8e77093432ce23c06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
new file mode 100644
index 0000000000..5f549b0e35
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
@@ -0,0 +1,49 @@
+From df2835724f8f92bc0a9efed691e14c8bdf58a6dc Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 10:08:41 +0200
+Subject: [PATCH 28/38] Validate submodule names on every module path branch
+
+<!-- agent -->
+_module_abspath only validated names when Git used separate gitfile
+submodule directories, so legacy Git behavior could accept the same invalid
+name. Validate before selecting the Git-version-dependent path branch and
+cover the legacy branch explicitly.
+
+Git baseline: submodule.c at 883a47ef6496c96a5d6132ed8c87fcd44ebf8d1a
+validates submodule paths before filesystem operations.
+
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4299c990e1ca21896f9485277caf7bb0ae5b404c]
+
+Backport Changes:
+- Omit upstream regression test changes because the Scarthgap PyPI source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 4299c990e1ca21896f9485277caf7bb0ae5b404c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+
+---
+ git/objects/submodule/base.py |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 84d6bcdc..09a784e1 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -281,8 +281,9 @@ class Submodule(IndexObject, TraversableIterableObj):
+ 
+     @classmethod
+     def _module_abspath(cls, parent_repo: "Repo", path: PathLike, name: str) -> PathLike:
++        name = cls._validated_name(name)
+         if cls._need_gitfile_submodules(parent_repo.git):
+-            return osp.join(parent_repo.git_dir, "modules", cls._validated_name(name))
++            return osp.join(parent_repo.git_dir, "modules", name)
+         if parent_repo.working_tree_dir:
+             return osp.join(parent_repo.working_tree_dir, path)
+         raise NotADirectoryError()
+-- 
+2.35.6
+(cherry picked from commit 4299c990e1ca21896f9485277caf7bb0ae5b404c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index d634239cdb..4375809d3a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -40,6 +40,9 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-76219.patch \
             file://CVE-2026-76218.patch \
             file://CVE-2026-76217.patch \
+            file://CVE-2026-76222_p1.patch \
+            file://CVE-2026-76222-regression.patch \
+            file://CVE-2026-76222_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


