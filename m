Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F614C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 00:19:57 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.37462.1736986790307520131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 16:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C14fnJW+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736986791; x=1768522791;
  h=from:to:cc:subject:date:message-id;
  bh=kdVl0sumoLc7VUfIzNHskORl+d3hFhLg19CX93Xx5T0=;
  b=C14fnJW+BArql1vyM0l9GItf3eR/psCHC4cxjLCBIoQELd554oXPTZy6
   HbI0syZV/bFIKux7V42YX9ST3QZnKNND9LfjKsYdoY+yMUqcksbxf3lYw
   5jx33a23jx6WBWb3z98ZWo0oaFckfR2RbcVPA1iiyHuX6wRHVhnbUNIry
   lXyMsqZNcvYxPe2Rqv0awFNaYezOtrsIFIwx+/I1pQh/aplIJ9PHDp72h
   1rtKM2h4adwLiX2ONRNr9qp0AvyS+ZNzzYnpN1yBEtsgw6dH5LkD2RlrO
   WqDEMqvfe1bIsMbOL/0ueKk3lSKJBjOtzkYR0Znqmyr8vKhfx6AX7an6L
   g==;
X-CSE-ConnectionGUID: X6OOkmKsQ4mYdfjkUqV0hg==
X-CSE-MsgGUID: RcL7PV/BR0WhWe32tNLd1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="166145025"
X-IronPort-AV: E=Sophos;i="6.13,207,1732546800"; 
   d="scan'208";a="166145025"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 09:19:48 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03BB5C3F9A
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 09:19:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF117D96C5
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 09:19:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 435516B64A
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 09:19:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B6DDD1A0073;
	Thu, 16 Jan 2025 08:19:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when enable multilib.
Date: Thu, 16 Jan 2025 08:19:39 +0800
Message-Id: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28926.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28926.003
X-TMASE-Result: 10-0.075300-10.000000
X-TMASE-MatchedRID: fTPAAp48oEMtIbjApBhleB1kSRHxj+Z5stmlQezwoxU6FHRWx2FGsO79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRAoNa2r+Edw19LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrYs9o/JQNeiUjhqKlWO1XhSzuSqHXEC1NLkUKOjOdj8L3nn5MpDrolF83B
	zSqm1VD5sebz+Evf7apSBSJZmQb1teQObMLyRh/x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 00:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209930

From: Wang Mingyu <wangmy@fujitsu.com>

The setting of want_xterm_kbs is as following:
case $host_os in
(*linux-gnu|*cygwin|*mingw32|*msys)
    want_xterm_kbs=DEL
    ;;
(*)
    want_xterm_kbs=BS
    ;;
esac

The host_os when enable multilib is as folloing:
host_os of aarch64 : linux-gnu
host_os of aarch32 : linux-gnueabi

So in lib64 package, want_xterm_kbs=DEL, and in lib32 package, want_xterm_kbs=BS.
It results the differences in the terminfo files between lib32 and lib64 packages.

Using --with-xterm-kbs=del to unify the packages of lib32 and lib64 into "want_xterm_kbs=DEL".

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index e96ee075bd..3f93550cf9 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -70,6 +70,7 @@ ncurses_configure() {
 	        --without-debug \
 	        --without-ada \
 	        --without-gpm \
+		--with-xterm-kbs=del \
 	        --enable-hard-tabs \
 	        --enable-xmc-glitch \
 	        --enable-colorfgbg \
-- 
2.43.0


