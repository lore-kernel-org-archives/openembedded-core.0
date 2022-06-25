Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C47CC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Jun 2022 15:52:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.21139.1656172356081821221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 08:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=KE3EdGY4;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1656172356;
  x=1687708356;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=feVoxFc/eNzLzRfFaU2doJ5Iyg0dhrzYY9+jtCYIeQc=;
  b=KE3EdGY4KehrM53zT86R3XV3o2+l13OBzgnAQTa97qR6q5SSI3vNjTOv
   n4SYgMUUAObk3WXLT66dTDPLMW6zt7EI7zXYAtAUp7aX+9czZCHjQJNzS
   imsd2uwOG+WUE6TMnvcHft2JFd5IUWZr4BaPQrBTE5SRg5+bb6nu5/zor
   rAYOIMPxK0+gGjug9tlRqp+RbvKRcqikiZOR/4g8Ei5mHNrkC0BH1qpue
   iAzfzCzUzdaIn1RV6CobU6/2WMQsmLBvQTC7JIXFkDbE8yT+f9g5kXCfc
   cb8HRsJ6GGI0ZigAxs8hOPG6nngVp4v2l3BRl/Nc25FHSUm+BVS9by6rf
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] base.bbclass: Correct the test for obsolete license
 exceptions
Date: Sat, 25 Jun 2022 17:52:23 +0200
Message-ID: <20220625155225.26081-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jun 2022 15:52:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167296

The test for obsolete licenses used in INCOMPATIBLE_LICENSE_EXCEPTIONS
tried to match the "<package>:<license>" tuples with the obsolete
licenses and thus never matched anything.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 20968a5076..cc02de5f77 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -594,9 +594,9 @@ python () {
 
             for lic_exception in exceptions:
                 if ":" in lic_exception:
-                    lic_exception.split(":")[0]
+                    lic_exception = lic_exception.split(":")[1]
                 if lic_exception in oe.license.obsolete_license_list():
-                    bb.fatal("Invalid license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
+                    bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
 
             pkgs = d.getVar('PACKAGES').split()
             skipped_pkgs = {}

