Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BD4CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:32 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15902.1792131565169883842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QeX7OVWz;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9672; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=T6wTTNgJGpfYxiJ5990yHwzMFY3KOZ2dkM+tpQC2+AM=;
  b=QeX7OVWzxNxkuNfVJez7ypP5Xu5veX2jLnhDhCc+WvTMeQuGCBL/7h36
   9QsiWOKcEtTxEHYu5Tm+vYGVU7v44YOP+4IxkioRF/ittO8Y7PIOxU6Bz
   MSitvHN+8PTYhn/K+pcdvvJ3ZhR/y+HGh4vyhiFJ6JDevhz3s8KbJbyXF
   yvt6A+ry3U2eOeBlp1nEPsW3zNjss3WUnfRlBlxK0xn1tDLy331Nljgmq
   3I/g6/dcF7Eu7xC/hplppJeTxkIPMCPs96vuKfd3GiaQxaIGV1eHByTFT
   H5KHwwyD+oMDikW7PJy+EgIyiw6ceRs5v9X4fNZUnKbIZ3RI82Ml7VbkN
   A==;
X-CSE-ConnectionGUID: MlisZDlmSsWOoWGC+PaUDQ==
X-CSE-MsgGUID: MF0WaTDIRtyMmtrA9bD1rA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDpwNFq/5L/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8doF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEglWBYycbgUlEgRWDaYEFg?=
 =?us-ascii?q?VwBAYglBIINgQ8SgVqBA45KhXpIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5IUHoFyJgglDhItECYrASsEgkQypSefUYE+hCiMIpU6GjOEBIFXkkCSVAuYf?=
 =?us-ascii?q?Y4KlTpITYRpgWg8gUcLBzMaCBsVO4JnCUoZD44rDguDYIF/g2XIdicyAgYDM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:TkAt+6Cr6aUGDhVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGgm0DUFy
 GoaDD2Abv/ZZDDwKt9/YIy2oUIF7ZPXn4BjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5vFvF3MaOYgj4dlQBl5h3
 r8gIQ0hV0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOl1IuiuKya4S9ltqiYOsNoU+ki
 kP843XcBw0AHY2V5WOf2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVm+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:NYxqeaivnJej59M43O7yrmVwVnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:mVIkq278t4C5dSsV/9ss0UoVAfIJdnjm10j3JHCXIiVRQYC5cArF
X-Talos-MUID: 9a23:PP8fggYUyQ33xeBTkhG0uzheGOZS/7WLDVwXuMQMl5CeHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722736"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 0068618000586
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 400B1CC12A7; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 20/27] python3-git: fix CVE-2026-78678 CVE-2026-78679
Date: Thu, 15 Oct 2026 23:19:15 -0700
Message-Id: <20261016061922.843414-21-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247987

