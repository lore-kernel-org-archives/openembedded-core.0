Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8CCC5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 04:44:35 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23415.1786941873153157068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 21:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LmcC/+Aq;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10403; q=dns/txt;
  s=iport01; t=1786941873; x=1788151473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LQIfrRHqgOsyianqiniL9YZEQYAUOSPv6Ba+rx7EWA4=;
  b=LmcC/+AqGO0Z5gHSenYxT/AuKM+8DYWrliUB3OwnhlSxL86y/8nS0Md2
   tjx6YnYsebktpPBmPtmY4ZC1gKDLr/3bFz9czkg3OTaSTMWRkDIFUyZB7
   VsTN5VX08tr05Uuk0xvnT67l2K789VV1rj/OMUkfsbQjP01pvj/Z6czSt
   WwYpcR2KpjSmuiyBd1sI0eORLoHc9hO5qz1fSIFc5dSM9LIJnVQdYF96v
   woOHJ9cQX+fQByClylb9L7WmTiVHzFRzZPldwPIp8mDxxNriUgszkw32x
   UKgKtDepFeJJlktXIvPZ3M/5RaEQUhoqNbHzgVw77mFULxtn2ki8Q7Q+N
   Q==;
X-CSE-ConnectionGUID: eNelXE6BQHKUQ3iT/dhM5w==
X-CSE-MsgGUID: 1dRewMXXSm2HOzuAsWWU1g==
X-IPAS-Result: =?us-ascii?q?A0BGAgBHkIJq/5MQJK1aglmCV3ReQ0mWSoEWilGSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEqCwFGLAMBAk8LIyEagmgBgjoDNwMRxC+BeTOBAYNaB?=
 =?us-ascii?q?YEe2EsNglgBCxQBBYEzhT+Cf4UjXRgBhHwnGxuBcoEVgnN2gQWBGhgqAoglB?=
 =?us-ascii?q?IIigQyBWoEtkApIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBH?=
 =?us-ascii?q?YEohDcjGTZ8gQlegSsqYQESF4EJggoCgnOCBgIBSQ4LGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?hcggkcBgQ0BByQXgXGTWZAggiGgHnEKKIN2jCGPPoV8GjOFW6URmQiOCoQJk?=
 =?us-ascii?q?keEaYFoPIFZcBU7gmcJShkPjjiDa4VkxlUnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:sXcXL62ESizcIzvqsPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2ZSz
 zEXDzyHaKuLN2T2Ld12Odjk90MFvZXSxtNhTgI93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4EjxYtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tbTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGAWc7Ob01pMxOIUJzz
 KcZFHcBbjXemLfjqF67YrEEasULJc3vOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEuojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiuS8aouOJYLiqcN9x0qiq
 33jz1TCB0s6E86C4CG6zU/1ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:BuZYBKPx3pDUCMBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:+LhPTG+LZP2DqV/gfEuVv0MyF8QVXyP39VfzHnbjCFouRL2wFEDFrQ==
X-Talos-MUID: 9a23:6C1+ewtVPVkMWbti3M2n3T1YOdhN05SVDRottocbktK7ChEpNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,228,1779148800"; 
   d="scan'208";a="824929376"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Aug 2026 04:44:32 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 22A9B18000161;
	Mon, 17 Aug 2026 04:44:32 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id B3B6DCC12A6; Sun, 16 Aug 2026 21:44:31 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-pip: Fix CVE-2026-8643
Date: Sun, 16 Aug 2026 21:44:29 -0700
Message-Id: <20260817044429.62418-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243586

From: Hetvi Thakar <hthakar@cisco.com>

Apply the primary upstream fix referenced in [4] with commit [1]. Then
apply the two follow-up regression-fix commits [2] and [3].

The primary fix rejects entry-point names that escape the configured
scripts directory. The follow-up fixes handle doubled-slash roots and
reuse the existing directory-containment helper.

[1] https://github.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b265158dfb
[2] https://github.com/pypa/pip/commit/7ff8bdd81ec5edca2bebf78ad8506dda710d6af5
[3] https://github.com/pypa/pip/commit/fa7854f6b37113a2c4698cdde902e1fcc9bebdd5
[4] https://github.com/advisories/GHSA-wf93-45jw-7689

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-8643-regression_p1.patch         | 34 ++++++++
 .../CVE-2026-8643-regression_p2.patch         | 69 ++++++++++++++++
 .../python/python3-pip/CVE-2026-8643.patch    | 79 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  3 +
 4 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
