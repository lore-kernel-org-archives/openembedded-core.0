Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6599FC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:01 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8269.1787734910633679667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=IYyXmcpi;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=trfFxz7zoiM5IG5Sf6LAjQ5locxcQ11ADbE0Nfys5CQ=; b=IYyXmcpi27iQn8dNeWKdRPnI4v
	AnaxM4SQ/AShTY79tlK4PiB4KI33gbMnJG3QqutZYYJqbHla7Jqfjxux8tiy0iA36+F8gbZXdP3vR
	ll8qQKnSe+NsOsC+DBYAOdGi8oGbohgtdZnT8dYkvFnsVO/WLu3s57h/3HmDDw7hUvh9LVmdp86T+
	YtBveZoBwbCmXly0rMzciQncxqJBqsqlzfqz6ybJgvw7XkVU3q8xBHP/Yprajmko3MrJ3mt6h2gGS
	/kEkTxKuElK4HPdhlHryxz4EGchQ1BRhDJ5iC+hSFJTuFnzhXy8TutoQjyuBVJSTHrkweVIrPhuLT
	NN0pFG/w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wz9W0-000FaP-1k;
	Wed, 26 Aug 2026 11:01:48 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wz9W0-000PpH-11;
	Wed, 26 Aug 2026 11:01:48 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 2/2] sysvinit: rc: improve counting of progress steps
Date: Wed, 26 Aug 2026 11:00:40 +0200
Message-ID: <d3cf81007124c572c2010e785d421a0d2df9b619.1787734737.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1db75a3d2c4cb52e5e36c7095f601ac6f08c1f1d.1787734737.git.nora.schiffer@ew.tq-group.com>
References: <1db75a3d2c4cb52e5e36c7095f601ac6f08c1f1d.1787734737.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28104/Wed Aug 26 08:24:01 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244384

Fix a number of issues that caused more steps to be counted than calls
to startup_progress would happen in some situations, resulting in the
progress bar never reaching 100%:

- Use the same conditions when looping over initscripts for counting
  steps that are also used for running them
- When skipping a script, run startup_progress to avoid off-by-one

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index f1169ec3ac..d66a7cf1b0 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -116,8 +116,18 @@ then
 	esac
 
 	num_steps=0
-	for s in /etc/rc$runlevel.d/[SK]*; do
-		case "${s##/etc/rc$runlevel.d/S??}" in
+	if [ $previous != N ]
+	then
+		for i in /etc/rc$runlevel.d/K[0-9][0-9]*
+		do
+			[ ! -f $i ] && continue
+			num_steps=$(($num_steps + 1))
+		done
+	fi
+	for i in /etc/rc$runlevel.d/S*
+	do
+		[ ! -f $i ] && continue
+		case "${i##/etc/rc$runlevel.d/S??}" in
 			gdm|xdm|kdm|reboot|halt)
 				break
 				;;
@@ -158,7 +168,11 @@ then
 			# and _no_ stop script in this level, we don't
 			# have to re-start the service.
 			#
-			[ -f $previous_start ] && [ ! -f $stop ] && continue
+			if [ -f $previous_start ] && [ ! -f $stop ]
+			then
+				startup_progress
+				continue
+			fi
 		fi
 		if [ x"${PSPLASH_TEXT_UPDATES}" = x"yes" ]; then
 			psplash-write "MSG $(basename $i .sh | cut -c 4-)" || true
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


