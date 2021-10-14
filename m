Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBFC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:33:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.572.1634229208216410128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C861211D4
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:33:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73DD73F66F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:33:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oe/utils: log exceptions in ThreadedWorker functions
Date: Thu, 14 Oct 2021 17:33:18 +0100
Message-Id: <20211014163319.1022835-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 16:33:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156962

If the function a ThreadedWorker is executing raises an exception, don't
use print() as that mostly disappears.  Instead, output it to the logger.

This is done using bb.mainlogger.debug directly instead of bb.debug() as
this allows us to pass the exception instance directly, which is then
incorporated into the log stream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 238af314d1..cf65639647 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -508,7 +508,8 @@ class ThreadedWorker(Thread):
             try:
                 func(self, *args, **kargs)
             except Exception as e:
-                print(e)
+                # Eat all exceptions
+                bb.mainlogger.debug("Worker task raised %s" % e, exc_inf=
o=3De)
             finally:
                 self.tasks.task_done()
=20
--=20
2.25.1