new file mode 100644
index 0000000000..966a98f9d2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
@@ -0,0 +1,34 @@
+From 7cac095948e86d8a0e0e17de6b763727e9b051ac Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Mon, 18 May 2026 23:22:51 -0400
+Subject: [PATCH] Fix is_within_directory for doubled-slash roots
+
+CVE: CVE-2026-8643
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/7ff8bdd81ec5edca2bebf78ad8506dda710d6af5]
+
+Backport Changes:
+- Omit tests/unit/test_utils_unpacking.py because the pip 24.0 PyPI sdist used
+  by this recipe does not ship the upstream tests directory.
+
+(cherry picked from commit 7ff8bdd81ec5edca2bebf78ad8506dda710d6af5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pip/_internal/utils/unpacking.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index 0b26525fb..188f27e67 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,8 +81,7 @@ def is_within_directory(directory: str, target: str) -> bool:
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+ 
+-    prefix = os.path.commonpath([abs_directory, abs_target])
+-    return prefix == abs_directory
++    return abs_target == abs_directory or abs_target.startswith(abs_directory + os.sep)
+ 
+ 
+ def set_extracted_file_to_default_mode_plus_executable(path: str) -> None:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
new file mode 100644
index 0000000000..025b4fe929
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
@@ -0,0 +1,69 @@
+From b77d10eee5805aea3055e434e08ad1f105bd330c Mon Sep 17 00:00:00 2001
+From: Damian <damian.peter.shaw@gmail.com>
+Date: Sun, 24 May 2026 14:54:47 -0400
+Subject: [PATCH] Use is_within_directory for entry point check
+
+CVE: CVE-2026-8643
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/fa7854f6b37113a2c4698cdde902e1fcc9bebdd5]
+
+Backport Changes:
+- Omit tests/unit/test_wheel.py because the pip 24.0 PyPI sdist used by this
+  recipe does not ship the upstream tests directory.
+
+(cherry picked from commit fa7854f6b37113a2c4698cdde902e1fcc9bebdd5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pip/_internal/operations/install/wheel.py | 18 ++----
+ src/pip/_internal/utils/unpacking.py          |  1 +
+ 2 files changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/src/pip/_internal/operations/install/wheel.py b/src/pip/_internal/operations/install/wheel.py
+index 8a36a66ae..ce3e8efe6 100644
+--- a/src/pip/_internal/operations/install/wheel.py
++++ b/src/pip/_internal/operations/install/wheel.py
+@@ -409,17 +409,6 @@ class MissingCallableSuffix(InstallationError):
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
+@@ -428,7 +417,12 @@ def _raise_for_invalid_entrypoint(specification: str, scripts_dir: str) -> None:
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
+index 188f27e67..14b7e846a 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -77,6 +77,7 @@ def has_leading_dir(paths: Iterable[str]) -> bool:
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
index 0000000000..ad1124a441
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
@@ -0,0 +1,79 @@
+From fc0f7c683c372d66f2e2d6edc00909cc5f225f67 Mon Sep 17 00:00:00 2001
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
+- Omit tests/unit/test_wheel.py because the pip 24.0 PyPI sdist used by this
+  recipe does not ship the upstream tests directory.
+
+(cherry picked from commit 8eb178480bd1a2b223f509fc430796b265158dfb)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ news/14000.bugfix.rst                         |  2 +
+ src/pip/_internal/operations/install/wheel.py | 26 +++++++-
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
+index f67180c9e..8a36a66ae 100644
+--- a/src/pip/_internal/operations/install/wheel.py
++++ b/src/pip/_internal/operations/install/wheel.py
+@@ -409,17 +409,37 @@ class MissingCallableSuffix(InstallationError):
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
+     def make(
+         self, specification: str, options: Optional[Dict[str, Any]] = None
+     ) -> List[str]:
+-        _raise_for_invalid_entrypoint(specification)
++        _raise_for_invalid_entrypoint(specification, self.target_dir)
+         return super().make(specification, options)
+ 
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index cf123a5d23..3c922f4a4b 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -33,6 +33,9 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch \
             file://CVE-2026-1703.patch \
+            file://CVE-2026-8643.patch \
+            file://CVE-2026-8643-regression_p1.patch \
+            file://CVE-2026-8643-regression_p2.patch \
            "
 
 SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
-- 
2.35.6


