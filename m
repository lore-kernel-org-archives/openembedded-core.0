Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0586CF044A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9172.1728452976338985791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lf0+CBob;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452976; x=1759988976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZOz8oSfuthsxUfs/WkfCtOlDPkVAJBsH2ClLJvz+gdw=;
  b=lf0+CBobDggobSVqvJXN36dlAMChjXRW2ykOo6IDdy+yp9lRUvABxkZU
   zSgS96fasXeDHUsVPdjFm9k7pXCawNR0UHjJZPTHzjdUHG4+CDcBVOHwT
   MLQVwD8fWW+tWiAZSiSjIKHMhmqZUhbLceXfkohm//MN5gosSEhTmVWC7
   60eTdi6FIX9llgr9ItaLx01t8Xm+jYxrq8zA6jionix9XLp8fOb7L9tc+
   cpMV+UUwadF10aTJJ493PMaJUMsF3/DRb3zF7ErYtCxITHRcdxZlu2wc+
   8KE7wddlpj86efwRQVCmmhEb7XuledJ0X8vqJ+4nNovDk+INT0jyBVLwg
   Q==;
X-CSE-ConnectionGUID: Ek6eDW4YQsGpS6RLm4zoTQ==
X-CSE-MsgGUID: wkhzqQxGTt22nc/LFZ5oag==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="155225868"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="155225868"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C891D8008
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55033D73AE
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3F4EE5A18
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D6AB1A000A;
	Wed,  9 Oct 2024 13:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/26] erofs-utils: upgrade 1.8.1 -> 1.8.2
Date: Wed,  9 Oct 2024 13:48:52 +0800
Message-Id: <1728452955-25051-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--1.318100-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysO2jNO6qqUWx9F
	2XdSzVmwWxjOUDkI5yDy7Kkqj/XZ01R/KlnDpLSlA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf4Mu+9Uvd4Hi5x7uAXGEprZiQDIJsDspXEd+K6O5Nt52LU3
	MocF0oVoRI8YaAFWLhirOFKwaIr21jAM4vu3dHIZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMO6Kw6X+Ec2I/jdg1Y4xNoBdn2Z/QRCrDYjMCZ79pJL7gOhmL3aKiG5zqbUBWXiyEjqNmM
	IpAU0edwnYFMDUGljPx1ATmPQfv4gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205314

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix build on GNU/Hurd
- Fix maximum volume label length
- Correctly skip unidentified xattrs
- Support exporting xattrs optionally
- Correctly sort shared xattrs
- Allow pax headers with empty names;
- Add '--sort=none' option for tarballs;
- Fix broken compressed packed inodes
- Several minor random fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../erofs-utils/{erofs-utils_1.8.1.bb => erofs-utils_1.8.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.1.bb => erofs-utils_1.8.2.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
index 50d6e3b38e..4d8689f87c 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "ddbed14463fb798eff71fd4d4395357eb598e175"
+SRCREV = "8bedd862edfbb9a5e54dd37abede29020dd8fdfb"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.34.1


