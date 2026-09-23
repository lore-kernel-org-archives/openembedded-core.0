Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF5BC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:36:49 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1324.1790145406694747268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aLQnlasc;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13262; q=dns/txt;
  s=iport01; t=1790145406; x=1791355006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mKpPdVlU4qmF7RYmPw6/TCQRnXrYoxQ7LMFEAl67kCQ=;
  b=aLQnlasc3Ix4RHn9LX+YSyzr75x/fHGllZ4FFBRt3ehZb3I2E+3jkh0s
   7iQ0affMRXHVCWyyB5qKUgl9xY1EBhVAi0vQzJozsNqAJafaTkee83ekp
   z2WcmpZOUW/3ZPx8UMH0CBIn0WExNExcfMcx2jxhHxE9os735SG5wlbyc
   PWzJaQxeleeKNM+Ia6GuPASmvXnSHV6AfxAkNIhxnUEnDBwQp/edk6SD6
   vi23+oGDghJyaWUUxiMJ6MYgCy3WWnWMa7sQ9TKpkyLuYFjF6PNDuV0lQ
   G3D64uzwNEmJGQak25Ln/Ixp1Xrp3ACYM6h4LOOqpDT3caPaxOMC1wKAp
   w==;
X-CSE-ConnectionGUID: TUZi/+EzSnOeXXVAM97dkQ==
X-CSE-MsgGUID: JsleQP5ISO+JjSlFvRFj6Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgDLcrNq/4z/Ja1aH4I6gld1YENJA5ZHnh0UgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQWOCwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECASoLARgBLSwDAQJaHQEFIR6CZAGCdAMRv2A3gVkgM4EBg?=
 =?us-ascii?q?ykBgVTbMgELFAGBOIU/iCJdGAGEfCcbG4FygRQBg2mBBYFcAoEhBl+GHwSCD?=
 =?us-ascii?q?RWBDIFaHm6SC0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?SeCGiMZNnqBCV6BKylgARAXgQeCCAKCVIIBAgFJQw4HRVMJJUEKEkcpIggSC?=
 =?us-ascii?q?QETGjALgSc6CBgNSBEsNxUZBD5uB496H4FxbAYBYyEKAQckIFsWQAkGBR8oH?=
 =?us-ascii?q?B4PklwJkCeCIYE1n1oKKIN2jCKVOhozhASmaZkIglmLMZVoFVOEaYFoPIFZc?=
 =?us-ascii?q?BU7gmcJShkPjjmDa8w5JzICCQMvAQEHAgcOAwuBaJAAAiZ5XQEB?=
IronPort-Data: A9a23:Baicjaw/3HTsl8ojqgV6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVVx
 mBNXGGFP/+PMDHwctB/Oduy9kkAv5bWzYA3TlY6qFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaDlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJH0LD4xfuctlOmdp+
 MwoFhkoP0+PhNvjldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwaYCOIYXTGJ49ckCwh
 HnC8l3BXzAhE5+9ywGB3GyWqO2RpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:DqVPiq8ccJJl4Qxfq8Fuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3ALXrYU2soyHGhbIRTDOCSk5BC6IsZT0/cizT9MXS?=
 =?us-ascii?q?+LmtZeIO8bA7P9KBdxp8=3D?=
X-Talos-MUID: 9a23:1juouwRGWgmVTEfWRXTOnzVvDf81wp+JS2IPqpEopfOqN3JJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="512331153"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Sep 2026 06:36:45 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 79CA6180001C8;
	Wed, 23 Sep 2026 06:36:45 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 23EC2CC1611; Tue, 22 Sep 2026 23:36:45 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2] python3-click: fix CVE-2026-7246
Date: Tue, 22 Sep 2026 23:36:26 -0700
Message-ID: <20260923063627.2741697-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246451

From: Darsh Kelaiya <dkelaiya@cisco.com>

This backports the click.edit() hardening identified as the fix in
the public advisory [2], using upstream commit [1].

Upstream follow-up commit [3] adds regression-test coverage for editor
command parsing and clarifies the related source comments. It does not
change runtime behavior or provide an additional security fix. Carry it
as a separate patch to preserve the upstream commit boundaries.

[1] https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f42
[2] https://github.com/tsigouris007/security-advisories/security/advisories/GHSA-47fr-3ffg-hgmw
[3] https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657edb8faefa4976

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../CVE-2026-7246-regression.patch            | 124 +++++++++++
 .../python/python3-click/CVE-2026-7246.patch  | 201 ++++++++++++++++++
 .../python/python3-click_8.1.7.bb             |   6 +-
 3 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7246-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch

