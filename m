Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD83C54E65
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.45974.1747040641752055042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iOyMc8qT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EZhA2SY0ykUs5wFucuYBhB5ZNwqsxn+XHVQpSbeev4M=;
  b=iOyMc8qT7aSXL5PEM3N3eMjbbgZARGN0IYypUpq813iTSd8fo0FVQ2RT
   yJ5ikz8tCWsE5y+Cp4Ae0rgnf/6c09gyGTidrz8lZ1N7tgK9QO2helPwE
   NWQki7Tl/p/QBgy5dThaYh/I08k/HngX17/6Nwxdi0KRPGpmOZqXA6tpB
   6bL0Wai/Bi4OH/PrUYSelK58YF6Za/8vFMavD7Ix8ouBy1R5Krs7e7FMp
   XlsBK4AWHa3ixDxETnVhbvPKkip7PzYrHhBeVBqNrH2g3x6ZnWSXh2NIp
   Xq3llcQBcJjPpHIA7aKkF9XYw1PZ8XfkJ0rpdMlPNxQnbiWgxVLSTDuVt
   w==;
X-CSE-ConnectionGUID: aUOAqNo6QaOc8AC3XBl5HA==
X-CSE-MsgGUID: I3D4hI8zSE6omY0Ch/JBHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199133691"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199133691"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43239D5051
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ACFACFBA4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF5B41A009B;
	Mon, 12 May 2025 17:03:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/56] libuv: upgrade 1.50.0 -> 1.51.0
Date: Mon, 12 May 2025 17:03:12 +0800
Message-Id: <1747040619-7566-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216324

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* win: fix leak in uv_os_tmpdir
* docs: fix RTD build
* win: lazy-load [GS]etThreadDescription symbols
* linux: try preadv64/pwritev64 before preadv/pwritev
* win: check cwd length before spawning a child process
* macos,bsd: handle missing /dev/null in chroot env
* doc: fix README link text
* win: fix order of FILE_STAT_BASIC_INFORMATION struct fields
* macos: increase child process stdio buffer size
* doc: add C3 bindings to LINKS.md
* unix: remove unnecessary errno.h include in poll.c
* win: fix the inconsistency in volume serial number
* unix: add thread affinity support on openharmony
* unix: enable getrusage for SunOS
* unix,win: accept NAN/INFINITY as file timestamps
* win: add ENABLE_VIRTUAL_TERMINAL_INPUT raw tty mode
* test: handle UV_ENOTSUP in platform_output
* doc: fix rendering of threading.html
* unix,sunos: enable use of sendmmsg on Solaris and Illumos
* unix: handle out of memory in iface name copy
* openbsd: do not error out if cpuspeed is not available
* test: skip thread_name_threadpool on AIX/IBMi
* aix,ibmi: fix undeclared identifiers
* unix,sunos: prefer SO_REUSEPORT for load balancing
* doc: free lib pointer before function return
* test: link with libm
* style: rename parameter to match definition
* test: support partial output lines in test runner
* build: switch from c90 to c11
* linux: allow nul bytes in abstract socket address
* sunos: use pipe2 on solaris and illumos
* unix: remove TOCTOU issues from uv_pipe_chmod
* unix: use pipe_fname if getsockname returns nothing
* haiku: use uint32 instead of uint32_t
* doc: update thread pool stack size comment
* unix: improve uv_loop_init OOM handling
* test: merge uv_tcp_connect callbacks
* test: skip multievent tests on macOS with TSAN enabled
* linux: align CPU quota calculation with Rust
* kqueue: improve fs event watcher OOM handling
* sunos: improve fs event watcher OOM handling
* build: shorten instructions for cmake build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.50.0.bb => libuv_1.51.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.50.0.bb => libuv_1.51.0.bb} (92%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.50.0.bb b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
similarity index 92%
rename from meta/recipes-connectivity/libuv/libuv_1.50.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.51.0.bb
index c5f4e9d3ac..569bff1439 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.50.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "8fb9cb919489a48880680a56efecff6a7dfb4504"
-SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
+SRCREV = "5152db2cbfeb5582e9c27c5ea1dba2cd9e10759b"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


