Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C99C79F8B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2579.1788641115130455148
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PB3iE++1;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so16969415e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641113; x=1789245913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iu7+4PItGjJNsqQawlPgRFCyy0wBWFk773fBTNrdYVI=;
        b=PB3iE++1jgecboLX7wlyJUNofuADlsZ/ufxrA+IdhdU7Q6Ds3fvjsXj/XoqHIXMV0E
         CZiANWUQHaAVFjVquREIEMXfOIAx4VKDoLPx7VMQLM0DYa3coS5tZioWZ4uFREqJx90W
         SBF5M8A1Vwpuj7+xJsfvj0wxI4Z+O68xztl5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641113; x=1789245913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Iu7+4PItGjJNsqQawlPgRFCyy0wBWFk773fBTNrdYVI=;
        b=H22DWZKP3ae5cqNxFx3RU68zx/iPdpCs9Y5M3hJiTyges7FE3ipaanIrzuArpFe03W
         KdjdEkDROBBp5HWP4iF8SWeZhCDrUv0moQqOomoSdU8KcpIhpSr4CWpe4GJOj3LfqjUJ
         YjjdCAlf6eowNokyx9BlkBxP9Emd28YTgfoMRVoM5IIxPuqW712vRM+oWf1gnCC+KMMx
         0PiJ42D899F20Mvr25+oxYA4yVoOZPWetz5XEpqrgBju74mxtX1G3L0pcyoml5ON5VYH
         DGzZQQkQ2j0SM8OYTKmuQnCDHsHzHjysHuaNdt0jV+hPIn2NXhXTfkq/zww3pnmN6ad4
         kFig==
X-Gm-Message-State: AFuF++nEyFobRb24fNMYGPG/cs7mPSnX2TQgglGridgDCM7hLqVCOpPL
	qeq0CO+MtVfG8558LnQm+tRfoLFoV79SVq2PkuRAkXOHfOTTqY3EDaeihHYZyVCmqfEYdzRMvCg
	FQUAE3Ao=
X-Gm-Gg: AYBFou3Qn06dPEHr10b7kv+rmGk6WPAZ17rIx4AolEGeDKOgQ37EJNfmaPks9sOoXcL
	muTqIvLMWjIm5Nbw9+0NQvuJfVcTA4Wc5fFCqVMwxL5dpCYSwuGgd4Rptpc7hDUP3pm9sTWC983
	qM9g9pMALQf6qUp91zzo/2xA2WAFpNAYLz6xOSyoN4bEKny9q+OsI43H5pIm9dZS7dUF8iKXu7K
	Upg19pMzWcSzFHPcP0zdYprN23Rn+OWl89RfTHB7GQ0hl4CSDn5s04KyinsOiloNWI3NB1gCeUM
	dOzwhRrtFydDlKAg0oSBKJ8z7UvznroaKDC79qoKKrUiuFZfIlHnoA/Wm8flkaezHhMFY4pfuJH
	7CKyjay6VclD2aYabXebhUXNULcNPyfdkDUDkjQThgrO8Gogz5vJhhYP7h99uD4Knbi2c1d1EYw
	zl/nfdTfb+1odj9JmBv9m/bUGp/7a0boNn/Aci/GjmkAM6WkvZaoA6+0zkSqGB9OQ9jX/QtYCLW
	FJ+e1OpHmE8bv515ht21/36jq1G4b+CuN/SzfVTutr+gkMgFcaUtAr9i9yaKoOkyw==
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr78812195e9.18.1788641113200;
        Sat, 05 Sep 2026 13:45:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/40] python3-git: fix CVE-2026-44243
Date: Sat,  5 Sep 2026 22:44:06 +0200
Message-ID: <241f21be5bdfc295945c278058ce92985a962fec.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245157

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using all the
backported commits shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/25ba54dd3fb374b8fade7de4be1ac2ac84722190
[2] https://github.com/gitpython-developers/GitPython/commit/4af8463cca31c2369312fcaa5309dfc30756c7b6
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-7545-fcxq-7j24

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-git/CVE-2026-44243_p1.patch       | 134 ++++++++++++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  83 +++++++++++
 .../python/python3-git_3.1.43.bb              |   2 +
 3 files changed, 219 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
