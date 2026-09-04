Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8E6C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:40:10 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10236.1788514808708068871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jJFReIeK;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6715; q=dns/txt;
  s=iport01; t=1788514808; x=1789724408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ymGP+Mbs6aK4vaBA6RDSC3nIEU7/aFF7wz8jHtO3ytc=;
  b=jJFReIeKRoNFU7oszJfvBdD3kuW5u6YSHOBWObRRs+ZvLQR6+P0LFPnQ
   ToNvnISlde25XR31+wVxI+NvNc02i9ZkQz9PquatEGI42bDkxTxUiUePv
   Rrpxt/bNP6kuGeY3PVk0AS+QTUa66Bz+gbEyuu9a1sqR8ysUVvJCxwa/W
   1IDDPlnz1svzcmEFh4Ne05/GWE5iLAVJddN2jiLTGeOqUKngbegX1epD1
   bc0jq0SeubD0k5f5XKRc5XyMTfdyZ93qp5vp6130p1NCHGoAMX8HMn/EU
   +WgJOisy3md41kSkwVAKjPxb6C3fd7dXZVwE4JddenrHRvn8BGl2QuuKh
   Q==;
X-CSE-ConnectionGUID: tohY09H2TzebZ3UGtdGoiw==
X-CSE-MsgGUID: M+TOLekiS7CxczttvUvhVw==
X-IPAS-Result: =?us-ascii?q?A0BFAgB6kZpq/4wQJK1aglmCV3RgQ0kDlkeeHoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/Ro4EAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBkBAgEqCwEYAS0sAwECWiMhgwIBgnQDEcJ1gXkzgQGDKAE/AkNQ2?=
 =?us-ascii?q?zEBCxQBgTiFP4giXRgBRIQ4JxsbgXKBFYNpgQWBXAEBgUyGWQSCInoSgVqBD?=
 =?us-ascii?q?pB/SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2e?=
 =?us-ascii?q?oEJXoErKWABEheBCYIIAoJUggMCAUlDDgdHUwknQQQLGA1IESw3FRkEPm4Hj?=
 =?us-ascii?q?l8fggMtIAGBDQEKIYFNpDSCIaEPCiiDdowilToaM6ptC5h9jgqVO4EVhGmBa?=
 =?us-ascii?q?DyBRwsHcBU7gmcJShkPjjmDa4F/g2XGVScyAgYDMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:7y2gn6IM9L/St36qFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENSgWdVm
 zQeXG6GMqvYZjGhc9Fyao+y/E9UusCAz9AyTFYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9imYvaj58B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yC0EHZdw4oNplDGt8r
 sE3NDwiaRGc0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhiumza4WKK4PiqcN9uwWkg
 UbL/GXCXToKP86D1SS47HKSmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXIIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:5Bd/4qDNH59bahflHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AYl8r0Ggew9MVUh12gYVjrqPzIDJubnrd/S+BAxW?=
 =?us-ascii?q?EG2tjeuaoZkOc16RljJ87?=
X-Talos-MUID: 9a23:t4cajQl/wVDnaWxodar4dnpHd/tPx6mtCXtSuoUNqdWYKxFuOwmC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="829637797"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:40:07 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 9FC931800043A;
	Fri,  4 Sep 2026 09:40:07 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3FA93CCA79B; Fri,  4 Sep 2026 02:40:07 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2 2/4] python3-git: fix CVE-2026-42215
Date: Fri,  4 Sep 2026 02:40:04 -0700
Message-Id: <20260904094004.1528880-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245084

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.47 backport for
CVE-2026-42215. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commits are referenced in [3] and [4].

[1] https://github.com/gitpython-developers/GitPython/commit/0f68db0710f9125762fca5dbc2328593537ae923
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42215
[3] https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6
[4] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Dropped the separate linter-fix _p2 patch.
- Renamed the CVE-fix _p3 patch to _p2.
---
 .../python3-git/CVE-2026-42215_p1.patch       | 61 +++++++++++++++++++
 .../python3-git/CVE-2026-42215_p2.patch       | 47 ++++++++++++++
 .../python/python3-git_3.1.42.bb              |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
