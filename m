Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05D9C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:06:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.3835.1753232800417330340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lsfDWg+3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232801; x=1784768801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZiQYp6niK10MUUlFwqEDF7btfGs6b8o7KJKtzWJ+IR8=;
  b=lsfDWg+3xgyypPjcVBMULFw8QwKIO5AxX+LK5Qk0nn4L0zfXXXgK+7bz
   Gd0WNzSBUxrvVTTCHkKMZkAmLWXjpdOfeZ1xZ289AjxOf7WcaDlGbhfI+
   eZ2bSL7lNE7HqKJ/w9/b2Qen15UOn4sOnFz+f7NlPsZ4ZI7u7CG0HsXqi
   g8xrXfsNtvXcVNu90SvYOZufw+4jo2lwpsQdP6RcEwgAczDEKxWXA+Ia2
   fY/yeqOZmVMj7JypkQNTwuvNmDZDRxXHcdPZLOraW3ZzOizVGKfCopPWr
   pALN7/eN+YzGDNd0UhKI9hW6s8tPSdgofeM5bmn1Sp51l3Ub6Gs02Cah0
   A==;
X-CSE-ConnectionGUID: dmVDsZQwT4KqiGb97RQVOw==
X-CSE-MsgGUID: 9tnWBtZdQmKRlFnA0yxAPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="210344869"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="210344869"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:06:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C83471853
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:38 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3C68F1C001B3
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:38 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 560501A006C;
	Wed, 23 Jul 2025 09:06:35 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 02/12] ell: upgrade 0.76 -> 0.78
Date: Wed, 23 Jul 2025 09:06:04 +0800
Message-ID: <20250723010614.926-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220761

Changelog:
==========
- ecc: Check return value of l_getrandom()
- unit: test-ecdh: Add bytes to l_getrandom wrapper
- unit: Convert UUID test cases to use precheck feature
- unit: Convert PBKDF2 test cases to use precheck feature
- unit: Convert check for random support to use test precheck feature
- unit: Make the failed precheck test case a success
- test: Add flag for indication of inverted precheck results
- unit: Use the precheck handler for testing available key support
- unit: Use the precheck handler for testing available getrandom support
- unit: Use the precheck handler for testing available checksum support
- unit: Use the precheck handler for testing available cipher support
- test: Provide test data also to the precheck function
- unit: Add test cases for precheck of unit tests
- test: Add support for precheck handler for unsupported kernel features
- Add License variable to pkg-config file

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.76.bb => ell_0.78.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.76.bb => ell_0.78.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.76.bb b/meta/recipes-core/ell/ell_0.78.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.76.bb
rename to meta/recipes-core/ell/ell_0.78.bb
index fcc56e02f7..ad16426bad 100644
--- a/meta/recipes-core/ell/ell_0.76.bb
+++ b/meta/recipes-core/ell/ell_0.78.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a0bf2b5a78450c0c167e3f65c18452ffe4c0f179d48c2a3661e6afaca8017ef9"
+SRC_URI[sha256sum] = "28ee1a586b4891c96e68667a424684e64ad35120f345e89d6705bd4023d2d40a"
-- 
2.43.0


