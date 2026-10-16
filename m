Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50109CCF2C5
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15613.1792131564997766691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d0vWiiqy;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8093; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+HeVOYwMITN8czYDrjJQURBA90JnXMiX5bq8w1jkTdE=;
  b=d0vWiiqyJFemQ1sKuzOnJonYmptnfAOWmSmlDFyTcBhypGWSmYkaIkpF
   WVgOvdIbnT4vX2SSproM/3f/AfZdMq+dz2oB/24pLpZM2rSD3afQ2hsj1
   SOhdC1IbXDVqG4X05uI3rhZsBz5vLUdtV9+GZWsXQPx9wp2y4dSgPDZok
   Vwq+GGWTqicZu0yuRcKZP+Hd3gmE1IHYI480SWw9cwnrFXV9o2fnONQ91
   xVAvCBbhQz6ZGBW4/BWK6A9vuo4lPLS7WPspgcw3mFBPqf0zxVRpk7Dfz
   jo5/ZLggl30h4Tb4LHTMbWg7JeTSmyd+hBP08Kh10L5ABZdwA5ajdnd+m
   A==;
X-CSE-ConnectionGUID: XfN0NTq+Rba5IqP8p74uOA==
X-CSE-MsgGUID: eokJsNpXR3miSSELSyqclw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDpwNFq/5P/Ja1aglmCV3VgQ0mUKYIhA54cFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECFhkrIwgZgwIBgjoDNwMRvHaBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIJVgWMnG4FJRIEVg2mBB?=
 =?us-ascii?q?YFcAgIYfy5YhgYEgxwSgVqBA0qTekiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEP?=
 =?us-ascii?q?m4HkhQegXImOwsHATxRASsEgRQIgS4skmeSQKEPhCiMIpU6GjOEBIFXiz2HA?=
 =?us-ascii?q?5JUC5YagmOOCpZPhGmBaDyBWTMaCBsVO4JnCUoZD445g2uFE1HIdicyAgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJAALIFSAQE?=
IronPort-Data: A9a23:PLXmvaz2H1ccFsJyeZV6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVUm
 zBLD2uCbvreN2enfY0nO4uwpEsF6JOAzdViQQBvqVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHE4G9U+xv80O2tHq
 N0BEGAVMUyeoMvjldpXSsE07igiBNPgMIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPHWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeK9aIWPKoDaLSlTtkufp
 UDd2XzJOEofNeek5B6+42ungvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:zT6E6KqvHcEdSS0ROI1m/DUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:hXU5GGM7c9BLBO5DaCdBrGgoA4MfeHSA7W7oc1fnVXtOYejA
