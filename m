Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D0FC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:20:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.64609.1673241648352219902
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l3yJELAr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241646; i=@fujitsu.com;
	bh=9fq1RVwNe0Mw0oCAef++MxRoD2xOmgRvcWD7RSam/Ak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=l3yJELArcOBothgp5dfEkT/Tt3oQ0yVvfIzyroPN7hDOTvU8IQFx1BOF64Enp12hp
	 mZKrgAKymWavTYiDhGxapOqFg4h0QfKWyaXqwCjKt2ACdZpXCCoRRBZdgDlRWHotbP
	 oG5NQu8eamhxnneF1MgNH4laBd1DDCynQRUNkKvRCAp4UrQoWj9rPR7mbnzH1sRc77
	 iSn4QF0jwXMGrM1nmX02aGjm9wL+t9X02t+coG6iW/yltg3tD/waSCaMjpgxRheY5L
	 FXpXlutb62SSzvlmiT2Ew335FrhL/Qmw9BShB88Gk11C77wvr2n8IWpZDoCY2I9sTb
	 I5uhrKeXX9RoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqKu7ZHe
  ywYYX8hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPU5tYCv7IViy++o+9gXGSVBcjF4eQwGNG
  ibMrbrFCONeZJDa86GaEcPYwSnzfuJati5GTg01ASuLG/f9ANgeHiICexNV/oiBhZgEViRe/e
  9hBbGEBJ4l1U54xg9gsQPH1H2ewgNi8QPE3e88ygdgSAgoSUx6+B6vhFHCW6GtZDRYXAqrZ93
  oaE0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXVO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDQTSlmLNvB2L3sj94hRkkOJiVRXo6qXclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhnL
  9ydLCRYlJqeWpGWmQOMI5i0BAePkggv10ygNG9xQWJucWY6ROoUoy7Hpn1dB5iFWPLy81KlxH
  lrQWYIgBRllObBjYDF9CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwS84Cm8GTmlcBtegV
  0BBPQET+m7gQ5oiQRISXVwMRuz7+ioCJFQ2XqYjWH386vSjWXe/32EW472J+dv/v1bekErvcf
  G4vv/zmx6ejUktV/moorJLb0iFXah9Rpa5lzpC9qKlzVOv1n0Kn/flNi2K5f3ftKLrH/dtviv
  NKP195eqeY6LcCz5dPL03sWmDvLt6lGxtzPrv/LkSBvI1WVc9D1aLdh047Le2ewKkkcmhMcGe
  XFnLrKKt7BQvZK3tapGSx8N5ad8V6QLmZrItNvwWyhHMxZsbLTYNvD91H1CV62t93X/mr8uvt
  GNHfN5/SdFptbGdnLGzZv05GN2TX7ovZCBv+pliyzT32t8WeSW5i3LzXGTnj1Td2Ub9OFz/0M
  SvZY/JR/orSsuJmSEktxRqKhFnNRcSIAcprh52QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1673241645!316280!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5905 invoked from network); 9 Jan 2023 05:20:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:20:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1A958100182
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0DB8F100043
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:20:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] virglrenderer: upgrade 0.10.3 -> 0.10.4
Date: Mon, 9 Jan 2023 13:20:22 +0800
Message-ID: <1673241622-29031-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
References: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175666

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Replace-lseek64-with-lseek.patch
removed since it's included in 0.10.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Replace-lseek64-with-lseek.patch     | 45 -------------------
 ...erer_0.10.3.bb => virglrenderer_0.10.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.10.3.bb => virglrenderer_0.10.4.bb} (93%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch
deleted file mode 100644
index a0278abd28..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a60f0658001d2e8e15ad980731d4130808d37d56 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:58:57 -0800
-Subject: [PATCH] Replace lseek64 with lseek
-
-meson defined _FILE_OFFSET_BITS=64 unconditionally, this implies that
-lseek and lseek64 are both same since they are using 64bit off_t,
-replacing lseek64 with lseek also helps in compiling with latest musl C
-library which has removed these from _GNU_SOURCE namespace unlike glibc
-where _GNU_SOURCE also implies _LARGEFILE64_SOURCE and the definition of
-lseek64 is still available.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1003]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/proxy/proxy_context.c | 2 +-
- src/venus/vkr_context.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/proxy/proxy_context.c b/src/proxy/proxy_context.c
-index f2a035b..f20f7c8 100644
---- a/src/proxy/proxy_context.c
-+++ b/src/proxy/proxy_context.c
-@@ -319,7 +319,7 @@ validate_resource_fd_shm(int fd, uint64_t expected_size)
-       return false;
-    }
- 
--   const uint64_t size = lseek64(fd, 0, SEEK_END);
-+   const uint64_t size = lseek(fd, 0, SEEK_END);
-    if (size != expected_size) {
-       proxy_log("failed to validate shm size(%" PRIu64 ") expected(%" PRIu64 ")", size,
-                 expected_size);
-diff --git a/src/venus/vkr_context.c b/src/venus/vkr_context.c
-index 9ecb9cd..1e5dc68 100644
---- a/src/venus/vkr_context.c
-+++ b/src/venus/vkr_context.c
-@@ -359,7 +359,7 @@ vkr_context_get_blob_locked(struct virgl_context *base,
-          return ret;
- 
-       if (fd_type == VIRGL_RESOURCE_FD_DMABUF &&
--          (uint64_t)lseek64(fd, 0, SEEK_END) < blob_size) {
-+          (uint64_t)lseek(fd, 0, SEEK_END) < blob_size) {
-          close(fd);
-          return -EINVAL;
-       }
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
similarity index 93%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
index 5d483431a7..f76e7cb1b9 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "0922041ec6730122e0fec11404e6859e2efc4bc0"
+SRCREV = "88b9fe3bfc64b23a701e4875006dbc0e769f14f6"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-Replace-lseek64-with-lseek.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


