Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB367E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:26:15 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.138082.1734639968056495792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VPKhtGT7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024121920260964a8ee4e53ed71f5e7-syd9dm@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024121920260964a8ee4e53ed71f5e7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:26:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+CqQucpsP7m2LFK/bL1AYFG69D94dVZCTjbxt4kkx7w=;
 b=VPKhtGT73MYleLISumxrFZg6g60fT+IB/7J0xWCLk/JFEyT2DGaNb+AX7NFi0mUcksqs39
 UtsW7KIhGKKQ07IsD9bS2HeENu03gECqfhayIT9ZrMplzyP4giy4Kl4USIDCV/5CGj9uq65A
 uwFNom1HcXLfafzTDVps0XwjlOy+iXT8E17a+RbWhS4S/zlVI+M4aUfJ0N8nvx/SRUs990sM
 bRQ5A48XaLmxU8gZBCEBHbLojY56oFJJT9sgbA2oz3/VPR+9rWc2Yuk9yca1NVG5DoShK/i1
 T99gYW8sX99mPThlpQDqqmiUGAnYKV+uUUEdXg79L28RqPo5XF+8XrwQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 11/12] memcached: ignore disputed CVE-2022-26635
Date: Thu, 19 Dec 2024 21:24:22 +0100
Message-Id: <20241219202423.346033-12-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208944

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is a problem of applications using memcached inproperly.

This should not be a CVE against php-memcached, but for whatever
software the issue was actually found in. php-memcached and
libmemcached provide a VERIFY_KEY flag if they're too lazy to
filter untrusted user input.

[1] https://github.com/php-memcached-dev/php-memcached/issues/519

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 270ad5486d..7234f02a13 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 
+CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
-- 
2.30.2


