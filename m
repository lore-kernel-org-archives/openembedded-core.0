Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F65C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 16:32:15 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11330.1787329933387846148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 09:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iBl4GNVV;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9923; q=dns/txt;
  s=iport01; t=1787329933; x=1788539533;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O4k6PXJFCtI++c32rhY/7MtEfcdeGjo7jUIbVqb7XG8=;
  b=iBl4GNVVoZjSM+jx58rD9G7HdmSfWkR2oao5COwVB6ejW+zV/jSOd5R2
   amfacPXE9tX87yld2xeTjAFNAOsi/o/Mi7PDbZ7PPwC4ybdk3ihuGZIO4
   hxwY4ZexM6X5r9S6R65NwEP4QCZfcafIrzIkdbtY/WUlobOJRy5SphZzP
   OeHEaJnwoeKhc5opjfXaEj+skla5gnt9wicQNnKU+5XvTjICc/qEHYGwG
   A8qbsASXAaoNQhklf0qx5m1K7WLwJLWiY6cV46Txctks6sVS5ISLuXEok
   OzI7BWTFKHJqV0fqmZQp5uEonqqRzFGXJwxtX1CWZNdCFWwgTlLSHKQPU
   w==;
X-CSE-ConnectionGUID: RaWIvL/GTgWfKDjQK/dL/g==
X-CSE-MsgGUID: CxtDJVQeQlShYHqY8Xb3bg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDifIhq/44QJK1aHgEBCxIMggULgld0XkNJA5ZHn?=
 =?us-ascii?q?h4UgWoPAQEBD0QNBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBKgsBGAEtLAMBAlodAQUhHoJkAYJ0AxHBIDeBW?=
 =?us-ascii?q?SAzgQGDKAGBVNswAQsUAYE4hT+IIl0YAYR8JxsbgXKBFAGDaYEFgVwCgSEGX?=
 =?us-ascii?q?4YfBIINFYEMgVoeeJBMSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENG?=
 =?us-ascii?q?wYFgR2BKIQQIxk2eoEJXoErKWABEheBCYIHAoJaggUCAUlDDgc6CxgNSBEsN?=
 =?us-ascii?q?xQZBD5uB45AH4FYcgFjIQoBByQgWxZADwUfKBweD5JlkCeCIYE1n1oKKIN2j?=
 =?us-ascii?q?CKVOhozhASmaJkIglmLMZVoFVOEaYFoPIFZcBU7gmcJShkPjjiDa8w5JzICC?=
 =?us-ascii?q?QMvAQEHAgcOAwuBaJAAAiZ5XQEB?=
IronPort-Data: A9a23:mUpTKqCbhDZTShVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDMr1mdRy
 WUeDzuEMv3ZN2Cmftx3Ot6w9EMG78PdxtZhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+fxRLV8SeqIk9dl5Ik1Mz
 N9fJBRKYUXW7w626OrTpuhEj8AnKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWAHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237nFYoiOSyaIuFEjCMbe5Fgmq6m
 FvLxmDCAiA6Le3P+TDe+H3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkveS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6eX9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:cVG5ZKGtVtmCcsQApLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:fFlyfm3nmsHwiPLsmbBC6bxfIMkaU2P5i1jsLHC2KkprcZ7SRXvX9/Yx
X-Talos-MUID: 9a23:DhFZ7whIQUJKUtgXnmSsL8MpH9d0z4aQMU00la4GiumdBHxAMWyXg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="821047098"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 16:32:09 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id B1BED1800021B;
	Fri, 21 Aug 2026 16:32:09 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5335ECCA79B; Fri, 21 Aug 2026 09:32:09 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-click: fix CVE-2026-7246
Date: Fri, 21 Aug 2026 09:32:06 -0700
Message-Id: <20260821163206.882233-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 16:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243948

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-7246 as referenced
in [2], using the upstream commit identified in [1].

The backport also adapts editor regression tests from the upstream
test and documentation follow-up identified in [3]. This follow-up
does not contain an additional production security fix.

[1] https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f42
[2] https://github.com/tsigouris007/security-advisories/security/advisories/GHSA-47fr-3ffg-hgmw
[3] https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657edb8faefa4976

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-click/CVE-2026-7246.patch  | 245 ++++++++++++++++++
 .../python/python3-click_8.1.7.bb             |   5 +-
 2 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch

