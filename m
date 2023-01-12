Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8127C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 14:58:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.57339.1673535537966174214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 06:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iNQ/atgV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03766437ad=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CDJMTQ029184
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:58:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Tgq3h14pgWnM2foK66g5C0tTBblYLXfIqn4Gd2pIrmM=;
 b=iNQ/atgVcqdN8438ASkbvEdbUhjwFn0PaNA1FfwWUWy6vZPGIkz/gTz32qJY+8dle+kq
 FrUVhvm5qw/kS8t3h20PwUvSqu8S/s4YKX++40MqJvM0WJ7ZBEJU5kDpIrNuIkzW3H1L
 o28hrHC/KgxdZlIh1idce+5KVnh0Nu3UOko4OitOmhzMFgDpWhIlOMwJAKSqcTRvcG6z
 z7zgnj3jJ5nnWuXNEGw4JLYXuBKH2mkWLRkYRJqfUBlZ4+vu12nwuAkzSD96u8EWsrQ6
 CQ6MelRiX0F2b40lBrr/yL7DJKqqDldYbXDwBkMGjE82mzZfmxsnw9KCDWSQ9giNr1Q7 /g== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5s1ejw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:58:57 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 06:58:56 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 06:58:55 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-git: fix for CVE-2022-24439
Date: Thu, 12 Jan 2023 14:58:37 +0000
Message-ID: <20230112145837.3691756-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kH8GfOwAE6K02NEHZ-_eUxXIX20sqxqQ
X-Proofpoint-GUID: kH8GfOwAE6K02NEHZ-_eUxXIX20sqxqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 14:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175799

All versions of package gitpython are vulnerable to Remote Code Execution
(RCE) due to improper user input validation, which makes it possible to
inject a maliciously crafted remote URL into the clone command. Exploiting
this vulnerability is possible because the library makes external calls to
git without sufficient sanitization of input arguments.

CVE: CVE-2022-24439

Upstream-Status: Backport

Reference:
https://github.com/gitpython-developers/GitPython/discussions/1529
https://github.com/gitpython-developers/GitPython/pull/1518
https://github.com/gitpython-developers/GitPython/pull/1521

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...-git-CVE-2022-24439-fix-from-PR-1518.patch |  97 ++++
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch | 488 ++++++++++++++++++
 .../python/python3-git_3.1.27.bb              |   4 +
 3 files changed, 589 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch

