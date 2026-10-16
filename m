Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD82CCA48F
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:32 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15612.1792131564472441473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MfvtAeyR;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4161; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eqd09agjIaLh/DSuHrNS6YZBGfk4BR2S5w53nznAwIw=;
  b=MfvtAeyRhel1g5HR1mx9JwJxyH0GKHzkmEbzaYzf+k8NLXp/7/PBKm2j
   dAHlzE1XHA2rUDe6Emm6vlDmIRuHGP0+l7khPZcuZwglN4qHdL+4z39YL
   gEIS1VC0A7FcdcW45N8sF/32Kf/SZLsg7RXKvOXfRltdf4iEIC16vBoxe
   HO4hxwPoeVxEuoJMihEMhGylsb9FdTv/GqiuI1rRig6o3Wp8ruy88x0T8
   WsaU6Yq+WVyc4Gmpenj6KQX+tx7o6nZMSYrywr72wsVMmBJ78ggSJXNXI
   cKrxzdp1cya47gSt3HT6IT9STCJY8ErY8PyxjncxyM5FmYaX8MWjg4U2E
   w==;
X-CSE-ConnectionGUID: TqRlqjM5QA2B0I4f6z0Meg==
X-CSE-MsgGUID: cuPJELK8RW2t6daSRzfawQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgBrwNFq/4z/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8doF5M4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAFEhDgnG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAgIYiAsEgg2BDxKBWoEDhAuQOUiBHgNZLAFVEw0KCwcFgWgDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3F?=
 =?us-ascii?q?RkEPm4HkhQeghhNPVEBK4FNbqNFgiGhD4QojCKVOhozqm8LmH2OCpZPhGmBa?=
 =?us-ascii?q?DyBWTMaCBsVO4JnCUoZD445g2uFE1HIdicyAgYDMgEBBwIHDgMLgWiQAi2BT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:gvePWa227E63M1gnOPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzQPy
 TZLUW+FM/7cMWb0e49wbIzkpEMHuJKBytY2SQI53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGMFgMOZQa37tOKDtkr
 d1EJm4fNjWOiLfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+W2a4aMKoDiqcN9lVugh
 E/i3DTDPUsGatCW8gCX/Huzv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXJIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:F4/uEquYlyIPn7et2HnzevS87skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:nMiHcm3uIEjg9XUn7LuDfbxfJtkfdmTf6SrpChWSUUc1RuOHEXqd9/Yx
X-Talos-MUID: 9a23:tavqTAmIZkGxoGM5DRgMdnppKf9KzoCNWHoyy4lYt8C/Dz5+Miik2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535334184"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8D97618000618
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id E7762CC124D; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 07/27] python3-git: fix CVE-2026-73625
Date: Thu, 15 Oct 2026 23:19:02 -0700
Message-Id: <20261016061922.843414-8-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247972

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453
[2] https://www.cve.org/CVERecord?id=CVE-2026-73625

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73625.patch   | 68 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
new file mode 100644
index 0000000000..995c7cbaa0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
@@ -0,0 +1,68 @@
+From ac1290549f1f8fa8ba19370805200f69b52a56db Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:39:00 +0200
+Subject: [PATCH 15/38] fix: validate split short-option values
+
+<!-- agent -->
+
+Single-character keyword arguments are transformed into an option token and
+a separate value token. The unsafe-option candidate builder only checked the
+keyword name, allowing an option-like value to bypass guards shared by clone,
+remote, revision, blame, and archive operations.
+
+Include dash-prefixed values only when short options are actually split,
+including sequence values, while preserving bare values and the non-splitting
+compatibility path.
+
+Git baseline a23bace9 defines clone -n and --upload-pack as distinct options,
+matching the argv boundary this validation now preserves.
+
+Refs GHSA-r9mr-m37c-5fr3.
+
+CVE: CVE-2026-73625
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit e8d0fbf774d1f6baa3b481adfe48bd262e43b453)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py |   20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 46619459..f907fa4e 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -626,6 +626,26 @@ class Git(LazyMixin):
+                         f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+                     )
+ 
++    @classmethod
++    def _option_candidates(cls, args: Sequence[Any] = (), kwargs: Optional[Mapping[str, Any]] = None) -> List[str]:
++        """Collect possible option spellings before command-line transformation."""
++        options = [
++            option for option in cls._unpack_args([arg for arg in args if arg is not None]) if option.startswith("-")
++        ]
++        if kwargs:
++            split_single_char_options = kwargs.get("split_single_char_options", True)
++            for key, value in kwargs.items():
++                values = value if isinstance(value, (list, tuple)) else (value,)
++                if any(value is True or (value is not False and value is not None) for value in values):
++                    key = str(key)
++                    options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
++                    if len(key) == 1 and split_single_char_options:
++                        options.extend(
++                            str(value)
++                            for value in values
++                            if value is not True and value not in (False, None) and str(value).startswith("-")
++                        )
++        return options
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index c5cefeaee8..18132b8af9 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -28,6 +28,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-67324.patch \
             file://CVE-2026-67322.patch \
             file://CVE-2026-69097.patch \
+            file://CVE-2026-73625.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


