Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0145C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:24:47 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.873.1675898686265148742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 15:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Ef2hLWZc;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1675898686;
  x=1707434686;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7cJUimcC9Uk7ZafGjvmSpM8KEMnBJ3mwtPiqGHldLU8=;
  b=Ef2hLWZcTGMkkzibGCwoOjRUqHjmoK6tZOB2Sc6zBMRsYr61sdtBpeUy
   MXyl8zCD7lFIKUr0PW66AUUWWQNNi6qr+Y2I6YtAocPFBI3zvFeGVEmZK
   UhO277LDt7Rb6n+/n1vk9Ql3RaSrL2fOdmGf8uVynh+LxKm1E6+4PA8Zy
   +aSI39i0PTDs/Mb37PjN+Ej6ttj055R4RPas4JhpFta2tr+gT4j5hjpxE
   s7Wb2fooNRjOKnoGr6LH7X9WpYOryGQ8wvpE5SJANxEabAR272P4HlPJu
   SSuTr2+8h4DOhsBl+XKH4Tvlmh7irfBms2EVSBui8z4zsiW19D8cT+2Ch
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] devshell.bbclass: Do not add scripts/git-intercept to PATH
Date: Thu, 9 Feb 2023 00:24:38 +0100
Message-ID: <20230208232438.642404-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 23:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176913

The use of scripts/git-intercept was introduced in commit 3266c327df
(install/devshell: Introduce git intercept script due to fakeroot
issues) and later reverted in commit af27c81eaf (scripts: Make git
intercept global).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/devshell.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-global/devshell.bbclass b/meta/classes-global/devshell.bbclass
index 03af56b7a2..4c23049cf0 100644
--- a/meta/classes-global/devshell.bbclass
+++ b/meta/classes-global/devshell.bbclass
@@ -8,8 +8,6 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
-PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
-
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")

