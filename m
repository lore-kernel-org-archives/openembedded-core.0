Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9989CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:34:06 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15213.1792128838475105018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WJjveHF6;
 spf=pass (domain: mvista.com, ip: 74.125.82.171, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35d7fa491deso669390eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 22:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792128838; x=1792733638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWLazEIJtdUWn7fjIycwbCQ3+QWkFhxm4MmiqcjV0yw=;
        b=WJjveHF6WjpnrGxkNfTTIwosyU7uZcnOfZ5faUaMYU132UTcbJO6Fbmuk7UOTtNIT9
         aijiy6JV2ji7xotDMJwBstFKDoQw0PgyjW0UfuEZGp7s4WfqoM1T102qSIW8jiaEGPwG
         WJ/8JAO0Miy26PXzgFejeNUNJAje/C5RazbvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128838; x=1792733638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWLazEIJtdUWn7fjIycwbCQ3+QWkFhxm4MmiqcjV0yw=;
        b=blMt9e5lhEg+N7QSsbug0IrNo9wsXSLUkzICthcA7QWd3uTV2xUh74oftgnUR9XmN+
         ydJWl31y0YtvZvDfdKpea/0sB58J7kqF7vDefy5tqoPPLN8yvMqLu32Qh+qdvQS7rhfH
         rht4B5YzOpfyD+5cXk/Jee0npv1Ws9t2lTDDXQuo65oCx3We+KQdJCyV5jfq0r7hV4jl
         0YSIZccSUkT0uLfDmm+PyZai0qbQtTiEuLiv0heiRr8Yba4C9V0NZ18BNeEEe1KEDEnx
         ZJU38/lkOg4sShFo57Lkp+PrTcDPgq7+El55J11YIzcKPFp3dhkR6v1upaNQoMUpruVR
         EXfA==
X-Gm-Message-State: AFq9FYIuLOLHN24P5sbiQTV/2YhW1xJzaB8YbUefG0tYi3VTxoCJUbpa
	me8tt+sKOKJZ0NokMbjoF3pvlVIY2gEJ56SpnybOaL+AITkIg4iEEX8KlinvnjO4nxAT1NGjgsY
	KiVfmT8I=
X-Gm-Gg: AYBFou0SR0NoYOkmeAz7uBLxroq3aGbt1vT+7xCeL0Yuhp5rYGAG8QrBNu0XXK3n6pG
	8pe09DDomzN944CfYmd81FHQTe/wo2H/9NdoD0oVhrjVQNNB9DBxbxuOLoXTli3GfUErLySqhrS
	Pqhr3VJlnmU0L+eus0wjZuDxNsk6mkPyeK7ZPWoI9A6Wo+piz0+IknRE8SugfJsSTvWofjuzk+m
	Yd3F1n7FGgYr3yYxfXYMVLE66g559JpDoIQHMV7uAc/CA5HHEd/mjxOm6wr63ZL5oNRcGVyOr7u
	FzIrt/DAhUOItRCC3JFXacfjl6ADaxy2FBLPSgVn7o/eQ13zZmDcNSFbIjrRWpy7O2uo+rki+pO
	paQq0u/nPfdP7wTIFYLy+Y/Wyw+fIGuZMO/098lV3FjMIR+INqg9iL5Py7RgEDOYFtX/O8mASJT
	r6GjBJNR2eibV40NYCgrH5gvit54RF7LQK8wu8mLUI0d9IWmO8ZttLK6OuHvDLVUQFaFW8CK2Q7
	80j8Y2BrGw=
X-Received: by 2002:a05:693c:8359:b0:35a:dbe8:ccb5 with SMTP id 5a478bee46e88-3602bc2bcabmr2558466eec.13.1792128836468;
        Thu, 15 Oct 2026 22:33:56 -0700 (PDT)
Received: from MVIN00352.mvista.com ([106.200.31.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm3199525eec.19.2026.10.15.22.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:33:55 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] python3-git: Fix CVE-2026-67326
Date: Fri, 16 Oct 2026 11:03:44 +0530
Message-ID: <20261016053344.103696-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247926

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06
[2] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-mv93-w799-cj2w
[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-67326

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/python3-git/CVE-2026-67326.patch   | 109 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
new file mode 100644
index 0000000000..24d65e2448
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
@@ -0,0 +1,109 @@
+From 54538428f79b0c91ba52cda5229856a6edf7ac06 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Tue, 5 May 2026 21:34:42 +0800
+Subject: [PATCH] Validate config key section names before writing
+
+GitConfigParser already rejected CR, LF, and NUL in config values before
+writing, but section and option names could still reach configparser. Because
+GitPython writes section headers itself, a newline-bearing section name could
+split the output into additional headers.
+
+Reject CR, LF, and NUL in section and option names on write paths that create
+or set config keys: add_section(), set(), set_value(), add_value(), and
+rename_section() destinations. This matches Git config key validation behavior;
+Git source commit 94f057755b7941b321fd11fec1b2e3ca5313a4e0 reports invalid keys
+containing newlines from config.c, and local git 2.50.1 rejects newline-bearing
+config keys.
+
+Add a regression test covering unsafe section and option names while preserving
+safe writes.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+
+Backport Changes:
+- Omitted test/test_config.py because the PyPI 3.1.43 source used
+  by the recipe does not ship the upstream test tree.
+
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06]
+CVE: CVE-2026-67326
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ git/config.py | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index 1595d51..236de3a 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -72,6 +72,9 @@ CONDITIONAL_INCLUDE_REGEXP = re.compile(r"(?<=includeIf )\"(gitdir|gitdir/i|onbr
+ See: https://git-scm.com/docs/git-config#_conditional_includes
+ """
+ 
++UNSAFE_CONFIG_CHARS_RE = re.compile(r"[\r\n\x00]")
++"""Characters that cannot be safely written in config names or values."""
++
+ 
+ class MetaParserBuilder(abc.ABCMeta):  # noqa: B024
+     """Utility class wrapping base-class methods into decorators that assure read-only
+@@ -759,6 +762,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+ 
+     def add_section(self, section: str) -> None:
+         """Assures added options will stay in order."""
++        self._assure_config_name_safe(section, "section")
+         return super().add_section(section)
+ 
+     @property
+@@ -865,10 +869,14 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+ 
+     def _value_to_string_safe(self, value: Union[str, bytes, int, float, bool]) -> str:
+         value_str = self._value_to_string(value)
+-        if re.search(r"[\r\n\x00]", value_str):
++        if UNSAFE_CONFIG_CHARS_RE.search(value_str):
+             raise ValueError("Git config values must not contain CR, LF, or NUL")
+         return value_str
+ 
++    def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
++        if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
++            raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++
+     @needs_values
+     @set_dirty_and_flush_changes
+     def set(
+@@ -877,6 +885,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         option: str,
+         value: Union[str, bytes, int, float, bool, None] = None,
+     ) -> None:
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         if value is not None:
+             value = self._value_to_string_safe(value)
+         return super().set(section, option, value)
+@@ -901,6 +911,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         :return:
+             This instance
+         """
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+@@ -929,6 +941,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         :return:
+             This instance
+         """
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+@@ -949,6 +963,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         """
+         if not self.has_section(section):
+             raise ValueError("Source section '%s' doesn't exist" % section)
++        self._assure_config_name_safe(new_name, "section")
+         if self.has_section(new_name):
+             raise ValueError("Destination section '%s' already exists" % new_name)
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index ebb5e4b442..474206d4ed 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-44243_p2.patch \
            file://CVE-2026-44244_p1.patch \
            file://CVE-2026-44244_p2.patch \
+           file://CVE-2026-67326.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.43.0


