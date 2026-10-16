Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19056CCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15277.1792129269763475531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CGZW87mF;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3479; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=T02Flo79DSG+WAe9clUXrdabHXYSOUPZMblhI4OFE0w=;
  b=CGZW87mFKF4RNvy+++aSKghJHRGbZD9q9T1a6vurCDQV+QyxJTcpDY1Q
   9MebH+Z7Y/09CCAbvQ7QLu/zTcP71iW2eAyLu0q6l1qSCkT/q3EnuU5Bk
   mW+KaDM9lP9DR+pjogbwQJmJMhKGZG0NsHCiGY7p5ZLFmgZEJQdZKFkgh
   OcZfKt4Vw8/grWZvIssIA6c6jPQeJf8m3glTjpmxeS6GnUmYp7Vb8A7aT
   QD0JKx+zdQfHIekjjH/wVmIbpDRk7ohU5whQks+e/AAy83uVx85tmTkL5
   QeoZHbZtZ6qtdL7PLB4TgxyxNVVoB5n8aSNZ60zUcSL/rALlfRimjcHh7
   Q==;
X-CSE-ConnectionGUID: TYm0/BoiRt2YC3FF8Mmy+A==
X-CSE-MsgGUID: dmKyzfKyQeqfYTz6XjQUIw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/5L/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx4gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAEBi?=
 =?us-ascii?q?CUEgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?SCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBE?=
 =?us-ascii?q?xowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegXImOxI9U?=
 =?us-ascii?q?QErggN3kleSUKEPhCiMIpU6GjOEBIFXkkCSVAuYfY4Klk+EaYFoPIEoHAMLB?=
 =?us-ascii?q?zMaCBsVgyIJShkPjjmDa4F/g2XIdicyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:j5zJc6NaOYdiqI/vrR3ylsFynXyQoLVcMsEvi/4bfWQNrUpw3mFUx
 zAXWzjQOa7ZMDD8f9l/bYu/9kIA7JLTztI2HnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68lfCRlxF4oZwPotMEoV2
 9JIDTUcLTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVcvj+C8boeLEjCMbclQvVeKq
 EHXxmngDCAmJoKvywO4023504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvuS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:VwB0Ma5k6EZDV0T85gPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3ADWdPSWqfk7UYdw+lxL344HnmUfwUdyWa5nDRGVP?=
 =?us-ascii?q?iOE0yZpPFbFqBu4oxxg=3D=3D?=
X-Talos-MUID: 9a23:/4VxQQnv9TYHl5I3CGITdnpuMeR58aqNGXkAiJs3h9vaBS5JBhaC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536709656"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 62D4518000236
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B3B4FCC8C92; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 25/27] python3-git: fix CVE-2026-87818
Date: Thu, 15 Oct 2026 22:41:04 -0700
Message-Id: <20261016054106.210444-26-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247952

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/09f2cf383a992d1af697364569e9f384748c1bd8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-87818

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-87818.patch   | 55 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
new file mode 100644
index 0000000000..47cea66a81
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
@@ -0,0 +1,55 @@
+From 6b83f54db287f190ae29c89b36ba6aba01f7c8d6 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 17 Aug 2026 06:15:12 +0200
+Subject: [PATCH] fix: require opt-in for no-index diffs
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
+- Omitted test/test_diff.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does 
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 09f2cf383a992d1af697364569e9f384748c1bd8)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/diff.py      | 4 ++--
+ git/repo/base.py | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/git/diff.py b/git/diff.py
+index 032dfb25..08bd4410 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -216,8 +216,8 @@ class Diffable:
+             to be read and diffed.
+ 
+         :param allow_unsafe_options:
+-            If ``True``, allow options such as ``--output`` and ``-O`` that can write to
+-            or read from arbitrary filesystem paths.
++            If ``True``, allow options such as ``--output``, ``--no-index``, and ``-O``
++            that can write to or read from arbitrary filesystem paths.
+ 
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-diff(1)`, such as ``R=True`` to
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 7543e3cc..f2dca3c7 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -203,6 +203,8 @@ class Repo:
+     ]
+ 
+     unsafe_git_diff_options = unsafe_git_revision_options + [
++        # Treats path operands as arbitrary filesystem paths.
++        "--no-index",
+         # Reads caller-controlled order patterns from an arbitrary file.
+         "-O",
+         "--orderfile",
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 29c73287c2..9e12fb4f1e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -48,6 +48,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78676.patch \
            file://CVE-2026-78675.patch \
            file://CVE-2026-87817.patch \
+           file://CVE-2026-87818.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


