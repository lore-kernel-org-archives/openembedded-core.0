Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82341CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15273.1792129268347065025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GD2GFt63;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6153; q=dns/txt;
  s=iport01; t=1792129268; x=1793338868;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4k19olTJcyRnonSYzVnLFtr5ouMJ99mHhb0Vh1rOLtI=;
  b=GD2GFt63HS3FXKB+Nl5BRrgnMyF3PaABBZSeyw2IVbcNBEuXMT927w1+
   OCm+p66U+9/4TmIgh7yg9GpdeYjGJDNGjpmJN4IU9hsQbd/odvtbf5X0Z
   pr3yxmGcq5mQvVUBBrk3Ravav/GxDWoHZJx9ml3966ohAgfSSdipGmPJs
   WccmQjTzXrpNsZNeZW6BtZ0FN4iD2cCrbwK7ZEqWrsLpa6vrlm1qHUrHK
   vYfjHlIUhE51Q1Lcy8XZtfm9hcyw/jHkweWpoyk734V/F52LSlqOgBtZQ
   IoGCpK06H6JgrrNlaW4T1mCRZCFI/8Cz3penjCQywF9NvZaG1ZKd+kgJT
   A==;
X-CSE-ConnectionGUID: NmwOc+0dSOyh1jglQ3Eujg==
X-CSE-MsgGUID: PsOXc3b+S1i0WEsIvIR4Zg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/4//Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx4gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAEBi?=
 =?us-ascii?q?CUEgg2BDxKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6BciYtD?=
 =?us-ascii?q?hIBPFEBEBuCMkiTIpIFgTWfWoQojCKVOhozhASBV5JAklQLmH2OCpZPhGmBa?=
 =?us-ascii?q?DyBRwsHMxoIGxWDIglKGQ+OOYNrgX+DZch2JzICCTIBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:Nz+bXqBi5O/rdhVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDJxg2MAz
 TdLX2mDa/+DZzahLtl0aIXi8BkF78CGyoI3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5fBxK0p1ZYEj3fd3WGNB8
 cVDBS0PYUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOl1IogOK8bIq9ltqifd5yrk3Dr
 CH9pmWhPTwBFcK+82a3/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVlOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:X9cJ86Mt8MjiasBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:/SpTQGOIFGIxP+5Dfix400VXQsweVWzdlXXfJ3bjJHtrR+jA
X-Talos-MUID: 9a23:UR1PbwrvrTLSjI7ZcRIezwl5E/djuK7tMxkMyaoroOiaFBYsCTjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536182948"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 0182D1800024C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 6808BCBEF6D; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 12/27] python3-git: fix CVE-2026-73620
Date: Thu, 15 Oct 2026 22:40:51 -0700
Message-Id: <20261016054106.210444-13-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247934

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/3af0c2516c5e18c829da30338614688f6b69b49c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73620

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73620.patch   | 130 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
new file mode 100644
index 0000000000..816180c2d7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
@@ -0,0 +1,130 @@
+From cc80ea13457773907fa7843e274dca8dc7d196a5 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 26 Jul 2026 05:54:27 +0200
+Subject: [PATCH] Block unsafe checkout-index and tag file options
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
+- Omitted test/test_index.py, test/test_refs.py because the current PyPI 
+  source archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 3af0c2516c5e18c829da30338614688f6b69b49c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/index/base.py | 12 ++++++++++++
+ git/refs/tag.py   | 13 +++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/git/index/base.py b/git/index/base.py
+index dfe7e0dc..90d4c16f 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -130,6 +130,8 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+     index directly before operating on it using the git command.
+     """
+ 
++    unsafe_git_checkout_index_options = ["--prefix"]
++
+     __slots__ = ("repo", "version", "entries", "_extension_data", "_file_path")
+ 
+     _VERSION = 2
+@@ -1199,6 +1201,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         paths: Union[None, Iterable[PathLike]] = None,
+         force: bool = False,
+         fprogress: Callable = lambda *args: None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Union[None, Iterator[PathLike], Sequence[PathLike]]:
+         """Check out the given paths or all files from the version known to the index
+@@ -1225,6 +1228,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             no explicit paths are given. Otherwise progress information will be send
+             prior and after a file has been checked out.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, such as ``--prefix``.
++
+         :param kwargs:
+             Additional arguments to be passed to :manpage:`git-checkout-index(1)`.
+ 
+@@ -1248,6 +1254,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             i.e. if you want :manpage:`git-checkout(1)`-like behaviour, use
+             ``head.checkout`` instead of ``index.checkout``.
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
+index 1e38663a..487eaa14 100644
+--- a/git/refs/tag.py
++++ b/git/refs/tag.py
+@@ -16,6 +16,7 @@ from .reference import Reference
+ 
+ from typing import Any, TYPE_CHECKING, Type, Union
+ 
++from git.cmd import Git
+ from git.types import AnyGitObject, PathLike
+ 
+ if TYPE_CHECKING:
+@@ -42,6 +43,8 @@ class TagReference(Reference):
+ 
+     __slots__ = ()
+ 
++    unsafe_git_tag_options = ["--file", "-F"]
++
+     _common_default = "tags"
+     _common_path_default = Reference._common_path_default + "/" + _common_default
+ 
+@@ -92,6 +95,7 @@ class TagReference(Reference):
+         reference: Union[str, "SymbolicReference"] = "HEAD",
+         logmsg: Union[str, None] = None,
+         force: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "TagReference":
+         """Create a new tag reference.
+@@ -121,12 +125,21 @@ class TagReference(Reference):
+         :param force:
+             If ``True``, force creation of a tag even though that tag already exists.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, such as ``--file``.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to :manpage:`git-tag(1)`.
+ 
+         :return:
+             A new :class:`TagReference`.
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index f712a0e699..d47ce73d72 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73624.patch \
            file://CVE-2026-73622.patch \
            file://CVE-2026-73621.patch \
+           file://CVE-2026-73620.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


