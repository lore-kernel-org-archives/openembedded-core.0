Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471B8CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:32 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15900.1792131564578225035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hc8SeDHI;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18386; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VtZCo/ZRyfc8fUPzjExkLVlnUrGezvh2SuzzAgOtt5I=;
  b=hc8SeDHIIDKmod4GbwDFhKwg/elPPKyS0ZRFqQankPGzZHcKWQaOb5z/
   uLQ+vt2jtkeQe5VexFrfuXE/mkNaAmCiog4bdK5mB1IarAmCnwFW+9NmK
   VZAMDBY5g2lvO5ihAugJH+wHJ8aNN+oAn84cE750R5PrB+1BmaV6UVfZb
   UdVGrZcUKRJylek0TYjVD5+2u0+AYSkCuZS1T0ehhAK5xlpTmMdVqzU2y
   evK1r5jOVeh0dkaXR9K3MMc8cY3WDY5b3D0/yT2TrfW/gK0b+evsV3ENM
   6okqHTFGcclvSrjY45VOdK/cKsShtUIs1Y3vfxnnr9awbi0ZvetXQM6Cw
   A==;
X-CSE-ConnectionGUID: vW9yvto+TtazkxjCMWXzBQ==
X-CSE-MsgGUID: 23tsyBpxTty1eraI1oX+sQ==
X-IPAS-Result: =?us-ascii?q?A0BNAgDpwNFq/5H/Ja1aHgE8DA4LgVmCV3VgQ0mUKYIhA?=
 =?us-ascii?q?5FKgVSKfhSBag8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rHQEFCBkeg?=
 =?us-ascii?q?mQBgjoDNwMRvHaBeTOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIQ4J?=
 =?us-ascii?q?xuBSUSBFYE7gi6BBYFcAgIYgSwEhlsEgxwSgVqBA5RESIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCg?=
 =?us-ascii?q?lSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JB?=
 =?us-ascii?q?ykYDUgRLDcVGQQ+bgeSFB6CGDsLBwE8GzYBKxd6BwMFLRgTBQsDCB4MEZMTA?=
 =?us-ascii?q?QEBB5I2oQ+EKIwihyeOExozhASBV5JAklQLmH2OCpUzMAQLEE2EaYFoPIFDD?=
 =?us-ascii?q?wczGggbFTuCZwlKGQ+OKw4Lg2CFE1HIdicyAgkyAQEHAgcOAwuBaJABASYHg?=
 =?us-ascii?q?U8BAQ?=
IronPort-Data: A9a23:1StP56OWEuayOlLvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUpw0DEOz
 mdNCmmOO/reZWGke9h/Pd618h9Tv8DRyIdgHHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+tRXVAoIYpbxvp+E2Je9
 9c9FwAfRCnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMXwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVcviOOyb4eIEjCMbZ8Ogl2Jj
 HrWw3joWxwAPf3GzgrG6Uv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH69V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:zYwkBaoTYjxUT0kE+sgHN6caV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AXyzZtGjTzH3waD/TwAKU0wFCbTJubEKM3WnMJAy?=
 =?us-ascii?q?EFW97S62XYnqvyLFOqp87?=
