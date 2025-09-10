Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5160DCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:30 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.13175.1757495900450738361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ovI7IZK0;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495900; x=1789031900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zo1+wKD05h8F3Ncztel606ycF7Nhf2Y3DWaZAdimr4U=;
  b=ovI7IZK0WQ7LInk8X/p/aECR2mT6muO4kgS90QSJ9lEl5bu+hytkMLoD
   OSBLKxKMuGyxEckwsSkJV9Z5QyYIlhBcklYV0qmMm2AtBwRfQ1GJqJ56I
   tBUghto8No4sjWjveYjDxb4cuNp+i1jKcb33Ow7nLWp+SGbdqk/1UmgkE
   0Af9UGG51SGKggB4mVO7Xtc/Wmh6mjT0A3tKuIM7jGYLJ/SCSqogZuoae
   fnHyvdB6ENYf/S+jXA8GFJYzMALF+abQlZKzgG3giB1Ey7zBZagCuaEvs
   AL8lQqm+oF3oxiTEZRypky38gnL9O4te9hN67KcEDUs7fuxRXpoV5PNio
   g==;
X-CSE-ConnectionGUID: 45j5jvM0Tp2bQDmPVbASFA==
X-CSE-MsgGUID: 5o3iLtN5S9ayBC9JIH+z9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384317"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384317"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:18:19 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id ED40C1C1C718
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:18 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A73BC1800243
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 275021005128
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 39C521A0078;
	Wed, 10 Sep 2025 17:18:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/40] sudo: upgrade 1.9.17p1 -> 1.9.17p2
Date: Wed, 10 Sep 2025 17:16:44 +0800
Message-ID: <20250910091646.998-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223189

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 83bfc0621c..3a5c111961 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
+SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.43.0


