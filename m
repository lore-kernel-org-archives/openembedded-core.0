Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00381CCF2C8
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15557.1792129268905469582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BtY8pr4O;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8380; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UlRj9A0ArJZS4Z83Q2oYwAXwMFvylEkQa2Lx9auh8WI=;
  b=BtY8pr4OigujGEwKPZi2ADEn+hOgFn6GD4Vgd8PM/Cu8gEtlFfX6+rKD
   nBleuwz1N5P19GB2f5yroAVTV+HjDNGTr5czO94Hfeh+4UiDuepcMNlIG
   ERsNVWSrac9Bmzn/k1aCHhfdeLHxG7xUI14Xei+ZqrWRR+ZZwaQ2DXOOh
   cH6XUJXDRD5GoAxGGnnQXc6nycNZKi8xt4t9pSAXJ4VY4cWYhGTcbpLYR
   u092Q4K8LRYjpUlY3WnQttyufZLH3dqB9wrsrsoDHtBRQxCRIAJrjUKCN
   om13Kh8D5FIy4iPOnrHloPEN2+L8diGxWoIoExgjSu61FAanfkKB6GjX0
   w==;
X-CSE-ConnectionGUID: A+bMjGT7SMKn6zFVn35U5A==
X-CSE-MsgGUID: 4krKbRYjRE2i26ghpg2Zrw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAeuNFq/5T/Ja1aglmCV3VgQ0kDlCaCIQOeHBSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRRrwyg?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBX?=
 =?us-ascii?q?AEBgScghl4Egg2BDxKBWoEDhAuQOUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEP?=
 =?us-ascii?q?m4HkhQegXImOwsHATwfHxMBEBuBeAUBDSYKAgIRkxGSQKEPhCiMIpU6GjOFW?=
 =?us-ascii?q?6UUC5h9jgqWAk2EaYFoPIEoGwQLBzMaCBsVO4JnCUoZD16NW4NrgX+DZch2J?=
 =?us-ascii?q?zICBgMyAQEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:YMKRUKnBoD45hD/dcOtbjP3o5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKDTyDO6reZTP0Kd8ga9u//RsHvMTTnIdmSQNs/yo8QltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaRb8MN1Ll0Rz
 tk7Lm4fQC6F3L+LnZvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaj/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYGIJ43aGJ0P9qqej
 j7F5UfzOCAYDvHFyGDb/XK0ibX9hzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:iUjh4q3ZkV7aIg8cRa+QVAqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:R21P2228eRZ6G2LDiKQCVLxfM4MvV3/y8CjrBmy+V3RHdrvOFGLN0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AK3s9aQzVul6yT0aoeyTaW23DXW2aqPitEmMHq6Q?=
 =?us-ascii?q?EgeTeNHYuNDeFg26FWJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535598502"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 5676D18000176
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 882E7CC4D0E; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 18/27] python3-git: fix CVE-2026-76217
Date: Thu, 15 Oct 2026 22:40:57 -0700
Message-Id: <20261016054106.210444-19-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247951

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/f2550b65bf60ca087190981e2c7b6865e201f40c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-76217

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76217.patch   | 179 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
new file mode 100644
index 0000000000..ef672de44e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
@@ -0,0 +1,179 @@
+From c99cba55c8ad6eff105ee61b15f7c683e7e4d878 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 03:18:54 +0000
+Subject: [PATCH] Guard pathspec file inputs in high-level commands
+
+<!-- agent -->
+GHSA-hh9p-6wh2-4mfc reports that high-level rm and checkout wrappers
+forwarded pathspec file options without GitPython's unsafe-option policy.
+A regression showed that both commands surfaced multi-line pathspec data in
+Git errors, while reset consumed the same caller-selected file without a
+validation error. The audit also found that reset's positional commit could
+carry the option before its argument separator.
+
+Define one shared unsafe pathspec-file option list and apply it to
+IndexFile.remove, Head.checkout, and HEAD.reset before invoking Git. Check
+reset's positional commit as well as keyword options, retain the standard
+allow_unsafe_options escape hatch for trusted callers, and cover abbreviated
+long-option spellings.
+
+An audit against Git cf5497b14c5a24f10c13f7e0ee85cb95af13ea6a
+(v2.55.0.windows.3-16-gcf5497b14c) found pathspec-file support in add,
+checkout/restore, commit, reset, rm, and stash. GitPython has no arbitrary
+high-level option forwarding to the other commands, and git mv does not
+support this option.
+
+Validated with focused rejection and opt-in tests, 214 affected-module
+regressions, Ruff, basedpyright, and git diff --check.
+
+CVE: CVE-2026-76217
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/f2550b65bf60ca087190981e2c7b6865e201f40c]
+
+Backport Changes:
+- Omitted test/test_git.py, test/test_index.py, test/test_refs.py because the 
+  current PyPI source archive does not include the test suite and the 
+  python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit f2550b65bf60ca087190981e2c7b6865e201f40c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+(cherry picked from commit bac80678945ff36fc5e8483a0c6af756a27173fa)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py        |  6 ++++++
+ git/index/base.py | 10 ++++++++++
+ git/refs/head.py  | 27 ++++++++++++++++++++++++++-
+ 3 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 9c2d5d23..c509ff1a 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -421,6 +421,12 @@
+         "--upload-pack",
+     ]
+ 
++    unsafe_git_pathspec_from_file_options = [
++        # Reads pathspecs from a caller-controlled file. Some commands include an
++        # unmatched pathspec in their error output, which can disclose the file.
++        "--pathspec-from-file",
++    ]
++
+     def __getstate__(self) -> Dict[str, Any]:
+         return slots_to_dict(self, exclude=self._excluded_)
+ 
+diff --git a/git/index/base.py b/git/index/base.py
+index a2955ec3..c608f2d5 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -1011,6 +1011,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         self,
+         items: Sequence[Union[PathLike, Blob, BaseIndexEntry, "Submodule"]],
+         working_tree: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> List[str]:
+         R"""Remove the given items from the index and optionally from the working tree
+@@ -1041,6 +1042,10 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             physically removing the respective file. This may fail if there are
+             uncommitted changes in it.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-rm(1)`.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to :manpage:`git-rm(1)`, such as
+             ``r`` to allow recursive removal.
+@@ -1052,6 +1057,11 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             This is interesting to know in case you have provided a directory or globs.
+             Paths are relative to the repository.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         args = []
+         if not working_tree:
+             args.append("--cached")
+diff --git a/git/refs/head.py b/git/refs/head.py
+index 7e6fc337..1b82fbd3 100644
+--- a/git/refs/head.py
++++ b/git/refs/head.py
+@@ -19,6 +19,7 @@ from .symbolic import SymbolicReference
+ 
+ from typing import Any, Sequence, TYPE_CHECKING, Union
+ 
++from git.cmd import Git
+ from git.types import Commit_ish, PathLike
+ 
+ if TYPE_CHECKING:
+@@ -66,6 +67,7 @@ class HEAD(SymbolicReference):
+         index: bool = True,
+         working_tree: bool = False,
+         paths: Union[PathLike, Sequence[PathLike], None] = None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "HEAD":
+         """Reset our HEAD to the given commit optionally synchronizing the index and
+@@ -88,12 +90,21 @@ class HEAD(SymbolicReference):
+             Single path or list of paths relative to the git root directory
+             that are to be reset. This allows to partially reset individual files.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-reset(1)`.
++
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-reset(1)`.
+ 
+         :return:
+             self
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([commit], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         mode: Union[str, None]
+         mode = "--soft"
+         if index:
+@@ -238,7 +249,12 @@ class Head(Reference):
+         self.path = "%s/%s" % (self._common_path_default, new_path)
+         return self
+ 
+-    def checkout(self, force: bool = False, **kwargs: Any) -> Union["HEAD", "Head"]:
++    def checkout(
++        self,
++        force: bool = False,
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> Union["HEAD", "Head"]:
+         """Check out this head by setting the HEAD to this reference, by updating the
+         index to reflect the tree we point to and by updating the working tree to
+         reflect the latest index.
+@@ -250,6 +266,10 @@ class Head(Reference):
+             If ``False``, :exc:`~git.exc.GitCommandError` will be raised in that
+             situation.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-checkout(1)`.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to git checkout, e.g.
+             ``b="new_branch"`` to create a new branch at the given spot.
+@@ -265,6 +285,11 @@ class Head(Reference):
+             the HEAD detached which is allowed and possible, but remains a special state
+             that some tools might not be able to handle.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         kwargs["f"] = force
+         if kwargs["f"] is False:
+             kwargs.pop("f")
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 1fadd109dc..5f417af8cf 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76220.patch \
            file://CVE-2026-76219.patch \
            file://CVE-2026-76218.patch \
+           file://CVE-2026-76217.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


