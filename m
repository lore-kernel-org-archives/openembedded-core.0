Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656C5CCF2CC
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15276.1792129269007115955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gZvETD6p;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6995; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oMeAbSmsGV+yileMUlLuRUD1DkWsWc+DcWoZsAN+MYY=;
  b=gZvETD6pZayI0d5IESYpB4Z2Rh5zYVwbc3ujiX1VGY9Vhy/RWpP0gtv2
   oj++fsNP27vMTzWgd238E1m8I/94KhVYtCw7/l/4fi1hIMVgOqYIPremX
   bVrDa0ec9fVh2kG0k2MNqjFxkzJZXnquQ/UQZpwH7xan3+DxtRimFXO+n
   cT613r7Ptxt19RN4J6vJG/S0ohTMKiAPyQMhacfympcGNp7qUEoohU/52
   1l+1H4hGEMD1tFl9CU6GWmbXZ/3fIjuSvr9gWQnZb1bWCl5jXAG2u/Qv2
   Gim1lgRrKmZGc5Gw/N9WrwM4RL5vWaB3rMmC5dQJ0642ULnoIcL88M6Zy
   w==;
X-CSE-ConnectionGUID: hXmzN0rWRKG/P411Q3OArA==
X-CSE-MsgGUID: 6ZyCUlS5Tr26OopRQfImaw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/5D/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx4gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYMZgWMnG4FJRIEVg2mBBYFcA?=
 =?us-ascii?q?QGIJQSDHBKBWoEDhzaNDkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?iIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeg?=
 =?us-ascii?q?XImTTEMPhMBK4JQJwOSaJI/oQ+EKIwilToaM4QEgVeSQJJUC5h9jgqWT4Rpg?=
 =?us-ascii?q?Wg8gUcLBzMaCBsVO4JnCUoZD445g2uBf4NlyHYnMgIJMgEBBwIHDgMLgWiQA?=
 =?us-ascii?q?i2BTwEB?=
IronPort-Data: A9a23:0JdFF6yGHb6lryqJnWt6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVVn
 TMcCGrSbPzbYzP9etpya4/g/RkBsJ+GyN9nSlNq+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEEGOJ8+ovxIO0Jhs
 sREcWk0NTeqncvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzaICJK43RLSlTthiqt
 0n7+1+kPgtAavuY0QC8/FOpj/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:NS5fv6xklcNaJHHDCeQQKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3Ag6KbI2pTDxb1zjoOr43AqtrmUcAVd2/7lG3vGWy?=
 =?us-ascii?q?XTl41EeSsEni54ooxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AvmMVJA+hI0XbpTwG/OgNhhGQf5la8o+TDHtQrY9?=
 =?us-ascii?q?c5e6DLRZJNRaYhSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536024993"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id EE647180003C5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 54FA5CBEFBF; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 09/27] python3-git: fix CVE-2026-73624
