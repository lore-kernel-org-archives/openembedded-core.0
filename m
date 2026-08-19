Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723D5C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:08:20 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.656.1787116092318433195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y0U2vW9t;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8248; q=dns/txt;
  s=iport01; t=1787116092; x=1788325692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yO1A+oqUICGiNu9tNL+rdv8o1nrg5V1G4z5/CsY0wGI=;
  b=Y0U2vW9tSlcIkLl1CZEGPO6wmBODBt+LAc9kcfQe6+BcnyU8wLXKHV90
   hax74G42tSqFi30w5cpCDOnYFI3fqCokTt3xsLNB/GZxxRulNm6vl4l0u
   vAU1xBpZ176x7wv9x9X07Wq9SHYZte1HN6iwnblbefkBYPJlI9HuJE+cR
   II3ysFq1sflr2UWq3HvKzRv3oA05bfeNJjPwoBSxQdBJSVOiAngiDZzO8
   srY0pj0Vnu3f0TW4DpelozH59t+j8Vx7GnYUuPL2pHtxjx/OtXYiE3z11
   hi9TH+cR99oTR+jNV3EfyAG17QsqH+0nz8U43PAu7oq1O4N6c1kmH3wtm
   g==;
X-CSE-ConnectionGUID: /Mqq41plQB66jftGcgkN/A==
X-CSE-MsgGUID: zeTDyazER8qgwJN2yNCP4A==
X-IPAS-Result: =?us-ascii?q?A0BIAgD/OYVq/4wQJK1aHgEBCxIMggULgld0XkNJA5ZHA?=
 =?us-ascii?q?54bgX4PAQEBD0QNBAEBhD9GAo1rAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxHDF?=
 =?us-ascii?q?oF5M4EBgygBgVTbMAELFAEFgTOFP4giXRgBRIQ4JxsbgXKBFYNpgQWBXAKBT?=
 =?us-ascii?q?IZZBIIiehKBWoEtkDhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?gWBHYEohDcjGTZ6gQlegSsqYQESF4EJggoCgnOCBgIBSUURCgsLGA1IESw3F?=
 =?us-ascii?q?BkEPm4HjkkggicgAYENAQohgU1fo1WCIaEPCiiDdowhlToaM6psC5h9jgqVO?=
 =?us-ascii?q?4EVhGmBaDyBWXAVO4JnCUoZD444g2uFZMZVJzICBgMDLwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:IrciIqiPHL1TvkYKibu8TcxQX161NhEKZh0ujC45NGQN5FlHY01je
 htvCmGEbvuJZWX8ethwad+1oEtUvsSDx4UyGVRsqC9jFCxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/vS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVf3/9uXThW8
 cUydm4PYAysjO215vWSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKFIo3XGpUExxfwS
 mTu7WnFLgATJvGlmSOK7VCK3P7pthuncddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Jxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:2qg35KrZlyeMcYTeNELe4dEaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:ZvXCE2PBL2Z7Iu5DHwx+7RJNAsQcWCODznnMDES3CkAuYejA
X-Talos-MUID: 9a23:BOjirQiN8Q3PNpRqOZNcnMMpJspUz7WnGm03wYwJpOuibz1WEA/BpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="809578919"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:08:11 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 56689180001CF;
	Wed, 19 Aug 2026 05:08:11 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E6F48CCD9B2; Tue, 18 Aug 2026 22:08:10 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/4] python3-git: fix CVE-2026-42215
Date: Tue, 18 Aug 2026 22:08:06 -0700
Message-Id: <20260819050808.3986732-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819050808.3986732-1-dkelaiya@cisco.com>
References: <20260819050808.3986732-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243698

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [4], using all the
backported commits shown in [1], [2], and [3].

[1] https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6
[2] https://github.com/gitpython-developers/GitPython/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826
[3] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8
[4] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rpm5-65cw-6hj4

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-git/CVE-2026-42215_p1.patch       | 60 +++++++++++++++++++
 .../python3-git/CVE-2026-42215_p2.patch       | 29 +++++++++
 .../python3-git/CVE-2026-42215_p3.patch       | 45 ++++++++++++++
 .../python/python3-git_3.1.43.bb              |  3 +
 4 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
new file mode 100644
index 0000000000..0129250fdf
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
@@ -0,0 +1,60 @@
+From dd5d1c4ddcc5d44faf4e71bcfa338f09db2022d6 Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Mon, 20 Apr 2026 23:29:50 -0400
+Subject: [PATCH] Block unsafe underscored git kwargs / Fix for
+ GHSA-rpm5-65cw-6hj4
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_git.py, and
+  test/test_remote.py because the PyPI 3.1.43 source used by the
+  recipe does not ship the upstream test tree.
+
+(cherry picked from commit 142195888e713542189533a52cdfc333f05c3af6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 90fc39cd..2ecb8e66 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -711,6 +711,12 @@ class Git(metaclass=_GitMeta):
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
+@@ -718,15 +724,14 @@ class Git(metaclass=_GitMeta):
+         Some options that are passed to ``git <command>`` can be used to execute
+         arbitrary commands. These are blocked by default.
+         """
+-        # Options can be of the form `foo`, `--foo bar`, or `--foo=bar`, so we need to
+-        # check if they start with "--foo" or if they are equal to "foo".
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
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
new file mode 100644
index 0000000000..4326bede07
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
@@ -0,0 +1,29 @@
+From e77461e6953a67f17ecd1808c352e6613a17345b Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Mon, 20 Apr 2026 23:43:59 -0400
+Subject: [PATCH] linter fix
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826]
+
+(cherry picked from commit 9aed7cf8c20f69effcfcf7ebef09f312f73ab826)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 2ecb8e66..372eac28 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -729,9 +729,7 @@ class Git(metaclass=_GitMeta):
+         for option in options:
+             unsafe_option = canonical_unsafe_options.get(cls._canonicalize_option_name(option))
+             if unsafe_option is not None:
+-                raise UnsafeOptionError(
+-                    f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+-                )
++                raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
+ 
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch
new file mode 100644
index 0000000000..a23fba8d81
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch
@@ -0,0 +1,45 @@
+From 3ee4db90229dbb1fbdc8572dc8219990d70db368 Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Tue, 21 Apr 2026 12:03:20 -0400
+Subject: [PATCH] git.cmd: harden unsafe option canonicalization and isolate
+ push test cases
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8]
+
+Backport Changes:
+- Omitted test/test_remote.py because the PyPI 3.1.43 source used
+  by the recipe does not ship the upstream test tree.
+
+(cherry picked from commit 43d92dec4683568d11495956dd556161f17c3ea8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 372eac28..a1e77bdb 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -713,9 +713,18 @@ class Git(metaclass=_GitMeta):
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index bfbdd80289..f7388e2bbb 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -13,6 +13,9 @@ PYPI_PACKAGE = "GitPython"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \
+           file://CVE-2026-42215_p1.patch \
+           file://CVE-2026-42215_p2.patch \
+           file://CVE-2026-42215_p3.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6


