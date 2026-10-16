Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D1ECCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15275.1792129268839428503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FLy1OfZd;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15852; q=dns/txt;
  s=iport01; t=1792129268; x=1793338868;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DsgcTeruhLPtE3g9n6S1yCUoIM7wc6eLBNKzf+HLAQ0=;
  b=FLy1OfZdZvfx8IwaISVSz5587yc/O9nEKPCDGh9W284iZrMz2i9m63VG
   IrIMeJY2dnFsLJYB2hhnZVLYALe5q4/4oNyjBWvbkQ6cyExsagQ+eRv77
   sKXJHUFGVB4YxhdEH4sO1ZaV8+QtHovfVVaqWN60C+bLVdaBA1ZJ4V1l5
   7H8DE6drdXHAnKlFI0dOMMbWeyEzFl+u2tpx1AYH6Y7i2XZ9lGox7hVn7
   3RhODob/Cb7V6dJlAL6Wf3heLtVmrr7o+Zlnp4TTUKRD/Mv7TAT+Hz+yC
   VuShfa8vNJci4scXg/pppN7lUzVc1VTw39mDdOBKRKJPKAlLLw/21Wiu3
   A==;
X-CSE-ConnectionGUID: eMjgKJK/SlGB6N0VHMZC4Q==
X-CSE-MsgGUID: nUFJQ9YSSjCCMmegTnr5fg==
X-IPAS-Result: =?us-ascii?q?A0BLAgCGuNFq/5H/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8eIF5M4EBgykBPwICQAFQ2EsQb4FoAQsUAYE4hUCII10YAUSCVYFjJxuBS?=
 =?us-ascii?q?USBFYNpgQWBMioBAQKCCoYZBIMcEoFagQOOSoV6SIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSFB6CGAgzEj0kLQErIlkKPgobEBw0BiySZ5JAoQ+EKIwil?=
 =?us-ascii?q?ToaM4VbpRQLmH2OCpZPhGmBaDyBRwsHMxoIGxU7gmcJShkPjisOC4NggX+DZ?=
 =?us-ascii?q?ch2JzICBgMyAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:U/kWlKgCw+6FVt9lILNBXvtcX161NxEKZh0ujC45NGQN5FlHY01je
 htvUDvTOv2MamTxKYx2aIm+8EJQusLVxodqTwFuqiFjFX9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUV3+R4IkNts
 sccBxpTSEi9p8eE6+6CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJIPSFJsIxC50o
 ErAwkrbO0ArD+ed4hGg93+juunVwC30Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:8ORKJKk02CPUN1ejw1q9LuAm0YDpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:FzEgg27W54nwdgH9r9ss+WsWFeMHUTrmyFj6fWngN0ZMepbJcArF
