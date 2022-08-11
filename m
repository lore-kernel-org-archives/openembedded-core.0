Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D173C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 12:35:59 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net
 (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web12.5815.1660221348375899864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 05:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CcWo1esx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227,
 mailfrom: fm-256628-20220811123545c11216de2cac3a9543-fdzu4j@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id
 20220811123545c11216de2cac3a9543
        for <openembedded-core@lists.openembedded.org>;
        Thu, 11 Aug 2022 14:35:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oTarUGtwt40jtGfmCU4FjeGKSAZ3EQTffi+FC58OrL0=;
 b=CcWo1esxSbtyLYtnva7fhSeWfByDHY1x3r6vZi3uwXglZeCB4PaqWgiQmvXUM4qRnr2rmB
 YF/JMU+pS3FE+W02pIOP5Y/e+svIdz4gzba4HHv2lwkbsVfumtOBj1qNhiJPnsHveUmtBMW2
 iCQeBQDeqKPm4A+MTu6FY6KOCNW6A=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] create-spdx: handle links to inaccessible locations
Date: Thu, 11 Aug 2022 14:35:13 +0200
Message-Id: <20220811123513.1188060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 12:35:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169242

When a link is pointing to location inaccessible to build user (e.g. "/root/something"),
filepath.is_file() throws "PermissionError: [Errno 13] Permission denied".
Fix this by first checking if it is a link.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 10deba638f..26a77b12b1 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -216,7 +216,7 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
             filepath = Path(subdir) / file
             filename = str(filepath.relative_to(topdir))
 
-            if filepath.is_file() and not filepath.is_symlink():
+            if not filepath.is_symlink() and filepath.is_file():
                 spdx_file = oe.spdx.SPDXFile()
                 spdx_file.SPDXID = get_spdxid(file_counter)
                 for t in get_types(filepath):
-- 
2.30.2


