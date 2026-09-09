Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6656EC88E43
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6337.1788939022612846120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nT1EppLI;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so22456895e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939021; x=1789543821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YGbHeGOv5MwL6AF0IYMcFn6VFNnHBIFIZhiGy6XnRR0=;
        b=nT1EppLIZCw0+kR1dp0nvzQTkBVuHhaueSUMG338EAsszHVmJTQVQH5tgN6iw+VStR
         BBLvWOQ6it7vYSZsNu7NZBLZaxx1dk0odyNj7gdaMc2VVyB2kTH5BIaN/7bVvovNnIH4
         /VZIx+y6DcgM3uqh7c3nc0Vkc9l5r0I30jL4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939021; x=1789543821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YGbHeGOv5MwL6AF0IYMcFn6VFNnHBIFIZhiGy6XnRR0=;
        b=GszxR7/L2cL56QI8lh0aG5SHdyvIt945Wsgz0Q0Yxj93O5h1T8Xp+RGMsQYHAVoI7x
         Xq3mDbUxaEtOxNJZoWTTWc+Y3IOpcGOtvlPqK+A7s6m6NfPg9PEut9IH9tSO+qVx+mPg
         CP9COau5mT48DN2iJqdsd/k9GDO0fW2MP++UPDBif9f0SHEX6dfLgax5fT+azLIGMsY0
         TIgHmv2iexerhihSvYg5U7fr86BCGcwPz6eM//q9KOcvfHySzcJTn59+oZnyIoOUpZRX
         QpszfcWD2D32VvYSCS3jHDxE2Lypyk0UC3ZDZZvamaCQctCLEy4m4XAYFlj9guoL0BKg
         HDXQ==
X-Gm-Message-State: AFuF++nSjl2XHr5NNPNSOjPATPTK9bqrKpdEsAROnkLcpvkBx2jItut/
	qJrhL/JKhqP47jSdjD5Mow4cnJR9dqeFvjovZj11k1eyoKUvZkjKiEz6RRfSK2ze/EjF++PAQYH
	doV6Ze/o=
X-Gm-Gg: AYBFou21oo2KDuphMSYFUfQ16NH7LTaV9HoIDbmEpLnFMXkPy4uLYYk3HpiiYjWO74N
	v2Ooz0SdPwwC6Om/Q+l+jkOMSSCotKGy+QSf56uR4h5HxQ1SZeiQg2gRTpPgy3/oct7tSTCXElO
	k/+Yn0qN+c/25KoYMm/wbqTdJSm2WjjoTVTbbx11Bf/NGTxqQBbbuzW4j6Thj+eUhUJoYg6WMFN
	8+6LrhZTkF2s9UZvnznL0aBHSmdmiJholqsI0L5Sw253y1beWGOHckv52DphUx1Dn8C8D/rb0ds
	v5QFz7Qbg+2UissoQYcp3VIzRw1YFVvQKPFl6M0UIenuN8VERpPqsVoSHwwlPuO+VQZo/X3Y5dC
	q9A4kAY19csAvdOe3qXY7KbCw28Hi06OWm4G8KhP8vIi03pnvAUaE9hYSeT5fWdUwrb220t49un
	YV1ypYVIlMn6av/a1JCsRqwcES41TMhPUNSemL0CUh6x9ow2cYTtHBsyeGW36C1Gz+VjJAjtWDo
	Ss3dCVUpt40/gQ0DyxXUeyBab95H2pcNlrkZNyXRUuy2SC/tux/+yiTrSo4r/d/zCOlswokp0Q=
X-Received: by 2002:a05:600c:4505:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49cf7fe607cmr312961375e9.2.1788939020535;
        Wed, 09 Sep 2026 00:30:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 37/38] python3-pip: Fix CVE-2026-8643
Date: Wed,  9 Sep 2026 09:29:36 +0200
Message-ID: <c4c9a9da8d864a485178a31a39b71c3e15d423f2.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245446

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-8643-regression_p1.patch         | 35 ++++++++
 .../CVE-2026-8643-regression_p2.patch         | 69 ++++++++++++++++
 .../python/python3-pip/CVE-2026-8643.patch    | 80 +++++++++++++++++++
 .../python/python3-pip_26.0.1.bb              |  3 +
 4 files changed, 187 insertions(+)
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
index 3ff6cd39cd2..b6581575580 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -26,6 +26,9 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch \
             file://CVE-2026-13346.patch \
+            file://CVE-2026-8643.patch \
+            file://CVE-2026-8643-regression_p1.patch \
+            file://CVE-2026-8643-regression_p2.patch \
            "
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"

