Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B1AC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:20:43 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12563.1788524434973320453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=god5APZO;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10820; q=dns/txt;
  s=iport01; t=1788524435; x=1789734035;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jPTOYRIMjkTVz/hAE2TCkbYIK8q6vFt2vZUpHfRESl8=;
  b=god5APZOMuWHwJm8zKiubUW9AQt63MKnTYdSt5catdpwWCYNR2/k3sbR
   y82ST68afzz48RDLMLSNMW3gJRAaxkro4E+HwHenK196DsOwEDLax+v09
   zzP+RX4YKKrePqmEavuq/d2wbui+LosIfjoaibv7s4bsWtbvF1lAK7MOI
   vMVJPKc9bykzl71xycdi7oeLGOIstrQUu8dsXERpn2RR3ZrGxoLkZ2P9j
   R/tnm7FmJQS4iJYwKfltiAA/hOXSWr+Q+CzOB1+H6o4B6cEcELlb4EDzM
   XRm4PAFRJSdEQThxQ314WeLj6lSueBIQTwwIyzSdbWrnI54UD1iMGm1xY
   w==;
X-CSE-ConnectionGUID: 68zemZLkScqpHs+Lc5HAVA==
X-CSE-MsgGUID: QbhzlklWQZum8pRHtwWOcw==
X-IPAS-Result: =?us-ascii?q?A0BgAgDQtppq/4oQJK1aglmCV3RgQ0mVXmyBFopRkjeBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBY4EAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZAcAQIBKgsBGAEtLAMBAk8LIyEagmgBgjoDNwMRwySBeTOBA?=
 =?us-ascii?q?YMoATEFgR7YSw2CWQELFAEFgTOFP4J/hSNdGAGEfCcbG4FygRWCc3aBBYEaG?=
 =?us-ascii?q?CoCgSeGfgSCDRV6EoFagQ6EaYwWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIAoJUggMCAUlDDgdHU?=
 =?us-ascii?q?wknQQQLGA1IESw3FRkEPm4Hjl8fglABgQ0BByQXgXEzkzCQFoIhoB5xCiiDd?=
 =?us-ascii?q?owijz6FfBozhVulEpkIjgqECZJHhGmBaDyBWXAVO4JnCUoZD44vCguDYIVkx?=
 =?us-ascii?q?lUnMgIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:iYLMUqvS4bsgTR6IousUNVDP2+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWqEPv3fZGTwe9F1bImx8x5XvcTRmNZjHAduqyg3RXhEgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Pb9Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwpLZlDGR80
 f8jIykVTgvAo+nr4JuFY7w57igjBJGD0II3s3Vky3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWYQd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKFJoPWGJQLwRzwS
 mTuxm75EBUZMOOm+yeAomqWpvPQogTwR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/I8W3a1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:IMCdzqkvv6LekkWSpGjeZNEugirpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AcKGNQGsSo5dwAk3RaUIqSCxs6It7Im/QyUX0IHS?=
 =?us-ascii?q?zEH5JU/6xQgKw0Z1Nxp8=3D?=
X-Talos-MUID: 9a23:05qm5gYz/lC3j+BTjjXsljVhMPhR0bmrWFg3sYkZhO6PKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="847459672"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:20:17 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 9DB561809CABC;
	Fri,  4 Sep 2026 12:14:53 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 3D89CCCD9B2; Fri,  4 Sep 2026 05:14:53 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH v2] python3-pip: Fix CVE-2026-8643
Date: Fri,  4 Sep 2026 05:14:47 -0700
Message-Id: <20260904121447.1698119-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245094

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix for CVE-2026-8643 and the two
follow-up regression fixes. The primary commit is included in pip
26.1.2 and referenced in [1]. The public CVE advisory is referenced
in [2].

The first follow-up fixes doubled-slash directory handling and the
second reuses pip's shared directory-containment helper. The upstream
regression commits are referenced in [3] and [4].

[1] https://github.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b265158dfb
[2] https://github.com/advisories/GHSA-wf93-45jw-7689
[3] https://github.com/pypa/pip/commit/7ff8bdd81ec5edca2bebf78ad8506dda710d6af5
[4] https://github.com/pypa/pip/commit/fa7854f6b37113a2c4698cdde902e1fcc9bebdd5

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

