Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55348C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11787.1713948184161953064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yy+z40bu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948184; x=1745484184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KnywdR0i/pNIx2wtVuPaADeSMMItChgC721p1+jU/mI=;
  b=Yy+z40buPQLv3kfV7d5vT2O6xkuFMfxhHSYJzhwfzSWNAOZXb+GCLipQ
   SjMgOpgp1bielK/7CnO0Hfi8XBFyvlAOjmW1HGuP6CSDxvl/0ALDIfM3t
   tSGFBY8GqAEXpNLv42ejEc5IBYRg+2IKkw4WOHTrNVHPqu2KVv1Z5E8if
   9sL2T1vKz0JzC1QypgU3z+SFV6Y4fyL0FH7RPh/0vS3Koa4DLdTyVtVBn
   12dOtOGPDDek670uSEwIubLNgEYFQUprVpd0kMmRcoM02G8l8Bd5NKU2G
   tlG/cBH6EJAo9dCH18mr/nFiV50HwGu+miMXOYUXkJlu+4cuhou8YYUA8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151925"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151925"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E305AD4C32
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 239B4DB9FC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC57C21BEA2
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 54EB11A000B;
	Wed, 24 Apr 2024 16:42:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/38] lighttpd: upgrade 1.4.75 -> 1.4.76
Date: Wed, 24 Apr 2024 16:42:08 +0800
Message-Id: <1713948152-13501-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--6.489800-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyElHW9I/+NxYtU
	W2TdSbko7T3f4H3X0iFqMV4ex1MRvSnRTeH3LeMsYy6AtAy7YZfvG0/D/wjsdCxMw0FMkBlZ1Ie
	ckOrbKExJLc03SH2fQ5lLQz8ALjEEHY/bzRmIaZE/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bq8FBzdsKASwdhwWy0ECdopxV5gKrHXBXOpx23gbuS55VeAZ5VSHdZ2bKItl61J/yUGDD
	kbg1gJk32mPO5tnascgBwKKRHe+r0O+2BynPFDWeuqQfNzGY7JTBHK1FlDPGQfnXiUz5UmCpq8M
	m+MO34A=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198659

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [core] add default to builtin mimetype.assign
* [core] add MPTCP support
* [core] disable MPTCP support by default
* [mod_expire] omit caching hdrs for 204 No Content
* [mod_staticfile] noinline cold func
* [core] GNU/Hurd preadv2() RWF_NOWAIT ENOTSUP
* [core] special value for Linux POLLRDHUP on SPARC
* [mod_openssl] define asn1 time w/ OPENSSL_NO_OCSP
* [h2] VU#421644 HTTP/2 CONTINUATION Flood
* [build] packdist.sh git archive; replace make dist
* [core] gw_network_backend_write_error() cold func
* [core] reduce syscalls in some backend connect
* [core] defer TCP_FIN propagate if connect()ing
* [ci] workaround some packaging issues in NetBSD 10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.75.bb => lighttpd_1.4.76.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.75.bb => lighttpd_1.4.76.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
index fc3b7e005d..f0fdda4190 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "8b721ca939d312afaa6ef31dcbd6afb5161ed385ac828e6fccd4c5b76be189d6"
+SRC_URI[sha256sum] = "8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


