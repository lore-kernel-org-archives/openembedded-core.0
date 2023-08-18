Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62271C77B7F
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 16:09:28 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.964.1692374967261568968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 09:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NBljMIF+;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1692374967;
  x=1723910967;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y/+L0nj1oWMDlzp3SYTMwVjw5B8VlZOplkIxW3T0C6g=;
  b=NBljMIF+UgGXoQY34cqO+uKyyox/na1Tb4EUveqbEIQOx9+sCn0PAlvo
   LRBnMmos9ZM9nJ9F0Qdu9SsohuBhDBLDsjzTWTZQV42DiOR8v073yj7Y2
   xP8cuA82nmy6VC5vjdvjrVn9OEqwwaUJ9Vm4jhbUG6MJGyNdFl0+OSKnv
   1A9YCzPB/GFKAPZVodV3SOLdqHP1Btp+uDKdBtGpX9rWBd3KXTCjKKb3s
   NKh8kQP295DYVseRPNDBHHTjPHrYcatUttSBiwY+gxNyTSRRrgy4XmVcu
   CED5qDTjDcA3iW2l8RKJXP/uAy+hDtCSda2qStMlvAxvo9dkM7Q63xNpZ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bin_package.bbclass: Inhibit the default dependencies
Date: Fri, 18 Aug 2023 18:09:19 +0200
Message-ID: <20230818160919.1281883-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186378

Nothing is being built so there is no need for the cross-compiler.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/bin_package.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recipe/bin_package.bbclass
index 3a1befc29c..9dd2489725 100644
--- a/meta/classes-recipe/bin_package.bbclass
+++ b/meta/classes-recipe/bin_package.bbclass
@@ -20,6 +20,9 @@
 # they would be in ${WORKDIR}.
 #
 
+# Nothing is being built so there is no need for the cross-compiler.
+INHIBIT_DEFAULT_DEPS = "1"
+
 # Skip the unwanted steps
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"

