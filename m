Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0EBCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 10:49:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126818.1781520584151831526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 03:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ly2k/P//;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so33577025e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781520582; x=1782125382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lwr0BR0pe+3Udc9GRSABmtPTbl/tTE9a8p8U058oLUg=;
        b=Ly2k/P//Y3DNLcjyAWTxHGItMcqd9CwuGndHyKTKUXhEmC9DL80Or7R7f/IL6erTeD
         bqJDvR3PchoMcafb6LRC1sQzKVdXCPIthfU8nFgAbJuRjtEueCzDx3RmmB4KSAbt53lv
         fiIRlcTttG5Mpoc0h85XpgwabDiCbwa1aOIxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520582; x=1782125382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lwr0BR0pe+3Udc9GRSABmtPTbl/tTE9a8p8U058oLUg=;
        b=XbZBspBm9KICwMl8V3gvMuJ370EomnHCvovDbyO+J90aY832CpKqW2alkq6nlTS5aB
         XE5bmXVbxRQhprFVTCBL2sNCFpLUcz7znpcvxNg0VRi5nlSs5OUNzOqy/gf0dEMca11p
         q6GywBlxS/F6/wiBCjd0r5MykWZrVsOLYixYobj8L/TTpHZ62PFlCFWTxw48etV2iO5O
         FFirQoi5NROZhc5WbSRjYSYH8RRl9aMifXvf3f/lP56MvrSkWxEs6SwNqfQZln9y+QDa
         DYhcOoVKi9yFvKGfve/4AMri4WTOMFURRxmnVnOHC2I+FewzoEkDrO8F4XO4HRQ2885i
         StFQ==
X-Gm-Message-State: AOJu0YyXOR7J3+okaUw1j1Hczouh/mYYT6+DwD50/tDZykRQpt7qWaph
	Lfzdr1We/zDDMeL+T+jlam7lXfKkFWbpjQwObM+d/2Ak0Qc6fBnp7mo+u956Sk3joaeWG0OgPBj
	38KbW
X-Gm-Gg: Acq92OHhD3/rx7dR7igPJspimlfBndZ1HMeb0GMEfZttc+vNuX6F6InzWnNW0ushSXM
	55hmKqr102HYkmrTLZRhNCgj422pVCdVxEdl2ePkFyN3/52a3RJX0s89DcMp2WG3uCNLEjXKin5
	cZf/M7mTEGIW079TEfznJOwGVBzBygzD9sf5DQINM0f3dz8lGotluhYPtQRtsO2QnYjhsbazXpY
	VnpkHbIvOl7zappsBzCW2ueqBW0kuxTLoWXivpt6t4d/X2phnazWfjdU9rO34gATm9C1CeGCTSd
	NXSfTMeT9UmOxhFLwuUavg0pyoaWG8oIX0QJYRm1H9kg+7SzFZuQD2Wkry8JqTP3HWjPwBehGK1
	VZFELgk8liu+a26DKafD8rAiPFkB8z9TQ//qSO4vd/AugpUfahalRjj1dm3bJHhAa/cHeKsdO/U
	TsUkGb8a9e7TW2oH7yftlTMwxzl+eaC7zF3i5gWeYLI8TBN8xg2o8o
X-Received: by 2002:a05:600c:8b5b:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490ec49f2bemr157862345e9.8.1781520582014;
        Mon, 15 Jun 2026 03:49:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2da:88d9:f720:efe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220207efesm208877515e9.0.2026.06.15.03.49.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:49:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-click: Fixes for new pytest and flaky ptest
Date: Mon, 15 Jun 2026 11:49:40 +0100
Message-ID: <20260615104940.567584-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 10:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238831

Submit a patch upstream to allow it to work with the new version of pytest.

Also backport a "flaky test" fix which may help issues we're seeing on the
autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ++++++++++++++++++
 .../python/python3-click/pytest-fix.patch     |  29 +++
 .../python/python3-click_8.4.1.bb             |   2 +
 3 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/pytest-fix.patch

