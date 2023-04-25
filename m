Return-Path: <dev@loewen-email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D12BC77B71
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 09:15:47 +0000 (UTC)
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de [80.67.31.30])
 by mx.groups.io with SMTP id smtpd.web11.74670.1682414144729785577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 02:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: loewen-email.de, ip: 80.67.31.30, mailfrom: dev@loewen-email.de)
Received: from [195.1.58.114] (helo=localhost.localdomain)
	by smtprelay03.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <dev@loewen-email.de>)
	id 1prElx-0003xx-L7; Tue, 25 Apr 2023 11:15:41 +0200
From: dev@loewen-email.de
To: openembedded-core@lists.openembedded.org
Cc: Johannes Schrimpf <dev@loewen-email.de>
Subject: [PATCH] python3targetconfig.bbclass: Extend PYTHONPATH instead of overwriting
Date: Tue, 25 Apr 2023 11:15:32 +0200
Message-Id: <20230425091532.8086-1-dev@loewen-email.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: ZGV2QGxvZXdlbi1lbWFpbC5kZQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 09:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180375

From: Johannes Schrimpf <dev@loewen-email.de>

[YOCTO #15108] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15108

Since the latest change, the PYTHONPATH is overwritten instead of extended.
This leads to changed behavior and build errors of recipes where the PYTHONPATH
is set before setup_target_config is run.

Signed-off-by: Johannes Schrimpf <dev@loewen-email.de>
---
 meta/classes-recipe/python3targetconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 22305fe176..08bc619398 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,7 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
-        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata
+        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
 
-- 
2.37.1 (Apple Git-137.1)


