Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8466C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 00:04:28 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.888.1637193867191079346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 16:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=sRUkKdBx;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from
 abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net
 (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4DFA520C7062;
	Wed, 17 Nov 2021 16:04:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4DFA520C7062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1637193866;
	bh=rq8LBZw3QZ5m4+2IF0I/nazs2Ilw7of7fzNgb9Hhsk8=;
	h=From:To:Cc:Subject:Date:From;
	b=sRUkKdBxmMlkoUvhkU2gd9ZnPWgaqTcH3AMhoV+AwXok1JPDVYEPkWwW024++ellL
	 SdHKOlGrLhmTqPjTZ/GCqp+t2phhzzItaPKd0AmkedY33+wmQLEPBe9uSPoW97pBfn
	 PkLY7aJgSKmBACIUP7XIujnM6C1AlWlbSIL6H/VM=
From: Andres Beltran <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH] create-spdx: Fix key errors in do_create_runtime_spdx
Date: Thu, 18 Nov 2021 00:04:02 +0000
Message-Id: <20211118000402.17589-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 00:04:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158463

Currently, the do_create_runtime_spdx task fails with a Key Error if a
dependency is not contained in the package providers dictionary. Add a
check before using "dep" as a key in "providers".

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
---
 meta/classes/create-spdx.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index c85a11595f..601a928996 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -678,6 +678,9 @@ python do_create_runtime_spdx() {
                 if dep in seen_deps:
                     continue
 
+                if dep not in providers:
+                    continue
+
                 dep = providers[dep]
 
                 if not oe.packagedata.packaged(dep, localdata):
-- 
2.17.1


