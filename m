Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26B2C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2828.1790154716015873304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cmD/FpSF;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so7457865e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154714; x=1790759514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1yabCpIs1VnOtM4u0n156MGPtR4sOIPFzoZF6mYhfpY=;
        b=cmD/FpSFnw01BEIM0qtX0fl0E8ZKLq7GnU4V0+XfFZKwm6QKYzbxa8+kaplKim+FRz
         /d0WlBce0pXoU5tO0Lgfhkq7yUW/vTxdk6bdB5nO19FtWfy3trFYTifQPMQgHCUkAWUz
         dkRDqQ2e1LLlFWJ5GS4pwMCl9jxLc2zsjvRlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154714; x=1790759514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1yabCpIs1VnOtM4u0n156MGPtR4sOIPFzoZF6mYhfpY=;
        b=N8GLtiHnyJbbMqVTXhqG5Bz9TI0SUofArS3BAY8lGJ44D+UY1KCNXwyyZjc01u5a3f
         kp0Z2aofhPMUaMMtlCf1zVVBKUH9xB2yJtu88viTju90/8opt11/G+fiMFqucay5oorm
         YFPCsnIa53nnU2za5vKM7LZanYcqmbv+z7cIn3D+QeZms/RtqScuQreBYzTzuUTZXRpz
         Q8VAsCUG6nqugxmSsRPMh38dT4NUG/1KlTRTYzfWjKTBPrJxlr4uCWO5UpEHLX2C7z8f
         HIaWUNHNhOY7iux03MsKYjnHsCOhcrDIhd61amZHGRaqEHsjraUkffMGuQSIBNyKU7KQ
         B4ew==
X-Gm-Message-State: AFuF++koerCem5HYnLZShKKqy9MCfuvvV0an/Z2xyp2Ro0YkpURRNOto
	uKjP7Yaox4XhxIRlzVcY4lRrrlIoTay6pCPZU9MTplnBPudaCznva+/Wbv2L4aC2Q7FksGqP3tX
	8fyRxgMI=
X-Gm-Gg: AYBFou1o8mtttTeLoXPwQZzHdnwy+xzuWpXefm6EPi3xC8/3/EAWcstZ0v3OppdpLjL
	UolHgszEIUGDhhU1IPSNwReCwmgYgut7WE5gZ420wyatNjW3sTp12ddGRRd7ts8MrfrjGQDiNwH
	IIaaSQVO0IGq6mYaMDdJqTM+SoUlv9X88dj+2QESUIf+4EYA3QoMe2q578a/EwF73pVr4EjvVF7
	Qzs+ZBRrE46nJAl7y/2J4Rttv/MqeYi0vGFbS2pH+1WMmlTFfBOiy/BPoQfEjXDBKsOmQ5eGQVY
	nPNqXx1dmqArfGp10/Cds7WIETQVfOov3y7YHp4enp9PL3nwgiqd5pQNbjuAwtqEl5KTfJb2V2m
	YPpKya7QoIL4crelcwYAsoXRUDLA+K3Zh6kHB1qmw4VJsBnzKwuqRwkVMwuXgTK6jZ0I5T/dEGE
	ll+7GLkyhY8/8RaENDiMQnEmNL9dZcEc1xYtCbdAB8rEjY2KGgGowlNzXCWoTRQoqmbF45UROvo
	IHZTHRpJGCZkd4fHsrQ7TDE0EhI3skutgIzYzQpya8jNHWcLipEj911GyhEDg01nlFoJuap
X-Received: by 2002:a05:600c:3e10:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49fdf13951bmr23881485e9.24.1790154714169;
        Wed, 23 Sep 2026 02:11:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/48] python3-git: fix CVE-2026-42215
Date: Wed, 23 Sep 2026 11:10:32 +0200
Message-ID: <d1c3217c9cc503d85d4fd796d424c43496255ba7.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246492

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.47 backport for
CVE-2026-42215. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commits are referenced in [3] and [4].

[1] https://github.com/gitpython-developers/GitPython/commit/0f68db0710f9125762fca5dbc2328593537ae923
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42215
[3] https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6
[4] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-git/CVE-2026-42215_p1.patch       | 61 +++++++++++++++++++
 .../python3-git/CVE-2026-42215_p2.patch       | 47 ++++++++++++++
 .../python/python3-git_3.1.42.bb              |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
new file mode 100644
index 00000000000..9d5f10c6943
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
@@ -0,0 +1,61 @@
+From 341a49149a37762e12b10eb70605b54f4abfb54d Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Mon, 20 Apr 2026 23:29:50 -0400
+Subject: [PATCH] Block unsafe underscored git kwargs / Fix for
+ GHSA-rpm5-65cw-6hj4
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+(cherry picked from commit 142195888e713542189533a52cdfc333f05c3af6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index f58e6df5..874acb43 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -540,6 +540,12 @@ class Git(LazyMixin):
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
+@@ -547,15 +553,14 @@ class Git(LazyMixin):
+         Some options that are passed to `git <command>` can be used to execute
+         arbitrary commands, this are blocked by default.
+         """
+-        # Options can be of the form `foo` or `--foo bar` `--foo=bar`,
+-        # so we need to check if they start with "--foo" or if they are equal to "foo".
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
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
new file mode 100644
index 00000000000..cef3fe6b015
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
@@ -0,0 +1,47 @@
+From 3385ff27397b58288d922838e8d2eae87d7534fd Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Tue, 21 Apr 2026 12:03:20 -0400
+Subject: [PATCH] git.cmd: harden unsafe option canonicalization and isolate
+ push test cases
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8]
+
+Backport Changes:
+- Omit regression test updates because the Scarthgap PyPI
+  source archive does not include the upstream test suite.
+
+(cherry picked from commit 43d92dec4683568d11495956dd556161f17c3ea8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 69756216..73b4c052 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -542,9 +542,18 @@ class Git(LazyMixin):
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
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 8c130cf63b4..38fbd8a078b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -19,6 +19,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
             file://CVE-2026-44243_p2.patch \
             file://CVE-2026-44244_p1.patch \
             file://CVE-2026-44244_p2.patch \
+            file://CVE-2026-42215_p1.patch \
+            file://CVE-2026-42215_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 

