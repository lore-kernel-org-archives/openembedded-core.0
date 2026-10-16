Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB5CCCF2CC
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15611.1792131564294051812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZoFy4xi5;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6405; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zSBgtQiFWRg2SgH/ya3FElF+kJrlmWtrZa887SNkCiY=;
  b=ZoFy4xi5r7nzisvInAMgNwptvHsXn55ys/SOiy2AqiCqycd+kRTNeK5o
   UWNlRBInk6yf16Vigow8OXaO0LtkpXQ38v8s/OFUz+C6Bsc5JT4rYVeCp
   FwC891kF41HFTfZ9LS93R/sqBAW/jqyJot8iKlsrIkPFOfe57HEQVE/cW
   MgA0pvATyw9dg63D0npjIiD2D62KXCEpnDIRxd45TcErMtentY2nmFMr2
   KCGhtCOZOgPq8E7DW+VDuBMS2eOCwJ5xjXxeBIH54PjufzJV8cE8MOhtm
   PCbjuinfKVPp3Py7MmZLgx3LDnR584aRyJqBmk+q5voeT2oHA6OM2F+hD
   g==;
X-CSE-ConnectionGUID: uI0PVcpURYajZ6eXb8M02w==
X-CSE-MsgGUID: nM1rxIj7Sj+K+ZcptH3S9A==
X-IPAS-Result: =?us-ascii?q?A0BLAgDpwNFq/4r/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8doF5M4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEhDgnG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAgIYiAsEgxwSgVqBA45KhXpIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoIYCDMSASwQUQEKIYIUpg2fUYE+hCiMIpU6GjOqbwuYfY4KlTqBF?=
 =?us-ascii?q?YRpgWg8gVkzGggbFTuCZwlKGQ+OOYNrhRNRyHYnMgIGAzIBAQcCBw4DC4Fok?=
 =?us-ascii?q?AItgU8BAQ?=
IronPort-Data: A9a23:H0xozq5YvPUHx62Oecg4nAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mpLUWnTPf/cYGXze4t1b4y/px4O65HUydBnQARv/3szZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIKxAwth8GVx0x
 PUaGm4AXhrTorrs3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwaoCNI4PTHpo9ckCwo
 Eef5XTYAE4hNp+8igiO6m6M3dSetHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rAnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:ciot8KwSbwZhKZxSN0vuKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AIl6diGnybs+vT0IsiLpDj9aJqALXOWD8lE/uKFe?=
 =?us-ascii?q?FM1dgSo/LRG+aqIY8ydU7zg=3D=3D?=
X-Talos-MUID: 9a23:+EFmYwuu1jYThmvnh82nghQ7LtdJ4fuVCgMu0qcNo9WkbhchEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522017137"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 3C6D21800028F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id D762ACC124A; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 04/27] python3-git: fix CVE-2026-67324
Date: Thu, 15 Oct 2026 23:18:59 -0700
Message-Id: <20261016061922.843414-5-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247969

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285
[2] https://www.cve.org/CVERecord?id=CVE-2026-67324

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67324.patch   | 102 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
new file mode 100644
index 0000000000..a780464905
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
@@ -0,0 +1,102 @@
+From a5742dea36a84dece8a01526cdef0714aecac070 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 14:12:16 +0200
+Subject: [PATCH 12/38] fix: reject joined unsafe short options
+
+GitPython blocks options such as --upload-pack/-u and --config/-c
+because they can execute arbitrary commands unless unsafe options are
+explicitly allowed. Git also accepts a short option with its value
+joined to the same token, including after clusterable flags. Forms
+such as -uVALUE, -fuVALUE, -cVALUE, and -vcVALUE could therefore
+bypass an exact-token check.
+
+Parse single-dash option tokens sufficiently to recognize blocked
+short options while preserving safe attached values such as
+-oupstream. Also distinguish clone multi-option values from bare
+kwargs so positional values are not treated as long-option
+abbreviations.
+
+This completes the option-validation hardening for
+GHSA-2f96-g7mh-g2hx.
+
+CVE: CVE-2026-67324
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 56806080c1348749b07daa4a2024ce47b3cad285)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py |   40 ++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 36 insertions(+), 4 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 81ea0b3c..1903bb01 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -562,10 +562,23 @@ class Git(LazyMixin):
+ 
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+-        """Check for unsafe options.
+-
+-        Some options that are passed to `git <command>` can be used to execute
+-        arbitrary commands, this are blocked by default.
++        """Raise :class:`~git.exc.UnsafeOptionError` for blocked option spellings.
++
++        In addition to exact matches, this rejects abbreviated long options accepted
++        by Git (for example, ``--upl`` for ``--upload-pack``) and unsafe short options
++        whose values are joined to the same token, including after clusterable flags
++        (for example, ``-uVALUE`` and ``-fuVALUE``).
++
++        A list containing only bare names is treated as normalized keyword arguments,
++        so multi-character names such as ``upload_p`` are checked as long-option
++        abbreviations. If any item starts with ``-``, the list is treated as tokenized
++        command-line input: bare items can be option values and are not checked as
++        abbreviations. Thus ``["--origin", "upload"]`` is allowed. Single-dash options
++        use short-option parsing rather than broad prefix matching, preserving safe
++        attached values such as ``-oupstream`` and ``-bcurrent``.
++
++        Some options passed to ``git <command>`` can execute arbitrary commands and
++        are therefore blocked by default unless the caller explicitly allows them.
+         """
+         # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
+         # Git accepts any unambiguous prefix of a long option, so an abbreviated
+@@ -575,6 +588,15 @@ class Git(LazyMixin):
+         # can be abbreviations; single-character short options remain exact-match
+         # only.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
++        unsafe_short_options = {
++            canonical: option
++            for canonical, option in canonical_unsafe_options.items()
++            if option.startswith("-") and not option.startswith("--") and len(canonical) == 1
++        }
++        # These value-less Git flags can be clustered before another short option
++        # (for example, ``-fuVALUE``). Stop at any other character because it may
++        # begin an attached value, as ``o`` does in the safe option ``-oupstream``.
++        clusterable_short_options = frozenset("46flnqsv")
+         options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+             candidate = cls._canonicalize_option_name(option)
+@@ -583,6 +605,16 @@ class Git(LazyMixin):
+             unsafe_option = canonical_unsafe_options.get(candidate)
+             if unsafe_option is not None:
+                 raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
++            option_token = option.split("=", 1)[0].split(None, 1)[0]
++            if option_token.startswith("-") and not option_token.startswith("--"):
++                for option_char in option_token[1:]:
++                    unsafe_option = unsafe_short_options.get(option_char)
++                    if unsafe_option is not None:
++                        raise UnsafeOptionError(
++                            f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                        )
++                    if option_char not in clusterable_short_options:
++                        break
+             if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
+                 continue
+             for canonical, unsafe_option in canonical_unsafe_options.items():
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index a36a0faa29..788cc4c173 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -25,6 +25,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-67323.patch \
             file://CVE-2026-67325_p1.patch \
             file://CVE-2026-67325_p2.patch \
+            file://CVE-2026-67324.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


