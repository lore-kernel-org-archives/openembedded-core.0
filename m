Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD18CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:29 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15278.1792129282730516981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gD3w4LYH;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3406; q=dns/txt;
  s=iport01; t=1792129282; x=1793338882;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PnpSoqx2T7OGOtN5kCsStnel32d/7bM9qA+uLRo7CRQ=;
  b=gD3w4LYH5yYnflwLP2ex4llU2RrCHkGVv7PRDTx/a0LTMv5azXBnoeJL
   UbJ6bhluOdmBSIEeOoNeN4jDUUYu64/Fi/6BiheSca68bZp1ckTe+67tK
   rHxVjmMMnouwEYk1p0ZWCjWbQ0ZljaSPbm7n3k7ZdfthfuVM4l5D/qjy0
   VnyGNQjLxFwys+2MQoD27rvtUfP/9e1BC3r28yXeHj4p2cBHglX5QlkgR
   kHHiilUsLDSu5Z2tAsK5HpI09pCNEJ+gLD20pIxhQ9HgODsPfZZSv2HM9
   mSYVLH9Gi8Znu6MRa+36mdNHYdnVOni+eiOPdBubYjIejguaNI/+i/ekl
   A==;
X-CSE-ConnectionGUID: H4TR2ER4Tu6WfGTJzFKflQ==
X-CSE-MsgGUID: F5JxNaocR8edculBhjcPRg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/5L/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYJ0AxG8eIF5M4EBg?=
 =?us-ascii?q?mZDAT8CQ1DZSoFoAQsUAYE4hUCII10YAYR8JxuBSUSEfoEFgVwBAYglBIMcE?=
 =?us-ascii?q?oFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjG?=
 =?us-ascii?q?TZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBG?=
 =?us-ascii?q?zg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoIYTT1RAStGgRqUA?=
 =?us-ascii?q?5AdgiGhD4QojCKVOhozhVulFAuYfY4Klk+EaYFoPIFHCwczGggbFYMiCUoZD?=
 =?us-ascii?q?445g2uBf4NlyHYnMgIJMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:0lVuYq1qebCqHPQjPPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzdTy
 zBKCmnQOa2KNzCmfo9+PYXjoEoO6p/RnNRjGgFr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLB0KB9c1wLpLHD9x+
 9MkCiIjTR6HvrfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsiui1bYqJJoDiqcN9sBu6t
 kTP+G/DUhwWP8Gb4zqH+UqWibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:8o9HdaF63XkhMJWRpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AlwF4NGr7js0y68UddnkzltfmUeB5TkeH4U2MH1L?=
 =?us-ascii?q?mNmhGdJ+HZ3ye/Joxxg=3D=3D?=
X-Talos-MUID: 9a23:56IYqAVi7fW9kl7q/BGxpiFEPcBj2fSjBEsQlb8GucK8DyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528058444"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id E28E918000236
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 43E24CBEF8A; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 06/27] python3-git: fix CVE-2026-69097
Date: Thu, 15 Oct 2026 22:40:45 -0700
Message-Id: <20261016054106.210444-7-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247955

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-69097

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-69097.patch   | 48 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
new file mode 100644
index 0000000000..fc22c65818
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
@@ -0,0 +1,48 @@
+From 00034e1e5eb542542158461c3c542d3bfd3a49f0 Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yurade@cisco.com>
+Date: Fri, 25 Sep 2026 03:55:16 -0700
+Subject: [PATCH] Validate config section delimiters
+
+Reject unsafe unquoted closing brackets and malformed quoted subsections.
+
+CVE: CVE-2026-69097
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI 
+  source archive does not include the test suite and 
+  the python3-git recipe does not run it.
+
+(cherry picked from commit 1ed1b924f4e2d2ee7bab296df77b978af21853f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/git/config.py b/git/config.py
+index 236de3a6..21f6e8aa 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -876,6 +876,22 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+     def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
+         if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
+             raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++        if label == "section" and isinstance(name, str):
++            in_quotes = False
++            escaped = False
++            for index, char in enumerate(name):
++                if escaped:
++                    escaped = False
++                elif in_quotes and char == "\\":
++                    escaped = True
++                elif char == '"':
++                    if not in_quotes and (index == 0 or name[index - 1] not in " \t"):
++                        raise ValueError("Git config quoted subsection names must begin after whitespace")
++                    in_quotes = not in_quotes
++                elif char == "]" and not in_quotes:
++                    raise ValueError("Git config section names must not contain an unquoted closing bracket")
++            if in_quotes:
++                raise ValueError("Git config section names must not contain an unterminated quote")
+ 
+     @needs_values
+     @set_dirty_and_flush_changes
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index fafb9972ef..781ec512cc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67325_p2.patch \
            file://CVE-2026-67324.patch \
            file://CVE-2026-67322.patch \
+           file://CVE-2026-69097.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


