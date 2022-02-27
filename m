Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E348CC433FE
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 18:21:53 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11438.1645986106775965675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 10:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Ih8pkPgz;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645986110;
  x=1677522110;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2a+wvYGa/9o8dybXm8QMT0LUfx29RpBFBXqdv4P5gqY=;
  b=Ih8pkPgzPmdxYIXctosdX/uid1pelem5LlpgoIzbpmRUmUKv/9MKs81S
   waTB91/MPj53g0K3RCO1aA6gx0G8CGSdZ8GKpZlDxsMRT57+pRtZHNsL6
   47FpqxmtlICGZPQJ8iBbavI7/9qzWmrcE+JOrM6urtfY5kaaUfvaEgQCZ
   hbxy8v89R15nlG70jRbGw8ZLu5oGdFO2K/kDP8yA6nAigMIMfQm0fFhyY
   xqGRSqO2ROoLFiSUALjV+TyF6luiCHAYJntZ3TQRRrTgkCCxKSKw15/3O
   C/IgtEbJ1dHCUq6j+T+Thxl7feO7dRbBhfVK8GbFKQ5GCF/7ZKVh8Ml9S
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 6/6] base.bbclass: Clean up code to determine if licenses need
 checking
Date: Sun, 27 Feb 2022 19:21:37 +0100
Message-ID: <20220227182138.5364-6-peter.kjellerstedt@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
References: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 18:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162444

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/base.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 55f654d37d..b5f2aa3da8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -583,14 +583,12 @@ python () {
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
 
-        check_license = False if pn.startswith("nativesdk-") else True
+        check_license = not pn.startswith("nativesdk-") and not pn.startswith("gcc-source-")
         for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
               "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
               "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
             if pn.endswith(d.expand(t)):
                 check_license = False
-        if pn.startswith("gcc-source-"):
-            check_license = False
 
         if check_license and bad_licenses:
             bad_licenses = expand_wildcard_licenses(d, bad_licenses)

