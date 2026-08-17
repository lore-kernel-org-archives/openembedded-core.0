Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4076C5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 04:43:15 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23400.1786941785720410081
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 21:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WIlEGW2J;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4869; q=dns/txt;
  s=iport01; t=1786941785; x=1788151385;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5JJbnEI1mmDuuN+TkuDEs5VTALV2fV54pKMiPxw71SY=;
  b=WIlEGW2JoEzuTyAp3m7kT6SThV3cZGrhURNibSNzZW2Myydw7/OjEVXN
   YFyMBWgHD5lXQXaFFIjI+5zqZkDh+OWx1rcYAgF75yfxvUKs+T1OWBrz8
   gBB1a4e9Zaj3o/B98nZxM9avgFcfXlmsUjaXOSB5snV0rEGvM35zAHkoB
   lzlhFxJi1uBkPie+Q6fC8qNAPLkxoxl1ICQrg5RKOTqhPDLtTsv95mKJb
   uiWWRXll1m9Q85loqZw8k3zubRoRslj8KoR62sLI9TmJcpEVejp2JdB63
   QLetEqvCG3uUQBxDarXccSsYbNt1OO+5pcgX+SiO26Nb1wUnvp9IYUzTt
   Q==;
X-CSE-ConnectionGUID: ap+ym8VwTmWfcFvh9k59cA==
X-CSE-MsgGUID: MlVH7RjbTA6cRWTcItYrjg==
X-IPAS-Result: =?us-ascii?q?A0BHAgBHkIJq/44QJK1aglmCV3ReQ0mVXmyLZ5I3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQWNawImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASoLARgBLSwDAQJPCyMhGoJoAYI6AzcDEcQvgXkzgQGDK?=
 =?us-ascii?q?AExBYEe2EsNglgBCxQBgTiFP4J/hSNdGAGEfCcbG4FygRWDaYEFgRoYKgKBJ?=
 =?us-ascii?q?4Z+BIINFXoSgVqBLYUZinFIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnOCBgIBSQ4LGA1IESw3F?=
 =?us-ascii?q?BkEPm4HjhcggkeBDgErF4FxKQqjRoIhoB5xCiiDdowhjz6FfBozhASBV6URm?=
 =?us-ascii?q?QiCWYsxhAmSR4RpgWg8gVlwFTuCZwlKGQ+OLgoLg2CFZMZVJzICCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:bpWRBa7k883E7sxum4CWUAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mVJXG6Pbv+ONjPxft0nO9ux8ExSv8WAyNZmQAc4pSs8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOe9/RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eNJVb6+MnP35y8
 MMWIx4TbkGA2rO96efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0cn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aoaEIIzXHZg9ckCwg
 2b43zvDABsmHYKU8wW5+VOwt/XNknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:3cJoZKnf7DaPbvlodpNWUF3kzsbpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3A+NypUmhrwtLVKpehZ9uyPxzubjJue2We3XKAHVC?=
 =?us-ascii?q?EDFlnQ5OLSQ6TpfJvup87?=
X-Talos-MUID: 9a23:S6z00gsUqe/+CNh0682noTVcFJhS4a6SIR4Gq6o6sOiYBDZyNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,228,1779148800"; 
   d="scan'208";a="824928505"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Aug 2026 04:43:03 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 5CAF218000DC3;
	Mon, 17 Aug 2026 04:43:03 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id EF2C9CCA79B; Sun, 16 Aug 2026 21:43:02 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-@cisco.com, external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-pip: Fix CVE-2026-8643
Date: Sun, 16 Aug 2026 21:42:31 -0700
Message-Id: <20260817044231.127184-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243585

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix for CVE-2026-8643. The
commit is included in pip 26.1.2 and referenced in [1]. The public
CVE advisory is referenced in [2].

The selected commit is self-contained. Later upstream commits refactor
the validation to use a shared containment helper and update release
notes; they are not prerequisites for this fix.

[1] https://github.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b265158dfb
[2] https://github.com/advisories/GHSA-wf93-45jw-7689

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pip/CVE-2026-8643.patch    | 80 +++++++++++++++++++
 .../python/python3-pip_26.0.1.bb              |  4 +-
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
new file mode 100644
index 0000000000..2f38ad0207
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
index 28af8f7ec7..3bea989958 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-8643.patch \
+           "
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
-- 
2.35.6


