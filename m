Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D412CCF2C2
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:18 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15558.1792129268989783422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fojo/DOY;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5175; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LxC5sfxTrLmA6qNHO+5kACbzoOHYTIeiqhAbToYp3pI=;
  b=fojo/DOYsB0D8vg95bhlCkyMAtZztrR3jEytuDGMFAToJsi3z2LTlxAw
   nYlYBsHiILe6KDl50Qi5ktlu6H9q7rlcp/lO8o2LLLPoCRYQFEYsV6b31
   oQWy3Hz/HI2EkqOr25p/kRWUJ1P/SKhyy3RIj8GCzyUJN/52jFRwEacMv
   j+LyYCDGRHyG5e39BMgPeyuKUNaUud28K8cgp9X6Guoe8plFPyPdTepIA
   aY603YCFScAHpGP3sGCRSKvqdQxufTf43Jg2lR81YUWVILlrGkLXZM5Rf
   VkHPr/2QJumbggG1KEKnqUAlfRZc6VHNeHs1R5Ne6ROoSKMn2qdFrP5Pf
   A==;
X-CSE-ConnectionGUID: qtjDCjqTQv+ljqbq2LpuLQ==
X-CSE-MsgGUID: XSXH+MqLT9Cr+rQ7ZuK+ew==
X-IPAS-Result: =?us-ascii?q?A0BJAgCRt9Fq/4r/Ja1aglmCV3VgQ0mUKYIhA5Mein6Bf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvHeBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIJVgWMnG4FJRIEVgReCU?=
 =?us-ascii?q?oEFgVwBAYglBIINgQ8SgVqFDpA5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSFB6CGE0BgQ0BKxc5gR0LQxMYknsKkjahD4QojCKVOhozhASBV5JAklQLm?=
 =?us-ascii?q?H2CWYsxlk+EaYFoPIFHCwczGggbFYMiCUoZD44uCwuDYIF/g2VsyAonMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:zm//aa65KSh189ICDH7DsQxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mscC2uEM6yCZWP2et5xaozl/UpS7Z+Gn9dmTgRkqCljZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJJEa1s11GF136
 78cKikHd0qnn/+S+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwaoCNIofVH5w9ckCwl
 ln23yfcGzUmZfeFiiC8rUCxpazCgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:n9Sdq6FLO7tEHuWCpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A8GLfBWkrLD5DduB/pspdDAKXp8rXOWTBzlv7IVa?=
 =?us-ascii?q?EMHgqTL+MQ0bK3Lt5t/M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AkTzeUww8PeGEYytwC2ONZb+OJ4maqJSVOGBOtIw?=
 =?us-ascii?q?ih5ivL29qAmivkRf0T5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522003721"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 64D4918000283
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id BC46DCC8C94; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 27/27] python3-git: fix CVE-2026-100689
Date: Thu, 15 Oct 2026 22:41:06 -0700
Message-Id: <20261016054106.210444-28-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247944

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1ed0ebc2f2e74d979cdc367a4864a7731fdcc093
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-100689

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-100689.patch  | 90 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
new file mode 100644
index 0000000000..a94711d690
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
@@ -0,0 +1,90 @@
+From 1ed0ebc2f2e74d979cdc367a4864a7731fdcc093 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 1 Sep 2026 11:33:19 +0200
+Subject: [PATCH] Reject submodule checkout paths outside the repository
+
+GHSA-59cr-6r3x-644w identifies that submodule update paths could reach
+filesystem operations without the containment check already used by add and
+move.
+
+Add a regression that proves update rejects a parent-directory checkout
+path before cloning, and override Submodule.abspath to apply the shared
+_to_relative_path guard for every filesystem consumer.
+
+Git baseline: git.git read-cache.c verify_path_internal() rejects invalid index
+paths, covered for parent traversal by t/t9300-fast-import.sh.
+
+CVE: CVE-2026-100689
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1ed0ebc2f2e74d979cdc367a4864a7731fdcc093]
+
+Backport Changes:
+- Strengthened the 3.1.43 _to_relative_path implementation to normalize
+  paths and verify commonpath containment; its prior prefix check did not
+  reject relative parent-directory traversal.
+- Omitted doc/source/changes.rst because it only records the release note.
+- Omitted test/test_submodule.py because the PyPI source archive does not
+  include the test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 1ed0ebc2f2e74d979cdc367a4864a7731fdcc093)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 46 +++++++++++++++++++++++++++++------------
+ 1 file changed, 33 insertions(+), 13 deletions(-)
+
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -400,19 +400,39 @@
+             path = path[:-1]
+         # END handle trailing slash
+ 
+-        if osp.isabs(path) and parent_repo.working_tree_dir:
+-            working_tree_linux = to_native_path_linux(parent_repo.working_tree_dir)
+-            if not path.startswith(working_tree_linux):
+-                raise ValueError(
+-                    "Submodule checkout path '%s' needs to be within the parents repository at '%s'"
+-                    % (working_tree_linux, path)
+-                )
+-            path = path[len(working_tree_linux.rstrip("/")) + 1 :]
+-            if not path:
+-                raise ValueError("Absolute submodule path '%s' didn't yield a valid relative path" % path)
+-            # END verify converted relative path makes sense
+-        # END convert to a relative path
+-
++        root = parent_repo.working_tree_dir
++        if root:
++            drive, tail = osp.splitdrive(path)
++            separators = (os.sep,) if os.altsep is None else (os.sep, os.altsep)
++            if drive and not tail.startswith(separators):
++                raise ValueError("Drive-relative path %r is not supported" % path)
++
++            root_abs = osp.abspath(to_native_path_linux(root))
++            path_abs = osp.abspath(osp.join(root_abs, path))
++            try:
++                common_path = osp.commonpath([root_abs, path_abs])
++            except ValueError as e:
++                raise ValueError("Submodule checkout path %r is not in repository at %r" % (path, root_abs)) from e
++            if osp.normcase(common_path) != osp.normcase(root_abs):
++                raise ValueError("Submodule checkout path %r is not in repository at %r" % (path, root_abs))
++
++            path = to_native_path_linux(osp.relpath(path_abs, root_abs))
++
++        if not path or path == ".":
++            raise ValueError("Submodule checkout path must not be the repository root")
++
++        return path
++
++    @property
++    def abspath(self) -> PathLike:
++        root = self.repo.working_tree_dir
++        if root is None:
++            return super().abspath
++        path = root
++        for component in self._to_relative_path(self.repo, self.path).split("/"):
++            path = join_path_native(path, component)
++            if osp.islink(path):
++                raise ValueError("Submodule checkout path %r contains a symbolic link" % self.path)
+         return path
+ 
+     @classmethod
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 13bcc5bbdc..79baf0aacc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -51,6 +51,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-87818.patch \
            file://CVE-2026-87819_p1.patch \
            file://CVE-2026-87819_p2.patch \
+           file://CVE-2026-100689.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


