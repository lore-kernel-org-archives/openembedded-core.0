Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654D7C79FAA
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2576.1788641114632051824
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NI+j9hXL;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso19396035e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641113; x=1789245913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vv9h/IlSN4vTtnJnJu5ZB7T9d3KWxEN4aLuBJg8M8co=;
        b=NI+j9hXLZSpIbMqQvpUvJlqdqOt8HvNKdl/ZZ8/wbWXG7d8bcLWfsl7cRvKI2b9jzV
         kjfy7w729Ad0f94nqiNSwutmWupr0liF+rphGvmObiQwrJst6AoVmy9KAABwfL5wsnlr
         kZA4x0sO3eEhb8SUDaRwHozOLQKvx9Zsyw7VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641113; x=1789245913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vv9h/IlSN4vTtnJnJu5ZB7T9d3KWxEN4aLuBJg8M8co=;
        b=AHl8OUgXci4cQbsV0DDDUxh5GuACnKpx64WlT8XP9MJzdd6O3voPN9JLIdOl6fpkSr
         il7jaeCD24J9z1R1h91luJF/G0yA0wddD1mGEVhJyE4rtnKfb5ELBTAC/mO94DxTCgfQ
         4mrztDnEUqzXzcI1arIisXy70GNx6Kgg37PjuuF7eyhiPpZQuX4T28+PqnkiZDIRMev4
         t6kyHdMqMMHADdRnuxMV8GyntPf6nV6olrQYK7/sC6x9NavTcHsOjsODjU8TuDTJs10T
         T+In1B7JrlztuAaR696ZDf5feyiZJRMwf3Gj092CEigKrCO1FroF+Ra4WkfFKHWI9Mmt
         BwlQ==
X-Gm-Message-State: AFuF++mTe5m9981WoQNGAfv1M9VsUe9igM5zMoBlbINMzWNf6+B/s2Te
	eDD8i3VHDM4uOp9HdSzaImIPfTU5cg13ykomVqIAnfQgImsBhcxidE846s835K7LFt32k5S2vAx
	bMFBBbog=
X-Gm-Gg: AYBFou0pw5vqi4To/1LADpJZCepb6bhSJNU7w4XolQnr2bfIIbT7bBJao+E58rq+dfp
	0IxIaPu+2Utr7DYLfqx2XlJl5z+cjD2NVIGIjDCueg1RBcnd+EJA7jTBiZC+kmAMJRRkhHWdL3o
	EYQaoarENL3qwr6N4yjbdIAz6Beqkq+ncsT1Ujg6Q/uxMuPMNMXdZP+h+ZfsqfdstGy0oATvKHv
	y7ErWYWuA8/uGlbWFpDw7rd9/b4ZztXaR1gac+DRbQ8F8cSrmTa/11r7XH9JTVGk9K4Djme+Vq0
	hxLtzX7GnG537OB4VT7FRHdWFdyy1Fmb1jfAnMAivAzhQiJeKTtDKunpAgVhW7dfm7Jubstdrtj
	20gNs6JJ1s75gHqSHhfy+Wz2dBgf4u8yUxAY49BvWjh+sh9NparQ3SXzYKM+hmysyJ69vxg1JuQ
	3zrGUpAMenfdj9z79mDWWhFV4e/zCm5OG0dp/sRI964zbC6oTiTPU0NOf+UPGrWL/zYmr5SHke0
	KGpuxrlSt6FfLcYPkoNywA+gpObdQV804pFPsa6v4tKkvt4TcDsxIJjqCRgXSdiBQ==
X-Received: by 2002:a05:600c:4693:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49d00399d19mr69176135e9.3.1788641112718;
        Sat, 05 Sep 2026 13:45:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/40] python3-git: fix CVE-2026-42215
Date: Sat,  5 Sep 2026 22:44:05 +0200
Message-ID: <eca70d244d6f0cca5bf68b8130e84acf7d22435e.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245156

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3],
using the backported commits shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6
[2] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rpm5-65cw-6hj4

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-git/CVE-2026-42215_p1.patch       | 60 +++++++++++++++++++
 .../python3-git/CVE-2026-42215_p2.patch       | 45 ++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
new file mode 100644
index 00000000000..0129250fdfc
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
index 00000000000..a23fba8d819
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
index bfbdd802893..26d9a3f0633 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -13,6 +13,8 @@ PYPI_PACKAGE = "GitPython"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \
+           file://CVE-2026-42215_p1.patch \
+           file://CVE-2026-42215_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 

