Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FC7C77B7E
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 09:06:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.15000.1682672781859949598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 02:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mIQOheXC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 872036000B;
	Fri, 28 Apr 2023 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682672779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpuxAGhVekvx7g63dlF4ZSeOI8K6pwskwZ/Vt10myAg=;
	b=mIQOheXC7GT+JQqBEItFxR5fkrl9NEIwL9ER/MUYxKsc3Gt8XXjdTGs7+DcwnPRdNmmiOw
	bBF5tcDvs4zIViQBkwRLPi0Udvr+pDQoeItNNq1t81ComiGX16R9NfUnrrqmzHmekgt1K4
	KEIKr2pI7feH596uMc0TXumbHjj5pLc+YSxDuSdEMkkDJqcYIrSk5nnKZzHOlUOdylog4T
	cT0PQNgNBbNldvuZbAlfWRTuMSqi+GokqZQes9zBdBzV4SP4MMdme6S/+Jl2EHVtDlSl6K
	PwpbcK4QJ9YH41ZyM3jMPVn5X+ANJNVn96sbBFtiArG7E0VdTDbS78Q08SHBUw==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] init-manager-none.inc: have no init manager
Date: Fri, 28 Apr 2023 11:06:02 +0200
Message-Id: <20230428090602.82995-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <175A0DD84C89F64A.26969@lists.openembedded.org>
References: <175A0DD84C89F64A.26969@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 09:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180524

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes the issue that setting INIT_MANAGER to "none"
produces a system with sysvinit.

As the name suggests, this produces a system without
an init manager (no systemd, no sysvinit, no BusyBox init, no
/etc/inittab). There isn't any login manager either.
The kernel just starts /bin/sh in the console.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/distro/include/init-manager-none.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
index bbedf898f7..56d2b0f406 100644
--- a/meta/conf/distro/include/init-manager-none.inc
+++ b/meta/conf/distro/include/init-manager-none.inc
@@ -1,3 +1,4 @@
-VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
-VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-VIRTUAL-RUNTIME_login_manager ??= "busybox"
+DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
+VIRTUAL-RUNTIME_init_manager ??= ""
+VIRTUAL-RUNTIME_initscripts ??= ""
+VIRTUAL-RUNTIME_login_manager ??= ""
-- 
2.34.1


