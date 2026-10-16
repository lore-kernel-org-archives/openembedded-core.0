Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4331ACCA48F
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15558.1792129268989783422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hDh79cOV;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11038; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MMQm4ttuvV2+tRHyWqNZyX80eFYYG3csqsugvwen/wM=;
  b=hDh79cOV2phPf7J+NcNN5B46ceqh2vJDe59y92bDGBDrdC2Od/Vwnpef
   bI/KLpVtZbtCGDnGygE1aktq49aRFm0CyC/v0Gc0sue6F4a9UqzY2+LqG
   Sm0ETNjQ0RD9XNYeSltUKHNoYuzsavNy+v5bVItjFwaRZ8WaQ6emlzjPv
   JDNCKgTMjKzOO3nhIWXfhLCh1541OtQ6MT8a7rxZ3J2GcJz0LBtT3m5ft
   q5Ygu1faHpikUfv6h+ifyq8P11BbPGyIg5CUEf0I9qAoz2CS13NIHQcaG
   qmfWsQM18/6m9ayguM1xMQ9sNSW7kRGV3h+iYNGYyJ4hslGCzbSBtRBTB
   g==;
X-CSE-ConnectionGUID: 0evOiXvuQWW25//Gb2y0fA==
X-CSE-MsgGUID: RPoQm4TGQD+XRq51pLf+mw==
X-IPAS-Result: =?us-ascii?q?A0BJAgCRt9Fq/4v/Ja1aH4I6gld1YENJlCmCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8d4F5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEglWBYycbgUlEgRWDaYEFg?=
 =?us-ascii?q?VwBAYEnhn4EgxwSgVp+aIZTjQ5IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5IUHoIYTT0bHAcTAQckFz+BJ1MWFJALglwBApAcgiGhD4QojCKVOhozhASBV?=
 =?us-ascii?q?5JAklQLmH2OCpUzNGiEaYFoPIFHCwczGggbFYMiCUoZD445g2uBf4JRgRTId?=
 =?us-ascii?q?icyAgkyAQEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:UdlAv6PPC+URE2PvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUor1jIFx
 mJMDGqAP/yLM2L2c4sgbozk8UwA7J/Wz9RlSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj661jEmY3DZMFw9lIWzwJs
 tMSciFVYDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PXwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVYriOC2b4CNEjCMbf9tmX+d+
 l7pxki6MisDaYWH7TTG923504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvCS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:EuLILKHyTCI6brk4pLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:b7/Rb299TUQkCO/fh7yVvxYZBOckQmPA9UjveRL/TkljEqzNR3bFrQ==
X-Talos-MUID: 9a23:m+n7Dwtmr7xtpBe89c2nvgllDcI034uXJAM9q4xb4tGgO291JGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522003720"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 59D1818000223
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 902FCCC1611; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 19/27] python3-git: fix CVE-2026-76222
Date: Thu, 15 Oct 2026 22:40:58 -0700
Message-Id: <20261016054106.210444-20-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247950

This patch applies the upstream fix as referenced in [4],
using the commit shown in [1], regression fix in [2] and
follow-up fix in [3].

[1] https://github.com/gitpython-developers/GitPython/commit/e4b8e7d026ca6abb4cf604f8e77093432ce23c06
[2] https://github.com/gitpython-developers/GitPython/commit/b324c831cbc02c82b99c18113b622d03539d23cd
[3] https://github.com/gitpython-developers/GitPython/commit/4299c990e1ca21896f9485277caf7bb0ae5b404c
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-76222

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-76222-regression.patch           |  39 ++++++
 .../python3-git/CVE-2026-76222_p1.patch       | 120 ++++++++++++++++++
 .../python3-git/CVE-2026-76222_p2.patch       |  47 +++++++
 .../python/python3-git_3.1.43.bb              |   3 +
 4 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