---
Changes in v2:
- Added the two regression commits
---
 .../CVE-2026-8643-regression_p1.patch         | 35 ++++++++
 .../CVE-2026-8643-regression_p2.patch         | 69 ++++++++++++++++
 .../python/python3-pip/CVE-2026-8643.patch    | 80 +++++++++++++++++++
 .../python/python3-pip_26.0.1.bb              |  6 +-
 4 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
new file mode 100644
index 00000000000..e269dca667b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
@@ -0,0 +1,35 @@
+From 7ff8bdd81ec5edca2bebf78ad8506dda710d6af5 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Mon, 18 May 2026 23:22:51 -0400
+Subject: [PATCH] Fix is_within_directory for doubled-slash roots
+
+CVE: CVE-2026-8643
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/7ff8bdd81ec5edca2bebf78ad8506dda710d6af5]
+
+Backport Changes:
+- Omitted tests/unit/test_utils_unpacking.py because the pip 26.0.1
+  PyPI sdist used by this recipe does not ship the upstream tests
+  directory.
+
+(cherry picked from commit 7ff8bdd81ec5edca2bebf78ad8506dda710d6af5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pip/_internal/utils/unpacking.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index 879b40c37e..ba7cb52579 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -83,8 +83,7 @@ def is_within_directory(directory: str, target: str) -> bool:
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+ 
+-    prefix = os.path.commonpath([abs_directory, abs_target])
+-    return prefix == abs_directory
++    return abs_target == abs_directory or abs_target.startswith(abs_directory + os.sep)
+ 
+ 
+ def _get_default_mode_plus_executable() -> int:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
new file mode 100644
index 00000000000..bd40e3b9e8f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
@@ -0,0 +1,69 @@
+From fa7854f6b37113a2c4698cdde902e1fcc9bebdd5 Mon Sep 17 00:00:00 2001
+From: Damian <damian.peter.shaw@gmail.com>
+Date: Sun, 24 May 2026 14:54:47 -0400
+Subject: [PATCH] Use is_within_directory for entry point check
+
+CVE: CVE-2026-8643
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/fa7854f6b37113a2c4698cdde902e1fcc9bebdd5]
+
+Backport Changes:
+- Omitted tests/unit/test_wheel.py because the pip 26.0.1 PyPI sdist
+  used by this recipe does not ship the upstream tests directory.
+
+(cherry picked from commit fa7854f6b37113a2c4698cdde902e1fcc9bebdd5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pip/_internal/operations/install/wheel.py | 18 ++++++------------
+ src/pip/_internal/utils/unpacking.py          |  1 +
+ 2 files changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/src/pip/_internal/operations/install/wheel.py b/src/pip/_internal/operations/install/wheel.py
+index 231e400658..6f9a983364 100644
+--- a/src/pip/_internal/operations/install/wheel.py
++++ b/src/pip/_internal/operations/install/wheel.py
+@@ -397,17 +397,6 @@ class MissingCallableSuffix(InstallationError):
+         )
+ 
+ 
+-def _script_within_dir(name: str, scripts_dir: str) -> bool:
+-    """Return whether script ``name`` resolves to a path inside the ``scripts_dir``.
+-
+-    distlib joins the entry point name onto the scripts directory, so a name
+-    with path separators or ``..`` components can resolve elsewhere.
+-    """
+-    root = os.path.normpath(scripts_dir)
+-    dest = os.path.normpath(os.path.join(scripts_dir, name))
+-    return dest.startswith(root + os.sep)
+-
+-
+ def _raise_for_invalid_entrypoint(specification: str, scripts_dir: str) -> None:
+     entry = get_export_entry(specification)
+     if entry is None:
+@@ -416,7 +405,12 @@ def _raise_for_invalid_entrypoint(specification: str, scripts_dir: str) -> None:
+     if entry.suffix is None:
+         raise MissingCallableSuffix(str(entry))
+ 
+-    if not _script_within_dir(entry.name, scripts_dir):
++    # distlib joins the entry point name onto the scripts directory, so a name
++    # with path separators or ``..`` components can resolve elsewhere. The script
++    # must resolve to a path strictly inside the scripts directory.
++    dest = os.path.join(scripts_dir, entry.name)
++    resolves_to_scripts_dir = os.path.abspath(dest) == os.path.abspath(scripts_dir)
++    if resolves_to_scripts_dir or not is_within_directory(scripts_dir, dest):
+         raise InstallationError(
+             f"Invalid script entry point name {entry.name!r}: the script "
+             f"would be installed outside the scripts directory ({scripts_dir})."
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index ba7cb52579..8a9b2059ca 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -79,6 +79,7 @@ def has_leading_dir(paths: Iterable[str]) -> bool:
+ def is_within_directory(directory: str, target: str) -> bool:
+     """
+     Return true if the absolute path of target is within the directory
++    (including when target is equal to the directory).
+     """
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
new file mode 100644
index 00000000000..2f38ad0207c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
@@ -0,0 +1,80 @@
+From 483d83c13c9d69c1916c06cab29991f6c2725cee Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Wed, 20 May 2026 15:20:25 -0400
+Subject: [PATCH] Reject entry point names that escape scripts dir (#14000)
+
+* Reject entry point names that escape scripts dir
+
+* NEWS ENTRY
+
+CVE: CVE-2026-8643
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b265158dfb]
+
+Backport Changes:
+- Omitted tests/unit/test_wheel.py because the pip 26.0.1 PyPI sdist
+  does not ship the upstream test suite and the OE recipe does not
+  enable ptest.
+
+(cherry picked from commit 8eb178480bd1a2b223f509fc430796b265158dfb)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ news/14000.bugfix.rst                         |  2 ++
+ src/pip/_internal/operations/install/wheel.py | 26 ++++++++++++++++---
+ 2 files changed, 25 insertions(+), 3 deletions(-)
+ create mode 100644 news/14000.bugfix.rst
+
+diff --git a/news/14000.bugfix.rst b/news/14000.bugfix.rst
+new file mode 100644
+index 000000000..3b86f1b3b
+--- /dev/null
++++ b/news/14000.bugfix.rst
+@@ -0,0 +1,2 @@
++Reject ``console_scripts`` and ``gui_scripts`` entry points whose name would
++install a script outside the scripts directory.
+diff --git a/src/pip/_internal/operations/install/wheel.py b/src/pip/_internal/operations/install/wheel.py
+index 40097d6a7..231e40065 100644
+--- a/src/pip/_internal/operations/install/wheel.py
++++ b/src/pip/_internal/operations/install/wheel.py
+@@ -397,11 +397,31 @@ class MissingCallableSuffix(InstallationError):
+         )
+ 
+ 
+-def _raise_for_invalid_entrypoint(specification: str) -> None:
++def _script_within_dir(name: str, scripts_dir: str) -> bool:
++    """Return whether script ``name`` resolves to a path inside the ``scripts_dir``.
++
++    distlib joins the entry point name onto the scripts directory, so a name
++    with path separators or ``..`` components can resolve elsewhere.
++    """
++    root = os.path.normpath(scripts_dir)
++    dest = os.path.normpath(os.path.join(scripts_dir, name))
++    return dest.startswith(root + os.sep)
++
++
++def _raise_for_invalid_entrypoint(specification: str, scripts_dir: str) -> None:
+     entry = get_export_entry(specification)
+-    if entry is not None and entry.suffix is None:
++    if entry is None:
++        return
++
++    if entry.suffix is None:
+         raise MissingCallableSuffix(str(entry))
+ 
++    if not _script_within_dir(entry.name, scripts_dir):
++        raise InstallationError(
++            f"Invalid script entry point name {entry.name!r}: the script "
++            f"would be installed outside the scripts directory ({scripts_dir})."
++        )
++
+ 
+ class PipScriptMaker(ScriptMaker):
+     # Override distlib's default script template with one that
+@@ -419,7 +439,7 @@ class PipScriptMaker(ScriptMaker):
+     def make(
+         self, specification: str, options: dict[str, Any] | None = None
+     ) -> list[str]:
+-        _raise_for_invalid_entrypoint(specification)
++        _raise_for_invalid_entrypoint(specification, self.target_dir)
+         return super().make(specification, options)
+ 
+ 
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 9640bc926aa..1a2cbc397a7 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -24,7 +24,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-8643.patch \
+            file://CVE-2026-8643-regression_p1.patch \
+            file://CVE-2026-8643-regression_p2.patch \
+           "
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
-- 
2.35.6


