Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FABCCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15557.1792129268905469582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=anb9izss;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8519; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ftP6Fv6ZOpAx0fk8dezKgu/huLOiE0jQBcqpziBmAXA=;
  b=anb9izssaN8AW9IBWApjGjtxP5RGIQyq2WxFDSt8TEaV4P4uCUGNtfPI
   gTzh5agEarnA73ITlztG3DHWZSJAqThY7iRUBDxTjgIeeC+li8YWd6Z9b
   v0CGTgpgOvbmdhi+ALrqukysLlWD6zJqxTlbx+dNT+Su3zJEim3TJChdc
   JaxY6KflEI+QEAwlgPqMizgcISwBVk4JxqDXomCD3MYq9XOVYQBCTBL9G
   22+pPqQiJq0CfZVC0gMnaqWDhae4d3msLvQD12mrStDlUt4lOgEzo/xam
   Z/4F1DAs+wtRKVOYTZRQrsd+lWghvBLLjUP8iN7RUPSQ5f5PN8r6ZD6BQ
   A==;
X-CSE-ConnectionGUID: q2scpTKeTIe6mzatXPaP1w==
X-CSE-MsgGUID: f4WePJXhTQWd4TLTaXYz3Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgAeuNFq/5P/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8eIF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEglWBYycbgUlEgRWDaYEFg?=
 =?us-ascii?q?VwBAYglBIINgQ8SgVqBA5RESIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSF?=
 =?us-ascii?q?B6BciYtDhJjKwErBIJEBiylJ6EPhCiMIpU6GjOEBIFXkkCSVAuYfY4KlTpIT?=
 =?us-ascii?q?YRpgWg8gUcLBzMaCBsVO4JnCUoZD44rDguDYIF/g2XIdicyAgYDMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:hwSClqqOyuvfN/vwoflvOk8p7PNeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmCO/6KYzCkeIx2PtzgoU8H7JfQzYRkHFA5qik8FipAo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v8tGmpWy
 d8VFBEAMBWRjv6G+LuDE/Y506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fXGJQFwx7Bz
 o7A12qlPRwiFuyf9QO6/i6QotPGrRLpA7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:02w3r688q2zh5Jjsm8huk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AQl1NH2ms4f5UzbPeg36EhdfQSW3XOWSH13zIH2y?=
 =?us-ascii?q?1NUdkFriHQEOgwKpcytU7zg=3D=3D?=
X-Talos-MUID: 9a23:VeX7PgZWcSdAxuBTuWPTiQlABMdU2puiVHwprZw2itvfDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535598501"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 59BE718000243
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 97020CC8C85; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 20/27] python3-git: fix CVE-2026-78678 CVE-2026-78679
Date: Thu, 15 Oct 2026 22:40:59 -0700
Message-Id: <20261016054106.210444-21-yurade@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247948

This patch applies the upstream fix as referenced in [2]
and [3], using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-78678
[3] https://nvd.nist.gov/vuln/detail/cve-2026-78679

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-78678_CVE-2026-78679.patch       | 181 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
new file mode 100644
index 0000000000..a62a069718
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
@@ -0,0 +1,181 @@
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
+- Omitted test/test_diff.py, test/test_refs.py, test/test_remote.py,
+  test/test_repo.py because the Wrynose PyPI source archive does not include
+  the test suite and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py        |  4 +++-
+ git/diff.py       |  7 ++++---
+ git/index/base.py |  3 ++-
+ git/refs/tag.py   | 10 ++++++----
+ git/repo/base.py  | 24 ++++++++++++++++++++----
+ 5 files changed, 35 insertions(+), 13 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index c509ff1a..ddab399e 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -743,7 +743,9 @@ class Git(metaclass=_GitMeta):
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
+diff --git a/git/diff.py b/git/diff.py
+index 9a1f107b..032dfb25 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -216,8 +216,8 @@ class Diffable:
+             to be read and diffed.
+ 
+         :param allow_unsafe_options:
+-            If ``True``, allow options such as ``--output`` that can write to arbitrary
+-            filesystem paths.
++            If ``True``, allow options such as ``--output`` and ``-O`` that can write to
++            or read from arbitrary filesystem paths.
+ 
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-diff(1)`, such as ``R=True`` to
+@@ -234,7 +234,8 @@ class Diffable:
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
+index c608f2d5..cefd6291 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -1550,7 +1550,8 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
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
+index 56a19dc5..d8cc5306 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -196,6 +196,19 @@ class Repo:
+         "-o",
+     ]
+ 
++    unsafe_git_blame_options = unsafe_git_revision_options + [
++        # These options read from arbitrary files and expose their contents through blame output.
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
+@@ -1100,7 +1113,7 @@ class Repo:
+             :manpage:`git-rev-parse(1)` is a valid option.
+ 
+         :param allow_unsafe_options:
+-            Allow unsafe options in revision argument, like ``--output``.
++            Allow unsafe options in revision argument, like ``--output`` or ``--contents``.
+ 
+         :return:
+             Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates the
+@@ -1112,7 +1125,9 @@ class Repo:
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
+@@ -1204,7 +1219,7 @@ class Repo:
+             :manpage:`git-rev-parse(1)` is a valid option.
+ 
+         :param allow_unsafe_options:
+-            Allow unsafe options in revision argument, like ``--output``.
++            Allow unsafe options in revision argument, like ``--output`` or ``--contents``.
+ 
+         :return:
+             list: [git.Commit, list: [<line>]]
+@@ -1220,7 +1235,8 @@ class Repo:
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
+index 487eaa14..7b002f2f 100644
+--- a/git/refs/tag.py
++++ b/git/refs/tag.py
+@@ -134,15 +134,17 @@ class TagReference(Reference):
+         :return:
+             A new :class:`TagReference`.
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 80d52f46d0..18d7299ce3 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -43,6 +43,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76222_p1.patch \
            file://CVE-2026-76222-regression.patch \
            file://CVE-2026-76222_p2.patch \
+           file://CVE-2026-78678_CVE-2026-78679.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