X-Talos-MUID: 9a23:Q30JRgqRjwq54f6NwEMez2s5KNx5yby+NFwcyJgcsujdMhwzIA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536037755"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 099D3180001C5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 56B81CC124A; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 24/27] python3-git: fix CVE-2026-87817
Date: Thu, 15 Oct 2026 23:19:19 -0700
Message-Id: <20261016061922.843414-25-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247989

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b
[2] https://www.cve.org/CVERecord?id=CVE-2026-87817

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-87817.patch   | 430 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 431 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
new file mode 100644
index 0000000000..c69c906144
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
@@ -0,0 +1,430 @@
+From e1997b93556ee52ddb4ddfa2da174e8fdb4609cb Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 25 Aug 2026 04:57:29 +0200
+Subject: [PATCH 35/38] fix: prefer `.git` during repository discovery
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
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+- Transport the discovery checks into the 3.1.42 Repo constructor/helper 
+  layout. Omit upstream release-note changes.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py |  101 +++++++++++++++++++++++++++++++---------------
+ git/repo/fun.py  |  119 ++++++++++++++++++++++++++++++++++--------------------
+ 2 files changed, 144 insertions(+), 76 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index ebad63b8..c8e8f6ed 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -218,6 +218,10 @@ class Repo:
+     ) -> None:
+         """Create a new Repo instance.
+ 
++        .. note::
++            Repositories using reftable may be opened, but GitPython's direct reference
++            access does not support reftable.
++
+         :param path:
+             The path to either the root git directory or the bare git repo::
+ 
+@@ -248,7 +252,11 @@ class Repo:
+         :return: git.Repo
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
+@@ -271,17 +279,49 @@ class Repo:
+             if not os.path.exists(epath):
+                 raise NoSuchPathError(epath)
+ 
+-        ## Walk up the path to find the `.git` dir.
+-        #
+-        curpath = epath
+-        git_dir = None
++        # Walk up the path to find the `.git` dir.
++        curpath = os.fspath(epath) if epath is not None else ""
++        git_dir: Optional[str] = None
++        explicit_git_dir = not path and bool(git_dir_env)
+         while curpath:
+             # ABOUT osp.NORMPATH
+-            # It's important to normalize the paths, as submodules will otherwise initialize their
+-            # repo instances with paths that depend on path-portions that will not exist after being
+-            # removed. It's just cleaner.
++            # It's important to normalize the paths, as submodules will otherwise
++            # initialize their repo instances with paths that depend on path-portions
++            # that will not exist after being removed. It's just cleaner.
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
++
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
+                 # Set the path to the root of the working tree. If GIT_COMMON_DIR environment
+                 # variable is set, core.worktree is ignored and not used for determining the
+@@ -299,21 +339,7 @@ class Repo:
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
+@@ -324,6 +350,16 @@ class Repo:
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
+@@ -331,12 +367,6 @@ class Repo:
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
+@@ -345,9 +375,15 @@ class Repo:
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
+@@ -876,8 +912,7 @@ class Repo:
+ 
+         :return: List of strings being pathnames of alternates
+         """
+-        if self.git_dir:
+-            alternates_path = osp.join(self.git_dir, "objects", "info", "alternates")
++        alternates_path = osp.join(self.odb.root_path(), "info", "alternates")
+ 
+         if osp.exists(alternates_path):
+             with open(alternates_path, "rb") as f:
+@@ -898,7 +933,7 @@ class Repo:
+             The method does not check for the existence of the paths in alts
+             as the caller is responsible.
+         """
+-        alternates_path = osp.join(self.common_dir, "objects", "info", "alternates")
++        alternates_path = osp.join(self.odb.root_path(), "info", "alternates")
+         if not alts:
+             if osp.isfile(alternates_path):
+                 os.remove(alternates_path)
+diff --git a/git/repo/fun.py b/git/repo/fun.py
+index 63bcfdfc..663b6ee1 100644
+--- a/git/repo/fun.py
++++ b/git/repo/fun.py
+@@ -60,21 +60,61 @@ def is_git_dir(d: "PathLike") -> bool:
+     """This is taken from the git setup.c:is_git_directory
+     function.
+ 
+-    @throws WorkTreeRepositoryUnsupported if it sees a worktree directory. It's quite hacky to do that here,
+-            but at least clearly indicates that we don't support it.
+-            There is the unlikely danger to throw if we see directories which just look like a worktree dir,
+-            but are none."""
++    .. note::
++        This function recognizes repositories using reftable through their
++        compatibility files, but GitPython's direct reference access does not support
++        reftable.
++
++    :raise git.exc.WorkTreeRepositoryUnsupported:
++        If it sees a worktree directory. It's quite hacky to do that here, but at least
++        clearly indicates that we don't support it. There is the unlikely danger to
++        throw if we see directories which just look like a worktree dir, but are none.
++    """
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
+@@ -83,19 +123,20 @@ def find_worktree_git_dir(dotgit: "PathLike") -> Optional[str]:
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
+ def find_submodule_git_dir(d: "PathLike") -> Optional["PathLike"]:
+@@ -103,26 +144,18 @@ def find_submodule_git_dir(d: "PathLike") -> Optional["PathLike"]:
+     if is_git_dir(d):
+         return d
+ 
+-    try:
+-        with open(d) as fp:
+-            content = fp.read().rstrip()
+-    except IOError:
+-        # it's probably not a file
+-        pass
+-    else:
+-        if content.startswith("gitdir: "):
+-            path = content[8:]
+-
+-            if Git.is_cygwin():
+-                ## Cygwin creates submodules prefixed with `/cygdrive/...` suffixes.
+-                # Cygwin git understands Cygwin paths much better than Windows ones
+-                # Also the Cygwin tests are assuming Cygwin paths.
+-                path = cygpath(path)
+-            if not osp.isabs(path):
+-                path = osp.normpath(osp.join(osp.dirname(d), path))
+-            return find_submodule_git_dir(path)
+-    # END handle exception
+-    return None
++    path = find_worktree_git_dir(d)
++    if path is None:
++        return None
++
++    if Git.is_cygwin():
++        # Cygwin creates submodules prefixed with `/cygdrive/...`.
++        # Cygwin git understands Cygwin paths much better than Windows ones.
++        # Also the Cygwin tests are assuming Cygwin paths.
++        path = cygpath(path)
++    if not osp.isabs(path):
++        path = osp.normpath(osp.join(osp.dirname(d), path))
++    return path if is_git_dir(path) else None
+ 
+ 
+ def short_to_long(odb: "GitCmdObjectDB", hexsha: str) -> Optional[bytes]:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 54bc423fa6..decd1ccc00 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -47,6 +47,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-78677.patch \
             file://CVE-2026-78676.patch \
             file://CVE-2026-78675.patch \
+            file://CVE-2026-87817.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