Date: Thu, 15 Oct 2026 22:40:48 -0700
Message-Id: <20261016054106.210444-10-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247941

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1d51b891d7f236044a6aa17498ec682b63dad6e6
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73624

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73624.patch   | 139 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
new file mode 100644
index 0000000000..48e7bc8d8b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
@@ -0,0 +1,139 @@
+From 285d6227b9132ed6bab3cc28665e87b2285757ae Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:46:13 +0200
+Subject: [PATCH] fix: guard diff output options
+
+<!-- agent -->
+
+Reject unsafe diff options before revision parsing or Git invocation so
+callers cannot write command output to arbitrary filesystem paths.
+
+Cover commit and index diffs, including option-like revisions, and
+preserve an explicit allow_unsafe_options escape hatch.
+
+References GHSA-fjr4-x663-mwxc.
+Validated against Git baseline a23bace9.
+
+CVE: CVE-2026-73624
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1d51b891d7f236044a6aa17498ec682b63dad6e6]
+
+Backport Changes:
+- Omitted test/test_diff.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does 
+  not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 1d51b891d7f236044a6aa17498ec682b63dad6e6)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/diff.py       | 14 ++++++++++++--
+ git/index/base.py | 18 ++++++++++++++++--
+ 2 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/git/diff.py b/git/diff.py
+index f89b12d9..9a1f107b 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -9,7 +9,7 @@ import enum
+ import re
+ import warnings
+ 
+-from git.cmd import handle_process_output
++from git.cmd import Git, handle_process_output
+ from git.compat import defenc
+ from git.objects.blob import Blob
+ from git.objects.util import mode_str_to_int
+@@ -34,7 +34,6 @@ from git.types import Literal, PathLike
+ if TYPE_CHECKING:
+     from subprocess import Popen
+ 
+-    from git.cmd import Git
+     from git.objects.base import IndexObject
+     from git.objects.commit import Commit
+     from git.objects.tree import Tree
+@@ -186,6 +185,7 @@ class Diffable:
+         other: Union[DiffConstants, "Tree", "Commit", str, None] = INDEX,
+         paths: Union[PathLike, List[PathLike], Tuple[PathLike, ...], None] = None,
+         create_patch: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "DiffIndex":
+         """Create diffs between two items being trees, trees and index or an index and
+@@ -215,6 +215,10 @@ class Diffable:
+             applied makes the self to other. Patches are somewhat costly as blobs have
+             to be read and diffed.
+ 
++        :param allow_unsafe_options:
++            If ``True``, allow options such as ``--output`` that can write to arbitrary
++            filesystem paths.
++
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-diff(1)`, such as ``R=True`` to
+             swap both sides of the diff.
+@@ -227,6 +231,12 @@ class Diffable:
+             an instance of :class:`~git.objects.tree.Tree` or
+             :class:`~git.objects.commit.Commit`, or a git command error will occur.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([other], kwargs),
++                unsafe_options=self.repo.unsafe_git_revision_options,
++            )
++
+         args: List[Union[PathLike, Diffable]] = []
+         args.append("--abbrev=40")  # We need full shas.
+         args.append("--full-index")  # Get full index paths, not only filenames.
+diff --git a/git/index/base.py b/git/index/base.py
+index b8161ea5..dfe7e0dc 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -23,6 +23,7 @@ from gitdb.base import IStream
+ from gitdb.db import MemoryDB
+ 
+ from git.compat import defenc, force_bytes
++from git.cmd import Git
+ import git.diff as git_diff
+ from git.exc import CheckoutError, GitCommandError, GitError, InvalidGitRepositoryError
+ from git.objects import Blob, Commit, Object, Submodule, Tree
+@@ -1477,6 +1478,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         ] = git_diff.INDEX,
+         paths: Union[PathLike, List[PathLike], Tuple[PathLike, ...], None] = None,
+         create_patch: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> git_diff.DiffIndex:
+         """Diff this index against the working copy or a :class:`~git.objects.tree.Tree`
+@@ -1489,6 +1491,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             Will only work with indices that represent the default git index as they
+             have not been initialized with a stream.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([other], kwargs),
++                unsafe_options=self.repo.unsafe_git_revision_options,
++            )
++
+         # Only run if we are the default repository index.
+         if self._file_path != self._index_path():
+             raise AssertionError("Cannot call %r on indices that do not represent the default git index" % self.diff())
+@@ -1507,7 +1515,13 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             # Invert the existing R flag.
+             cur_val = kwargs.get("R", False)
+             kwargs["R"] = not cur_val
+-            return other.diff(self.INDEX, paths, create_patch, **kwargs)
++            return other.diff(
++                self.INDEX,
++                paths,
++                create_patch,
++                allow_unsafe_options=allow_unsafe_options,
++                **kwargs,
++            )
+         # END diff against other item handling
+ 
+         # If other is not None here, something is wrong.
+@@ -1515,4 +1529,4 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             raise ValueError("other must be None, Diffable.INDEX, a Tree or Commit, was %r" % other)
+ 
+         # Diff against working copy - can be handled by superclass natively.
+-        return super().diff(other, paths, create_patch, **kwargs)
++        return super().diff(other, paths, create_patch, allow_unsafe_options=allow_unsafe_options, **kwargs)
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index d996d4f9f5..847bdfeab2 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-69097.patch \
            file://CVE-2026-73625.patch \
            file://CVE-2026-73623.patch \
+           file://CVE-2026-73624.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


