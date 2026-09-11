Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C13C88E5A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:49 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50973.1789164947289885629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xnaN/F3p;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2896455e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164945; x=1789769745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gsFYN+pcI7hDCK/JVE0Viq/lnthADiPRHWoQhvTPfIQ=;
        b=xnaN/F3pQdtbMBwymMbPmKaPM4YAQmBgIjSUuJoYePGbZjWNlRehqD4+e/nNMr9d3J
         3L3M/nS2zCskxqjGQ/v2VO1MibRRvmwOCYHPr2AqeONsUuYjRpRVzKITppmh8s4Y0EJ0
         W65a1EsxWjWlCiLSSkAofX19Xr3a7h83rpe8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164945; x=1789769745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gsFYN+pcI7hDCK/JVE0Viq/lnthADiPRHWoQhvTPfIQ=;
        b=gKtXTWzLnSbJ+XEkm99TScyTlZOyFXMJYilC7g5J+CpZhIs4dQkus69uBOoAD66/jh
         ZLGzU0KRGnWrSYPlv4Usx6iGoNBEZfIZq8Hm1BTUlWoLqo6lNFAXJv9SsBHYQxwCM3Lp
         YxZBc2Y+FP1p9TQRY+5wQ9uf531w/qkQUeZMd6xIt7GYImdpSVFBaroH2sUch46xGLpe
         6oU/bEVSeudxUMZPjtKaqkmnkNfMvOwjoEDnk9szTiTatKwzYUGNwZVREB3Xaf609z2x
         4mBECra3GlEpaic9nesKW0rxAAO1Ck+bdup6iAHcIGEGdURnkZkT84dN0P/faeZPGCo3
         2v5Q==
X-Gm-Message-State: AFuF++nW89l/OMjDgbWRSNikuWWdrFk3Dtk0+Y0T6qvisbXFMl9PPPXR
	dvDpuTvyFcH1nOXV+jqHK05AED2UdeiLr+8QfT2Awq0d/kkwR8yNqjZa6rl4HnIPaz73NGqAy0N
	6qOMgLTo=
X-Gm-Gg: AYBFou2g7Uptxb/6UwAWrz1oY33xFx3FCOZVhrQWwxWPPmc6lkKiE5FbrwF9OgkPMUr
	GqcTdhwmGD27YoD095y+GQJW+NLn6cBS2LFObTOAHaIt/k1T/Mj3aOYYuLc55fRgfrLqwQXTdqg
	9MDeWL553/2jM+o2sgByUZ2je1dSy6fr92pE602nzwYH1mqfh6/NNH2KdJmZUsra5bowAYy6lP+
	bvvEr+YkB99StVNK/Aqz3INBLy+5l6LXHFawbmGnDdNQkqF7XvOifk85y9l89Z6Oj3zJ1b1pyOQ
	elRyZBHwDg7h4VSAiXmVL5p04mAjF9/ESbNrN8RlSX9gx19a1lJYOK/vKXJ+z+59XWLfPR8MEa3
	UqiTAaNuAivvyOcxAlDygcsn53kTYlfGSyZPoqlQm59eWEs+3Ws6ZPRz5Iq5htgiDivKoLb4BHf
	nNbgqfcnBzZ/YlAOP0WitizZFYcUzXbkoeTesZI3nlC7eIxXFYl58WJpT0iSTUkfgvhaucCN53s
	G7zNC6sUP2lG14KociE22IQI+FBFZLF8B/Thg9dD6zv31RDqYoh97cjX54SaPyADcGMilCNm2M=
X-Received: by 2002:a05:600c:1d08:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49e619b57admr155574515e9.5.1789164945439;
        Fri, 11 Sep 2026 15:15:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/13] python3-pip: Fix CVE-2026-8643
Date: Sat, 12 Sep 2026 00:14:58 +0200
Message-ID: <2c276677d619bc6205872eb2b5a9948a4605d8ea.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245673

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 00000000000..966a98f9d27
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
index 00000000000..025b4fe929d
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
index 00000000000..ad1124a4419
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
index 51fff41e257..d535e1f53d7 100644
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

