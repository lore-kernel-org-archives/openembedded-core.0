Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDB9C79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34938.1788788165908696517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2IV/4mXw;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495437bb891so23826515e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788164; x=1789392964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41IyYRHIoBuZPlBZsSTzyF6bV/Gbz4KPUjYfH27ZqS0=;
        b=2IV/4mXwwEJA19dapU2bNIdwTjxNthbH9guVnlbFWU0UqgW4G5/hqqImSjkkHNT4Oq
         AEYNRRnGKek2an6u5clFkh4uI+0o79OsB/oML2p8NXj2Sj+ZFLq75IQoUq58UNIn6jeu
         xRBFvmJ6skg/7L9ePnRkMa4k0MDJdLJ+6UEAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788164; x=1789392964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=41IyYRHIoBuZPlBZsSTzyF6bV/Gbz4KPUjYfH27ZqS0=;
        b=dorUCz/4hVZij681ZOhBaqFTh8O4q1fpowpI9zoLHhTrqFMkYVjk6skCShRyCKVZwP
         fqM3TeTV8oYt952Myeocf6C7BStddjrg220YrfsuFsSuhwyo8IqE1TlvSQSggvhXI1fX
         2mCN+NXQu4Uxe1GEt/VBM+IN61rxtAQBHv4aMO6qK5Wow4P6X3q8eFPApvRvLciWyt7R
         /hD8kyd2rz3+0mJkMDWQipa8I45M3Ixcyt+N4IeLoUzWxzLIEIXLaKLZ3nGFyLaeIiV4
         4YIS2cYd98hcWlFCC8hJqG1PIE5U9Oq8NJKY+qFQxtCMYTsFnnpAvSqYQqUNEF6dXqlf
         MaxQ==
X-Gm-Message-State: AFuF++m8v7lZW9eg4/dK01s48bZoD8Xai1ZuuRQCEvx3k+uWAgktQmpe
	XVskoqZh4IHMMErOAT6UtdoPzPytANPq+QP5wD1NxsnkNg73q1SKzCXxjR/19efg1scRuN1W+Kj
	qCmENOuQ=
X-Gm-Gg: AYBFou2Iemo2yK6teCQdznIfm44zFgRW/lIbh3PfWHAM/fPSlV4DGtl/vkPSAnz3c80
	nvBPn4v1q6qLwR5OqJQRHLKyvMxJt6vRRqsYUDVNTi9axr5gtHTP0FoJ8W1NwTSoEO68++AYB7x
	IjpLPSH0IooOz48CK+0SusvpKbJifTBGzpRCt6OaipbvGk5/iSrnfKLNxAKniBNqFZPJr9ojlPb
	wqyldNO7CUqjyUznkvGEDbAKwqK8IwcaQn59x0YHWFwhGA+UsTJ00BsDlBprdymuBLVDIBLgBkx
	OH5V4Uu9VhEgVD32kFP3FMqNk04eDH9KZLIqaxZplKSAbOprmV/NrX1C7nx+s9BwaX2SV4lGdNX
	CU/hj3uGizbEPBca5dmi43PEHnKl5IF+Qx4JDYvdyhwj34ZtZRst4RkW/L7VYA9sZ8fWzv+Fbh9
	dbXKyo6rECwJgWNjYL31yC996pcdGJtyQ15+QFeo8jTGyedu5QqZg8EUsL1inwYPSE3ngRk+73Q
	KtG44zw76AcmZqyz3zonn3/ZB6hIrC3QTPkScdp7iznzRe9yeOYiFCmYVkcUh8I+eyXJaQkEvs=
X-Received: by 2002:a05:600c:3648:b0:49c:f13d:ffed with SMTP id 5b1f17b1804b1-49cf5988c09mr200865095e9.17.1788788164019;
        Mon, 07 Sep 2026 06:36:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/35] python3-git: fix CVE-2026-44243
Date: Mon,  7 Sep 2026 15:35:20 +0200
Message-ID: <0853d0c72e96a3c4e3a5329589a9aa151e2f2c46.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245282

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.48 backport for
CVE-2026-44243. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commits are referenced in [3] and [4].

[1] https://github.com/gitpython-developers/GitPython/commit/dbfa26476445169cdc9d64a539ba6959fd0a2643
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44243
[3] https://github.com/gitpython-developers/GitPython/commit/25ba54dd3fb374b8fade7de4be1ac2ac84722190
[4] https://github.com/gitpython-developers/GitPython/commit/4af8463cca31c2369312fcaa5309dfc30756c7b6

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-git/CVE-2026-44243_p1.patch       | 136 ++++++++++++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  86 +++++++++++
 .../python/python3-git_3.1.42.bb              |   2 +
 3 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
