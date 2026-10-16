Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE10ACCF2CB
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15611.1792131564294051812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DYgyO+c1;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8022; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SWha3Ok9Scp9z+SZDlKzbLbQ1iSIUs4pqrDW8rwmiCE=;
  b=DYgyO+c16/dtZ9l2A91cfvfVDa7sDCYLYKT4hwchT45m37yMKntQClD+
   291HDNT8sLDmjYqodDl0IbPMk7DoG/7P0ZJ0mWq6fEkIuDLUhR47uuRUI
   ouvlq/RELbNH5c3mJFySOnQcC8RdLukWK07GNk714z3XScSwNps/cbejf
   CeRQB1NxNAfwTDIiu1gCJ/q7+yB7rsLc+lbOd5dl0WkC/FXw2KYwu0SrV
   8F2YlvR0zUgQbbroDEXi1TGwgBkc4JBaCuQQ8ViZrfctj3pcZXvjzm7Yh
   6qW3AGxVdXTka2YKaPVfjB06gmHJ5LHR/GAp2MR/4g2uqR04se9tShCjC
   A==;
X-CSE-ConnectionGUID: JLnIVub/Q+ef1KisAbThfQ==
X-CSE-MsgGUID: XExyuF1sTImMzO4FAWYp3w==
X-IPAS-Result: =?us-ascii?q?A0BMAgDpwNFq/4z/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOTHop+gX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKx0BBQgZgwIBg?=
 =?us-ascii?q?joDNwMRvHaBeTOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIQ4JxuBS?=
 =?us-ascii?q?USBFYNpgQWBXAICGIgLBIMcEoFagQOUREiBHgNZLAFVEw0KCwcFgWgDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3F?=
 =?us-ascii?q?RkEPm4HkhQeghg7Ej0cGwcEDwErgTQPCgQsL5M1CpI2oQ+EKIwilToaM4Vbp?=
 =?us-ascii?q?RQLmH2OCpZPhGmBaDyBWTMaCBsVO4JnCUoZD445g2uFE1FsyAonMgIGAzIBA?=
 =?us-ascii?q?QcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:H54oDa3IjIFte6JElfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2QOz
 GBLDD+GaP2PNGOje9skYY6y9EsFuJLUm4NlTANo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLmUwHLMF8KFOQmxAr
 N8ZMxkHUhCNvrfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsiuK1aYWMJofiqcN9rmuIt
 3/opn/FIxQ/JvvD5xO6w2r3mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXJIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:fQGXOaOmpXGF4sBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:Kkp4f2Ov/ZKZRe5Deg1h1XAJEIccMXDTlVTROGayNWZncejA
X-Talos-MUID: 9a23:qGa3mglUeHkod58SYkMvdnpSGdd5/or3E3wslLAUnJWqHBNBI2yC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522017143"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 853EE180001CD
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id DCCB1CC124B; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 05/27] python3-git: fix CVE-2026-67322
Date: Thu, 15 Oct 2026 23:19:00 -0700
Message-Id: <20261016061922.843414-6-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247976

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1]

