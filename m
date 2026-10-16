Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FDDCCF2CE
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15556.1792129268499960934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JjpWh0nP;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6488; q=dns/txt;
  s=iport01; t=1792129268; x=1793338868;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6w9LIhIKN6ajhKp2RJMxV8G6boiIIaoxRIYARXifgGY=;
  b=JjpWh0nPsmXmOkhvYONh74WcxYRtxzpaVAHCavgoc13a2dFLhH1Liisi
   PZFndL1QEXc+r4IQ5yxt4JSdMxPz1GasQ4+3AiLIEQUIdTVwUi/eLXriv
   75voiZyYzLp/3apfyEP/I6S1DmSirWeXOKv3Iy7ne3OfErbGKmXTQNJe7
   Mayygn7lnhDAX9zgB89GDNM+mqjbZd7/Prs1ww+bBiZGY4i79R7y1RpWC
   f9/74wZQZTNKDj2aAsDafaSWIET4B2Eyg1pPec+2eNPDBNrqX8mrgqFFV
   JkJLdAmoYQjxBVLLHD5Tobplf0fEgoNxPDqU0d5GQQe75/oIBSII/evW9
   g==;
X-CSE-ConnectionGUID: ynchupdAR+yoTvKatomY9g==
X-CSE-MsgGUID: U/3AWODLQxa7rnMk9ejwpw==
X-IPAS-Result: =?us-ascii?q?A0BLAgCRt9Fq/4z/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8d4F5M4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEhDgnG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAQGIJQSDHBKBWoEDjkqFekiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEP?=
 =?us-ascii?q?m4HkhQeghgIMxIBLBBRAQohghSmDZ9RgT6EKIwilToaM6pvC5h9jgqVOoEVh?=
 =?us-ascii?q?GmBaDyBRwsHMxoIGxU7gmcJShkPjjmDa4F/g2XIdicyAgYDMgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAi2BTwEB?=
IronPort-Data: A9a23:CwIcaqyTXiYNgY+ros56t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 jQeDTyCP6qIMDOmc9tzPY+x8UgF6pODmtI3TgFlqVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFAwNo0F4upeOyJf8
 sAGCzkRaRWy1u3jldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzaoCKJYLTLSlTtnvf/
 Uv52EjdOwETa8aZ7DnU/3CznvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:mlEA5K6FKHrXyahjIgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AhyVC8WvrdrSebBjGLF/fbXx96Is0dHbd0W/cCnX?=
 =?us-ascii?q?7GGFVVp6cVViVyfJrxp8=3D?=
X-Talos-MUID: 9a23:r7rDMQgukIwkpRxXqWGYQsMpCYAzypuJJGQ0gZxZoc+hNn19OSiFk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536227761"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:07 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8E3D8180001EB
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 37A9ECBF204; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 04/27] python3-git: fix CVE-2026-67324
Date: Thu, 15 Oct 2026 22:40:43 -0700
Message-Id: <20261016054106.210444-5-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247933

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-67324

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67324.patch   | 101 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
new file mode 100644
index 0000000000..6f32bcce4f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
@@ -0,0 +1,101 @@
+From b09720b6f8311edac108392bd834e74918836c4f Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 14:12:16 +0200
+Subject: [PATCH] fix: reject joined unsafe short options
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
+- Omitted test/test_clone.py, test/test_git.py, test/test_remote.py 
+  because the current PyPI source archive does not include the test 
+  suite and the python3-git recipe does not run it.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 56806080c1348749b07daa4a2024ce47b3cad285)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 40 ++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 36 insertions(+), 4 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 523029fc..75495dc1 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -733,10 +733,23 @@ class Git(metaclass=_GitMeta):
+ 
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+-        """Check for unsafe options.
+-
+-        Some options that are passed to ``git <command>`` can be used to execute
+-        arbitrary commands. These are blocked by default.
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
+@@ -746,6 +759,15 @@ class Git(metaclass=_GitMeta):
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
+@@ -754,6 +776,16 @@ class Git(metaclass=_GitMeta):
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 76a21c670f..ca2efce37e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67323.patch \
            file://CVE-2026-67325_p1.patch \
            file://CVE-2026-67325_p2.patch \
+           file://CVE-2026-67324.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


