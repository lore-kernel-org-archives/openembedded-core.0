Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FD6EF0704
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 11:50:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17879.1770724241967127661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 03:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MFxLFLvP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260210115038f76f230ae90002075b-kduegu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260210115038f76f230ae90002075b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 10 Feb 2026 12:50:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EHlyo5zQKx5JlvEmZutwos3Nb7SVuJGpSsH1B6zgFRM=;
 b=MFxLFLvPq3EGE50lIv9P38/HUnGAwNio1siklwiH727AQEJGqpmLGVfgXig1MENYBFeTvx
 8a4WuEwQvHNi91pVabDn+U6YbGzX+vzCYb9hD+A01s3YjAJmlcuisj2qBpEEC9qYJTEhewTv
 taM5xAdyhqxOujjperNvrRaZ8eLkmvYWNtXm1GjBdGF27k7eQO5yEvFS2rgVAdblpSGFD0uC
 efFurdg+ZaU8LeCilZwe1wgJiKCjWJzWlUZGQnR+tOMaaV6B+sOQe/eXGlFmXO4v8H6u/fw0
 buMQu0TRgU28ZHgtaOYxQ4Gymi+xD0ZDpbbV1anyQiNVK4SJNE9QnMJw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] busybox: adapt busybox-udhcpd init script to new start-stop-daemon path
Date: Tue, 10 Feb 2026 12:50:35 +0100
Message-Id: <20260210115035.670980-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 11:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230886

From: Peter Marko <peter.marko@siemens.com>

Commit 9998d91f982cd323fa5da20edda8b1828bd4fb5d moved start-stop-daemon
from /sbin to /usr/sbin.
Adapt busybox-udhcpd to this change.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/busybox/files/busybox-udhcpd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/files/busybox-udhcpd b/meta/recipes-core/busybox/files/busybox-udhcpd
index c43903e8dc..d35f8540d1 100755
--- a/meta/recipes-core/busybox/files/busybox-udhcpd
+++ b/meta/recipes-core/busybox/files/busybox-udhcpd
@@ -15,12 +15,12 @@ case "$1" in
 		echo "error: /etc/udhcpd.conf is missing."
 		exit 1
 	fi
-	/sbin/start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
+	/usr/sbin/start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
 	echo "done."
 	;;
     stop)
         echo -n "stopping $DESC: $NAME... "
-	/sbin/start-stop-daemon -K -n $NAME
+	/usr/sbin/start-stop-daemon -K -n $NAME
 	echo "done."
 	;;
     restart)