X-Talos-MUID: 9a23:ZO5YzwkXv5hZif3cFHcqdnpvM8RK+IK2OHpWlJQ9gOSgDj1pMDOC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528072848"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id EA9321800027C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 2A21FCC2EF3; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 16/27] python3-git: fix CVE-2026-76219
Date: Thu, 15 Oct 2026 23:19:11 -0700
Message-Id: <20261016061922.843414-17-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247979

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/9b5dcaf85da5946dbf69dcd53f9edba08f760b32
[2] https://www.cve.org/CVERecord?id=CVE-2026-76219

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76219.patch   | 166 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
new file mode 100644
index 0000000000..0299aa026a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
@@ -0,0 +1,166 @@
+From 5e0fc3555d6e9912ea9dc152252bf252fd428185 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 09:06:40 +0000
+Subject: [PATCH 24/38] Guard read-tree index output paths
+
+<!-- agent -->
+GHSA-4gmw-gg2m-w46p reports that caller-controlled treeish arguments could
+be parsed by git read-tree as --index-output and select an arbitrary output
+path. A regression test showed that from_tree reached Git instead of raising
+UnsafeOptionError; the same unchecked path was reachable through reset and
+both merge_tree treeish positions.
+
+Add the project-standard unsafe-option guard and explicit opt-out to
+from_tree, merge_tree, and reset. Check positional and keyword candidates so
+abbreviations and alternate forwarding forms are covered before read-tree
+runs.
+
+A broader audit found only two read-tree sinks in the codebase; both are now
+guarded, and reset delegates to the guarded from_tree path. The only remaining
+index-output use is GitPython's controlled temporary index. Git cf5497b14
+confirms read-tree parses this path-taking option before tree arguments.
+Focused index tests and Ruff checks pass.
+
+CVE: CVE-2026-76219
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/9b5dcaf85da5946dbf69dcd53f9edba08f760b32]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 9b5dcaf85da5946dbf69dcd53f9edba08f760b32)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/index/base.py |   52 ++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 44 insertions(+), 8 deletions(-)
+
+diff --git a/git/index/base.py b/git/index/base.py
+index 687b72da..2e11f38b 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -142,6 +142,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+     """
+ 
+     unsafe_git_checkout_index_options = ["--prefix"]
++    unsafe_git_read_tree_options = ["--index-output"]
+ 
+     __slots__ = ("repo", "version", "entries", "_extension_data", "_file_path")
+ 
+@@ -270,8 +271,13 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+ 
+     @post_clear_cache
+     @default_index
+-    def merge_tree(self, rhs: Treeish, base: Union[None, Treeish] = None) -> "IndexFile":
+-        """Merge the given rhs treeish into the current index, possibly taking
++    def merge_tree(
++        self,
++        rhs: Treeish,
++        base: Union[None, Treeish] = None,
++        allow_unsafe_options: bool = False,
++    ) -> "IndexFile":
++        """Merge the given `rhs` treeish into the current index, possibly taking
+         a common base treeish into account.
+ 
+         As opposed to the :func:`IndexFile.from_tree` method, this allows you to use an
+@@ -284,6 +290,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             Optional treeish reference pointing to the common base of 'rhs' and this
+             index which equals lhs.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :return:
+             self (containing the merge and possibly unmerged entries in case of
+             conflicts)
+@@ -294,6 +303,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             yourself, you have to commit the changed index (or make a valid tree from
+             it) and retry with a three-way index.from_tree call.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([base, rhs]),
++                unsafe_options=self.unsafe_git_read_tree_options,
++            )
++
+         # -i : ignore working tree status
+         # --aggressive : handle more merge cases
+         # -m : do an actual merge
+@@ -337,8 +352,14 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         return inst
+ 
+     @classmethod
+-    def from_tree(cls, repo: "Repo", *treeish: Treeish, **kwargs: Any) -> "IndexFile":
+-        """Merge the given treeish revisions into a new index which is returned.
++    def from_tree(
++        cls,
++        repo: "Repo",
++        *treeish: Treeish,
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> "IndexFile":
++        R"""Merge the given treeish revisions into a new index which is returned.
+         The original index will remain unaltered.
+ 
+         :param repo:
+@@ -358,6 +379,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         :param kwargs:
+             Additional arguments passed to git-read-tree.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :return:
+             New IndexFile instance. It will point to a temporary index location which
+             does not exist anymore. If you intend to write such a merged Index, supply
+@@ -375,6 +399,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         if len(treeish) == 0 or len(treeish) > 3:
+             raise ValueError("Please specify between 1 and 3 treeish, got %i" % len(treeish))
+ 
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates(treeish, kwargs),
++                unsafe_options=cls.unsafe_git_read_tree_options,
++            )
++
+         arg_list: List[Union[Treeish, str]] = []
+         # Ignore that the working tree and index possibly are out of date.
+         if len(treeish) > 1:
+@@ -1350,6 +1380,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         working_tree: bool = False,
+         paths: Union[None, Iterable[PathLike]] = None,
+         head: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "IndexFile":
+         """Reset the index to reflect the tree at the given commit. This will not
+@@ -1375,6 +1406,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             The paths need to exist at the commit, otherwise an exception will be
+             raised.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :param kwargs:
+             Additional keyword arguments passed to git-reset
+ 
+@@ -1383,10 +1417,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             check out the files according to their state in the index.
+             If you want git-reset like behaviour, use *HEAD.reset* instead.
+ 
+-        :return: self"""
+-        # What we actually want to do is to merge the tree into our existing
+-        # index, which is what git-read-tree does.
+-        new_inst = type(self).from_tree(self.repo, commit)
++        :return:
++            self
++        """
++        # What we actually want to do is to merge the tree into our existing index,
++        # which is what git-read-tree does.
++        new_inst = type(self).from_tree(self.repo, commit, allow_unsafe_options=allow_unsafe_options)
+         if not paths:
+             self.entries = new_inst.entries
+         else:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 37de657041..a56970cc84 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -37,6 +37,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73619.patch \
             file://CVE-2026-76221.patch \
             file://CVE-2026-76220.patch \
+            file://CVE-2026-76219.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


