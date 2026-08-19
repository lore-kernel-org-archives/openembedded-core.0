Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0329DC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:08:20 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.656.1787116092318433195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GufYFLI4;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10470; q=dns/txt;
  s=iport01; t=1787116092; x=1788325692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1sdVvxYhYcu/2PWqUKGHb14J+7xvZbh4hy5RsEqYfp8=;
  b=GufYFLI48BPKxAXg1oQPrcf8hoQd8HRQgkIA0Wbt4WjnBigylrrB1nY7
   gTF48MMgsZTWx5NDMQ8RiNUeYC+La7YdU4SZxrHPVsGPFG1hSKof1HB5Y
   kDToWdgLChwVpcfK80kDFMgL35RAPD+VYVmQpNV8Fsgtc6gYNstxZQLgV
   FqEfv38QSBSRzkU81f2+Pp8kPOUrEVBieKicH0FSh0Dc1polM2fm65FsD
   mNP9euHlsGjIZeUSSdf9UWmL/33SYfNQm8Zal2t7qmi5lK8t9tvEM06Dm
   OU9d8fC67qIjYEkisx6Sg53jwyC5zxl92GLpT8vE3NamTyUWa0gErL8Gq
   w==;
X-CSE-ConnectionGUID: WVNltORETqS6tyrfwDnUmg==
X-CSE-MsgGUID: ezSR/c8nQDOl7c3Vm8LNTA==
X-IPAS-Result: =?us-ascii?q?A0BJAgD/OYVq/48QJK1aglmCV3ReQ0kDlkcDgROdCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCOgM3AxHDFoF5M?=
 =?us-ascii?q?4EBgygBgVTYSxCCVQELFAEFgTOFP4giXRgBRIJVgWMnGxuBcoEVgnN2gQWBM?=
 =?us-ascii?q?ioCgSeGfgSCInoSgVqBLZA4SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4ENGwYFgR2BKIQ3Ixk2eoEJXoErKmEBEheBCYIKAoJzggYCAUlFEQoLCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB45JIIFVcnQHEwEHJAQTC2oUIwI4EgQZJZMQApI/oQ8KKIN2j?=
 =?us-ascii?q?CGVOhozhVulEQuYfY4KlTQpc4RpgWg8gVlwFTuCZwlKGQ+OOINrhWTGVScyA?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiQAAImBANvYAEB?=
IronPort-Data: A9a23:9Bw8e6NNH4JcglTvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUor1DIEy
 DEWW2qHOfqLMzDzet4nPYjloUgD6sLTyoNgG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68pQKkUqGrc1xv9MX31f7
 /IHBDYwax/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY0BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FwpgeWyYIuPI7RmQ+1YjH2i4
 WmW+V3VJRVFP4ehzGqh1E6F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOH9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:ZnDqbaOl9PKkBcBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:jnrJ9WMHJEJ7Ke5DZxdB8FIzIO0Za0aD0GbKLVCUD1tsR+jA
X-Talos-MUID: 9a23:LSQ4HAp9T0g21K8t/aAezzxwD/0v6PSoMWwqlcoN4PeBZQhWBx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="809578921"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:08:11 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 5B11B18000252;
	Wed, 19 Aug 2026 05:08:11 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id EB0F5CD02B9; Tue, 18 Aug 2026 22:08:10 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/4] python3-git: fix CVE-2026-44243
Date: Tue, 18 Aug 2026 22:08:07 -0700
Message-Id: <20260819050808.3986732-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819050808.3986732-1-dkelaiya@cisco.com>
References: <20260819050808.3986732-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243699

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using all the
backported commits shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/25ba54dd3fb374b8fade7de4be1ac2ac84722190
[2] https://github.com/gitpython-developers/GitPython/commit/4af8463cca31c2369312fcaa5309dfc30756c7b6
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-7545-fcxq-7j24

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-git/CVE-2026-44243_p1.patch       | 134 ++++++++++++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  83 +++++++++++
 .../python/python3-git_3.1.43.bb              |   2 +
 3 files changed, 219 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
new file mode 100644
index 0000000000..7eaaf703db
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
index 0000000000..04e83d3657
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
index f7388e2bbb..bd2b113489 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -16,6 +16,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-42215_p1.patch \
            file://CVE-2026-42215_p2.patch \
            file://CVE-2026-42215_p3.patch \
+           file://CVE-2026-44243_p1.patch \
+           file://CVE-2026-44243_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6


