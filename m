Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CB5CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:33 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15900.1792131564578225035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V62TXx+Y;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4062; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ELrdwSGPA1zINKc6eLv2XrinJ204DG9HLMAdLaDNlk4=;
  b=V62TXx+Y57LX2Tdxc6f+sf9hfoIBVMIG36jOrl4bcUmXA3d8uR2yFgBj
   v9+h58JrMQ8oTSkznO+LVx94Po+2L6oHYxEL5pcjYBbEblKf59a1PB7wc
   fqkgc4rNna8I7INqZEs6zyCLMI4L90uMJ97WPS3a1ZzmprOJzT1+FpdVT
   TlUmh7DyowJKsMdrpxCXFu0SCEWMk/PR8OxbmSBLWrwfXkKPkB32LEDRA
   hPbLJAvNHjhv7x3mGiFAqWoNF7gZfEDDFCaWiRNw9HDxRqdqfk8/xJ0Zh
   6ruBrbSd7JkoaQT6L7N4koJiSBzm4HjVx6gvbGA+druwGWaO/DxTO7fYo
   g==;
X-CSE-ConnectionGUID: JNqGlZNiQHqlg41LBJNCLA==
X-CSE-MsgGUID: 5X2yNK1nReO78qA39iWrrg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpwNFq/5D/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0gAi8rIwgZgwIBgjoDNwMRvHaBeTOBA?=
 =?us-ascii?q?YMpAYFU2EsQb4FoAQsUAYE4hUCII10YAUSCVYFjJxuBSUSBFYNpgQWBXAKIJ?=
 =?us-ascii?q?QSDHBKXIUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC?=
 =?us-ascii?q?4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeghhNgQ4BK1CBK?=
 =?us-ascii?q?DSldaEPhCiMIpU6GjOEBIFXpRQLmH2CWYsxlk+EaYFoPIFZMxoIGxWDIglKG?=
 =?us-ascii?q?Q+OOYNrhWTIdicyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:iljdCa5QEIaM/YfiPdGb5QxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mRNXmmBMvrYMzPyL40iO4Wx90wC65LQn9c2GQY/ri0xZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eH6sB1eJFJ2B31
 eUcJ2xUSjqhocmS6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4SNIYPVGJk9ckCw+
 1Kc7kLaWxcgOfvAmSOsqSOtufXVknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:UsXZPqA6YGFeZbzlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:7SYSf2yoD48liZahXWqbBgU2PNkKdk/7zU7wOku3VT9NYp+zYnu5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Aw/eKaA+vVprXVNmS/Z+OKt2Qf5pYubWIKxkLq5g?=
 =?us-ascii?q?h5JmdHHchOgiHljviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536037754"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 0E104180003CB
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 6793ECBEF79; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 27/27] python3-git: fix CVE-2026-100689
Date: Thu, 15 Oct 2026 23:19:22 -0700
Message-Id: <20261016061922.843414-28-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247984

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1ed0ebc2f2e74d979cdc367a4864a7731fdcc093
[2] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-59cr-6r3x-644w

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-100689.patch  | 60 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
new file mode 100644
index 0000000000..2712854d6f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
@@ -0,0 +1,60 @@
+From 1ed0ebc2f2e74d979cdc367a4864a7731fdcc093 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Subject: [PATCH] Reject submodule checkout paths outside the repository
+
+The submodule path from .gitmodules reaches filesystem operations during
+update without the containment validation used by other operations.
+Validate the checkout path and reject symbolic links before returning its
+absolute path.
+
+CVE: CVE-2026-100689
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1ed0ebc2f2e74d979cdc367a4864a7731fdcc093]
+
+Backport Changes:
+- GitPython 3.1.42's _to_relative_path() does not reject relative parent
+  traversal or the repository root. Add canonical containment validation
+  in abspath before its upstream component and symlink checks.
+- Omit upstream regression tests because the PyPI source archive does not
+  contain the test suite. Omit the documentation-only release note.
+
+(cherry picked from commit 1ed0ebc2f2e74d979cdc367a4864a7731fdcc093)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 84d6bcdc..d6d317ab 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -354,4 +354,28 @@ class Submodule(IndexObject, TraversableIterableObj):
+         return path
+ 
++    @property
++    def abspath(self) -> PathLike:
++        root = self.repo.working_tree_dir
++        if root is None:
++            return super().abspath
++
++        root = osp.realpath(root)
++        checkout_path = osp.realpath(osp.join(root, os.fspath(self.path)))
++        try:
++            common_path = osp.commonpath([root, checkout_path])
++        except ValueError as e:
++            raise ValueError("Submodule checkout path %r is not in repository" % self.path) from e
++        if osp.normcase(common_path) != osp.normcase(root):
++            raise ValueError("Submodule checkout path %r is not in repository" % self.path)
++        if osp.normcase(checkout_path) == osp.normcase(root):
++            raise ValueError("Submodule checkout path must not be the repository root")
++
++        path = root
++        for component in os.fspath(self._to_relative_path(self.repo, self.path)).split("/"):
++            path = join_path_native(path, component)
++            if osp.islink(path):
++                raise ValueError("Submodule checkout path %r contains a symbolic link" % self.path)
++        return path
++
+     @classmethod
+     def _write_git_file_and_module_config(cls, working_tree_dir: PathLike, module_abspath: PathLike) -> None:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 0102e8c329..59c40b575a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -51,6 +51,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-87818.patch \
             file://CVE-2026-87819_p1.patch \
             file://CVE-2026-87819_p2.patch \
+            file://CVE-2026-100689.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


