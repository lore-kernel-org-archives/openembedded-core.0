Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C776C021BC
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14685.1739864491632196876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YCYBL11Y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864492; x=1771400492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qxflTcgRQGcpk47Oogpf6TD4iz9JbOpbrY5J0dplDk0=;
  b=YCYBL11YvLC55E9QXSIlx3ln+i6fDa3q/XvUL0zoHMwDqy+vER26k/T2
   d7sltB2TAbHuM3e6Wv8N2lvO0vIHFZInoRZIpyHrGOE62dLx4H4Y3Jk0u
   YUdnc9ACjrW6htPRizumgKfVubFCKSn6c7En1QDu7HcrsHMbPWuX4ScGq
   S3ntpuGMTSCouJDbzlNqWPHmkfn33adUIdmkHD1F8PORiK+uUrpKltv2B
   1ueWp470Jgk9DJoQ8leoQhxSi/87WIau/EK/T+oNP2potW0IW3Z3aNIPi
   vrjn91l77e3nR4XpWTNXm/H9LhKp2D7cxjvbPTNckCArmOvcul5n32QKV
   A==;
X-CSE-ConnectionGUID: rSPOUQsRRNm8bbB3jxgQfQ==
X-CSE-MsgGUID: tCBVz1ovQRC0ji8Gjjn7NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="192947485"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="192947485"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:25 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39217D4C46
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00985D8AC3
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A4591A006C;
	Tue, 18 Feb 2025 15:41:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/32] libuv: upgrade 1.49.2 -> 1.50.0
Date: Tue, 18 Feb 2025 15:39:14 +0800
Message-Id: <1739864375-21394-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211581

From: Wang Mingyu <wangmy@fujitsu.com>

Changes since version 1.49.2:
==============================
* ci: run macOS and iOS tests also on macOS 14
* unix,win: map ENOEXEC errno
* test: skip multicast join test on ENOEXEC
* ci: make sure the macOS firewall is disabled
* darwin,test: squelch EBUSY error on multicast join
* build: update minimum cmake to 3.10
* kqueue: use EVFILT_USER for async if available
* unix,win: fix off-by-one in uv_wtf8_to_utf16()
* doc: add scala-native-loop to LINKS.md
* unix: fix build breakage on haiku, openbsd, etc
* kqueue: lower overhead in uv__io_check_fd
* doc: move cjihrig back to active maintainers
* build(deps): bump actions/checkout from 3 to 4
* unix,pipe: fix handling null buffer in uv_pipe_get{sock,peer}name
* unix,win: harmonize buffer checking
* unix,win: add support for detached threads
* src: add uv_thread_set/getname() methods
* build: fix qemu builds
* win: drop support for windows 8
* linux: fix uv_cpu_info() arm cpu model detection
* linux: always use io_uring for epoll batching
* doc: clarify repeating timer behavior more
* unix,win: handle nbufs=0 in uv_udp_try_send
* win: use GetQueuedCompletionStatusEx directly
* win: enable uv_thread_{get,set}name on MinGW
* win: drop support for the legacy MinGW
* win,fs: get (most) fstat when no permission
* win: plug uv_fs_event_start memory leak
* test: address FreeBSD kernel bug causing NULL path in fsevents
* unix: refactor udp sendmsg code
* unix,win: add uv_udp_try_send2
* build: enable fdsan in Android
* test: fix udp-multicast-join for FreeBSD
* win: fix leak processing fs event
* src: set a default thread name for workers
* misc: implement uv_getrusage_thread

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.49.2.bb => libuv_1.50.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.49.2.bb => libuv_1.50.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.49.2.bb b/meta/recipes-connectivity/libuv/libuv_1.50.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.49.2.bb
rename to meta/recipes-connectivity/libuv/libuv_1.50.0.bb
index ecffb30c24..c5f4e9d3ac 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.49.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.50.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "e1095c7a4373ce00cd8874d8e820de5afb25776e"
+SRCREV = "8fb9cb919489a48880680a56efecff6a7dfb4504"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


