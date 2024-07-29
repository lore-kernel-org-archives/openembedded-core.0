Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D644C52D6D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46590.1722215425506508167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hXstjT5x;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215433; x=1753751433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=01NAJNIsPCaLeN1nlOg02Z+ABXNZc4iS8vH9fK6z/g8=;
  b=hXstjT5x2oJS3J4k1j7EKyxahEdg5ZoCuf7vwFwZq/Apnq3Lt3eM6p6r
   xdcz/yoWjn2MIqV0XwJ01ZG6aVsWHmwc+jj9OTW/lNuAIlsZH2ztrzXtQ
   v3j2bilfAYxCFEAf3fc1DB6PjfUvI//P5DG4vMng9atR3978oU1VjkMb1
   FveJIYKanM/hesVTUqK05VIB8yP58CjgBB8pNDMXoAB3UaKk0SRFM0N4N
   NlqmtJB3eyjHXRQlrMiB2PgKRCQ9K1josGpuFTlREXYWpvq2GjgsFh1Be
   /H/XCG9YUaWbZdEbrqXB//aP8aqT9w4VO91GS1qjqL0E1myUlzpsK9vfC
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="170816562"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="170816562"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:31 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E36B3E8524
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 349F7CFB68
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9713320071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BA6C1A000C;
	Mon, 29 Jul 2024 09:10:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/33] sysklogd: upgrade 2.5.2 -> 2.6.0
Date: Mon, 29 Jul 2024 09:10:01 +0800
Message-Id: <1722215408-27541-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--3.728200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwZ80RiFHbW3YfA
	3Ao58IsToekUdArZ14EbYA1xraQblEQaMI7TlxQf30kDaWZBE1Tu7w4HbIs/ONEsz5h33ihbi1R
	bZN1JuSjwx1fpYFo1NCd0xLIZ7AM+JVQGWszCeGfN1j27XOUH5hec4BHYbB/TlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDWgws6g0ewz2fS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt+gmVy5VdZkmY7gDTrSz3O0uY4H2D3Et+Atr3suzU0onE3DCKkGVwAoLBF6Z6NoZ5W5YJ
	Fd2tQ5qmQChcWwA+/qdm+kRkHCHcsfNtr0TTrX3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202598

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
### Changes
- Add reload command for systemd service
- Add global log rotation options to .conf file, issue #80.  Introducing
  two new settings: 'rotate_size SIZE' and 'rotate_count COUNT'
- Semantic change for per-file log rotation settings, no longer possible
  to disable log rotation for a file by setting 'rotate=0:0'
- Possible to set only size or count rotation per file
- Add support for 'listen addr:port' to .conf file, issue #83

### Fixes
- Fix #72: loss of raw kernel log messages to console.
- Fix #81: blocking delay for unreachable remote log server.
- Fix #82: retry creating UNIX and network sockets on failure.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.5.2.bb => sysklogd_2.6.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.5.2.bb => sysklogd_2.6.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
index e488603086..ab0581ec8c 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "3332c550f1a68393daec5d64cd81f3b7674c0af5"
+SRCREV = "6b44b9822e8551114e1ed38c38c51b8e95188599"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


