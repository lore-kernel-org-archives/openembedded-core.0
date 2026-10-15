Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B123ECC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32454.1792040658130676372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WtEUZ4yF;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so42866335e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040656; x=1792645456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A8Gox/IHV1qIE11dJtkPSv7NSR0EBiYYlZP9+2O9uk8=;
        b=WtEUZ4yF9zhqM+Ht+6CSke13o+m0NYCNcJMR2nv6koV6P1MCFFIPUOR21q6N7A8hdX
         XsyoJ9evPvsHp/pp9XL2EStaJ3Dt/8NqSRtVsXEZJXO1/0XP5rTAz3WV4KgP0XasThFM
         sS80Xzd8iQ9xfOOQm132nXh3H9xiMkfdFB9vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040656; x=1792645456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A8Gox/IHV1qIE11dJtkPSv7NSR0EBiYYlZP9+2O9uk8=;
        b=dwmkwKDdKr0CA2ab6gJZhhXpI5/Qqi0oj6UAgjWpVvqLlguj8MN7GzyVLkvqU/B6RI
         HJlrqQJQFChp/XS4s4YW6pNKs/Vz4qsUUhkJpNzLRZpUspUdL/39OGbksR72hOoremqL
         xivXez8A7D+qv3DSiGRnhUg1B0Dlr4t7BswguNQ9gkKYugHjM5wh3rCTK3aMqORt7Oa6
         1wMvDF0Th4b+RgcUTt9LYXR1SJDgb3sBq46+WEg3U7WF4LoIjw1Q2SKmrgWuJhbeSXjY
         VA2vkKNtutkEWfXOburcqgh73A71USCy9/+tftdf+Y6sC8FZT+QTsGzYS5AbgBMgMaSo
         1tAg==
X-Gm-Message-State: AFq9FYJyDURK62t1Uuv5RMzVlsKvny3XHvKZyqKfaDkqBySPMejb0+Zv
	v0OOigOngc6otwJJHYaRfIVW5kNvM4qX9wGn2y36yr/kbAPIGjjNdJqyuTwf434tGgwGhsXolyi
	hKA/9eLo=
X-Gm-Gg: AYBFou1XI3QJQh94mLHq8mMQ2AY3kbDhVRl84kzV6hbmf1+QQFu8rj3jtRpu6iU2akg
	+s/IdonqWjpxcbSZuLRMjpwORmsnOAi/aDSqjKGaBBoRwtaKfQM4IJea1Iw7KbBp8PETK/8rpCe
	wkw8xCAdCBGX8Kgy+E3DJCVJPjlYMyhmW5eM6dAwCwTkpZ7GIGwW9KcAsITu7OriQSS3DXbd2gI
	qBPqt/GUPiBwOhub9fGnqHC0kj+joS/Dzb5Z1vG6Arq6Llr9nMtQbKCJPZgHAYAapbDv3eBAv0V
	tLHPPpkC0QXfq7rejUL8ev31VZfX/yhdL9ofiH8OHpEjHyKX5sPSTC4oTW7GC+ZN48pOeEZFcit
	GfNsLGtjAw3Kp8T80KrDOZkKTpzJLK/3usydPpFT9zDC8bYAbj0YF4Um32V0RUUr4jSp6LRMBOz
	wYAs5hW4/bJQ6q6v5EgoPTg1uZSLil/UVZHd8685lcZ1BeNFLBa+8wvPbWPPNooMhjlxRy/M3d3
	N/wn/4HZoqepBAIb7cY/QQN3vrIKPZQjXnp8bZONZ0kETofA9X6iw3zz17H2o4gb35Vw2M24g==
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a18e4ca869mr328609435e9.19.1792040656253;
        Wed, 14 Oct 2026 22:04:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 55/55] python3-click: fix CVE-2026-7246
Date: Thu, 15 Oct 2026 07:03:18 +0200
Message-ID: <c9b000059a37241c5b97426f0aadc012b13bd20f.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247853

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