[1] https://github.com/gitpython-developers/GitPython/commit/8ac5a30519b6f4af85398b9b9d7064ff4d452da2
[2] https://www.cve.org/CVERecord?id=CVE-2026-67322

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67322.patch   | 174 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
new file mode 100644
index 0000000000..1c378c9e77
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
@@ -0,0 +1,174 @@
+From eca51fe4d3741f64b4204a6da04536d428390a4f Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 15 Jul 2026 16:44:13 +0200
+Subject: [PATCH 13/38] fix: prevent environment expansion in clone URLs
+
+Repo.clone_from() expanded environment-variable references in caller-supplied
+URLs before passing them to git clone. This could expose process environment
+values to an untrusted remote and made protocol validation apply to a different
+value than Git received.
+
+Polish clone URLs without variable or home expansion on native and Cygwin
+Git, then apply unsafe-protocol validation to that exact normalized value.
+Preserve the literal URL when normalizing the stored origin after a successful
+clone, while retaining the existing Git.polish_url() default for callers
+that intentionally normalize local paths. Add regression coverage for
+POSIX and Windows variable syntax, Cygwin conversion, stored origins, and
+post-normalization protocol validation.
+
+Git baseline: git clone passes URL arguments through literally; t/t5601-clone.sh
+covers the accepted URL forms without shell-style environment expansion.
+
+Security: GHSA-rwj8-pgh3-r573.
+
+CVE: CVE-2026-67322
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/8ac5a30519b6f4af85398b9b9d7064ff4d452da2]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 8ac5a30519b6f4af85398b9b9d7064ff4d452da2)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py       |   29 ++++++++++++++++-------------
+ git/repo/base.py |    7 ++++---
+ git/util.py      |   15 +++++++++------
+ 3 files changed, 29 insertions(+), 22 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 1903bb01..46619459 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -497,31 +497,34 @@ class Git(LazyMixin):
+ 
+     @overload
+     @classmethod
+-    def polish_url(cls, url: str, is_cygwin: Literal[False] = ...) -> str:
+-        ...
++    def polish_url(cls, url: str, is_cygwin: Literal[False] = ..., expand_vars: bool = ...) -> str: ...
+ 
+     @overload
+     @classmethod
+-    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None) -> str:
+-        ...
++    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None, expand_vars: bool = True) -> str: ...
+ 
+     @classmethod
+-    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None) -> PathLike:
+-        """Remove any backslashes from urls to be written in config files.
++    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None, expand_vars: bool = True) -> PathLike:
++        """Remove any backslashes from URLs to be written in config files.
++
++        Windows might create config files containing paths with backslashes, but git
++        stops liking them as it will escape the backslashes. Hence we undo the escaping
++        just to be sure.
+ 
+-        Windows might create config files containing paths with backslashes,
+-        but git stops liking them as it will escape the backslashes. Hence we
+-        undo the escaping just to be sure.
++        :param expand_vars:
++            Expand environment variables and an initial ``~``. Disable this for values
++            obtained from an untrusted source, such as remote URLs.
+         """
+         if is_cygwin is None:
+             is_cygwin = cls.is_cygwin()
+ 
+         if is_cygwin:
+-            url = cygpath(url)
++            url = cygpath(url, expand_vars=expand_vars)
+         else:
+-            url = os.path.expandvars(url)
+-            if url.startswith("~"):
+-                url = os.path.expanduser(url)
++            if expand_vars:
++                url = os.path.expandvars(url)
++                if url.startswith("~"):
++                    url = os.path.expanduser(url)
+             url = url.replace("\\\\", "\\").replace("\\", "/")
+         return url
+ 
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 5b255997..0440a92d 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1316,8 +1316,9 @@ class Repo:
+         if multi_options:
+             multi = shlex.split(" ".join(multi_options))
+ 
++        clone_url = Git.polish_url(url, expand_vars=False)
+         if not allow_unsafe_protocols:
+-            Git.check_unsafe_protocols(str(url))
++            Git.check_unsafe_protocols(clone_url)
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([], kwargs),
+@@ -1329,7 +1330,7 @@ class Repo:
+         proc = git.clone(
+             multi,
+             "--",
+-            Git.polish_url(str(url)),
++            clone_url,
+             clone_path,
+             with_extended_output=True,
+             as_process=True,
+@@ -1370,7 +1371,7 @@ class Repo:
+         # sure.
+         if repo.remotes:
+             with repo.remotes[0].config_writer as writer:
+-                writer.set_value("url", Git.polish_url(repo.remotes[0].url))
++                writer.set_value("url", Git.polish_url(repo.remotes[0].url, expand_vars=False))
+         # END handle remote repo
+         return repo
+ 
+diff --git a/git/util.py b/git/util.py
+index 5a136d18..d3eaeb8b 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -361,13 +361,13 @@ def py_where(program: str, path: Optional[PathLike] = None) -> List[str]:
+     return progs
+ 
+ 
+-def _cygexpath(drive: Optional[str], path: str) -> str:
++def _cygexpath(drive: Optional[str], path: str, expand_vars: bool = True) -> str:
+     if osp.isabs(path) and not drive:
+         # Invoked from `cygpath()` directly with `D:Apps\123`?
+         #  It's an error, leave it alone just slashes)
+         p = path  # convert to str if AnyPath given
+     else:
+-        p = path and osp.normpath(osp.expandvars(osp.expanduser(path)))
++        p = path and osp.normpath(osp.expandvars(osp.expanduser(path)) if expand_vars else path)
+         if osp.isabs(p):
+             if drive:
+                 # Confusing, maybe a remote system should expand vars.
+@@ -395,7 +395,7 @@ _cygpath_parsers: Tuple[Tuple[Pattern[str], Callable, bool], ...] = (
+ )
+ 
+ 
+-def cygpath(path: str) -> str:
++def cygpath(path: str, expand_vars: bool = True) -> str:
+     """Use :meth:`git.cmd.Git.polish_url` instead, that works on any environment."""
+     path = str(path)  # Ensure is str and not AnyPath.
+     # Fix to use Paths when 3.5 dropped. Or to be just str if only for URLs?
+@@ -403,12 +403,15 @@ def cygpath(path: str) -> str:
+         for regex, parser, recurse in _cygpath_parsers:
+             match = regex.match(path)
+             if match:
+-                path = parser(*match.groups())
++                if parser is _cygexpath:
++                    path = parser(*match.groups(), expand_vars=expand_vars)
++                else:
++                    path = parser(*match.groups())
+                 if recurse:
+-                    path = cygpath(path)
++                    path = cygpath(path, expand_vars=expand_vars)
+                 break
+         else:
+-            path = _cygexpath(None, path)
++            path = _cygexpath(None, path, expand_vars=expand_vars)
+ 
+     return path
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 788cc4c173..cbfdb5e757 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -26,6 +26,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-67325_p1.patch \
             file://CVE-2026-67325_p2.patch \
             file://CVE-2026-67324.patch \
+            file://CVE-2026-67322.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


