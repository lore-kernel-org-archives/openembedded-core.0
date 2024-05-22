Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6124C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.5663.1716369320104169658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GPIJ6mee;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369320; x=1747905320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EZY4JVXGMkb8jb032HVbkTkhibfoWMpJptJBQ7xgy4U=;
  b=GPIJ6meetAVqy4mw+3AKSNBWOpNHg3q6IFVC3L7QrlEiKEaD8bQ/xHml
   7aATDgc0nTaXO9jH5p6E1WbnqygYUz+tXs+lVM6gdT6nti85bsRqa9WU9
   jMO/a6UaZ2l5nQ8t4e1OG3kYAAban9D4vVl/BSLWdUw2KOascKNOwyeIn
   6wvIoNGJCCB15i5QIYUu5HhJ5+iDP0/eyp65YS5MktlYUetlSYBAfa+QQ
   bsfzQiGeidxb6gjW6+YTSYX6nZ1GY3xzSaaetb4VW8N703UfKMkosYWoz
   T9JH7I/ffT5MkJ4QwmhkzUd55H8wIo84uQm0Y99Ursx2QKleGEHtscSpd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147548913"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147548913"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89C60E428A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B530D14503
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3844020097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8F1F1A000B;
	Wed, 22 May 2024 17:15:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/42] dropbear: upgrade 2024.84 -> 2024.85
Date: Wed, 22 May 2024 17:14:16 +0800
Message-Id: <1716369289-22526-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.407900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyteGtGjUrjdVZre
	flCQqwr2Q40E6PomDvwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7DrG
	3Q1PIT6hBO0VIP9C1b0VRqSsAR4H/8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SvDAOQQaF97DcE8L469BxYJnuhu75qBJ3KvNguQESL8pGNod74YC9bkhIx
	rraBLW8ZaUj9DF5BYSpK0J2rconBcISTSOX8XLbS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix build failure when SHA1 is disabled
- Fix build failure when DROPBEAR_CLI_PUBKEY_AUTH disabled
- Update debian/ directory with changed paths

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dropbear/{dropbear_2024.84.bb => dropbear_2024.85.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dropbear/{dropbear_2024.84.bb => dropbear_2024.85.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.84.bb b/meta/recipes-core/dropbear/dropbear_2024.85.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.84.bb
rename to meta/recipes-core/dropbear/dropbear_2024.85.bb
index 3ea64b13d0..54001414d0 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.84.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.85.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "16e22b66b333d6b7e504c43679d04ed6ca30f2838db40a21f935c850dfc01009"
+SRC_URI[sha256sum] = "86b036c433a69d89ce51ebae335d65c47738ccf90d13e5eb0fea832e556da502"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.34.1


