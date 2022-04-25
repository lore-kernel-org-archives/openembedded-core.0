Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0CCC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 21:26:21 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.36149.1650921975428952131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 14:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=SXe0HKlT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650921975;
  x=1682457975;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uEoXepVEBY/jRFcr4TnNsJNrlrSEh6qa8273tkbOXa8=;
  b=SXe0HKlTNeV0pR0aH4kMwUmvB/XT+KUa4lnLH2RuZm4VDJ023Yx97Z6G
   2VCm4QLFH0BrZ2sPm7hQpOlpHOmkp1ibj/bgWzJoMuMQylfT4tBqFlUsw
   05QMsMkwGgqpApELjqhjJJuSK42ng7EKQdyvGPK4cwjOpBwMWhAxPkWNi
   9mGqKwWFAC9BgBVLts2+D4ZD6I6oq/y2F5t00OHPtiHdIhHb1mvFZjbKa
   JDMem7ShNdEF9O5idsFWSyik168LKud8jU6dH6wNnrr3zF+Pxn31rG+s4
   hGwDILHZlsZ+8PM5YM94AedNJVW9yab+YaQSYAk379DbpZhpNjuuTP6qa
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][kirkstone][PATCH] devshell.bbclass: Allow devshell &
 pydevshell to use the network
Date: Mon, 25 Apr 2022 23:26:11 +0200
Message-ID: <20220425212611.17594-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 21:26:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164843

Otherwise it will fail if using OE_TERMINAL = "xterm" with the not so
helpful error:

  xterm: Xt error: Can't open display: localhost:0.0

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/devshell.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 75604d0c07..f3cabe45e2 100644
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
+do_pydevshell[network = "1"