diff --git a/meta/recipes-devtools/python/python3-click/CVE-2026-7246-regression.patch b/meta/recipes-devtools/python/python3-click/CVE-2026-7246-regression.patch
new file mode 100644
index 00000000000..213982a8bb5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246-regression.patch
@@ -0,0 +1,124 @@
+From e3173ef521c287be53f1976b28c2fee28b6de5c7 Mon Sep 17 00:00:00 2001
+From: Kevin Deldycke <kevin@deldycke.com>
+Date: Fri, 10 Apr 2026 18:12:24 +0200
+Subject: [PATCH] Add path normalization edge-cases, verify `shlex.split`
+ behavior
+
+Also move to Python comments details relevant to developers instead of docstrings
+Follow up to #3245
+
+CVE: CVE-2026-7246
+Upstream-Status: Backport [https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657edb8faefa4976]
+
+Backport Changes:
+- Click 8.1.7 uses Editor.edit_file(filename), not the newer
+  Editor.edit_files(filenames) API. Apply the editor comment
+  follow-up and edge-case tests to the single-file API.
+- Omit pager changes and pager-only follow-up tests because
+  Click 8.1.7 uses older pager APIs and CVE-2026-7246 affects
+  click.edit(), not pager execution.
+- Omit cosmetic editor test ID renames.
+
+(cherry picked from commit b55294797ef32e22eb41e7d9657edb8faefa4976)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/click/_termui_impl.py | 12 ++++------
+ tests/test_termui.py      | 48 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 52 insertions(+), 8 deletions(-)
+
+diff --git a/src/click/_termui_impl.py b/src/click/_termui_impl.py
+index c50b37b..3589160 100644
+--- a/src/click/_termui_impl.py
++++ b/src/click/_termui_impl.py
+@@ -501,14 +501,7 @@ class Editor:
+         return "vi"
+ 
+     def edit_file(self, filename: str) -> None:
+-        """Open a file in the user's editor.
+-
+-        The editor command is split into an ``argv`` list with
+-        :func:`shlex.split` in POSIX mode; see :func:`pager` for rationale.
+-
+-        .. seealso::
+-            :issue:`1026` and :pr:`1477`.
+-        """
++        """Open a file in the user's editor."""
+         import shlex
+         import subprocess
+ 
+@@ -520,6 +513,9 @@ class Editor:
+             environ.update(self.env)
+ 
+         try:
++            # Split in POSIX mode (the default) for the same reasons as
++            # upstream pager(): strips quotes from tokens and preserves
++            # quoted Windows paths. See issue #1026 and PR #1477.
+             c = subprocess.Popen(
+                 args=shlex.split(editor) + [filename],
+                 env=environ,
+diff --git a/tests/test_termui.py b/tests/test_termui.py
+index 7cea338..eda9a80 100644
+--- a/tests/test_termui.py
++++ b/tests/test_termui.py
+@@ -421,6 +421,48 @@ def test_fast_edit(runner):
+             ["/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl", "f.txt"],
+             id="escaped space in unix path (issue 1026)",
+         ),
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
+     ],
+ )
+ def test_editor_path_normalization(editor_cmd, filename, expected_args):
+@@ -484,6 +526,12 @@ def test_editor_nonexistent_exception():
+             Editor(editor="nonexistent").edit_file("f.txt")
+ 
+ 
++def test_editor_unclosed_quote():
++    """An unclosed quote in the editor command raises ValueError."""
++    with pytest.raises(ValueError, match="No closing quotation"):
++        Editor(editor='"unclosed').edit_file("f.txt")
++
++
+ @pytest.mark.parametrize(
+     ("prompt_required", "required", "args", "expect"),
+     [
diff --git a/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
new file mode 100644
index 00000000000..411b138ba0e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
@@ -0,0 +1,201 @@
+From 1ad206945a88122e121f850b4942eff473e31cf5 Mon Sep 17 00:00:00 2001
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
+- Adapt editor tests from b96c2601 to the single-file API. Keep
+  portable normalization, quoting, failure, environment, and
+  Windows cases.
+- Omit CHANGES.rst because release notes are not needed for
+  the source backport.
+- Omit pager changes and pager-only tests because Click 8.1.7
+  uses older pager APIs and CVE-2026-7246 affects click.edit(),
+  not pager execution.
+- Omit the unrelated _translate_ch_to_exc() return cleanup.
+
+(cherry picked from commit b96c2601af4e01341b4d2c0db494ebee4aef8f42)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/click/_termui_impl.py |  14 ++++-
+ tests/test_termui.py      | 115 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 128 insertions(+), 1 deletion(-)
+
+diff --git a/src/click/_termui_impl.py b/src/click/_termui_impl.py
+index f744657..c50b37b 100644
+--- a/src/click/_termui_impl.py
++++ b/src/click/_termui_impl.py
+@@ -501,6 +501,15 @@ class Editor:
+         return "vi"
+ 
+     def edit_file(self, filename: str) -> None:
++        """Open a file in the user's editor.
++
++        The editor command is split into an ``argv`` list with
++        :func:`shlex.split` in POSIX mode; see :func:`pager` for rationale.
++
++        .. seealso::
++            :issue:`1026` and :pr:`1477`.
++        """
++        import shlex
+         import subprocess
+ 
+         editor = self.get_editor()
+@@ -511,7 +520,10 @@ class Editor:
+             environ.update(self.env)
+ 
+         try:
+-            c = subprocess.Popen(f'{editor} "{filename}"', env=environ, shell=True)
++            c = subprocess.Popen(
++                args=shlex.split(editor) + [filename],
++                env=environ,
++            )
+             exit_code = c.wait()
+             if exit_code != 0:
+                 raise ClickException(
+diff --git a/tests/test_termui.py b/tests/test_termui.py
+index 7cfa939..7cea338 100644
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
+@@ -369,6 +371,119 @@ def test_fast_edit(runner):
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
+ @pytest.mark.parametrize(
+     ("prompt_required", "required", "args", "expect"),
+     [
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index b75d9108893..8a077f48c7c 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -12,7 +12,10 @@ SRC_URI[sha256sum] = "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b
 
 inherit pypi setuptools3 ptest
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://CVE-2026-7246.patch \
+            file://CVE-2026-7246-regression.patch \
+           "
 
 CVE_PRODUCT = "palletsprojects:click"
 
@@ -36,6 +39,7 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
+    python3-shell \
     "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.4


