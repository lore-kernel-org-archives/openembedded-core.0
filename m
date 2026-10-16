Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9051BCCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:45 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15907.1792131585117587496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MaQRl4Pk;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3462; q=dns/txt;
  s=iport01; t=1792131585; x=1793341185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=81Lyujc4f8WoJ+juPj3i+8o8oxDZD380ozRoyFpkrow=;
  b=MaQRl4PkUdkcB1YyofC4jIx25Re5HlaT9YAg7ySU+gNX6UyxyxxCrvWZ
   reRtF+cFwFd5mUmVDC77dFFKaHreAef9C11mL3rixqvTbBbxLBeSNrp8f
   fQd0KHO5UEV/y0jf7ZyhoqEqa1BaSQSRE/YegBjczTvaVZbMCEkbYWv2s
   Ld/5AxaEGwLTT7++MRjWPRxOPKaPR4mf41qYnz2RiICtfxDFcskNnmGXE
   oMywyt6SJkICAInRTeqz6uvpwMPCPmWVkhiLW2fyhfC2Mt0l1qgs1Ama5
   qT0/DAsP4ADgqhVnptT7qRFHUb6zy3P5+Y/ZyWZC3NkYyxzZfQujuwcSX
   A==;
X-CSE-ConnectionGUID: 5U6Cok7WSvSegLgnpUXN1w==
X-CSE-MsgGUID: KaVmTxegSOqFa/fNHKyCQQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgBfwdFq/5H/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbxzgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAICG?=
 =?us-ascii?q?IgLBIMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJA?=
 =?us-ascii?q?RMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoFyJjsSP?=
 =?us-ascii?q?VEBK4IDd5JXklChD4QojCKVOhozhASBV5JAklQLmH2OCpZPhGmBaDyBRA4HM?=
 =?us-ascii?q?xoIGxWDIglKGQ+OOYNrhRNRyHYnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:HR/BZq3L29ewlb3SyvbD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzcPm
 GcXXmiPaPjYamb3KNB0atng80gPuJDcm4VhGwJv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUXxoFoobpdlMH1pD+
 tgXLigwXjbamLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+axYIeIJobiqcN9vU+mo
 17W8mvCJQg0PZuR7xqm41mVv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:OFjh96BhOOQ4XmLlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AFCpavWgcFNzLTS37QH72u4mw3jJuL0CD53DTfHC?=
 =?us-ascii?q?DF11kR5maT0etyIU9jJ87?=
X-Talos-MUID: 9a23:Qc4N9wp03ZUhCaHxKG4ezxJrCsJU86mhM2cUv5xBte+kFj1bAg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536485542"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 0A5951800047E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 5C436CBEF6F; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 25/27] python3-git: fix CVE-2026-87818
Date: Thu, 15 Oct 2026 23:19:20 -0700
Message-Id: <20261016061922.843414-26-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247994

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/09f2cf383a992d1af697364569e9f384748c1bd8
[2] https://www.cve.org/CVERecord?id=CVE-2026-87818

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-87818.patch   | 56 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
new file mode 100644
index 0000000000..98d120e2e7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
@@ -0,0 +1,56 @@
+From 03a6fe1a628749fb173d8b7e020ceb01c150c600 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 17 Aug 2026 06:15:12 +0200
+Subject: [PATCH 36/38] fix: require opt-in for no-index diffs
+
+<!-- agent -->
+Treat --no-index as an unsafe diff option because it changes path operands
+from repository pathspecs to arbitrary filesystem paths. This addresses
+GHSA-whh4-5q6c-9v3x without exposing advisory reproduction details.
+
+CVE: CVE-2026-87818
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/09f2cf383a992d1af697364569e9f384748c1bd8]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 09f2cf383a992d1af697364569e9f384748c1bd8)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/diff.py      |    4 ++--
+ git/repo/base.py |    2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/git/diff.py b/git/diff.py
+index 84e7687b..7db268ff 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -136,8 +136,8 @@ class Diffable:
+             to be read and diffed.
+ 
+         :param allow_unsafe_options:
+-            If ``True``, allow options such as ``--output`` and ``-O`` that can write to
+-            or read from arbitrary filesystem paths.
++            If ``True``, allow options such as ``--output``, ``--no-index``, and ``-O``
++            that can write to or read from arbitrary filesystem paths.
+ 
+         :param kwargs:
+             Additional arguments passed to git-diff, such as ``R=True`` to swap both
+diff --git a/git/repo/base.py b/git/repo/base.py
+index c8e8f6ed..e0d12439 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -195,6 +195,8 @@ class Repo:
+     ]
+ 
+     unsafe_git_diff_options = unsafe_git_revision_options + [
++        # Treats path operands as arbitrary filesystem paths.
++        "--no-index",
+         # Reads caller-controlled order patterns from an arbitrary file.
+         "-O",
+         "--orderfile",
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index decd1ccc00..71275b0861 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -48,6 +48,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-78676.patch \
             file://CVE-2026-78675.patch \
             file://CVE-2026-87817.patch \
+            file://CVE-2026-87818.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


