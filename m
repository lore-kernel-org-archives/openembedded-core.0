Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DD6CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15558.1792129268989783422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GAvVRn9Z;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16700; q=dns/txt;
  s=iport01; t=1792129270; x=1793338870;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OmqMAiRqm8bIIcWcj75GUuaEGHb7d7aepcY0/F9CLyY=;
  b=GAvVRn9ZeRd2IVt+4Qhs10Q4VXonG6jxLV5lu962gQ7G1SR/1Cr302wk
   vE9ccmJ/OixjWyH7/sMgcwYiutsK8M7gUnkfeMuGr5rYBDj5Z+hvGSE4a
   o6VNxOWXsnCI+LaidRV+YRkjiVY0aKahWEzRWAKBdKFhc4fPImjfo8TrE
   ZFZLrUi+r2GA7MMuDTDkHCOQbxYpGGSkOmNj5o1T+5Z15m1DS5+hmEozJ
   BS57lFJuVMzvXYHWZJYOCj5BboyU+urZX1fYmkP7IJHmYuo9Iv3RMMelp
   r3r2fb930HVk0k9B7W3LgGPRWDgRfBAxb0ZJj0BMpCt5wr/OwkReqHZ1u
   g==;
X-CSE-ConnectionGUID: P32v5/W0QI+cM3aUiz6+0Q==
X-CSE-MsgGUID: oYc05EtGTzWNcSIO+CME+Q==
X-IPAS-Result: =?us-ascii?q?A0BLAgCRt9Fq/5P/Ja1aglmCV3VgQ0mUKYIhA5FKgVSKf?=
 =?us-ascii?q?hSBag8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rHQEFCBkegmQBgjoDN?=
 =?us-ascii?q?wMRvHeBeTOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBhHwnG4FJRIEVg?=
 =?us-ascii?q?TuCLoEFgVwBAYFGBIZbBIMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoIYOwsHATwbNgErF3oHAwUtGBMFCwMIHgwRkxQCB5I2oQ+EKIwih?=
 =?us-ascii?q?yeOExozhASBV5JAklQLmH2OCpUzMAQLEE2EaYFoPIEoGwQLBzMaCBsVgyIJS?=
 =?us-ascii?q?hkPjisOC4NggX+DZch2JzICCTIBAQcCBw4DC4FokAEBJgeBTwEB?=
IronPort-Data: A9a23:z6yXea29JxZD2x46kPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2MCx
 zRKUW2FP/7fZ2XxKYslbI2x8koBu8CBzocwTQVl3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNBpsI9Bfxb5OICJF0
 KcRFTEfMFPbvrfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsiuK1aIGKIIbiqcN9mXeT/
 j/r40vFEC48P+e+7nmu11/vv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:huW/1qmwMZx7eNiR9hsLBRF56fDpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:GJswK207G26ouLX04rPu57xfIpt/bCCa8y/pAgyzLD1gdbyHFxzIwfYx
