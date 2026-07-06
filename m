Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8EFC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155311.1783358250440198091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fqWVqPoQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so25166335e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358249; x=1783963049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDQ/RXCewfkmV0qH2qBiaG4uJ3z6Ajpvqgcbxu5/Ce4=;
        b=fqWVqPoQl4rPeExMYXOcE+UXmkGOJJImJni1Y9DhmusKbUZf4g2xjIoHDYrdjWVaQ9
         /mTmjmrlwRDnSeBa1HEclL5aKYlhdBlUIDXVVPLJdkwOX291FGZ8U46FrTqG+1x0V2N3
         NQB0y58rGCc/N3IZCrV1+IuZ4dLNI9Fjl+r0NXbv7hhpleP5Ruh4WzKS8mVdqa5r4EgF
         wIC4lAdNLeFK+qkqmAteONR1bLCT9nWq/lbkqt9bT2PEv9FcfzTNnnCRpcnt0BeQpDkv
         Dfu3PCNnD+Y83t1xG4rguAlic/Fb7CeAWIUDUYdkJeuMU9spQky4GJbjWx9FN97E/nGG
         ploA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358249; x=1783963049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDQ/RXCewfkmV0qH2qBiaG4uJ3z6Ajpvqgcbxu5/Ce4=;
        b=JD3pvmvO/s1cLMrYWkml9XyoJzY97pa9GWyIQX6nIfG2SirSvQYvheUvUzLdhL66aN
         bz86pPgl8TNeZe9awvJ9KqmnyUD5Zz9O9XEBTnS2YJXfSlWP60vPxyXMsuhff1KhD7WI
         5czbJrlDE6u07cXbcyNdIYIroAIwiwRFq7DIp1XLKylrZOz8EoHY0os+5AuHoFS1JfRG
         sHmrbKVhaSmpfouYzhAI6BqeoOcMjwXxUjdxTuL1HT5ZN+9sCoy2Y8i9tpdiKx3y8EQ/
         IGXqVaXwu5XzcG1i0ox2WJwmIJkYXvAqaGjyf5qr2+qkADFQ3eFsdJSHINMfIeAmJLNF
         oF2g==
X-Gm-Message-State: AOJu0YzhoYrng0lXyhENGTXxC4dl+3LfVqe4CZx8NLxv1LsNchgNLPv9
	ZSHNBwP9dZ5S7wL8M28QFb0PNPMffN4vsrubMBQ0K7u9lU8JFCMkyaUNOCpDyA==
X-Gm-Gg: AfdE7cmkypM7DmXeIsvF4M1EmAHqBAy3M6XDNLunneXEy4wtLWpKaXYsOKu0eH155g+
	TcCyTF4IiCQhDPTsLyGG2HkjGeEu/d2JCTxvrzXz3boYNXZ0ySxs8tAfge2UrswvP4EazSI1UgO
	ZW9ElrgT5q/Y4uewrl6OtkspswPGvfUgDGWF0IIZywTatkv10R9bK8wEjAlyPZzgMG+xsMqKDlG
	AN1vhLOvzZCkmxK8FlZ+HSHuVXk6HFHVr4Ido1MaNa0eBsVueHdla7imFlx0GmWfQgU8kZLW21F
	ru7+NyLFKq8pltUDlXdlz40KUFh2EzBIHeQ8h4/fLsv/uIDG3DiAtm5AKA8IjSnnYapqlwGzJaU
	9KirqHsanUfjLqFLBGNWniU/x0/tT14udbz5ytiC8zY/vChO+KPy5UwyyHWm/YRDOqDhgBlxuz5
	93kYkFd5Hylwjm7ln8owaIia11BeRWKLMh0iVvVu3ljYHFGKR6
X-Received: by 2002:a7b:c00a:0:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493df065f71mr12880295e9.22.1783358248508;
        Mon, 06 Jul 2026 10:17:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/45] python3-click: upgrade 8.4.1 -> 8.4.2
