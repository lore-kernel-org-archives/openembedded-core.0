Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8609EC79FA9
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34939.1788788166401464706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YnXt7dZL;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2546309f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788165; x=1789392965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JO5zvFE1+KfNIE2qhgM+i92/qrTMrFBIURJ7XUHqT8w=;
        b=YnXt7dZLr/iVn/7SHaDbqpwju+Q7MpOzuwSFmGHlJMqfBWRMz27J4ghaDjkFF/sbZS
         M3SK51rLtP8fqMlakGTcmZN+grQ7f/zBjUplwcG+MqXgbtFgPqMKVV55BaU6cZOuIyQo
         OCI/dZUzBd3K7p861WqUy0B8ZCym3/Z0HyXJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788165; x=1789392965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JO5zvFE1+KfNIE2qhgM+i92/qrTMrFBIURJ7XUHqT8w=;
        b=D2HUdNQpRJfbq39ozVYieKjK5A0DLpStHCnAbpyIGjTB3Ka+a8+g2XxUqLJGHjGwPy
         RWHlRYPkb10s+L9R5Zdt0mzlt/tXZJzoPRWDlIWcuXYoc0moRu69wn6LSdciFV4HLDDl
         UMkkt69jn4ojMBwCgl9p6T+Ey8h7X/AtKWqj1T+r0OcC6pGOwTkWotVyZ6LsFNVwmIzD
         ne1l095WWv6ZJ8P3OzwJxNjlqyviVHx4/8LMuelX6yfksMn0iYy+C/NW3W42m5TNuXmz
         T+beYq5z/V5RARELAsaE0FQJJqtPaN7ys4WGt5gIt2sVjR9knL3HxBXr6EQ0QPfYf/d6
         R92A==
X-Gm-Message-State: AFuF++lK01lbzi6PfdLYzP7rI8xGFEDke6snxgKs+S5NLrDYEggT1V1p
	O9wIeVFZdJ2VDjLN7hTPCZT3vo9zs4B3H3xmEvJye9oNTqjshoIS+87BrSh8sI6bFfNfh+/O/OJ
	01dKMQjM=
X-Gm-Gg: AYBFou11ySsUWYRYxQnzsp0ILadXlfMK5d9uW8ZyZ4pCSKrXHPF1der/KQSZ1KONT4R
	EEylaahO9SQVg2epaCwGUZTMzqJ8yAeNH3aA0Ari8pO+RKQxw5Tf9liJ3evRZVj5gtRqJ1J8w/D
	Lsd9M66Gi9zVBrrdfAeCiwB/TiGdHSB6fLSo7aFr2M9EFX2uZQ2a9Rf1ypxfvdt5epU8nOkoN8l
	IbAei8fTBPFHJd9jub25+2PVeGMQY/PK63e5R0kj/63pF9AVGKqUrjrUTjD/ms7tnvuGjVV6jk3
	F8Si3kdISwSA9wDq1mN1NPe+Pzkyb8l35kL7LABobnrno4hi5dEwCaShv39tmDupFOTU+Jad9i0
	nRq8AdjMetDu+BzJQM9Yyxr3ZCHuFceUkY3eAy758rm0qgvfJ4+YX6/tKl9N8XYkss48uMeMrFe
	Yodp6K64NNhjO8jAOKuDH3sPcVmhR20SWr+scTY1gTQtWtVmWEVhx3RJCvzIJubErQH1Rm7Ifur
	U5V17Qfvq61erlutoyXO7lxz0/m48SgH64dZjqeCbLHWa+GGHuDjNwGuDF26LdB
X-Received: by 2002:a05:6000:1a8c:b0:485:8ee5:5ffa with SMTP id ffacd0b85a97d-485a2c5f5c3mr911215f8f.38.1788788164566;
        Mon, 07 Sep 2026 06:36:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/35] python3-git: fix CVE-2026-44244
Date: Mon,  7 Sep 2026 15:35:21 +0200
Message-ID: <9aaa23d4f6c04049fcdb532f6a83c654e8e6e15d.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245283

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.49 backport for
CVE-2026-44244. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commits are referenced in [3] and [4].

