Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D938C27C5E
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.5648.1716369344024992753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PlaJR6JZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369344; x=1747905344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9QvuE3sEP1KdRY8opxQyXoT1IBYudaP/lHNA12cRHa4=;
  b=PlaJR6JZ+WP9k9n1iVEnteQP3YFjswMFehMn8LCkMNDNGUMxWj1K7X3i
   honKf0x/1K+O2cL/xP6WqfsWBcdhdqYG/ChKJYRIUQekdqnjJybZ93zSy
   lEP/Hr7vBWLgOC3j3sFB1i5BvFNbKIXFlGHUnyREvoD7IXCGFPf/JFTa2
   vheIEerrY7P2P21qFV24IiiSEBIyve47POVV0GzR6ywdB29Ccr+G0kKe1
   gq7IGGxkrS/9jEyfFWTysjny5celSROz/1J9zd7lFfeA2KhB7DNWezNgO
   vFD4wHM/Xwig2htDtvvMMxRm9q9I0QcOEgST0td3LdtcNgEPcPP74YH7A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="138467740"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="138467740"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:42 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0872E4289
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CAC2800F6
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D43E20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 395331A000D;
	Wed, 22 May 2024 17:15:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/42] ptest-runner: upgrade 2.4.3 -> 2.4.4
Date: Wed, 22 May 2024 17:14:37 +0800
Message-Id: <1716369289-22526-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.479300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrGYkyyELuGKSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLc6QuXl8LzQWsSiwizsgluQ1vZ
	7s3YIVDI3lq3YEgY6JmFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SktNpAP6VxhZbQVrA8PqpUimRN9hsmTwk63ZhhKdn0Fe186IVPEn1x0VTO
	sUgaSsJQFJxxSPJrNM53TNR7cvPIs70SCrsAY0qS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199726

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- utils.c: run_ptests improve error handling on ptests iteration
- utils.c: run-ptests improve pseudo-terminal handling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
index e6668da01f..2263e07280 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "92c1b97bfdb4a94acc1cabcaf97eef52dc29144c"
+SRCREV = "95f528cff0bc52903b98c292d4a322fcffa74471"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


