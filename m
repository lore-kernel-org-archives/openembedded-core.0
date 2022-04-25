Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B600DC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 21:35:51 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.36440.1650922541802084736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 14:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Es9GOvAn;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650922542;
  x=1682458542;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EZE/CngRGl0KNwHUtp+MhVOTNMr1+yjOHlYWhloZOJA=;
  b=Es9GOvAnvwXFLgu8v+guzzYQOFU5jWz4lDTaqov/fRqu0IGDlk4McdQq
   MnSChJjoMBp4Qfphq8OPULdjKkhBtFBzol7UmtuleZoif9sz9YYqfAySs
   wZ8yYHZ6iJyjQiMErNASeI7/2NIrpFrY7zYZabrmYq+0tDAVXIrLgqocS
   LCOAghVrSxV6vtylHuqRi1E9R1YyANxuZAeAmBmXn8yH263zAz3pPvNQv
   //na1x53Lupls0hEQfQKGunrdDc/QurplbGYeSpoNh9ze/eouNrrAoSH8
   MPKa6O9K8QQz5w5VAw/dhA16FHV+1x72duy2pSY70fc8YaIS9rJM1qY9v
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][kirkstone][PATCHv2] devshell.bbclass: Allow devshell &
 pydevshell to use the network
Date: Mon, 25 Apr 2022 23:35:37 +0200
Message-ID: <20220425213537.20344-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 21:35:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164844

Otherwise it will fail if using OE_TERMINAL = "xterm" with the not so
helpful error:

  xterm: Xt error: Can't open display: localhost:0.0

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Correct a typo in "do_pydevshell[network]".

 meta/classes/devshell.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 75604d0c07..247d04478c 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -23,6 +23,7 @@ addtask devshell after do_patch do_prepare_recipe_sysroot
 DEVSHELL_STARTDIR ?= "${S}"
 do_devshell[dirs] = "${DEVSHELL_STARTDIR}"
 do_devshell[nostamp] = "1"
+do_devshell[network] = "1"
 
 # devshell and fakeroot/pseudo need careful handling since only the final
 # command should run under fakeroot emulation, any X connection should
@@ -156,3 +157,4 @@ python do_pydevshell() {
 addtask pydevshell after do_patch
 
 do_pydevshell[nostamp] = "1"
+do_pydevshell[network] = "1"

