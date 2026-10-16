Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7D5CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:35 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15899.1792131564223008482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aVnYgVbN;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6410; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9M/Tn0T9bxSegSvsXUamxtRqwM15xmbkQPDZgPnVipA=;
  b=aVnYgVbN7aEzKZbJ4e8bT5cA6uJefqgESAFrgqsrVnB3XWcV74LGZasc
   j9vfHTH+CrjIQeT8TcMORyWhcitrjwDpyqjnS5DnJVJZtNIrV/Aw9INu+
   BA7SCV3anZGWjeLBNrNxQoxZ09xfDZtEgI+13pzQESEmU4tFIMTAd8n5O
   Ms8uGbzNwhiudUqP/lzOXAlXOaEoJk6vTs7Cfkxjup8u7KEI0OY9U7rg1
   +MPSlZ5Edlwrohs0a/dXCh+bimoEtFMc5AfcO5IsahGhbo4rQZJtFD9ag
   RXZu2Hg1W2GOtdfFRBCXk1KiY+0MppRYDjNxh0fcZrdOoQ8XgbCyycfYn
   Q==;
X-CSE-ConnectionGUID: HcGEjmE7R1CouHm8u1tgZw==
X-CSE-MsgGUID: 7gjcPKjWQy6Hvc/QBRsh8g==
X-IPAS-Result: =?us-ascii?q?A0BJAgBrwNFq/5H/Ja1aH4I6gld1YENJlCmCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8doF5M?=
 =?us-ascii?q?4EBgmZDAT8CAkABUNhLEG+BaAELFAGBOIVAiCNdGAFEhDgnG4FJRIR+gQWBX?=
 =?us-ascii?q?AICGIENhn4EgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?iIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeg?=
 =?us-ascii?q?XImTWEtASsXL4I0kmkBOI9kgiGBNZ9ahCiMIpU6GjOEBIFXkkCSVAuYfY4Kl?=
 =?us-ascii?q?k+EaYFoPIFZMxoIGxWDIglKGQ+OKw4Lg2CFE1HIdicyAgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?IRhix8CJgeBTwEB?=
IronPort-Data: A9a23:MMU8u6o+osIT1/M+FSE5fHeeshZeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmCM/6PN2v1fdgiOo6080gAuJHSm9Q3HVA+/yg9Fywb+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sZ8LkxM8
 NFHEmkmaQ2jgrKrma60ePY506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUHJQOzhrJz
 o7A1zv2ABoiF96g8Cvb0mynwdblpzj7CI1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288Vte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:ya+K66Gcgk5kyGkUpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:v3rMOGNopegZUu5DeCJI2UwRN58fK1ba0VfVc1LhFWlbV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A2wOLow4po1uePDes8PAFcUi5xow37KalMGMPrqw?=
 =?us-ascii?q?X5emaPmtJEQ2GjGS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536193849"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 2C9911800047E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id C7EA1CC12A7; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 01/27] python3-git: fix CVE-2026-67326
Date: Thu, 15 Oct 2026 23:18:56 -0700
Message-Id: <20261016061922.843414-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247970

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06
[2] https://www.cve.org/CVERecord?id=CVE-2026-67326

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67326.patch   | 108 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   3 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
new file mode 100644
index 0000000000..336460817a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
@@ -0,0 +1,108 @@
+From 8d534d0df8f00033c02e281291e39ed3b26f7690 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Tue, 5 May 2026 21:34:42 +0800
+Subject: [PATCH 08/38] Validate config key section names before writing
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
+- Omit upstream regression test changes because the Scarthgap PyPI source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 54538428f79b0c91ba52cda5229856a6edf7ac06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py |   17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index 7988f5d9..1df1415f 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -71,6 +71,9 @@ CONDITIONAL_INCLUDE_REGEXP = re.compile(r"(?<=includeIf )\"(gitdir|gitdir/i|onbr
+ See: https://git-scm.com/docs/git-config#_conditional_includes
+ """
+ 
++UNSAFE_CONFIG_CHARS_RE = re.compile(r"[\r\n\x00]")
++"""Characters that cannot be safely written in config names or values."""
++
+ 
+ class MetaParserBuilder(abc.ABCMeta):  # noqa: B024
+     """Utility class wrapping base-class methods into decorators that assure read-only properties."""
+@@ -741,6 +744,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+ 
+     def add_section(self, section: str) -> None:
+         """Assures added options will stay in order"""
++        self._assure_config_name_safe(section, "section")
+         return super().add_section(section)
+ 
+     @property
+@@ -843,10 +847,14 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
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
+@@ -855,6 +863,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         option: str,
+         value: Union[str, bytes, int, float, bool, None] = None,
+     ) -> None:
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         if value is not None:
+             value = self._value_to_string_safe(value)
+         return super().set(section, option, value)
+@@ -873,6 +883,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             a string.
+         :return: This instance
+         """
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+@@ -894,6 +906,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             to a string
+         :return: This instance
+         """
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+@@ -909,6 +923,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         """
+         if not self.has_section(section):
+             raise ValueError("Source section '%s' doesn't exist" % section)
++        self._assure_config_name_safe(new_name, "section")
+         if self.has_section(new_name):
+             raise ValueError("Destination section '%s' already exists" % new_name)
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 38fbd8a078..1ba34dbf52 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -14,13 +14,14 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://CVE-2026-42284.patch \
+SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-44243_p1.patch \
             file://CVE-2026-44243_p2.patch \
             file://CVE-2026-44244_p1.patch \
             file://CVE-2026-44244_p2.patch \
             file://CVE-2026-42215_p1.patch \
             file://CVE-2026-42215_p2.patch \
+            file://CVE-2026-67326.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


