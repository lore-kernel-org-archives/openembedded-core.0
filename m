Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510AFC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:08:20 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.658.1787116092682779983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WGUu+jLr;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7218; q=dns/txt;
  s=iport01; t=1787116092; x=1788325692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s57LtJcrPGjTyzZxiu2YUvLn34hypo4plgBmNFO/z/4=;
  b=WGUu+jLripLNkq7gjImhQhgp8se8WoWl5WkqCYN0iYS5WccIHUpALL8V
   ELgQeyQFxoEjcN6XF9tBjSUp3FXPRBTZKr2Rjk/Hwq+S23s99nN7mznXN
   qNY8n/3OfIrXYdvngXkPuIe5EfoLkOUZ/oBEAUza5xr3Ul1iOUMarzWAO
   aQe1GHWJtBW1U2XHNyx3glG4ae4dRh+H3b32daf8VBqo/HgiKYQ4D7BLD
   w9J/uHtXKw9ONSs/ukEa6d31cDgBKtSO5I54Ynn3p/Yd++4X18LMsxwAI
   ArOPJ/l+m/BqfuwVj2aRIvmdmNZ2dZfvbMQCSA6ERmSJMHXN94CaIibeJ
   w==;
X-CSE-ConnectionGUID: T/bSBI+aS7aGaQ04bEpnIg==
X-CSE-MsgGUID: NjyXoe3bQcOAAZO2e3xd7Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgAdOYVq/44QJK1aglmCV3ReQ0kDlkcDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgjoDNwMRwxeBeTOBA?=
 =?us-ascii?q?YMoAYFU2EsQglUBCxQBBYEzhT+IIl0YAYR8JxsbgXKBFYNpgQWBXAKBJ4Z+B?=
 =?us-ascii?q?IIiehKBWm6Qd0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdg?=
 =?us-ascii?q?SiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRREKCwsYDUgRLDcUGQQ+b?=
 =?us-ascii?q?geOSSCCNRIOgQABCiGCLJMRJgGSPqEPCiiDdowhlToaM4QEgVeSQJJRC5h9j?=
 =?us-ascii?q?gqWUIRpgWg8gVlwFYMiCUoZD44qDguDYIVkxlUnMgIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?AACJgeBTwEB?=
IronPort-Data: A9a23:v9CReKuxP71jZpgWi0vMvlXaRefnVABfMUV32f8akzHdYApBsoF/q
 tZmKW+BOKvfZzameoh3aovj9ktT7JPUn9RnTwtvrisyRCxAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwxqF9Oktvt
 vUjdzkiZynb2+ib2LSaRbw57igjBJGD0II3s3Vky3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZg1/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9KoXQHpkNxhjIz
 o7A10L7EyEdOYeV8DGi21ueobXCxjP3B7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:rODbNqmXyLGuVUEsmUrhh00l7AHpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:Sx7VEG1p4OqTD4fd/pLYYLxfJocvSVf8j37rfEaXAF8xFLe4UVmx9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3ABCqBAQwO+2C8+H/2sguuYzUMv26aqIKsGXAKnM4?=
 =?us-ascii?q?MgsKjHAVCHG2Q1yS7HbZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="812340068"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:08:11 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 979D818000239;
	Wed, 19 Aug 2026 05:08:11 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id F214CCD02BA; Tue, 18 Aug 2026 22:08:10 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/4] python3-git: fix CVE-2026-44244
Date: Tue, 18 Aug 2026 22:08:08 -0700
Message-Id: <20260819050808.3986732-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819050808.3986732-1-dkelaiya@cisco.com>
References: <20260819050808.3986732-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243700

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using all the
backported commits shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2
[2] https://github.com/gitpython-developers/GitPython/commit/8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-v87r-6q3f-2j67

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-git/CVE-2026-44244_p1.patch       | 102 ++++++++++++++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  28 +++++
 .../python/python3-git_3.1.43.bb              |   2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
new file mode 100644
index 0000000000..66ba5e9697
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
index 0000000000..43aea2fd56
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
index bd2b113489..d572857747 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -18,6 +18,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-42215_p3.patch \
            file://CVE-2026-44243_p1.patch \
            file://CVE-2026-44243_p2.patch \
+           file://CVE-2026-44244_p1.patch \
+           file://CVE-2026-44244_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6