Date: Mon,  6 Jul 2026 19:16:40 +0200
Message-ID: <20260706171701.70536-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240312

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ------------------
 .../python/python3-click/pytest-fix.patch     |  19 +-
 ...-click_8.4.1.bb => python3-click_8.4.2.bb} |   3 +-
 3 files changed, 14 insertions(+), 181 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
 rename meta/recipes-devtools/python/{python3-click_8.4.1.bb => python3-click_8.4.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch b/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
deleted file mode 100644
index e16f84ec9a..0000000000
--- a/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-"Fix pager test flackiness and add stress tests for echo_via_pager"
-
-From 7eb57cff7cd292fbd526eaf861c8f945ddeb07a3 Mon Sep 17 00:00:00 2001
-From: Kevin Deldycke <kevin@deldycke.com>
-Date: Fri, 22 May 2026 11:13:12 +0200
-Subject: [PATCH] Fix pager test race by raising before yield
-
-Upstream-Status: Backport [https://github.com/pallets/click/commit/ffcc7494c991c9197902fdf4995e11b2da3e9762]
-
-Refs: #3470 #2899
----
- pyproject.toml                 |  3 +-
- src/click/_compat.py           |  1 -
- tests/test_stream_lifecycle.py |  4 +-
- tests/test_utils.py            | 79 +++++++++++++++++++++++++++++++---
- 4 files changed, 78 insertions(+), 9 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index e39ef21055..ed91e5d741 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -185,12 +185,11 @@ commands = [[
- ]]
- 
- [tool.tox.env.stress]
--description = "stress tests for stream lifecycle race conditions"
-+description = "high-iteration stress tests for race conditions"
- commands = [[
-     "pytest", "-v", "--tb=short", "-x", "-m", "stress",
-     "--basetemp={env_tmp_dir}",
-     "--override-ini=addopts=",
--    "tests/test_stream_lifecycle.py",
-     {replace = "posargs", default = [], extend = true},
- ]]
- 
-diff --git a/src/click/_compat.py b/src/click/_compat.py
-index 36c0e53975..134c4f3893 100644
---- a/src/click/_compat.py
-+++ b/src/click/_compat.py
-@@ -12,7 +12,6 @@
- 
- CYGWIN = sys.platform.startswith("cygwin")
- WIN = sys.platform.startswith("win")
--MAC = sys.platform == "darwin"
- auto_wrap_for_ansi: t.Callable[[t.TextIO], t.TextIO] | None = None
- _ansi_re = re.compile(r"\033\[[;?0-9]*[a-zA-Z]")
- 
-diff --git a/tests/test_stream_lifecycle.py b/tests/test_stream_lifecycle.py
-index 42e26acc34..9f4aa20868 100644
---- a/tests/test_stream_lifecycle.py
-+++ b/tests/test_stream_lifecycle.py
-@@ -484,7 +484,9 @@ def cli():
- # Category 6: Stress tests - high-iteration reproducers for race conditions
- #
- # These are marked with ``pytest.mark.stress`` so they can be included or
--# excluded independently. The CI workflow runs them in a separate job.
-+# excluded independently. The ``tox -e stress`` env collects every
-+# ``pytest.mark.stress`` test across the suite (not just this file), so
-+# stress regressions for other components live alongside their unit tests.
- # ---------------------------------------------------------------------------
- 
- 
-diff --git a/tests/test_utils.py b/tests/test_utils.py
-index 139cd7324f..1aebf3cc5a 100644
---- a/tests/test_utils.py
-+++ b/tests/test_utils.py
-@@ -16,7 +16,6 @@
- 
- import click._termui_impl
- import click.utils
--from click._compat import MAC
- from click._compat import WIN
- from click._utils import UNSET
- 
-@@ -286,6 +285,11 @@ def _test_gen_func():
- 
- 
- def _test_gen_func_fails():
-+    raise RuntimeError("This is a test.")
-+    yield  # unreachable, keeps this a generator function
-+
-+
-+def _test_gen_func_yields_then_fails():
-     yield "test"
-     raise RuntimeError("This is a test.")
- 
-@@ -315,10 +319,6 @@ def _test_simulate_keyboard_interrupt(file=None):
- 
- 
- @pytest.mark.skipif(WIN, reason="Different behavior on windows.")
--@pytest.mark.skipif(
--    MAC and sys.version_info >= (3, 13) and not sys._is_gil_enabled(),
--    reason="Generator exception tests are flaky in Python 3.14t on macOS.",
--)
- @pytest.mark.parametrize(
-     "pager_cmd", ["cat", "cat ", " cat ", "less", " less", " less "]
- )
-@@ -456,6 +456,75 @@ def test_echo_via_pager(monkeypatch, capfd, pager_cmd, test, tmp_path):
-     )
- 
- 
-+@pytest.mark.skipif(WIN, reason="Different behavior on windows.")
-+def test_echo_via_pager_yields_before_exception(monkeypatch, tmp_path):
-+    """A generator that yields then raises: click writes the partial output to
-+    the pager stream before propagating the exception.
-+
-+    The pager file content is intentionally NOT asserted: pipe-drain timing
-+    between click and the pager subprocess is outside click's control
-+    (#2899, #3470). Spying on ``MaybeStripAnsi.write`` records what click sent
-+    to the pager, which is deterministic regardless of scheduling.
-+    """
-+    monkeypatch.setitem(os.environ, "PAGER", "cat")
-+    monkeypatch.setattr(click._termui_impl, "isatty", lambda x: True)
-+
-+    writes: list[str] = []
-+    real_write = click._termui_impl.MaybeStripAnsi.write
-+
-+    def spy(self, text):
-+        writes.append(text)
-+        return real_write(self, text)
-+
-+    monkeypatch.setattr(click._termui_impl.MaybeStripAnsi, "write", spy)
-+
-+    pager_out_tmp = tmp_path / "pager_out.txt"
-+    with (
-+        pager_out_tmp.open("w") as f,
-+        patch.object(subprocess, "Popen", partial(subprocess.Popen, stdout=f)),
-+        pytest.raises(RuntimeError, match="This is a test."),
-+    ):
-+        click.echo_via_pager(_test_gen_func_yields_then_fails())
-+
-+    assert "".join(writes) == "test", (
-+        f"click should have written the yielded chunk before exception, got {writes!r}"
-+    )
-+
-+
-+@pytest.mark.stress
-+@pytest.mark.skipif(WIN, reason="Different behavior on windows.")
-+@pytest.mark.parametrize("_", range(1000))
-+def test_stress_echo_via_pager_exception_cleanup(_, monkeypatch, tmp_path):
-+    """Repeated exceptions during ``echo_via_pager`` must not leak subprocesses.
-+
-+    Regression coverage for the cleanup path in ``_pipepager``'s exception
-+    handler (issue #2899, PR #3470). Each iteration spawns a real pager
-+    subprocess, raises before any data is written and check there is no leak.
-+    """
-+    monkeypatch.setitem(os.environ, "PAGER", "cat")
-+    monkeypatch.setattr(click._termui_impl, "isatty", lambda x: True)
-+
-+    spawned: list[subprocess.Popen] = []
-+    real_popen = subprocess.Popen
-+
-+    def tracking_popen(*args, **kwargs):
-+        p = real_popen(*args, **kwargs)
-+        spawned.append(p)
-+        return p
-+
-+    pager_out_tmp = tmp_path / "pager_out.txt"
-+    with (
-+        pager_out_tmp.open("w") as f,
-+        patch.object(subprocess, "Popen", partial(tracking_popen, stdout=f)),
-+        pytest.raises(RuntimeError),
-+    ):
-+        click.echo_via_pager(_test_gen_func_fails())
-+
-+    assert spawned, "pager subprocess was never started"
-+    for p in spawned:
-+        assert p.returncode is not None, "pager subprocess not reaped"
-+
-+
- def test_echo_color_flag(monkeypatch, capfd):
-     isatty = True
-     monkeypatch.setattr(click._compat, "isatty", lambda x: isatty)
diff --git a/meta/recipes-devtools/python/python3-click/pytest-fix.patch b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
index 662ad8aae9..abfa07120a 100644
--- a/meta/recipes-devtools/python/python3-click/pytest-fix.patch
+++ b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
@@ -1,4 +1,8 @@
-Fix an error with newer versions of pytest (9.1.0) by converting the generator into a tuple:
+From 1cdbe9829973a30037075d613b5a1d5a42e260d5 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 15 Jun 2026 11:37:28 +0100
+Subject: [PATCH] Fix an error with newer versions of pytest (9.1.0) by
+ converting the generator into a tuple:
 
 E   pytest.PytestRemovedIn10Warning: Passing a non-Collection iterable to parametrize is deprecated.
 E   Test: tests/test_basic.py::test_boolean_conversion, argvalues type: chain
@@ -9,12 +13,15 @@ ERROR: tests/test_basic.py:tests/test_basic.py
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Submitted [https://github.com/pallets/click/pull/3597]
+---
+ tests/test_basic.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: click-8.3.3/tests/test_basic.py
-===================================================================
---- click-8.3.3.orig/tests/test_basic.py
-+++ click-8.3.3/tests/test_basic.py
-@@ -258,10 +258,10 @@ def test_boolean_flag(runner, default, a
+diff --git a/tests/test_basic.py b/tests/test_basic.py
+index 34d22e7..8076dd8 100644
+--- a/tests/test_basic.py
++++ b/tests/test_basic.py
+@@ -258,10 +258,10 @@ def test_boolean_flag(runner, default, args, expect):
  
  @pytest.mark.parametrize(
      ("value", "expect"),
diff --git a/meta/recipes-devtools/python/python3-click_8.4.1.bb b/meta/recipes-devtools/python/python3-click_8.4.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-click_8.4.1.bb
rename to meta/recipes-devtools/python/python3-click_8.4.2.bb
index 53c75c333c..b13bdc9285 100644
--- a/meta/recipes-devtools/python/python3-click_8.4.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.2.bb
@@ -9,8 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
 SRC_URI += "file://pytest-fix.patch"
-SRC_URI += "file://ffcc7494c991c9197902fdf4995e11b2da3e9762.patch"
-SRC_URI[sha256sum] = "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
+SRC_URI[sha256sum] = "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.3


