Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E012BC79FA2
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2580.1788641115699713000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OaPDzCWh;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1537211f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641114; x=1789245914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V4F6lnvIt0soc68nFN+zdVKMBcP16kCA9MDhoYu4c24=;
        b=OaPDzCWhGJCuJWLvf46CpvZMmGeXZUUI80Ybu4duLRolpwszzxbthHtgEnJJCoCosG
         RFNm4XujC05HpOwI2b1TUp8FgeGZh/erDlk5clMLtTo12+S87u1gHXyir5/5okBvpYb1
         mPXAkS1uoc4p8d/aftgzY9l4hXhR+PXeL7bjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641114; x=1789245914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V4F6lnvIt0soc68nFN+zdVKMBcP16kCA9MDhoYu4c24=;
        b=qN3ODH4Nk/KoYI1yOq9YUqfI7kxe6wxDLD8B+1GehzMuSfSKn/4I/VtkN4yhXyXWGk
         ZHrtkCAJkNSPd7BhnjIxt5LNxW55maUdM1tfMpJ0bE3UUbQgCO7IDzdlvUdoQJCqss+P
         PhdSehWMEvzrR0lo2wYq2OD6uMMcj5HWp8AdvT6Y226flZ76KiHKHh8cXWWyLpE7LqXV
         ZsiioenVntjBq71UTF7kfXBiAOl4FOpyOi3gG/S1R4MQAWgntRc5l8OLwh7IVtoE7Dvp
         0OzOAMMhubwU/KccpnYmLbnYE+WEAUQiVvP+2jHrV7+ua5NRqarh4Lt9Q6xIRfiOmDcJ
         JDCA==
X-Gm-Message-State: AFuF++n3ey65eL9fmIDwfuJuughqtcRjJx3gz95a31RW7Av1zJnmWq4e
	+o0by16JgJBUdQXzq9tqE8Yoe6sWWyX3fCJWxJQWPENik5llQt7EAJpyNF0Gs1vj9ZAV2/N15sU
	lopMrZk4=
X-Gm-Gg: AYBFou0ZPxYPxxiIlmCPQXyt0/KkFA579FKkk2rE/vbYkR17cbUY6CNx6bI3YofewVP
	aGunocoK6lyN648YZN/7RCn8B7Hw4xH0cwyUWr2hmxAFT59kglNhFL52QtL4fl4NpPRe5U6YfQK
	NJLUwmh1C4/FVYWCVPsVntvarwA6HGvdPEVJHUhXFdQzQw3pJqxktfM58+AmAeY+T3atzZxYr7p
	MjVQP5Bn6H5+58MReNsH8bp/thUIVtbHykRGuHEFo6+m15lYoBptuMQxtxIkjEz04/VnWNZdFX2
	P8vi9lf/rFuLvnHUjbBglbpkxOw3JLcmNEueDgKJH3Ncby09SRR6atRaURi6tLIjhBbNpFXHhOm
	b2KX0tbreyYPWwXv1h014Njl7nTYPfASfPZljYbmVzTjIF5A1VyonIgApV3EeIR3Ei3ejb2C7uG
	wyBxen9sHoOD6HDQzeThVY6urOM/RcMDW/NAZaryL7XMvlxGrxozkO6409A4u8tkE7FJHq+rCA0
	M/WZqVny0MPYS7vGAQhAUX+OzFswt4cMuy99MA4t/bEwE9Fek+NHd7+7sYHerEQaw==
X-Received: by 2002:a05:6000:2f87:b0:485:8a46:b3c1 with SMTP id ffacd0b85a97d-4858a46b520mr13415023f8f.41.1788641113867;
        Sat, 05 Sep 2026 13:45:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/40] python3-git: fix CVE-2026-44244
Date: Sat,  5 Sep 2026 22:44:07 +0200
Message-ID: <4037ac7b4fd7add97ccf76e87b361190cb89503e.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245158

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using all the
backported commits shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2
[2] https://github.com/gitpython-developers/GitPython/commit/8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-v87r-6q3f-2j67

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-git/CVE-2026-44244_p1.patch       | 102 ++++++++++++++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  28 +++++
 .../python/python3-git_3.1.43.bb              |   2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
new file mode 100644
index 00000000000..66ba5e96976
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
@@ -0,0 +1,102 @@
+From 4ac5a1c848582f606655d03bfbc1243fe1754dc8 Mon Sep 17 00:00:00 2001
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
+- Omitted test/test_config.py because the PyPI 3.1.43 source used
+  by the recipe does not ship the upstream test tree.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/config.py | 24 ++++++++++++++++++++++--
+ 1 file changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/git/config.py b/git/config.py
+index 3ce9b123..d45cc31b 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -863,6 +863,24 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
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
+@@ -883,9 +901,10 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         :return:
+             This instance
+         """
++        value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self.set(section, option, self._value_to_string(value))
++        self.set(section, option, value_str)
+         return self
+ 
+     @needs_values
+@@ -910,9 +929,10 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         :return:
+             This instance
+         """
++        value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self._sections[section].add(option, self._value_to_string(value))
++        self._sections[section].add(option, value_str)
+         return self
+ 
+     def rename_section(self, section: str, new_name: str) -> "GitConfigParser":
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
new file mode 100644
index 00000000000..43aea2fd565
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
@@ -0,0 +1,28 @@
+From cfa5a26453544e93be3689101e710b6b07a6e2b0 Mon Sep 17 00:00:00 2001
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
+index d45cc31b..1595d51f 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -904,7 +904,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self.set(section, option, value_str)
++        super().set(section, option, value_str)
+         return self
+ 
+     @needs_values
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index ef4f7fa18ca..7534531fa37 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -17,6 +17,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-42215_p2.patch \
            file://CVE-2026-44243_p1.patch \
            file://CVE-2026-44243_p2.patch \
+           file://CVE-2026-44244_p1.patch \
+           file://CVE-2026-44244_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 

