Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5EFC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:38:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.41091.1681119479889634800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RlBKtFqH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119478; i=@fujitsu.com;
	bh=YuLBNeBmBqCtqffR7x2ll89HwQRAXIRfReEMUK80PNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RlBKtFqHu2kdC9MyPPjMXEfFo+8NpXcaRWPHcdCBJ2RdcYUNlduBiWzoKu0yZXkwz
	 A7GTRVu2tvaFnWuMjqTOqqtguCAe//3lQBvaGo7KXrUJ444RvwHTL7HVHN2kM4oKuq
	 fgTPhDJm7DafLszsTU3IeudzqgIGRy1ckjOYwKHQlcqcY9BExu+T4niEfBIE34qSsO
	 WHDe2WN1coLCNSyF43sD4B2Bm5AMoC7a6uLD1um7P7dAzWwdXHaW007c4+4pnS0cuO
	 23mmK/neuTdPA82nnJZZqEo4dV5/+xh+i+fPxjEtDKNlKRLvrCNS1FqIFswE4IgQJ3
	 QkOk7D/s7Lrsg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSffrDeM
  UgwMrpSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxfXfuZCg7yV2x4MI29gfEqbxcjF4eQwGNG
  iYfbFrNBONeYJCY0/mKGcPYwSvzeupq1i5GTg01ASuLG/f9AVRwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFzCWm7l4EVs4ioCqx4MkGsDivgJPEof29zCC2hICCxJSH78FsTgFnia6GRjYQWwiopu
  PgTSaIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM5sWpRWWpRbqG5npJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHhm1KcdGcH486+v3qHGCU5mJREebu4jFOE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fAyXAbKCRalpqdWpGXmAGMJJi3BwaMkwitxDSjNW1yQmFucmQ6ROsWoKCXOy3EeKCEAksgozY
  Nrg8XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGcuAk3hycwrgZv+CmgxE9BiLhcDkMU
  liQgpqQYmmYxDfnstzH665oQGM+tu2BhnvDYkIe7wXnE3za8bntwMWsy4089CN12T50DEBX1j
  Hbt1eXPm5C/4otjxekOpU6Hqj5nX5PR+n047aKTJvcL7w4xXRR3sb6XS/E4zfl3NPqtALMEkl
  F+3o2Pt/uj2D7ZtP1df9pWZE3w5IpB5RtDOQke37CPmf07ydhmb6SyRXS3ffqpqzyUPrloeS5
  nLd64dv9xhWh0TMvHpDp8aJQ4D/XB96ZdhzUtPGs7nE0gXvO5749AXgRO1kblC9z67es4M/L2
  85a/S4lMaDJdD/c9fOWGa2Za4rdHnaBYbz4qlShkR11ulxG+tVhRp9VgicSU8ffHS5A9Jd/Yv
  MVNiKc5INNRiLipOBAA8CfoJWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-745.messagelabs.com!1681119477!193034!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6122 invoked from network); 10 Apr 2023 09:37:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-29.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:37:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D88CE100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:56 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CBBC41000EE
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:37:55 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] zstd: upgrade 1.5.4 -> 1.5.5
Date: Mon, 10 Apr 2023 17:37:20 +0800
Message-ID: <1681119440-25219-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179877

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
fix: fix rare corruption bug affecting the high compression mode
perf: improve mid-level compression speed
lib: deprecated bufferless block-level API
cli: mmap large dictionaries to save memory
cli: improve speed of --patch-from mode
cli: improve i/o speed (+10%) when processing lots of small files
cli: zstd no longer crashes when requested to write into write-protected directory
cli: fix decompression into block device using -o, reported
build: fix zstd CLI compiled with lzma support but not zlib support
build: fix cmake does no longer require 3.18 as minimum version
build: fix MSVC+ClangCL linking issue
build: fix zstd-dll, version of zstd CLI that links to the dynamic library
build: fix MSVC warnings
doc: updated zstd specification to clarify corner cases
doc: document how to create fat binaries for macos
misc: improve seekable format ingestion speed (+100%) for very small chunk sizes
misc: tests/fullbench can benchmark multiple files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/zstd/{zstd_1.5.4.bb => zstd_1.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.4.bb => zstd_1.5.5.bb} (96%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.4.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
similarity index 96%
rename from meta/recipes-extended/zstd/zstd_1.5.4.bb
rename to meta/recipes-extended/zstd/zstd_1.5.5.bb
index c2e96225e4..487465b6c7 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.4.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
 
-SRCREV = "945f27758c0fd67b636103a38dbf050266c6b90a"
+SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.34.1