[1] https://github.com/gitpython-developers/GitPython/commit/b049a13105992f22376ad0c7ec945bf3bfb365ae
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44244
[3] https://github.com/gitpython-developers/GitPython/commit/c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2
[4] https://github.com/gitpython-developers/GitPython/commit/8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-git/CVE-2026-44244_p1.patch       | 104 ++++++++++++++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  30 +++++
 .../python/python3-git_3.1.42.bb              |   2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
new file mode 100644
index 00000000000..92aa9056225
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
@@ -0,0 +1,104 @@
+From 19e86eacc9471f2c3ef6f6a55dcaed40e5e139a0 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Wed, 29 Apr 2026 05:47:57 +0800
+Subject: [PATCH] reject control chars in written values in configuration
+
+Reject CR, LF, and NUL in GitConfigParser values before writing them
+to git config files (which also is a deviation from Git which escapes them).
+
+GitConfigParser._write() serializes embedded newlines as indented
+continuation lines by replacing "\n" with "\n\t". Git itself skips
+leading whitespace before parsing config tokens, so an injected value
+such as:
+
+    foo
+    [core]
+    hooksPath=/tmp/hooks
+
+is written in a form where the indented "[core]" line is still parsed by
+Git as a real section header. This lets attacker-controlled input passed
+to config_writer().set_value() poison repository config, including
+core.hooksPath, and redirect hook execution for later Git operations.
+
+Fail closed instead of stripping or normalizing these characters. Silent
+normalization can hide unsanitized caller input, and GitPython does not
+currently round-trip Git-style escaped values such as "\n" as embedded
+newlines.
+
+Apply the validation to set_value(), add_value(), and the public set()
+path so callers cannot bypass the safer helper API. Add regression tests
+for the advisory payload and for CR, LF, NUL, and bytes values.
+
+This preserves existing read behavior for config files that already
+contain multiline values while preventing GitPython from writing new
+unsafe values.
+
+CVE: CVE-2026-44244
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/config.py | 24 ++++++++++++++++++++++--
+ 1 file changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/git/config.py b/git/config.py
+index 85f75419..ce307110 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -841,6 +841,24 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             return str(value)
+         return force_text(value)
+ 
++    def _value_to_string_safe(self, value: Union[str, bytes, int, float, bool]) -> str:
++        value_str = self._value_to_string(value)
++        if re.search(r"[\r\n\x00]", value_str):
++            raise ValueError("Git config values must not contain CR, LF, or NUL")
++        return value_str
++
++    @needs_values
++    @set_dirty_and_flush_changes
++    def set(
++        self,
++        section: str,
++        option: str,
++        value: Union[str, bytes, int, float, bool, None] = None,
++    ) -> None:
++        if value is not None:
++            value = self._value_to_string_safe(value)
++        return super().set(section, option, value)
++
+     @needs_values
+     @set_dirty_and_flush_changes
+     def set_value(self, section: str, option: str, value: Union[str, bytes, int, float, bool]) -> "GitConfigParser":
+@@ -855,9 +873,10 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             a string.
+         :return: This instance
+         """
++        value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self.set(section, option, self._value_to_string(value))
++        self.set(section, option, value_str)
+         return self
+ 
+     @needs_values
+@@ -875,9 +894,10 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             to a string
+         :return: This instance
+         """
++        value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self._sections[section].add(option, self._value_to_string(value))
++        self._sections[section].add(option, value_str)
+         return self
+ 
+     def rename_section(self, section: str, new_name: str) -> "GitConfigParser":
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
new file mode 100644
index 00000000000..fcc3a872752
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
@@ -0,0 +1,30 @@
+From cf273ba3958ad02afa361167a0d0f82e1f4b5f4d Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Wed, 29 Apr 2026 06:39:02 +0800
+Subject: [PATCH] avoid duplicate validation in set_value
+
+CVE: CVE-2026-44244
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3]
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/config.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index ce307110..7988f5d9 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -876,7 +876,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self.set(section, option, value_str)
++        super().set(section, option, value_str)
+         return self
+ 
+     @needs_values
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 99f31791bd5..e728e8bfa4c 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -15,6 +15,8 @@ inherit pypi python_setuptools_build_meta
 SRC_URI += "file://CVE-2026-42284.patch \
             file://CVE-2026-44243_p1.patch \
             file://CVE-2026-44243_p2.patch \
+            file://CVE-2026-44244_p1.patch \
+            file://CVE-2026-44244_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 