new file mode 100644
index 00000000000..6c9af542b5e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
@@ -0,0 +1,136 @@
+From fcd8d016816696780c0dc96dacbe48fc10df80f6 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Tue, 28 Apr 2026 09:17:31 +0800
+Subject: [PATCH] prevent out-of-repo access when manipulating references.
+
+This previously made it possible to create, modify and delete files outside outside
+of the repository, which is a problem if inputs aren't trusted.
+
+CVE: CVE-2026-44243
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/25ba54dd3fb374b8fade7de4be1ac2ac84722190]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 25ba54dd3fb374b8fade7de4be1ac2ac84722190)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/refs/log.py      |  2 +-
+ git/refs/remote.py   |  5 +++--
+ git/refs/symbolic.py | 37 +++++++++++++++++++++++++++++++------
+ 3 files changed, 35 insertions(+), 9 deletions(-)
+
+diff --git a/git/refs/log.py b/git/refs/log.py
+index e45798d8..29293f4a 100644
+--- a/git/refs/log.py
++++ b/git/refs/log.py
+@@ -204,7 +204,7 @@ class RefLog(List[RefLogEntry], Serializable):
+             file though.
+         :param ref: SymbolicReference instance
+         """
+-        return osp.join(ref.repo.git_dir, "logs", to_native_path(ref.path))
++        return to_native_path(ref._get_validated_reflog_path(ref.repo, ref.path))
+ 
+     @classmethod
+     def iter_entries(cls, stream: Union[str, "BytesIO", mmap]) -> Iterator[RefLogEntry]:
+diff --git a/git/refs/remote.py b/git/refs/remote.py
+index 59d02a75..e50c54eb 100644
+--- a/git/refs/remote.py
++++ b/git/refs/remote.py
+@@ -64,12 +64,13 @@ class RemoteReference(Head):
+         # are generally ignored in the refs/ folder. We don't though
+         # and delete remainders manually.
+         for ref in refs:
++            cls._check_ref_name_valid(ref.path)
+             try:
+-                os.remove(os.path.join(repo.common_dir, ref.path))
++                os.remove(cls._get_validated_path(repo.common_dir, ref.path))
+             except OSError:
+                 pass
+             try:
+-                os.remove(os.path.join(repo.git_dir, ref.path))
++                os.remove(cls._get_validated_path(repo.git_dir, ref.path))
+             except OSError:
+                 pass
+         # END for each ref
+diff --git a/git/refs/symbolic.py b/git/refs/symbolic.py
+index 31f959ac..d5c18290 100644
+--- a/git/refs/symbolic.py
++++ b/git/refs/symbolic.py
+@@ -109,6 +109,32 @@ class SymbolicReference:
+     def abspath(self) -> PathLike:
+         return join_path_native(_git_dir(self.repo, self.path), self.path)
+ 
++    @staticmethod
++    def _get_validated_path(base: PathLike, path: PathLike) -> str:
++        path = os.fspath(path)
++        base_path = os.path.realpath(os.fspath(base))
++        abs_path = os.path.realpath(os.path.join(base_path, path))
++        try:
++            common_path = os.path.commonpath([base_path, abs_path])
++        except ValueError as e:
++            raise ValueError("Reference path %r escapes the repository" % path) from e
++        if os.path.normcase(common_path) != os.path.normcase(base_path):
++            raise ValueError("Reference path %r escapes the repository" % path)
++        return abs_path
++
++    @classmethod
++    def _get_validated_ref_path(cls, repo: "Repo", path: PathLike) -> str:
++        """Return the absolute filesystem path for a ref after validating it."""
++        cls._check_ref_name_valid(path)
++        ref_path = os.fspath(path)
++        return cls._get_validated_path(_git_dir(repo, ref_path), ref_path)
++
++    @classmethod
++    def _get_validated_reflog_path(cls, repo: "Repo", path: PathLike) -> str:
++        """Return the absolute filesystem path for a reflog after validating it."""
++        cls._check_ref_name_valid(path)
++        return cls._get_validated_path(os.path.join(repo.git_dir, "logs"), path)
++
+     @classmethod
+     def _get_packed_refs_path(cls, repo: "Repo") -> str:
+         return os.path.join(repo.common_dir, "packed-refs")
+@@ -442,7 +468,7 @@ class SymbolicReference:
+             # END handle non-existing
+         # END retrieve old hexsha
+ 
+-        fpath = self.abspath
++        fpath = self._get_validated_ref_path(self.repo, self.path)
+         assure_directory_exists(fpath, is_file=True)
+ 
+         lfd = LockedFD(fpath)
+@@ -571,7 +597,7 @@ class SymbolicReference:
+             Alternatively the symbolic reference to be deleted.
+         """
+         full_ref_path = cls.to_full_path(path)
+-        abs_path = os.path.join(repo.common_dir, full_ref_path)
++        abs_path = cls._get_validated_ref_path(repo, full_ref_path)
+         if os.path.exists(abs_path):
+             os.remove(abs_path)
+         else:
+@@ -635,9 +661,8 @@ class SymbolicReference:
+         corresponding object and a detached symbolic reference will be created
+         instead.
+         """
+-        git_dir = _git_dir(repo, path)
+         full_ref_path = cls.to_full_path(path)
+-        abs_ref_path = os.path.join(git_dir, full_ref_path)
++        abs_ref_path = cls._get_validated_ref_path(repo, full_ref_path)
+ 
+         # Figure out target data.
+         target = reference
+@@ -724,8 +749,8 @@ class SymbolicReference:
+         if self.path == new_path:
+             return self
+ 
+-        new_abs_path = os.path.join(_git_dir(self.repo, new_path), new_path)
+-        cur_abs_path = os.path.join(_git_dir(self.repo, self.path), self.path)
++        new_abs_path = self._get_validated_ref_path(self.repo, new_path)
++        cur_abs_path = self._get_validated_ref_path(self.repo, self.path)
+         if os.path.isfile(new_abs_path):
+             if not force:
+                 # If they point to the same file, it's not an error.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
new file mode 100644
index 00000000000..e14c284d122
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
@@ -0,0 +1,86 @@
+From 2d1f681978b51ffff0db57cf89b0bcd6bffc7418 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Tue, 28 Apr 2026 09:30:41 +0800
+Subject: [PATCH] address review feedback and CI failures
+
+Consolidate follow-up fixes from review and CI:
+
+- fix lint and mypy issues in reference log path handling
+- validate remote reference paths before invoking git branch deletion
+- add symlink escape coverage where realpath resolves symlinks
+- ensure temporary test repositories release git resources during cleanup
+
+CVE: CVE-2026-44243
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4af8463cca31c2369312fcaa5309dfc30756c7b6]
+
+Backport Changes:
+- Keep the 3.1.42 docstring layout and path coercion while
+  applying upstream validation documentation and return type.
+- Omit regression test updates because the Scarthgap PyPI
+  source archive does not include the upstream test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 4af8463cca31c2369312fcaa5309dfc30756c7b6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/refs/log.py    | 3 ++-
+ git/refs/remote.py | 4 +++-
+ git/util.py        | 2 +-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/git/refs/log.py b/git/refs/log.py
+index 29293f4a..eef525e7 100644
+--- a/git/refs/log.py
++++ b/git/refs/log.py
+@@ -21,7 +21,6 @@ from git.util import (
+     file_contents_ro_filepath,
+ )
+ 
+-import os.path as osp
+ 
+ 
+ # typing ------------------------------------------------------------------
+@@ -203,6 +202,8 @@ class RefLog(List[RefLogEntry], Serializable):
+             instance would be found. The path is not guaranteed to point to a valid
+             file though.
+         :param ref: SymbolicReference instance
++        :raise ValueError:
++            If `ref.path` is invalid or escapes the repository's reflog directory.
+         """
+         return to_native_path(ref._get_validated_reflog_path(ref.repo, ref.path))
+ 
+diff --git a/git/refs/remote.py b/git/refs/remote.py
+index e50c54eb..70eada81 100644
+--- a/git/refs/remote.py
++++ b/git/refs/remote.py
+@@ -59,12 +59,14 @@ class RemoteReference(Head):
+             kwargs are given for comparability with the base class method as we
+             should not narrow the signature.
+         """
++        for ref in refs:
++            cls._check_ref_name_valid(ref.path)
++
+         repo.git.branch("-d", "-r", *refs)
+         # The official deletion method will ignore remote symbolic refs - these
+         # are generally ignored in the refs/ folder. We don't though
+         # and delete remainders manually.
+         for ref in refs:
+-            cls._check_ref_name_valid(ref.path)
+             try:
+                 os.remove(cls._get_validated_path(repo.common_dir, ref.path))
+             except OSError:
+diff --git a/git/util.py b/git/util.py
+index 03d62ffc..5a136d18 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -272,7 +272,7 @@ def join_path(a: PathLike, *p: PathLike) -> PathLike:
+ 
+ if os.name == "nt":
+ 
+-    def to_native_path_windows(path: PathLike) -> PathLike:
++    def to_native_path_windows(path: PathLike) -> str:
+         path = str(path)
+         return path.replace("/", "\\")
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index c294b23112e..99f31791bd5 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -13,6 +13,8 @@ PYPI_PACKAGE = "GitPython"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \
+            file://CVE-2026-44243_p1.patch \
+            file://CVE-2026-44243_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 

