Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220AFCCF2CB
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15274.1792129268537946542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LxpkRP3F;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6129; q=dns/txt;
  s=iport01; t=1792129268; x=1793338868;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BiRZo0sEvs4aN0Z9i30YT/i5JUqYhDeGtmuQubDdluc=;
  b=LxpkRP3FXsAFicxV5oj7CXilVbJXdV2IsWU73cNCkYPQuxlRCNUBngTv
   /3Flvu0L3aNuAa7HdHxT7BxxBXi7C2gYtuSAFw0VdLeP/WLaUkQhPlPTB
   1Vg38ZB7XoFptQpO4XM2JKwdlpi9zqfGfUXMZn6VfSfnGJ+wVZ2xMJlgI
   NnHcygywu2UyGuOZYbS8DWQudJDQvQakU6FEmJ86ZBKb8v2izz4OB9Bty
   XODDyrNd0KHBom6Ucz/zBE7nDE8yuIg2OMSsme7dKd2W5kFreVwce9zyA
   QGqAzmkHmuIpiSxk/8f2rwvb/U36wyNffUzo7YckhcjMPV3ggiGgx/hug
   g==;
X-CSE-ConnectionGUID: 6aEyQRKBQLegt1WFmVeV9g==
X-CSE-MsgGUID: eh6OCSX/RlSbEy0WWSzGCw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAeuNFq/5X/Ja1aH4I6gld1YENJlCmCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8eIF5M?=
 =?us-ascii?q?4EBgmZDAT8CAkABUNhLEG+BaAELFAGBOIVAiCNdGAFEhDgnG4FJRIR+gQWBX?=
 =?us-ascii?q?AEBAoElhn4EgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?iIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeg?=
 =?us-ascii?q?XImTT0kLQErFy+CNJJpATiPZIIhgTWfWoQojCKVOhozhASBV5JAklQLmH2OC?=
 =?us-ascii?q?pZPhGmBaDyBRwsHMxoIGxWDIglKGQ+OKw4Lg2CBf4NlyHYnMgIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiEYYsfAiYHgU8BAQ?=
IronPort-Data: A9a23:u9sasaldQ9z8p0i/ehrTjjzo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXDjQPPqCMWfxcoh3O4SypkwGv5XTzdUyHQY+rS9mF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdMR1/dOO0Jkz
 NgVJyxUUT6Gue+Ikb3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYGLJoPSHpUK9qqej
 m/GoUPSOSFdDtikwxeUqk2Tvf3gtjyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:C1H5NqxG8WJMKZW7Wt+UKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AaRvQfGoLAlb5TyAFWzawrTvmUZ4sX2zk9lT6Gmu?=
 =?us-ascii?q?1Bnowd5OQd1Kuqawxxg=3D=3D?=
X-Talos-MUID: 9a23:41/XHAlKQd0JE3Xe5wrWdnpvNJlPyJ+eT3oJqp8rqpG7ChdiFByC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536470387"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:07 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 82B0A180001CB
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 25A06CBF201; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 01/27] python3-git: fix CVE-2026-67326
Date: Thu, 15 Oct 2026 22:40:40 -0700
Message-Id: <20261016054106.210444-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247932

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-67326

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67326.patch   | 108 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
new file mode 100644
index 0000000000..2689d1cc74
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
@@ -0,0 +1,108 @@
+From 89d7d33485f67d5f25777079797ae6d1a4538f86 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-67326
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 54538428f79b0c91ba52cda5229856a6edf7ac06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index 1595d51f..236de3a6 100644
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
2.44.4