new file mode 100644
index 00000000000..7eaaf703db4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
@@ -0,0 +1,134 @@
+From 84b84e90d1ce0b35d627bee6c65f3218c72a53f5 Mon Sep 17 00:00:00 2001
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
+- Omitted test/test_refs.py because the PyPI 3.1.43 source used by
+  the recipe does not ship the upstream test tree.
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
+index 17e3a94b..88906758 100644
+--- a/git/refs/log.py
++++ b/git/refs/log.py
+@@ -213,7 +213,7 @@ class RefLog(List[RefLogEntry], Serializable):
+         :param ref:
+             :class:`~git.refs.symbolic.SymbolicReference` instance
+         """
+-        return osp.join(ref.repo.git_dir, "logs", to_native_path(ref.path))
++        return to_native_path(ref._get_validated_reflog_path(ref.repo, ref.path))
+ 
+     @classmethod
+     def iter_entries(cls, stream: Union[str, "BytesIO", mmap]) -> Iterator[RefLogEntry]:
+diff --git a/git/refs/remote.py b/git/refs/remote.py
+index b4f4f7b3..8244470b 100644
+--- a/git/refs/remote.py
++++ b/git/refs/remote.py
+@@ -63,12 +63,13 @@ class RemoteReference(Head):
+         # generally ignored in the refs/ folder. We don't though and delete remainders
+         # manually.
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
+index 510850b2..ba24f2c2 100644
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
+@@ -478,7 +504,7 @@ class SymbolicReference:
+             # END handle non-existing
+         # END retrieve old hexsha
+ 
+-        fpath = self.abspath
++        fpath = self._get_validated_ref_path(self.repo, self.path)
+         assure_directory_exists(fpath, is_file=True)
+ 
+         lfd = LockedFD(fpath)
+@@ -623,7 +649,7 @@ class SymbolicReference:
+             Alternatively the symbolic reference to be deleted.
+         """
+         full_ref_path = cls.to_full_path(path)
+-        abs_path = os.path.join(repo.common_dir, full_ref_path)
++        abs_path = cls._get_validated_ref_path(repo, full_ref_path)
+         if os.path.exists(abs_path):
+             os.remove(abs_path)
+         else:
+@@ -686,9 +712,8 @@ class SymbolicReference:
+         symbolic reference. Otherwise it will be resolved to the corresponding object
+         and a detached symbolic reference will be created instead.
+         """
+-        git_dir = _git_dir(repo, path)
+         full_ref_path = cls.to_full_path(path)
+-        abs_ref_path = os.path.join(git_dir, full_ref_path)
++        abs_ref_path = cls._get_validated_ref_path(repo, full_ref_path)
+ 
+         # Figure out target data.
+         target = reference
+@@ -780,8 +805,8 @@ class SymbolicReference:
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
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
new file mode 100644
index 00000000000..04e83d36574
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
@@ -0,0 +1,83 @@
+From 4ab42809cb34222b1c574c07e083a4008e97d8de Mon Sep 17 00:00:00 2001
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
+- Omitted test/test_refs.py because the PyPI 3.1.43 source used by
+  the recipe does not ship the upstream test tree.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 4af8463cca31c2369312fcaa5309dfc30756c7b6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/refs/log.py    | 4 +++-
+ git/refs/remote.py | 4 +++-
+ git/util.py        | 2 +-
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/git/refs/log.py b/git/refs/log.py
+index 88906758..642b1825 100644
+--- a/git/refs/log.py
++++ b/git/refs/log.py
+@@ -4,7 +4,6 @@
+ __all__ = ["RefLog", "RefLogEntry"]
+ 
+ from mmap import mmap
+-import os.path as osp
+ import re
+ import time as _time
+ 
+@@ -212,6 +211,9 @@ class RefLog(List[RefLogEntry], Serializable):
+ 
+         :param ref:
+             :class:`~git.refs.symbolic.SymbolicReference` instance
++
++        :raise ValueError:
++            If `ref.path` is invalid or escapes the repository's reflog directory.
+         """
+         return to_native_path(ref._get_validated_reflog_path(ref.repo, ref.path))
+ 
+diff --git a/git/refs/remote.py b/git/refs/remote.py
+index 8244470b..e16ae70f 100644
+--- a/git/refs/remote.py
++++ b/git/refs/remote.py
+@@ -58,12 +58,14 @@ class RemoteReference(Head):
+             `kwargs` are given for comparability with the base class method as we
+             should not narrow the signature.
+         """
++        for ref in refs:
++            cls._check_ref_name_valid(ref.path)
++
+         repo.git.branch("-d", "-r", *refs)
+         # The official deletion method will ignore remote symbolic refs - these are
+         # generally ignored in the refs/ folder. We don't though and delete remainders
+         # manually.
+         for ref in refs:
+-            cls._check_ref_name_valid(ref.path)
+             try:
+                 os.remove(cls._get_validated_path(repo.common_dir, ref.path))
+             except OSError:
+diff --git a/git/util.py b/git/util.py
+index 8c1c2601..27b239ab 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -289,7 +289,7 @@ def join_path(a: PathLike, *p: PathLike) -> PathLike:
+ 
+ if sys.platform == "win32":
+ 
+-    def to_native_path_windows(path: PathLike) -> PathLike:
++    def to_native_path_windows(path: PathLike) -> str:
+         path = str(path)
+         return path.replace("/", "\\")
+ 
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 26d9a3f0633..ef4f7fa18ca 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -15,6 +15,8 @@ inherit pypi python_setuptools_build_meta
 SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-42215_p1.patch \
            file://CVE-2026-42215_p2.patch \
+           file://CVE-2026-44243_p1.patch \
+           file://CVE-2026-44243_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 

