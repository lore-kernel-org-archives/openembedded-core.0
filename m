Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C82CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:45 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15906.1792131584148701298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dbvJzrah;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8103; q=dns/txt;
  s=iport01; t=1792131585; x=1793341185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+XtBit+9e0Mdqd+kNyYqhSC3p61UjvTbhAodGNE2/RQ=;
  b=dbvJzrahv/mhdd+LKHInA2uCnR1g+KZ1qKu6VAESEInBqKtbW0Sxo/EC
   cGOZC73XDE8g5dNo6PbmGmU/z40heqmoZh/SFwO1JIW+17YLmD1zFplTw
   96kaksZnmjOmkQx4qcA0dz0ENBZBRYOapD9UXtGOiyAvTWRcM2PCZOfT/
   cSWmdBS1sF8eCID3FqI7lUfXqUY+4w6sIlM2+ot5nhywenT0Fd9yrdlcx
   ethmf9s6EHDdKKZ9TmTiUDEnN5q+cyYwEfuEQEKqM5UCAuJGK0p6QKmbj
   UFtemzXVolSS6T6LEn8v4higezZQxXfhpBk4qcDJiZl01y3f2ql8WY0qM
   w==;
X-CSE-ConnectionGUID: t3rL+DwdS8aAFigLTJlKiA==
X-CSE-MsgGUID: ho4wr8rPSP+GOuNWIi2nug==
X-IPAS-Result: =?us-ascii?q?A0BLAgBfwdFq/5L/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHBSBag8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDN?=
 =?us-ascii?q?wMRRrwtgXkzgQGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBF?=
 =?us-ascii?q?YNpgQWBXAICGIENIIZeBIINgQ8SgVqBA4QLkDlIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5IUHoFyJjsLBwE8Hx8TARAbgXgFAQ0mCgICEZMRA5I9oQ+EK?=
 =?us-ascii?q?IwilToaM4VbpRQLmH2OCpYCTYRpgWg8gUMPBzMaCBsVO4JnCUoZD16NW4Nrh?=
 =?us-ascii?q?RNRyHYnMgIGAzIBAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:PCqFHag0dreoz6CHFGcNogY8X161NhEKZh0ujC45NGQN5FlHY01je
 htvWT2DOq3fMGv3e4p2YIyw8BkDu5CGy4NmTQFs/iA0RC9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUEofxTQk1R+
 cdIIRkjbx+nu8Cy47OSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJIDaGJgJxi50o
 ErG+DjmGEEADOenihWi71STp+6Vmz70Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u7Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:QIMTT6h0gxbJT5O50Dxk5rrqFHBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:JWO8emHglyEiybTTqmJ7r1QwWew6fkaNxV7+IkCcNURta7y8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AcDhX7w3VLi4UEEU8zXkCB21+tzUj46PyF1pdi60?=
 =?us-ascii?q?9g4qrEjFWBBac1jKqTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536485540"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id EE69318000202
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 34EEDCC12A6; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 18/27] python3-git: fix CVE-2026-76217
Date: Thu, 15 Oct 2026 23:19:13 -0700
Message-Id: <20261016061922.843414-19-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247993

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/f2550b65bf60ca087190981e2c7b6865e201f40c
[2] https://www.cve.org/CVERecord?id=CVE-2026-76217

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76217.patch   | 173 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
new file mode 100644
index 0000000000..22331a51c2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
@@ -0,0 +1,173 @@
+From 77915268777d0928ea156f00c95fa77c6f8294bb Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 03:18:54 +0000
+Subject: [PATCH 26/38] Guard pathspec file inputs in high-level commands
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
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit f2550b65bf60ca087190981e2c7b6865e201f40c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py        |    6 ++++++
+ git/index/base.py |   10 ++++++++++
+ git/refs/head.py  |   27 ++++++++++++++++++++++++++-
+ 3 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index b1aef9d3..398c68ff 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -333,2 +333,8 @@
++    unsafe_git_pathspec_from_file_options = [
++        # Reads pathspecs from a caller-controlled file. Some commands include an
++        # unmatched pathspec in their error output, which can disclose the file.
++        "--pathspec-from-file",
++    ]
++
+     def __getstate__(self) -> Dict[str, Any]:
+         return slots_to_dict(self, exclude=self._excluded_)
+diff --git a/git/index/base.py b/git/index/base.py
+index 2e11f38b..a92ba82b 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -986,6 +986,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         self,
+         items: Sequence[Union[PathLike, Blob, BaseIndexEntry, "Submodule"]],
+         working_tree: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> List[str]:
+         """Remove the given items from the index and optionally from
+@@ -1014,6 +1015,10 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             removing the respective file. This may fail if there are uncommitted changes
+             in it.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-rm(1)`.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to git-rm, such
+             as 'r' to allow recursive removal of
+@@ -1024,6 +1029,11 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             This is interesting to know in case you have provided a directory or
+             globs. Paths are relative to the repository.
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
+index ebc71eb9..5900d3c6 100644
+--- a/git/refs/head.py
++++ b/git/refs/head.py
+@@ -17,6 +17,7 @@ from .reference import Reference
+ 
+ from typing import Any, Sequence, Union, TYPE_CHECKING
+ 
++from git.cmd import Git
+ from git.types import PathLike, Commit_ish
+ 
+ if TYPE_CHECKING:
+@@ -63,6 +64,7 @@ class HEAD(SymbolicReference):
+         index: bool = True,
+         working_tree: bool = False,
+         paths: Union[PathLike, Sequence[PathLike], None] = None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "HEAD":
+         """Reset our HEAD to the given commit optionally synchronizing
+@@ -86,11 +88,20 @@ class HEAD(SymbolicReference):
+             Single path or list of paths relative to the git root directory
+             that are to be reset. This allows to partially reset individual files.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-reset(1)`.
++
+         :param kwargs:
+             Additional arguments passed to git-reset.
+ 
+         :return: self
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([commit], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         mode: Union[str, None]
+         mode = "--soft"
+         if index:
+@@ -230,7 +241,12 @@ class Head(Reference):
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
+@@ -242,6 +258,10 @@ class Head(Reference):
+             If False, :class:`~git.exc.GitCommandError` will be raised in that
+             situation.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-checkout(1)`.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to git checkout, e.g.
+             ``b="new_branch"`` to create a new branch at the given spot.
+@@ -257,6 +277,11 @@ class Head(Reference):
+             will leave the HEAD detached which is allowed and possible, but remains
+             a special state that some tools might not be able to handle.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         kwargs["f"] = force
+         if kwargs["f"] is False:
+             kwargs.pop("f")
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 883bd418b1..d634239cdb 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -39,6 +39,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-76220.patch \
             file://CVE-2026-76219.patch \
             file://CVE-2026-76218.patch \
+            file://CVE-2026-76217.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