This patch applies the upstream fix as referenced in [2]
and [3], using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-78678
[3] https://nvd.nist.gov/vuln/detail/cve-2026-78679

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-78678_CVE-2026-78679.patch       | 208 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
new file mode 100644
index 0000000000..6277a9e509
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
@@ -0,0 +1,208 @@
+From 51216053bd6885b546be8e9ed2e8e1000e7ee5a3 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Wed, 5 Aug 2026 04:48:36 +0200
+Subject: [PATCH] Block file-reading Git options
+
+<!-- agent -->
+Reject file-reading options passed to blame, diff, and tag APIs. Inspect
+positional values after resolving aliases, recognize unsafe options
+behind command-specific short-flag clusters, and retain the explicit
+allow_unsafe_options escape hatch. This closes GHSA-5xxx-qhh7-9287 and
+GHSA-3wxw-xv34-2frg and covers the adjacent diff order-file sink.
+
+Regression tests cover long, short, and clustered options, incremental blame,
+tag path/reference positionals, the ref keyword alias, both diff entry points,
+and preservation of diff pickaxe behavior.
+
+Git baseline: cf5497b14c; git-blame, git-diff, and git-tag document the relevant file-input options.
+
+CVE: CVE-2026-78678 CVE-2026-78679
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+(cherry picked from commit 1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py        |  8 +++++---
+ git/diff.py       |  7 ++++---
+ git/index/base.py |  3 ++-
+ git/repo/base.py  | 27 +++++++++++++++++++++------
+ git/refs/tag.py   | 10 ++++++----
+ 5 files changed, 39 insertions(+), 16 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 1b1da383..a91f8a0f 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -571,7 +571,9 @@ class Git(LazyMixin):
+         return dashify(option_tokens[0])
+ 
+     @classmethod
+-    def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
++    def check_unsafe_options(
++        cls, options: List[str], unsafe_options: List[str], clusterable_short_options: str = "46flnqsv"
++    ) -> None:
+         """Raise :class:`~git.exc.UnsafeOptionError` for blocked option spellings.
+ 
+         In addition to exact matches, this rejects abbreviated long options accepted
+@@ -606,7 +608,7 @@ class Git(LazyMixin):
+         # These value-less Git flags can be clustered before another short option
+         # (for example, ``-fuVALUE``). Stop at any other character because it may
+         # begin an attached value, as ``o`` does in the safe option ``-oupstream``.
+-        clusterable_short_options = frozenset("46flnqsv")
++        clusterable_short_options_set = frozenset(clusterable_short_options)
+         options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+             candidate = cls._canonicalize_option_name(option)
+@@ -623,7 +625,7 @@ class Git(LazyMixin):
+                         raise UnsafeOptionError(
+                             f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+                         )
+-                    if option_char not in clusterable_short_options:
++                    if option_char not in clusterable_short_options_set:
+                         break
+             if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
+                 continue
+diff --git a/git/diff.py b/git/diff.py
+index 37ff2624..84e7687b 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -136,8 +136,8 @@ class Diffable:
+             to be read and diffed.
+ 
+         :param allow_unsafe_options:
+-            If ``True``, allow options such as ``--output`` that can write to arbitrary
+-            filesystem paths.
++            If ``True``, allow options such as ``--output`` and ``-O`` that can write to
++            or read from arbitrary filesystem paths.
+ 
+         :param kwargs:
+             Additional arguments passed to git-diff, such as ``R=True`` to swap both
+@@ -153,7 +153,8 @@ class Diffable:
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([other], kwargs),
+-                unsafe_options=self.repo.unsafe_git_revision_options,
++                unsafe_options=self.repo.unsafe_git_diff_options,
++                clusterable_short_options="46abceflmnpqrstuvwzBCDMNRW",
+             )
+ 
+         args: List[Union[PathLike, Diffable]] = []
+diff --git a/git/index/base.py b/git/index/base.py
+index a92ba82b..520c703c 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -1485,7 +1485,8 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([other], kwargs),
+-                unsafe_options=self.repo.unsafe_git_revision_options,
++                unsafe_options=self.repo.unsafe_git_diff_options,
++                clusterable_short_options="46abceflmnpqrstuvwzBCDMNRW",
+             )
+ 
+         # Only run if we are the default repository index.
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 9011b0a4..ebad63b8 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -187,6 +187,19 @@ class Repo:
+         "-o",
+     ]
+ 
++    unsafe_git_blame_options = unsafe_git_revision_options + [
++        # These options read arbitrary files and expose their contents through blame output.
++        "--contents",
++        "-S",
++        "--ignore-revs-file",
++    ]
++
++    unsafe_git_diff_options = unsafe_git_revision_options + [
++        # Reads caller-controlled order patterns from an arbitrary file.
++        "-O",
++        "--orderfile",
++    ]
++
+     # Invariants
+     config_level: ConfigLevels_Tup = ("system", "user", "global", "repository")
+     """Represents the configuration level of a configuration file."""
+@@ -755,7 +768,8 @@ class Repo:
+ 
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+-                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++                options=Git._option_candidates([rev], kwargs),
++                unsafe_options=self.unsafe_git_revision_options
+             )
+ 
+         return Commit.iter_items(
+@@ -1019,7 +1033,7 @@ class Repo:
+         :param rev: Revision specifier, see git-rev-parse for viable options.
+ 
+         :param allow_unsafe_options:
+-            Allow unsafe options in revision argument, like ``--output``.
++            Allow unsafe options in revision argument, like ``--output`` or ``--contents``.
+ 
+         :return:
+             Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates the
+@@ -1031,7 +1045,9 @@ class Repo:
+         """
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+-                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++                options=Git._option_candidates([rev], kwargs),
++                unsafe_options=self.unsafe_git_blame_options,
++                clusterable_short_options="46bceflnpqstvw",
+             )
+ 
+         data: bytes = self.git.blame(rev, "--", file, p=True, incremental=True, stdout_as_string=False, **kwargs)
+@@ -1118,7 +1134,7 @@ class Repo:
+         :param rev: Revision specifier, see git-rev-parse for viable options.
+ 
+         :param allow_unsafe_options:
+-            Allow unsafe options in revision argument, like ``--output``.
++            Allow unsafe options in revision argument, like ``--output`` or ``--contents``.
+ 
+         :return:
+             list: [git.Commit, list: [<line>]]
+@@ -1133,7 +1149,8 @@ class Repo:
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([rev, rev_opts_list], kwargs),
+-                unsafe_options=self.unsafe_git_revision_options,
++                unsafe_options=self.unsafe_git_blame_options,
++                clusterable_short_options="46bceflnpqstvw",
+             )
+         data: bytes = self.git.blame(rev, *rev_opts_list, "--", file, p=True, stdout_as_string=False, **kwargs)
+         commits: Dict[str, Commit] = {}
+diff --git a/git/refs/tag.py b/git/refs/tag.py
+index 640e9702..15da4c6d 100644
+--- a/git/refs/tag.py
++++ b/git/refs/tag.py
+@@ -120,15 +120,17 @@ class TagReference(Reference):
+ 
+         :return: A new TagReference.
+         """
++        legacy_ref = kwargs.pop("ref", None)
++        if legacy_ref:
++            reference = legacy_ref
++
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+-                options=Git._option_candidates([], kwargs),
++                options=Git._option_candidates([path, reference], kwargs),
+                 unsafe_options=cls.unsafe_git_tag_options,
++                clusterable_short_options="46adefilnqsv",
+             )
+ 
+-        if "ref" in kwargs and kwargs["ref"]:
+-            reference = kwargs["ref"]
+-
+         if "message" in kwargs and kwargs["message"]:
+             kwargs["m"] = kwargs["message"]
+             del kwargs["message"]
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 4375809d3a..a77fddda5b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -43,6 +43,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-76222_p1.patch \
             file://CVE-2026-76222-regression.patch \
             file://CVE-2026-76222_p2.patch \
+            file://CVE-2026-78678_CVE-2026-78679.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


