Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA37FCCF2C0
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:33 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15900.1792131564578225035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IBg2lxjA;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6053; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=v0hln6U+l+r13Qop30OQpn79v7703p7H4tqAqCuNwWQ=;
  b=IBg2lxjAsi+xvGVibq+WGxntxe4GRSDNhGueRzk8ytbSMpAKdYq+l9L0
   et7aekZa1slbD0TajMyXVIMKOX4NyPmMkCOvXJ9nVTqP2qJP0JNVSz1h9
   Y+sMSKQg4RP8H6Wc61Rnoc2KoVQo+jHGRddnkOZZ6y7DlPA3WERy7SGUj
   n+AQl5kk6TxrhLu0G+wuYnAnhP1ox+z2edozigzm+UbPf4NrlDZHMdVwo
   XF5M/dz51joXjgA7XWcURlX3/hQho73HWFeTACQVwC8aEmydYtJfyDurG
   cOV9JRz9q1ayxzRcXkHXgxT8ym6WTeZvu9sn6LLzh+BWmg5jJvllraqUI
   w==;
X-CSE-ConnectionGUID: TCQ317BmTNGxZi9zikhNEg==
X-CSE-MsgGUID: DU+9uQWpQySeYSYExdh3gA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpwNFq/5P/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx2gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAICG?=
 =?us-ascii?q?IgLBIINgQ8SgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegXImL?=
 =?us-ascii?q?Q4SATxRARAbgjJIkyKSBYE1n1qEKIwilToaM4QEgVeSQJJUC5h9jgqWT4Rpg?=
 =?us-ascii?q?Wg8gVkzGggbFYMiCUoZD445g2uFE1HIdicyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:M7mtj6iQuRZD2KOgOpkuFSysX161NxEKZh0ujC45NGQN5FlHY01je
 htvUTqAPfaNMGTwc99xbo2290xSuJeBytFqQFRlqy1nFHxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUk0d8sWD5k8
 MA+ByA/b0GRhuG25p+0H7wEasQLdKEHPasFsX1miDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgh/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJITRGpoIxy50o
 ErqwieoHyglLOWO8je0yUOBluPPxizSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:f34WiKqdXYkuLFn97wyIUFIaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3ArsAFNmiC44u8ty3BQCQUUtDxdDJuTlbkly6PCUq?=
 =?us-ascii?q?EL0l5erzEW16T+IVJnJ87?=
X-Talos-MUID: 9a23:dpDYwQUJYmcMqb/q/BPRx2B/Dfhw2rWVBXE2oLgWt8nfOgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536037751"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 9FD6818000A6D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 123A2CC1253; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 12/27] python3-git: fix CVE-2026-73620
Date: Thu, 15 Oct 2026 23:19:07 -0700
Message-Id: <20261016061922.843414-13-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247973

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/3af0c2516c5e18c829da30338614688f6b69b49c
[2] https://www.cve.org/CVERecord?id=CVE-2026-73620

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73620.patch   | 130 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
new file mode 100644
index 0000000000..9b26f7bf0a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
@@ -0,0 +1,130 @@
+From 5cb503e8d600c1946ed57e720dcee1a31dd5a65e Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 26 Jul 2026 05:54:27 +0200
+Subject: [PATCH 20/38] Block unsafe checkout-index and tag file options
+
+GHSA-3f7w-8rr8-f37f reports that caller-controlled options forwarded by
+IndexFile.checkout() and TagReference.create() can make Git write to or read
+from arbitrary filesystem paths.
+
+Add regression coverage proving the unsafe options are rejected by default while
+preserving the explicit allow_unsafe_options escape hatch. Reuse GitPython's
+existing option candidate normalization and unsafe-option guard at both public
+API boundaries.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18.
+Documentation/git-checkout-index.adoc defines --prefix as prepending an output
+path, and Documentation/git-tag.adoc defines -F/--file as reading a tag message
+from a file.
+
+CVE: CVE-2026-73620
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/3af0c2516c5e18c829da30338614688f6b69b49c]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 3af0c2516c5e18c829da30338614688f6b69b49c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/index/base.py |   12 ++++++++++++
+ git/refs/tag.py   |   13 +++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/git/index/base.py b/git/index/base.py
+index c3d1771c..687b72da 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -141,6 +141,8 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+     before operating on it using the git command.
+     """
+ 
++    unsafe_git_checkout_index_options = ["--prefix"]
++
+     __slots__ = ("repo", "version", "entries", "_extension_data", "_file_path")
+ 
+     _VERSION = 2
+@@ -1156,6 +1158,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         paths: Union[None, Iterable[PathLike]] = None,
+         force: bool = False,
+         fprogress: Callable = lambda *args: None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Union[None, Iterator[PathLike], Sequence[PathLike]]:
+         """Check out the given paths or all files from the version known to the index
+@@ -1179,6 +1182,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             explicit paths are given. Otherwise progress information will be send
+             prior and after a file has been checked out.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, such as ``--prefix``.
++
+         :param kwargs:
+             Additional arguments to be passed to git-checkout-index.
+ 
+@@ -1200,6 +1206,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             different to *head.checkout*, i.e. if you want git-checkout like behaviour,
+             use head.checkout instead of index.checkout.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_checkout_index_options,
++            )
++
+         args = ["--index"]
+         if force:
+             args.append("--force")
+diff --git a/git/refs/tag.py b/git/refs/tag.py
+index a59a5133..640e9702 100644
+--- a/git/refs/tag.py
++++ b/git/refs/tag.py
+@@ -2,6 +2,7 @@
+ # 3-Clause BSD License: https://opensource.org/license/bsd-3-clause/
+ 
+ from .reference import Reference
++from git.cmd import Git
+ 
+ __all__ = ["TagReference", "Tag"]
+ 
+@@ -36,6 +37,8 @@ class TagReference(Reference):
+ 
+     __slots__ = ()
+ 
++    unsafe_git_tag_options = ["--file", "-F"]
++
+     _common_default = "tags"
+     _common_path_default = Reference._common_path_default + "/" + _common_default
+ 
+@@ -83,6 +86,7 @@ class TagReference(Reference):
+         reference: Union[str, "SymbolicReference"] = "HEAD",
+         logmsg: Union[str, None] = None,
+         force: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "TagReference":
+         """Create a new tag reference.
+@@ -108,11 +112,20 @@ class TagReference(Reference):
+         :param force:
+             If True, force creation of a tag even though that tag already exists.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, such as ``--file``.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to git-tag.
+ 
+         :return: A new TagReference.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_tag_options,
++            )
++
+         if "ref" in kwargs and kwargs["ref"]:
+             reference = kwargs["ref"]
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 5bbb20c842..3f04fe8fdb 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -33,6 +33,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73624.patch \
             file://CVE-2026-73622.patch \
             file://CVE-2026-73621.patch \
+            file://CVE-2026-73620.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


