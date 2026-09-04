Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AEBC79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:41:50 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10250.1788514909890908524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WETfYNaV;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6582; q=dns/txt;
  s=iport01; t=1788514909; x=1789724509;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RWZVEUzLyirxRg5oqcIIA3ZT9k4qJDHSQ3IjoDazDgI=;
  b=WETfYNaVYmetk1+Gqwvy9ut/6AGcT/QLD54rG/vl+l/ePwDPa8IQtYi3
   dKqgKDb7ryD3llyQUV+I0j9Fkk/sURHiMdLyfQmyCgUJSFTpPLxV75DWc
   JzBLNweKJnJKpGJfpc7+nnTOAkbjkBNvdcB6+ay946+tsCS9s0xBgazfR
   L6YCR3Wymyyvb8Fph1+FXegAnr+fQv8VBXsZDCbnrF2MvWJSF0B4l0Fwj
   DB3yMB3MmegFwNei5a7jtC5C/DDerGnpINhfVMuiJQBwo84+C5hGmZ2Dj
   Q9zF7n4ikXr2y62S5sXJBJ+R5jOOfLc525ijlCMzTqDOdLS0WuwNDD7Si
   Q==;
X-CSE-ConnectionGUID: Nmh0beHBStiMppZ2NNEOSg==
X-CSE-MsgGUID: +zvN5d/PRyi3+AtolZebhA==
X-IPAS-Result: =?us-ascii?q?A0BFAgD5kJpq/44QJK1aglmCV3RgQ0kDlkeeHoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/Ro4EAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBkBAgEqCwEYAS0sAwECWiMhgwIBgnQDEcJ4gXkzgQGDKAGBVNsxA?=
 =?us-ascii?q?QsUAYE4hT+IIl0YAUSEOCcbG4FygRWDaYEFgVwCgUyGWQSCInoSgVqBDpB/S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJX?=
 =?us-ascii?q?oErKWABEheBCYIIAoJUggMCAUlDDgdHUwknQQQLGA1IESw3FRkEPm4Hjl8fg?=
 =?us-ascii?q?jAgAYENAQohgU1fo1WCIaEPCiiDdowilToaM6ptC5h9jgqVO4EVhGmBaDyBW?=
 =?us-ascii?q?XAVO4JnCUoZD445g2uFZMZVJzICBgMDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:Jyex9KNHMumgF5rvrR30lsFynXyQoLVcMsEvi/4bfWQNrUpx3zACm
 jQaUWCCaffZZzf9eN50ad+1/BtQu5XRyNQyTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf0g2Usbgr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69NrDBk8MK0ywfp2JHlWx
 6Y+Dh0qVR/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY1BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FwqieawaYuLK7RmQ+0WjFi++
 26Bx17oA0pZHcCYzQiI+HKF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOTKIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:MSk+iK6OO/laBbhozQPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3A31OvZ2uabi+PqRNoNR8sIx976IsDd32FxnrwCXS?=
 =?us-ascii?q?kCENxUI/Pb3m935hrxp8=3D?=
X-Talos-MUID: 9a23:Iwsv8wWNyGfZmcHq/Hz+mhc/OIBQ2bWvUwMkjZICicSONQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="831651969"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:41:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id D6DAA18000140;
	Fri,  4 Sep 2026 09:41:47 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 7A0BACCA79B; Fri,  4 Sep 2026 02:41:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 2/4] python3-git: fix CVE-2026-42215
Date: Fri,  4 Sep 2026 02:41:45 -0700
Message-Id: <20260904094145.1531031-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245085

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3],
using the backported commits shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6
[2] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rpm5-65cw-6hj4

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Dropped the "linter fix" _p2 patch and renamed
  the _p3 patch to _p2.
---
 .../python3-git/CVE-2026-42215_p1.patch       | 60 +++++++++++++++++++
 .../python3-git/CVE-2026-42215_p2.patch       | 45 ++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch

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
index 0000000000..a23fba8d81
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
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
index bfbdd80289..26d9a3f063 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -13,6 +13,8 @@ PYPI_PACKAGE = "GitPython"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \
+           file://CVE-2026-42215_p1.patch \
+           file://CVE-2026-42215_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6