new file mode 100644
index 0000000000..9d5f10c694
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
@@ -0,0 +1,61 @@
+From 341a49149a37762e12b10eb70605b54f4abfb54d Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Mon, 20 Apr 2026 23:29:50 -0400
+Subject: [PATCH] Block unsafe underscored git kwargs / Fix for
+ GHSA-rpm5-65cw-6hj4
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+(cherry picked from commit 142195888e713542189533a52cdfc333f05c3af6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index f58e6df5..874acb43 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -540,6 +540,12 @@ class Git(LazyMixin):
+                 f"The `{protocol}::` protocol looks suspicious, use `allow_unsafe_protocols=True` to allow it."
+             )
+ 
++    @classmethod
++    def _canonicalize_option_name(cls, option: str) -> str:
++        """Normalize an option or kwarg name for unsafe-option checks."""
++        option_name = option.lstrip("-").split("=", 1)[0].split(None, 1)[0]
++        return dashify(option_name)
++
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+         """Check for unsafe options.
+@@ -547,15 +553,14 @@ class Git(LazyMixin):
+         Some options that are passed to `git <command>` can be used to execute
+         arbitrary commands, this are blocked by default.
+         """
+-        # Options can be of the form `foo` or `--foo bar` `--foo=bar`,
+-        # so we need to check if they start with "--foo" or if they are equal to "foo".
+-        bare_unsafe_options = [option.lstrip("-") for option in unsafe_options]
++        # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
++        canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
+         for option in options:
+-            for unsafe_option, bare_option in zip(unsafe_options, bare_unsafe_options):
+-                if option.startswith(unsafe_option) or option == bare_option:
+-                    raise UnsafeOptionError(
+-                        f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+-                    )
++            unsafe_option = canonical_unsafe_options.get(cls._canonicalize_option_name(option))
++            if unsafe_option is not None:
++                raise UnsafeOptionError(
++                    f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                )
+ 
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
new file mode 100644
index 0000000000..cef3fe6b01
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
@@ -0,0 +1,47 @@
+From 3385ff27397b58288d922838e8d2eae87d7534fd Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Tue, 21 Apr 2026 12:03:20 -0400
+Subject: [PATCH] git.cmd: harden unsafe option canonicalization and isolate
+ push test cases
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8]
+
+Backport Changes:
+- Omit regression test updates because the Scarthgap PyPI
+  source archive does not include the upstream test suite.
+
+(cherry picked from commit 43d92dec4683568d11495956dd556161f17c3ea8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 69756216..73b4c052 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -542,9 +542,18 @@ class Git(LazyMixin):
+ 
+     @classmethod
+     def _canonicalize_option_name(cls, option: str) -> str:
+-        """Normalize an option or kwarg name for unsafe-option checks."""
+-        option_name = option.lstrip("-").split("=", 1)[0].split(None, 1)[0]
+-        return dashify(option_name)
++        """Return the option name used for unsafe-option checks.
++
++        Examples:
++            ``"--upload-pack=/tmp/helper"`` -> ``"upload-pack"``
++            ``"upload_pack"`` -> ``"upload-pack"``
++            ``"--config core.filemode=false"`` -> ``"config"``
++        """
++        option_name = option.lstrip("-").split("=", 1)[0]
++        option_tokens = option_name.split(None, 1)
++        if not option_tokens:
++            return ""
++        return dashify(option_tokens[0])
+ 
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index c294b23112..67742d22a4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -13,6 +13,8 @@ PYPI_PACKAGE = "GitPython"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \
+           file://CVE-2026-42215_p1.patch \
+           file://CVE-2026-42215_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.35.6