diff --git a/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
new file mode 100644
index 0000000000..16192b22c7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
@@ -0,0 +1,97 @@
+From 6ebe9231cd34dacd32a964859bc509aaa1e3f5fd Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Fri, 6 Jan 2023 14:13:10 +0000
+Subject: [PATCH] python3-git: CVE-2022-24439 fix from PR 1518
+
+Fix command injection
+Add `--` in some commands that receive user input
+and if interpreted as options could lead to remote
+code execution (RCE).
+
+There may be more commands that could benefit from `--`
+so the input is never interpreted as an option,
+but most of those aren't dangerous.
+
+Fixed commands:
+
+- push
+- pull
+- fetch
+- clone/clone_from and friends
+- archive (not sure if this one can be exploited, but it doesn't hurt
+  adding `--` :))
+
+For anyone using GitPython and exposing any of the GitPython methods to users,
+make sure to always validate the input (like if starts with `--`).
+And for anyone allowing users to pass arbitrary options, be aware
+that some options may lead fo RCE, like `--exc`, `--upload-pack`,
+`--receive-pack`, `--config` (#1516).
+
+Ref #1517
+
+CVE: CVE-2022-24439
+
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/pull/1518]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ git/remote.py    | 6 +++---
+ git/repo/base.py | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/git/remote.py b/git/remote.py
+index 56f3c5b..59681bc 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -881,7 +881,7 @@ class Remote(LazyMixin, IterableObj):
+         else:
+             args = [refspec]
+ 
+-        proc = self.repo.git.fetch(self, *args, as_process=True, with_stdout=False,
++        proc = self.repo.git.fetch("--", self, *args, as_process=True, with_stdout=False,
+                                    universal_newlines=True, v=verbose, **kwargs)
+         res = self._get_fetch_info_from_stderr(proc, progress,
+                                                kill_after_timeout=kill_after_timeout)
+@@ -905,7 +905,7 @@ class Remote(LazyMixin, IterableObj):
+             # No argument refspec, then ensure the repo's config has a fetch refspec.
+             self._assert_refspec()
+         kwargs = add_progress(kwargs, self.repo.git, progress)
+-        proc = self.repo.git.pull(self, refspec, with_stdout=False, as_process=True,
++        proc = self.repo.git.pull("--", self, refspec, with_stdout=False, as_process=True,
+                                   universal_newlines=True, v=True, **kwargs)
+         res = self._get_fetch_info_from_stderr(proc, progress,
+                                                kill_after_timeout=kill_after_timeout)
+@@ -945,7 +945,7 @@ class Remote(LazyMixin, IterableObj):
+             If the operation fails completely, the length of the returned IterableList will
+             be 0."""
+         kwargs = add_progress(kwargs, self.repo.git, progress)
+-        proc = self.repo.git.push(self, refspec, porcelain=True, as_process=True,
++        proc = self.repo.git.push("--", self, refspec, porcelain=True, as_process=True,
+                                   universal_newlines=True,
+                                   kill_after_timeout=kill_after_timeout,
+                                   **kwargs)
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 7713c91..f14f929 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1072,7 +1072,7 @@ class Repo(object):
+         multi = None
+         if multi_options:
+             multi = shlex.split(' '.join(multi_options))
+-        proc = git.clone(multi, Git.polish_url(str(url)), clone_path, with_extended_output=True, as_process=True,
++        proc = git.clone("--", multi, Git.polish_url(str(url)), clone_path, with_extended_output=True, as_process=True,
+                          v=True, universal_newlines=True, **add_progress(kwargs, git, progress))
+         if progress:
+             handle_process_output(proc, None, to_progress_instance(progress).new_message_handler(),
+@@ -1173,7 +1173,7 @@ class Repo(object):
+         if not isinstance(path, (tuple, list)):
+             path = [path]
+         # end assure paths is list
+-        self.git.archive(treeish, *path, **kwargs)
++        self.git.archive("--", treeish, *path, **kwargs)
+         return self
+ 
+     def has_separate_working_tree(self) -> bool:
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
new file mode 100644
index 0000000000..e3e66ec450
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
@@ -0,0 +1,488 @@
+From fe9b71628767610a238e47cd46b82d411a7e871a Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Sat, 7 Jan 2023 17:16:57 +0000
+Subject: [PATCH] python3-git: CVE-2022-24439 fix from PR 1521
+
+Forbid unsafe protocol URLs in Repo.clone{,_from}()
+Since the URL is passed directly to git clone, and the remote-ext helper
+will happily execute shell commands, so by default disallow URLs that
+contain a "::" unless a new unsafe_protocols kwarg is passed.
+(CVE-2022-24439)
+
+Fixes #1515
+
+CVE: CVE-2022-24439
+
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/pull/1521]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ git/cmd.py                    | 51 ++++++++++++++++++++++++--
+ git/exc.py                    |  8 ++++
+ git/objects/submodule/base.py | 19 ++++++----
+ git/remote.py                 | 69 +++++++++++++++++++++++++++++++----
+ git/repo/base.py              | 44 ++++++++++++++++++----
+ 5 files changed, 166 insertions(+), 25 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 4f05698..77026d6 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -4,6 +4,7 @@
+ # This module is part of GitPython and is released under
+ # the BSD License: http://www.opensource.org/licenses/bsd-license.php
+ from __future__ import annotations
++import re
+ from contextlib import contextmanager
+ import io
+ import logging
+@@ -31,7 +32,9 @@ from git.util import is_cygwin_git, cygpath, expand_path, remove_password_if_pre
+ 
+ from .exc import (
+     GitCommandError,
+-    GitCommandNotFound
++    GitCommandNotFound,
++    UnsafeOptionError, 
++    UnsafeProtocolError
+ )
+ from .util import (
+     LazyMixin,
+@@ -225,6 +228,8 @@ class Git(LazyMixin):
+ 
+     _excluded_ = ('cat_file_all', 'cat_file_header', '_version_info')
+ 
++    re_unsafe_protocol = re.compile("(.+)::.+")
++
+     def __getstate__(self) -> Dict[str, Any]:
+         return slots_to_dict(self, exclude=self._excluded_)
+ 
+@@ -400,6 +405,44 @@ class Git(LazyMixin):
+             url = url.replace("\\\\", "\\").replace("\\", "/")
+         return url
+ 
++    @classmethod
++    def check_unsafe_protocols(cls, url: str) -> None:
++        """
++        Check for unsafe protocols.
++        Apart from the usual protocols (http, git, ssh),
++        Git allows "remote helpers" that have the form `<transport>::<address>`,
++        one of these helpers (`ext::`) can be used to invoke any arbitrary command.
++        See:
++        - https://git-scm.com/docs/gitremote-helpers
++        - https://git-scm.com/docs/git-remote-ext
++        """
++        match = cls.re_unsafe_protocol.match(url)
++        if match:
++            protocol = match.group(1)
++            raise UnsafeProtocolError(
++                f"The `{protocol}::` protocol looks suspicious, use `allow_unsafe_protocols=True` to allow it."
++            )
++
++    @classmethod
++    def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
++        """
++        Check for unsafe options.
++        Some options that are passed to `git <command>` can be used to execute
++        arbitrary commands, this are blocked by default.
++        """
++        # Options can be of the form `foo` or `--foo bar` `--foo=bar`,
++        # so we need to check if they start with "--foo" or if they are equal to "foo".
++        bare_unsafe_options = [
++            option.lstrip("-")
++            for option in unsafe_options
++        ]
++        for option in options:
++            for unsafe_option, bare_option in zip(unsafe_options, bare_unsafe_options):
++                if option.startswith(unsafe_option) or option == bare_option:
++                    raise UnsafeOptionError(
++                        f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                    )
++
+     class AutoInterrupt(object):
+         """Kill/Interrupt the stored process instance once this instance goes out of scope. It is
+         used to prevent processes piling up in case iterators stop reading.
+@@ -1068,12 +1111,12 @@ class Git(LazyMixin):
+         return args
+ 
+     @classmethod
+-    def __unpack_args(cls, arg_list: Sequence[str]) -> List[str]:
++    def _unpack_args(cls, arg_list: Sequence[str]) -> List[str]:
+ 
+         outlist = []
+         if isinstance(arg_list, (list, tuple)):
+             for arg in arg_list:
+-                outlist.extend(cls.__unpack_args(arg))
++                outlist.extend(cls._unpack_args(arg))
+         else:
+             outlist.append(str(arg_list))
+ 
+@@ -1154,7 +1197,7 @@ class Git(LazyMixin):
+         # Prepare the argument list
+ 
+         opt_args = self.transform_kwargs(**opts_kwargs)
+-        ext_args = self.__unpack_args([a for a in args if a is not None])
++        ext_args = self._unpack_args([a for a in args if a is not None])
+ 
+         if insert_after_this_arg is None:
+             args_list = opt_args + ext_args
+diff --git a/git/exc.py b/git/exc.py
+index e8ff784..5c96db2 100644
+--- a/git/exc.py
++++ b/git/exc.py
+@@ -36,6 +36,14 @@ class NoSuchPathError(GitError, OSError):
+     """ Thrown if a path could not be access by the system. """
+ 
+ 
++class UnsafeProtocolError(GitError):
++    """Thrown if unsafe protocols are passed without being explicitly allowed."""
++
++
++class UnsafeOptionError(GitError):
++    """Thrown if unsafe options are passed without being explicitly allowed."""
++
++
+ class CommandError(GitError):
+     """Base class for exceptions thrown at every stage of `Popen()` execution.
+ 
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index f782045..deb224e 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -264,7 +264,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # end
+ 
+     @classmethod
+-    def _clone_repo(cls, repo: 'Repo', url: str, path: PathLike, name: str, **kwargs: Any) -> 'Repo':
++    def _clone_repo(cls, repo: 'Repo', url: str, path: PathLike, name: str,
++            allow_unsafe_options: bool = False, allow_unsafe_protocols: bool = False,**kwargs: Any) -> 'Repo':
+         """:return: Repo instance of newly cloned repository
+         :param repo: our parent repository
+         :param url: url to clone from
+@@ -281,7 +282,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+             module_checkout_path = osp.join(str(repo.working_tree_dir), path)
+         # end
+ 
+-        clone = git.Repo.clone_from(url, module_checkout_path, **kwargs)
++        clone = git.Repo.clone_from(url, module_checkout_path, allow_unsafe_options=allow_unsafe_options, 
++                allow_unsafe_protocols=allow_unsafe_protocols, **kwargs)
+         if cls._need_gitfile_submodules(repo.git):
+             cls._write_git_file_and_module_config(module_checkout_path, module_abspath)
+         # end
+@@ -338,8 +340,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+     @classmethod
+     def add(cls, repo: 'Repo', name: str, path: PathLike, url: Union[str, None] = None,
+             branch: Union[str, None] = None, no_checkout: bool = False, depth: Union[int, None] = None,
+-            env: Union[Mapping[str, str], None] = None, clone_multi_options: Union[Sequence[TBD], None] = None
+-            ) -> 'Submodule':
++            env: Union[Mapping[str, str], None] = None, clone_multi_options: Union[Sequence[TBD], None] = None,
++            allow_unsafe_options: bool = False, allow_unsafe_protocols: bool = False,) -> 'Submodule':
+         """Add a new submodule to the given repository. This will alter the index
+         as well as the .gitmodules file, but will not create a new commit.
+         If the submodule already exists, no matter if the configuration differs
+@@ -447,7 +449,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+                 kwargs['multi_options'] = clone_multi_options
+ 
+             # _clone_repo(cls, repo, url, path, name, **kwargs):
+-            mrepo = cls._clone_repo(repo, url, path, name, env=env, **kwargs)
++            mrepo = cls._clone_repo(repo, url, path, name, env=env, allow_unsafe_options=allow_unsafe_options,
++                allow_unsafe_protocols=allow_unsafe_protocols, **kwargs)
+         # END verify url
+ 
+         ## See #525 for ensuring git urls in config-files valid under Windows.
+@@ -484,7 +487,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+     def update(self, recursive: bool = False, init: bool = True, to_latest_revision: bool = False,
+                progress: Union['UpdateProgress', None] = None, dry_run: bool = False,
+                force: bool = False, keep_going: bool = False, env: Union[Mapping[str, str], None] = None,
+-               clone_multi_options: Union[Sequence[TBD], None] = None) -> 'Submodule':
++               clone_multi_options: Union[Sequence[TBD], None] = None, allow_unsafe_options: bool = False,
++               allow_unsafe_protocols: bool = False) -> 'Submodule':
+         """Update the repository of this submodule to point to the checkout
+         we point at with the binsha of this instance.
+ 
+@@ -585,7 +589,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+                                 (self.url, checkout_module_abspath, self.name))
+                 if not dry_run:
+                     mrepo = self._clone_repo(self.repo, self.url, self.path, self.name, n=True, env=env,
+-                                             multi_options=clone_multi_options)
++                            multi_options=clone_multi_options, allow_unsafe_options=allow_unsafe_options,
++                            allow_unsafe_protocols=allow_unsafe_protocols)
+                 # END handle dry-run
+                 progress.update(END | CLONE, 0, 1, prefix + "Done cloning to %s" % checkout_module_abspath)
+ 
+diff --git a/git/remote.py b/git/remote.py
+index 59681bc..cea6b99 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -473,6 +473,23 @@ class Remote(LazyMixin, IterableObj):
+     __slots__ = ("repo", "name", "_config_reader")
+     _id_attribute_ = "name"
+ 
++    unsafe_git_fetch_options = [
++        # This option allows users to execute arbitrary commands.
++        # https://git-scm.com/docs/git-fetch#Documentation/git-fetch.txt---upload-packltupload-packgt
++        "--upload-pack",
++    ]
++    unsafe_git_pull_options = [
++        # This option allows users to execute arbitrary commands.
++        # https://git-scm.com/docs/git-pull#Documentation/git-pull.txt---upload-packltupload-packgt
++        "--upload-pack"
++    ]
++    unsafe_git_push_options = [
++        # This option allows users to execute arbitrary commands.
++        # https://git-scm.com/docs/git-push#Documentation/git-push.txt---execltgit-receive-packgt
++        "--receive-pack",
++        "--exec",
++    ]
++
+     def __init__(self, repo: 'Repo', name: str) -> None:
+         """Initialize a remote instance
+ 
+@@ -549,7 +566,8 @@ class Remote(LazyMixin, IterableObj):
+             yield Remote(repo, section[lbound + 1:rbound])
+         # END for each configuration section
+ 
+-    def set_url(self, new_url: str, old_url: Optional[str] = None, **kwargs: Any) -> 'Remote':
++    def set_url(self, new_url: str, old_url: Optional[str] = None, 
++            allow_unsafe_protocols: bool = False, **kwargs: Any) -> 'Remote':
+         """Configure URLs on current remote (cf command git remote set_url)
+ 
+         This command manages URLs on the remote.
+@@ -558,15 +576,17 @@ class Remote(LazyMixin, IterableObj):
+         :param old_url: when set, replaces this URL with new_url for the remote
+         :return: self
+         """
++        if not allow_unsafe_protocols:
++            Git.check_unsafe_protocols(new_url)
+         scmd = 'set-url'
+         kwargs['insert_kwargs_after'] = scmd
+         if old_url:
+-            self.repo.git.remote(scmd, self.name, new_url, old_url, **kwargs)
++            self.repo.git.remote(scmd, "--", self.name, new_url, old_url, **kwargs)
+         else:
+-            self.repo.git.remote(scmd, self.name, new_url, **kwargs)
++            self.repo.git.remote(scmd, "--", self.name, new_url, **kwargs)
+         return self
+ 
+-    def add_url(self, url: str, **kwargs: Any) -> 'Remote':
++    def add_url(self, url: str, allow_unsafe_protocols: bool = False, **kwargs: Any) -> 'Remote':
+         """Adds a new url on current remote (special case of git remote set_url)
+ 
+         This command adds new URLs to a given remote, making it possible to have
+@@ -575,7 +595,7 @@ class Remote(LazyMixin, IterableObj):
+         :param url: string being the URL to add as an extra remote URL
+         :return: self
+         """
+-        return self.set_url(url, add=True)
++        return self.set_url(url, add=True, allow_unsafe_protocols=allow_unsafe_protocols)
+ 
+     def delete_url(self, url: str, **kwargs: Any) -> 'Remote':
+         """Deletes a new url on current remote (special case of git remote set_url)
+@@ -667,7 +687,7 @@ class Remote(LazyMixin, IterableObj):
+         return out_refs
+ 
+     @ classmethod
+-    def create(cls, repo: 'Repo', name: str, url: str, **kwargs: Any) -> 'Remote':
++    def create(cls, repo: 'Repo', name: str, url: str, allow_unsafe_protocols: bool = False, *kwargs: Any) -> 'Remote':
+         """Create a new remote to the given repository
+         :param repo: Repository instance that is to receive the new remote
+         :param name: Desired name of the remote
+@@ -677,7 +697,10 @@ class Remote(LazyMixin, IterableObj):
+         :raise GitCommandError: in case an origin with that name already exists"""
+         scmd = 'add'
+         kwargs['insert_kwargs_after'] = scmd
+-        repo.git.remote(scmd, name, Git.polish_url(url), **kwargs)
++         url = Git.polish_url(url)
++        if not allow_unsafe_protocols:
++            Git.check_unsafe_protocols(url)
++        repo.git.remote(scmd, "--", name, url, **kwargs)
+         return cls(repo, name)
+ 
+     # add is an alias
+@@ -840,6 +863,8 @@ class Remote(LazyMixin, IterableObj):
+               progress: Union[RemoteProgress, None, 'UpdateProgress'] = None,
+               verbose: bool = True,
+               kill_after_timeout: Union[None, float] = None,
++              allow_unsafe_protocols: bool = False,
++              allow_unsafe_options: bool = False,
+               **kwargs: Any) -> IterableList[FetchInfo]:
+         """Fetch the latest changes for this remote
+ 
+@@ -881,6 +906,14 @@ class Remote(LazyMixin, IterableObj):
+         else:
+             args = [refspec]
+ 
++        if not allow_unsafe_protocols:
++            for ref in args:
++                if ref:
++                    Git.check_unsafe_protocols(ref)
++
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_fetch_options)
++
+         proc = self.repo.git.fetch("--", self, *args, as_process=True, with_stdout=False,
+                                    universal_newlines=True, v=verbose, **kwargs)
+         res = self._get_fetch_info_from_stderr(proc, progress,
+@@ -892,6 +925,8 @@ class Remote(LazyMixin, IterableObj):
+     def pull(self, refspec: Union[str, List[str], None] = None,
+              progress: Union[RemoteProgress, 'UpdateProgress', None] = None,
+              kill_after_timeout: Union[None, float] = None,
++             allow_unsafe_protocols: bool = False,
++             allow_unsafe_options: bool = False,
+              **kwargs: Any) -> IterableList[FetchInfo]:
+         """Pull changes from the given branch, being the same as a fetch followed
+         by a merge of branch with your local branch.
+@@ -905,6 +940,15 @@ class Remote(LazyMixin, IterableObj):
+             # No argument refspec, then ensure the repo's config has a fetch refspec.
+             self._assert_refspec()
+         kwargs = add_progress(kwargs, self.repo.git, progress)
++
++        refspec = Git._unpack_args(refspec or [])
++        if not allow_unsafe_protocols:
++            for ref in refspec:
++                Git.check_unsafe_protocols(ref)
++
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_pull_options)
++
+         proc = self.repo.git.pull("--", self, refspec, with_stdout=False, as_process=True,
+                                   universal_newlines=True, v=True, **kwargs)
+         res = self._get_fetch_info_from_stderr(proc, progress,
+@@ -916,6 +960,8 @@ class Remote(LazyMixin, IterableObj):
+     def push(self, refspec: Union[str, List[str], None] = None,
+              progress: Union[RemoteProgress, 'UpdateProgress', Callable[..., RemoteProgress], None] = None,
+              kill_after_timeout: Union[None, float] = None,
++             allow_unsafe_protocols: bool = False,
++             allow_unsafe_options: bool = False,
+              **kwargs: Any) -> IterableList[PushInfo]:
+         """Push changes from source branch in refspec to target branch in refspec.
+ 
+@@ -945,6 +991,15 @@ class Remote(LazyMixin, IterableObj):
+             If the operation fails completely, the length of the returned IterableList will
+             be 0."""
+         kwargs = add_progress(kwargs, self.repo.git, progress)
++
++        refspec = Git._unpack_args(refspec or [])
++        if not allow_unsafe_protocols:
++            for ref in refspec:
++                Git.check_unsafe_protocols(ref)
++
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_push_options)
++
+         proc = self.repo.git.push("--", self, refspec, porcelain=True, as_process=True,
+                                   universal_newlines=True,
+                                   kill_after_timeout=kill_after_timeout,
+diff --git a/git/repo/base.py b/git/repo/base.py
+index f14f929..7b3565b 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -24,7 +24,11 @@ from git.compat import (
+ )
+ from git.config import GitConfigParser
+ from git.db import GitCmdObjectDB
+-from git.exc import InvalidGitRepositoryError, NoSuchPathError, GitCommandError
++from git.exc import (
++    GitCommandError,
++    InvalidGitRepositoryError,
++    NoSuchPathError,
++)
+ from git.index import IndexFile
+ from git.objects import Submodule, RootModule, Commit
+ from git.refs import HEAD, Head, Reference, TagReference
+@@ -97,6 +101,18 @@ class Repo(object):
+     re_author_committer_start = re.compile(r'^(author|committer)')
+     re_tab_full_line = re.compile(r'^\t(.*)$')
+ 
++    unsafe_git_clone_options = [
++        # This option allows users to execute arbitrary commands.
++        # https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---upload-packltupload-packgt
++        "--upload-pack",
++        "-u",
++        # Users can override configuration variables
++        # like `protocol.allow` or `core.gitProxy` to execute arbitrary commands.
++        # https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
++        "--config",
++        "-c",
++    ]
++
+     # invariants
+     # represents the configuration level of a configuration file
+     config_level: ConfigLevels_Tup = ("system", "user", "global", "repository")
+@@ -1049,7 +1065,8 @@ class Repo(object):
+     @ classmethod
+     def _clone(cls, git: 'Git', url: PathLike, path: PathLike, odb_default_type: Type[GitCmdObjectDB],
+                progress: Union['RemoteProgress', 'UpdateProgress', Callable[..., 'RemoteProgress'], None] = None,
+-               multi_options: Optional[List[str]] = None, **kwargs: Any
++               multi_options: Optional[List[str]] = None, allow_unsafe_protocols: bool = False,
++               allow_unsafe_options: bool = False, **kwargs: Any
+                ) -> 'Repo':
+         odbt = kwargs.pop('odbt', odb_default_type)
+ 
+@@ -1072,6 +1089,12 @@ class Repo(object):
+         multi = None
+         if multi_options:
+             multi = shlex.split(' '.join(multi_options))
++
++        if not allow_unsafe_protocols:
++            Git.check_unsafe_protocols(str(url))
++        if not allow_unsafe_options and multi_options:
++            Git.check_unsafe_options(options=multi_options, unsafe_options=cls.unsafe_git_clone_options)
++
+         proc = git.clone("--", multi, Git.polish_url(str(url)), clone_path, with_extended_output=True, as_process=True,
+                          v=True, universal_newlines=True, **add_progress(kwargs, git, progress))
+         if progress:
+@@ -1107,7 +1130,9 @@ class Repo(object):
+         return repo
+ 
+     def clone(self, path: PathLike, progress: Optional[Callable] = None,
+-              multi_options: Optional[List[str]] = None, **kwargs: Any) -> 'Repo':
++              multi_options: Optional[List[str]] = None, unsafe_protocols: bool = False, 
++              allow_unsafe_protocols: bool = False, allow_unsafe_options: bool = False, 
++              **kwargs: Any) -> 'Repo':
+         """Create a clone from this repository.
+ 
+         :param path: is the full path of the new repo (traditionally ends with ./<name>.git).
+@@ -1116,18 +1141,21 @@ class Repo(object):
+             option per list item which is passed exactly as specified to clone.
+             For example ['--config core.filemode=false', '--config core.ignorecase',
+             '--recurse-submodule=repo1_path', '--recurse-submodule=repo2_path']
++        :param unsafe_protocols: Allow unsafe protocols to be used, like ex
+         :param kwargs:
+             * odbt = ObjectDatabase Type, allowing to determine the object database
+               implementation used by the returned Repo instance
+             * All remaining keyword arguments are given to the git-clone command
+ 
+         :return: ``git.Repo`` (the newly cloned repo)"""
+-        return self._clone(self.git, self.common_dir, path, type(self.odb), progress, multi_options, **kwargs)
++        return self._clone(self.git, self.common_dir, path, type(self.odb), progress, multi_options,
++                allow_unsafe_protocols=allow_unsafe_protocols, allow_unsafe_options=allow_unsafe_options, **kwargs)
+ 
+     @ classmethod
+     def clone_from(cls, url: PathLike, to_path: PathLike, progress: Optional[Callable] = None,
+-                   env: Optional[Mapping[str, str]] = None,
+-                   multi_options: Optional[List[str]] = None, **kwargs: Any) -> 'Repo':
++                   env: Optional[Mapping[str, str]] = None, multi_options: Optional[List[str]] = None, 
++                   unsafe_protocols: bool = False, allow_unsafe_protocols: bool = False,
++                   allow_unsafe_options: bool = False, **kwargs: Any) -> 'Repo':
+         """Create a clone from the given URL
+ 
+         :param url: valid git url, see http://www.kernel.org/pub/software/scm/git/docs/git-clone.html#URLS
+@@ -1140,12 +1168,14 @@ class Repo(object):
+             If you want to unset some variable, consider providing empty string
+             as its value.
+         :param multi_options: See ``clone`` method
++        :param unsafe_protocols: Allow unsafe protocols to be used, like ext
+         :param kwargs: see the ``clone`` method
+         :return: Repo instance pointing to the cloned directory"""
+         git = cls.GitCommandWrapperType(os.getcwd())
+         if env is not None:
+             git.update_environment(**env)
+-        return cls._clone(git, url, to_path, GitCmdObjectDB, progress, multi_options, **kwargs)
++        return cls._clone(git, url, to_path, GitCmdObjectDB, progress, multi_options, 
++                allow_unsafe_protocols=allow_unsafe_protocols, allow_unsafe_options=allow_unsafe_options, **kwargs)
+ 
+     def archive(self, ostream: Union[TextIO, BinaryIO], treeish: Optional[str] = None,
+                 prefix: Optional[str] = None, **kwargs: Any) -> Repo:
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-git_3.1.27.bb b/meta/recipes-devtools/python/python3-git_3.1.27.bb
index fb1bae8f8e..1bd1426926 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.27.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.27.bb
@@ -12,6 +12,10 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch \
+            file://0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch \
+           "
+
 SRC_URI[sha256sum] = "1c885ce809e8ba2d88a29befeb385fcea06338d3640712b59ca623c220bb5704"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
-- 
2.32.0