X-Talos-MUID: 9a23:K3AG6wknwxwR9APAo3WwdnplBcwwvomyJ3wfrrMNgOijdgdVFnSk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522003722"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 60D3118000A6D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id ADB46CBF204; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 24/27] python3-git: fix CVE-2026-87817
Date: Thu, 15 Oct 2026 22:41:03 -0700
Message-Id: <20261016054106.210444-25-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247954

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-87817

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-87817.patch   | 394 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 395 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
new file mode 100644
index 0000000000..cb7bc322b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
@@ -0,0 +1,394 @@
+From cdfa4af79da77cb35c8a0a9629573eb46a8c6869 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 25 Aug 2026 04:57:29 +0200
+Subject: [PATCH] fix: prefer `.git` during repository discovery
+
+<!-- agent -->
+GitPython considered worktree administration and bare-repository signatures
+before a worktree's real .git entry. Align discovery with Git so .git files
+and directories win, malformed .git files stop discovery, and candidate git
+directories validate HEAD plus commondir-backed object and ref storage. This
+addresses GHSA-239g-whfq-7xj9.
+
+Regression coverage compares ambiguous layouts with git rev-parse and rejects
+invalid HEAD/.git metadata.
+
+Git baseline: 15c6308cf7ad276b306aa5b3ababfbdebfb1a917; setup.c
+setup_git_directory_gently_1(), is_git_directory(), and validate_headref().
+
+Repository validation can use GIT_COMMON_DIR for refs and objects. Preserve the
+same value on Repo so later config, ref, and object access uses the directory
+that made discovery succeed.
+
+Capture GIT_COMMON_DIR before the first repository config read so bare-state
+detection uses the same metadata location as discovery. Resolve relative
+environment values immediately so later working-directory changes cannot
+retarget the Repo.
+
+Review feedback: relative GIT_COMMON_DIR left Git subprocesses resolving GIT_DIR
+and GIT_COMMON_DIR from a different working directory; malformed commondir data,
+empty GIT_OBJECT_DIRECTORY, and the linked-worktree signature were also handled
+inconsistently.
+
+Pin the repository environment to resolved paths, reject invalid
+metadata without consulting the process working directory, and
+restore HEAD-based linked-worktree detection. Keep the loose HEAD
+and dangling .git behavior because both match Git setup.c at baseline
+15c6308cf7ad276b306aa5b3ababfbdebfb1a917.
+
+Review feedback identified that chained or self-referential .git pointers
+recurse, filesystem-encoded metadata can fail text decoding, and a relative
+GIT_DIR is not retained for later Git commands.
+
+Parse one regular, size-bounded Gitfile exactly once, decode Gitfile and
+commondir paths with the filesystem codec, and retain the resolved GIT_DIR
+for subprocesses. This rejects cycles like Git instead of recursing and keeps
+commands stable after working-directory changes.
+
+Review feedback noted that a dangling commondir symlink was treated as absent,
+allowing local objects and refs to validate the repository.
+
+Distinguish a truly missing commondir from a dangling symlink. This follows
+Git's get_common_dir_noenv(), whose file_exists check uses lstat before
+attempting to read the entry.
+
+Python 3.9 on Windows raised UnicodeDecodeError while the repository-discovery
+regression test parsed invalid commondir bytes, causing the Python package test
+(windows, 3.9) check to fail.
+
+Treat UnicodeError like an unreadable metadata file in both commondir and
+gitfile parsing. Invalid bytes now make discovery reject the candidate
+repository, matching Git's behavior.
+
+Review feedback noted that GIT_OBJECT_DIRECTORY made discovery succeed without
+becoming the Repo ODB root, while a relative value could later be resolved from
+the Git wrapper's different working directory.
+
+Resolve the environment value against the construction directory, use it as the
+ODB root, and preserve the absolute value for later Git commands. The regression
+moves the only object store outside the git directory and verifies access
+through both GitDB and git cat-file after the original environment and current
+directory are restored.
+
+Review feedback identified four setup mismatches: non-missing .git stat failures
+could fall through to another repository, explicit GIT_DIR could be redirected
+through a nested .git entry, Gitfile reads were not bounded to the stat-reported
+size, and alternates ignored GIT_OBJECT_DIRECTORY.
+
+Match Git setup.c by bypassing discovery for an environment-selected GIT_DIR,
+stopping discovery when Gitfile stat fails for reasons other than a missing
+path, and reading exactly the previously observed Gitfile size. Resolve
+alternates below the active ODB root so custom object stores remain internally
+consistent.
+
+The commit review noted that treating every present GIT_DIR as explicit broke
+two documented cases: an empty GIT_DIR must fall back to current-directory
+discovery, while an empty Repo path must still use a nonempty GIT_DIR.
+
+CVE: CVE-2026-87817
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b]
+
+Backport Changes:
+- Omitted test/test_repo.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does 
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 89 ++++++++++++++++++++++++++++++++---------------
+ git/repo/fun.py  | 90 +++++++++++++++++++++++++++++++++---------------
+ 2 files changed, 124 insertions(+), 55 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index d8cc5306..7543e3cc 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -45,7 +45,6 @@ from git.util import (
+ 
+ from .fun import (
+     find_submodule_git_dir,
+-    find_worktree_git_dir,
+     is_git_dir,
+     rev_parse,
+     touch,
+@@ -227,6 +226,10 @@ class Repo:
+     ) -> None:
+         R"""Create a new :class:`Repo` instance.
+ 
++        .. note::
++            Repositories using reftable may be opened, but GitPython's direct reference
++            access does not support reftable.
++
+         :param path:
+             The path to either the root git directory or the bare git repo::
+ 
+@@ -261,7 +264,11 @@ class Repo:
+             :class:`Repo`
+         """
+ 
+-        epath = path or os.getenv("GIT_DIR")
++        git_dir_env = os.getenv("GIT_DIR")
++        object_dir_env = os.getenv("GIT_OBJECT_DIRECTORY")
++        if object_dir_env is not None:
++            object_dir_env = osp.abspath(object_dir_env)
++        epath = path or git_dir_env
+         if not epath:
+             epath = os.getcwd()
+         if Git.is_cygwin():
+@@ -285,15 +292,47 @@ class Repo:
+                 raise NoSuchPathError(epath)
+ 
+         # Walk up the path to find the `.git` dir.
+-        curpath = epath
+-        git_dir = None
++        curpath = os.fspath(epath) if epath is not None else ""
++        git_dir: Optional[str] = None
++        explicit_git_dir = not path and bool(git_dir_env)
+         while curpath:
+             # ABOUT osp.NORMPATH
+             # It's important to normalize the paths, as submodules will otherwise
+             # initialize their repo instances with paths that depend on path-portions
+             # that will not exist after being removed. It's just cleaner.
++            if not explicit_git_dir:
++                dotgit = osp.join(curpath, ".git")
++                try:
++                    sm_gitpath = find_submodule_git_dir(dotgit)
++                except OSError:
++                    break
++                if sm_gitpath is not None:
++                    # Worktrees can use relative paths as of Git 2.48, so join to curpath.
++                    git_dir = osp.normpath(osp.join(curpath, os.fspath(sm_gitpath)))
++                    self._working_tree_dir = curpath
++                    break
++
++                # Like Git, do not fall back to a bare repository or parent directory when
++                # a non-directory .git entry exists but is not a valid gitfile.
++                if osp.exists(dotgit) and not osp.isdir(dotgit):
++                    break
+             if is_git_dir(curpath):
+                 git_dir = curpath
++                if osp.isfile(osp.join(curpath, "gitdir")) and osp.isfile(osp.join(curpath, "commondir")):
++                    if "GIT_WORK_TREE" in os.environ:
++                        self._working_tree_dir = os.getenv("GIT_WORK_TREE")
++                    else:
++                        # Linked worktree administrative directories store the path to
++                        # the worktree's .git file in gitdir (without a "gitdir: " prefix).
++                        with open(osp.join(git_dir, "gitdir")) as fp:
++                            worktree_gitfile = fp.read().strip()
++
++                        if not osp.isabs(worktree_gitfile):
++                            worktree_gitfile = osp.normpath(osp.join(git_dir, worktree_gitfile))
++
++                        self._working_tree_dir = osp.dirname(worktree_gitfile)
++                    break
++
+                 # from man git-config : core.worktree
+                 # Set the path to the root of the working tree. If GIT_COMMON_DIR
+                 # environment variable is set, core.worktree is ignored and not used for
+@@ -313,21 +352,7 @@ class Repo:
+                     self._working_tree_dir = os.getenv("GIT_WORK_TREE")
+                 break
+ 
+-            dotgit = osp.join(curpath, ".git")
+-            sm_gitpath = find_submodule_git_dir(dotgit)
+-            if sm_gitpath is not None:
+-                git_dir = osp.normpath(sm_gitpath)
+-
+-            sm_gitpath = find_submodule_git_dir(dotgit)
+-            if sm_gitpath is None:
+-                sm_gitpath = find_worktree_git_dir(dotgit)
+-
+-            if sm_gitpath is not None:
+-                git_dir = expand_path(sm_gitpath, expand_vars)
+-                self._working_tree_dir = curpath
+-                break
+-
+-            if not search_parent_directories:
++            if explicit_git_dir or not search_parent_directories:
+                 break
+             curpath, tail = osp.split(curpath)
+             if not tail:
+@@ -338,6 +363,16 @@ class Repo:
+             raise InvalidGitRepositoryError(epath)
+         self.git_dir = git_dir
+ 
++        common_dir_env = os.getenv("GIT_COMMON_DIR")
++        if common_dir_env is not None:
++            self._common_dir = osp.abspath(common_dir_env)
++        else:
++            try:
++                common_dir = os.fsdecode((Path(self.git_dir) / "commondir").read_bytes()).rstrip("\r\n")
++                self._common_dir = osp.join(self.git_dir, common_dir)
++            except OSError:
++                self._common_dir = ""
++
+         self._bare = False
+         try:
+             self._bare = self.config_reader("repository").getboolean("core", "bare")
+@@ -345,12 +380,6 @@ class Repo:
+             # Let's not assume the option exists, although it should.
+             pass
+ 
+-        try:
+-            common_dir = (Path(self.git_dir) / "commondir").read_text().splitlines()[0].strip()
+-            self._common_dir = osp.join(self.git_dir, common_dir)
+-        except OSError:
+-            self._common_dir = ""
+-
+         # Adjust the working directory in case we are actually bare - we didn't know
+         # that in the first place.
+         if self._bare:
+@@ -359,9 +388,15 @@ class Repo:
+ 
+         self.working_dir: PathLike = self._working_tree_dir or self.common_dir
+         self.git = self.GitCommandWrapperType(self.working_dir)
++        if common_dir_env is not None:
++            self.git.update_environment(GIT_DIR=os.fspath(self.git_dir), GIT_COMMON_DIR=os.fspath(self.common_dir))
++        elif git_dir_env is not None:
++            self.git.update_environment(GIT_DIR=os.fspath(self.git_dir))
++        if object_dir_env is not None:
++            self.git.update_environment(GIT_OBJECT_DIRECTORY=object_dir_env)
+ 
+         # Special handling, in special times.
+-        rootpath = osp.join(self.common_dir, "objects")
++        rootpath = object_dir_env if object_dir_env is not None else osp.join(self.common_dir, "objects")
+         if issubclass(odbt, GitCmdObjectDB):
+             self.odb = odbt(rootpath, self.git)
+         else:
+@@ -969,7 +1004,7 @@ class Repo:
+             The method does not check for the existence of the paths in `alts`, as the
+             caller is responsible.
+         """
+-        alternates_path = osp.join(self.common_dir, "objects", "info", "alternates")
++        alternates_path = osp.join(self.odb.root_path(), "info", "alternates")
+         if not alts:
+             if osp.isfile(alternates_path):
+                 os.remove(alternates_path)
+diff --git a/git/repo/fun.py b/git/repo/fun.py
+index e44d9c64..29faaf29 100644
+--- a/git/repo/fun.py
++++ b/git/repo/fun.py
+@@ -57,22 +57,61 @@ def touch(filename: str) -> str:
+ def is_git_dir(d: PathLike) -> bool:
+     """This is taken from the git setup.c:is_git_directory function.
+ 
++    .. note::
++        This function recognizes repositories using reftable through their
++        compatibility files, but GitPython's direct reference access does not support
++        reftable.
++
+     :raise git.exc.WorkTreeRepositoryUnsupported:
+         If it sees a worktree directory. It's quite hacky to do that here, but at least
+         clearly indicates that we don't support it. There is the unlikely danger to
+         throw if we see directories which just look like a worktree dir, but are none.
+     """
+     if osp.isdir(d):
+-        if (osp.isdir(osp.join(d, "objects")) or "GIT_OBJECT_DIRECTORY" in os.environ) and osp.isdir(
+-            osp.join(d, "refs")
+-        ):
+-            headref = osp.join(d, "HEAD")
+-            return osp.isfile(headref) or (osp.islink(headref) and os.readlink(headref).startswith("refs"))
+-        elif (
+-            osp.isfile(osp.join(d, "gitdir"))
+-            and osp.isfile(osp.join(d, "commondir"))
+-            and osp.isfile(osp.join(d, "gitfile"))
+-        ):
++        headref = osp.join(d, "HEAD")
++        if osp.islink(headref):
++            try:
++                valid_head = os.readlink(headref).startswith("refs/")
++            except OSError:
++                valid_head = False
++        else:
++            try:
++                with open(headref, "rb") as fp:
++                    head = fp.read(256)
++            except OSError:
++                valid_head = False
++            else:
++                valid_head = (head.startswith(b"ref:") and head[4:].lstrip().startswith(b"refs/")) or bool(
++                    re.match(rb"(?:[0-9A-Fa-f]{64}|[0-9A-Fa-f]{40})", head)
++                )
++
++        common_dir = os.getenv("GIT_COMMON_DIR")
++        if common_dir == "":
++            return False
++        if common_dir is None:
++            common_dir_file = Path(d) / "commondir"
++            try:
++                common_dir = os.fsdecode(common_dir_file.read_bytes()).rstrip("\r\n")
++            except FileNotFoundError:
++                if osp.lexists(common_dir_file):
++                    return False
++                common_dir = os.fspath(d)
++            except (OSError, UnicodeError):
++                return False
++            else:
++                if not common_dir:
++                    return False
++                try:
++                    common_dir = osp.realpath(osp.join(d, common_dir))
++                except (OSError, ValueError):
++                    return False
++
++        object_dir = os.getenv("GIT_OBJECT_DIRECTORY")
++        if object_dir is None:
++            object_dir = osp.join(common_dir, "objects")
++        if valid_head and osp.isdir(object_dir) and osp.isdir(osp.join(common_dir, "refs")):
++            return True
++        if osp.isfile(osp.join(d, "gitdir")) and osp.isfile(osp.join(d, "commondir")) and osp.isfile(headref):
+             raise WorkTreeRepositoryUnsupported(d)
+     return False
+ 
+@@ -81,19 +120,20 @@ def find_worktree_git_dir(dotgit: PathLike) -> Optional[str]:
+     """Search for a gitdir for this worktree."""
+     try:
+         statbuf = os.stat(dotgit)
+-    except OSError:
++    except (FileNotFoundError, NotADirectoryError):
+         return None
+-    if not stat.S_ISREG(statbuf.st_mode):
++    if not stat.S_ISREG(statbuf.st_mode) or statbuf.st_size > (1 << 20):
+         return None
+ 
+     try:
+-        lines = Path(dotgit).read_text().splitlines()
+-        for key, value in [line.strip().split(": ") for line in lines]:
+-            if key == "gitdir":
+-                return value
+-    except ValueError:
+-        pass
+-    return None
++        with open(dotgit, "rb") as fp:
++            content_bytes = fp.read(statbuf.st_size)
++        if len(content_bytes) != statbuf.st_size:
++            return None
++        content = os.fsdecode(content_bytes).rstrip("\r\n")
++    except (OSError, UnicodeError):
++        return None
++    return content[8:] if len(content) >= 9 and content.startswith("gitdir: ") else None
+ 
+ 
+ def find_submodule_git_dir(d: PathLike) -> Optional[PathLike]:
+@@ -101,15 +141,9 @@ def find_submodule_git_dir(d: PathLike) -> Optional[PathLike]:
+     if is_git_dir(d):
+         return d
+ 
+-    try:
+-        with open(d) as fp:
+-            content = fp.read().rstrip()
+-    except IOError:
+-        # It's probably not a file.
+-        pass
+-    else:
+-        if content.startswith("gitdir: "):
+-            path = content[8:]
++    path = find_worktree_git_dir(d)
++    if path is None:
++        return None
+ 
+             if Git.is_cygwin():
+                 # Cygwin creates submodules prefixed with `/cygdrive/...` suffixes.
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 0d9e7b0a9d..29c73287c2 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -47,6 +47,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78677.patch \
            file://CVE-2026-78676.patch \
            file://CVE-2026-78675.patch \
+           file://CVE-2026-87817.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


