Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E592CCF2C3
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:18 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15558.1792129268989783422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bUMWCbzi;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3471; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2fLcdWS74pwsfsphIT8e0fOEhDMJnuJ+72qyetqukhU=;
  b=bUMWCbziydZ+VZx3Ot+1nEeWzTHQWydGM5fmpaEWWP+skGzmB3amqEfi
   7c7QH32CoNoyi5h9rYPJnFltRAfwhChepw+ISK9AXGTXypk6QUMiF8qye
   CLxoMCMxbDrPrPh7JwylZoRC4vq/p9shMENDPdLsAkm94X9HOzsq3n75j
   OxJPw42lG7j4i283ej9PjtK4qNgFOjMTQ7ln4rXcRqarmMF/6hxulnDU+
   5MvUCspSNT0vm0EkU1m/bYhcomQwXlJyLcUrzNU7HJ+2ag6FmAsPI13R0
   ve4NvWKQRhu6H6JtVk2PUYxQ3ey3vLkd8KuTyJPJklSF2HoUTseGgyHmH
   A==;
X-CSE-ConnectionGUID: XXQ9K7EYQ9Garr43Ih2BKw==
X-CSE-MsgGUID: ur1QX0BLTK29HsAzsQ7PbA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCRt9Fq/4//Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx3gXkzg?=
 =?us-ascii?q?QGCZkMBPwICQAFQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSEfoEFgVwBA?=
 =?us-ascii?q?QKIIwSDHBKBWh6VKUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeghhNP?=
 =?us-ascii?q?SQtAStGlR2QHYIhoQ+EKIwilToaM4QEgVeSQJJUC5h9jgqWT4RpgWg8gUcLB?=
 =?us-ascii?q?zMaCBsVgyIJShkPjjmDa4F/g2XIdicyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:SJEyA67IrhTyKdDjhiZM+gxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mNNXWuBbqrbNzTyLt1xPNjloR5VusPSnYM3GgpkqX01Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eDb0hq8UoLFB3p
 NMRMipRNTGD3ciV3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc6FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEUUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwaoCNIofVHJQ9ckCwu
 3ifxlShKDUmF4bO6SGs4GmV2dfFtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:yeYj3qr3flN0Erem2SfYygUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AsYb5f2hcDPohLwcME/VdIC8tZTJuQk3knVSPDn6?=
 =?us-ascii?q?BWElgUqfJEn6QoolHjJ87?=
X-Talos-MUID: 9a23:69+GNAi7hLkTrkJVxqLFH8MpKd0x2pT2ImQxss9Xm9KtJzdJZA+XpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522003719"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 0DE0018000268
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 719BDCBEF71; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 14/27] python3-git: fix CVE-2026-76221
Date: Thu, 15 Oct 2026 22:40:53 -0700
Message-Id: <20261016054106.210444-15-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247937

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/a495ccd3b547ccd60b2187215823b72a9c0188bf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-76221

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76221.patch   | 44 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
new file mode 100644
index 0000000000..c6ebdebb5e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
@@ -0,0 +1,44 @@
+From 46f9c03ed10d25146293003791476955f8b26a73 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:57:12 +0000
+Subject: [PATCH] Reject syntax-bearing git config option names
+
+Restrict option names to the existing safe character set.
+
+CVE: CVE-2026-76221
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/a495ccd3b547ccd60b2187215823b72a9c0188bf]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+(cherry picked from commit a495ccd3b547ccd60b2187215823b72a9c0188bf)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/git/config.py b/git/config.py
+index 21f6e8aa..30218dba 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -75,6 +75,9 @@ See: https://git-scm.com/docs/git-config#_conditional_includes
+ UNSAFE_CONFIG_CHARS_RE = re.compile(r"[\r\n\x00]")
+ """Characters that cannot be safely written in config names or values."""
+ 
++VALID_CONFIG_OPTION_NAME_RE = re.compile(r"^[A-Za-z0-9_.-]+$")
++"""Pattern for option names that can be written without changing config syntax."""
++
+ 
+ class MetaParserBuilder(abc.ABCMeta):  # noqa: B024
+     """Utility class wrapping base-class methods into decorators that assure read-only
+@@ -876,6 +879,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+     def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
+         if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
+             raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++        if label == "option" and isinstance(name, str) and not VALID_CONFIG_OPTION_NAME_RE.fullmatch(name):
++            raise ValueError("Git config option names may contain only letters, digits, '-', '_', or '.'")
+         if label == "section" and isinstance(name, str):
+             in_quotes = False
+             escaped = False
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index d6b5cdb00e..8579b298e0 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73621.patch \
            file://CVE-2026-73620.patch \
            file://CVE-2026-73619.patch \
+           file://CVE-2026-76221.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