diff --git a/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch b/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
new file mode 100644
index 00000000000..e16f84ec9a3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
@@ -0,0 +1,173 @@
+"Fix pager test flackiness and add stress tests for echo_via_pager"
+
+From 7eb57cff7cd292fbd526eaf861c8f945ddeb07a3 Mon Sep 17 00:00:00 2001
+From: Kevin Deldycke <kevin@deldycke.com>
+Date: Fri, 22 May 2026 11:13:12 +0200
+Subject: [PATCH] Fix pager test race by raising before yield
+
+Upstream-Status: Backport [https://github.com/pallets/click/commit/ffcc7494c991c9197902fdf4995e11b2da3e9762]
+
+Refs: #3470 #2899
+---
+ pyproject.toml                 |  3 +-
+ src/click/_compat.py           |  1 -
+ tests/test_stream_lifecycle.py |  4 +-
+ tests/test_utils.py            | 79 +++++++++++++++++++++++++++++++---
+ 4 files changed, 78 insertions(+), 9 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index e39ef21055..ed91e5d741 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -185,12 +185,11 @@ commands = [[
+ ]]
+ 
+ [tool.tox.env.stress]
+-description = "stress tests for stream lifecycle race conditions"
++description = "high-iteration stress tests for race conditions"
+ commands = [[
+     "pytest", "-v", "--tb=short", "-x", "-m", "stress",
+     "--basetemp={env_tmp_dir}",
+     "--override-ini=addopts=",
+-    "tests/test_stream_lifecycle.py",
+     {replace = "posargs", default = [], extend = true},
+ ]]
+ 
+diff --git a/src/click/_compat.py b/src/click/_compat.py
+index 36c0e53975..134c4f3893 100644
+--- a/src/click/_compat.py
++++ b/src/click/_compat.py
+@@ -12,7 +12,6 @@
+ 
+ CYGWIN = sys.platform.startswith("cygwin")
+ WIN = sys.platform.startswith("win")
+-MAC = sys.platform == "darwin"
+ auto_wrap_for_ansi: t.Callable[[t.TextIO], t.TextIO] | None = None
+ _ansi_re = re.compile(r"\033\[[;?0-9]*[a-zA-Z]")
+ 
+diff --git a/tests/test_stream_lifecycle.py b/tests/test_stream_lifecycle.py
+index 42e26acc34..9f4aa20868 100644
+--- a/tests/test_stream_lifecycle.py
++++ b/tests/test_stream_lifecycle.py
+@@ -484,7 +484,9 @@ def cli():
+ # Category 6: Stress tests - high-iteration reproducers for race conditions
+ #
+ # These are marked with ``pytest.mark.stress`` so they can be included or
+-# excluded independently. The CI workflow runs them in a separate job.
++# excluded independently. The ``tox -e stress`` env collects every
++# ``pytest.mark.stress`` test across the suite (not just this file), so
++# stress regressions for other components live alongside their unit tests.
+ # ---------------------------------------------------------------------------
+ 
+ 
+diff --git a/tests/test_utils.py b/tests/test_utils.py
+index 139cd7324f..1aebf3cc5a 100644
+--- a/tests/test_utils.py
++++ b/tests/test_utils.py
+@@ -16,7 +16,6 @@
+ 
+ import click._termui_impl
+ import click.utils
+-from click._compat import MAC
+ from click._compat import WIN
+ from click._utils import UNSET
+ 
+@@ -286,6 +285,11 @@ def _test_gen_func():
+ 
+ 
+ def _test_gen_func_fails():
++    raise RuntimeError("This is a test.")
++    yield  # unreachable, keeps this a generator function
++
++
++def _test_gen_func_yields_then_fails():
+     yield "test"
+     raise RuntimeError("This is a test.")
+ 
+@@ -315,10 +319,6 @@ def _test_simulate_keyboard_interrupt(file=None):
+ 
+ 
+ @pytest.mark.skipif(WIN, reason="Different behavior on windows.")
+-@pytest.mark.skipif(
+-    MAC and sys.version_info >= (3, 13) and not sys._is_gil_enabled(),
+-    reason="Generator exception tests are flaky in Python 3.14t on macOS.",
+-)
+ @pytest.mark.parametrize(
+     "pager_cmd", ["cat", "cat ", " cat ", "less", " less", " less "]
+ )
+@@ -456,6 +456,75 @@ def test_echo_via_pager(monkeypatch, capfd, pager_cmd, test, tmp_path):
+     )
+ 
+ 
++@pytest.mark.skipif(WIN, reason="Different behavior on windows.")
++def test_echo_via_pager_yields_before_exception(monkeypatch, tmp_path):
++    """A generator that yields then raises: click writes the partial output to
++    the pager stream before propagating the exception.
++
++    The pager file content is intentionally NOT asserted: pipe-drain timing
++    between click and the pager subprocess is outside click's control
++    (#2899, #3470). Spying on ``MaybeStripAnsi.write`` records what click sent
++    to the pager, which is deterministic regardless of scheduling.
++    """
++    monkeypatch.setitem(os.environ, "PAGER", "cat")
++    monkeypatch.setattr(click._termui_impl, "isatty", lambda x: True)
++
++    writes: list[str] = []
++    real_write = click._termui_impl.MaybeStripAnsi.write
++
++    def spy(self, text):
++        writes.append(text)
++        return real_write(self, text)
++
++    monkeypatch.setattr(click._termui_impl.MaybeStripAnsi, "write", spy)
++
++    pager_out_tmp = tmp_path / "pager_out.txt"
++    with (
++        pager_out_tmp.open("w") as f,
++        patch.object(subprocess, "Popen", partial(subprocess.Popen, stdout=f)),
++        pytest.raises(RuntimeError, match="This is a test."),
++    ):
++        click.echo_via_pager(_test_gen_func_yields_then_fails())
++
++    assert "".join(writes) == "test", (
++        f"click should have written the yielded chunk before exception, got {writes!r}"
++    )
++
++
++@pytest.mark.stress
++@pytest.mark.skipif(WIN, reason="Different behavior on windows.")
++@pytest.mark.parametrize("_", range(1000))
++def test_stress_echo_via_pager_exception_cleanup(_, monkeypatch, tmp_path):
++    """Repeated exceptions during ``echo_via_pager`` must not leak subprocesses.
++
++    Regression coverage for the cleanup path in ``_pipepager``'s exception
++    handler (issue #2899, PR #3470). Each iteration spawns a real pager
++    subprocess, raises before any data is written and check there is no leak.
++    """
++    monkeypatch.setitem(os.environ, "PAGER", "cat")
++    monkeypatch.setattr(click._termui_impl, "isatty", lambda x: True)
++
++    spawned: list[subprocess.Popen] = []
++    real_popen = subprocess.Popen
++
++    def tracking_popen(*args, **kwargs):
++        p = real_popen(*args, **kwargs)
++        spawned.append(p)
++        return p
++
++    pager_out_tmp = tmp_path / "pager_out.txt"
++    with (
++        pager_out_tmp.open("w") as f,
++        patch.object(subprocess, "Popen", partial(tracking_popen, stdout=f)),
++        pytest.raises(RuntimeError),
++    ):
++        click.echo_via_pager(_test_gen_func_fails())
++
++    assert spawned, "pager subprocess was never started"
++    for p in spawned:
++        assert p.returncode is not None, "pager subprocess not reaped"
++
++
+ def test_echo_color_flag(monkeypatch, capfd):
+     isatty = True
+     monkeypatch.setattr(click._compat, "isatty", lambda x: isatty)
diff --git a/meta/recipes-devtools/python/python3-click/pytest-fix.patch b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
new file mode 100644
index 00000000000..662ad8aae9d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
@@ -0,0 +1,29 @@
+Fix an error with newer versions of pytest (9.1.0) by converting the generator into a tuple:
+
+E   pytest.PytestRemovedIn10Warning: Passing a non-Collection iterable to parametrize is deprecated.
+E   Test: tests/test_basic.py::test_boolean_conversion, argvalues type: chain
+E   Please convert to a list or tuple.
+E   See https://docs.pytest.org/en/stable/deprecations.html#parametrize-iterators
+ERROR: tests/test_basic.py:tests/test_basic.py
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://github.com/pallets/click/pull/3597]
+
+Index: click-8.3.3/tests/test_basic.py
+===================================================================
+--- click-8.3.3.orig/tests/test_basic.py
++++ click-8.3.3/tests/test_basic.py
+@@ -258,10 +258,10 @@ def test_boolean_flag(runner, default, a
+ 
+ @pytest.mark.parametrize(
+     ("value", "expect"),
+-    chain(
++    tuple(chain(
+         ((x, "True") for x in ("1", "true", "t", "yes", "y", "on")),
+         ((x, "False") for x in ("0", "false", "f", "no", "n", "off")),
+-    ),
++    )),
+ )
+ def test_boolean_conversion(runner, value, expect):
+     @click.command()
diff --git a/meta/recipes-devtools/python/python3-click_8.4.1.bb b/meta/recipes-devtools/python/python3-click_8.4.1.bb
index 0669cc65108..53c75c333c2 100644
--- a/meta/recipes-devtools/python/python3-click_8.4.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.1.bb
@@ -8,6 +8,8 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
+SRC_URI += "file://pytest-fix.patch"
+SRC_URI += "file://ffcc7494c991c9197902fdf4995e11b2da3e9762.patch"
 SRC_URI[sha256sum] = "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
 
 inherit pypi python_flit_core ptest-python-pytest

