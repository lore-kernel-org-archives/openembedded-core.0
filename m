Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5325CC02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.web11.91120.1738598449043482308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnW5bvmzR8S;
	Mon,  3 Feb 2025 17:00:47 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnW3BlvzlQh;
	Mon,  3 Feb 2025 17:00:47 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 17:00:34 +0100
Subject: [PATCH RFC 6/6] b4: enable patchtest as b4 prep --check step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-patchtest-v1-6-ef6ee5fcdd78@cherry.de>
References: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
In-Reply-To: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
 openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210665

From: Quentin Schulz <quentin.schulz@cherry.de>

Now that patchtest is silent when everything goes well, we can use it as
validation step in OE-Core for each local commit with b4 prep --check.

While at it reenable the pre-flight check for b4 prep --check.

oe-init-buildenv needs to be sourced first to make patchtest available
in PATH and a few Python modules installed (e.g. unidiff, pylint, ...;
see meta/lib/patchtest/requirements.txt).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .b4-config | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.b4-config b/.b4-config
index 8ec5ddd91e1da05f27a53ff6f3d7351317461859..58b45051d554a13643ad65ff6602de82c0c91844 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-cc = openembedded-core@lists.openembedded.org
-  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  prep-perpatch-check-cmd = patchtest --patch - --quiet --no-summary
+  prep-pre-flight-checks = disable-needs-auto-to-cc

-- 
2.48.1