diff --git a/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
new file mode 100644
index 0000000000..47ee1a551f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
@@ -0,0 +1,245 @@
+From cb30f575b1a251e8698909bca2a443d41dad1824 Mon Sep 17 00:00:00 2001
+From: Kevin Deldycke <kevin@deldycke.com>
+Date: Wed, 4 Mar 2026 14:51:58 +0400
+Subject: [PATCH] Document and fix command string sanitizing with `shlex.split`
+
+Removes last use of `shell=True` use for command invokation for defense-in-depth.
+Refs: #1026, #1477 and #2775
+
+CVE: CVE-2026-7246
+Upstream-Status: Backport [https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f42]
+
+Backport Changes:
+- Click 8.1.7 uses Editor.edit_file(filename), not the newer
+  Editor.edit_files(filenames) API. Apply the argv-list change
+  to one filename without adding the multi-file API.
+- Adapt editor tests from b96c2601 and follow-up b5529479 to
+  the single-file API. Keep portable normalization, quoting,
+  failure, environment, Windows, and malformed-command cases.
+- Omit CHANGES.rst because release notes are not needed for
+  the source backport.
+- Omit pager changes and pager-only follow-up tests because
+  Click 8.1.7 uses older pager APIs and CVE-2026-7246 affects
+  click.edit(), not pager execution.
+- Omit the unrelated _translate_ch_to_exc() return cleanup.
+
+(cherry picked from commit b96c2601af4e01341b4d2c0db494ebee4aef8f42)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/click/_termui_impl.py |  10 ++-
+ tests/test_termui.py      | 163 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 172 insertions(+), 1 deletion(-)
+
+diff --git a/src/click/_termui_impl.py b/src/click/_termui_impl.py
+index f744657..3589160 100644
+--- a/src/click/_termui_impl.py
++++ b/src/click/_termui_impl.py
+@@ -501,6 +501,8 @@ class Editor:
+         return "vi"
+ 
+     def edit_file(self, filename: str) -> None:
++        """Open a file in the user's editor."""
++        import shlex
+         import subprocess
+ 
+         editor = self.get_editor()
+@@ -511,7 +513,13 @@ class Editor:
+             environ.update(self.env)
+ 
+         try:
+-            c = subprocess.Popen(f'{editor} "{filename}"', env=environ, shell=True)
++            # Split in POSIX mode (the default) for the same reasons as
++            # upstream pager(): strips quotes from tokens and preserves
++            # quoted Windows paths. See issue #1026 and PR #1477.
++            c = subprocess.Popen(
++                args=shlex.split(editor) + [filename],
++                env=environ,
++            )
+             exit_code = c.wait()
+             if exit_code != 0:
+                 raise ClickException(
+diff --git a/tests/test_termui.py b/tests/test_termui.py
+index 7cfa939..eda9a80 100644
+--- a/tests/test_termui.py
++++ b/tests/test_termui.py
+@@ -1,10 +1,12 @@
+ import platform
+ import time
++from unittest.mock import patch
+ 
+ import pytest
+ 
+ import click._termui_impl
+ from click._compat import WIN
++from click._termui_impl import Editor
+ 
+ 
+ class FakeClock:
+@@ -369,6 +371,167 @@ def test_fast_edit(runner):
+     assert result == "aTest\nbTest\n"
+ 
+ 
++@pytest.mark.parametrize(
++    ("editor_cmd", "filename", "expected_args"),
++    [
++        pytest.param(
++            "myeditor --wait --flag",
++            "file1.txt",
++            ["myeditor", "--wait", "--flag", "file1.txt"],
++            id="editor with args",
++        ),
++        pytest.param(
++            "vi",
++            'file"; rm -rf / ; echo "',
++            ["vi", 'file"; rm -rf / ; echo "'],
++            id="shell metacharacters in filename",
++        ),
++        # Issue #1026: editor path with spaces must be quoted.
++        pytest.param(
++            '"C:\\Program Files\\Sublime Text 3\\sublime_text.exe"',
++            "f.txt",
++            ["C:\\Program Files\\Sublime Text 3\\sublime_text.exe", "f.txt"],
++            id="quoted windows path with spaces (issue 1026)",
++        ),
++        # PR #1477: pager/editor command with flags, like ``less -FRSX``.
++        pytest.param(
++            "less -FRSX",
++            "f.txt",
++            ["less", "-FRSX", "f.txt"],
++            id="command with flags (pr 1477)",
++        ),
++        # Issue #1026: quoted command with ``--wait`` flag.
++        pytest.param(
++            '"my command" --option value arg',
++            "f.txt",
++            ["my command", "--option", "value", "arg", "f.txt"],
++            id="quoted command with args (issue 1026)",
++        ),
++        # PR #1477: unquoted Unix path.
++        pytest.param(
++            "/usr/bin/vim",
++            "f.txt",
++            ["/usr/bin/vim", "f.txt"],
++            id="unix absolute path",
++        ),
++        # Issue #1026: macOS path with escaped space.
++        pytest.param(
++            "/Applications/Sublime\\ Text.app/Contents/SharedSupport/bin/subl",
++            "f.txt",
++            ["/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl", "f.txt"],
++            id="escaped space in unix path (issue 1026)",
++        ),
++        pytest.param(
++            "  vim  ",
++            "f.txt",
++            ["vim", "f.txt"],
++            id="leading and trailing whitespace",
++        ),
++        pytest.param(
++            "vim\t--clean",
++            "f.txt",
++            ["vim", "--clean", "f.txt"],
++            id="tab-separated tokens",
++        ),
++        pytest.param(
++            "'/Applications/My Editor.app/Contents/MacOS/editor'",
++            "f.txt",
++            ["/Applications/My Editor.app/Contents/MacOS/editor", "f.txt"],
++            id="single-quoted path with spaces",
++        ),
++        pytest.param(
++            '"my editor" --wait --new-window',
++            "file 1.txt",
++            ["my editor", "--wait", "--new-window", "file 1.txt"],
++            id="quoted editor with flags and filename with spaces",
++        ),
++        pytest.param(
++            "vim -u NONE -N",
++            "f.txt",
++            ["vim", "-u", "NONE", "-N", "f.txt"],
++            id="multiple short flags",
++        ),
++        pytest.param(
++            "editor",
++            'file"name.txt',
++            ["editor", 'file"name.txt'],
++            id="filename with double quote",
++        ),
++        pytest.param(
++            "editor",
++            "file'name.txt",
++            ["editor", "file'name.txt"],
++            id="filename with single quote",
++        ),
++    ],
++)
++def test_editor_path_normalization(editor_cmd, filename, expected_args):
++    with patch("subprocess.Popen") as mock_popen:
++        mock_popen.return_value.wait.return_value = 0
++        Editor(editor=editor_cmd).edit_file(filename)
++
++        mock_popen.assert_called_once()
++        args = mock_popen.call_args[1].get("args") or mock_popen.call_args[0][0]
++        assert args == expected_args
++        assert mock_popen.call_args[1].get("shell") is None
++
++
++@pytest.mark.skipif(not WIN, reason="Windows-specific editor paths")
++@pytest.mark.parametrize(
++    ("editor_cmd", "expected_cmd"),
++    [
++        pytest.param(
++            "notepad",
++            ["notepad"],
++            id="plain notepad",
++        ),
++        pytest.param(
++            '"C:\\Program Files\\Sublime Text 3\\sublime_text.exe" --wait',
++            ["C:\\Program Files\\Sublime Text 3\\sublime_text.exe", "--wait"],
++            id="quoted path with flag",
++        ),
++    ],
++)
++def test_editor_windows_path_normalization(editor_cmd, expected_cmd):
++    """Verify that Popen receives unquoted Windows editor paths."""
++    with patch("subprocess.Popen") as mock_popen:
++        mock_popen.return_value.wait.return_value = 0
++        Editor(editor=editor_cmd).edit_file("f.txt")
++
++        args = mock_popen.call_args[1].get("args") or mock_popen.call_args[0][0]
++        assert args == expected_cmd + ["f.txt"]
++        assert mock_popen.call_args[1].get("shell") is None
++
++
++def test_editor_env_passed_through():
++    with patch("subprocess.Popen") as mock_popen:
++        mock_popen.return_value.wait.return_value = 0
++        Editor(editor="vi", env={"MY_VAR": "1"}).edit_file("f.txt")
++
++        env = mock_popen.call_args[1].get("env")
++        assert env is not None
++        assert env["MY_VAR"] == "1"
++
++
++def test_editor_failure_exception():
++    with patch("subprocess.Popen") as mock_popen:
++        mock_popen.return_value.wait.return_value = 1
++        with pytest.raises(click.ClickException, match="Editing failed"):
++            Editor(editor="vi").edit_file("f.txt")
++
++
++def test_editor_nonexistent_exception():
++    with patch("subprocess.Popen", side_effect=OSError("not found")):
++        with pytest.raises(click.ClickException, match="not found"):
++            Editor(editor="nonexistent").edit_file("f.txt")
++
++
++def test_editor_unclosed_quote():
++    """An unclosed quote in the editor command raises ValueError."""
++    with pytest.raises(ValueError, match="No closing quotation"):
++        Editor(editor='"unclosed').edit_file("f.txt")
++
++
+ @pytest.mark.parametrize(
+     ("prompt_required", "required", "args", "expect"),
+     [
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index 7d91e1af83..3c6f4df5e2 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -12,7 +12,9 @@ SRC_URI[sha256sum] = "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b
 
 inherit pypi setuptools3 ptest
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://CVE-2026-7246.patch \
+           "
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
@@ -34,6 +36,7 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
+    python3-shell \
     "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


