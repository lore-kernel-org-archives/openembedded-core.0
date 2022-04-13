Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D746C38A04
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mailfilter06-out30.webhostingserver.nl
 (mailfilter06-out30.webhostingserver.nl [195.211.73.76])
 by mx.groups.io with SMTP id smtpd.web08.3809.1649882306913727951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 195.211.73.76, mailfrom: fntoth@gmail.com)
X-Halon-ID: aa3c9efd-bb69-11ec-8ed7-001a4a4cb958
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl
 [141.138.168.154])
	by mailfilter06.webhostingserver.nl (Halon) with ESMTPSA
	id aa3c9efd-bb69-11ec-8ed7-001a4a4cb958;
	Wed, 13 Apr 2022 22:38:24 +0200 (CEST)
Received: from 2a02-a466-68ed-1-e8ab-1d70-a6ce-c420.fixed6.kpn.net
 ([2a02:a466:68ed:1:e8ab:1d70:a6ce:c420] helo=localhost.localdomain)
	by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
	(envelope-from <fntoth@gmail.com>)
	id 1nejku-002NdV-1F; Wed, 13 Apr 2022 22:38:24 +0200
From: Ferry Toth <fntoth@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Xavier Berger <xavier.berger@biologic.net>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ferry Toth <ftoth@exalondelft.nl>
Subject: [PATCH v4 2/2] package_manager: fix missing dependency on gnupg when
 signing deb package feeds
Date: Wed, 13 Apr 2022 22:37:42 +0200
Message-Id: <20220413203742.6142-3-fntoth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220413203742.6142-1-fntoth@gmail.com>
References: <20220413203742.6142-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164368

From: Ferry Toth <ftoth@exalondelft.nl>

When signing the deb package feed gpg tools are a soft requirement. If gnupg-native
is not declared a dependancy the version from hosttools is used. Unfortunately the
gpg-agent version from Ubuntu 16.04 on the autobuilders is incompatible with the package_index task
and fails during oe-selftest. Fix by making gnupg-native a dependency.

Fixes: 0b4231b5 "package_manager: sign DEB package feeds"
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 meta/classes/sign_package_feed.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 16bcd147aa..f1504c2225 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -27,6 +27,7 @@ inherit sanity
 PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
 PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
+PACKAGEINDEXDEPS += "gnupg-native:do_populate_sysroot"
 
 # Make feed signing key to be present in rootfs
 FEATURE_PACKAGES_package-management:append = " signing-keys-packagefeed"
-- 
2.32.0


