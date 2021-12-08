Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACDAC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 17:02:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.16287.1638982953796287023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 09:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9D3D1042
	for <openembedded-core@lists.openembedded.org>;
 Wed,  8 Dec 2021 09:02:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 741D03F5A1
	for <openembedded-core@lists.openembedded.org>;
 Wed,  8 Dec 2021 09:02:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: check the qemu PID has been set before kill()ing it
Date: Wed,  8 Dec 2021 17:02:30 +0000
Message-Id: <20211208170230.3800425-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 17:02:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159362

If runqemu is killed, check that we have a valid PID for the qemu before
sending a kill() to it.

[ YOCTO #14651 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index efb98ab9e0f..410d2a9939b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1593,7 +1593,8 @@ def main():
=20
         def sigterm_handler(signum, frame):
             logger.info("SIGTERM received")
-            os.kill(config.qemupid, signal.SIGTERM)
+            if config.qemupid:
+                os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
             # Deliberately ignore the return code of 'tput smam'.
             subprocess.call(["tput", "smam"])
--=20
2.25.1


