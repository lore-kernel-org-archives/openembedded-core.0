Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6630AC4450E
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139229.1783291388981793826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bhp+J7yI;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so5849335e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291387; x=1783896187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jk/wmVKjsVoT/N+V9UuM8oT1ZDj62haclvygso+j5Ec=;
        b=Bhp+J7yI9nC7UST2myT/FDT+oPChP9LPTra07fsMmhYAuyFeWxS+uTb8EUo4SR2/zD
         wNKnRqsnSP9ZTHVf6IE9kpS48lY/bcd+ucgyn+irFbBYp8NRTtN2hsXvViWLnd3JewFA
         hBwDS6Cys9TudKZSEh0XH1yZMDPjEEiJ2G8LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291387; x=1783896187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jk/wmVKjsVoT/N+V9UuM8oT1ZDj62haclvygso+j5Ec=;
        b=D+8pbAjvtquD0EuCwscFIiPr1w9F9NANeo8D3JEgOynL4xYWD/Y37F19cTXYSrVck8
         SHWw4UFl2nNl6mNwr1AYnQbI876xRLU8ss/UI+gmtEhURSl3ekut2iIYuJmnTv6IGISM
         1ky/H9dOZ8cV5sOGFj8xd/jaGFCnBa2qbQFOwwQFcYtrUqgUs20hfrlkY33NCEv/OFUi
         Jh4djRoT+/WZl4nyZ3QTaRSYMQuXp3Lc6lFmjGEx1dgYRg2+1uDj9w7pOPy7Sa69g0PD
         y31EanHt9NLjveiPS/K9s72A4Mtipc000SwHCqnSNkMfRNGKSeqDIL5/et75YaXsUd9H
         fWlg==
X-Gm-Message-State: AOJu0Yxjmn2Dg0QxHYIGe3ceO4dkWci0VmV315qER4hRF1Ax0sc5E48B
	UiFGq0ZGIJjAZEU4YFTUCm89ZCYlBZ1YjDcEEapclSVbR93x/VSFcZKQrjfpuU4Jtf7yW+aLd7z
	aaYiOfDc=
X-Gm-Gg: AfdE7ckYKVMbojIg8QGGqJWlSRD/8BgiqlYpnk7EtFsjCnocTZD9NG+ogxb7kduDuR6
	C5nQImJZuiV7M+li9zZB3eNTUc/5KuoS9aAS8Zrqas6TGsJuSzrF3a09RJtfD5X0XRlrdjTX8RE
	JIv46BsonfXc1E5KLLagDs1kxiu/mBgEOdTooCZshA5VYzTVpNZef8mOXgD5igZGjf6ENGyiJDI
	K3AT6h9ml8PVxbHrvGVw/60pX9GCswLp7SAsQGSbx6nZeSkpc1hNN/DS23wuVSweftdY+rxlWuU
	wNloBUvNV2+gw3sP8DhZOjRVx0Qs8E5DmhuPIjiW8FVnXppg61PaQTfpFS6ds+I8gQ6MMtztgOW
	zK7f1f2yZGym0FnED0IDDb5VNytAqIBVi+yMFl1vi/BBY8EuYUukLVn3MU91xdXwoEWJPRSjDQO
	zLqBcutA5n88q5rUi4Y+mX+uha6A==
X-Received: by 2002:a05:600d:6401:10b0:493:cd3f:d051 with SMTP id 5b1f17b1804b1-493d11f03b7mr65723585e9.25.1783291387080;
        Sun, 05 Jul 2026 15:43:07 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 40/55] python3-click: Fixes for new pytest and flaky ptest
Date: Mon,  6 Jul 2026 00:41:30 +0200
Message-ID: <fb00fb7f0ab61ecfe0435bd5143af9bea6cb5f42.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240194

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Submit a patch upstream to allow it to work with the new version of pytest.

Also backport a "flaky test" fix which may help issues we're seeing on the
autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 976beed0875a40d71d0c98d56696c97988684ada)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ++++++++++++++++++
 .../python/python3-click/pytest-fix.patch     |  29 +++
 .../python/python3-click_8.3.1.bb             |   1 +
 3 files changed, 203 insertions(+)
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
diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.1.bb
index 1f42fe1a50c..eba9f09f82a 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.1.bb
@@ -8,6 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
+SRC_URI += "file://pytest-fix.patch"
 SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
 
 inherit pypi python_flit_core ptest-python-pytest

