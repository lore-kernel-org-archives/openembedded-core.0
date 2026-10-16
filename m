Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E2BCCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:45 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15906.1792131584148701298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kw4kNbsQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3611; q=dns/txt;
  s=iport01; t=1792131584; x=1793341184;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UGGMSQXyJEskXu79yaVQdsgYqOI7iIr732pI35kJPjg=;
  b=kw4kNbsQUdmudtMC2oJDzcGtsUXgohjd1dlDbOM4AaA/H7ZVGdDFgKki
   m+TimcCgA0kW0xvk9RocvF8xvM17eifj2vyFIwlDCsooxflpvtQAUE0vb
   BFKpiA9d5/pEHQ/2suMkowVDw5sdZtvGmzQgm7oqDcMVb4My6M4CUQQUm
   ujtrZorVZdOCsKBAK1bpExHh2yujZ+KyBraX19nS6GNAdgKrAs2WfY3/k
   h8jyqB2eVlB375GaC6yQdxmyLzuu2uhU0SMr+sg+eFKKJbIQkUaZJWVF2
   Zj1Fbsr9SYqWfkjTv0Vv3GAutyBzyGneTEqNdr/8vrA/5w10i+VxwkjNI
   Q==;
X-CSE-ConnectionGUID: E+fRQA+GTjaZrY3FYXoXEw==
X-CSE-MsgGUID: kNQCnlHtTQOdxsnIIynv8Q==
X-IPAS-Result: =?us-ascii?q?A0AaAABfwdFq/5D/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKHN4IhA54cgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAzIBGAE9H?=
 =?us-ascii?q?AMBAi8rIwgZgwIBgjoDNwMRvHOCLIEBgykBPwJDUNhLEG+BaAELFAGBOAGFP?=
 =?us-ascii?q?4gjXRgBhHwnG4FJRIEVg2mBBYFcAgIYiAsEgxwSgVqBA5RESIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJg?=
 =?us-ascii?q?gcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIA?=
 =?us-ascii?q?g0JBykYDUgRLDcVGQQ+bgeSFB6BciYtDhI9TwIBK6ghoQ+EKIwilToaM4Vbp?=
 =?us-ascii?q?RQLmH2OCpZPhGmBaDyBWTMaCBsVgyIJShkPjjmDa4UTUch2JzICCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokX4BAQ?=
IronPort-Data: A9a23:xiTS16ov9Dg7zOY7sdery2hlwTxeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmAOa6PZWb0KNh/a47n90JXv5eHzoJnHlRvqysxRi0V+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ss0D1t33
 L83FDIEXAqy3MyH8LWLZ/Y506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUGZUIwx3Hz
 o7A12ffOzocMPyD9QOi/mK3gM7ujCXlCLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn28/Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:2N4uuK6xyb3ZJXvj7APXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AbJx9cmraa0WIwrgiYUuj28fmUe1mfEfk5TT/H02?=
 =?us-ascii?q?xO3xYE5OkeVig1bwxxg=3D=3D?=
X-Talos-MUID: 9a23:+/l/6Qoub3bB3C1qGzoezzJEDexu54SyNHkqnYUdveilJCpuaw7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536485537"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A59D8180003F2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 187A9CC1261; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 13/27] python3-git: fix CVE-2026-73619
Date: Thu, 15 Oct 2026 23:19:08 -0700
Message-Id: <20261016061922.843414-14-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247992

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca
[2] https://www.cve.org/CVERecord?id=CVE-2026-73619

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73619.patch   | 59 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch
new file mode 100644
index 0000000000..9ef25fd959
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch
@@ -0,0 +1,59 @@
+From 03c9b0fc2530fb81d15bf3f41f39da7e2308289c Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 26 Jul 2026 06:00:59 +0200
+Subject: [PATCH 21/38] Block unsafe archive additions and bundle URI
+
+GHSA-539m-9xh6-q6rr reports incomplete unsafe option lists for archive inputs
+and clone bundle URLs. Caller-controlled archive additions can expose or inject
+filesystem content, while clone --bundle-uri can dereference an additional
+caller-controlled URL.
+
+Extend the existing archive denylist with --add-file and --add-virtual-file,
+and the clone denylist with --bundle-uri. Regression coverage exercises archive
+kwargs plus both clone multi-option and keyword paths.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18.
+Documentation/git-archive.adoc defines --add-file/--add-virtual-file, and
+Documentation/git-clone.adoc defines --bundle-uri as fetching from the supplied
+URI.
+
+CVE: CVE-2026-73619
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 0d4fae8a..7142f220 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -142,6 +142,8 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
++        # Fetches from a caller-controlled URL:
++        "--bundle-uri",
+     ]
+     """Options to ``git clone`` that allow arbitrary commands to be executed.
+ 
+@@ -163,6 +165,10 @@ class Repo:
+         # Writes output to a caller-controlled filesystem path.
+         "--output",
+         "-o",
++        # Reads from a caller-controlled filesystem path:
++        "--add-file",
++        # Injects a caller-controlled path and contents:
++        "--add-virtual-file",
+     ]
+ 
+     unsafe_git_revision_options = [
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 3f04fe8fdb..c2fbc65db2 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -34,6 +34,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73622.patch \
             file://CVE-2026-73621.patch \
             file://CVE-2026-73620.patch \
+            file://CVE-2026-73619.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