X-Talos-MUID: 9a23:7gfkpAiIWu/6jT0tzGEF78MpMvpGwZ3/OXs2k74tnsyJOhB2IWqTg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536709652"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:07 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 85FAE180001C5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 28264CBF202; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 02/27] python3-git: fix CVE-2026-67323
Date: Thu, 15 Oct 2026 22:40:41 -0700
Message-Id: <20261016054106.210444-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247935

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-67323

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67323.patch   | 356 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 357 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
new file mode 100644
index 0000000000..fa6270d305
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
@@ -0,0 +1,356 @@
+From 80bf84d6f24adcc181b78d71fa94544924a85b2c Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 15:06:42 +0200
+Subject: [PATCH] fix: Guard unsafe git command options (GHSA-956x-8gvw-wg5v)
+
+Reject command options that can execute arbitrary helpers or write files when passed through archive, revision traversal, blame, clone, fetch, pull, push, and ls-remote APIs. Validate positional option tokens and transformed keyword options consistently, including Git-supported long-option abbreviations, attached short-option values, and falsey stringifiable remotes. Preserve explicit allow_unsafe_options and allow_unsafe_protocols escape hatches.
+
+Add regression coverage for each guarded API, option spelling and abbreviation forms, inert keyword values, mixed positional and keyword candidates, tuple blame options, stringifiable remotes, and unsafe commands that must not create marker files.
+
+CVE: CVE-2026-67323
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_commit.py, test/test_git.py, 
+  test/test_remote.py, test/test_repo.py because the current PyPI 
+  source archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 701ce32fe5ba8cb622c0e0342a376a6beb47d738)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py            | 37 ++++++++++++++++++++-
+ git/objects/commit.py | 12 +++++++
+ git/remote.py         | 15 ++++++--
+ git/repo/base.py      | 80 +++++++++++++++++++++++++++++++++++++++----
+ 4 files changed, 133 insertions(+), 11 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index bb8f93a849547e61e4f8fb9055e4be047b2dae38..016d476e38e84439dd325113b4a38133b6d768a0 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -416,6 +416,11 @@ class Git(metaclass=_GitMeta):
+ 
+     re_unsafe_protocol = re.compile(r"(.+)::.+")
+ 
++    unsafe_git_ls_remote_options = [
++        # This option allows arbitrary command execution in git-ls-remote.
++        "--upload-pack",
++    ]
++
+     def __getstate__(self) -> Dict[str, Any]:
+         return slots_to_dict(self, exclude=self._excluded_)
+ 
+@@ -742,6 +748,20 @@ class Git(metaclass=_GitMeta):
+                     f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+                 )
+ 
++    @classmethod
++    def _option_candidates(cls, args: Sequence[Any] = (), kwargs: Optional[Mapping[str, Any]] = None) -> List[str]:
++        """Collect possible option spellings before command-line transformation."""
++        options = [
++            option for option in cls._unpack_args([arg for arg in args if arg is not None]) if option.startswith("-")
++        ]
++        if kwargs:
++            for key, value in kwargs.items():
++                values = value if isinstance(value, (list, tuple)) else (value,)
++                if any(value is True or (value is not False and value is not None) for value in values):
++                    key = str(key)
++                    options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
++        return options
++
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+ 
+@@ -1011,6 +1031,22 @@ class Git(metaclass=_GitMeta):
+ 
+         self._persistent_git_options = self.transform_kwargs(split_single_char_options=True, **kwargs)
+ 
++    def ls_remote(
++        self,
++        *args: Any,
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> Union[str, bytes, Tuple[int, Union[str, bytes], str], "Git.AutoInterrupt"]:
++        """List references in a remote repository.
++
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--upload-pack`` or ``--exec``.
++        """
++        if not allow_unsafe_options:
++            candidate_options = self._option_candidates(args, kwargs)
++            Git.check_unsafe_options(options=candidate_options, unsafe_options=self.unsafe_git_ls_remote_options)
++        return self._call_process("ls_remote", *args, **kwargs)
++
+     @property
+     def working_dir(self) -> Union[None, PathLike]:
+         """:return: Git directory we are working on"""
+@@ -1488,7 +1524,7 @@ class Git(metaclass=_GitMeta):
+         return args
+ 
+     @classmethod
+-    def _unpack_args(cls, arg_list: Sequence[str]) -> List[str]:
++    def _unpack_args(cls, arg_list: Sequence[Any]) -> List[str]:
+         outlist = []
+         if isinstance(arg_list, (list, tuple)):
+             for arg in arg_list:
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index d957c90514989c34f4bfd343b0061e6e8c3b8d2c..cc85e7dd9b2ae10a0587148452af463980775a73 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -86,6 +86,12 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+     # INVARIANTS
+     default_encoding = "UTF-8"
+ 
++    # Options to :manpage:`git-rev-list(1)` that can overwrite files.
++    unsafe_git_rev_options = [
++        "--output",
++        "-o",
++    ]
++
+     type: Literal["commit"] = "commit"
+ 
+     __slots__ = (
+@@ -302,6 +308,7 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         repo: "Repo",
+         rev: Union[str, "Commit", "SymbolicReference"],
+         paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Iterator["Commit"]:
+         R"""Find all commits matching the given criteria.
+@@ -330,6 +337,11 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+             raise ValueError("--pretty cannot be used as parsing expects single sha's only")
+         # END handle pretty
+ 
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=cls.unsafe_git_rev_options
++            )
++
+         # Use -- in all cases, to prevent possibility of ambiguous arguments.
+         # See https://github.com/gitpython-developers/GitPython/issues/264.
+ 
+diff --git a/git/remote.py b/git/remote.py
+index f2ecd0f360e763aa5415a40543095d43727fc31e..cafa1f84267f2703de9fdf73983ca0646b82f010 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -1061,7 +1061,10 @@ class Remote(LazyMixin, IterableObj):
+                     Git.check_unsafe_protocols(ref)
+ 
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_fetch_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_fetch_options,
++            )
+ 
+         proc = self.repo.git.fetch(
+             "--", self, *args, as_process=True, with_stdout=False, universal_newlines=False, v=verbose, **kwargs
+@@ -1115,7 +1118,10 @@ class Remote(LazyMixin, IterableObj):
+                 Git.check_unsafe_protocols(ref)
+ 
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_pull_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_pull_options,
++            )
+ 
+         proc = self.repo.git.pull(
+             "--", self, refspec, with_stdout=False, as_process=True, universal_newlines=False, v=True, **kwargs
+@@ -1188,7 +1194,10 @@ class Remote(LazyMixin, IterableObj):
+                 Git.check_unsafe_protocols(ref)
+ 
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_push_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_push_options,
++            )
+ 
+         proc = self.repo.git.push(
+             "--",
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 8059fcebeb83be30c4aeefdefa4c6fdb96bcd81e..3380e0c5fbec391c84a14c9292eb98a8bcc484c9 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -160,6 +160,20 @@ class Repo:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
+     """
+ 
++    unsafe_git_archive_options = [
++        # Allows arbitrary command execution through the remote git-upload-archive command.
++        "--exec",
++        # Writes output to a caller-controlled filesystem path.
++        "--output",
++        "-o",
++    ]
++
++    unsafe_git_revision_options = [
++        # This option allows output to be written to arbitrary files before revision parsing.
++        "--output",
++        "-o",
++    ]
++
+     # Invariants
+     config_level: ConfigLevels_Tup = ("system", "user", "global", "repository")
+     """Represents the configuration level of a configuration file."""
+@@ -743,6 +757,7 @@ class Repo:
+         self,
+         rev: Union[str, Commit, "SymbolicReference", None] = None,
+         paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Iterator[Commit]:
+         """An iterator of :class:`~git.objects.commit.Commit` objects representing the
+@@ -760,6 +775,9 @@ class Repo:
+             Arguments to be passed to :manpage:`git-rev-list(1)`.
+             Common ones are ``max_count`` and ``skip``.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options in the revision argument, like ``--output``.
++
+         :note:
+             To receive only commits between two named revisions, use the
+             ``"revA...revB"`` revision specifier.
+@@ -770,7 +788,18 @@ class Repo:
+         if rev is None:
+             rev = self.head.commit
+ 
+-        return Commit.iter_items(self, rev, paths, **kwargs)
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++            )
++
++        return Commit.iter_items(
++            self,
++            rev,
++            paths,
++            allow_unsafe_options=allow_unsafe_options,
++            **kwargs,
++        )
+ 
+     def merge_base(self, *rev: TBD, **kwargs: Any) -> List[Commit]:
+         R"""Find the closest common ancestor for the given revision
+@@ -1035,7 +1064,9 @@ class Repo:
+         # reveal_type(self.head.reference)  # => Reference
+         return self.head.reference
+ 
+-    def blame_incremental(self, rev: str | HEAD | None, file: str, **kwargs: Any) -> Iterator["BlameEntry"]:
++    def blame_incremental(
++        self, rev: str | HEAD | None, file: str, allow_unsafe_options: bool = False, **kwargs: Any
++    ) -> Iterator["BlameEntry"]:
+         """Iterator for blame information for the given file at the given revision.
+ 
+         Unlike :meth:`blame`, this does not return the actual file's contents, only a
+@@ -1046,6 +1077,9 @@ class Repo:
+             uncommitted changes. Otherwise, anything successfully parsed by
+             :manpage:`git-rev-parse(1)` is a valid option.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options in revision argument, like ``--output``.
++
+         :return:
+             Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates the
+             commit to blame for the line, and range indicates a span of line numbers in
+@@ -1054,6 +1088,10 @@ class Repo:
+         If you combine all line number ranges outputted by this command, you should get
+         a continuous range spanning all line numbers in the file.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++            )
+ 
+         data: bytes = self.git.blame(rev, "--", file, p=True, incremental=True, stdout_as_string=False, **kwargs)
+         commits: Dict[bytes, Commit] = {}
+@@ -1132,7 +1170,8 @@ class Repo:
+         rev: Union[str, HEAD, None],
+         file: str,
+         incremental: bool = False,
+-        rev_opts: Optional[List[str]] = None,
++        rev_opts: Optional[Sequence[str]] = None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> List[List[Commit | List[str | bytes] | None]] | Iterator[BlameEntry] | None:
+         """The blame information for the given file at the given revision.
+@@ -1142,6 +1181,9 @@ class Repo:
+             uncommitted changes. Otherwise, anything successfully parsed by
+             :manpage:`git-rev-parse(1)` is a valid option.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options in revision argument, like ``--output``.
++
+         :return:
+             list: [git.Commit, list: [<line>]]
+ 
+@@ -1151,9 +1193,14 @@ class Repo:
+             appearance.
+         """
+         if incremental:
+-            return self.blame_incremental(rev, file, **kwargs)
+-        rev_opts = rev_opts or []
+-        data: bytes = self.git.blame(rev, *rev_opts, "--", file, p=True, stdout_as_string=False, **kwargs)
++            return self.blame_incremental(rev, file, allow_unsafe_options=allow_unsafe_options, **kwargs)
++        rev_opts_list = list(rev_opts or [])
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev, rev_opts_list], kwargs),
++                unsafe_options=self.unsafe_git_revision_options,
++            )
++        data: bytes = self.git.blame(rev, *rev_opts_list, "--", file, p=True, stdout_as_string=False, **kwargs)
+         commits: Dict[str, Commit] = {}
+         blames: List[List[Commit | List[str | bytes] | None]] = []
+ 
+@@ -1364,7 +1411,10 @@ class Repo:
+         if not allow_unsafe_protocols:
+             Git.check_unsafe_protocols(str(url))
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=cls.unsafe_git_clone_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_clone_options,
++            )
+         if not allow_unsafe_options and multi:
+             Git.check_unsafe_options(options=multi, unsafe_options=cls.unsafe_git_clone_options)
+ 
+@@ -1539,6 +1589,8 @@ class Repo:
+         ostream: Union[TextIO, BinaryIO],
+         treeish: Optional[str] = None,
+         prefix: Optional[str] = None,
++        allow_unsafe_options: bool = False,
++        allow_unsafe_protocols: bool = False,
+         **kwargs: Any,
+     ) -> Repo:
+         """Archive the tree at the given revision.
+@@ -1561,6 +1613,12 @@ class Repo:
+               repository-relative path to a directory or file to place into the archive,
+               or a list or tuple of multiple paths.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--exec`` or ``--output``.
++
++        :param allow_unsafe_protocols:
++            Allow unsafe protocols to be used in ``remote``, like ``ext``.
++
+         :raise git.exc.GitCommandError:
+             If something went wrong.
+ 
+@@ -1571,6 +1629,14 @@ class Repo:
+             treeish = self.head.commit
+         if prefix and "prefix" not in kwargs:
+             kwargs["prefix"] = prefix
++        remote = kwargs.get("remote")
++        if not allow_unsafe_protocols and remote is not None:
++            Git.check_unsafe_protocols(str(remote))
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_archive_options,
++            )
+         kwargs["output_stream"] = ostream
+         path = kwargs.pop("path", [])
+         path = cast(Union[PathLike, List[PathLike], Tuple[PathLike, ...]], path)
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 474206d4ed..72eb073196 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-44244_p1.patch \
            file://CVE-2026-44244_p2.patch \
            file://CVE-2026-67326.patch \
+           file://CVE-2026-67323.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


