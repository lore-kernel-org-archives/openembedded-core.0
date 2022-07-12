Return-Path: <pascal.bach@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4B0C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 09:24:48 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net
 (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web08.7130.1657617886928021924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=pascal.bach@siemens.com header.s=fm1 header.b=mKvUfhm4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225,
 mailfrom: fm-402798-20220712092444280f18edd2f2b6ef6f-xnepcc@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id
 20220712092444280f18edd2f2b6ef6f
        for <openembedded-core@lists.openembedded.org>;
        Tue, 12 Jul 2022 11:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=pascal.bach@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8VVVukIUz/6fjWhfrczn8PZHm7giIwjdo8y4m9pVB5w=;
 b=mKvUfhm4fPd+tCFy0QLHs9/jDJT7E9q0BTo6nY9PBb3eYOCPuAOFSTfXMPoqxLnDFTymUy
 cpX1FjSIY+pvTci1mkbiGaIY9zfZM91crYkpg0i2GzqcgxbP11EhVaXxolqHsEM9Fd5pyrXe
 88qKv3tVRjatlkfWZw++mf0LmJyME=;
From: pascal.bach@siemens.com
To: openembedded-core@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>
Subject: [PATCH] bin_package: install into base_prefix
Date: Tue, 12 Jul 2022 11:24:39 +0200
Message-Id: <20220712092439.1842733-1-pascal.bach@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-402798:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 09:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167916

From: Pascal Bach <pascal.bach@siemens.com>

This makes the bin_package.bbclass work properly with the native class.


Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/bin_package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
index c3aca20443..f0407e1329 100644
--- a/meta/classes/bin_package.bbclass
+++ b/meta/classes/bin_package.bbclass
@@ -30,8 +30,9 @@ bin_package_do_install () {
         bbfatal bin_package has nothing to install. Be sure the SRC_URI unpacks into S.
     fi
     cd ${S}
+    install -d ${D}${base_prefix}
     tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
-        | tar --no-same-owner -xpf - -C ${D}
+        | tar --no-same-owner -xpf - -C ${D}${base_prefix}
 }
 
 FILES:${PN} = "/"
-- 
2.37.0