new file mode 100644
index 0000000000..e5e46d4b93
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
@@ -0,0 +1,39 @@
+From b324c831cbc02c82b99c18113b622d03539d23cd Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 11:07:02 +0200
+Subject: [PATCH] Initialize submodule repository before handled failures
+
+<!-- agent -->
+Direct recursive updates with keep_going could swallow an invalid-name
+validation error and then access mrepo before assignment. Reproduce that
+path and initialize mrepo before validation so recursion is safely skipped.
+
+Git baseline: submodule.c at 883a47ef6496c96a5d6132ed8c87fcd44ebf8d1a
+validates submodule paths before operating on them.
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/b324c831cbc02c82b99c18113b622d03539d23cd]
+
+Backport Changes:
+- Omitted .basedpyright/baseline.json and test/test_submodule.py because the
+  current PyPI source archive does not include these development files, and the
+  python3-git recipe does not run the test suite.
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
+index 658259cd2..9b1eb0e02 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -743,4 +743,2 @@
+-        # To keep things plausible in dry-run mode.
+-        if dry_run:
+-            mrepo = None
++        mrepo = None
+         # END init mrepo
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
new file mode 100644
index 0000000000..0c0f54e3e5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
@@ -0,0 +1,120 @@
+From 3f48614f5b02f67daf311a6681e6e5090a7f7dc3 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sat, 1 Aug 2026 04:47:40 +0200
+Subject: [PATCH] Validate submodule names before filesystem operations
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
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e4b8e7d026ca6abb4cf604f8e77093432ce23c06]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source archive
+  does not include the test suite, and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit e4b8e7d026ca6abb4cf604f8e77093432ce23c06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+(cherry picked from commit 14bdaeca511c6ba89f91d4d416f69c1efbcf204f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 43e0ec9a..a4e0077c 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -6,6 +6,7 @@ __all__ = ["Submodule", "UpdateProgress"]
+ import gc
+ from io import BytesIO
+ import logging
++import ntpath
+ import os
+ import os.path as osp
+ import stat
+@@ -300,10 +301,21 @@ class Submodule(IndexObject, TraversableIterableObj):
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
+@@ -516,6 +528,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise InvalidGitRepositoryError("Cannot add submodules to bare repositories")
+         # END handle bare repos
+ 
++        cls._validated_name(name)
+         path = cls._to_relative_path(repo, path)
+ 
+         # Ensure we never put backslashes into the URL, as might happen on Windows.
+@@ -733,6 +746,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END init mrepo
+ 
+         try:
++            self._validated_name(self.name)
++
+             # ENSURE REPO IS PRESENT AND UP-TO-DATE
+             #######################################
+             try:
+@@ -999,6 +1014,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("You must specify to move at least the module or the configuration of the submodule")
+         # END handle input
+ 
++        self._validated_name(self.name)
+         module_checkout_path = self._to_relative_path(self.repo, module_path)
+ 
+         # VERIFY DESTINATION
+@@ -1139,6 +1155,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Need to specify to delete at least the module, or the configuration")
+         # END handle parameters
+ 
++        self._validated_name(self.name)
+         # Recursively remove children of this submodule.
+         nc = 0
+         for csm in self.children():
+@@ -1365,6 +1382,9 @@ class Submodule(IndexObject, TraversableIterableObj):
+         if self.name == new_name:
+             return self
+ 
++        self._validated_name(self.name)
++        self._validated_name(new_name)
++
+         # .git/config
+         with self.repo.config_writer() as pw:
+             # As we ourselves didn't write anything about submodules into the parent
+@@ -1412,6 +1432,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             If a repository was not available.
+             This could also mean that it was not yet initialized.
+         """
++        self._validated_name(self.name)
+         module_checkout_abspath = self.abspath
+         try:
+             repo = git.Repo(module_checkout_abspath)
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
new file mode 100644
index 0000000000..f498cc22c2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
@@ -0,0 +1,47 @@
+From 4a0dfd9b336dd9332b347c3af8e8ec536017d863 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 10:08:41 +0200
+Subject: [PATCH] Validate submodule names on every module path branch
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
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4299c990e1ca21896f9485277caf7bb0ae5b404c]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 4299c990e1ca21896f9485277caf7bb0ae5b404c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+(cherry picked from commit 8d0b9b6ab8dea412499e21fb65a4e9eacb0a5ae0)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index a4e0077c..d25df367 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -314,8 +314,9 @@ class Submodule(IndexObject, TraversableIterableObj):
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 5f417af8cf..80d52f46d0 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -40,6 +40,9 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76219.patch \
            file://CVE-2026-76218.patch \
            file://CVE-2026-76217.patch \
+           file://CVE-2026-76222_p1.patch \
+           file://CVE-2026-76222-regression.patch \
+           file://CVE-2026-76222_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


