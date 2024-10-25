Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E24D11717
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.5572.1729834798086149420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h9B4eiD9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834799; x=1761370799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zpyz8wY8mqm2Sfv2T9rL1kJy/BSnm2lnwu0bTntUP1I=;
  b=h9B4eiD957qsDP6oUpKrtbNJNFPgcthB5f+MV/qwBndjFiwUULpfBzXn
   5G5drCwC1xDcCQLOw1RROQ6NuCQVKtHLqzM13H82TXpJKHxiUZZcnqa51
   fzpO0k+9h6UNA9lpXjrQFTR9ecTqSqGLArrLF/+a6+DeUGwsQi3BXjAV6
   lXWPFEQz9oCilBv2eJskwFSOkSRobs/ehz1WeSu6gHzhVjViiETBfzc7R
   NDuxjP2SEWqeTxKk7+tvnq6zffDsW5Koc0qyrCnvSwSfetJMGqSadgUwV
   dTP98u8noFsm9KX1c85ex9fqX8vtKERFv2kOt/p9lWAF2r8Cu2InCAziM
   A==;
X-CSE-ConnectionGUID: C2sLAT+ESAexT8wGquVYlA==
X-CSE-MsgGUID: VmOU97alR1uGiEBbcfTHlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="165949028"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="165949028"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B149D801B
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6785BF4B0
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55CD120071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01E0E1A01E9;
	Fri, 25 Oct 2024 13:39:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/22] libuv: upgrade 1.49.0 -> 1.49.2
Date: Fri, 25 Oct 2024 13:39:16 +0800
Message-Id: <1729834769-4717-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-4.642200-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+t5s9kBup6GBLN
	DIA6IruyBHGj1qouCqsploJsaXaVhtt0USrWkHT6KiJEqUFWRggXivwflisSrDxr78aOiICq/4Q
	mCej9TIKOqyja6YVltvFENcfi0kqDuFeTZFeG0aP+xRIVoKNMvFQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEbwXotg6ps9+E38zfZwr5+SOJz0
	/I2b9TR4vM1YF6AJbbCCfuIMF6xLSdET58jp62S0v98MmA6ydGVQEcMUyMoz9dTuhJeh1XQRUrS
	kVMLyM4Pwfx27X5UUoLdrKubvzbBvhRUFg7z11FF8p6s90YfDWhzi2TOvwZ+S7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206321

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* win,fs: remove trailing slash in junctions
* Revert "linux: eliminate a read on eventfd per wakeup"
* win: Fix linked list logic in getaddrinfo
* win: fix compilation against Windows 24H2 SDK
* win: remap ERROR_NOACCESS and ERROR_BUFFER_OVERFLOW
* win,fs: match trailing slash presence in junctions to user input
* build: add darwin-syscalls.h to release tarball
* linux: use IORING_SETUP_NO_SQARRAY when available
* linux: use IORING_OP_FTRUNCATE when available
* win: fix pNtQueryDirectoryFile check
* win: fix WriteFile() error translation
* win,fs: uv_fs_rmdir() to return ENOENT on file
* win,pipe: ipc code does not support async read
* netbsd: fix build
* win,fs: fix bug in fs__readdir
* unix: workaround gcc bug on armv7
* unix: work around arm-linux-gnueabihf-gcc bug
* unix: fix uv_tcp_keepalive in smartOS
* unix: fix uv_getrusage ru_maxrss on solaris

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.49.0.bb => libuv_1.49.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.49.0.bb => libuv_1.49.2.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.49.0.bb b/meta/recipes-connectivity/libuv/libuv_1.49.2.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.49.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.49.2.bb
index 1dd73f2f8c..ecffb30c24 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.49.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.49.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "d2e56a5e8d3e39947b78405ca6e4727c70f5568a"
+SRCREV = "e1095c7a4373ce00cd8874d8e820de5afb25776e"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


