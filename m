Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0913C5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:10:43 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1355.1787159433250376326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fsL1drvT;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10806; q=dns/txt;
  s=iport01; t=1787159433; x=1788369033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TNVFR/Rki+Grv7zspouO4JXrR1FhDf5hu2AYraVl5+w=;
  b=fsL1drvTlun9gN+PEkL+VqiN9AXQ3RCeqItJqn2snPW7VrXlYnXQehWC
   8bxdWLCQNvyHbrjJXxn/xqw7iULimNOguiUiXWKiZL2N2BDMVrrVf9eJU
   wuPJyjzE9hya3zXG0X6ECrzROYnZ6JADgwB6g+MCX6vqMYA6KuQYK9RMl
   aUu7+9xmhkgY1NHa4h5lEz/vXxtUsRxXmGKyNM5d6/78W5gDVfQg4Yfrp
   kP3LKnbRIkTm50U9jloO+i3RTBB/zFkPPkqQFEcJ0mpJqkKxrffpjrYRA
   UNMHLaLf4GIFxrAEUg4bN0PdXE9WEOB/1wvZZZmEB6tQCc47Snt1aM4eb
   Q==;
X-CSE-ConnectionGUID: Ar8H2QKmRIaVU6h3f3S8qQ==
X-CSE-MsgGUID: 04QEhxsfS5Wy/83NXo2D8w==
X-IPAS-Result: =?us-ascii?q?A0BIAgAm4oVq/44QJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCOgM3AxHEAoF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNhLEIJVAQsUAYE4hT+IIl0YAUSCVYFjJxsbgXKECHaBBYEyKgEBg?=
 =?us-ascii?q?SeGfgSCInoSgVqBLZA6SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENG?=
 =?us-ascii?q?wYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFDgkLCxgNSBEsN?=
 =?us-ascii?q?xQZBD5uB45JIIFZJU10BxMBByQEEwtqFCMCOBIEOwOTEAqQFoIhoQ8KKIN2j?=
 =?us-ascii?q?CGVOhozhVulEQuYfY4KiQ+MJSkLaIRpgWg8gUcLB3AVO4JnCUoZD444g2uBf?=
 =?us-ascii?q?4JRgRTGVScyAgkyAQEHAgcOAwuBaJAAAiYEA29gAQE?=
IronPort-Data: A9a23:Nw3xy6vUJ+MbJhs93KI8cuOpjOfnVABfMUV32f8akzHdYApBsoF/q
 tZmKWGPbPuDamSme99waoS+8kgEvsWBz9ExSQU/rHwwQiIbgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0/wnITt31
 vkiCTkzU06D3Ozt++Kic7w57igjBJGD0II3s3Vky3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZg1/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9KoXRHZsMxxrGz
 o7A1zylOzwaJMeR8me64zX83cn/mnnXCJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:zG8ou6nXniv+UJPD27aiiLAXPjfpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3ArwOwFWmaZB+MAQaTlVSvUo01RuXXOVTHnFeKGmy?=
 =?us-ascii?q?9M0dgdoDLSQSeo5g0ivM7zg=3D=3D?=
X-Talos-MUID: 9a23:0y0S9ARfXNAL6JbjRXS02AhPNNdz7Z/zN1FKwc4gi87eGXxvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="813061146"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:10:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 1536B180004AA;
	Wed, 19 Aug 2026 17:10:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id AB8D6CD02B9; Wed, 19 Aug 2026 10:10:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/4] python3-git: fix CVE-2026-44243
Date: Wed, 19 Aug 2026 10:10:24 -0700
Message-ID: <20260819171026.750280-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260819171026.750280-1-dkelaiya@cisco.com>
References: <20260819171026.750280-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243776

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
---
 .../python3-git/CVE-2026-44243_p1.patch       | 136 ++++++++++++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  86 +++++++++++
 .../python/python3-git_3.1.42.bb              |   2 +
 3 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
new file mode 100644
index 0000000000..6c9af542b5
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
index 0000000000..e14c284d12
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
index 4102a2273a..cbc1be8771 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -16,6 +16,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-42215_p1.patch \
            file://CVE-2026-42215_p2.patch \
            file://CVE-2026-42215_p3.patch \
+           file://CVE-2026-44243_p1.patch \
+           file://CVE-2026-44243_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


